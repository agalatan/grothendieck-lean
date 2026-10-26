"""EXACT replay of the mid-range node caps of cert-0745d (MIDCAPS.md).  Standard library only (int, fractions, math, json, multiprocessing).
No floating-point value enters any bound: floats are used only to CHOOSE the cell prices (exactint.ExactSetup.prices), which are then
fixed dyadic rationals; every integral is enclosed with exact integer / Fraction arithmetic (exactint.py) from the rational moment
enclosures (moments_full.py, re-checked by check_moments.py); the Loewner upper bound, the S-lemma matrix K, its LDL (positive pivots),
the quadratic q0 + q1 s + q2 s^2 and the comparison with the stored cap are exact.
usage:
  replay_midcaps_exact.py run   ROWDIR MOMDIR OUT.jsonl NPROC SHARD/NSHARDS file1.json ...   (computes the pieces of this shard)
  replay_midcaps_exact.py check ROWDIR MOMDIR "res*.jsonl" file1.json ...                     (coverage + caps; needs every piece)"""
import sys, os, json, time, glob
from fractions import Fraction as F
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
B2, B3 = (6, 7, 10), (8, 9, 11)
def pf(x):
    x = x.strip()
    if x.startswith('np.float64('): x = x[11:-1]
    return float(x)
def nn(x): return None if x in (None, 'None') else F(x)
def cons_of(nd, p):
    if 'cons' in p:                                                     # generic form (slices format): [[v], lo, hi|None, lam, mu]
        return [([F(x) for x in c[0]], F(c[1]), nn(c[2]), F(c[3]), F(c[4])) for c in p['cons']]
    if 'v' in nd:
        v = [F(x) for x in nd['v']]; return [(v, F(p['lo']), None if p['hi'] is None else F(p['hi']), F(p['lam']), F(p['mu']))]
    v2 = [F(x) for x in nd['v2']]; v3 = [F(x) for x in nd['v3']]
    if p['kind'] == 'box':
        return [(v2, F(p['box'][0][0]), F(p['box'][0][1]), F(p['mult'][0][0]), F(p['mult'][0][1])), (v3, F(p['box'][1][0]), F(p['box'][1][1]), F(p['mult'][1][0]), F(p['mult'][1][1]))]
    vd = v2 if p['dir'] == 2 else v3; return [(vd, F(p['lo']), None if p['hi'] is None else F(p['hi']), F(p['mult'][0][0]), F(p['mult'][0][1]))]
_S = {}
def setup(rowdir, momdir, t, nq):
    import exactint as X
    if (t, nq) not in _S: _S[(t, nq)] = X.ExactSetup(json.load(open(os.path.join(rowdir, f'row_{t}.json'))), json.load(open(os.path.join(momdir, f'moments_1600_{nq}.json'))))
    return _S[(t, nq)]
def job(args):
    import exactint as X
    rowdir, momdir, fn, ni, pi = args; D = json.load(open(fn)) if fn not in _D else _D[fn]; _D[fn] = D
    nd = D['nodes'][ni]; p = nd['pieces'][pi]; nq = p.get('nq', D.get('NQ')); S = setup(rowdir, momdir, D['t'], nq); t0 = time.time()
    PA, PB = S.prices([pf(x) for x in p['anchor']], [[pf(x) for x in f] for f in p['var']], float(F(p.get('scale', '1'))))
    C, h, H = S.integrate(PA, PB); Cu, hu, Hu, rho = X.upper(C, h, H)
    out = X.piece_quadratic_multi(S.Q, S.a, Cu, hu, Hu, cons_of(nd, p))
    return dict(file=os.path.basename(fn), node=ni, piece=pi, ok=out is not None, q=None if out is None else [str(x) for x in out[:3]],
                rho=float(rho), sec=round(time.time() - t0, 1))
