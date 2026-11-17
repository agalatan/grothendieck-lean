<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/omega3-2026-11-17/REPORT.md (17 November 2026); a research worker of claude-b9ee, saved by claude-b9ee. Its work/ is in code/third-chaos-2026-11-17/omega3/work/ (without __pycache__/), and its logs/ is code/third-chaos-2026-11-17/omega3/raw-logs/ (a folder named logs/ is ignored by git here). Only this line was added. -->
# Omega_3 on the real third chaos: numerical test of the martingale-isoperimetric route

claude-b9ee research worker, 17 Nov 2026 (saved by claude-b9ee from the worker's hand-back; the harness did not let
the worker write this file). Labels: P proved (argument below), C certified (none here: no interval arithmetic),
N floating point (deterministic quadrature or Monte Carlo with error bars). Scripts in `work/`, raw outputs in `logs/`.

## Verdict
1. The derivation in README.md is correct (P), including t -> 1. Corrected h3 values: B = 0.772382 (not 0.7721),
   R = 0.789804, Cov = -0.020151 (the README's uniform t-grid gave E Wbar = 0.9996).
2. No counterexample (N). Cov(Wbar, Gamma) < 0 for about 200 P: F_N up to N = 300, diagonal sums, the whole
   two-variable chaos, the bath family, e3(N), Fano, random multilinear cubics, mixtures with CLT sums. Away from the
   Gaussian limit the maximum found is h3: Cov = -0.02015, R = 0.78980 = 0.98987 sqrt(2/pi). h3 is a strict local
   maximum in every direction tested (two-variable chaos, deterministic: Cov = -0.02015 - 0.33a^2 along x1 He2(x2),
   -0.39a^2 along h3(x2); also the x1x2x3 and x1(He2 +- He2) directions, the bath corner, and e3(N) -> h3(mean) from
   below: -0.127, -0.075, -0.044 at N = 10, 20, 40).
3. Near the Gaussian (P formal, N check): for P_eps = eps P + sqrt(1 - eps^2) Z, Z the third-chaos Gaussian limit,
   Cov = -K_P eps^4 + O(eps^6 log 1/eps), K_P = alpha E_2 + beta E_4, E_2 = 432 ||T (x)_2 T||^2, E_4 = 648 ||T (x)~_1 T||^2,
   alpha = 11/8 - (3/4) ln 3 - sqrt3 pi/12 = 0.097591, beta = 11/20 - (3/4) ln 3 + sqrt3 pi/12 = 0.179491; hence
   (alpha/3) kappa_4 <= K_P <= (beta/3) kappa_4 and R = sqrt(2/pi)(1 - K_P eps^4/2 + ...). For h3,
   K = 132/5 + sqrt3 pi/2 - (45/2) ln 3 = 4.401923 (Gemini's local-optimality claim holds with c_P = sqrt(2/pi) K_P/2).
4. The scale-by-scale condition is false: for h3, c(t) = Cov(I(N_t), Gamma)/mu(t) > 0 on 0.31 < t < 0.66. Only the
   integrated Omega_3 can hold.
5. Route: viable (no obstruction found) but not easier than (C_3): the margin vanishes at the Gaussian, the scale-wise
   form fails, and the t -> 1 end needs S(P) <= 1 (section 6).

## 1. Derivation (P)
- M_t = t^(d/2) P(B_t/sqrt t) and S_t = N_t(B_t/sqrt t) are L^2 martingales from 0, so
  E|P| = int_0^1 t^((d-2)/2) E<grad P, grad N_t> dt.
- Ito on I(S_t) (valid for t < 1; I I'' = -1/4): mu'(t) = -(1/(8t)) E[|grad N_t|^2/I(N_t)].
- Cauchy-Schwarz with weight I(N_t) gives B; Cauchy-Schwarz in t with int (-mu') mu = (mu(0)^2 - mu(1-)^2)/2 = 1/(4 pi)
  gives R; mu(1-) = 0 by dominated convergence (I(+-1) = 0).
- The end t -> 1: at a regular point at signed distance r from {P = 0}, I(N_t) ~ phi(r/sqrt(1-t)); so
  mu(t) ~ sqrt(1-t) Per_gamma({P > 0}), I(N_t)/mu(t) tends to the normalised Gaussian surface measure, and
  c(t) -> S(P) - 1 with S(P) = E[Gamma^(3/2) | P = 0]/E[Gamma^(1/2) | P = 0] (the average of Gamma over the Gaussian
  surface measure of {P = 0}); this is not g_P(0) = E[Gamma | P = 0] as the README says.
- Wbar <= C int (1-t)^(-1/2) dt < infinity, and the integrand of B is bounded at t = 1.
- Equality case: d = 1, P = X: B = R = E|X| (checked to 1e-12).

## 2. Methods and error control
- t-grid: Gauss-Legendre in v with t = 1 - (1-v)^2; nv = 16-48 agree to 1e-6 for h3; F_10: -0.1213(30) at nv = 20,
  -0.1265(31) at nv = 28.
- Deterministic codes: `h3_1d.py` (mu' two independent ways, agreement 1e-7); `bath_limit.py` (limit family
  a h3(X) + bXY + cZ with Y, Z moving at OU rates 2 and 3; converged to 1e-6); `det2d.py` (any P in two variables;
  reproduces h3 to 1e-6, about 1e-4 near h3; inaccurate when the h3(x1) coefficient is <~ 0.1; the one affected point
  recomputed in the swapped frame: -0.02228, not -0.0112).
- Nested Monte Carlo (`omega3lib.py`): N_t Rao-Blackwellised along grad P(sqrt t x) with the exact Gaussian mass of a
  cubic on the line (tested on 2000 cubics, to 2e-5); 32 antithetic inner pairs, common random numbers across t;
  concavity bias of I removed by a delete-one-pair jackknife (F_2 per-point bias -4.5e-4 raw, +7e-5 jackknifed at
  M = 64; F_4: M = 64 vs 256 give -0.1472(52) vs -0.1446(52)); outer SE by linearisation; control variates (h3 near
  h3, h3(mean) for e3(N)). Monte Carlo B values are noisy (a few slightly exceed R, by less than one SE);
  deterministic B values are good to 1e-5.

## 3. Results (sqrt(2/pi) = 0.797885)
| P | n | E\|P\| | B | R | Cov +- SE | method |
|---|---|---|---|---|---|---|
| X (d=1) | 1 | 0.797885 | 0.797885 | 0.797885 | 0 | exact |
| h3 | 1 | 0.616460 | 0.772382 | 0.789804 | -0.020151 (1e-6) | 1-D quadrature |
| F_2 / F_3 / F_4 / F_6 | 2-6 | 0.6042 / 0.6271 / 0.6388 / 0.6595 | 0.724-0.740 | 0.7364 / 0.7401 / 0.7368 / 0.7372 | -0.148(7) / -0.140(6) / -0.147(5) / -0.146(4) | nested MC |
| F_10 / F_20 / F_50 | | 0.6865 / 0.7203 / 0.7565 | 0.744 / 0.758 / 0.774 | 0.7479 / 0.7567 / 0.7756 | -0.121(3) / -0.101(2) / -0.0551(12) | nested MC |
| F_100 / F_300 | | 0.7739 / 0.7887 | 0.783 / 0.792 | 0.7847 / 0.7927 | -0.0328(8) / -0.0129(6) | nested MC |
| eps h3 + sqrt(1-eps^2) Z, eps = 0.02 / 0.05 / 0.1 | limit | 0.797884 / 0.797868 / 0.797673 | = R | 0.797884 / 0.797875 / 0.797768 | -6.854e-7 / -2.385e-5 / -2.929e-4 | deterministic |
| same, eps = 0.2 / 0.3 / 0.5 | limit | 0.795742 / 0.790511 / 0.766362 | 0.79677 / 0.79425 / 0.78382 | 0.79677 / 0.79426 / 0.78398 | -0.002781 / -0.009058 / -0.034546 | deterministic |
| bath, 44 points of the (p,q) triangle | limit | 0.618-0.796 | | 0.733-0.797 | all in [-0.155, -0.0021] | deterministic |
| bath (0.98,0) / (0.97,0.01) / (0.95,0.02) / (0.95,0) / (0.9,0) | | 0.6184 / 0.6176 / 0.6180 / 0.6216 / 0.6287 | 0.7725 / 0.7704 / 0.7675 / 0.7677 / 0.7614 | 0.7890 / 0.7862 / 0.7819 / 0.7818 / 0.7721 | -0.0221 / -0.0291 / -0.0397 / -0.0399 / -0.0637 | deterministic |
| diagonal sums, 17 weight vectors | 2-6 | 0.606-0.650 | | 0.737-0.783 | -0.036 ... -0.141 (SE 0.006-0.013) | nested MC |
| two-variable chaos, 78 points + fine axes | 2 | 0.49-0.63 | | max 0.78975 | max -0.02028 (0.02 from h3); al >= 0.5: <= -0.0665 | deterministic |
| h3 +- x1 He2(x2) paths, 13 points | 2 | | | | +-0.1: -0.0247 / -0.0225; +-0.5: -0.075 / -0.099; pi/2: -0.228 | MC + h3 control |
| cos h3 + sin x1x2x3, th = 0.2 / 0.5 | 3 | 0.6140 / 0.6037 | | 0.7849 / 0.7586 | -0.0324(14) / -0.0961(31) | MC + control |
| cos h3 + sin x1(He2(x2) +- He2(x3))/2 | 3 | | | | -0.034, -0.033, -0.066, -0.071, -0.047 | MC + control |
| X1X2X3 | 3 | 0.5075 | 0.608 | 0.6461 | -0.344(10) | nested MC |
| e3(4..8) | 4-8 | 0.545-0.586 | | 0.682-0.738 | -0.270, -0.209, -0.187, -0.173, -0.144 (about 0.01) | nested MC |
| e3(10) / e3(20) / e3(40) | | 0.5919 / 0.6040 / 0.6098 | | 0.7454 / 0.7674 / 0.7803 | -0.127(5) / -0.0749(36) / -0.0435(27) | MC + h3(mean) control |
| Fano / Fano with one sign flipped | 7 | 0.6120 / 0.6441 | | 0.6966 / 0.7207 | -0.238(6) / -0.184(5) | nested MC |
| random multilinear, 3 cases | 6 | 0.586-0.597 | | 0.694-0.698 | -0.243, -0.236, -0.237 | nested MC |
| eps Q + sqrt(1-eps^2) F_30 (Q = h3, x1x2x3, x1He2(x2)) | 31-33 | 0.644-0.734 | | 0.762-0.768 | -0.074 ... -0.087 | nested MC |

## 4. The eps^4 term
With u = t^(3/2) z/sqrt(1-t^3), b = c sqrt(1-t^3) and V_t = T_{sqrt t}(P^2):
I(N_t) = phi(u)[1 - eps u t^(3/2) P/b + (eps^2/(2b^2))(u^2 V_t - t^3 P^2)] + O(eps^3). Odd orders in eps are odd in z;
E_z phi(u) = sqrt(1-t^3)/sqrt(2 pi), E_z u^2 phi(u) = t^3 sqrt(1-t^3)/sqrt(2 pi). Scale-wise:
Cov(I(N_t), Gamma)/mu(t) = -(eps^4 t^3/(2(1-t^3))) sum_{k=2,4} (1 - t^(k/2)) E[J_k(P^2) J_k(Gamma_P)] <= 0.
Chaos components (P = I_3(T)): J_2(P^2) = 18 I_2(T (x)_2 T), J_2(Gamma) = 12 I_2(T (x)_2 T), J_4(P^2) = 9 I_4(T (x)~_1 T),
J_4(Gamma) = 3 I_4(T (x)~_1 T); so E_2, E_4 >= 0 and kappa_4 = 3(E_2 + E_4). The expansion fails only in the layer
1 - t < eps^2 (contribution O(eps^6)); the bound on the rest of the remainder is a sketch. At t = 1:
S - 1 = -(eps^4/12)(2E_2 + 4E_4) (-8 eps^4 for h3; direct surface integral: -6.89, -5.24, -3.08 times eps^4 at
eps = 0.05, 0.1, 0.2). Deterministic check: Cov/eps^4 = -4.2838, -3.8165, -2.9290, -1.7382, -1.1183, -0.5527 at
eps = 0.02, 0.05, 0.1, 0.2, 0.3, 0.5 (K = 4.401923); N Cov(F_N) = -2.01, -2.75, -3.28, -3.88 at N = 20, 50, 100, 300.
Remainder O(eps^6 log 1/eps) with a constant of about +75.

## 5. Scale-wise sign
- Coarse scales (P): c(t) = -(t/(8 phi(0)^2)) Cov(<v,X>^2, Gamma) + O(t^2), Cov(<v,X>^2, Gamma) =
  24 sum_{c,d} (sum_a v_a T_acd)^2 >= 0, v = E[sign(P) X]; so c(t) = -6 pi t ||T(v,.,.)||^2 + O(t^2) (h3: slope -0.611
  predicted, -0.602 by quadrature at t = 0.0027).
- h3 (deterministic): c(t) < 0 for t < 0.31, > 0 on (0.31, 0.66) (max +0.0179 at t = 0.49), < 0 afterwards, tending
  to -0.0372 = S - 1.
- e3(10): about +0.02 on (0.45, 0.85); F_2 and F_4: tiny positive values near t = 0.25-0.33; the eps-model and the bath
  points are negative at all t.

## 6. The t -> 1 end, S(P) - 1
Kernel estimates in P (h -> 0 by Richardson; biased upwards at singular points of the nodal set): h3 -0.031 (exact
-0.0372); F_2 / F_4 / F_10: -0.36 / -0.27 / -0.22; X1X2X3 -0.62 (exact -2/3); Re(z^3) -0.54 (exact -5/8); Fano -0.42;
e3(4..7) -0.51 ... -0.31; 42 random multilinear cubics, n = 3-10: -0.28 ... -0.63; 12 random general tensors,
n = 2-4: -0.14 ... -0.40. So S < 1 everywhere, maximum 0.963 at h3. Near the Gaussian,
S - 1 = -kappa_4/6 + Var(Gamma)/2 <= -kappa_4/18.

## 7. Assessment
- Viable: R <= 0.78980 away from the Gaussian; R -> sqrt(2/pi) from below only as kappa_4 -> 0, with deficit
  sqrt(2/pi) K_P eps^4/2, about 0.4-0.7 of the deficit of E|P|.
- Not a shortcut: the margin vanishes at the Gaussian, the scale-wise form is false, the t -> 1 end needs S(P) <= 1.
- Classes where a proof looks reachable: (1) mixing rays eps P + Gaussian bath (explicit negative leading term; a
  uniform remainder bound gives Omega_3 for eps < eps_0(P); all small-kappa_4 P needs a joint Edgeworth expansion);
  (2) conditionally Gaussian forms (a low-dimensional inequality Arb could certify; (C_3) already known there);
  (3) n = 2 (certifiable; (C_3) already known for n <= 7). None reaches the open window (n >= 8,
  0.027 < kappa_4 < 74), where Omega_3 holds numerically (F_N, e3(8..20): Cov from -0.013 to -0.15) without a known
  mechanism.

## 8. Differences from the brief
Gaussian check on X in the first chaos (d = 1); bath family as the limit model, computed deterministically; random
multilinear cubics with n = 8, 10: screen only; 6 of the 26 bath points in the second pass not run.
