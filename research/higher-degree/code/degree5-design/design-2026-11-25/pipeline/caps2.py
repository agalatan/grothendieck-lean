# [stage 2c copy of degree5-cert/cert2b/caps2.py: the default nu-grid comes from gamecfg.py (game.json); nothing else changed]
# Node caps of the degree-5 potential Psi5(s; nu) at one row (stage 2, capped game: nu-grid for eta = 0.0779): runs psi5 (C++ interval code) in parallel and adds
# a rigorous bound for the part of the Gaussian integral outside the square |x|, |y| <= 13/2 (Arb).
# Output JSON: {"row": {...}, "tail": "p/q", "caps": {nu: [[s, cap], ...]}} with exact rationals (strings);
# cap = (upper end of the psi5 enclosure) + tail >= Psi5(s; nu).   claude-b9ee d5cert worker, 16 Nov 2026.  [C]
import sys, os, json, subprocess, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as F
from concurrent.futures import ThreadPoolExecutor
HERE = os.path.dirname(os.path.abspath(__file__))

def tail_bound(row, smax, numax):
    """2 E[|A+|; |z| > R], R = 13/2, with |A+| <= r|g| + s|h| + |c| r^2, |g(T)| <= l + beta(T+2) + |nu|/sqrt12 (T^2+6T+6),
    |h| <= 1 + |bA|(T+1), |c| = s|bB|/sqrt2 <= s|bB|; E[r^k; r > R] = Gamma(k/2+1, R^2) <= x^(a-1) e^-x x/(x-a+1)."""
    from flint import arb
    x = arb(169) / 4                     # R^2
    def G(a):                            # upper bound of Gamma(a, x), a >= 1, x > a - 1
        a = arb(a); return x ** (a - 1) * (-x).exp() * x / (x - a + 1)
    l, beta, bA, bB = (arb(row[k].numerator) / row[k].denominator for k in ('l', 'beta', 'bA', 'bB'))
    nk = arb(numax.numerator) / numax.denominator      # >= |nu|/sqrt12 (crude: drop 1/sqrt12)
    s = arb(smax.numerator) / smax.denominator
    # r|g| <= l r + beta(r^3 + 2r) + nk (r^5 + 6 r^3 + 6 r)
    e = l * G(1.5) + beta * (G(2.5) + 2 * G(1.5)) + nk * (G(3.5) + 6 * G(2.5) + 6 * G(1.5))
    e += s * ((1 + abs(bA)) * G(1) + abs(bA) * G(2)) + s * abs(bB) * G(2)
    T = 2 * e
    ub = T.upper()
    q = F(1, 10 ** 13)
    assert ub < arb(q.numerator) / q.denominator, ub
    return q

def run_chunk(row, nodes, told, maxdepth=18):
    inp = '%d %d %d %d %d %d %d %d\n' % tuple(v for k in ('l', 'beta', 'bA', 'bB') for v in (row[k].numerator, row[k].denominator))
    inp += ''.join('%d %d %d %d\n' % (s.numerator, s.denominator, n.numerator, n.denominator) for s, n in nodes)
    out = subprocess.run([os.path.join(HERE, 'psi5'), str(told), str(maxdepth)], input=inp, capture_output=True, text=True, check=True).stdout
    res = []
    for line in out.split('\n'):
        if not line.strip(): continue
        p = line.split()
        res.append((F(p[0]), F(p[1]), F(float.fromhex(p[2])), F(float.fromhex(p[3])), int(p[4]), int(p[5]), int(p[7])))
    assert len(res) == len(nodes)
    return res

def near_circle(row, nu):
    """True if g(T) = l - 2 beta + beta T + nu (T^2 - 6T + 6)/sqrt(12) comes within 0.05 of 0 for T in [0, 60]: then
    L + nu e32 (nearly) vanishes on a circle and the adaptive integration is slow."""
    l, beta = float(row['l']), float(row['beta']); n = float(nu)
    g = min(l - 2 * beta + beta * T + n * (T * T - 6 * T + 6) / 12 ** 0.5 for T in [i * 0.05 for i in range(1201)])
    return g < 0.05

