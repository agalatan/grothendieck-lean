# profile one enriched-class oracle point and one plain LP point (N); used for "Where the time went"
import time, cProfile, pstats, io, numpy as np, s0core as C, enriched as En, oracles as O
eng = C.Engine(0.8493, 0.2827); p = [0.125, 0.0125, -0.0025, -0.0025]; rho = O.rho_fn("KOUL3")
E = En.Enriched(third=True); E.settings.verbose = False; rv = np.sqrt(E.v)
def one():
    t0 = time.time(); f = eng.psi(p, 0.77 * rv, 0.0); t1 = time.time(); o = E.solve(f, 6.0, rho(6.0)); t2 = time.time()
    return t1 - t0, t2 - t1
print("atoms", len(E.v)); print("psi %.3fs  conic %.3fs" % one())
pr = cProfile.Profile(); pr.enable(); one(); one(); pr.disable()
s = io.StringIO(); pstats.Stats(pr, stream=s).sort_stats("tottime").print_stats(14); print(s.getvalue())
