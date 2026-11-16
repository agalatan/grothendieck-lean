"""Reviewer's evaluation of the ledger baselines and of the survey maximisers with the independent model (indep.py)."""
import sys, json, time, math
import numpy as np
sys.path.append(sys.argv[1])
import indep
pr = indep.Profiles()
S2 = math.sqrt(2)
def show(tag, r):
    dl, D = r["delta"], r["D"]
    s = f"{tag}: chi={r['chi']:.6f} C^2/D={r['C2']/D:.10f} deltaOmega/D={r['Omega']*dl/D:.8f} loss x{r['Omega']*dl/r['C2']:.3f} D={D:.10e} D/delta={D/dl:.6f} unproj/D={r['unproj']*dl/D:.5f}"
    if "thm3_relerr" in r:
        s += f"\n      checks: T3 {r['thm3_relerr']:.1e}, T2d {r['T2d_relerr']:.1e}, sum of 4 pairings {r['sum_ips_relerr']:.1e}; cosines " + ", ".join(f"{c:.3f}" for c in r["cosines"]) + f"; u_num-u={r['u_num']-U:.1e}"
    print(s, flush=True)
grids = [(40, 48), (64, 64), (96, 96)]
print("== ledger baselines at u = 0.0463 (6.4.2: monomial 0.087565304234; tau=0.1: 0.087576329175; best two-variable 0.08760259435) ==")
U = 0.0463
for name, c in [("monomial", [1, 0, 0, 0, 0, 0]), ("tau=0.1", [1, 0.1j / S2, 0, 0, 0, 0]), ("best 6.4.2", [1, (0.05283531218 + 0.22122669064j) / S2, 0, 0, 0, 0])]:
    for nL, nT in grids:
        gr = indep.Grid3(nL, nT); t0 = time.time()
        r = indep.analyse(pr, gr, c, U, "raw", full=False)
        print(f"  {name:12s} grid {nL}x{nL}x{nT}: C^2/D = {r['C2']/r['D']:.12f}   (D = {r['D']:.12e}, C^2 = {r['C2']:.12e})  [{time.time()-t0:.1f} s]", flush=True)
for mode in ("raw", "tilt"):
    d = json.load(open(sys.argv[2] + f"/survey_{mode}.json"))
    print(f"== survey maximisers, mode {mode} (delivered JSON) ==")
    for us, rr in d["results"].items():
        U = float(us); c = np.array(rr["argmax_re"]) + 1j * np.array(rr["argmax_im"])
        print(f" u={U}: delivered survey value {rr['max_projbound_over_D']:.6f}, C2/D there {rr['C2_over_D_there']:.6f}, chi {rr['chi_there']:.4f}")
        for nL, nT in grids:
            gr = indep.Grid3(nL, nT)
            for nK in ((60, 100) if (nL, nT) == grids[-1] else (80,)):
                r = indep.analyse(pr, gr, c, U, mode, nK=nK, full=True)
                show(f"   grid {nL}x{nL}x{nT} nK={nK}", r)
