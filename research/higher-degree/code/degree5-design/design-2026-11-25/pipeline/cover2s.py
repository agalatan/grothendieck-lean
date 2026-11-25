# Adaptive (sigma, x, nu) cover of the q-only law layer with the scalar Stein family (stage 2b; claude-b9ee d5cert
# worker, 16 Nov 2026).  Same tiling and acceptance rules as cover2.py; a box whose polynomial certificate (law2) is
# above the target and that is small enough gets a Stein certificate (stein2): two Stein majorants (physical W, M) at
# nu0 and nu1, each verified at c = sa^2 and c = sb^2, and the exact Bernstein bound with the term M x^2 sigma^4/24.
# Every accepted box stores either the polynomial data (a0, a1) or the Stein data; the output G+ is the largest bound.
import sys, os, json, time, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('OMP_NUM_THREADS', '1'); os.environ.setdefault('OPENBLAS_NUM_THREADS', '1')
from fractions import Fraction as F
from multiprocessing import Pool
import law2 as law
import stein2 as st

ROW = None; OPT = None
def init(capsfile, opt):
    global ROW, OPT
    ROW = law.Row(capsfile); OPT = opt

def eligible(box):
    nu0, nu1, sa, sb, xa, xb = box
    return (sb - sa <= OPT['stein_sig'] and xb - xa <= OPT['stein_x'] and sa >= OPT['stein_sigmin']
            and nu0 >= OPT['stein_numin'] and nu1 <= OPT['stein_numax'])

def work(item):
    box, parent = item
    nu0, nu1, sa, sb, xa, xb = box
    t0 = time.time()
    try:
        b, info = law.certify_box(ROW, nu0, nu1, sa, sb, xa, xb)
    except Exception as e:
        b, info = None, ('exception', repr(e)[:100])
    if (b is None or b > OPT['T']) and eligible(box):
        try:
            bs, infs = st.certify_box_stein(ROW, nu0, nu1, sa, sb, xa, xb)
        except Exception as e:
            bs, infs = None, ('stein exception', repr(e)[:160])
        if bs is not None and (b is None or bs < b):
            b, info = bs, infs
    return box, parent, b, info, time.time() - t0

NUS = None
def split(box, XW):
    nu0, nu1, sa, sb, xa, xb = box
    inner = [n for n in NUS if nu0 < n < nu1]
    if inner and sb - sa <= F(1, 40) and xb - xa <= F(1, 8):
        m = min(inner, key=lambda n: abs(n - (nu0 + nu1) / 2))     # split nu at a cap node
        return [(nu0, m, sa, sb, xa, xb), (m, nu1, sa, sb, xa, xb)]
    if (sb - sa) / F(1, 20) >= (xb - xa) / XW:
        m = (sa + sb) / 2
        return [(nu0, nu1, sa, m, xa, xb), (nu0, nu1, m, sb, xa, xb)]
    m = (xa + xb) / 2
    return [(nu0, nu1, sa, sb, xa, m), (nu0, nu1, sa, sb, m, xb)]

def record(box, b, info, secs, above):
    r = dict(box=[str(v) for v in box], bound=str(b), secs=secs, above_target=bool(above))
    if isinstance(info, dict) and info.get('stein'):
        r.update(stein=True, sref=info['sref'], a0=info['a0'], a1=info['a1'], W0=info['W0'], W1=info['W1'], M0=info['M0'], M1=info['M1'])
    else:
        r.update(a0=info['a0'], a1=info['a1'])
    return r

