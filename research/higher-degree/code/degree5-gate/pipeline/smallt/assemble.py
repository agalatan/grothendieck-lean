# [copy of degree5-cert/smallt/assemble.py; claude-b9ee worker d5newcap, 16 Nov 2026: only the constants changed, they are read from the
#  environment: ST_E1 (lambda_1), ST_ETA (the degree-5 coefficient), ST_RHO (the radius input), as rationals p/q; no defaults]
"""Assemble node certificates into N_cert(etap) and t0 (exact rational arithmetic).
usage: assemble.py etap outdir [outdir2 ...]
Bound: for sigma in [sigma_i, sigma_{i+1}], F(sigma) <= chord of Fhat (F convex in sigma),
       so G(sigma) = F(sigma) - sigma^2/e1 <= max over the cell of [chord - sigma^2/e1] (exact).
Outside [sigma_min, sigma_max]: F(sigma) <= 2 sigma rho + etap (crude), monotone pieces.
"""
import sys, os, json, glob, math
from fractions import Fraction as Fr

E1 = Fr(os.environ['ST_E1']); RHO = Fr(os.environ['ST_RHO']); TARGET = Fr(500, 701)

def main():
    etap = Fr(float(Fr(sys.argv[1])))   # the certificates use the double nearest to etap; work with that exact value
    nodes = {}; used = {}
    for d in sys.argv[2:]:
        for fn in glob.glob(os.path.join(d, 'node_*.json')):
            res = json.load(open(fn))
            certs = res['certs']
            if any('B_exact' not in c for c in certs):
                print("FAILED node", fn); continue
            # exact sigma used inside the certificates (float -> exact rational)
            sig = Fr(certs[0]['sigma'])
            assert all(Fr(c['sigma']) == sig for c in certs)
            assert all(Fr(c['etap']) == etap for c in certs)
            # coverage of s in [0, 42]
            ivs = sorted((Fr(*c['sa_exact']), Fr(*c['sb_exact'])) for c in certs)
            cur = Fr(0)
            for a, b in ivs:
                assert a <= cur, f"gap in s coverage at {float(cur)} for {fn}"
                cur = max(cur, b)
            assert cur >= 42, f"s coverage ends at {float(cur)} for {fn}"
            Fhat = max(Fr(*c['B_exact']) for c in certs)
            if sig not in nodes or Fhat < nodes[sig]:
                nodes[sig] = Fhat
                used[sig] = fn
    sigs = sorted(nodes)
    print(f"{len(sigs)} nodes from {float(sigs[0])} to {float(sigs[-1])}")
    worst = Fr(-10); where = None
    rows = []
    for a, b in zip(sigs[:-1], sigs[1:]):
        Fa, Fb = nodes[a], nodes[b]
        slope = (Fb - Fa)/(b - a)
        # maximise Fa + slope (x - a) - x^2/E1 over [a, b]
        xv = E1*slope/2
        cand = [a, b] + ([xv] if a < xv < b else [])
        m = max(Fa + slope*(x - a) - x*x/E1 for x in cand)
        rows.append((float(a), float(b), float(Fa - a*a/E1), float(Fb - b*b/E1), float(m)))
        if m > worst: worst, where = m, (float(a), float(b))
    # crude ends
    lo, hi = sigs[0], sigs[-1]
    crude_lo = 2*lo*RHO + etap - lo*lo/E1 if lo <= E1*RHO else None
    crude_hi = 2*hi*RHO + etap - hi*hi/E1 if hi >= E1*RHO else None
    for name, v in [('crude below sigma_min', crude_lo), ('crude above sigma_max', crude_hi)]:
        print(f"{name}: {float(v):.6f}")
        if v > worst: worst, where = v, name
    for r in rows:
        print("  [%.4f, %.4f]  G(a)=%.6f G(b)=%.6f  cell max %.6f" % r)
    print(f"N_cert(etap={etap}) = {float(worst):.8f}  (at {where})")
    room = TARGET - worst
    t0sq = room/(1 - etap)
    # rational lower bound for t0
    lo_t = Fr(math.isqrt(int(t0sq*10**12)), 10**6)
    assert lo_t*lo_t <= t0sq
    print(f"room {float(room):.6e};  V <= (1-etap) t^2 + N_cert < 500/701 for t <= {float(lo_t):.6f}  (t0^2 = {float(t0sq):.8f})")
    json.dump(dict(etap=[etap.numerator, etap.denominator], N=[worst.numerator, worst.denominator], t0=[lo_t.numerator, lo_t.denominator],
                   nodes={str(float(k)): float(v) for k, v in nodes.items()},
                   files={str(float(k)): used[k] for k in nodes}), open(os.path.join(sys.argv[2], 'assembled.json'), 'w'))
    open(os.path.join(sys.argv[2], 'used_files.txt'), 'w').write('\n'.join(used[k] for k in sorted(nodes)) + '\n')

if __name__ == '__main__':
    main()
