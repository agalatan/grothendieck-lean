<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-log-2026-11-17/diag/PROOF_DIAGONAL.md (17 November 2026); a research worker of claude-b9ee. Its scripts, logs and data ("this folder") are in code/third-chaos-2026-11-17/diag/, and its ../REVIEW.md is ../gemini-review/REVIEW.md here. Only this line was added. -->
# Sharp L1-L2 bound for diagonal sums in the real third chaos: complete proof
claude-b9ee research worker, 17 Nov 2026, 04:40 (Europe/Bucharest). STATUS: COMPLETE (P + C).
PROVED: for every n >= 1 and every unit vector lambda in R^n, E|sum_i lambda_i h3(X_i)| < sqrt(2/pi), h3 = (x^3 - 3x)/sqrt6, X_i i.i.d. N(0,1).
Equality holds for no finite n. The constant is sharp: lambda = (1,...,1)/sqrt n gives E|S| -> sqrt(2/pi).
Labels: P = proved by hand below. C = rigorous computation in arb ball arithmetic (python-flint 0.9.0), replayed by the scripts in this folder, with logs.
No floating-point evaluation is a proof step. Files n0*_N.py are design numerics only.
STILL MISSING: nothing for the statement. Not done: an independent re-derivation by a second reviewer, and a Lean formalisation.
IDEA: write sqrt(2/pi) - E|S| as a Fourier integral, split it at t = (29/10)/max_i lambda_i, and use an envelope |psi(u)| <= e^{-c(u)u^2} with c nonincreasing.
That envelope makes the tail bound dimension-free. Everything reduces to one inequality in kappa = (1 - M^2)/M^2: it is certified on [0, 8] and proved by hand on [8, inf).
Neither Gemini log is used (their window closing rests on a wrong constant, see ../REVIEW.md). Their induction for max lambda_i >= 37/50 is not needed either.

## Theorem

Let n >= 1, let X_1, ..., X_n be independent standard Gaussians, h(x) = (x^3 - 3x)/sqrt6 (so E h(X)^2 = 1), let lambda in R^n with
sum lambda_i^2 = 1, and let S = sum_i lambda_i h(X_i). Then

    E|S| < sqrt(2/pi) = E|Z|,  Z ~ N(0,1).

Equivalently, E|P| < sqrt(2/pi) ||P||_2 for every nonzero P = sum_i a_i He3(x_i), He3(x) = x^3 - 3x: the diagonal elements of
the real third Wiener chaos, in every dimension.

## 0. Notation and reductions (P)

- psi(u) := E e^{i u h(X)} = E cos(u h(X)), X ~ N(0,1). It is real because h is odd.
- g(u) := psi(u) - e^{-u^2/2}.
- By independence, phi_S(t) := E e^{itS} = prod_i psi(lambda_i t).
- Changing the sign of lambda_i does not change the law of S (h(-x) = -h(x), X_i symmetric). Zero coordinates can be dropped. So assume
  lambda_1 = M >= lambda_2 >= ... >= lambda_n > 0, and put kappa := (1 - M^2)/M^2 in [0, inf).
- The certificate's constants:
  - u1 := 29/10 (end of the bulk), u_a := 1/5;
  - the grid u_k := k/1000 for 200 <= k <= 40000, step delta := 1/1000;
  - L := 632/1024 (a Lipschitz constant).

## 1. Fourier formula (P)

For every real random variable Y, E|Y| = (2/pi) int_0^inf (1 - Re E e^{itY}) t^{-2} dt, both sides in [0, inf].

Proof:
1. For real y, int_0^inf (1 - cos(ty)) t^{-2} dt = |y| int_0^inf (1 - cos s) s^{-2} ds = (pi/2)|y|. The last integral equals
   int_0^inf (sin s)/s ds = pi/2, integrating by parts once.
2. Take expectations and exchange them with the t-integral by Tonelli; the integrand is >= 0.

For Y = Z and Y = S both sides are finite, so subtracting gives

    sqrt(2/pi) - E|S| = (2/pi) Delta(lambda),   Delta(lambda) := int_0^inf (phi_S(t) - e^{-t^2/2}) t^{-2} dt.   (1.1)

It remains to show Delta(lambda) > 0.

## 2. Facts about psi

