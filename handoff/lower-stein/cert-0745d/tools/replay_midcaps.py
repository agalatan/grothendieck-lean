"""Exact replay of the mid-range node caps (MIDCAPS.md).  Python 3 + numpy (float midpoint-radius enclosures, fullint.py) + fractions.
usage: replay_midcaps.py ROWDIR MOMDIR mc_file.json [...]
  ROWDIR: directory with row_<t>.json (theta, eps of the row; the certificate's row file);  MOMDIR: directory with moments_1600_<NQ>.json
  (regenerate them first with  moments_full.py 1600 256 ...  and the angular tables for 512/1024, or pass --regen to rebuild and compare).
For every node: (1) coverage of R^12 by the piece regions together with their images under the symmetries S_- (z -> -z) and S_c (z -> conj z)
(MIDCAPS.md section 3); (2) for every piece: prices recomputed from the recipe, outward integration, Loewner upper matrix, exact S-lemma
quadratic with exact LDL (K > 0); (3) max_piece q(s) <= stored cap.  Prints one line per node and 'MIDCAPS REPLAY PASS' at the end."""
import sys, os, json, numpy as np
from fractions import Fraction as F
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fullint import Setup, upper, piece_quadratic_multi
B2, B3 = (6, 7, 10), (8, 9, 11)
def pf(x):                                                          # float recipe values are stored as repr strings (possibly 'np.float64(<repr>)')
    x = x.strip()
    if x.startswith('np.float64('): x = x[11:-1]
    return float(x)
def supported(v, idx): return all(v[i] == 0 for i in range(12) if i not in idx) and any(v[i] != 0 for i in idx)
def main():
    rowdir, momdir, files = sys.argv[1], sys.argv[2], sys.argv[3:]; setups = {}; ok = True; nn = 0; npc = 0
    for fn in files:
        D = json.load(open(fn)); t = D['t']; row = json.load(open(os.path.join(rowdir, f'row_{t}.json')))
        def S(nq):
            if (t, nq) not in setups: setups[(t, nq)] = Setup(row, json.load(open(os.path.join(momdir, f'moments_1600_{nq}.json'))))
            return setups[(t, nq)]
        for nd in D['nodes']:
            s = F(nd['s']); pcs = nd['pieces']; cap = F(nd['cap'])
            # ---- (1) coverage ----
            if 'v' in nd:                                                  # one direction v (block 3): [-r0, r0], slabs, halfspace; mirror by S_c
                v = [F(x) for x in nd['v']]; assert supported(v, B3)
                cen = [p for p in pcs if p['kind'] == 'center']; assert len(cen) == 1 and F(cen[0]['lo']) == -F(cen[0]['hi']) > -1
                iv = sorted([(F(p['lo']), None if p['hi'] is None else F(p['hi'])) for p in pcs if p['kind'] != 'center'], key=lambda a: a[0])
                cur = F(cen[0]['hi'])
                for lo, hi in iv: assert lo <= cur, 'gap in the tau-cover'; cur = hi if hi is not None else None; 
                assert cur is None, 'tau-cover not unbounded'
                cons_of = lambda p: [(v, F(p['lo']), None if p['hi'] is None else F(p['hi']), F(p['lam']), F(p['mu']))]
            else:                                                          # two directions: boxes over intervals I x I, far pieces per direction; mirrors by S_-, S_c
                v2 = [F(x) for x in nd['v2']]; v3 = [F(x) for x in nd['v3']]; assert supported(v2, B2) and supported(v3, B3)
                boxes = [p for p in pcs if p['kind'] == 'box']; far = [p for p in pcs if p['kind'] == 'far']
                ivs = sorted({(F(b['box'][0][0]), F(b['box'][0][1])) for b in boxes}); assert ivs[0][0] == -ivs[0][1] < 0
                for (a0, a1), (b0, b1) in zip(ivs[:-1], ivs[1:]): assert b0 <= a1
                have = {((F(b['box'][0][0]), F(b['box'][0][1])), (F(b['box'][1][0]), F(b['box'][1][1]))) for b in boxes}
                assert all((I, J) in have for I in ivs for J in ivs), 'missing box'
                Tb = ivs[-1][1]
                for d in (2, 3):
                    fi = sorted([(F(p['lo']), None if p['hi'] is None else F(p['hi'])) for p in far if p['dir'] == d], key=lambda a: a[0]); cur = Tb
                    for lo, hi in fi: assert lo <= cur; cur = hi
                    assert cur is None
                def cons_of(p):
                    if p['kind'] == 'box':
                        return [(v2, F(p['box'][0][0]), F(p['box'][0][1]), F(p['mult'][0][0]), F(p['mult'][0][1])), (v3, F(p['box'][1][0]), F(p['box'][1][1]), F(p['mult'][1][0]), F(p['mult'][1][1]))]
                    vd = v2 if p['dir'] == 2 else v3; return [(vd, F(p['lo']), None if p['hi'] is None else F(p['hi']), F(p['mult'][0][0]), F(p['mult'][0][1]))]
            # ---- (2) pieces ----
            worst = None
            for p in pcs:
                nq = p.get('nq', D.get('NQ')); Sx = S(nq); y = np.array([pf(x) for x in p['anchor']]); var = [np.array([pf(x) for x in f]) for f in p['var']]
                pa, pb = Sx.prices(y, var, float(F(p.get('scale', '1')))); C, h, H = Sx.integrate(pa, pb); Cu, hu, Hu, rho = upper(C, h, H)
                out = piece_quadratic_multi(Sx.Q, Sx.a, Cu, hu, Hu, cons_of(p))
                if out is None: print(f"  FAIL t={t} s={s}: piece not positive definite"); ok = False; continue
                q = out[0] + out[1] * s + out[2] * s * s; worst = q if worst is None or q > worst else worst; npc += 1
                if 'q' in p:
                    qs = F(p['q'][0]) + F(p['q'][1]) * s + F(p['q'][2]) * s * s
                    if abs(q - qs) > F(1, 10 ** 13): print(f"  note t={t} s={s}: replayed piece value differs from stored by {float(q-qs):.1e}")
            good = worst is not None and worst <= cap; ok &= good; nn += 1
            print(f"t={t} s={float(s):.4f}: {len(pcs)} pieces, max q = {float(worst):.12f} <= cap {float(cap):.12f}: {'ok' if good else 'FAIL'}", flush=True)
    print(f"{'MIDCAPS REPLAY PASS' if ok else 'MIDCAPS REPLAY FAIL'}: {nn} nodes, {npc} pieces")
    sys.exit(0 if ok else 1)
if __name__ == "__main__": main()
