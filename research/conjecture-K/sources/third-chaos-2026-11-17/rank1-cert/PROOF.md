<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/rank1-cert-2026-11-17/PROOF.md (17 November 2026); a research worker of claude-b9ee. Its scripts, logs and run times are in code/third-chaos-2026-11-17/rank1-cert/; its ../hjm-note-2026-11-17/ is ../hjm-note/ here and its ../gemini-weak-2026-11-17/ and gemini-weak2-2026-11-17/ are ../gemini-weak/ and ../gemini-weak2/. Only this line was added. -->
# Rank-one bounds on the real third chaos: interval certificates

claude-b9ee research worker, 17 Nov 2026, 06:55 (Europe/Bucharest). STATUS: COMPLETE (P, author only + C, author only).

Labels as in the K ledger (`research/conjecture-K/STATUS.md` section 0):
- **P**: proved by hand below. "Author only": nobody outside this session has re-derived it yet.
- **C**: certified in Arb ball arithmetic (python-flint 0.9.0), replayed only by the author. It was run twice, on macOS
  arm64 (Python 3.14.8) and on yo (Linux x86_64, Python 3.12.3), and the five logs are byte-identical.
- **N**: floating point only (`n01_floats.py`).

Floating point never enters a proof step. It only chooses grid points, breakpoints, branch choices and tangent points,
and every such choice is valid whatever its value.

Notation:
- X is a standard Gaussian vector in R^n, H_3^(n) is its real third Wiener chaos, and W ~ N(0,1).
- h3(x) = (x^3 - 3x)/sqrt6, psi2(x) = (x^2 - 1)/sqrt2, and phi is the N(0,1) density.
- For F in H_3^(n) with ||F||_2 = 1 and a unit vector v, a_v(F) = |E[F h3(<v,X>)]|, and a(F) = max_v a_v(F).
- The targets are T_w = sqrt(17/25) = 0.8246211251 (weak) and T_s = sqrt(2/pi) = 0.7978845608 (sharp).

## 0. Results

**Theorem A (any direction v, the plain bound).** Let H(a) = E sqrt(a^2 h3(W)^2 + 1 - a^2).
- (A1) [P + C] For every n, every unit F in H_3^(n) and every unit v with a = a_v(F) in [0.79, 1]: E|F| <= H(a).
- (A2) [P] H is strictly decreasing on [0, 1]. H(0) = 1 and H(1) = E|h3(W)| = (1 + 4e^(-3/2))/sqrt(3 pi) = 0.6164602.
- (A3) [P + C] Hence:
  - a_v(F) >= 0.7964 gives E|F| <= H(0.7964) = 0.8245886840 = T_w - 3.244e-5;
  - a_v(F) >= 0.8362 gives E|F| <= H(0.8362) = 0.7978573497 = T_s - 2.721e-5.

  H(a) equals the target at a unique point: a*_w in (0.7963485, 0.7963486) and a*_s in (0.8361619, 0.8361620). So
  0.7964 and 0.8362 are the smallest values with four decimals, and (A3) also holds from 0.7963486 and from 0.8361620.

**Theorem B (the maximising direction; REVIEW2 item G3).** Let

    Phi(p, t, r) = E min{ sqrt(p h3(W)^2 + t W^2 + r), sqrt(p h3(W)^2 + t W^2) + K sqrt(r) },
    K = sqrt(4/(7(cos^3(pi/7) - cos^3(3pi/7)))) = 0.8906614.

- (B1) [P] For every n and every unit F in H_3^(n): E|F| <= Phi(a^2, b^2, c^2), with a = a(F) and b, c as in section 1.
- (B2) [P + C] For the two targets:
  - a(F) >= 0.7931 gives E|F| <= 0.8246049268 = T_w - 1.620e-5;
  - a(F) >= 0.8339 gives E|F| <= 0.7978737082 = T_s - 1.085e-5.