**(a) Lipschitz bound (P, constant C).**
- psi is even, |psi| <= 1, and psi'(u) = -E[h(X) sin(u h(X))] by dominated convergence (|h| is integrable).
- Hence |psi(u) - psi(v)| <= E|h(X)| |u - v|, and the same for |psi|.
- E|h(X)| = (1 + 4e^{-3/2})/sqrt(3 pi). Proof: (1 - x^2)e^{-x^2/2} is an antiderivative of (x^3 - 3x)e^{-x^2/2}. So
  int_0^{sqrt3} (3x - x^3)e^{-x^2/2} dx = 1 + 2e^{-3/2} and int_{sqrt3}^inf (x^3 - 3x)e^{-x^2/2} dx = 2e^{-3/2}. Then
  E|h| = (2/(sqrt6 sqrt(2 pi)))(1 + 4e^{-3/2}).
- Numerically E|h(X)| = 0.6164602258814... < L = 632/1024 (C, c00_exact.log). The closed form agrees with a rigorous integration.

**(b) Near u = 0 (P; the moments C, exact).**
- Moments (c00, exact): E h^2 = 1, E h^4 = 93, E h^6 = 53745, from E X^{2k} = (2k-1)!!.
- For real z, 1 - z^2/2 + z^4/24 - z^6/720 <= cos z <= 1 - z^2/2 + z^4/24 (the alternating Taylor bounds).
- For x >= 0, e^{-x} <= 1 - x + x^2/2.
- Hence, for 0 <= u <= 1/5:

      g(u) >= (93/24 - 1/8) u^4 - (53745/720) u^6 = u^4 (15/4 - (3583/48) u^2) >= (917/1200) u^4 > 0,   (2.1)
      0 < psi(u) <= 1 - u^2/2 + (31/8) u^4 <= 1 - u^2/5 <= e^{-u^2/5}.                              (2.2)

  The bracket in (2.1) equals 917/1200 at u = 1/5. In (2.2), (31/8)u^2 <= 31/200 <= 3/10, and psi > e^{-u^2/2} > 0 by (2.1).

**(c) Contour bound (P; the value C).**
- Let f(z) = e^{iuh(z)} e^{-z^2/2}/sqrt(2 pi). It is entire, and psi(u) = int_R f(x) dx.
- Let Gamma be the path z(x) = x + i eta(x), eta(x) = (min(x^2, 25/4) - 1)/2. It passes through the two saddle points ±1 of h, in
  their steepest-descent directions.
- Im h(z(x)) = eta (3x^2 - eta^2 - 3)/sqrt6 >= 0 on Gamma:
  - for |x| <= 5/2, 3x^2 - 3 = 6 eta, so Im h = eta^2 (6 - eta)/sqrt6 >= 0, since eta <= 21/8 < 6;
  - for |x| >= 5/2, eta = 21/8 and 3x^2 - eta^2 - 3 >= 75/4 - 441/64 - 3 = 567/64 > 0.
- Cauchy's theorem applies. On the vertical sides {±R + is : 0 <= s <= 21/8}, Im h = s(3R^2 - s^2 - 3)/sqrt6 >= 0, so
  |f| <= e^{-(R^2 - (21/8)^2)/2} -> 0. Hence psi(u) = int_Gamma f dz, and

      |psi(u)| <= Bnd(u) := int_R e^{-u Im h(z(x))} e^{-(x^2 - eta(x)^2)/2} |z'(x)| dx / sqrt(2 pi),

  with |z'| = sqrt(1 + x^2) for |x| < 5/2 and 1 beyond.
- Bnd is nonincreasing in u, because Im h >= 0 on Gamma.
- Bnd(40) = 0.12388345816158... (C, c02_bnd.log, by acb.integral). The tails |x| > 8 are bounded by e^{(21/8)^2/2} erfc(8/sqrt2).
- For orientation (not used): sqrt(u) Bnd(u) decreases from 0.93 to the stationary-phase constant (8/3)^{1/4} e^{-1/2} = 0.7751.

**(d) Grid enclosures (C) and cell bounds (P).**
- c01_psi_grid.py encloses psi(u_k) for k = 200, ..., 40000. It uses psi(u) = 2 int_0^8 cos(u h(x)) phi(x) dx + E with
  |E| <= erfc(8/sqrt2) < 1.3e-15; the integral is computed by arb's acb.integral, which is rigorous for integrands analytic
  near the segment.
