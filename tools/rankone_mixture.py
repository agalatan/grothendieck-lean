#!/usr/bin/env python3
"""Exact common-row rank-one transport with a canonical admissible direction.

Only candidate selection uses floating point. The final quadratic, its test,
matrix conditions and all identities are recomputed with exact fractions.
Gaussian anchor majorants are inherited inputs unless independently replayed.
No whole-cover lower endpoint is asserted.
"""
import argparse
from fractions import Fraction as F
import hashlib
import itertools
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from rankone_analytic_transport import dot, mv, inv, add, majorant, psd, qeval, old_cap, ceil_grid


def matrix(theta):
    return [[theta[0], theta[1], theta[2]],
            [theta[1], theta[3], theta[4]],
            [theta[2], theta[4], theta[5]]]


def scalar_evaluation(q, b0, b1, alpha, r, f):
    return qeval(q, r)-2*(b0+b1*r)*f+alpha*f*f


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact assertions are required')
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
    ap.add_argument('--weights', default='{"12":"133952501/1000000000","15":"866047499/1000000000"}')
    ap.add_argument('--r', default='3/20')
    ap.add_argument('--out', type=Path)
    args = ap.parse_args()
    repo, r = args.repo, F(args.r)
    weights = {int(i): F(w) for i, w in json.loads(args.weights).items()}
    assert weights and all(w > 0 for w in weights.values()) and sum(weights.values()) == 1
    assert len(weights) <= 2, 'bounded discovery batch: one or two source rows'
    names = {12: '0.84', 13: '0.845', 14: '0.85', 15: '0.855'}
    eps = F(149, 200)
    source_rows = json.loads((repo/'outputs/binding-audit-20261023/row-profiles.json').read_text())
    rows, geometries = {}, {}
    for i in weights:
        row = json.loads((repo/f'handoff/lower-stein/cert-0745e/row_{names[i]}.json').read_text())
        theta = list(map(F, row['theta']))
        assert theta == list(map(F, source_rows[i]['theta'])) and F(row['eps']) == eps
        E = matrix(theta)
        A = [theta[9]*((F(1) if j == 0 else F(0))+theta[10+j]) for j in range(3)]
        rows[i], geometries[i] = row, (theta, E, A)
    E = [[sum(weights[i]*geometries[i][1][j][k] for i in weights)
          for k in range(3)] for j in range(3)]
    A = [sum(weights[i]*geometries[i][2][j] for i in weights) for j in range(3)]
    Ei = inv(E)
    psd(E)
    # A canonical direction works for every old admissible gate, with no
    # numerical cone search or per-mixture eigenvector.
    w = [Ei[i][0]+F(i == 0) for i in range(3)]
    v, d = mv(E, w), dot(w, mv(E, w))
    S = [[E[i][j]-(F(-1) if i == 0 else eps) if i == j else E[i][j]
          for j in range(3)] for i in range(3)]
    psd(S)
    delta = sum(weights[i]*geometries[i][0][9] for i in weights)
    N = [[E[i][j]-(eps-delta if i == j == 0 else 0)
          for j in range(3)] for i in range(3)]
    psd(N)
    assert v == [S[i][0] for i in range(3)]
    residual = 1+Ei[0][0]
    assert residual > 0 and d-S[0][0] == residual
    # Check all coefficients of the block-square identity (not sampled PSD).
    block = [S[i]+[-v[i]] for i in range(3)]+[[-a for a in v]+[d]]
    transform = [[F(i == j) for j in range(4)] for i in range(4)]
    transform[0][3] = -1
    diag = [row+[F(0)] for row in S]+[[F(0)]*3+[residual]]
    exact = [[sum(transform[k][i]*diag[k][ell]*transform[ell][j]
                  for k in range(4) for ell in range(4))
              for j in range(4)] for i in range(4)]
    assert exact == block
    C = [row[1:] for row in E[1:]]
    h = [E[j][0]+A[j] for j in (1, 2)]
    c = v[0]-dot(h, mv(inv(C), v[1:]))
    assert d > 0

    # Jbar(Mbar*y+bbar) <= sum wi Ji(Mi*y+bi), then sup over the same y.
    # For each source anchor retain its dependence on the SAME scalar f.
    banks = {}
    for i in weights:
        theta, Er, Ar = geometries[i]
        vr = mv(Er, w)
        records = []
        for path in sorted((repo/'handoff/lower-stein/cert-0745e/bundles').glob(f'new?_proof_{names[i]}_*.json')):
            bundle = json.loads(path.read_text())
            assert list(map(F, bundle['source_row']['theta'])) == theta
            for j, result in enumerate(bundle['results']):
                q0, linear, K, pivot = majorant(result, theta, eps)
                q = [q0, 2*dot(linear, Ar), dot(Ar, mv(K, Ar))]
                b0 = dot(linear, vr)
                b1 = dot(Ar, mv(K, vr))
                af = dot(vr, mv(K, vr))
                records.append(dict(q=q, b0=b0, b1=b1, af=af,
                    bundle=str(path.relative_to(repo)), index=j,
                    sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                    minimum_LDL_pivot=str(pivot)))
        assert records
        banks[i] = records

    # Enumerate the small pair of finite anchor banks in floating point only
    # to select a valid candidate. No global optimum claim depends on this.
    ids = list(weights)
    best = None
    for choice in itertools.product(*(range(len(banks[i])) for i in ids)):
        recs = [banks[i][k] for i, k in zip(ids, choice)]
        b0 = sum(float(weights[i]*rec['b0']) for i, rec in zip(ids, recs))
        b1 = sum(float(weights[i]*rec['b1']) for i, rec in zip(ids, recs))-float(c)
        alpha = float(d)+sum(float(weights[i]*rec['af']) for i, rec in zip(ids, recs))
        if alpha <= 0:
            continue
        q = sum(float(weights[i])*float(qeval(rec['q'], r)) for i, rec in zip(ids, recs))
        score = q-(b0+b1*float(r))**2/alpha
        if best is None or score < best[0]:
            best = score, choice
    assert best is not None
    selected = [banks[i][k] for i, k in zip(ids, best[1])]
    q = [sum(weights[i]*rec['q'][k] for i, rec in zip(ids, selected)) for k in range(3)]
    b0 = sum(weights[i]*rec['b0'] for i, rec in zip(ids, selected))
    b1 = sum(weights[i]*rec['b1'] for i, rec in zip(ids, selected))-c
    alpha = d+sum(weights[i]*rec['af'] for i, rec in zip(ids, selected))
    assert alpha > 0
    f = [(b0/alpha), (b1/alpha)]
    capq = [q[0]-b0*b0/alpha, q[1]-2*b0*b1/alpha, q[2]-b1*b1/alpha]
    for rr, ff in itertools.product([F(-1), F(0), F(3, 20), F(1)], [F(-2), F(0), F(1, 3)]):
        assert scalar_evaluation(q, b0, b1, alpha, rr, ff) == qeval(capq, rr)+alpha*(ff-f[0]-f[1]*rr)**2
    old = sum(weights[i]*old_cap(rows[i], r) for i in ids)
    cap = ceil_grid(qeval(capq, r))
    result = dict(version='rankone-common-mixture-v1', scope=__doc__,
        weights={str(i): str(weights[i]) for i in ids}, physical_r=str(r),
        canonical_w=list(map(str, w)), exact_L10_residual=str(residual),
        common_c=str(c), common_d=str(d), semiconvex_coefficient=str(c*c/d),
        scalar_profile_affine=list(map(str, f)), shifted_quadratic=list(map(str, capq)),
        cap=str(cap), cap_decimal=float(cap), old_effective_cap=str(old),
        saving=str(old-cap), saving_decimal=float(old-cap),
        Gaussian_majorant_dependency='selected archived majorants; full source replays separate',
        selected=[{k: rec[k] for k in ['bundle','index','sha256','minimum_LDL_pivot']}
                  for rec in selected])
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({k: result[k] for k in ['weights','physical_r','cap_decimal','saving_decimal','selected']}, indent=2))


if __name__ == '__main__':
    main()