if __name__ == '__main__':
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument('--caps', required=True)
    ap.add_argument('--target', required=True)
    ap.add_argument('--nproc', type=int, default=6)
    ap.add_argument('--maxboxes', type=int, default=40000)
    ap.add_argument('--minsig', default='1/400')
    ap.add_argument('--stall-sig', dest='stall_sig', default='1/40')
    ap.add_argument('--stall-x', dest='stall_x', default='1/32')
    ap.add_argument('--xweight', default='1/16')
    ap.add_argument('--stein-sig', dest='stein_sig', default='1/20')
    ap.add_argument('--stein-x', dest='stein_x', default='1/2')
    ap.add_argument('--stein-sigmin', dest='stein_sigmin', default='3/10')
    ap.add_argument('--stein-numin', dest='stein_numin', default='-1/10')
    ap.add_argument('--stein-numax', dest='stein_numax', default='1/10')
    ap.add_argument('--nu-grid', dest='nu_grid', default=None, help='initial nu nodes (a subset of the cap nodes)')
    ap.add_argument('--out', required=True)
    a = ap.parse_args()
    T = F(a.target)
    opt = dict(T=T, stein_sig=F(a.stein_sig), stein_x=F(a.stein_x), stein_sigmin=F(a.stein_sigmin),
               stein_numin=F(a.stein_numin), stein_numax=F(a.stein_numax))
    init(a.caps, opt)
    row = ROW
    XW = F(a.xweight)
    sig_max = F(math.ceil(row.sigmax * 1000), 1000)
    assert sig_max * row.kappa >= row.lip * law.RHO
    sig = sorted(set([v for v in (F(0), F(1, 10), F(1, 5), F(3, 10), F(9, 20), F(7, 10), F(1), F(7, 5)) if v < sig_max] + [sig_max]))
    xs = [F(0), F(3, 10), F(3, 5), F(1), F(3, 2), F(2), F(3), F(9, 2), law.XMAX]
    NUS = row.nus
    nus = sorted(F(v) for v in a.nu_grid.split(',')) if a.nu_grid else row.nus
    assert all(n in row.caps for n in nus) and nus[0] == row.nus[0] and nus[-1] == row.nus[-1]
    assert nus[0] <= -law.ETA and nus[-1] >= law.ETA
    queue = [((nus[j], nus[j + 1], sig[i], sig[i + 1], xs[k], xs[k + 1]), None)
             for j in range(len(nus) - 1) for i in range(len(sig) - 1) for k in range(len(xs) - 1)]
    accepted = []; failed = []
    t0 = time.time(); nb = 0; nst = 0
    with Pool(a.nproc, initializer=init, initargs=(a.caps, opt)) as pool:
        while queue and nb < a.maxboxes:
            batch = queue; queue = []
            for box, parent, b, info, secs in pool.imap_unordered(work, batch, chunksize=1):
                nb += 1
                stalled = (b is not None and parent is not None and parent - b < (parent - T) / 4
                           and box[3] - box[2] <= F(a.stall_sig) and box[5] - box[4] <= F(a.stall_x))
                if b is not None and (b <= T or stalled):
                    accepted.append(record(box, b, info, secs, b > T))
                elif box[3] - box[2] > F(a.minsig) or box[5] - box[4] > F(a.stall_x) or any(box[0] < n < box[1] for n in NUS):
                    queue.extend((c, b) for c in split(box, XW))
                else:
                    if b is not None:
                        accepted.append(record(box, b, info, secs, True))
                    else:
                        failed.append(dict(box=[str(v) for v in box], bound=None, info=str(info)))
                if isinstance(info, dict) and info.get('stein'): nst += 1
            print('round: accepted %d (stein %d) failed %d queued %d boxes so far %d (%.0fs)' % (
                len(accepted), sum(1 for r in accepted if r.get('stein')), len(failed), len(queue), nb, time.time() - t0), flush=True)
    G = max(F(r['bound']) for r in accepted) if (accepted and not queue and not failed) else None
    res = dict(caps=a.caps, target=str(T), G_plus=(str(G) if G is not None else None), accepted=len(accepted), failed=failed,
               unfinished=[[str(v) for v in b] for b, _ in queue], boxes_processed=nb, wall=time.time() - t0,
               kappa=str(row.kappa), lip=str(row.lip), sig_max=str(sig_max), stein_options={k: str(v) for k, v in opt.items()},
               boxes=accepted)
    json.dump(res, open(a.out, 'w'))
    print('G+', float(G) if G else None, 'accepted', len(accepted), 'stein', sum(1 for r in accepted if r.get('stein')),
          'failed', len(failed), 'unfinished', len(queue), flush=True)