- The largest radius is 6.3e-15.
- Every 10th point was recomputed through the contour Gamma, an independent integrand. The 3,981 pairs of enclosures all overlap.
- Write Psi-_k <= psi(u_k) <= Psi+_k and A_k >= |psi(u_k)| (endpoints of the computed balls). By (a), on each cell
  [u_k, u_{k+1}]:

      psi(u) >= min(Psi-_k, Psi-_{k+1}) - L delta/2,     |psi(u)| <= P_k := max(A_k, A_{k+1}) + L delta/2.     (2.3)

  Proof: psi(u) >= psi(u_k) - L(u - u_k) and psi(u) >= psi(u_{k+1}) - L(u_{k+1} - u). The larger of the two is at least their
  mean, which is at least min - L delta/2. The same argument applies to |psi|.

**(e) Consequences.**
- **(F1) g(u) > 0 for 0 < u <= 29/10.**
  - On (0, 1/5] by (2.1).
  - On [1/5, 29/10] (C): on each of the 2,700 cells, g >= G_k := min(Psi-_k, Psi-_{k+1}) - L delta/2 - e^{-u_k^2/2}, by (2.3) and
    the monotonicity of e^{-u^2/2}. All G_k > 0; the smallest is 0.0031161 (c03_main.log).
- **(Envelope) A nonincreasing function c > 0 with |psi(u)| <= e^{-c(u) u^2} for every u > 0.**
  - c(u) := 1/5 on (0, 1/5]. This is valid by (2.2).
  - c(u) := C_k on (u_k, u_{k+1}] for 200 <= k < 40000. Here C_199 := 1/5 and C_k := min(C_{k-1}, c^_k), where c^_k is a dyadic
    number below -log(P_k)/u_{k+1}^2.
  - c03 certifies e^{-C_k u_{k+1}^2} > P_k on every cell. Then |psi(u)| <= P_k < e^{-C_k u_{k+1}^2} <= e^{-C_k u^2} on the cell.
  - c(u) := min(C_last, beta/u^2) for u > 40, with C_last = C_39999 = 0.0013386916677... and beta = 2.0884140078519833.
    c03 certifies e^{-beta} > Bnd(40), so |psi(u)| <= Bnd(40) < e^{-beta} <= e^{-c(u)u^2} there.
  - So c is a nonincreasing step-then-smooth function with c > 0 everywhere. Sample values (c03_main.log):
    - c(u) = 1/5 on (0, 2.9];
    - c(3.5) = 0.1445, c(4) = 0.0774, c(4.727) = 0.0464, c(6) = 0.0408;
    - c(10) = 0.0170, c(20) = 0.0044, c(40) = 0.0013.

## 3. Reduction to one variable (P)

**Lemma 3.** For lambda as in Section 0,

    Delta(lambda) >= M (b(kappa) - tau(kappa)),
    b(kappa)   := int_0^{u1} g(u) e^{-kappa u^2/2} u^{-2} du,
    tau(kappa) := int_{u1}^inf ( |psi(u)| e^{-kappa c(u) u^2} + e^{-(1+kappa) u^2/2} ) u^{-2} du.

Proof. Split (1.1) at t = u1/M.

*Bulk, 0 < t <= u1/M.*
- Every lambda_i t is in (0, u1], so a_i := psi(lambda_i t) >= b_i := e^{-lambda_i^2 t^2/2} > 0 by (F1).
- Telescoping:

      prod a_i - prod b_i = sum_k (a_k - b_k) prod_{i<k} b_i prod_{i>k} a_i >= (a_1 - b_1) prod_{i>1} b_i.

  Every term is >= 0, and in the first term prod_{i>1} a_i >= prod_{i>1} b_i.
- So phi_S(t) - e^{-t^2/2} >= g(Mt) e^{-(1 - M^2) t^2/2} >= 0.

*Tail, t > u1/M.*
- phi_S(t) - e^{-t^2/2} >= -|psi(Mt)| prod_{i>=2} |psi(lambda_i t)| - e^{-t^2/2}.
- Since lambda_i t <= Mt and c is nonincreasing, |psi(lambda_i t)| <= e^{-c(lambda_i t) lambda_i^2 t^2} <= e^{-c(Mt) lambda_i^2 t^2}.
- Hence prod_{i>=2} |psi(lambda_i t)| <= e^{-c(Mt)(1 - M^2) t^2}. This is the step that makes the bound independent of n and of
  the shape of lambda.

