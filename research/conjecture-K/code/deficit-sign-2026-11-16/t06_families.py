"""Table of the split D = T1 + T2 on named families (label N).  Profiles: sqrt (u = 1) and the peak row (u = 0.0463)."""
import sys, os, math, time
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *
from dsn import *

def embed(t, n):
    m = t.shape[0]; T = np.zeros((n, n, n), complex); T[:m, :m, :m] = t; return T

if __name__ == '__main__':
    U = 0.0463
    sq = SqrtProfile(1.0); pk = peak_profile(U)
    g2 = Grid(2, PANELS_FINE, 8, 48)
    g3 = ChunkGrid(3, [0, .5, 1, 2, 3, 5, 8, 12, 18, 28], 4, 12)
    print('n=3 grid points', g3.size, flush=True)
    rows = []
    def do2(name, t):
        f1 = stein_fields(normalise(t, 1.0), g2.Y); a = split(g2, None, sq, f1); m = moments(g2, None, f1)
        f2 = stein_fields(normalise(t, U), g2.Y); b = split(g2, None, pk, f2)
        rows.append((name, m['delta'], a, b)); show(rows[-1])
    def do3(name, t):
        (a,), m = g3.run(normalise(t, 1.0), [sq]); (b,), _ = g3.run(normalise(t, U), [pk])
        rows.append((name, m['delta'], a, b)); show(rows[-1])
    def show(r):
        name, chi, a, b = r
        print(f"{name:34s} chi={chi:7.3f} | sqrt: D={a['D']:.5f} T1/D={a['T1']/a['D']:+.4f} T2/D={a['T2']/a['D']:+.4f} (id.err {abs(a['T1']+a['T2']-a['D'])/a['D']:.0e}) | peak: D={b['D']:.4e} T1/D={b['T1']/b['D']:+.4f} T2/D={b['T2']/b['D']:+.4f} (id.err {abs(b['T1']+b['T2']-b['D'])/b['D']:.0e})", flush=True)
    do2('Wick monomial Z(|Z|^2-2)', t_monomial(2))
    do2('Z0^2 conj(Z1)', t_z0sq_z1bar())
    do2('H(Z0)+H(Z1) (N=2 sum)', t_sum_monomials(2))
    do2('item-5 cubic z=i', t_item5(1j))
    do2('Z0(|Z1|^2-1)', t_item5(1e6))
    t = np.zeros((2, 2, 2), complex); t[0, 0, 0] = 1; t[0, 1, 1] = t[1, 0, 1] = 0.5   # X(|X|^2+|Y|^2-3)
    do2('Z0(|Z|^2-3) (radial)', t)
    do2('cyclic n=2: Z0^2 cZ1 + Z1^2 cZ0', t_cyclic(2))
    do3('Z0 Z1 conj(Z2)', t_z0z1_z2bar())
    do3('cyclic n=3', t_cyclic(3))
    do3('H(Z0)+H(Z1)+H(Z2) (N=3 sum)', t_sum_monomials(3))
    t = np.zeros((3, 3, 3), complex); t[0, 0, 0] = 1; t[0, 1, 1] = t[1, 0, 1] = 0.5; t[0, 2, 2] = t[2, 0, 2] = 0.5
    do3('Z0(|Z|^2-4) (radial, n=3)', t)
    rng = np.random.default_rng(7)
    lo = [9, 9, 9, 9]; hi = [-9, -9, -9, -9]
    for i in range(12):
        t = random_tensor(3, rng); do3(f'random n=3 #{i}', t)
    # Monte Carlo: cyclic n = 5, and N-sums as a cross-check of the Fourier script
    for name, t, NS in [('cyclic n=5 (MC 3e6)', t_cyclic(5), 3_000_000), ('sum of 8 monomials (MC 3e6)', t_sum_monomials(8), 3_000_000)]:
        (a,), m = mc_run(normalise(t, 1.0), [sq], NS, seed=1); (b,), _ = mc_run(normalise(t, U), [pk], NS, seed=2)
        print(f"{name:34s} chi={m['delta']:7.3f} | sqrt: D={a['D']:.5f}±{a['seD']:.5f} T1={a['T1']:.5f}±{a['seT1']:.5f} T2={a['T2']:+.5f}±{a['seT2']:.5f} (T1/D={a['T1']/a['D']:.3f}, T2/D={a['T2']/a['D']:+.3f}) | peak: D={b['D']:.4e}±{b['seD']:.1e} T1={b['T1']:.4e}±{b['seT1']:.1e} T2={b['T2']:+.4e}±{b['seT2']:.1e} (T1/D={b['T1']/b['D']:.3f}, T2/D={b['T2']/b['D']:+.3f})", flush=True)
