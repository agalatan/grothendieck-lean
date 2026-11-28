# Stage 0 (a): one (game, t, class) -> one JSON line.  N.
#   usage: rows0.py E1 ETA t CLASS [p0: l beta bA bB]        CLASS: phys | plain:<rho> | E0:<rho> | E2:<rho> | E3:<rho>   (rho: p/q, KOUL3, none)
#   env: S0_PHYS=phys.npz, S0_FIXP=1 (evaluate the given row only), S0_P0FROM=result.json (start row), S0_TOL, S0_ROUNDS
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, s0core as C, oracles as O
e1, eta, t = float(sys.argv[1]), float(sys.argv[2]), float(sys.argv[3]); cls = sys.argv[4]
p0 = [float(x) for x in sys.argv[5:9]] if len(sys.argv) >= 9 else [0.5 * t, 0.05 * t, -0.01 * t, -0.01 * t]
if len(sys.argv) < 9 and os.environ.get('S0_P0FROM') and os.path.exists(os.environ['S0_P0FROM']) and os.path.getsize(os.environ['S0_P0FROM']) > 0:
    p0 = json.load(open(os.environ['S0_P0FROM']))['p']          # start from the best row of another class (a start only)
eng = C.Engine(e1, eta); t0 = time.time()
log = lambda s: print(s, file=sys.stderr, flush=True)
if cls == 'phys':
    d = np.load(os.environ.get('S0_PHYS', os.path.join(os.path.dirname(os.path.abspath(__file__)), 'phys.npz')))
    laws = {k[:-2]: (d[k], d[k[:-2] + '_w']) for k in d.files if k.endswith('_r')}
    orc = O.make_phys_oracle(eng, laws)
elif cls.startswith('plain:'):
    orc = O.make_plain_oracle(eng, cls.split(':', 1)[1])
elif cls.split(':')[0] in ('E2', 'E3', 'E0'):
    # E0: the plain class through the conic code (control of the two oracles); E2: + first-order identities, cone, second moments; E3: + third order
    k = cls.split(':')[0]
    orc0 = O.make_enriched_oracle(eng, third=(k == 'E3'), rho_spec=cls.split(':', 1)[1], first=(k != 'E0'))
    orc = orc0
else: raise SystemExit('unknown class')
if os.environ.get('S0_FIXP') == '1' or t == 0:
    # at t = 0 the zero row is evaluated (as the record does) and also optimised below unless S0_FIXP=1
    G, arg, scs = orc(np.array(p0 if os.environ.get('S0_FIXP') == '1' else [0.0, 0.0, 0.0, 0.0]))
    rec0 = dict(value=eng.cconst(t, p0 if os.environ.get('S0_FIXP') == '1' else [0, 0, 0, 0]) + G, arg=arg)
else: rec0 = None
if os.environ.get('S0_FIXP') == '1':
    out = dict(value=rec0['value'], p=p0, arg=rec0['arg'], lower=None, gap=None)
else:
    r = C.bundle(eng, t, orc, p0 if t > 0 else [0.0, 0.0, 0.0, 0.0], log=log, tol=float(os.environ.get('S0_TOL', 2e-6)), rounds=int(os.environ.get('S0_ROUNDS', 30)))
    out = dict(value=r['value'], p=r['p'], arg=r['arg'], lower=r['lower'], gap=r['gap'], rounds=len(r['hist']), pool=len(r['pool']))
    if cls.split(':')[0] in ('E2', 'E3', 'E0'):
        # the reported value of the best row: a fresh oracle with the full global scan
        k = cls.split(':')[0]
        G, arg, _ = O.make_enriched_oracle(eng, third=(k == 'E3'), rho_spec=cls.split(':', 1)[1], first=(k != 'E0'))(np.array(r['p']), full=True)
        out['value_bundle'] = out['value']; out['value'] = max(out['value'], eng.cconst(t, r['p']) + G); out['arg_full'] = arg; out['gap'] = out['value'] - out['lower']
    if rec0: out['zero_row'] = rec0
out.update(e1=e1, eta=eta, t=t, cls=cls, secs=time.time() - t0)
print(json.dumps(out), flush=True)