_D = {}
def coverage_slices(nd):
    """tau0 = u.m slices (u in block 0) cover R; inside an 'odd' slice the boxes over I x I (I_0 = [-r, r]) and the far pieces per odd
    direction cover the (tau2, tau3) plane modulo S_c, S_- (which fix block 0, hence tau0); every piece carries its slice constraint."""
    pcs = nd['pieces']; u = [F(x) for x in nd['u']]; v2 = [F(x) for x in nd['v2']]; v3 = [F(x) for x in nd['v3']]; mu_ = [-x for x in u]
    assert all(u[i] == 0 for i in range(12) if i not in (0, 1, 2)) and any(u[i] for i in (0, 1, 2))
    assert all(v2[i] == 0 for i in range(12) if i not in B2) and any(v2[i] for i in B2) and all(v3[i] == 0 for i in range(12) if i not in B3) and any(v3[i] for i in B3)
    for p in pcs:
        for c in cons_of(nd, p): assert c[3] >= 0 and c[4] >= 0 and (c[2] is not None or c[3] == 0)
    sl = [(nn(x['slice'][0]), nn(x['slice'][1]), x) for x in nd['slices']]
    lows = [x for x in sl if x[0] is None]; highs = [x for x in sl if x[1] is None]; assert len(lows) == 1 and len(highs) == 1
    fin = sorted([x for x in sl if x[0] is not None and x[1] is not None], key=lambda a: a[0]); cur = lows[0][1]
    for lo, hi, _ in fin: assert lo <= cur, 'tau0 gap'; cur = max(cur, hi)
    assert highs[0][0] <= cur, 'tau0 gap at the top'
    def slice_con(lo, hi):
        if lo is None: return (mu_, -hi, None)
        if hi is None: return (u, lo, None)
        return (u, lo, hi)
    for lo, hi, rec in sl:
        key = [None if x in (None, 'None') else x for x in rec['slice']]; mine = [p for p in pcs if [None if p['slice'][0] in (None, 'None') else p['slice'][0], None if p['slice'][1] in (None, 'None') else p['slice'][1]] == key]
        sc = slice_con(lo, hi)
        for p in mine:
            c0 = cons_of(nd, p)[0]; assert (c0[0], c0[1], c0[2]) == sc, 'piece without its slice constraint'
        if rec['mode'] == 'single':
            assert len(mine) == 1 and mine[0]['kind'] == 'single' and len(mine[0]['cons']) == 1
        else:
            I = [(F(a), F(b)) for a, b in rec['intervals']]; T = F(rec['T']); assert I[0][0] == -I[0][1] < 0 and I[-1][1] == T
            for (a0, a1), (b0, b1) in zip(I[:-1], I[1:]): assert b0 <= a1
            # a box A x Bq is covered by a box3 piece whose constraints besides the slice are a SUBSET of {v2.m in A, v3.m in Bq}
            # (fewer constraints = larger region, so its bound is still valid on the box)
            bx = [[(tuple(c[0]), c[1], c[2]) for c in cons_of(nd, p)[1:]] for p in mine if p['kind'] == 'box3']
            for A in I:
                for Bq in I:
                    allowed = {(tuple(v2), A[0], A[1]), (tuple(v3), Bq[0], Bq[1])}
                    assert any(all(c in allowed for c in cs) for cs in bx), 'missing box'
            for d, vd in ((2, v2), (3, v3)):
                fi = sorted([(cons_of(nd, p)[1][1], cons_of(nd, p)[1][2]) for p in mine if p['kind'] == 'far3' and p['dir'] == d and cons_of(nd, p)[1][0] == vd], key=lambda a: a[0]); cur = T
                for a, b in fi: assert cur is not None and a <= cur; cur = b
                assert cur is None, 'far region not covered'
    return True
def coverage(nd):
    if nd.get('format') == 'slices': return coverage_slices(nd)
    pcs = nd['pieces']
    if 'v' in nd:
        v = [F(x) for x in nd['v']]; assert all(v[i] == 0 for i in range(12) if i not in B3) and any(v[i] for i in B3)
        cen = [p for p in pcs if p['kind'] == 'center']; assert len(cen) == 1 and F(cen[0]['lo']) == -F(cen[0]['hi']) < 0
        iv = sorted([(F(p['lo']), None if p['hi'] is None else F(p['hi'])) for p in pcs if p['kind'] != 'center'], key=lambda a: a[0]); cur = F(cen[0]['hi'])
        for lo, hi in iv: assert cur is not None and lo <= cur, 'gap'; cur = hi
        assert cur is None, 'tau-cover not unbounded'                    # [-r0, inf) covered; (-inf, r0] by the image under S_c (tau3 -> -tau3)
        for p in pcs: assert F(p['lam']) >= 0 and F(p['mu']) >= 0 and (p['hi'] is not None or F(p['lam']) == 0)
    else:
        v2 = [F(x) for x in nd['v2']]; v3 = [F(x) for x in nd['v3']]
        assert all(v2[i] == 0 for i in range(12) if i not in B2) and any(v2[i] for i in B2) and all(v3[i] == 0 for i in range(12) if i not in B3) and any(v3[i] for i in B3)
        boxes = [p for p in pcs if p['kind'] == 'box']; far = [p for p in pcs if p['kind'] == 'far']; assert len(boxes) + len(far) == len(pcs)
        ivs = sorted({(F(b['box'][0][0]), F(b['box'][0][1])) for b in boxes}); assert ivs == sorted({(F(b['box'][1][0]), F(b['box'][1][1])) for b in boxes})
        assert ivs[0][0] == -ivs[0][1] < 0
        for (a0, a1), (b0, b1) in zip(ivs[:-1], ivs[1:]): assert b0 <= a1
        have = {((F(b['box'][0][0]), F(b['box'][0][1])), (F(b['box'][1][0]), F(b['box'][1][1]))) for b in boxes}
        assert all((I, J) in have for I in ivs for J in ivs), 'missing box'   # [0, T]^2 covered; plane by S_-, S_c images
        Tb = ivs[-1][1]
        for d in (2, 3):
            fi = sorted([(F(p['lo']), None if p['hi'] is None else F(p['hi'])) for p in far if p['dir'] == d], key=lambda a: a[0]); cur = Tb
            for lo, hi in fi: assert cur is not None and lo <= cur; cur = hi
            assert cur is None
        for p in pcs:
            for m in p['mult']: assert F(m[0]) >= 0 and F(m[1]) >= 0
            if p['kind'] == 'far' and p['hi'] is None: assert F(p['mult'][0][0]) == 0
    return True
