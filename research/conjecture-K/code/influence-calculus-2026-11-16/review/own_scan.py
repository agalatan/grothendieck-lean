#!/usr/bin/env python3
"""Reviewer's re-evaluation of the package's random scan (tilt 3/5), with the reviewer's own profiles and quadrature,
and the comparison with ALL proved content bounds of the ledger for the tilt (label N).

The package's `influence.py scan tilt` draws, with numpy.random.default_rng(5), 400 two-variable cubics per energy
(coefficients standard_normal(12) * exp(0.8 * standard_normal(12)), first u = 0.02, then u = 0.0463).  The same
coefficients are regenerated here and every cubic is evaluated with own_numerics.Two (nothing of the package is
imported).  Besides the package's statistics (against gamma*delta of 11.49 alone) the script reports the comparison
with
        H(u, delta) = min{ gamma(u) delta,  (19321/10^6) u,  1/2500 },
the minimum of the proved bounds of ledger 11.49 and 11.30 (||c_{3/5}||^2 <= (19321/10^6) u at every energy,
||c_{3/5}|| <= 1/50 for u <= 0.0463), which is what ledger 11.44 uses, and with the plain Bessel bound of the same law,
        Bz = min_m E[V (h(V) - m)^2] = E[V h^2] - (E[V h])^2 / u        (||c||^2 <= Bz because Pi_1 q = 0),
a law functional that needs no influence calculus (the bound (19321/10^6) u of 11.30 is its supremum over laws).

usage: own_scan.py <out-dir> [<t9_search.json> ...]
"""
import sys, os, json, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from own_numerics import Prof, Two, GAMMA, FAMILIES, cap

CU = 19321 / 10 ** 6; CABS = 1 / 2500
def H(u, dl): return min(GAMMA[u] * dl, CU * u, CABS)

