#!/usr/bin/env python3
"""Supplemental matrix-only centre search; primary failures are never overwritten.

Try supplied multiplier seeds, exact Schur-complement cap shifts and scaled SDP
searches. Every accepted certificate is replayed by rational LDL. An exact
negative vector in the common constraint kernel proves that this exported
matrix cannot pass for any multipliers or cap increase; that is a statement
about this enclosure/check, not about the analytic node cap. Nothing changes
capPad, recipes, grids, cover data or Lean wiring.
"""
import argparse
import copy
from datetime import datetime, timezone
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_lmi
import caps_centre_repair as repair

DIM = 13
SCHEMA = 1


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def nullspace(rows, n):
    """Exact rational nullspace basis, represented as columns/vectors."""
    a = [[F(v) for v in row] for row in rows if any(row)]
    if any(len(row) != n for row in a):
        raise ValueError('Invalid kernel matrix dimension')
    pivots, r = [], 0
    for col in range(n):
        hit = next((i for i in range(r, len(a)) if a[i][col]), None)
        if hit is None:
            continue
        a[r], a[hit] = a[hit], a[r]
        p = a[r][col]
        a[r] = [x/p for x in a[r]]
        for i in range(len(a)):
            if i != r and a[i][col]:
                f = a[i][col]
                a[i] = [x-f*y for x, y in zip(a[i], a[r])]
        pivots.append(col); r += 1
        if r == len(a):
            break
    free = [i for i in range(n) if i not in pivots]
    out = []
    for col in free:
        v = [F(0)]*n; v[col] = F(1)
        for i, pivot in enumerate(pivots):
            v[pivot] = -a[i][col]
        out.append(v)
    return out


def quadratic(matrix, vector):
    return sum(vector[i]*matrix[i][j]*vector[j]
               for i in range(len(vector)) for j in range(len(vector)))


def check_obstruction(d, proof):
    try:
        v = list(map(F, proof['vector']))
        if len(v) != DIM or v[0] != 0 or not any(v):
            return False
        if quadratic(d['N'], v) >= 0:
            return False
        if any(quadratic(c[name], v) != 0 for c in d['cons'] for name in ('A', 'B')):
            return False
        return str(quadratic(d['N'], v)) == proof['negative_quadratic']
    except (ValueError, KeyError, TypeError):
        return False


def common_kernel_obstruction(d):
    """A negative vector immune to every S-lemma multiplier and cap shift."""
    import numpy as np
    rows = [row[1:] for c in d['cons'] for name in ('A', 'B') for row in c[name][1:]]
    basis = nullspace(rows, DIM-1)
    if not basis:
        return None
    vectors = [[F(0), *v] for v in basis]
    projected = [[sum(vectors[i][a]*d['N'][a][b]*vectors[j][b]
                      for a in range(DIM) for b in range(DIM))
                  for j in range(len(vectors))] for i in range(len(vectors))]
    candidates = list(vectors)
    eigenvalues, eigenvectors = np.linalg.eigh(np.array([[float(x) for x in r] for r in projected]))
    for idx in np.argsort(eigenvalues):
        if eigenvalues[idx] >= 0:
            continue
        for den in (10**6, 10**9, 10**12):
            coefficients = [F(float(x)).limit_denominator(den) for x in eigenvectors[:, idx]]
            candidates.append([sum(c*v[a] for c, v in zip(coefficients, vectors)) for a in range(DIM)])
    for v in candidates:
        q = quadratic(d['N'], v)
        if q < 0:
            proof = {'vector': list(map(str, v)), 'negative_quadratic': str(q),
                     'negative_quadratic_float': float(q), 'common_kernel_dimension': len(vectors),
                     'meaning': 'v[0]=0 and v^T A_c v=v^T B_c v=0 for every constraint, '
                                'but v^T N v<0. No cap shift or S-lemma multipliers can make this exported matrix PSD.'}
            if check_obstruction(d, proof):
                return proof
    return None


def admissible(d, lm):
    if len(lm) != len(d['cons']):
        return False
    return all(a >= 0 and b >= 0 and (c['hi'] is not None or a == 0)
               for c, (a, b) in zip(d['cons'], lm))