- (B3) [C] The thresholds of this bound lie in (0.79307, 0.79308] for T_w and in (0.83388, 0.83389] for T_s.
- (B4) [P + C] **The values 0.79264 and 0.83362 of REVIEW2 item G3 are wrong.** At those two values of a the bound
  exceeds the targets: Phi >= 0.8248867644 > T_w and Phi >= 0.7980696896 > T_s, at the points listed in section 5.5.
  - The maximum of Phi over b^2 is never at b = 0: the right derivative there is +infinity (section 5.4).
  - The maximum is at b^2 = 1.41e-3 (a = 0.7931) and b^2 = 1.08e-3 (a = 0.8339).
  - The grid b^2 = (1 - a^2) j/16 of `gemini-weak2-2026-11-17/checks/g134.py` cannot see a maximum this close to 0.

**Changes from the brief:**
- (A1) is certified on [0.79, 1) instead of [a_w, 1).
- a_w = 0.7964 and a_s = 0.8362 are as proposed.
- For G3, the coordinator's step (i), "the derivative at b = 0 is negative", is false. It is replaced by a tangent
  line at the numerical maximiser together with the joint-concavity (single-slice) argument of section 5.2. That
  argument also makes the coordinator's step (ii) unnecessary.
- Section 2.4 shows that the same argument gives (A3) from the derivatives at the two threshold points alone.

## 1. The conditional bounds (P)

**Lemma 1** (Proposition 4.3(b) of `../hjm-note-2026-11-17/HJM_Example3.1_d2_d3.md`). Let F be in H_3^(n) with
||F||_2 = 1, let v be a unit vector and a = a_v(F). Then there are g0, g1, g2 >= 0 with g0 + g1 + g2 = 1 - a^2 and

    E|F| <= Phi_A(a, g) := E sqrt(a^2 h3(W)^2 + g2 psi2(W)^2 + g1 W^2 + g0).

*Proof.*
1. Rotate so that v = e_1, and replace F by -F if needed, so that E[F h3(X_1)] = a.
2. Expand F = sum_{k=0..3} psi_k(X_1) G_k(X') with psi_3 = h3, psi_1(x) = x, psi_0 = 1, G_k in H_{3-k}(X') and G_3 = a.
3. Given X_1 = x, F = a h3(x) + psi2(x) G_2 + x G_1 + G_0. The G_k lie in distinct chaoses of X', and G_0, G_1, G_2
   have mean 0. Hence E[F^2 | X_1 = x] = a^2 h3(x)^2 + psi2(x)^2 g2 + x^2 g1 + g0, with g_k = ||G_k||^2.
4. By orthogonality, 1 = ||F||^2 = a^2 + g2 + g1 + g0.
5. Conclude with E|F| = E[E[|F| | X_1]] <= E sqrt(E[F^2 | X_1]). QED.

