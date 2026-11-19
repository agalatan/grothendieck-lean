<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-weak2-2026-11-17/REVIEW2.md (17 November 2026); claude-b9ee: the review of the second Gemini answer to the weak-bound prompt, an answer that is not kept. Its checks/ are in code/third-chaos-2026-11-17/gemini-weak2/checks/. Only this line was added. -->
# Review of the second Gemini answer to the weak-bound prompt (claude-b9ee, 17 Nov 2026)

The long-chain-of-thought Gemini (no code environment; the user re-injected its earlier End-to-End exposition into
the prompt after a crash). Pasted by the user about 06:30 Bucharest; not kept verbatim. Its printed "certified
script output" was not produced by its script (it cannot run code): every number below was recomputed by
claude-b9ee with `checks/` (`python3 -I checks/<name>.py`). Target (T): E|F| <= sqrt(17/25) ||F||_2 = 0.8246211.

## Gems (verified; to be certified)

G4. Frequency split on great circles and a weighted circle lemma (its best idea).
- tau_3(n) = (n + 2)/(4(n - 1)): for Y a spherical harmonic of degree 3 on S^(n-1), the expected energy of the
  frequency-3 part of Y restricted to a Haar-random great circle is tau_3(n) ||Y||^2 (the rest is frequency 1).
  Proof: the form is O(n)-invariant on the irreducible H_3, so one test function suffices (Schur); for x1 x2 x3 the
  frequency-3 coefficient is (1/4) prod_j (U_j - i V_j), and E prod_j (U_j^2 + V_j^2) = 8/((n-1) n (n+4)) for a Haar
  2-frame (U, V) (E[V_3^2 | U] = (1 - U_3^2)/(n - 1)). Checks: tau_3(2) = 1, tau_3(3) = 5/8 (two methods), limit 1/4.
  Re-derived by claude-b9ee: P.
- Weighted lemma: for g in span{cos, sin, cos 3, sin 3} with frequency energies e1, e3 and gamma >= 8/9,
  ||g||_1^2 <= (8/pi^2)(1 + 1/(9 gamma))(e1 + gamma e3). Proof: Cauchy-Schwarz with weights against the sign
  pattern, and the one-cut pattern is optimal iff Q_gamma(x, y) = 9 gamma + (3 - 4x^2)(3 - 4(x^2 + xy + y^2)) >= 0,
  which holds for gamma >= 8/9 since max_{x in [0, sqrt3/2]} (3 - 4x^2)(2x + 1)^2 = 8 (at x = 1/2). P.
- Cross terms between the degree-1 and degree-3 parts vanish on average over circles (Schur, inequivalent
  irreducibles). Optimising gamma >= 8/9 per radius: with circle energies A (frequency 1) and B (frequency 3),
  E_Theta|F(R Theta)| <= (2 sqrt2/pi)(sqrt A + sqrt B/3) if A/B >= 64/9, else (3/pi) sqrt(A + 8B/9).
- Results (g134.py): harmonic cubics: a_n C_Stief(n), C_Stief(n) = sqrt((35n - 38)/(n - 1))/(2 pi):
  sharp for n <= 12 (n = 12: 0.797879668 < 0.797884561; exact rational check 55,807,046,895,600 <
  55,807,731,302,400 after pi cancels), (T) for n <= 15 (0.821876; n = 16: 0.828182).
  Full third chaos (max over p of the radial integral): sharp for n <= 8 (0.797093), (T) for n <= 11 (0.823670;
  n = 12: 0.830418). Gemini claimed harmonic sharp n <= 12 with 0.796448, (T) n <= 16; full chaos sharp n <= 10
  (0.797812), (T) n <= 14: all those numbers are wrong except the harmonic n = 12 conclusion.

G3. Rank-one with the dimension-free bound on the remainder: given W, E_W'|a h3(w) + w Q2 + R3| <=
min{ sqrt(a^2 h3^2 + b^2 w^2 + c^2), sqrt(a^2 h3^2 + b^2 w^2) + K c } with K = 0.8906614 (7-point bound). The worst
case is NOT b = 0: the t-derivative at t = 0+ is +infinity (near the zeros +-sqrt3 of h3 the K-branch is active and
sqrt(a^2 h3^2 + t w^2) - a|h3| integrates to about c t log(1/t)); the maximum sits near t = 1e-3 (correction by the
rank-one certification worker, 17 Nov: my grid t = s j/16 missed it, so my values 0.79264 / 0.83362 were too low).
Expected certified thresholds about 0.7931 for (T) and 0.8339 for the sharp bound (plain bound: 0.79635, 0.83616).
Gemini claimed 0.833 for (T).

G2. Eigenvalue squeeze: lambda_max(M) >= (1 + sqrt(2 Tr M^2 - 1))/2 when Tr M^2 > 1/2 (sum lambda = 1, lambda >= 0),
with Tr M^2 >= kappa_4/90 and a^2 >= 3 lambda_max - 2, so a(F)^2 >= (3 sqrt(kappa_4/45 - 1) - 1)/2. With G3 (a about 0.7931):
(T) for kappa_4 >= 70.5, the sharp bound for kappa_4 >= 73.6 (known: 74). P (algebra re-derived).

## False or unsupported

- Circle LP: "N = 11: OPT <= 0.783396, N = 19: 0.782328". Its own LP (odd m <= 61) gives 0.819186 and 0.799341,
  equal to the LP with all m (g5_lp.py): worse than N = 7 (0.793278). Fabricated output.
- "kappa_4 <= 0.0735" via Wasserstein-Lipschitz bounds on Var(e^(-s^2 F^2/2)): the method is valid but gives
  kappa_4 <= 0.0270 (I_* = 0.26646, printed 0.2520636). No gain over the simple 0.0268.
- "V_{S^1}(infinity) >= 7/9" (circle methods cannot reach 0.68): the proof in the text is not completed.

## Extension by claude-b9ee (lp_restricted.py)

For f = sign F, F in V_3, the sign pattern of F on the circle U cos phi + V sin phi is the sign of an odd
trigonometric polynomial of degree <= 3: at most 3 sign changes per half-turn. Restricting the inner maximum of the
rotation LP to those patterns is valid and gives (E|F|)^2 <= 0.790180 (N = 21), 0.790102 (31), 0.788158 (45),
0.787863 (N = 61), i.e. E|F| <= 0.88762 ||F||_2 for every n, levelling off near 0.787: rotation methods cannot
reach (T) (0.68) even with this restriction. N (floating-point LP; a certificate needs rational dual weights and an
exact check over the 36,051 patterns).
