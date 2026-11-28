# Stage 0 (a): dense re-scan of the best row of an enriched-class result (N).  A research worker of claude-b9ee.
# The bundle run of rows0.py finds the maximiser (sigma, nu, s) by a coarse grid and coordinate refinement.  Here the
# row is fixed and the class supremum is recomputed on a dense grid: s on 16 values (with the kink 11/2 of the radius
# table), sigma on 5 values around the maximiser, nu on 4 values, and with twice the atoms at the best point.
#   usage: verify_e.py RESULT.json OUT.json
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, s0core as C, oracles as O, enriched as En
r = json.load(open(sys.argv[1])); e1, eta, t, cls, p = r['e1'], r['eta'], r['t'], r['cls'], r['p']
a = r.get('arg_full') or r['arg']; kind, spec = cls.split(':', 1)
eng = C.Engine(e1, eta); kap = eng.kappa(p); rho = (lambda s: None) if spec == 'none' else O.rho_fn(spec)
E = En.Enriched(third=(kind == 'E3')); rv = np.sqrt(E.v); t0 = time.time()
SS = (0.0, 0.5, 1.0, 2.0, 3.0, 4.0, 5.0, 5.5, 6.0, 7.0, 9.0, 12.0, 16.0, 25.0, 30.0, 42.0)
sigs = sorted(set(round(max(a['sig'] + d, 0.02), 5) for d in (-0.08, -0.03, 0.0, 0.03, 0.08)))
nus = sorted(set([0.0, round(a['nu'], 5), 0.02, 0.06]))
best = (-9, None); grid = []
for nu in nus:
    for sg in sigs:
        f = eng.psi(p, sg * rv, nu)
        for s in SS:
            o = E.solve(f, s, rho(s))
            if o is None: continue
            v = eng.cconst(t, p) + o[0] - kap * sg * sg - nu * nu / eta; grid.append((sg, nu, s, v))
            if v > best[0]: best = (v, (sg, nu, s))
sg, nu, s = best[1]
r0 = En.atoms_default() ** 0.5; rf = np.unique(np.concatenate([r0, (r0[1:] + r0[:-1]) / 2]))
E2 = En.Enriched(third=(kind == 'E3'), atoms=rf ** 2)
o = E2.solve(eng.psi(p, sg * np.sqrt(E2.v), nu), s, rho(s))
vd = None if o is None else eng.cconst(t, p) + o[0] - kap * sg * sg - nu * nu / eta
out = dict(e1=e1, eta=eta, t=t, cls=cls, p=p, bundle_value=r['value'], dense_value=best[0], dense_at=best[1], dense_minus_bundle=best[0] - r['value'],
           double_atoms_value=vd, double_minus_default=None if vd is None else vd - best[0], nsolve=len(grid), secs=time.time() - t0,
           per_s=[(s_, max(v for (_, _, s2, v) in grid if s2 == s_)) for s_ in SS if any(s2 == s_ for (_, _, s2, _) in grid)])
json.dump(out, open(sys.argv[2], 'w'), indent=1)
print('%s t=%g %s: bundle %.7f dense %.7f at %s (diff %+.1e); double atoms %s' % (os.path.basename(sys.argv[1]), t, cls, r['value'], best[0], best[1], best[0] - r['value'], ('%.7f (%+.1e)' % (vd, vd - best[0])) if vd else 'fail'))