**Lemma 2** (REVIEW2 item G3). Let v* maximise v -> a_v(F) (it exists by compactness), let W = <v*, X>, and let W'
be the coordinates orthogonal to v*. Then F = a h3(W) + W Q2(W') + R3(W') with a = a(F), Q2 in H_2(W') and R3 in
H_3(W'). With b = ||Q2||_2 and c = ||R3||_2 we have a^2 + b^2 + c^2 = 1 and E|F| <= Phi(a^2, b^2, c^2).

*Proof.*
1. In the expansion of Lemma 1 with X_1 = W, the coefficient G_2 is linear: G_2 = <g, X'>.
2. Take u orthogonal to v* and put v_theta = cos(theta) v* + sin(theta) u. Since h3' = sqrt3 psi2,
   d/dtheta E[F h3(<v_theta, X>)] at theta = 0 equals sqrt3 E[F psi2(W) <u, X>] = sqrt3 <g, u>.
3. At the maximiser this derivative vanishes for every such u, so G_2 = 0. Put Q2 = G_1 and R3 = G_0.
4. Given W = w there are two bounds:
   - Cauchy-Schwarz gives E'|F| <= sqrt(a^2 h3(w)^2 + w^2 b^2 + c^2);
   - the triangle inequality gives E'|F| <= E'|a h3(w) + w Q2| + E'|R3| <= sqrt(a^2 h3(w)^2 + w^2 b^2) + K c.
5. The second bound uses E|R| <= K ||R||_2 for every R in the third chaos of any number of variables:
   Proposition 4.6 of the HJM note (P + finite check), applied in the n - 1 variables W'. Indeed,
   E|R| = E[R sign R] <= ||R||_2 sqrt(W_3(sign R)) and W_3 <= K^2 = 0.7932777.
6. Take the smaller bound for each w and integrate. QED.

## 2. Theorem A: the hand steps (P)

**2.1 Vertex reduction.** For a in [0, 1) put s = 1 - a^2 and A(x) = a^2 h3(x)^2 + s >= s > 0, and

    D1(a) = (1/2) E[(W^2 - 1)/sqrt A(W)],   D2(a) = (1/2) E[(psi2(W)^2 - 1)/sqrt A(W)].

Then Phi_A(a, g) <= H(a) + g1 D1(a) + g2 D2(a) for every admissible g.

*Proof.*
1. For A > 0 and B >= -A, concavity of sqrt gives sqrt(A + B) <= sqrt(A) + B/(2 sqrt A).
2. Take B = g1 (W^2 - 1) + g2 (psi2^2 - 1). With g0 = s - g1 - g2, A + B is exactly the radicand of Phi_A, so A + B >= 0.
3. The term B/sqrt(A) is integrable, since |B|/sqrt(A) <= |B|/sqrt(s). Take expectations. QED.

So D1(a) <= 0 and D2(a) <= 0 imply Phi_A(a, g) <= H(a) for all admissible g. Phi_A is concave in g. Its maximum over
the simplex is the vertex "independent remainder" g = (1 - a^2, 0, 0), and its value there is H(a).

**2.2 Monotonicity of H.** Write H = E sqrt(1 + pY) with p = a^2 and Y = h3(W)^2 - 1. Then Y >= -1 and E Y = 0.

*Proof.* Let 0 <= p < q <= 1.
1. The tangent inequality of 2.1 gives sqrt(1 + qY) <= sqrt(1 + pY) + (q - p) Y/(2 sqrt(1 + pY)), with 1 + pY >= 1 - p > 0.
2. Y/sqrt(1 + pY) <= Y always: if Y >= 0 the denominator is >= 1, and if Y < 0 it lies in (0, 1].
   So E[Y/sqrt(1 + pY)] <= E Y = 0, and H(q) <= H(p).
3. If p > 0 the inequality of step 2 is strict wherever Y != 0, which holds almost surely. So H(q) < H(p) for
   0 < p < q, and also H(q) < H(q/2) <= H(0).

Hence H is strictly decreasing on [0, 1] in p, and therefore in a. Finally, H(1) = 2 int_0^inf |h3| phi; the
antiderivative of (x^3 - 3x) phi is (1 - x^2) phi, so int_0^inf |x^3 - 3x| phi dx = phi(0) + 4 phi(sqrt3). QED.

**2.3 Assembly.**
1. (A1) for a in [0.79, 1) follows from Lemma 1, from 2.1 and from section 3 (D1, D2 < 0 there). For a = 1,
   F = +-h3(<v,X>) and E|F| = H(1).
2. (A3) follows from (A1), (A2) and section 4.

**2.4 Remark: a second route to (A3), needing only two derivative values.**
1. Phi_A is jointly concave in (p, g0, g1, g2) = (a^2, g0, g1, g2) on [0, inf)^4, and Phi_A = 1 at the vertex (0, 1, 0, 0).
2. The lemma of section 5.2 then shows that the supremum of Phi_A over the face {p >= p0} of the simplex equals its
   supremum on the slice {p = p0}.
3. By 2.1, that slice supremum is H(sqrt p0) as soon as D1, D2 <= 0 at the single point p0.
4. `c02_D_grid.py` contains p0 = 0.7964^2 and p0 = 0.8362^2 in its first interval.

## 3. Theorem A: the derivatives are negative (C)

With p = a^2, the two derivatives become integrals over the half-line (the integrand is even):

    D_k(p) = int_0^inf n_k(x) phi(x) (1 + p(h3(x)^2 - 1))^(-1/2) dx,   n1 = x^2 - 1,   n2 = psi2^2 - 1 = (x^2 - 1)^2/2 - 1.

**Facts used by both scripts (P):**
- (F1) For fixed x, p -> (1 + p(h3^2 - 1))^(-1/2) is increasing if h3(x)^2 < 1 and decreasing if h3(x)^2 > 1. So the
  integrand is nonincreasing in p where n_k (h3^2 - 1) >= 0 and nondecreasing where n_k (h3^2 - 1) <= 0.
- (F2) Signs of n_k:
  - n1 < 0 on [0, 1) and n1 > 0 on (1, inf);
  - n2 < 0 on [0, xi) and n2 > 0 on (xi, inf), with xi = sqrt(1 + sqrt2) = 1.5538 (n2 < 0 iff |x^2 - 1| < sqrt2).
- (F3) Sign of h3^2 - 1: h3^2 < 1 on [0, x*) and h3^2 > 1 on (x*, inf), where x* = 2.0484 is the root of x^3 - 3x = sqrt6.
  The reason: |x^3 - 3x| <= 2 < sqrt6 on [0, sqrt3], and x^3 - 3x is increasing on [1, inf).
- (F4) Tails. For x >= 12 we have h3^2 >= 1, so |integrand| <= |n_k| phi. Using Q(X) <= phi(X)/X:
  - int_X^inf x^2 phi <= (X + 1/X) phi(X);
  - int_X^inf x^4 phi <= (X^3 + 3X + 3/X) phi(X).

**3.1 Grid range, p in [0.79^2, 1 - 2^-10] (`c02_D_grid.py`).** By (F1)-(F3), for p in [p-, p+], D_k(p) is at most the
integral of the integrand with p replaced by p_sel(x):
- for k = 1: p_sel = p- on [0, 1] and on [x*, inf), and p_sel = p+ on [1, x*];
- for k = 2: p_sel = p- on [0, xi] and on [x*, inf), and p_sel = p+ on [xi, x*].

What the script does:
1. Integrates each piece with `acb.integral` over [0, 12], with exact dyadic ends.
2. Encloses xi and x* in dyadic intervals of width 2^-30, certified by the sign of n2, respectively of h3^2 - 1, at
   both ends. On these slivers it bounds the integral by width x max of the two ball upper bounds.
3. Adds the tail (F4).
4. Uses the p-grid [0.6241, 3/4] and then [1 - 2^-j, 1 - 2^-(j+1)] for j = 2..9. Bisection was available but not needed.

Results (upper bounds of sup D_k on each interval):

| p-interval | sup D1 <= | sup D2 <= |
|---|---|---|
| [0.6241, 0.75] | -0.0804016 | -0.228740 |
| [0.75, 0.875] | -0.0884978 | -0.253896 |
| [0.875, 0.9375] | -0.136242 | -0.301056 |
| [1 - 2^-4, 1 - 2^-5] | -0.188300 | -0.341982 |
| [1 - 2^-5, 1 - 2^-6] | -0.243886 | -0.379075 |
| [1 - 2^-6, 1 - 2^-7] | -0.302016 | -0.413787 |
| [1 - 2^-7, 1 - 2^-8] | -0.361853 | -0.447050 |
| [1 - 2^-8, 1 - 2^-9] | -0.422776 | -0.479452 |
| [1 - 2^-9, 1 - 2^-10] | -0.484365 | -0.511355 |

**3.2 The range p in [1 - 2^-10, 1) (`c03_D_near1.py`).** Near p = 1 the integrands develop logarithmic singularities
at the zeros 0 and sqrt3 of h3 (n_k < 0 at 0 and n_k > 0 at sqrt3). The one at 0 dominates. A grid cannot reach p = 1,
so this range has an analytic bound with computed constants.

*Setting.*
- eps = 1 - p lies in (0, eps1] with eps1 = 2^-10, and 1 + p(h3^2 - 1) = p h3^2 + eps.
- L = (1/2) ln(1/eps) >= L1 = 5 ln 2.
- Parameters: r0 = 1/2, b- = 13/8, b+ = 15/8.
- Split [0, inf) into A = [0, r0], M = [r0, b-], B = [b-, b+] and R = [b+, inf).
- The script checks xi < b- < sqrt3 < b+ < x* and r0^2 <= 3/4.

*Region A* (n_k < 0). Put w_k = -n_k phi > 0.
1. There 0 <= p h3^2 <= h3^2 = x^2 (3 - x^2)^2/6 <= (3/2) x^2.
2. So the A-part is at most -int_0^r0 w_k/sqrt(3x^2/2 + eps).
3. Lower bounds for w_k:
   - k = 1: w_1 = (1 - x^2) phi >= phi(0)(1 - x^2)(1 - x^2/2) >= phi(0)(1 - 3x^2/2);
   - k = 2: w_2 = (1/2)(1 + 2x^2 - x^4) phi, and w_2/w_2(0) >= (1 + 2x^2 - x^4)(1 - x^2/2) >= 1 + x^2(3/2 - 2x^2) >= 1
     for x^2 <= 3/4.
4. With int_0^r0 dx/sqrt(3x^2/2 + eps) = sqrt(2/3) asinh(r0 sqrt(3/(2 eps))) >= sqrt(2/3)(ln(2 r0 sqrt(3/2)) + L), this gives

       A-part <= -alpha_k (ln(2 r0 sqrt(3/2)) + L) + R_A,   alpha_k = sqrt(2/3) w_k(0),

   with R_A = (3/2) phi(0) int_0^r0 x^2/sqrt(3x^2/2 + eps) <= sqrt(3/2) phi(0) r0^2/2 for k = 1, and R_A = 0 for k = 2.

*Region B* (n_k > 0). Put v_k = n_k phi.
1. Write h3(x) = (x - sqrt3) c(x) with c(x) = x(x + sqrt3)/sqrt6 increasing, and use p >= p1:
   - on [b-, sqrt3], p h3^2 + eps >= k-^2 (x - sqrt3)^2 + eps with k- = sqrt(p1) c(b-);
   - on [sqrt3, b+], the same holds with k+ = sqrt(p1) sqrt6.
2. By the mean value theorem, v_k(x) <= v_k(sqrt3) + V'_-+ |x - sqrt3| on the two sides. Here V'_- and V'_+ are the
   suprema of (-v_k')^+ on [b-, sqrt3] and of (v_k')^+ on [sqrt3, b+], bounded by 512 ball evaluations.
3. With l- = sqrt3 - b-, l+ = b+ - sqrt3, int_0^l du/sqrt(k^2 u^2 + eps) = asinh(k l/sqrt eps)/k,
   int_0^l u du/sqrt(k^2 u^2 + eps) <= l/k and asinh z <= ln(2z) + 1/(4z^2):

       B-part <= beta_k L + v_k(sqrt3) sum_+- (ln(2 k_+- l_+-) + 1/(4 z_+-^2))/k_+- + V'_- l-/k- + V'_+ l+/k+,

   with beta_k = v_k(sqrt3)(1/k- + 1/k+) and z_+- = k_+- l_+-/sqrt(eps1) <= k_+- l_+-/sqrt(eps).

*Regions M and R.*
1. There h3 != 0, so by (F1) the integrand at p in [p1, 1) is at most the larger of its values at p1 and at p = 1. The
   value at p = 1 is n_k phi/|h3|.
2. The choice of endpoint follows the sign of n_k (h3^2 - 1), exactly as in 3.1 with (p-, p+) = (p1, 1), with slivers
   around xi and x*.
3. C_rest is the Arb integral of this majorant plus the tail (F4).

*Assembly.* For every p in [p1, 1),

    D_k(p) <= -(alpha_k - beta_k) L + K0_k <= -(alpha_k - beta_k) L1 + K0_k,
    K0_k = [-alpha_k ln(2 r0 sqrt(3/2)) + R_A] + B-constant + C_rest.

The second inequality uses alpha_k > beta_k (certified). Computed values:

| | alpha | beta | A-const | B-const | C_rest | K0 | bound at L1 = 3.4657 |
|---|---|---|---|---|---|---|---|
| D1 | 0.325735 | 0.152696 | -0.004962 | -0.084724 | 0.124865 | 0.035180 | **-0.564529** |
| D2 | 0.162868 | 0.076348 | -0.033019 | -0.015334 | -0.153897 | -0.202249 | **-0.502104** |

**3.3 Result.** sup D1 <= -0.0804016 and sup D2 <= -0.228740 for every a in [0.79, 1). [C]

The values sit well inside these bounds: D1 = -0.1054 and D2 = -0.2388 at a = 0.79 [N].

Near a = 1, the floating-point slopes of D_k in L are -0.18037 and -0.090186. They agree with the idealised
alpha_k - beta_k (r0 -> 0, b+- -> sqrt3), which is phi(0) sqrt6/3 - 4 phi(sqrt3)/sqrt6 = 0.18037 for k = 1 and half
of it, 0.090186, for k = 2 [N].

## 4. Theorem A: values of H (C, `c01_H.py`)

The script computes H(a) = 2 int_0^12 sqrt(1 + p(h3^2 - 1)) phi + 2 tail, where p = a^2 is a ball around the rational
a^2. The tail is at most int_12^inf |h3| phi <= (X^2 + 2) phi(X)/sqrt6, because the radicand is at most h3^2 where
h3^2 >= 1.

| a | H(a) enclosure | target | margin |
|---|---|---|---|
| 0.7964 | 0.82458868402819 | T_w = 0.82462112512353 | 3.24411e-5 |
| 0.8362 | 0.79785734969773 | T_s = 0.79788456080287 | 2.72111e-5 |

The threshold brackets come from H(lo) > T > H(hi), certified at lo/hi = 0.7963485/0.7963486 and 0.8361619/0.8361620,
together with (A2).

## 5. Theorem B

**5.1 The bound.** Lemma 2 gives E|F| <= Phi(a^2, b^2, c^2), with (a^2, b^2, c^2) on the simplex
S = {(p, t, r) >= 0 : p + t + r = 1}.
- Phi is concave on [0, inf)^3: each branch is a sum of square roots of nonnegative linear forms, the minimum of two
  concave functions is concave, and expectation preserves concavity.
- Phi(0, 0, 1) = E min{1, K} = K.

**5.2 Single-slice reduction (P).** Let p0 in (0, 1] and let M = sup_{t in [0, 1 - p0]} Phi(p0, t, 1 - p0 - t). If
M <= K, then Phi(x) <= M for every x in S with p(x) >= p0.

*Proof.*
1. Let x be in S with p(x) = p1 >= p0. Put lambda = p0/p1 in (0, 1] and y = lambda x + (1 - lambda)(0, 0, 1).
2. Then y is in S and p(y) = p0, so Phi(y) <= M.
3. Concavity gives Phi(y) >= lambda Phi(x) + (1 - lambda) K.
4. Hence lambda Phi(x) <= M - (1 - lambda) K = lambda M - (1 - lambda)(K - M) <= lambda M. QED.

So "E|F| <= M < T whenever a(F) >= a0" needs only the one slice p = a0^2. The same holds for any concave majorant
whose value at a vertex outside the face is at least the target (section 2.4).

**5.3 The slice: a tangent line (P) and what is computed (C, `c04_Psi.py`).** Fix p0 and s = 1 - p0. For w >= 0 put

    f1(t, w) = sqrt(p0 h3(w)^2 + s + t(w^2 - 1)),
    f2(t, w) = sqrt(p0 h3(w)^2 + t w^2) + K sqrt(s - t) = w sqrt(p0 (3 - w^2)^2/6 + t) + K sqrt(s - t).

Both are concave in t on [0, s], and differentiable at every t0 in (0, s) (for f2 when w != 0).

1. For any t0 in (0, s) and any choice i(w) in {1, 2}, every t in [0, s] satisfies
   min(f1, f2)(t, w) <= f_i(t, w) <= f_i(t0, w) + (t - t0) d/dt f_i(t0, w).
2. Integrating, Phi(p0, t, s - t) <= V + (t - t0) G, with V = E f_i(t0) and G = E d/dt f_i(t0). The derivatives
   are bounded by polynomials:
   - |d/dt f1| <= |w^2 - 1|/(2 sqrt(s - t0));
   - |d/dt f2| <= w/(2 sqrt t0) + K/(2 sqrt(s - t0)).
3. Hence M <= max(V - t0 G, V + (s - t0) G).

The bound is tight when t0 is the maximiser and i(w) is the smaller branch at t0. Then G = 0, and V is the maximum.

The script:
1. Finds t0 (floating-point bisection on the sign of G, rounded to 2^-40).
2. Finds the crossings of f1 - f2 at t0 (scan plus bisection, rounded to 2^-40). The branch choice is f2 on
   [0, c1], f1 on [c1, c2], f2 on [c2, c3] (the window around sqrt3, where K < 1 makes f2 smaller) and f1 on [c3, inf).
3. Computes V and G with `acb.integral` on [0, 12], with exact dyadic ends.
   - All integrands are analytic near the real axis. The radicands are >= t0 or >= s - t0 there, and the complex
     square roots use `analytic=True`.
   - The tail [12, inf) is on branch 1, where 0 <= f1 <= w^3 and |d/dt f1| <= w^2/(2 sqrt(s - t0)).
4. Checks max(V - t0 G, V + (s - t0) G) < T, with exact upper ends.

**5.4 Why b = 0 is never the maximiser (P).** Put g(t) = Phi(p0, t, s - t).
1. At w = sqrt3 we have h3 = 0, so f2(0) = K sqrt(s) < sqrt(s) = f1(0). By continuity, f2 < f1 on a neighbourhood N of
   +-sqrt3 for all small t.
2. On N, d/dt f2(0+, w) = w^2/(2 sqrt(p0) |h3(w)|) - K/(2 sqrt s), and |h3(w)| is about sqrt6 |w - sqrt3|. This is not
   integrable.
3. The difference quotients (min(f1, f2)(t) - min(f1, f2)(0))/t are bounded below by the integrable chord slope
   (min(s) - min(0))/s, by concavity in t.
4. Fatou's lemma then gives g'(0+) = +infinity.

So the maximiser t* is positive and g(t*) > g(0) = Phi(a^2, 0, 1 - a^2), which is the b = 0 value. Size of the effect
(N, `n01_floats.py`): at a = 0.7931, g(0) = 0.8243398 and g(1.4e-3) = 0.8246049; at a = 0.8339, g(0) = 0.7976879 and
g(1.0e-3) = 0.7978729.

**5.5 Results (C).**

| target | a0 | t0 = b^2 at the maximum | slice bound M <= | margin T - M |
|---|---|---|---|---|
| T_w | 0.7931 | 0.0014085 | 0.824604926754 | 1.620e-5 |
| T_s | 0.8339 | 0.0010817 | 0.797873708193 | 1.085e-5 |

- In both rows the enclosures of V and G have width below 1e-29, and G = -4.56e-11, respectively -6.40e-11. So the
  line is flat: M exceeds V by t0 |G| < 7e-14, and M is the true maximum to about 1e-13.
- Crossings at t0: (0.072706, 1.717075, 1.745385) for T_w and (0.062651, 1.717188, 1.745663) for T_s.
- Combined with 5.2 and Lemma 2, this proves (B2).

Lower bounds (Parts 2 and 3 of `c04_Psi.py`):
- A lower bound of Phi(p, t, s - t) is the sum, over pieces avoiding slivers of width 2^-35 around the numerical
  crossings, of the Arb lower bound of the smaller branch. On each piece, the sign of f1 - f2 is certified by recursive
  ball subdivision. The slivers and the tail contribute >= 0.
- By 5.2, M is nonincreasing in a0 wherever M <= K. So one point above the target at a_lo and the certified line
  below it at a_hi bracket the threshold of the bound.

| claim | a | t = b^2 | certified value |
|---|---|---|---|
| REVIEW2 weak value fails | 0.79264 | 0.0014121 | Phi >= 0.8248867644 > T_w |
| REVIEW2 sharp value fails | 0.83362 | 0.0010840 | Phi >= 0.7980696896 > T_s |
| weak threshold > 0.79307 | 0.79307 | t0(0.79307) | Phi >= 0.8246233199 > T_w |
| weak threshold <= 0.79308 | 0.79308 | (all t) | M <= 0.8246171890 < T_w |
| sharp threshold > 0.83388 | 0.83388 | t0(0.83388) | Phi >= 0.7978877130 > T_s |
| sharp threshold <= 0.83389 | 0.83389 | (all t) | M <= 0.7978807107 < T_s |

So the G3 bound improves the plain bound of Theorem A from 0.79635 to 0.79308 (weak) and from 0.83616 to 0.83389
(sharp). This is less than REVIEW2 claimed (0.79264 and 0.83362).

## 6. Files and replay

| file | role | label | time (laptop) |
|---|---|---|---|
| `c01_H.py` / `.log` | H(0.7964), H(0.8362), threshold brackets (section 4) | C | 0.7 s |
| `c02_D_grid.py` / `.log` | D1, D2 < 0 for p in [0.6241, 1 - 2^-10] (section 3.1) | C | 0.3 s |
| `c03_D_near1.py` / `.log` | D1, D2 < 0 for p in [1 - 2^-10, 1) (section 3.2) | C | 0.1 s |
| `c04_Psi.py` / `.log` | Theorem B: slice bounds, the failure of the REVIEW2 values, threshold brackets (section 5) | C | 21 s |
| `n01_floats.py` / `.log` | mpmath cross-checks: H, D_k, slopes near a = 1, t-profile of Phi | N | 8 s |
| `run_all.sh` | replays all five and writes the logs, `env.log` and `*.time` | - | 30 s |
| `env.log`, `env_yo.log` | interpreter and library versions of the two runs | - | - |

Replay with `./run_all.sh <python>`, where `<python>` has python-flint 0.9.0 and mpmath 1.3.0. On yo use
`/home/agalatan/claude-b9ee-capslemma/venv/bin/python3`. Every script ends with `RESULT: ALL CHECKS PASSED` and exits
with status 0. All scripts run with `python3 -I`, at 128-bit working precision.

## 7. Inputs, trust, and what is not done

**Inputs:**
- Lemma 1 (Proposition 4.3(b) of the HJM note), re-derived in section 1.
- E|R| <= K ||R||_2 on the third chaos (Proposition 4.6 of the HJM note, P + finite check; also REVIEW item 1 of
  `../gemini-weak-2026-11-17/`).

**Trusted software:** Arb's `acb_calc_integrate` and the ball arithmetic of FLINT 3 (through python-flint 0.9.0).
Parameters given as balls, such as p = a^2 for a non-dyadic a, are handled by inclusion: each result encloses the
integral for every parameter in the ball.

**Not done:**
- An independent re-derivation of sections 1-5 and an audit of the interval code by a second reader.
- A Lean formalisation.
- Theorem B relies on the maximising direction (stationarity). Theorem A works for any v.
