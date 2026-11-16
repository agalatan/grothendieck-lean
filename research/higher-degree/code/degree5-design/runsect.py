import sys, os, json, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sectors as S
out = []
for path in sys.argv[1:]:
    for rec in json.load(open(path)):
        if rec['driver'] > rec['row'] + 1e-9: continue
        t0 = time.time(); o = S.analyse(rec, nU=32); o['row'] = rec['row']
        out.append(o)
        fo = o['first_order']
        print('t=%.3f sig=%.4f | group ratios %s | companions %.3f | elem diag rz %.3f rA %.3f rB %.3f nu3 %.3f p00 %.3f | elem h-block %.3f k-block %.3f | Var: %s | allow_k_triv %.2e (%.0fs)' % (
            o['t'], o['sig'], ' '.join('%s:%.3f' % (k.split(' ')[0], v) for k, v in o['group_ratio'].items()), o['companions_ratio'] or -1,
            o['elem']['diag']['rz'], o['elem']['diag']['rA'], o['elem']['diag']['rB'], o['elem']['diag']['nu3'], o['elem']['diag']['p00'],
            o['elem']['hside'], o['elem']['kside'],
            ' '.join('%s %.2e' % (k, fo[k]['var']) for k in ('rA', 'rB', 'p10', 'p01', 'p21', 'p12', 'p30')), o['allow_k_trivial_AB_if_curv_ok'], time.time() - t0), flush=True)
json.dump(out, open(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'out', 'sectors_%d.json' % int(time.time())), 'w'), indent=1)
