#!/usr/bin/env python3
"""Generate the selected weighted-HS scalar parameter gates from pinned inputs.

The exact Fraction receipt is an independent replay, not a Lean proof receipt.
No full Hilbert-Schmidt norm or Gaussian integral is evaluated or assumed.
Agent-ID: codex-2ca4.
"""
import argparse
from fractions import Fraction as F
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data/original-hs-parameters"
LEAN = ROOT / "Grothe/UpperChaos/OriginalHSParameterGates.lean"
RECEIPT = ROOT / "handoff/codex-2ca4-gaussian-mass/exact-parameter-replay.json"

def digest(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()

def matmul(A, B):
    return [[sum((x*y for x, y in zip(row, col)), F(0)) for col in zip(*B)] for row in A]

def det(A):
    A = [r[:] for r in A]
    z = F(1)
    for i in range(len(A)):
        j = next((j for j in range(i, len(A)) if A[j][i]), None)
        if j is None:
            return F(0)
        if j != i:
            A[i], A[j] = A[j], A[i]
            z = -z
        x = A[i][i]
        z *= x
        for j in range(i+1, len(A)):
            q = A[j][i]/x
            for k in range(i+1, len(A)):
                A[j][k] -= q*A[i][k]
    return z

def inv(A):
    n = len(A)
    A = [r[:] + [F(i == j) for j in range(n)] for i, r in enumerate(A)]
    for i in range(n):
        j = next(j for j in range(i, n) if A[j][i])
        A[i], A[j] = A[j], A[i]
        q = A[i][i]
        A[i] = [x/q for x in A[i]]
        for j in range(n):
            if j != i:
                q = A[j][i]
                A[j] = [x-q*y for x, y in zip(A[j], A[i])]
    return [r[n:] for r in A]

def rational_cov(alpha, R, P, Q):
    n = 1/(1+alpha)
    a = alpha*n
    d = 1-a*a*(R*R+P*Q)-n*n*R*(P+Q)+(a*a-n*n)**2*R*R*P*Q
    lam = n*(1-a*(R*R+P*Q)+(a-n)*R*R*P*Q)/d
    cp = n*n*(R+Q-R*Q*(R+P))/d
    cm = n*n*(R+P-R*P*(R+Q))/d
    base = n*n/d
    return lam, cp, cm, base

def audit_cov(alpha, R, P, Q):
    n = 1/(1+alpha)
    a = alpha*n
    S = [R,R,P,Q]
    C = [[0,-a,n,0],[-a,0,0,n],[n,0,0,-a],[0,n,-a,0]]
    # N = D^-1 M D = C diag(R,R,P,Q), with D positive diagonal.
    N = [[F(C[i][j])*S[j] for j in range(4)] for i in range(4)]
    I = [[F(i == j) for j in range(4)] for i in range(4)]
    NN = matmul(N, N)
    K = inv([[I[i][j]-NN[i][j] for j in range(4)] for i in range(4)])
    all_minors = []
    for sign in (-1,1):
        B = [[I[i][j]+sign*N[i][j] for j in range(4)] for i in range(4)]
        ds = [det([r[:k] for r in B[:k]]) for k in range(1,5)]
        assert all(x > 0 for x in ds)
        all_minors.append(ds)
    d = all_minors[0][-1]
    assert all_minors[1][-1] == d
    assert det([[I[i][j]-NN[i][j] for j in range(4)] for i in range(4)]) == d*d
    ez, eb = [1,0,0,1], [0,1,1,0]
    def bilinear(A, x, y):
        return sum((F(x[i])*S[i]*A[i][j]*y[j] for i in range(4) for j in range(4)),F(0))
    direct = (n+n*n*bilinear(matmul(N,K),ez,eb), n*n*bilinear(K,ez,ez),
              n*n*bilinear(K,eb,eb), n*n/d)
    closed = rational_cov(alpha,R,P,Q)
    assert direct == closed
    assert closed[1] > 0 and closed[2] > 0 and closed[3] > 0
    return {'minors': [[str(x) for x in row] for row in all_minors],
            'lambda': str(closed[0]), 'chi_plus': str(closed[1]),
            'chi_minus': str(closed[2]), 'base': str(closed[3])}

def lean_rat(q):
    q = F(q)
    return str(q.numerator) if q.denominator == 1 else f'({q.numerator} / {q.denominator})'


def render():
    manifest_path = DATA / 'manifest.json'
    manifest = json.loads(manifest_path.read_text())
    assert manifest['schema'] == 2
    assert manifest['coordinate_order'] == ['p_z', 'q_z', 'p_w', 'q_w']
    assert manifest['cutoffs'] == [500, 500, 251, 250]
    assert [item['power'] for item in manifest['inputs']] == [1, 2, 3]
    rows, receipts, hashes = [], [], {}
    selected = {int(k): v for k, v in manifest['selected_degrees'].items()}
    assert selected == {1: [51, 101, 151, 161, 171, 181],
                        2: [51, 71, 81, 91], 3: [11, 21, 31, 51]}
    rectangular = manifest['rectangular_input']
    path = DATA / rectangular['file']
    assert path.resolve().parent == (DATA / 'inputs').resolve()
    assert digest(path) == rectangular['sha256']
    original = json.loads(path.read_text())
    assert original['source_sha256'] == manifest['phase_source_sha256']
    assert rectangular['selected_degrees'] == [51, 101]
    hashes[rectangular['file']] = digest(path)
    for band in original['bands']:
        if band['D'] not in rectangular['selected_degrees']:
            continue
        assert [r['coordinate'] for r in band['parts']] == [0, 1, 2, 3]
        for part in band['parts']:
            row = {'power': 1, 'D': band['D'],
                   **{k: part[k] for k in ('coordinate', 'cut', 'R', 'T', 'upper_rational')}}
            coordinate = row['coordinate']
            assert row['cut'] == manifest['cutoffs'][coordinate]
            R, T = F(row['R']), F(row['T'])
            assert 0 < R < 1 < T
            weights = [F(1)] * 4
            weights[coordinate] = T
            receipts.append({'source': rectangular['file'], 'index': len(rows), 'row': row,
                             'z': audit_cov(F(21, 20), R, *weights[:2]),
                             'w': audit_cov(F(21, 20), R, *weights[2:])})
            rows.append(row)
    for item in manifest['inputs']:
        power = item['power']
        path = DATA / item['file']
        assert path.resolve().parent == (DATA / 'inputs').resolve()
        assert digest(path) == item['sha256']
        data = json.loads(path.read_text())
        assert data['source_sha256'] == manifest['phase_source_sha256']
        assert data['decomposition_sha256'] == item['decomposition_sha256']
        assert F(item['epsilon']) == F(21 * power, 20)
        assert F(item['lambda_scale']) == 1 + F(21 * power, 10)
        assert len(data['bounds']) == item['rows'] == [16, 20, 16][power - 1]
        hashes[item['file']] = digest(path)
        for original_row in data['bounds']:
            if original_row['D'] not in selected[power]:
                continue
            row = {key: original_row[key] for key in
                   ('power', 'D', 'coordinate', 'cut', 'R', 'T', 'upper_rational')}
            coordinate = row['coordinate']
            assert row['power'] == power and 0 <= coordinate < 4
            assert row['cut'] == manifest['cutoffs'][coordinate]
            R, T = F(row['R']), F(row['T'])
            assert 0 < R < 1 < T and F(row['upper_rational']) > 0
            weights = [F(1)] * 4
            weights[coordinate] = T
            receipts.append({
                'source': item['file'], 'index': len(rows), 'row': row,
                'z': audit_cov(F(21 * power, 20), R, weights[0], weights[1]),
                'w': audit_cov(F(21 * power, 20), R, weights[2], weights[3]),
            })
            rows.append(row)
    assert len(rows) == 56
    assert {(r['power'], r['D'], r['coordinate']) for r in rows} == {
        (power, degree, coordinate) for power, degrees in selected.items()
        for degree in degrees for coordinate in range(4)}
    lean = '''import Mathlib.Algebra.Order.Field.Rat

/-!
# Original weighted Gaussian multiplier parameters

One rational parameter choice is recorded for each selected output degree and
coordinate exclusion. The scalar checks establish covariance positivity for
both physical coordinate pairs. No Gaussian integral, Hilbert-Schmidt tail cap,
or captured-band error follows from these finite checks alone.

Generated by `tools/gen_original_hs_parameters.py` from the pinned inputs in
`data/original-hs-parameters`. Agent-ID: codex-2ca4.
-/

namespace Grothe.UpperChaos.OriginalHSParameterGates

/-- One original output cutoff and single-coordinate input exclusion. -/
structure Gate where
  power : ℕ
  degree : ℕ
  coordinate : ℕ
  cutoff : ℕ
  r : ℚ
  t : ℚ

/-- Positive leading-minor expressions and positive covariance numerators. -/
def covarianceGate (power : ℕ) (R P Q : ℚ) : Bool :=
  let alpha : ℚ := 21 * (power : ℚ) / 20
  let n := 1 / (1 + alpha)
  let a := alpha * n
  let d := 1 - a ^ 2 * (R ^ 2 + P * Q) - n ^ 2 * R * (P + Q) +
    (a ^ 2 - n ^ 2) ^ 2 * R ^ 2 * P * Q
  decide (0 < 1 - a ^ 2 * R ^ 2 ∧ 0 < 1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P ∧
    0 < d ∧ 0 < R + Q - R * Q * (R + P) ∧ 0 < R + P - R * P * (R + Q))

/-- The original rectangle uses coordinate cutoffs 500, 500, 251, 250. -/
def gateOK (g : Gate) : Bool :=
  decide (0 < g.r ∧ g.r < 1 ∧ 1 < g.t ∧ 1 ≤ g.power ∧ g.power ≤ 3 ∧
    g.coordinate < 4 ∧
    g.cutoff = (if g.coordinate < 2 then 500 else if g.coordinate = 2 then 251 else 250)) &&
  covarianceGate g.power g.r (if g.coordinate = 0 then g.t else 1)
    (if g.coordinate = 1 then g.t else 1) &&
  covarianceGate g.power g.r (if g.coordinate = 2 then g.t else 1)
    (if g.coordinate = 3 then g.t else 1)

'''
    for i, row in enumerate(rows):
        lean += (f'def gate{i:02d} : Gate := ⟨{row["power"]}, {row["D"]}, '
                 f'{row["coordinate"]}, {row["cut"]}, '
                 f'{lean_rat(row["R"])}, {lean_rat(row["T"])}⟩\n')
        lean += f'theorem gate{i:02d}_checked : gateOK gate{i:02d} = true := by decide +kernel\n\n'
    lean += '/-- The selected finite bands and all four coordinate exclusions. -/\n'
    lean += 'def gates : List Gate := [\n'
    for i in range(0, len(rows), 8):
        lean += '  ' + ', '.join(f'gate{j:02d}' for j in range(i, min(i + 8, len(rows))))
        lean += ',\n' if i + 8 < len(rows) else ']\n\n'
    lean += '/-- Every selected parameter gate satisfies the exact scalar checks. -/\n'
    lean += 'theorem parameters_checked : gates.all gateOK = true := by\n'
    lean += '  simp only [gates, List.all_cons, List.all_nil,\n'
    for i in range(0, len(rows), 4):
        lean += '    ' + ', '.join(f'gate{j:02d}_checked' for j in range(i, min(i + 4, len(rows)))) + ',\n'
    lean += '    Bool.true_and]\n\n'
    lean += '/-- Membership in the selected family supplies its checked parameter predicate. -/\n'
    lean += 'theorem gate_checked_of_mem (g : Gate) (hg : g ∈ gates) : gateOK g = true :=\n'
    lean += '  (List.all_eq_true.mp parameters_checked) g hg\n\n'
    lean += 'end Grothe.UpperChaos.OriginalHSParameterGates\n'
    receipt = {
        'schema': 1, 'agent_id': 'codex-2ca4',
        'status': 'EXACT_FRACTION_REPLAY',
        'scope': '56 selected parameter gates and 112 rational covariance identities; diagnostic only, not a Lean verification receipt or HS cap',
        'manifest_sha256': digest(manifest_path), 'input_sha256': hashes,
        'gate_count': len(rows), 'covariance_count': 2 * len(rows),
        'rows': receipts,
        'generated_lean_sha256': hashlib.sha256(lean.encode()).hexdigest(),
    }
    return {LEAN: lean, RECEIPT: json.dumps(receipt, indent=2) + '\n'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='compare outputs without modifying files')
    args = parser.parse_args()
    outputs = render()
    if args.check:
        stale = [str(path.relative_to(ROOT)) for path, content in outputs.items()
                 if path == LEAN and (not path.exists() or path.read_text() != content)]
        if stale:
            raise SystemExit('generated output mismatch: ' + ', '.join(stale))
        print('PASS: pinned inputs, 56 exact parameter gates, 112 covariance replays, deterministic outputs')
    else:
        for path, content in outputs.items():
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
        print('Generated the selected parameter table and ignored diagnostic replay')


if __name__ == '__main__':
    main()
