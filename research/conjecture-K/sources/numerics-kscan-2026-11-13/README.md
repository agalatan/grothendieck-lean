<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/README.md (file dated 2026-11-13). Only this line was added. -->
# Global search for the content-to-deficit ratio (claude-b9ee, 13 Nov 2026)

Question: is sup C(q)^2/D(q) over all remote cubics q in H_{2,1}(C^n), ||q||^2 = u, really about 0.089 (peak row), as
CONJECTURE_K_MONOGRAPH.md claims from a small hill-climb, and does it grow with n? Thresholds: 0.10 (robust A+B route),
0.15, 0.24.

Method: `tables.py` (phi, g by quadrature on a grid in sqrt v), `kscan.py` (full Wick basis of H_{2,1}(C^n), dimension
n^2(n+1)/2; L-BFGS with analytic gradient on a Monte Carlo sample; every end point re-evaluated on 8 x 2^20 fresh
samples with a jackknife error). `kscan2.py` = same with restart 0 of every seed started next to the Wick monomial.
Calibration: phi(0) = 1.371879, g(0) = -0.835136, monomial 0.0878 +- 0.0004, template X(|Y|^2-1) 0.041, gradient equal
to finite differences to 9 digits. Run on the droplet mega, 28 processes.

Pass 1 (`out1/`, 840 runs, 2^20 samples for n <= 6, 2^19 for n = 8, 2^18 for n = 10), best re-evaluated ratio:

| u      | n=2    | n=3    | n=4    | n=5    | n=6    | n=8    | n=10   |
|--------|--------|--------|--------|--------|--------|--------|--------|
| 0.0463 | 0.0892 | 0.0888 | 0.0886 | 0.0885 | 0.0859 | 0.0780 | 0.0630 |
| 0.03   | 0.0803 | 0.0798 | 0.0795 | 0.0793 | 0.0765 | 0.0674 | 0.0503 |
| 0.02   | 0.0708 | 0.0704 | 0.0700 | 0.0697 | 0.0668 | 0.0557 | 0.0383 |

Errors +-0.0003 to +-0.0011. For n >= 6 the optimiser fitted sampling noise and stopped early (not converged).

Pass 2 (`out2/`, u = 0.0463, 2^22 samples): n = 6: 0.0854-0.0879 (12 runs); n = 8: 0.0850-0.0869 (6 runs); n = 10:
0.0828 and 0.0852 (2 runs; the two runs of the second n = 10 process did not report). Starts next to the monomial and
random starts end in the same range.

Reading: the maximum is 0.089 +- 0.001 at u = 0.0463, independent of n for n = 2..5 and consistent with that for
n = 6..10; all maximisers are close to the Wick monomial (fourth excess 30-40 against 42). The best values above the
monomial's 0.0878 (0.0892 at n = 2) are 2-3 standard errors and carry a selection bias (best of 50), so the size of
the excess over the monomial is not resolved here. Not tested: n > 10, and adversaries with a large diffuse
(nearly Gaussian) part, which need n large; the other two rows.
