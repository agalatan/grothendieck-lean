"""Certify F(sigma) <= Fhat for one sigma node: adaptive s-intervals covering [0,42].
usage: run_node.py etap sigma stein(0/1) target_G outdir
target_G: desired bound on F(sigma) - sigma^2/e1 (intervals split until met or depth exhausted)."""
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import cert as C

def certify_interval(sigma, etap, sa, sb, stein, margin):
    c = C.solve_refined(sigma, etap, sa, sb, stein=stein, margin=margin)
    if c['status'] not in ('optimal', 'optimal_inaccurate'):
        return None, f"solver {c['status']}"
    # clamp solver round-off in sign-constrained multipliers (the clamped certificate is what gets verified)
    c['lam'][3] = max(c['lam'][3], 0.0); c['lr'] = max(c['lr'], 0.0)
    ok, info = C.verify(c, stein=stein, maxdepth=20)
    if not ok:
        # retry with a larger margin
        c = C.solve_refined(sigma, etap, sa, sb, stein=stein, margin=margin*4, margin4=5e-6)
        c['lam'][3] = max(c['lam'][3], 0.0); c['lr'] = max(c['lr'], 0.0)
        ok, info = C.verify(c, stein=stein, maxdepth=22)
        if not ok:
            return None, f"verify failed: {info}"
    B = max(C.bound_exact(c, Fr(sa)), C.bound_exact(c, Fr(sb)))
    c['B_exact'] = [B.numerator, B.denominator]; c['B'] = float(B); c['verify'] = info
    return c, 'ok'

def main():
    etap = Fr(sys.argv[1]); sigma = Fr(sys.argv[2]); stein = sys.argv[3] == '1'
    target = float(sys.argv[4]); outdir = sys.argv[5]
    os.makedirs(outdir, exist_ok=True)
    sg2 = float(sigma**2/C.E1)
    part = sys.argv[6] if len(sys.argv) > 6 else 'default'
    if part == 'central':
        cuts = ['0', '1', '2', '3', '3.5', '4', '4.5', '5', '5.5', '6', '7', '8', '10', '14', '20', '42']
    else:
        cuts = ['0', '1', '2', '3', '4', '5', '6', '8', '12', '20', '42']
    queue = [(Fr(a), Fr(b), 0) for a, b in zip(cuts[:-1], cuts[1:])]
    done = []; log = []
    t0 = time.time()
    while queue:
        sa, sb, depth = queue.pop(0)
        c, msg = certify_interval(float(sigma), float(etap), float(sa), float(sb), stein, 3e-5)
        G = (c['B'] - sg2) if c is not None else None
        log.append(f"s=[{float(sa)},{float(sb)}] depth {depth}: {msg} G={G}")
        print(f"sigma={float(sigma)} " + log[-1], flush=True)
        if c is not None and G <= target:
            c['sa_exact'] = [sa.numerator, sa.denominator]; c['sb_exact'] = [sb.numerator, sb.denominator]
            done.append(c)
        elif depth < 2 and sb - sa > Fr(1, 4):
            m = (sa + sb)/2
            queue += [(sa, m, depth+1), (m, sb, depth+1)]
        else:
            if c is not None:
                c['sa_exact'] = [sa.numerator, sa.denominator]; c['sb_exact'] = [sb.numerator, sb.denominator]
                c['over_target'] = True
                done.append(c)
            else:
                done.append(dict(sa_exact=[sa.numerator, sa.denominator], sb_exact=[sb.numerator, sb.denominator], failed=msg))
    Fhat = max(Fr(*c['B_exact']) for c in done if 'B_exact' in c) if all('B_exact' in c for c in done) else None
    res = dict(sigma=[sigma.numerator, sigma.denominator], etap=[etap.numerator, etap.denominator], stein=stein,
               Fhat=[Fhat.numerator, Fhat.denominator] if Fhat is not None else None,
               G=float(Fhat) - sg2 if Fhat is not None else None, certs=done, log=log, seconds=time.time()-t0)
    fn = os.path.join(outdir, f"node_{float(sigma):.4f}_{'S' if stein else 'P'}.json")
    json.dump(res, open(fn, 'w'))
    print(f"DONE sigma={float(sigma)} G={res['G']} ({res['seconds']:.0f}s) -> {fn}", flush=True)

if __name__ == '__main__':
    main()
