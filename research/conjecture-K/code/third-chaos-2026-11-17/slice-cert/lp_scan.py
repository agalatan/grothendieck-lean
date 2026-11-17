# claude-b9ee, 17 Nov 2026.  N-level information only (label N): floating LP value of the restricted rotation LP for
# several N, with the support of the optimal weights.  Not part of any certificate (lp_cert.py certifies N = 21, 31,
# 45, 61, 121).   Run:  python3 -I lp_scan.py      (needs numpy, scipy; imports lp_cert.py from this folder)
import sys, os, time
sys.dont_write_bytecode = True
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from lp_cert import restricted_patterns, solve_lp
for N in [21, 31, 41, 45, 51, 61, 75, 81, 91, 101, 121]:
    t0 = time.time(); K = (N - 1)//2
    S = restricted_patterns(N); v, w, mu, nu = solve_lp(N, S)
    nz = ', '.join('w_%d = %.5f' % (k + 1, w[k]) for k in range(K) if abs(w[k]) > 1e-6)
    print('N = %3d: LP value %.9f (sqrt %.6f), mu = %.1e, support: %s' % (N, v, v**0.5, mu, nz), flush=True)