def main():
    out = sys.argv[1]; P = Prof(os.path.join(out, "tab_reviewer.npz")); G = Two(5, 40)
    rng = np.random.default_rng(5)
    print("== the proved bounds of the ledger for the tilt content, in units of u^2 (gamma*chi | (19321/10^6)/u | 1/(2500 u^2)):")
    for u in (0.009, 0.02, 0.03, 0.0463):
        x1 = CU / u / GAMMA[u]; x2 = CABS / u ** 2 / GAMMA[u]
        print(f"   u={u}: {GAMMA[u]:.4f}*chi | {CU/u:.4f} | {CABS/u**2:.4f};  gamma*delta is the smallest only for chi < {min(x1, x2):.2f}")
    for u in (0.02, 0.0463):
        g = GAMMA[u]; rows = []
        for i in range(400):
            x = rng.standard_normal(12) * np.exp(0.8 * rng.standard_normal(12))
            r = G.evaluate(P, x[:6] + 1j * x[6:], u, "tilt"); rows.append(r)
        A = lambda k: np.array([r[k] for r in rows])
        chi, D, dl, C2, Ta, Tb, Bz = A("chi"), A("D"), A("dl"), A("C2"), A("T9a"), A("T9b"), A("Bz")
        Hh = np.array([H(u, d) for d in dl]); gd = g * dl
        assert np.all(Ta >= C2) and np.all(Tb >= C2) and np.all(Hh >= C2 * (1 - 1e-9))
        print(f"== tilt u={u}: 400 regenerated random cubics: chi in [{chi.min():.1f},{chi.max():.1f}], D/delta in [{(D/dl).min():.3f},{(D/dl).max():.3f}], C2/D max {np.max(C2/D):.4f}")
        print(f"   package's statistics:  T9/D min {np.min(Ta/D):.4f} median {np.median(Ta/D):.4f} max {np.max(Ta/D):.4f} (chi={chi[np.argmax(Ta/D)]:.1f}); "
              f"gamma*delta/D max {np.max(gd/D):.4f} (chi={chi[np.argmax(gd/D)]:.1f}); min(T9,gamma*delta)/D max {np.max(np.minimum(Ta, gd)/D):.4f} "
              f"(chi={chi[np.argmax(np.minimum(Ta, gd)/D)]:.1f}); T9 < gamma*delta on {100*np.mean(Ta < gd):.0f}%")
        for lo, hi in ((8, 16), (16, 24), (24, 43)):
            s = (chi >= lo) & (chi < hi)
            print(f"      chi in [{lo},{hi}): n={s.sum()}, T9/D max {np.max(Ta[s]/D[s]):.4f}, C2/D max {np.max(C2[s]/D[s]):.4f}, gamma*delta/D max {np.max(gd[s]/D[s]):.4f}, H/D max {np.max(Hh[s]/D[s]):.4f}, min(T9,H)/D max {np.max(np.minimum(Ta[s], Hh[s])/D[s]):.4f}")
        print(f"   with kappa = 1/2:      T9/D max {np.max(Tb/D):.4f}; min(T9,gamma*delta)/D max {np.max(np.minimum(Tb, gd)/D):.4f}; T9 < gamma*delta on {100*np.mean(Tb < gd):.0f}%")
        print(f"   against all proved bounds, H = min(gamma*delta, (19321/10^6)u, 1/2500):  H/D max {np.max(Hh/D):.4f} (chi={chi[np.argmax(Hh/D)]:.1f}); "
              f"min(T9,H)/D max {np.max(np.minimum(Tb, Hh)/D):.4f} (chi={chi[np.argmax(np.minimum(Tb, Hh)/D)]:.1f}); T9 < H on {100*np.mean(Tb < Hh):.0f}% of the cubics; "
              f"median of H/T9 {np.median(Hh/Tb):.2f}, largest H/T9 {np.max(Hh/Tb):.2f}")
        HB = np.minimum(Hh, Bz); assert np.all(Bz >= C2 * (1 - 1e-9))
        print(f"   plain Bessel bound Bz of the same law:  Bz/D min {np.min(Bz/D):.4f} median {np.median(Bz/D):.4f} max {np.max(Bz/D):.4f} (chi={chi[np.argmax(Bz/D)]:.1f}); "
              f"Bz < T9 on {100*np.mean(Bz < Tb):.0f}% of the cubics; median, smallest, largest Bz/T9: {np.median(Bz/Tb):.2f}, {np.min(Bz/Tb):.2f}, {np.max(Bz/Tb):.2f}; "
              f"min(H,Bz)/D max {np.max(HB/D):.4f} (chi={chi[np.argmax(HB/D)]:.1f}); min(T9,H,Bz)/D max {np.max(np.minimum(Tb, HB)/D):.4f}; T9 < min(H,Bz) on {100*np.mean(Tb < HB):.0f}%")
        for name, c in FAMILIES.items():
            r = G.evaluate(P, c, u, "tilt"); h = H(u, r["dl"])
            print(f"      {name:22s} chi={r['chi']:5.1f}: C2/D={r['C2']/r['D']:.4f}  T9/D={r['T9b']/r['D']:.4f}  gamma*delta/D={g*r['dl']/r['D']:.4f}  H/D={h/r['D']:.4f}  H/T9={h/r['T9b']:.2f}  Bz/D={r['Bz']/r['D']:.4f}  Bz/T9={r['Bz']/r['T9b']:.2f}")
    for path in sys.argv[2:]:
        if not os.path.exists(path): continue
        for key, rec in json.load(open(path)).items():
            u = float(key.split("|")[0]); c = np.array(rec["coef_re"]) + 1j * np.array(rec["coef_im"])
            r = G.evaluate(P, c, u, "tilt"); h = H(u, r["dl"])
            print(f"   search record '{key}': chi={r['chi']:.2f}  T9/D={r['T9a']/r['D']:.4f} (kappa=1/2: {r['T9b']/r['D']:.4f})  gamma*delta/D={GAMMA[u]*r['dl']/r['D']:.4f}  H/D={h/r['D']:.4f}  min(T9,H)/D={min(r['T9b'], h)/r['D']:.4f}  Bz/D={r['Bz']/r['D']:.4f}")

if __name__ == "__main__":
    main()
