<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/s2-constant-2026-11-17/REVIEW.md (17 November 2026); claude-b9ee: the review of a Gemini answer (not kept) to the prompt beside it. Its s2_check.py and s2_search.py are in code/third-chaos-2026-11-17/s2-constant/. Only this line was added. -->
# The L1/L2 constant of odd cubics on S^2: review of a Gemini answer (claude-b9ee, 17 Nov 2026, about 07:40)

Prompt: `PROMPT_S2_CONSTANT_2026-11-17.txt` (this folder). The answer (long-chain-of-thought Gemini, no code) is not
kept verbatim. Checks: `s2_check.py` (sympy exact identities; mpmath; a 4000 x 8000 grid on S^2) and `s2_search.py`
(global search), `python3 -I <script>`.

## What the answer proves (all re-checked)

Z1. Duality. C^2 = max over sign patterns sigma = sign(Y), Y in T, of ||P_1 sigma||^2 + ||P_3 sigma||^2, equal to the
    max over all measurable sigma with |sigma| <= 1; any maximiser is the sign of its own (weighted) projection. P.
Z2. Zonal theorem (every measurable odd zonal sigma with values in [-1,1], any number of bands). With s = z^2 the
    moments (alpha, beta) = (int_0^1 sigma z dz, int_0^1 sigma z^3 dz) range over a convex body whose extreme points
    are the single-switch patterns sigma_c(z) = sign(z(z^2 - c)) (Neyman-Pearson); the energy is convex in
    (alpha, beta), and on that family the exact identity
        ||P sigma_c||^2 - 55/64 = -c(1 - c)[17/64 + (7/16)(5c - 7/2)^2]
    holds (sympy: exact). Hence ||P sigma||^2 <= 55/64 for every zonal sigma, with equality only at +-sign(z). P.
Z3. Weighted zonal problem. F_{a,b}(c) - F_{a,b}(0) = c(1 - c)[-3/a + (7/(16b))(5c - 1)(6 - 5c)] (exact): the
    hemisphere is the unique zonal maximiser iff b/a > 175/192 (tie at b/a = 175/192 with c = 7/10); below that a
    three-band zonal cubic wins. P.
Z4. Global weighted theorem for b/a >= 7/2. The kernel of the weighted form is (3/a - 21/(2b)) t + (35/(2b)) t^3,
    nondecreasing on [-1,1] iff b/a >= 7/2; for an odd sign sigma = 2 1_D - 1 the form is 4 int int_{D x D} K, and
    Baernstein-Taylor cap symmetrisation (two-point polarisation) puts the maximum at the hemisphere. On S^(k-1):
    b/a >= (k+4)/2. P (citing Baernstein-Taylor, Duke 1976).
Z5. Strict local optimality of the hemisphere on S^2 (second variation). For nodal curves z = eps eta(phi), eta odd
    under phi -> phi + pi: modes m = 1 give 0 (rotations), m = 3 give -(5/8) eps^2 ||eta_3||^2, m >= 5 give
    -(45/16) eps^2 ||eta_m||^2; weighted: m = 3 gives (-3/(2a) + 7/(8b)), negative iff b/a > 7/12. P. Numerical check
    (sign(z(9 - 7z^2) + eps(x^3 - 3xy^2))): Delta = -6.132e-4, -1.537e-4, -3.844e-5 at eps = 0.4, 0.2, 0.1 against
    -(5/8) eps^2/162 = -6.173e-4, -1.543e-4, -3.858e-5.
Z6. Hemisphere on S^(k-1), every k >= 2: (P_1 + P_3) sign(u_k) is proportional to u_k(9 - (k+4) u_k^2) and
    ||P sign(u_k)||^2 = [2(k+2)(7k+1)/(3 pi k (k+1)^2)] (Gamma(k/2 + 1)/Gamma((k+1)/2))^2 -> 7/(3 pi). Checked for
    k = 2..8 (0.900633, 0.859375, 0.835787, 0.820313, 0.809320, 0.801086, 0.794681). For k >= 6 the projection changes
    sign near the poles, so the hemisphere is NOT optimal on S^(k-1) for k >= 6 (nor for H_1 + H_3 in Gaussian space,
    where (Pi_1 + Pi_3) sign(X_1) is proportional to X_1(9 - X_1^2)). P.
Z7. Exact values: ||P sign(xyz)||^2 = 105/(16 pi^2) = 0.664920; ||P sign(x^3 - 3xy^2)||^2 = 315/512 = 0.615234
    (grid: 0.664921, 0.615235). P.

## What is not proved
- The conjecture itself, C = sqrt(55)/8 over all (non-zonal) Y in T, and the weighted statement for
  175/192 <= b/a < 7/2. The answer reduces it to a one-dimensional slice functional with per-latitude Fourier
  constraints (a relaxation; whether it is tight is unknown) and leaves it as S.
- Numerical evidence (N): 300 random starts of the monotone iteration Y <- P sign(Y) on the 10-dimensional space all end
  at 0.9270 (the hemisphere orbit; refined on a fine grid 0.9270332 against sqrt(55)/8 = 0.9270248, grid error) or at
  the lower local maxima near 0.8974 (three-band type); nothing larger.

## Errors in the answer (corrected above)
- Its opening lines claimed a full proof by Baernstein symmetrisation and a hemisphere-optimal regime b/a >= 35/36,
  and "Task 3 proved for all k >= 3": all retracted in its own text (the kernel 35t^3/2 - 15t/2 is not monotone; the
  hemisphere fails for k >= 6). The section title "threshold b/a > 35/45 = 7/9" contradicts its own derivation (7/12).
  The prompt's "first lines" instruction caused the premature claims (that instruction is now removed).

## Value for us
- Z2 + Z5 + the search make sqrt(55)/8 very likely the S^2 constant; with it, slicing harmonic cubics by random 3-planes
  would give the sharp bound for n <= 13 and (T) for n <= 17 (plain constant; estimate from a_n), against 12 and 15 now.
  The weighted gain needs the global weighted theorem at b/a near 0.47 (the natural energy split), where already the
  zonal optimum is a three-band pattern (Z3), so the weighted S^2 route needs more than the hemisphere. Finite-dimensional
  only.
- A full proof of the conjecture looks feasible by computer: local second-order certificate around the hemisphere orbit
  (Z5 with explicit remainder) plus a covering of the rest of the unit sphere of T modulo SO(3) (dimension 6), where the
  other local maxima are below 0.898. Not started.