def main():
    mode = sys.argv[1]
    if mode == 'run':
        rowdir, momdir, outfn, nproc, shard = sys.argv[2:7]; files = sys.argv[7:]; k, n = map(int, shard.split('/'))
        done = set()
        if os.path.exists(outfn):
            for l in open(outfn): r = json.loads(l); done.add((r['file'], r['node'], r['piece']))
        jobs = []
        for fn in files:
            D = json.load(open(fn))
            for ni, nd in enumerate(D['nodes']):
                for pi, p in enumerate(nd['pieces']): jobs.append((rowdir, momdir, os.path.abspath(fn), ni, pi, p.get('nq', D.get('NQ'))))
        jobs.sort(key=lambda j: (-j[5], os.path.basename(j[2]), j[3], j[4])); jobs = [j[:5] for idx, j in enumerate(jobs) if idx % n == k and (os.path.basename(j[2]), j[3], j[4]) not in done]
        print(f"shard {k}/{n}: {len(jobs)} pieces to compute ({len(done)} already done)", flush=True); t0 = time.time()
        import multiprocessing as mp
        with mp.Pool(int(nproc)) as pool, open(outfn, 'a') as fo:
            for c, r in enumerate(pool.imap_unordered(job, jobs, chunksize=1)):
                fo.write(json.dumps(r) + '\n'); fo.flush()
                if c % 50 == 0: print(f"  {c+1}/{len(jobs)} pieces [{time.time()-t0:.0f}s]", flush=True)
        print(f"shard done [{time.time()-t0:.0f}s]")
    else:
        rowdir, momdir, pat = sys.argv[2:5]; files = sys.argv[5:]; res = {}
        for fn in glob.glob(pat):
            for l in open(fn): r = json.loads(l); res[(r['file'], r['node'], r['piece'])] = r
        allok = True; nn = 0; npc = 0; margins = []
        for fn in files:
            D = json.load(open(fn)); b = os.path.basename(fn)
            for ni, nd in enumerate(D['nodes']):
                s = F(nd['s']); cap = F(nd['cap']); coverage(nd); worst = None; bad = False
                for pi in range(len(nd['pieces'])):
                    r = res.get((b, ni, pi))
                    if r is None or not r['ok']: bad = True; print(f"  MISSING/FAIL {b} node {ni} piece {pi}"); continue
                    q = [F(x) for x in r['q']]; v = q[0] + q[1] * s + q[2] * s * s; worst = v if worst is None or v > worst else worst; npc += 1
                good = (not bad) and worst <= cap; allok &= good; nn += 1; margins.append(float(cap - worst) if worst is not None else None)
                print(f"t={D['t']} s={float(s):.4f}: {len(nd['pieces'])} pieces, exact max q = {float(worst):.13f}, cap {float(cap):.13f}, slack {float(cap-worst):.2e}: {'ok' if good else 'FAIL'}")
        print(f"{'MIDCAPS EXACT REPLAY PASS' if allok else 'MIDCAPS EXACT REPLAY FAIL'}: {nn} nodes, {npc} pieces, min slack {min(m for m in margins if m is not None):.2e}")
        sys.exit(0 if allok else 1)
if __name__ == "__main__": main()
