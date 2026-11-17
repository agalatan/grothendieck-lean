<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-weak-2026-11-17/REVIEW.md (17 November 2026); claude-b9ee: the review of a Gemini answer to PROMPT_WEAK_BOUND_2026-11-17.txt, an answer that is not kept. Its checks/ are in code/third-chaos-2026-11-17/gemini-weak/checks/; its ../hjm-note-2026-11-17/ is ../hjm-note/ here (scripts in code/third-chaos-2026-11-17/hjm-note/); the prompt is not copied (INVENTORY). Only this line was added. -->
# Review of a Gemini answer to the weak-bound prompt (claude-b9ee, 17 Nov 2026)

The prompt: `../PROMPT_WEAK_BOUND_2026-11-17.txt` (target (T): E|F| <= sqrt(17/25) ||F||_2 = 0.8246211 ||F||_2 on the
real third chaos, every n). The answer was pasted by the user into the claude-b9ee session on 17 Nov 2026 (about
06:00 Bucharest); it is not kept verbatim. This file records its claims, the true values, and what survives.
Scripts: `checks/` (mpmath/numpy/scipy, `python3 -I checks/<name>.py`).

## Verdict

(T) is not proved. The answer retracts its own headline in line 2. Every numerical table in its "Certified Script
Output" that I recomputed is wrong, and wrong in a way that its own printed script does not produce (the script's
formulas are correct; the printed numbers are not its output).

## Claims and true values

| claim | printed | true | check |
|---|---|---|---|
| Thm 1: (E\|F\|)^2 <= 4/(7(cos^3(pi/7) - cos^3(3pi/7))) for all F in V_3(n) | 0.793278 | 0.7932777 (correct; max of the 7-point form over the 128 antiperiodic sign vectors is 4) | check1.py |
| Thm 2(a): (T) when the rank-1 correlation a >= 0.854; H_a(0) = E sqrt(a^2 h3^2 + 1 - a^2) at a = 0.854 | 0.8246005 | 0.7847177 (Monte Carlo 0.78465); H_a(1 - a^2) printed 0.81929, true 0.69913 | check2.py, check3.py |
| Thm 2(b) large kappa_4: (T) when kappa_4 >= 49.4 | - | the proof collapses in the text itself (it ends with kappa_4 >= 84.3 => a >= 0.862, weaker than the known kappa_4 >= 74) | - |
| Thm 2(b) small kappa_4: (T) when kappa_4 <= 0.032 (even 0.0446) | 0.819077 at 0.032 | two errors: E(F^2 - 1)^2 = kappa_4 + 2, not kappa_4; and int_0^inf s(1+s^2)^(-3/2) min(1, alpha s^2) ds = 2(sqrt(alpha^2 + alpha) - alpha), not half of it. Corrected threshold: kappa_4 <= 0.02684 | check3.py |
| Thm 2(c): sharp bound for all F in n <= 9 variables; (T) for n <= 12 (max_p Phi_n(p) = 0.78516, 0.79424, 0.80211, 0.80904, 0.81519 at n = 8..12) | as left | 0.80416, 0.81400, 0.82254, 0.83002, 0.83664: the sharp bound only for n <= 7 (as known); (T) for n <= 10 | check1.py |
| psi(4.727) | -0.354308 | -0.35433929... (Arb enclosure in the diagonal certificate) | - |
| Thm 2(d): exact transversals, multi-block sums | - | known (ledger 3.21 (e1), (e6) closure + (e2)) | - |

## What survives (all for the weak target (T) unless said otherwise)

1. Dimension-free: (E|F|)^2 <= 0.7932777, i.e. E|F| <= 0.8906614 ||F||_2, for every n (7-point circle rotation;
   Mehler on U cos(r pi/7) + V sin(r pi/7)). Optimising the kernel does not help: the linear program over all
   antiperiodic sign sequences on N equally spaced points gives 0.793278 at N = 7 and N = 21, and more at
   N = 9, 11, 13, 15, 17, 19 (0.8085, 0.8192, 0.8080, 0.8000, 0.7999, 0.7993). For degree 1 the same LP gives
   about 2/3 against the true 2/pi. So circle rotations cannot reach 0.68 (`checks/lp_circle.py`).
2. Rank-one, any direction v (no stationarity): with a = |E[F h3(<v,X>)]|, E|F| <= E sqrt(a^2 h3(W)^2 + 1 - a^2).
   The worst case over the remainder is the independent remainder: the bound is concave in the three remainder
   weights and both directional derivatives at that vertex are negative on a grid of a in [0.75, 0.97]
   (`checks/check4.py`; same as Prop. 4.3(b) of the HJM note in `../hjm-note-2026-11-17/`). Thresholds:
   (T) for a >= 0.79635; the sharp bound for a >= 0.83616 (the ledger's (e4) criterion needs a > 0.913 in the
   worst case).
3. Small kappa_4: E|F| <= sqrt(2/pi) (1 + (sqrt(2 kappa_4)/3) J), J = int_0^inf t(1+t^2)^(-3/2)
   min{1/2, (t^2/2) sqrt(kappa_4 + 2)} dt (closed form in check3.py), from the heat-flow identity, Cauchy-Schwarz,
   Var(|grad F|^2/3) <= (2/9) kappa_4, and Var(e^(-t^2 F^2/2)) <= min{1/4, (t^4/4) E(F^2 - 1)^2}. Gives (T) for
   kappa_4 <= 0.02684 (the prompt had about 0.004).
4. Small dimension: (T) for every F in at most 10 variables (great-circle slicing, max_p Phi_10 = 0.82254 < 0.82462;
   n = 11 gives 0.83002, so the method stops).

Status: 1 is P (exact algebra plus an exhaustive finite check); 2 and 4 are P + one-dimensional numerics (mpmath,
not interval arithmetic); 3 is P with a closed-form constant. None of them closes (T): the open set is
a(F) < 0.796, 0.027 < kappa_4 < 74, n >= 11, outside the classes of the ledger's row 3.21 (e).