def compute(row, nodes, nproc=6, told=1e-12, chunk=60):
    """nodes with nu < 0, or whose L + nu e32 nearly vanishes on a circle, use a looser tolerance and a smaller
    depth: their caps are still rigorous upper bounds, only less sharp (they are far from the optimum)."""
    loose = {nu for nu in set(n[1] for n in nodes) if nu < 0 or near_circle(row, nu)}
    pos = [n for n in nodes if n[1] not in loose]; neg = [n for n in nodes if n[1] in loose]
    chunks = [(pos[i:i + chunk], told, 18) for i in range(0, len(pos), chunk)]
    chunks += [(neg[i:i + 6], 1e-7, 7) for i in range(0, len(neg), 6)]
    with ThreadPoolExecutor(nproc) as ex:
        outs = list(ex.map(lambda c: run_chunk(row, *c), chunks))
    return [r for o in outs for r in o]

def grid_s(fine):
    s = []
    if fine is None:                                        # very coarse (nu < 0: far from the optimum)
        s += [F(k, 20) for k in range(0, 24)]
        s += [F(6, 5) + F(k, 10) for k in range(0, 18)]
        s += [F(3) + F(k, 4) for k in range(0, 13)]
        return s
    if fine:
        s += [F(k, 500) for k in range(0, 600)]            # 0 .. 1.2 step 0.002
        s += [F(6, 5) + F(k, 200) for k in range(0, 160)]   # 1.2 .. 2 step 0.005
        s += [F(2) + F(k, 50) for k in range(0, 50)]        # 2 .. 3 step 0.02
        s += [F(3) + F(k, 10) for k in range(0, 31)]        # 3 .. 6 step 0.1
        return s
    else:
        s += [F(k, 100) for k in range(0, 120)]             # 0 .. 1.2 step 0.01
    s += [F(6, 5) + F(k, 50) for k in range(0, 90)]         # 1.2 .. 3 step 0.02
    s += [F(3) + F(k, 10) for k in range(0, 31)]            # 3 .. 6 step 0.1
    return s

if __name__ == '__main__':
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument('--row', required=True, help='l,beta,bA,bB as rationals p/q')
    import gamecfg as _G                                     # stage 2c: the nu-grid comes from game.json
    ap.add_argument('--nufine', default=_G.NUFINE)
    ap.add_argument('--nucoarse', default=_G.NUCOARSE)
    ap.add_argument('--nproc', type=int, default=6)
    ap.add_argument('--out', required=True)
    a = ap.parse_args()
    l, beta, bA, bB = (F(x) for x in a.row.split(','))
    row = dict(l=l, beta=beta, bA=bA, bB=bB)
    lo, hi, st = (F(x) for x in a.nufine.split(':'))
    nufine = [lo + k * st for k in range(int((hi - lo) / st) + 1)]
    nucoarse = [F(x) for x in a.nucoarse.split(',')]
    nodes = [(s, n) for n in nufine for s in grid_s(True)]
    nodes += [(s, n) for n in nucoarse for s in grid_s(False if n >= 0 else None)]
    t0 = time.time()
    res = compute(row, nodes, a.nproc)
    secs = time.time() - t0
    smax = max(s for s, _ in nodes); numax = max(abs(n) for _, n in nodes)
    tail = tail_bound(row, smax, numax)
    caps = {}
    worst = F(0); cells = evals = fails = 0
    for s, n, lo, hi, nc, ne, nf in res:
        caps.setdefault(str(n), []).append([str(s), str(hi + tail)])
        worst = max(worst, hi - lo); cells += nc; evals += ne; fails += nf
    for k in caps: caps[k].sort(key=lambda p: F(p[0]))
    json.dump(dict(row={k: str(v) for k, v in row.items()}, tail=str(tail), caps=caps,
                   stats=dict(nodes=len(nodes), secs=secs, cpu_per_node=secs * a.nproc / len(nodes), max_width=float(worst),
                              cells=cells, evals=evals, depth_fails=fails)), open(a.out, 'w'))
    print('nodes', len(nodes), 'wall %.1fs' % secs, 'max width %.2e' % float(worst), 'tail', tail, flush=True)