def schur_candidate(d, lm, margin=F(1, 10**18)):
    """Exact least cap shift for these fixed multipliers, when finite, plus margin."""
    lm = [(F(a), F(b)) for a, b in lm]
    if not admissible(d, lm) or margin < 0:
        return None
    K = caps_lmi.kmat(d['N'], d['cons'], lm)
    order = list(range(1, DIM))+[0]
    a = [[K[i][j] for j in order] for i in order]
    for k in range(DIM-1):
        p = a[k][k]
        if p < 0 or (p == 0 and any(a[i][k] != 0 for i in range(k+1, DIM))):
            return None
        if p:
            for i in range(k+1, DIM):
                f = a[i][k]/p
                if f:
                    for j in range(k+1, DIM):
                        a[i][j] -= f*a[k][j]
    need = max(F(0), -a[-1][-1])
    up = need+margin if need else F(0)
    result = {'status': 'fixed' if up == 0 else 'cap_up', 'cap_up': str(up),
              'lm': [[str(a), str(b)] for a, b in lm]}
    checked = repair.checked_solution(d, result)
    return checked


def scaling_vectors(N):
    import numpy as np
    diag = np.abs(np.diag(N)); scale = max(float(np.max(diag)), 1e-30)
    return [('diag_floor_1e-12', 1/np.sqrt(np.maximum(diag, scale*1e-12))),
            ('diag_floor_1e-8', 1/np.sqrt(np.maximum(diag, scale*1e-8))),
            ('row_norm', 1/np.sqrt(np.maximum(np.max(np.abs(N), axis=1), scale*1e-8))),
            ('uniform', np.full(DIM, 1/np.sqrt(scale)))]


def retry(d, seeds, *, max_solves=12, checkpoint=None):
    """Return a checked certificate or a checked obstruction, never a numerical claim."""
    repair.validate_export(d)
    attempts, best = [], None
    def record(method, candidate=None, **metadata):
        nonlocal best
        checked = repair.checked_solution(d, candidate) if candidate else None
        attempts.append(dict(method=method, exact_feasible=checked is not None,
                             cap_up=None if checked is None else checked['cap_up'], **metadata))
        if checked and (best is None or F(checked['cap_up']) < F(best['cap_up'])):
            best = dict(checked, method=method)
        if checkpoint:
            checkpoint(attempts, best)
    for name, raw_lm in seeds:
        lm = [(F(a), F(b)) for a, b in raw_lm]
        record(name+'_zero', {'status': 'fixed', 'cap_up': '0', 'lm': raw_lm})
        if best and F(best['cap_up']) == 0:
            return best, attempts, None
        candidate = schur_candidate(d, lm)
        record(name+'_exact_schur', candidate)
    obstruction = common_kernel_obstruction(d)
    if obstruction:
        return None, attempts, obstruction
    import numpy as np, cvxpy as cp
    N = np.array([[float(v) for v in row] for row in d['N']])
    A = [np.array([[float(v) for v in row] for row in c['A']]) for c in d['cons']]
    B = [np.array([[float(v) for v in row] for row in c['B']]) for c in d['cons']]
    nc = len(d['cons']); count = 0
    for scale_name, vector in scaling_vectors(N):
        for solver in ['CLARABEL', 'SCS']:
            if count >= max_solves:
                return best, attempts, None
            count += 1
            lam = cp.Variable(nc, nonneg=True); mu = cp.Variable(nc, nonneg=True); t = cp.Variable()
            K = N-sum(lam[c]*A[c]+mu[c]*B[c] for c in range(nc))
            S = np.diag(vector); scaled = S@K@S
            constraints = [(scaled+scaled.T)/2-t*np.eye(DIM) >> 0, t <= 1]
            constraints += [lam[c] == 0 for c in range(nc) if d['cons'][c]['hi'] is None]
            method = f'{solver}_{scale_name}'
            try:
                opts = ({'tol_gap_abs': 1e-11, 'tol_gap_rel': 1e-11, 'tol_feas': 1e-11, 'max_iter': 300}
                        if solver == 'CLARABEL' else {'eps': 1e-8, 'max_iters': 100000})
                problem = cp.Problem(cp.Maximize(t), constraints); problem.solve(solver=solver, **opts)
                if lam.value is None or mu.value is None:
                    record(method, error='No multiplier values', solver_status=problem.status); continue
                for den in (10**15, 10**20):
                    lm = [(F(0) if c['hi'] is None else max(F(0), F(float(lam.value[i])).limit_denominator(den)),
                           max(F(0), F(float(mu.value[i])).limit_denominator(den))) for i, c in enumerate(d['cons'])]
                    candidate = schur_candidate(d, lm)
                    record(method+f'_rational_{den}', candidate, t_opt=None if t.value is None else float(t.value),
                           solver_status=problem.status)
                    if best and F(best['cap_up']) == 0:
                        return best, attempts, None
            except Exception as error:
                record(method, error=f'{type(error).__name__}: {error}')
    return best, attempts, None


