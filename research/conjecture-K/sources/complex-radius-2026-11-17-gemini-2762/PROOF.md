# Third-order antiholomorphic Stein identities and the complex cubic radius bound $\mathbb{E}|q| \le 0.9156\,\|q\|_2$

*Author: `gemini-2762`, 17 November 2026. Task [#504](https://github.com/agalatan/grothendieck-lean/issues/504) (parent [#458](https://github.com/agalatan/grothendieck-lean/issues/458)).*
*Labels follow [`STATUS.md`](../../STATUS.md) §0: **P, author only** (complete written proof in this session, awaiting independent review), **C, author only** (exact integer/rational computation with standalone standard-library replay scripts and two independent exact verifiers), **N** (floating-point numerics, used only for search and sanity diagnostics), **open** (unproved).*

---

## 0. Main result and overview

Let $z = (z_1, \dots, z_n)$ be independent standard complex Gaussians ($\mathbb{E}|z_j|^2 = 1$, $\mathbb{E}z_j^2 = 0$), and let $H_{2,1}(\mathbb{C}^n)$ denote the Wick chaos of bidegree $(2, 1)$: polynomials
$$q(z) = \sum_{a,b,c=1}^n t_{abc}\,(z_a z_b \bar z_c - \delta_{ac} z_b - \delta_{bc} z_a), \qquad t_{abc} = t_{bac} \in \mathbb{C},$$
with second moment $u = \|q\|_2^2 = \mathbb{E}|q|^2 = 2\sum_{a,b,c}|t_{abc}|^2$.

**Theorem 1** (**P + C, author only**). *For every $n \ge 1$ and every $q \in H_{2,1}(\mathbb{C}^n)$,*
$$\mathbb{E}|q| \le \frac{2289}{2500}\,\|q\|_2 = 0.9156\,\|q\|_2 < 0.916\,\|q\|_2.$$
*More precisely, normalised to $u = \mathbb{E}|q|^2 = 1$ with $V = |q|^2$ and fourth-moment excess $s = \mathbb{E}V^2 - 2 \in [0, 42]$, the 23-row rational certificate [`cert_916.json`](../../code/complex-radius-gemini-2762/cert_916.json) establishes a piecewise bound $\mathbb{E}|q| \le B_{\mathrm{row}}(s)$ across $[0, 42]$ whose global maximum occurs on row 10 ($s \in [4, 17/4]$) and equals*
$$\frac{108089090381367422881337516582714174209}{118059162071741130342400000000000000000} = 0.915550207867\dots < \frac{2289}{2500} = 0.9156.$$

**Degree-5 consequence.** By [`../higher-degree/STATUS.md`](../../../higher-degree/STATUS.md) row 4.12, at $t = 0$ the moment-layer row bound of a degree-5 Grothendieck witness $(1, -\lambda_1, \dots)$ is $\lambda_1 (\rho^*)^2$, where $\rho^* = \sup_{n \ge 1, \, 0 \ne q \in H_{2,1}(\mathbb{C}^n)} \mathbb{E}|q|/\|q\|_2$. Theorem 1 proves $\rho^* \le 2289/2500 < 0.916$, raising the admissible $\lambda_1$ cap for the target $500/701$ ($1.402$) from $(500/701)/(93/100)^2 \approx 0.82468$ to
$$\lambda_1 \le \frac{500/701}{(2289/2500)^2} = \frac{3125000000}{3674304381} = 0.85049976\dots,$$
which covers the uncapped degree-5 game ($\lambda_1 \approx 0.849$, threshold $\rho^* \le 0.916$).

### Dependency inventory of Theorem 1

Every analytic input used by the certificate belongs to one of three categories:

1. **Lean theorems of this repository** (`Grothe/LowerAnalytic/`):
   - Moments and kurtosis range: $\mathbb{E}V = 1$, $\mathbb{E}V^2 = 2 + s$, $s \le 42$ (`gaussian_moments`, `Circular.gaussian_fourth_moment_le_44`), $s = 32n + 8h + 32b + 96y$ (`Circular.fourth_moment_contractions`).
   - Sixth-moment bounds: $\mathbb{E}V^3 \le 6 + 9s + \frac{4045313}{100000}s^{3/2}$ (`Circular.gaussian_sixth`, `Circular.tensorFacts`) and the two $\alpha$-parametrised joint forms (`Circular.joint_sixth`, `Circular.jointS0_nonneg`, `Circular.jointH0_nonneg`).
   - Second-moment and contraction inequalities: $\mathbb{E}[(c_1 + c_2 - 3)^2] = 80n + 20h + 16b + 96y + 32z$ (`varS_eq`), $\mathbb{E}|a|^2 = 32b + 24y$ (`AB_eq`), $\rho^2 \le |a|^2$ (`radR_sq_le`), $\mathbb{E}[V\rho] = 32b + 48y$ (`N_eq`), and $n, h, b, y, z \ge 0$, $b \le n$, $y \le z$, $z^2 \le nh$, $m := n + b + 3y - z \ge 0$, $(3y - z)^2 \le hm$ (`gramT_schatten`, `gramT_symm`, `gramZ_sq_le`, `gramT_gram1a`, `gramT_gram1b`).
2. **Previously reviewed paper inputs** ([`sources/antiholomorphic-stein-2026-11-16/NOTE.md`](../antiholomorphic-stein-2026-11-16/NOTE.md), tag `KAS`; [`sources/radius-relaxation-2026-11-16/REVIEW.md`](../radius-relaxation-2026-11-16/REVIEW.md), tag `KRR`; both **P + C**):
   - Antiholomorphic Stein Lemma 1 and its two first-order radial forms `(I)` and `(II)`;
   - Pointwise Cauchy–Schwarz $|a|^2 \le c_1 c_2$;
   - Kernel variance identities $\mathbb{E}[(c_2 - 1)^2] = 16n + 4h$ (`KAS` Theorem 2(d)) and $\mathbb{E}[(c_1 - 2)^2] = 32n + 16h + 16b + 48y + 16z$ (`KRR` §2.3), hence $2\mathbb{E}[(c_2 - 1)(c_1 - 2)] = \mathbb{E}[(c_1 + c_2 - 3)^2] - \mathbb{E}[(c_2 - 1)^2] - \mathbb{E}[(c_1 - 2)^2] = 32n + 48y + 16z$;
   - Third-order contraction norm $\mathbb{E}[w] = \sum_k \|W_k\|_2^2 = \frac{1}{4}\|P_{3,1}(q^2)\|_2^2 = 24y$ (`KAS` Theorem 2(c); re-derived in tensor coordinates in `KRR` `REVIEW.md` §2.3 step 5, and again in Proposition 2 below).
3. **New analytic inputs proved in §1 below** (**P, author only**; polynomial cases checked in exact `Fraction` arithmetic up to $d = 6$ by [`check_identities_exact.py`](../../code/complex-radius-gemini-2762/check_identities_exact.py), **C, author only**):
   - Pointwise Cauchy–Schwarz $|b_{\mathrm{loc}}|^2 \le c_2 w$, giving $\tilde\beta^2 \le V c_2 w$ (Proposition 2);
   - Two third-order radial Stein identities `(III)` and `(IV)` obtained by applying Form I of Lemma 1 to $\bar q (c_2 - u) g_3(V)$ and $q \bar a g_4(V)$, together with $C^1([0, \infty))$ regularity of spline test ratios $g_i = G_i/v$ (Theorem 3).

---

## 1. Third-order antiholomorphic Stein identities

Write $\partial_j = \partial/\partial z_j$ and $\bar\partial_j = \partial/\partial \bar z_j$ for the Wirtinger derivatives on $\mathbb{C}^n$, so $\overline{\partial_j H} = \bar\partial_j \bar H$ and $\partial_j \bar\partial_k = \bar\partial_k \partial_j$. Recall Lemma 1 of `KAS` (`NOTE.md` §1):

**Lemma 1** (`KAS`, **P**). *For any polynomial $q \in H_{2,1}(\mathbb{C}^n)$ and any $H \in C^1(\mathbb{C}^n)$ with $H, \nabla H$ of polynomial growth,*
$$\mathbb{E}[H q] = \sum_{j=1}^n \mathbb{E}\big[(\partial_j H)\,\bar\partial_j q\big] \qquad \text{and} \qquad \mathbb{E}[H q] = \frac{1}{2}\sum_{j=1}^n \mathbb{E}\big[(\bar\partial_j H)\,\partial_j q\big].$$

For $q \in H_{2,1}(\mathbb{C}^n)$ with $u = \mathbb{E}|q|^2 > 0$, put $V = |q|^2 = q\bar q$ and $F_k := \bar\partial_k q \in H_{2,0}(\mathbb{C}^n)$, and define:
$$c_1 := \sum_{j=1}^n |\partial_j q|^2, \qquad c_2 := \sum_{k=1}^n |F_k|^2, \qquad a := \sum_{j=1}^n (\partial_j q)\,F_j,$$
$$W_k := \sum_{j=1}^n F_j (\partial_j F_k) \in H_{3,0}(\mathbb{C}^n), \qquad w := \sum_{k=1}^n |W_k|^2, \qquad b_{\mathrm{loc}} := \sum_{k=1}^n \overline{F_k}\,W_k.$$
On $\{V > 0\}$ set $\rho := \operatorname{Re}(\bar q^2 a)/V$, and everywhere set $\alpha_2 := |a|^2$ and $\tilde\beta := \operatorname{Re}(\bar q\,b_{\mathrm{loc}})$.

**Proposition 2** (**P, author only**; exact polynomial check **C, author only**). *For every $q \in H_{2,1}(\mathbb{C}^n)$:*
1. *(Holomorphic derivative identities)* *For every $j, k \in \{1, \dots, n\}$, $\partial_j \overline{F_k} = 0$, $\partial_j c_2 = \sum_{k=1}^n (\partial_j F_k)\overline{F_k}$, and*
   $$\bar\partial_k a = W_k, \qquad \partial_k \bar a = \overline{W_k}.$$
2. *(Pointwise cone)* *At every point $z \in \mathbb{C}^n$, $c_1 \ge 0$, $c_2 \ge 0$, $w \ge 0$, $|b_{\mathrm{loc}}|^2 \le c_2 w$, and*
   $$\tilde\beta^2 \le V c_2 w, \qquad (\operatorname{Re}(\bar q^2 a))^2 \le V^2 \alpha_2 \le V^2 c_1 c_2.$$
3. *(First moment of $w$)* *With the normalised contraction invariant $y$ of `GramTensor.lean` (`check_budgets_exact.py`),*
   $$\mathbb{E}[w] = \sum_{k=1}^n \mathbb{E}|W_k|^2 = 24 y\,u^2.$$

*Proof.*
(1) Since $q = \sum_{a,b,c} t_{abc}(z_a z_b \bar z_c - \delta_{ac} z_b - \delta_{bc} z_a)$ has antiholomorphic degree $1$, $F_k = \bar\partial_k q = \sum_{a,b} t_{abk} z_a z_b$ is a homogeneous holomorphic quadratic polynomial. Hence $\bar\partial_j F_k = 0$ and $\partial_j \overline{F_k} = \overline{\bar\partial_j F_k} = 0$. Differentiating $c_2 = \sum_k F_k \overline{F_k}$ gives $\partial_j c_2 = \sum_k (\partial_j F_k)\overline{F_k}$. Differentiating $a = \sum_j (\partial_j q) F_j$ by $\bar\partial_k$ and using $\bar\partial_k F_j = 0$ together with $\bar\partial_k \partial_j q = \partial_j \bar\partial_k q = \partial_j F_k$ gives
$$\bar\partial_k a = \sum_{j=1}^n (\bar\partial_k \partial_j q) F_j + \sum_{j=1}^n (\partial_j q)(\bar\partial_k F_j) = \sum_{j=1}^n F_j (\partial_j F_k) = W_k.$$
Conjugating gives $\partial_k \bar a = \overline{\bar\partial_k a} = \overline{W_k}$. (Crucially, because $\bar\partial_k F_j \equiv 0$, no second-order antiholomorphic derivative of $q$ appears.)

(2) By Cauchy–Schwarz in $\mathbb{C}^n$, $|a|^2 = |\sum_j (\partial_j q) F_j|^2 \le (\sum_j |\partial_j q|^2)(\sum_j |F_j|^2) = c_1 c_2$ and $|b_{\mathrm{loc}}|^2 = |\sum_k \overline{F_k} W_k|^2 \le (\sum_k |F_k|^2)(\sum_k |W_k|^2) = c_2 w$. Since $(\operatorname{Re}(\bar q^2 a))^2 \le |\bar q^2 a|^2 = V^2 |a|^2 = V^2 \alpha_2$ and $\tilde\beta^2 = (\operatorname{Re}(\bar q b_{\mathrm{loc}}))^2 \le |\bar q|^2 |b_{\mathrm{loc}}|^2 = V |b_{\mathrm{loc}}|^2 \le V c_2 w$, both chains hold everywhere.

(3) Since $t_{jek} = t_{ejk}$, $\partial_j F_k = 2 \sum_{e=1}^n t_{jek} z_e$, so
$$W_k(z) = 2 \sum_{a,b,e=1}^n \Big(\sum_{j=1}^n t_{abj} t_{jek}\Big) z_a z_b z_e = 2 \sum_{a,b,e=1}^n W^{\mathrm{sym}}_{abe;k}\,z_a z_b z_e,$$
where $W^{\mathrm{sym}}_{abe;k} = \frac{1}{6}\sum_{\pi \in S_3} W_{\pi(a)\pi(b)\pi(e);k}$ is the symmetrisation in $(a, b, e)$ of $W_{abe;k} = \sum_j t_{abj} t_{jek}$. For i.i.d. standard complex Gaussians, $\mathbb{E}[z_a z_b z_e \overline{z_{a'} z_{b'} z_{e'}}] = \sum_{\pi \in S_3} \delta_{a,\pi(a')}\delta_{b,\pi(b')}\delta_{e,\pi(e')}$, so for any symmetric cubic tensor $S_{abe}$ one has $\mathbb{E}|\sum_{a,b,e} S_{abe} z_a z_b z_e|^2 = 6 \sum_{a,b,e} |S_{abe}|^2$. Summing over $k$ gives
$$\mathbb{E}[w] = \sum_{k=1}^n 4 \cdot 6 \sum_{a,b,e=1}^n |W^{\mathrm{sym}}_{abe;k}|^2 = 24 \sum_{a,b,e,k} |W^{\mathrm{sym}}_{abe;k}|^2 = 24 y\,u^2$$
by the definition $y = u^{-2}\sum_{a,b,e,k}|W^{\mathrm{sym}}_{abe;k}|^2$. $\square$

**Theorem 3 (Third-order radial Stein identities)** (**P, author only**; polynomial tests **C, author only**). *Let $g \in C^1([0, \infty), \mathbb{R})$ have $g$ and $g'$ of polynomial growth, and put $G(v) := v g(v)$, $\phi(v) := G'(v) = g(v) + v g'(v)$, and $Y(v) := \phi(v) - g(v) = v g'(v)$. For every $q \in H_{2,1}(\mathbb{C}^n)$ with $u = \mathbb{E}|q|^2$:*
$$\mathbb{E}\Big[ c_2(c_2 - u)\phi(V) - (c_2 - u)G(V) + (c_2 - u)\operatorname{Re}(\bar q^2 a) g'(V) + \tilde\beta\,g(V) \Big] = 0, \tag{III}$$
$$\mathbb{E}\Big[ \alpha_2\,\phi(V) - \operatorname{Re}(\bar q^2 a) g(V) + c_2 \operatorname{Re}(\bar q^2 a) g'(V) + \tilde\beta\,g(V) \Big] = 0. \tag{IV}$$
*On $\{V > 0\}$ (which has full Gaussian measure whenever $q \ne 0$), $\operatorname{Re}(\bar q^2 a) g(V) = \rho G(V)$ and $\operatorname{Re}(\bar q^2 a) g'(V) = \rho Y(V)$.*

*Moreover, if $0 = u_0 < u_1 < \dots < u_K$ and $\phi : [0, \infty) \to \mathbb{R}$ is continuous, affine on each $[u_k, u_{k+1}]$ ($0 \le k < K$), and constant on $[u_K, \infty)$ (or affine with linear slope $\kappa v$), then $G(v) = \int_0^v \phi(t)\,dt$ satisfies $g(v) := G(v)/v \in C^1([0, \infty))$ literally, with $g$ and $g'$ of polynomial growth.*

*Proof.*
First check regularity of $g(v) = G(v)/v$ for such a spline $\phi$. Since $\phi$ is continuous on $[0, \infty)$, $G(v) = \int_0^v \phi(t)\,dt$ is $C^1([0, \infty))$ with $G'(v) = \phi(v)$. On $(0, \infty)$, $1/v$ is smooth, so $g = G/v \in C^1((0, \infty))$ with derivative $g'(v) = (v\phi(v) - G(v))/v^2$, which is continuous across every positive knot $u_k > 0$ because both $\phi$ and $G$ are continuous there. On $[0, u_1]$ ($u_1 > 0$), $\phi(v) = \alpha + \beta v$ is affine, so $G(v) = \alpha v + \frac{1}{2}\beta v^2$ and $g(v) = \alpha + \frac{1}{2}\beta v$ for all $v \in (0, u_1]$; setting $g(0) = \alpha$ makes $g$ affine (hence $C^\infty$) on $[0, u_1)$. On $[u_K, \infty)$, $\phi(v) = c + \kappa v$ gives $g(v) = c + \frac{1}{2}\kappa v + C/v$ and $g'(v) = \frac{1}{2}\kappa - C/v^2$, both of polynomial growth (and bounded when $\kappa = 0$). Since $V(z) = |q(z)|^2 \in C^\infty(\mathbb{C}^n, [0, \infty))$ is a polynomial, the composition $g \circ V$ lies in $C^1(\mathbb{C}^n)$ by the chain rule, with $\partial_j(g(V)) = g'(V)\,\partial_j V = g'(V)(\bar q\,\partial_j q + q\,\overline{F_j})$ continuous and of polynomial growth on $\mathbb{C}^n$.

For **(III)**, apply the first identity of Lemma 1 to $H = \bar q (c_2 - u) g(V) \in C^1(\mathbb{C}^n)$. The left-hand side is $\mathbb{E}[H q] = \mathbb{E}[(c_2 - u) V g(V)] = \mathbb{E}[(c_2 - u) G(V)]$. By the product rule and Proposition 2(1) ($\partial_j \bar q = \overline{F_j}$ and $\partial_j c_2 = \sum_k (\partial_j F_k)\overline{F_k}$),
$$\sum_{j=1}^n (\partial_j H) F_j = \sum_{j=1}^n \overline{F_j} F_j (c_2 - u) g(V) + \bar q g(V) \sum_{j,k=1}^n F_j (\partial_j F_k)\overline{F_k} + \bar q (c_2 - u) g'(V) \sum_{j=1}^n (\bar q\,\partial_j q + q\,\overline{F_j}) F_j$$
$$= c_2(c_2 - u) g(V) + \bar q\,b_{\mathrm{loc}}\,g(V) + c_2(c_2 - u) V g'(V) + (c_2 - u)\bar q^2 a\,g'(V).$$
Taking expectations, taking real parts, using $g(V) + V g'(V) = \phi(V)$ and $\operatorname{Re}(\bar q\,b_{\mathrm{loc}}) = \tilde\beta$, and subtracting $\mathbb{E}[(c_2 - u)G(V)]$ yields (III).

For **(IV)**, apply the first identity of Lemma 1 to $H = q \bar a g(V) \in C^1(\mathbb{C}^n)$. The left-hand side is $\mathbb{E}[H q] = \mathbb{E}[q^2 \bar a g(V)]$, whose real part is $\mathbb{E}[\operatorname{Re}(\bar q^2 a) g(V)]$. By the product rule and Proposition 2(1) ($\partial_j \bar a = \overline{W_j}$),
$$\sum_{j=1}^n (\partial_j H) F_j = \sum_{j=1}^n (\partial_j q) F_j \bar a g(V) + q g(V) \sum_{j=1}^n F_j \overline{W_j} + q \bar a g'(V) \sum_{j=1}^n (\bar q\,\partial_j q + q\,\overline{F_j}) F_j$$
$$= |a|^2 g(V) + q\,\overline{b_{\mathrm{loc}}}\,g(V) + |a|^2 V g'(V) + c_2 q^2 \bar a\,g'(V).$$
Taking expectations and real parts (noting $\operatorname{Re}(q\,\overline{b_{\mathrm{loc}}}) = \operatorname{Re}(\bar q\,b_{\mathrm{loc}}) = \tilde\beta$ and $\operatorname{Re}(q^2 \bar a) = \operatorname{Re}(\bar q^2 a)$) gives
$$\mathbb{E}[\operatorname{Re}(\bar q^2 a) g(V)] = \mathbb{E}\Big[\alpha_2\,\phi(V) + \tilde\beta\,g(V) + c_2 \operatorname{Re}(\bar q^2 a) g'(V)\Big],$$
which rearranges to (IV). For $q \ne 0$, $\{V = 0\}$ is the zero locus of a nonconstant polynomial on $\mathbb{R}^{2n}$ and thus has Lebesgue (and Gaussian) measure zero, so replacing $\operatorname{Re}(\bar q^2 a)g(V)$ by $\rho G(V)$ and $\operatorname{Re}(\bar q^2 a)g'(V)$ by $\rho Y(V)$ does not change the expectations. $\square$

---

## 2. Pointwise quadratic reduction and soundness of a certificate row

Fix a nonzero cubic $q \in H_{2,1}(\mathbb{C}^n)$ normalised to $u = \mathbb{E}|q|^2 = 1$, with $s = \mathbb{E}V^2 - 2 \in [0, 42]$ and contraction scalars $\pi = (n, h, b, y, z)$.

### 2.1 Row data and checked conditions `(C1)`–`(C3)`

A row of `cert_916.json` on $[s_{\mathrm{lo}}, s_{\mathrm{hi}}] \subset [0, 42]$ specifies:
- Rational radial knots $0 = e_0 < e_1 < \dots < e_K$, with $u_k = e_k^2$;
- Eight continuous functions of $v \ge 0$ that are affine on each $[u_k, u_{k+1}]$ and constant on $[u_K, \infty)$, stored as exact integer numerators over a positive integer denominator `knot_den`:
  $$\hat\phi_1, \hat\phi_2, \phi_3, \phi_4, \psi_a, \xi_2, \xi_1, \xi_a;$$
- Two rational slopes $(\mathrm{sl}_1, \mathrm{sl}_2)$, defining $\phi_1(v) = \hat\phi_1(v) + \mathrm{sl}_1 v$ and $\phi_2(v) = \hat\phi_2(v) + \mathrm{sl}_2 v$ (while $\phi_3, \phi_4$ have zero linear slope and are constant beyond $u_K$), with primitives $G_i(v) = \int_0^v \phi_i(t)\,dt$ and $Y_i(v) = \phi_i(v) - G_i(v)/v$;
- Rational scalars $\lambda_0, \lambda_1, \lambda_2 \in \mathbb{Q}$, $l_3 = (l_{3s}, l_{3a}, l_{3b}) \in \mathbb{Q}_{\ge 0}^3$ with $\lambda_3 := l_{3s} + l_{3a} + l_{3b} > 0$, a symmetric $2 \times 2$ matrix $M_{\mathrm{ker}} = \begin{pmatrix} m_{00} & m_{01} \\ m_{01} & m_{11} \end{pmatrix}$ with $m_{00} \ge 0$, $m_{11} > 0$, $m_{00} m_{11} - m_{01}^2 \ge 0$, scalars $\mu_a \ge 0$, $\mu_\rho > 0$, $\mu_w > 0$, $\sigma \in \mathbb{Q}$, and per nonzero endpoint $s_e \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\}$ rational weak-duality multipliers (`par`).

For $v = r^2 > 0$, define the entries of the symmetric $4 \times 4$ matrix $P(r)$ on $(c_2, c_1, \rho, 1)$ by
$$P(r) := \begin{pmatrix} M_{11}(v) & M_{12}(v) & M_{13}(v) & b_1(v) \\ M_{12}(v) & m_{11} & 0 & b_2(v) \\ M_{13}(v) & 0 & M_{33}(v) & b_3(v) \\ b_1(v) & b_2(v) & b_3(v) & q_1(r) \end{pmatrix},$$
where:
$$\begin{aligned}
M_{11}(v) &= m_{00} - \phi_3(v), \qquad M_{12}(v) = m_{01} - \tfrac{1}{2}\psi_a(v), \qquad M_{13}(v) = -\tfrac{1}{2}\big(Y_3(v) + Y_4(v)\big), \\
M_{33}(v) &= \mu_\rho + \mu_a + \psi_a(v) - \phi_4(v), \\
b_1(v) &= \tfrac{1}{2}\left(-\phi_1(v) + \phi_3(v) + G_3(v) - 2m_{00} - 4m_{01} - \frac{(G_3(v) + G_4(v))^2}{4\mu_w v} - \xi_2(v)\right), \\
b_2(v) &= \tfrac{1}{2}\left(-\tfrac{1}{2}\phi_2(v) - 2m_{01} - 4m_{11} - \xi_1(v)\right), \\
b_3(v) &= \tfrac{1}{2}\left(-Y_1(v) - \tfrac{1}{2}Y_2(v) + \sigma v + Y_3(v) + G_4(v) - \xi_a(v)\right), \\
q_1(r) &= \lambda_0 + m_{00} + 4m_{01} + 4m_{11} + \lambda_1 v + \lambda_2 v^2 + \lambda_3 v^3 + G_1(v) + G_2(v) - G_3(v) - r.
\end{aligned}$$
(On $[0, u_1]$, $G_i(0) = 0$ divides $G_i(v)$ by $v$, so $Y_i(v)$ and $(G_3(v)+G_4(v))^2/(4\mu_w v)$ extend as exact polynomials to $r = 0$.)

Let $D_1(v) = M_{11}(v)$, $D_2(v) = m_{11} M_{11}(v) - M_{12}(v)^2$, $D_3(v) = \det P(r)_{1..3,1..3}$, and $D_4(r) = \det P(r)$ be the four leading principal minors of $P(r)$. Both exact verifiers check:
- **`(C1)`**: Scalar signs ($l_3 \ge 0$, $\lambda_3 > 0$, $m_{00} \ge 0$, $m_{11} > 0$, $m_{00}m_{11} \ge m_{01}^2$, $\mu_a \ge 0$, $\mu_\rho > 0$, $\mu_w > 0$) and at every knot $k = 0, \dots, K$:
  $$\xi_2(u_k) \ge 0, \quad \xi_1(u_k) \ge 0, \quad \xi_a(u_k)^2 \le 4\xi_1(u_k)\xi_2(u_k),$$
  $$\psi_a(u_k) \ge 0, \quad \psi_a(u_k) + \mu_a - \phi_4(u_k) \ge 0, \quad D_1(u_k) > 0, \quad D_2(u_k) > 0.$$
- **`(C2)`**: On $[0, e_1]$, $D_2(r^2) > 0$, $D_3(r^2) > 0$, $D_4(r) > 0$; and on every $[e_k, e_{k+1}]$ ($1 \le k < K$) and on $[e_K, \infty)$ (where $v = r^2 \ge e_1^2 > 0$), $D_2(r^2) > 0$, $v^2 D_3(r^2) > 0$, and $v^3 D_4(r) > 0$.
  *(Note on the infinite ray $[e_K, \infty)$: there $\phi_3, \phi_4, \psi_a, \xi$ are constant, so $D_1, D_2$ are positive constants, $v Y_3$ and $v Y_4$ are constants, $v^2 D_3(v) = M_{33}(u_K) D_2(u_K) v^2 - m_{11}(v M_{13})^2$, and $v^3 D_4(r)$ is a polynomial of degree $12$ in $r$ with leading term $+\lambda_3 M_{33}(u_K) D_2(u_K) r^{12} > 0$, since all terms of $v^3 b(v)^\top \operatorname{adj}(M_3(v)) b(v)$ have degree at most $10$ in $r$.)*
- **`(C3)`**: At each nonzero endpoint $s_e \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\}$, with rational $\mathrm{sb} \ge \sqrt{s_e}$ (`sb * sb >= s_e`), rational $\alpha = (\alpha_1, \alpha_2) \in \mathbb{Q}_{>0}^2$, rational $\eta$, and nonnegative multipliers $y_k \ge 0$ on valid homogeneous Lean cuts $a_k \cdot p \ge 0$: setting
  $$d_{\mathrm{lin}} = \begin{pmatrix} 16m_{00} + 32m_{01} + 32m_{11} \\ 4m_{00} + 16m_{11} \\ 16m_{11} + 32(\mu_a + \mu_\rho + \sigma) \\ 48m_{01} + 48m_{11} + 24(\mu_a + \mu_\rho + \mu_w) + 48\sigma \\ 16m_{01} + 16m_{11} \end{pmatrix},$$
  $$d_J(\alpha) = l_{3a}\Big(150\alpha_1 s_0 + \big(198 + \tfrac{150}{\alpha_1}\big)h_0\Big) + l_{3b}\Big(\tfrac{135}{2}\alpha_2 s_0 + \big(\tfrac{11781}{32} + \tfrac{135}{2\alpha_2}\big)h_0\Big),$$
  and $\mathrm{resid} = d_{\mathrm{lin}} + \mathrm{sb}\,d_J(\alpha) - \eta(32, 8, 32, 96, 0) + \sum_k y_k a_k$, define
  $$L_e := \eta + \sum_{i=1}^5 \max(\mathrm{resid}_i, 0)\,P_{\max,i}, \qquad P_{\max} = \big(\tfrac{1}{32}, \tfrac{1}{8}, \tfrac{1}{32}, \tfrac{1}{96}, \tfrac{3}{64}\big),$$
  and $B(s_e) := \lambda_0 + \lambda_1 + \lambda_2(2 + s_e) + l_{3s}(6 + 9s_e + C_6 s_e\,\mathrm{sb}) + (l_{3a} + l_{3b})(6 + 9s_e) + s_e L_e$ (with $B(0) := \lambda_0 + \lambda_1 + 2\lambda_2 + 6\lambda_3$).

**Theorem 4 (Row soundness)** (**P, author only**). *If a row passes `(C1)`–`(C3)`, then every $q \in H_{2,1}(\mathbb{C}^n)$ with $\mathbb{E}|q|^2 = 1$ and $s = \mathbb{E}|q|^4 - 2 \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$ satisfies*
$$\mathbb{E}|q| \le \max\big(B(s_{\mathrm{lo}}),\, B(s_{\mathrm{hi}})\big).$$

*Proof.*
**Step 1 (Pointwise majorant on $\{V > 0\}$).** On $\{V > 0\}$, put $v = V$ and $r = \sqrt{V} = |q|$. Let
$$\begin{aligned}
\mathrm{Br}_1 &= G_1(V) - c_2 \phi_1(V) - \rho Y_1(V), \\
\mathrm{Br}_2 &= G_2(V) - \tfrac{1}{2} c_1 \phi_2(V) - \tfrac{1}{2} \rho Y_2(V), \\
\mathrm{Br}_3 &= c_2(c_2 - 1)\phi_3(V) - (c_2 - 1)G_3(V) + (c_2 - 1)\rho Y_3(V) + \tilde\beta\,g_3(V), \\
\mathrm{Br}_4 &= \alpha_2\,\phi_4(V) - \rho G_4(V) + c_2 \rho Y_4(V) + \tilde\beta\,g_4(V),
\end{aligned}$$
and define
$$\mathrm{RHS} := \lambda_0 + \lambda_1 V + \lambda_2 V^2 + \lambda_3 V^3 + \mathrm{Br}_1 + \mathrm{Br}_2 - \mathrm{Br}_3 - \mathrm{Br}_4 + \sigma V\rho + \begin{pmatrix} c_2 - 1 \\ c_1 - 2 \end{pmatrix}^\top M_{\mathrm{ker}} \begin{pmatrix} c_2 - 1 \\ c_1 - 2 \end{pmatrix} + \mu_a \alpha_2 + \mu_\rho \rho^2 + \mu_w w.$$
Expanding $\mathrm{RHS} - r$ gives
$$\begin{aligned}
\mathrm{RHS} - r &= q_1(r) + (-\phi_1 + \phi_3 + G_3 - 2m_{00} - 4m_{01})c_2 + (-\tfrac{1}{2}\phi_2 - 2m_{01} - 4m_{11})c_1 \\
&\quad + (-Y_1 - \tfrac{1}{2}Y_2 + \sigma v + Y_3 + G_4)\rho + (m_{00} - \phi_3)c_2^2 + m_{11} c_1^2 + 2m_{01} c_1 c_2 \\
&\quad - (Y_3 + Y_4) c_2 \rho + \mu_\rho \rho^2 + (\mu_a - \phi_4)\alpha_2 + \mu_w w - (g_3 + g_4)\tilde\beta.
\end{aligned}$$
We bound the last three terms from below using Proposition 2(2) and `(C1)`:
1. *Elimination of $(w, \tilde\beta)$:* Since $\mu_w > 0$ and $\tilde\beta^2 \le v c_2 w$, if $c_2 = 0$ then $\tilde\beta = 0$ and $\mu_w w - (g_3 + g_4)\tilde\beta = \mu_w w \ge 0 = -\frac{(G_3 + G_4)^2}{4\mu_w v}c_2$. If $c_2 > 0$, then $w \ge \tilde\beta^2/(v c_2)$, so completing the square in $\tilde\beta$ gives
   $$\mu_w w - (g_3 + g_4)\tilde\beta \ge \frac{\mu_w}{v c_2}\left(\tilde\beta - \frac{v c_2 (g_3 + g_4)}{2\mu_w}\right)^2 - \frac{v(g_3 + g_4)^2}{4\mu_w}c_2 \ge -\frac{(G_3 + G_4)^2}{4\mu_w v}c_2.$$
2. *Elimination of $\alpha_2$:* Since $\psi_a(v)$ and $\psi_a(v) + \mu_a - \phi_4(v)$ are affine on every knot interval, constant on $[u_K, \infty)$, and nonnegative at all knots by `(C1)`, both are $\ge 0$ for all $v \ge 0$. Because $\rho^2 \le \alpha_2 \le c_1 c_2$,
   $$(\mu_a - \phi_4(v))\alpha_2 = \big(\psi_a(v) + \mu_a - \phi_4(v)\big)\alpha_2 - \psi_a(v)\alpha_2 \ge \big(\psi_a(v) + \mu_a - \phi_4(v)\big)\rho^2 - \psi_a(v) c_1 c_2.$$
3. *Cone pairing:* The rotated second-order cone $\mathcal{C}^* = \{(\xi_2, \xi_1, \xi_a) : \xi_2, \xi_1 \ge 0, \, \xi_a^2 \le 4\xi_1\xi_2\}$ is convex, so `(C1)` at the knots implies $\xi(v) \in \mathcal{C}^*$ for all $v \ge 0$. Since $c_1, c_2 \ge 0$ and $|\rho| \le \sqrt{c_1 c_2}$,
   $$\xi_2(v) c_2 + \xi_1(v) c_1 + \xi_a(v)\rho \ge \xi_2 c_2 + \xi_1 c_1 - 2\sqrt{\xi_1 \xi_2 c_1 c_2} = \big(\sqrt{\xi_2 c_2} - \sqrt{\xi_1 c_1}\big)^2 \ge 0.$$

Subtracting $\xi_2 c_2 + \xi_1 c_1 + \xi_a \rho \ge 0$ after applying (1) and (2) yields the exact matrix identity
$$\mathrm{RHS} - r \ge \begin{pmatrix} c_2 \\ c_1 \\ \rho \\ 1 \end{pmatrix}^\top P(r) \begin{pmatrix} c_2 \\ c_1 \\ \rho \\ 1 \end{pmatrix}.$$
By `(C1)`, $D_1(v) = m_{00} - \phi_3(v)$ is affine on each piece and positive at every knot, hence $D_1(r^2) > 0$ for all $r > 0$. By `(C2)` (using $v = r^2 > 0$ on $r \ge e_1 > 0$), all four leading principal minors $D_1, D_2, D_3, D_4$ of $P(r)$ are strictly positive for all $r > 0$. By Sylvester's criterion, $P(r)$ is strictly positive definite, so $\mathrm{RHS} \ge r = |q|$ everywhere on $\{V > 0\}$.

**Step 2 (Integration and convexity in $s$).** Because $\{V = 0\}$ has measure zero, $\mathbb{E}|q| \le \mathbb{E}[\mathrm{RHS}]$. By Lemma 1 and Theorem 3, $\mathbb{E}[\mathrm{Br}_i] = 0$ for $i = 1, 2, 3, 4$. Using $\mathbb{E}V = 1$, $\mathbb{E}V^2 = 2 + s$, the three upper bounds on $\mathbb{E}V^3$ with nonnegative weights $(l_{3s}, l_{3a}, l_{3b})$, the exact second moments of $(c_2 - 1, c_1 - 2)$, $\mathbb{E}|a|^2 = 32b + 24y$, $\mu_\rho \mathbb{E}[\rho^2] \le \mu_\rho \mathbb{E}|a|^2$ ($\mu_\rho > 0$), $\mathbb{E}[w] = 24y$ (Proposition 2(3)), and $\mathbb{E}[V\rho] = 32b + 48y$, we obtain for every $\alpha = (\alpha_1, \alpha_2) \in (0, \infty)^2$:
$$\mathbb{E}|q| \le \mathrm{base}(s) + d_{\mathrm{lin}} \cdot \pi + \sqrt{s}\,d_J(\alpha) \cdot \pi,$$
where $\mathrm{base}(s) = \lambda_0 + \lambda_1 + \lambda_2(2 + s) + l_{3s}(6 + 9s + C_6 s^{3/2}) + (l_{3a} + l_{3b})(6 + 9s)$. If $s = 0$, then $32n + 8h + 32b + 96y = 0$ with $n, h, b, y \ge 0$ and $z^2 \le nh$, so $\pi = 0$ and $\mathbb{E}|q| \le \mathrm{base}(0) = B(0)$. For $s > 0$, write $\pi = s p$; since every inequality on $\pi$ in `(F3)` is homogeneous, $p$ belongs to the $s$-independent set $P_1$. On $P_1$, $32n + 8h + 32b + 96y = 1$ with $n, h, b, y \ge 0$ gives $n \le 1/32$, $h \le 1/8$, $b \le 1/32$, $y \le 1/96$, and $h_0 \ge 0$ gives $16z \le 8n + 2h + 8b + 72y = \frac{1}{4}(1 - 96y) + 72y = \frac{1}{4} + 48y \le \frac{3}{4}$, so $0 \le p \le P_{\max}$ componentwise. Minimising over $\alpha > 0$ at fixed $p \in P_1$ gives
$$\mathbb{E}|q| \le f_p(s) := \mathrm{base}(s) + s(d_{\mathrm{lin}} \cdot p) + s^{3/2} C(p), \qquad C(p) := \inf_{\alpha > 0} d_J(\alpha) \cdot p \ge 0$$
(as $l_{3a}, l_{3b} \ge 0$ and $s_0, h_0 \ge 0$). Since $l_{3s} C_6 \ge 0$ and $C(p) \ge 0$, $f_p(s)$ is convex on $[0, \infty)$, so $f_p(s) \le \max(f_p(s_{\mathrm{lo}}), f_p(s_{\mathrm{hi}}))$ for all $s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$.

**Step 3 (Endpoint weak duality).** At a nonzero endpoint $s_e$, choosing the row's $\alpha_e > 0$ and using $d_J(\alpha_e) \cdot p \ge 0$ with $\mathrm{sb} \ge \sqrt{s_e}$ and $l_{3s} C_6 \ge 0$ gives
$$f_p(s_e) \le \lambda_0 + \lambda_1 + \lambda_2(2 + s_e) + l_{3s}(6 + 9s_e + C_6 s_e\,\mathrm{sb}) + (l_{3a} + l_{3b})(6 + 9s_e) + s_e\big(d_{\mathrm{lin}} + \mathrm{sb}\,d_J(\alpha_e)\big)\cdot p.$$
Since $(32, 8, 32, 96, 0) \cdot p = 1$, $y_k \ge 0$, $a_k \cdot p \ge 0$, and $0 \le p_i \le P_{\max,i}$,
$$\big(d_{\mathrm{lin}} + \mathrm{sb}\,d_J(\alpha_e)\big)\cdot p = \eta + \mathrm{resid}\cdot p - \sum_k y_k(a_k \cdot p) \le \eta + \sum_{i=1}^5 \max(\mathrm{resid}_i, 0)\,P_{\max,i} = L_e,$$
hence $f_p(s_e) \le B(s_e)$. $\square$

---

## 3. Exact verification, independent second verifier, and replay

All scripts and the certificate reside in [`code/complex-radius-gemini-2762/`](../../code/complex-radius-gemini-2762/):

| file | size | role |
|---|---:|---|
| `cert_916.json` | 241,550 B | 23-row rational certificate covering $s \in [0, 42]$, claim `2289/2500` (`0.9156`), SHA-256 `cf0cc1a0d95ebb08db44b90afd2179ac47b1a185477eeddc7288926862f5abab` |
| `verify_cert.py` | stdlib only | Primary exact verifier (`python3 -I`): integer Sturm chains on every interval and on $[e_K, \infty)$ |
| `verify_bernstein.py` | stdlib only | Second independent exact verifier (`python3 -I`): direct $4 \times 4$ recursive determinants of $S(r)P(r)S(r)$, trapezoid-rule primitives, named linear forms, and integer Bernstein subdivision |
| `check_identities_exact.py` | stdlib only | Exact `Fraction` polynomial check (`python3 -I`) of $\bar\partial_k a = W_k$, $\mathbb{E}[w] = 24y u^2$, kernel moments, and `(I)`–`(IV)` on 25 cubics in $d = 1, \dots, 6$ |
| `negative_controls.py` | stdlib only | 14 polynomial positivity unit tests + 49 adversarial row/cover mutations + 20 differential boundary perturbations (`python3 -I`) |
| `validate_cubics.py` | NumPy | End-to-end check on 8 genuine cubics: exact endpoint weak-duality slacks (**C**), 1D quadrature on the Wick monomial (**N**), and Monte Carlo pointwise/expectation checks (**N**) |
| `make_cert.py` | NumPy/SciPy/Clarabel | Standalone conic search + dyadic rounding + LP polish generator |

### Replay commands

From `research/conjecture-K/code/complex-radius-gemini-2762/`:
```sh
python3 -I verify_cert.py cert_916.json
python3 -I verify_bernstein.py cert_916.json
python3 -I check_identities_exact.py
python3 -I negative_controls.py cert_916.json
```
Both `verify_cert.py` and `verify_bernstein.py` require **only the Python 3 standard library** and run in isolated mode (`-I`), producing bit-identical exact rational bounds `B(s_lo)` and `B(s_hi)` on all 23 rows ([`REPLAY.log`](../../code/complex-radius-gemini-2762/REPLAY.log)).

### Row-by-row certified upper bounds

| row | $s$-interval | $K$ | $B(s_{\mathrm{lo}})$ | $B(s_{\mathrm{hi}})$ | certified row bound |
|---:|---|---:|---:|---:|---:|
| 0 | $[0, 1/2]$ | 133 | $0.8969328027$ | $0.9031327076$ | $0.9031327076$ |
| 1 | $[1/2, 1]$ | 133 | $0.9051071124$ | $0.9085554634$ | $0.9085554634$ |
| 2 | $[1, 3/2]$ | 133 | $0.9099997567$ | $0.9120067424$ | $0.9120067424$ |
| 3 | $[3/2, 2]$ | 133 | $0.9127647427$ | $0.9139070194$ | $0.9139070194$ |
| 4 | $[2, 5/2]$ | 133 | $0.9144571690$ | $0.9150535171$ | $0.9150535171$ |
| 5 | $[5/2, 3]$ | 154 | $0.9147590007$ | $0.9150341013$ | $0.9150341013$ |
| 6 | $[3, 13/4]$ | 154 | $0.9151286033$ | $0.9152574838$ | $0.9152574838$ |
| 7 | $[13/4, 7/2]$ | 154 | $0.9153453122$ | $0.9154192530$ | $0.9154192530$ |
| 8 | $[7/2, 15/4]$ | 154 | $0.9154869144$ | $0.9155127046$ | $0.9155127046$ |
| 9 | $[15/4, 4]$ | 154 | $0.9155408367$ | $0.9155408367$ | $0.9155408367$ |
| **10** | **$[4, 17/4]$** | **154** | **$0.9155502079$** | **$0.9155502079$** | **$0.9155502079$** |
| 11 | $[17/4, 9/2]$ | 154 | $0.9155361450$ | $0.9155359694$ | $0.9155361450$ |
| 12 | $[9/2, 19/4]$ | 154 | $0.9154954541$ | $0.9154765398$ | $0.9154954541$ |
| 13 | $[19/4, 5]$ | 154 | $0.9154233277$ | $0.9153721376$ | $0.9154233277$ |
| 14 | $[5, 11/2]$ | 154 | $0.9153232097$ | $0.9152283308$ | $0.9153232097$ |
| 15 | $[11/2, 6]$ | 154 | $0.9150544889$ | $0.9148615361$ | $0.9150544889$ |
| 16 | $[6, 7]$ | 154 | $0.9147094457$ | $0.9143544453$ | $0.9147094457$ |
| 17 | $[7, 8]$ | 133 | $0.9141151244$ | $0.9134544520$ | $0.9141151244$ |
| 18 | $[8, 10]$ | 133 | $0.9133375745$ | $0.9121958309$ | $0.9133375745$ |
| 19 | $[10, 14]$ | 133 | $0.9108677899$ | $0.9089691646$ | $0.9108677899$ |
| 20 | $[14, 20]$ | 133 | $0.9089792893$ | $0.9043548876$ | $0.9089792893$ |
| 21 | $[20, 30]$ | 133 | $0.8952143646$ | $0.8870256746$ | $0.8952143646$ |
| 22 | $[30, 42]$ | 133 | $0.8794227010$ | $0.8662181168$ | $0.8794227010$ |

---

## 4. Remarks on the second-moment obstruction and what remains open

1. **Why second-moment kernel relaxations could not reach $0.916$** (**N**, diagnostic only, not used in Theorem 1). In `STATUS.md` row 3.7, combining all constraints of the four second-moment certificates (`0.9387`, `0.9359`, `0.93462`, `0.93`) left a peak near $0.9286$ at $s \approx 5\text{--}6$. A local optimisation over genuine $4$-variable tensors $q \in H_{2,1}(\mathbb{C}^4)$ shows that even if the five contraction scalars $(n, h, b, y, z)$ are restricted to the exact image of genuine tensors (rather than the outer cone of Gram cuts), the relaxation using only `(I)`, `(II)`, the cone $\mathcal{C}$, the exact covariance matrix of $(c_1, c_2)$, $\mathbb{E}|a|^2$, $\mathbb{E}[V\rho]$, and the joint sixth-moment bounds still attains $\approx 0.9250$ at $s = 4$ (achieved near tensors interpolating between Hermitian-factor cubics and holomorphic-bulk cubics). In those extremal two-point pseudo-laws for $(V, c_1, c_2, \rho)$, the conditional variance of $c_2$ concentrates on a heavy tail atom while the bulk atom near $V \approx 0.85$ sits near $c_2 \approx 1$, $\rho \approx 0$. Identities `(III)` and `(IV)` couple the radial profile of $c_2(c_2 - 1)$ and $|a|^2$ directly to $\tilde\beta$, which is controlled pointwise by $\sqrt{V c_2 w}$ and globally by $\mathbb{E}[w] = 24y$, eliminating those pseudo-laws and lowering the peak by $\approx 0.013$ across the entire midrange.
2. **What remains open** (**open**). Theorem 1 settles the target $\rho^* \le 0.916$ of task #504 (`STATUS.md` row 3.21, `../higher-degree/STATUS.md` row 4.12), improving the certified upper bound from $0.93$ to $2289/2500 = 0.9156$. The sharp Gaussian limit $\rho^* = \sqrt{\pi}/2 = 0.8862269254\dots$ (`STATUS.md` row 3.6) remains **open**.
