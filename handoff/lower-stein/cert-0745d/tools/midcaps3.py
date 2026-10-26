"""Mid-range node caps for s >= 0.4: slices in the even direction tau0 = u.m (u in block 0; no symmetry), and in each slice either ONE piece
(odd-sector variance prices, concave in the odd directions) or the two-direction odd partition of midcaps2 (boxes over I x I up to T, far
pieces per odd direction), every piece carrying the tau0-slice constraint in addition.  The two tau0 ends are halfspaces.
Coverage: the tau0 slices cover R; inside a slice the odd pieces with their images under S_c, S_- cover the (tau2, tau3) plane (Lemma 2: the
symmetries fix block 0, hence tau0).  Pieces are certified exactly as in midcaps2 (piece_quadratic_multi).  PROPOSAL in float.
usage: midcaps3.py t out.json s1 s2 ...      env TOL (default 2e-5): a slice uses the single piece when its bound <= Psi_float + TOL."""
import json, sys, os, time, numpy as np
from fractions import Fraction as F
from math import ceil
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import midcaps2 as M2
from midcaps2 import rat
A0 = F(6, 1000); OFFS = [F(6, 1000) * 2 ** k for k in range(8)]            # slice half-width 0.006, offsets up to 0.768
OI = [(-F(6, 1000), F(6, 1000))] + [(F(6, 1000) * 2 ** k, F(6, 1000) * 2 ** (k + 1)) for k in range(4)]; T = OI[-1][1]   # odd intervals up to 0.096
TOL = float(os.environ.get('TOL', '2e-5'))
class Row(M2.Row):
    def node3(s, sv, log=print):
        P = s.P; psi, m = P.psi(sv); m = m.copy(); m[3:] = 0.0; y = m + sv * P.a
        C, h, H = s.M.build(y @ P.B); D = P.Q - H; blk = {0: [0, 1, 2], 1: [3, 4, 5], 2: [6, 7, 10], 3: [8, 9, 11]}; ev = {}; vec = {}
        for b, ix in blk.items():
            e, V = np.linalg.eigh(D[np.ix_(ix, ix)]); ev[b] = e[0]; vec[b] = V[:, 0] * (1 if V[0, 0] > 0 else -1)
        vq = {}
        for b in (0, 2, 3):
            q = [F(0)] * 12
            for j, c in zip(blk[b], vec[b]): q[j] = rat(c)
            vq[b] = q
        vf = {b: np.array([float(x) for x in vq[b]]) for b in vq}; u = vf[0]; t0 = F(round(float(u @ m) * 10 ** 6), 10 ** 6); sq = F(sv).limit_denominator(10 ** 6)
        def var1(f1):
            if not f1: return []
            f = np.zeros(12); f[blk[1]] = vec[1] * f1; return [f]
        def oddvar(fo):
            a = np.zeros(12); a[blk[2]] = vec[2] * fo; b = np.zeros(12); b[blk[2]] = vec[3] * fo; return [a, b]
        f1list = [0.0] if ev[1] > 0.01 else [0.02, 0.04, 0.06, 0.1]
        # tau0 slices: (lo, hi) absolute, hi None = halfspace up; lo None = halfspace down (encoded with -u)
        sl = [(t0 - A0, t0 + A0)] + [(t0 + a, t0 + b) for a, b in zip(OFFS[:-1], OFFS[1:])] + [(t0 - b, t0 - a) for a, b in zip(OFFS[:-1], OFFS[1:])] + [(t0 + OFFS[-1], None), (None, t0 - OFFS[-1])]
        def c0(lo, hi):                                                   # tau0 constraint (exact and float forms)
            if hi is None: return (vq[0], lo, None), (u, float(lo), None)
            if lo is None: return ([-x for x in vq[0]], -hi, None), (-u, -float(hi), None)
            return (vq[0], lo, hi), (u, float(lo), float(hi))
        pieces = []; slices = []; mc = m.copy(); worst = -1; queue = list(sl); TOLS = float(os.environ.get('TOLS', '6e-5'))
        while queue:
            (lo, hi) = queue.pop(0); npc0 = len(pieces); nsl0 = len(slices)
            ce, cf = c0(lo, hi); tc = float(lo + hi) / 2 if (lo is not None and hi is not None) else (float(lo) + 0.02 if hi is None else float(hi) - 0.02)
            Jc, ms = s.conmax(sv, u[None, :], np.array([tc]), m); ms[3:] = 0; ys = ms + sv * P.a
            best = None                                                    # single piece: odd variance + block-1 variance
            for fo in (0.04, 0.08, 0.12, 0.16, 0.25):
                for f1 in f1list:
                    var = oddvar(fo) + var1(f1); mx, fl = s.mats(M2.NQ_OUT, ys, var); b, mul = s.fbound(sv, *fl, [cf])
                    if best is None or b < best[0]: best = (b, mul, mx, var)
            b, mul, mx, var = best
            if b <= psi + TOL:
                out, ml = s.certify(mx, [ce], mul); worst = max(worst, b - psi)
                pieces.append(dict(kind='single', slice=[None if lo is None else str(lo), None if hi is None else str(hi)], nq=M2.NQ_OUT, anchor=[repr(float(x)) for x in ys],
                                   var=[[repr(float(x)) for x in f] for f in var], cons=[[[str(x) for x in ce[0]], str(ce[1]), None if ce[2] is None else str(ce[2]), str(ml[0][3]), str(ml[0][4])]],
                                   q=[str(x) for x in out[:3]], float_bound=b))
                slices.append(dict(slice=[None if lo is None else str(lo), None if hi is None else str(hi)], mode='single')); continue
            log(f'    s={sv}: slice {lo},{hi}: single piece {b-psi:+.1e} -> odd partition')
            # odd partition inside the slice
            bestv = None
            for f1 in f1list:
                mx, fl = s.mats(M2.NQ_OUT, ys, var1(f1)); b, mul = s.fbound(sv, *fl, [cf, (vf[2], float(OI[0][0]), float(OI[0][1])), (vf[3], float(OI[0][0]), float(OI[0][1]))])
                if bestv is None or b < bestv[0]: bestv = (b, f1)
            ev1 = var1(bestv[1]); Vm = np.stack([u, vf[2], vf[3]]); mo = ms.copy()
            for i, I2 in enumerate(OI):
                for j, I3 in enumerate(OI):
                    cons_f = [cf, (vf[2], float(I2[0]), float(I2[1])), (vf[3], float(I3[0]), float(I3[1]))]
                    if i == 0 and j == 0: yy = ys
                    else:
                        tcv = np.array([tc, float(I2[0] + I2[1]) / 2, float(I3[0] + I3[1]) / 2]); Jb, mb = s.conmax(sv, Vm, tcv, mo); yy = mb + sv * P.a
                    mx, fl = s.mats(M2.NQ_OUT, yy, ev1); b, mul = s.fbound(sv, *fl, cons_f); bv = ev1
                    if not b < 1e8:
                        for fx in (0.03, 0.06, 0.1, 0.15, 0.25):
                            ex = []
                            for bb in (0, 1):
                                f = np.zeros(12); f[blk[bb]] = vec[bb] * fx; ex.append(f)
                            mx2, fl2 = s.mats(M2.NQ_OUT, yy, ev1 + ex); b2, mul2 = s.fbound(sv, *fl2, cons_f)
                            if b2 < 1e8: mx, b, mul, bv = mx2, b2, mul2, ev1 + ex; break
                    if not b < 1e8: log(f'  s={sv}: slice {lo},{hi} box {I2}x{I3} infeasible'); return None
                    ce_all = [ce, (vq[2], I2[0], I2[1]), (vq[3], I3[0], I3[1])]; out, ml = s.certify(mx, ce_all, mul); worst = max(worst, b - psi)
                    pieces.append(dict(kind='box3', slice=[str(lo), str(hi)], box=[[str(I2[0]), str(I2[1])], [str(I3[0]), str(I3[1])]], nq=M2.NQ_OUT, anchor=[repr(float(x)) for x in yy],
                                       var=[[repr(float(x)) for x in f] for f in bv], cons=[[[str(x) for x in c[0]], str(c[1]), None if c[2] is None else str(c[2]), str(mm[3]), str(mm[4])] for c, mm in zip(ce_all, ml)],
                                       q=[str(x) for x in out[:3]], float_bound=b))
            FAR = [T, 2 * T, 4 * T]
            for d, od in ((2, 3), (3, 2)):                                  # far odd region tau_d >= T inside the slice: slabs [T,2T], [2T,4T], halfspace >= 4T
                vd = vf[d]; mcf = ms.copy()
                for (flo, fhi) in list(zip(FAR[:-1], FAR[1:])) + [(FAR[-1], None)]:
                    if fhi is not None:
                        Vm2 = np.stack([u, vd]); Jf, mcf = s.conmax(sv, Vm2, np.array([tc, float(flo + fhi) / 2]), mcf); yy = mcf + sv * P.a
                    else: yy = ys
                    hb = None
                    for fo in ((0.02, 0.05, 0.1, 0.15, 0.2, 0.3) if fhi is not None else (0.06, 0.1, 0.16, 0.25, 0.35)):
                        for f1 in f1list:
                            g1 = np.zeros(12); g1[blk[2]] = vec[od] * fo; var = [g1] + var1(f1)
                            if fhi is None: g2 = np.zeros(12); g2[blk[2]] = vec[d] * fo; var = [g1, g2] + var1(f1)
                            mx0, fl = s.mats(M2.NQ_OUT, yy, var); b0, mul0 = s.fbound(sv, *fl, [cf, (vd, float(flo), None if fhi is None else float(fhi))])
                            if hb is None or b0 < hb[0]: hb = (b0, mul0, mx0, var)
                    b, mul, mx, var = hb
                    if not b < 1e8: log(f'  s={sv}: far {d} {flo} infeasible'); return None
                    ce_all = [ce, (vq[d], flo, fhi)]; out, ml = s.certify(mx, ce_all, mul); worst = max(worst, b - psi)
                    pieces.append(dict(kind='far3', slice=[str(lo), str(hi)], dir=d, lo=str(flo), hi=None if fhi is None else str(fhi), nq=M2.NQ_OUT, anchor=[repr(float(x)) for x in yy],
                                       var=[[repr(float(x)) for x in f] for f in var], cons=[[[str(x) for x in c[0]], str(c[1]), None if c[2] is None else str(c[2]), str(mm[3]), str(mm[4])] for c, mm in zip(ce_all, ml)],
                                       q=[str(x) for x in out[:3]], float_bound=b))
            slices.append(dict(slice=[str(lo), str(hi)], mode='odd', intervals=[[str(a), str(b)] for a, b in OI], T=str(T)))
            if lo is not None and hi is not None and hi - lo > F(12, 1000) and max(p['float_bound'] for p in pieces[npc0:]) > psi + TOLS:
                mid_ = (lo + hi) / 2; del pieces[npc0:]; del slices[nsl0:]; queue += [(lo, mid_), (mid_, hi)]
                log(f'    s={sv}: split tau0 slice {float(lo):.4f},{float(hi):.4f}')
        vals = [F(p['q'][0]) + F(p['q'][1]) * sq + F(p['q'][2]) * sq * sq for p in pieces]; mxv = max(vals)
        cap = F(ceil((mxv + F(1, 10 ** 12)) * 10 ** 12), 10 ** 12)
        log(f"  s={sv}: Psi_float {psi:.9f}  cap {float(cap):.9f} (cap-Psi {float(cap)-psi:+.2e}; eig {ev[0]:.3f} {ev[1]:.3f} {ev[2]:.3f} {ev[3]:.3f}; {len(pieces)} pieces, "
            f"{sum(1 for x in slices if x['mode']=='odd')} odd-partitioned slices)")
        return dict(s=str(sq), format='slices', u=[str(x) for x in vq[0]], v2=[str(x) for x in vq[2]], v3=[str(x) for x in vq[3]], slices=slices, pieces=pieces, cap=str(cap), psi_float=psi)
if __name__ == "__main__":
    t, outfn = sys.argv[1], sys.argv[2]; R = Row(t); res = []
    for a in sys.argv[3:]:
        t0 = time.time(); r = R.node3(float(a)); res += [r] if r else []; print(f"    [{time.time()-t0:.0f}s]", flush=True)
        json.dump(dict(t=t, NR=1600, nodes=res), open(outfn, 'w'))