*Change of variables.* Substitute u = Mt: t^{-2} dt = M u^{-2} du, (1 - M^2) t^2 = kappa u^2, t^2 = (1 + kappa) u^2. The bulk
integral is >= M b(kappa) and the tail integral is >= -M tau(kappa).

All integrands are of one sign and integrable: g(u) = O(u^4) at 0, and the tail integrand is bounded times u^{-2}. ∎

## 4. b(kappa) > tau(kappa) for every kappa >= 0 (C on [0, 8], P + C on [8, inf))

Both functions are nonincreasing in kappa: g >= 0 on [0, u1] by (F1), and c >= 0.

**Bounds used on [0, 8] (P, given Section 2).**

    b(kappa)   >= B(kappa) := sum_{k=200}^{2899} G_k e^{-kappa u_{k+1}^2/2} (1/u_k - 1/u_{k+1}) + (917/450000) e^{-kappa/50},
    tau(kappa) <= T(kappa) := sum_{k=2900}^{39999} P_k e^{-kappa C_k u_k^2} (1/u_k - 1/u_{k+1})
                              + e^{-beta} U_tail^kappa / 40 + e^{-(1+kappa) u1^2/2} / ((1+kappa) u1^3),

with U_tail := max(e^{-C_last 40^2}, e^{-beta}) = 0.123883. Where each term comes from:
- the cells of b: (F1) and (2.3), with e^{-kappa u^2/2} >= e^{-kappa u_{k+1}^2/2} on a cell;
- the term 917/450000 = (917/1200)(1/375): (2.1) on (0, 1/5], with e^{-kappa u^2/2} >= e^{-kappa/50};
- the cells of tau: (2.3) and c = C_k on the cell;
- u > 40: |psi| <= Bnd(40) < e^{-beta}, e^{-c(u)u^2} <= U_tail, and int_40^inf u^{-2} du = 1/40;
- the last term: int_{u1}^inf e^{-(1+kappa)u^2/2} u^{-2} du <= u1^{-2} e^{-(1+kappa)u1^2/2}/((1+kappa)u1) (Mills).

**Certified partition of [0, 8] (C).** With kappa_j = j/20 and B(kappa_{j+1}) > T(kappa_j) for j = 0, ..., 159, monotonicity gives
b(kappa) >= B(kappa_{j+1}) > T(kappa_j) >= tau(kappa) on [kappa_j, kappa_{j+1}]. Values (c03_main.log):
- smallest margin B(kappa_{j+1}) - T(kappa_j): 0.04120, at kappa_j = 7.95;
- kappa = 0: B = 0.31137, T = 0.06157;
- kappa = 1: B = 0.17264, T = 0.01513;
- kappa = 8: B = 0.04121, T = 4.1e-6.

**kappa >= 8 (P + C).**
- Let U* := sup_{u >= u1} e^{-c(u)u^2} <= max(max_{k >= 2899} e^{-C_k u_k^2}, U_tail) <= 0.354804 (C).
- By (F1) and (2.1), b(kappa) >= (917/450000) e^{-kappa/50}.
- Since |psi| <= 1, tau(kappa) <= U*^kappa / u1 + Gamma(kappa), with Gamma(kappa) := e^{-(1+kappa)u1^2/2}/((1+kappa)u1^3).
- Both U* e^{1/50} < 1 (C) and e^{-u1^2/2} < e^{-1/50}, so (U*^kappa/u1 + Gamma(kappa)) e^{kappa/50} is nonincreasing in kappa.
- At kappa = 8: (917/450000) e^{-8/50} = 0.0017365 > 8.66e-5 >= U*^8/u1 + Gamma(8) (C).
- So b(kappa) > tau(kappa) for all kappa >= 8. ∎

## 5. Conclusion

By Lemma 3 and Section 4, Delta(lambda) >= M (b(kappa) - tau(kappa)) > 0, so E|S| < sqrt(2/pi) by (1.1), for every n and every
unit lambda. ∎

