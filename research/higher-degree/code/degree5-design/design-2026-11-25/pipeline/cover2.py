# Adaptive (sigma, x, nu) cover of the q-only law layer at one row, capped game (law2.py).  claude-b9ee d5cert, 16 Nov 2026.
# Every accepted box carries two exact majorants and an exact Bernstein bound (law.py); the output G+ is the
# largest accepted bound, a rational with  sup_{sigma, nu, law} [E Psi5 - kappa sigma^2 - nu^2/eta] <= G+.   [C]
import sys, os, json, time, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as F
from multiprocessing import Pool
import law2 as law

ROW = None
def init(capsfile):
    global ROW
    ROW = law.Row(capsfile)

def work(item):
    box, parent = item
    nu0, nu1, sa, sb, xa, xb = box
    t0 = time.time()
    try:
        b, info = law.certify_box(ROW, nu0, nu1, sa, sb, xa, xb)
    except Exception as e:  # numerical failure of the LP etc.: treat as failed box
        b, info = None, ('exception', repr(e)[:100])
    return box, parent, b, info, time.time() - t0

XW = F(1, 4)
def split(box):
    nu0, nu1, sa, sb, xa, xb = box
    # normalised widths: sigma in units of 0.05, x in units of 0.25 (wide x-boxes first: one majorant cannot
    # follow the law over a wide range of m)
    if (sb - sa) / F(1, 20) >= (xb - xa) / XW:
        m = (sa + sb) / 2
        return [(nu0, nu1, sa, m, xa, xb), (nu0, nu1, m, sb, xa, xb)]
    m = (xa + xb) / 2
    return [(nu0, nu1, sa, sb, xa, m), (nu0, nu1, sa, sb, m, xb)]

if __name__ == '__main__':
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument('--caps', required=True)
    ap.add_argument('--target', required=True, help='rational target for G+')
    ap.add_argument('--nproc', type=int, default=6)
    ap.add_argument('--maxboxes', type=int, default=4000)
    ap.add_argument('--minsig', default='1/400')
    ap.add_argument('--stall-sig', dest='stall_sig', default='1/40')
    ap.add_argument('--stall-x', dest='stall_x', default='1/4')
    ap.add_argument('--xweight', default='1/4', help='x-width unit in the split rule (smaller = split x more)')
    ap.add_argument('--out', required=True)
    a = ap.parse_args()
    init(a.caps)
    row = ROW
    globals()['XW'] = F(a.xweight)
    T = F(a.target)
    sig_max = F(math.ceil(row.sigmax * 1000), 1000)
    assert sig_max * row.kappa >= row.lip * law.RHO
    sig = sorted(set([v for v in (F(0), F(1, 10), F(1, 5), F(3, 10), F(9, 20), F(7, 10), F(1), F(7, 5)) if v < sig_max] + [sig_max]))
    xs = [F(0), F(3, 10), F(3, 5), F(1), F(3, 2), F(2), F(3), F(9, 2), law.XMAX]
    nus = row.nus
    assert nus[0] <= -law.ETA and nus[-1] >= law.ETA
    queue = [((nus[j], nus[j + 1], sig[i], sig[i + 1], xs[k], xs[k + 1]), None)
             for j in range(len(nus) - 1) for i in range(len(sig) - 1) for k in range(len(xs) - 1)]
    accepted = []; failed = []
    t0 = time.time(); nb = 0
    with Pool(a.nproc, initializer=init, initargs=(a.caps,)) as pool:
        while queue and nb < a.maxboxes:
            batch = queue; queue = []
            for box, parent, b, info, secs in pool.imap_unordered(work, batch, chunksize=1):
                nb += 1
                # stall: splitting gained less than a quarter of the excess over the target
                stalled = (b is not None and parent is not None and parent - b < (parent - T) / 4
                           and box[3] - box[2] <= F(a.stall_sig) and box[5] - box[4] <= F(a.stall_x))
                if b is not None and (b <= T or stalled):
                    accepted.append(dict(box=[str(v) for v in box], bound=str(b), secs=secs, a0=info['a0'], a1=info['a1'],
                                         above_target=bool(b > T)))
                elif box[3] - box[2] > F(a.minsig) or box[5] - box[4] > F(a.stall_x):
                    queue.extend((c, b) for c in split(box))
                else:
                    # not below the target at the smallest width: kept with its (valid) bound when it has one
                    if b is not None:
                        accepted.append(dict(box=[str(v) for v in box], bound=str(b), secs=secs, a0=info['a0'], a1=info['a1'], above_target=True))
                    else:
                        failed.append(dict(box=[str(v) for v in box], bound=None, info=str(info)))
            print('round: accepted %d failed %d queued %d boxes so far %d (%.0fs)' % (len(accepted), len(failed), len(queue), nb, time.time() - t0), flush=True)
    G = max(F(r['bound']) for r in accepted) if (accepted and not queue and not failed) else None   # None: incomplete
    res = dict(caps=a.caps, target=str(T), G_plus=(str(G) if G is not None else None), accepted=len(accepted), failed=failed,
               unfinished=[[str(v) for v in b] for b, _ in queue], boxes_processed=nb, wall=time.time() - t0,
               kappa=str(row.kappa), lip=str(row.lip), sig_max=str(sig_max), boxes=accepted)
    json.dump(res, open(a.out, 'w'))
    print('G+', float(G) if G else None, 'accepted', len(accepted), 'failed', len(failed), 'unfinished', len(queue), flush=True)