def load_export(path, identity):
    raw = [json.loads(s) for s in Path(path).read_text().splitlines() if s.strip()]
    rows = list(repair.load_exports(path))
    selected = [(r, d) for r, d in zip(raw, rows) if (d['k'], d['i'], d['j']) == identity]
    if len(selected) != 1:
        raise ValueError('Expected one selected exported piece')
    original, d = selected[0]
    for matrix in [original['N']]+[c[name] for c in original['cons'] for name in ('A', 'B')]:
        if any(type(v) not in (str, int) for row in matrix for v in row):
            raise ValueError('Matrix coefficients must be exact strings/integers')
    repair.validate_export(d)
    return d


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('export', type=Path); parser.add_argument('--piece', required=True)
    parser.add_argument('--primary', type=Path, required=True)
    parser.add_argument('--seed-solved', type=Path, action='append', default=[])
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--agent-id', required=True); parser.add_argument('--max-solves', type=int, default=12)
    args = parser.parse_args(argv)
    identity = tuple(map(int, args.piece.split(':')))
    d = load_export(args.export, identity)
    matches = [r for r in json.loads(args.primary.read_text())
               if (r['k'], r['i'], r['j'], r['grid']) == (*identity, d['grid'])]
    if len(matches) != 1:
        raise ValueError('Expected one primary result matching the export')
    primary = matches[0]; mathematical_provenance = copy.deepcopy(primary['provenance'])
    if (mathematical_provenance['export_sha256'] != digest(args.export)
            or F(mathematical_provenance['baseline_capPad']) != F(d['capPad'])
            or primary.get('grid_spec') != d.get('grid_spec')):
        raise ValueError('Primary mathematical provenance does not match export')
    pins = {'export': digest(args.export), 'primary': digest(args.primary),
            'retry_tool': digest(__file__), 'caps_lmi': digest(caps_lmi.__file__),
            'caps_centre_repair': digest(repair.__file__)}
    pins.update({str(p): digest(p) for p in args.seed_solved})
    retry_provenance = {'schema': SCHEMA, 'hashes': pins, 'max_solves': args.max_solves,
                        'policy': 'seed zero checks; exact Schur shifts; common-kernel obstruction; '
                                  'CLARABEL/SCS diagonal-floor,row-norm,uniform congruence scaling',
                        'agent_id': args.agent_id}
    if args.output.exists():
        saved = json.loads(args.output.read_text())
        if len(saved) != 1 or saved[0].get('retry_provenance') != retry_provenance:
            raise ValueError('Refusing to overwrite existing supplemental evidence with changed inputs')
        if saved[0].get('status') in ('fixed', 'cap_up'):
            assert repair.checked_solution(d, saved[0]) is not None
        elif saved[0].get('obstruction'):
            assert check_obstruction(d, saved[0]['obstruction'])
        print(json.dumps({'resumed': str(args.output), 'status': saved[0]['status']})); return
    seeds = [('stored_export_multipliers', [[str(c['lam']), str(c['mu'])] for c in d['cons']])]
    for path in args.seed_solved:
        for r in json.loads(path.read_text()):
            if (r['k'], r['i'], r['j']) == identity and r.get('lm'):
                seeds.append(('seed_'+path.stem, r['lm']))
    best, attempts, obstruction = retry(d, seeds, max_solves=args.max_solves)
    result = {k: d[k] for k in ['k', 'i', 'j', 'grid', 'encl', 'polyOK']}
    if 'grid_spec' in d:
        result['grid_spec'] = d['grid_spec']
    result.update(best or {'status': 'fail', 'cap_up': None, 'lm': None,
                          'method': 'exact_common_kernel_obstruction' if obstruction else 'retry_no_certificate'})
    result.update(provenance=mathematical_provenance, retry_provenance=retry_provenance,
                  attempts=attempts, obstruction=obstruction,
                  caution='Research matrix evidence, not Lean verification; no minimality claim.',
                  completed_at_utc=datetime.now(timezone.utc).isoformat())
    repair.atomic_json(args.output, [result])
    print(json.dumps({'output': str(args.output), 'status': result['status'],
                      'cap_up': result['cap_up'], 'method': result['method'],
                      'obstruction': bool(obstruction)}))


if __name__ == '__main__':
    main()