Quantitative by-product: if max_i |lambda_i| >= 1/3 (kappa <= 8), then sqrt(2/pi) - E|S| >= (2/pi) M min_j(margin) >= (2/pi)(1/3)(0.0412) > 0.0087.

## 6. Certificate: files and replay

All files are in this folder. They ran on yo, in ~/claude-b9ee-diagsum: venv with python-flint 0.9.0, mpmath 1.4.1, numpy 2.5.5; one to four cores.

| file | what it does | log |
|---|---|---|
| `c00_exact.py` | exact moments E h^2, E h^4, E h^6; the rational facts of (2.1), (2.2); E\|h\| < 632/1024 in arb, cross-checked by rigorous integration | `c00_exact.log` |
| `c01_psi_grid.py`, `run_c01.sh` | enclosures of psi(k/1000), 200 <= k <= 40000 (real-line integral, four processes); contour enclosures of every 10th point | `psi_grid.txt`, `psi_grid_contour.txt`, `run_c01.log` |
| `c02_bnd.py` | Im h >= 0 on Gamma (exact fractions); Bnd(40) | `bnd40.txt`, `c02_bnd.log` |
| `c03_main.py` | the checks of Sections 2(e) and 4; prints PASS/FAIL per check and ALL CHECKS PASSED | `c03_main.log` |

- Replay: `bash run_c01.sh` (about 6 minutes on 4 cores); `python c02_bnd.py`; `python c03_main.py` (6 seconds).
- sha256 of every script, data file and log: `SHA256SUMS`.
- Design numerics (N, not part of the proof):
  - `n01_psi_numerics.py`: psi by two quadratures, agreeing to 1e-13. It finds the zeros 3.0020, 6.7850, 10.614, ..., min psi = -0.354339 at u = 4.727, and psi > e^{-u^2/2} exactly up to u = 2.9703.
  - `n02_bulk_tail_N.py`: b and tau.
  - `n03_contour_N.py`: Bnd against |psi|.
  - `n04_sanity_N.py`: the Fourier formula against Monte Carlo (4e6 samples) for eight vectors. They agree within the MC error.
    For n = 1 it gives 0.61648 against the exact E|h| = 0.616460; for (1,1)/sqrt2, 0.6038; for (1/5, ..., 1/5) in n = 25, 0.7304.
  - `n05_crosscheck_N.py`: a float re-implementation of B and T, independent of c03's code. It reproduces c03's values to 8 digits.

## 7. Remarks

- **What was hard, and what turned out not to be.**
  - Neither the window 1/20 < max lambda_i < 37/50 of the Gemini logs nor M near 1 needs special treatment. Once the tail bound
    is dimension-free (the monotone envelope c), absolute values in the tail cost at most a fifth of the bulk for every kappa.
  - At kappa = 0 (n = 1) the bound gives Delta >= 0.2498 against the true 0.2850.
- **Scope and possible extensions.**
  - The same proof covers lambda in l^2 with infinitely many coordinates: Lemma 3 passes to infinite products, and M is still
    attained.
  - It also applies to any symmetric law whose characteristic function satisfies (F1) on [0, u1] and admits a monotone
    envelope with b > tau.
  - For other odd Hermite degrees d, the same scheme needs psi_d >= e^{-u^2/2} on some [0, u1], which holds near 0 because
    kappa_4(h_d) > 0. It also needs the bulk/tail comparison, which was not checked here.
  - For even d, h_d(X) is not symmetric and its characteristic function is complex, so Lemma 3 does not apply as written.
    Degree 2 is in any case settled by our D1 note.
- **Against the K ledger** (research/conjecture-K/STATUS.md, 3.21 (e)): new.
  - The ledger proves the sharp real bound for cubics odd under one reflection, for conditionally Gaussian forms, in at most
    seven coordinates, for kappa_4 >= 74, and for kappa_4 <= 1e-140.
  - A diagonal sum with n >= 8 and moderate sum lambda_i^4 lies in none of these classes.
  - This theorem settles the whole diagonal class, in every dimension.
- **Against the Gemini logs.**
  - The long log (3626-3914) and the rigurous log (604-639) also argue in Fourier space. The long log's envelopes are wrong (see
    ../REVIEW.md); the rigurous log was not re-checked here.
  - The proof above uses neither log's lemmas. Its envelope, its contour bound and its certificate are its own.
