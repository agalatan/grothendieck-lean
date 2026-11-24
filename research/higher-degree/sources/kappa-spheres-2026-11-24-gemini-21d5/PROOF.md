# Exact Defect Identity, Quantitative Odd-$c$ Hurwitz Gap, Closed-Form $c = 3$ Construction, and $C_{\mathrm{opt}} \in [1168/729, 2]$ for Trilinear Forms on Three Spheres (Issue #507)

- **Author:** `gemini-21d5`
- **Date:** 24 November 2026
- **Issue:** [#507](https://github.com/agalatan/grothendieck-lean/issues/507) (parent [#458](https://github.com/agalatan/grothendieck-lean/issues/458))
- **Ledger row:** [`research/higher-degree/STATUS.md`](../../STATUS.md) row `4.30` and §5 (`The κ question`)
- **Verification suite:** [`research/higher-degree/code/kappa-spheres-gemini-21d5/`](../../code/kappa-spheres-gemini-21d5/) (`python3 -I -O verify_kappa_spheres.py`, pure Python stdlib, AST-audited zero floats)

---

## 0. Executive Summary & Dependency Inventory

Fix $c \ge 1$ and let $x, y, w \sim \mathcal{CN}(0, I_c)$ be independent standard complex Gaussian vectors in $\mathbb{C}^c$ ($\mathbb{E}[x x^*] = I_c$). Let $R(x, y, w)$ be any nonzero trilinear polynomial in the span of the $3c^3$ monomials taking one coordinate from each cluster with **exactly one** of the three conjugated:
$$R(x, y, w) = A(\bar x, y, w) + B(x, \bar y, w) + C(x, y, \bar w),$$
where $A(\bar x, y, w) = \sum_{a,b,d} A_{abd}\bar x_a y_b w_d$, $B(x, \bar y, w) = \sum_{a,b,d} B_{abd} x_a \bar y_b w_d$, $C(x, y, \bar w) = \sum_{a,b,d} C_{abd} x_a y_b \bar w_d$ for complex tensors $A, B, C \in \mathbb{C}^{c \times c \times c}$, with $m_2 := \mathbb{E}|R|^2 = \alpha + \beta + \gamma > 0$ ($\alpha = \|A\|_F^2$, $\beta = \|B\|_F^2$, $\gamma = \|C\|_F^2$). For $\omega = (\omega_x, \omega_y, \omega_w)$ uniform on $(S^{2c-1})^3$ and $G = |R(\omega)|^2 / \mathbb{E}|R(\omega)|^2$,
$$\kappa(R) := \mathbb{E}[G^2] = \left(\frac{c}{c+1}\right)^{\!3} \frac{\mathbb{E}|R|^4}{(\mathbb{E}|R|^2)^2}.$$

Prior work in [#508](https://github.com/agalatan/grothendieck-lean/pull/508) ([`NOTE.md`](../kappa-three-cluster-2026-11-17/NOTE.md), `claude-b9ee` and `codex-6d92`) proved the spherical-projection floor $\kappa(R) \ge \kappa_0(c) := \frac{2c}{c+1} > 2 - \frac{2}{c}$, established attainment at $c = 2$ ($\frac{4}{3}$) and $c = 4$ ($\frac{8}{5}$), and inferred $C_{\mathrm{opt}} := \sup_{c \ge 2, R \ne 0} c(2 - \kappa(R)) \in [\frac{8}{5}, 2]$, leaving open the quantitative gap above $\kappa_0(c)$ for $c \notin \{2, 4\}$, the exact algebraic structure of the $c = 3$ numerical candidate `1.58002048` (comment #6 on [#507](https://github.com/agalatan/grothendieck-lean/issues/507#issuecomment-6996902883)), and explicit constructions for $c \ge 5$.

### Main Results (all **P + C**, author only, awaiting independent review)

1. **Theorem 1 — Exact Four-Square Gaussian & Spherical Defect Identity and Equality Characterization (**P + C**, author only):**
   Writing $u(y, w) := A(\cdot, y, w)$, $v_B(y, w) := B(\cdot, \bar y, w)$, $v_C(y, w) := C(\cdot, y, \bar w) \in \mathbb{C}^c$ and $S_0(y, w) := \|u\|^2 + \|v_B\|^2 + \|v_C\|^2$, we prove for every $c \ge 1$ and every $R$:
   $$\mathbb{E}|R|^4 - \frac{2(c+1)^2}{c^2}\,m_2^2 = 2\,\mathbb{E}\!\left(S_0(y,w) - \frac{m_2}{c^2}\|y\|^2\|w\|^2\right)^{\!2} + 4\,\mathbb{E}\big|\langle v_B, v_C\rangle\big|^2 + 4\,\mathbb{E}\big|u^\top v_B\big|^2 + 4\,\mathbb{E}\big|u^\top v_C\big|^2,$$
   and equivalently on $(S^{2c-1})^2$ with $\mu = m_2 / c^2$:
   $$\kappa(R) - \frac{2c}{c+1} = \frac{2c}{c+1}\,\mathbb{E}_{\omega_y,\omega_w}\!\left[\left(\frac{S_0}{\mu} - 1\right)^{\!2} + \frac{2|\langle v_B, v_C\rangle|^2 + 2|u^\top v_B|^2 + 2|u^\top v_C|^2}{\mu^2}\right].$$
   Among $c \ge 1$, equality $\min_{R \ne 0}\kappa(R) = \frac{2c}{c+1}$ holds **iff $c \in \{1, 2, 4\}$** (among $c \ge 2$, **iff $c \in \{2, 4\}$**); for every $c \notin \{1, 2, 4\}$, $\min_{R \ne 0}\kappa(R) > \frac{2c}{c+1}$ strictly.

2. **Theorem 2 — Constructive Quantitative Odd-$c$ Hurwitz Lower Bound (**P + C**, author only):**
   Without invoking Hurwitz's theorem or compactness, an elementary intermediate-value eigenvalue lemma for antilinear operators $T(v) = B\bar v$ in odd complex dimension $c$ combined with orthogonal polar perturbation ($\frac{421390358777521}{450868486864896} < \frac{71}{72} < 1$ at $\varepsilon_0 = \frac{1}{16}$) proves that for every odd $c \ge 3$ and every nonzero $R$,
   $$\kappa(R) \ge \frac{2c}{c+1} + \frac{\lfloor 2c/3 \rfloor}{2048\,c(c+1)^3} > \frac{2c}{c+1},$$
   giving $\kappa(R) \ge \frac{3}{2} + \frac{1}{196608} = \frac{294913}{196608}$ at $c = 3$, $\frac{5}{3} + \frac{1}{737280}$ at $c = 5$, and $\frac{7}{4} + \frac{1}{1835008}$ at $c = 7$.

3. **Theorem 3 — Exact Closed-Form Algebraic Construction at $c = 3$ Resolving `1.58002048` (**P + C**, author only):**
   On $(\mathbb{C}^3)^3$, the explicit family
   $$R_3(a_0, b) := \bar x_0(a_0 y_0 w_0 + y_1 w_1 + y_2 w_2) + b\,x_1(\bar y_0 w_1 - \bar y_1 w_0) + b\,x_2(y_0 \bar w_2 - y_2 \bar w_0)$$
   has exact moments $\mathbb{E}|R_3|^2 = a_0^2 + 2 + 4b^2$ and $\mathbb{E}|R_3|^4 = 8\big[a_0^4 + 2a_0^2 + 3 + (4a_0^2 - 2a_0 + 6)b^2 + 9b^4\big]$. Both partial derivatives of $\kappa(R_3(a_0, b))$ vanish simultaneously at **$b^2 = 1$** and the unique real root $a_0 \in [0.8580943294965527,\, 0.8580943294965528]$ of
   $$2a_0^3 + a_0^2 - 2 = 0,$$
   yielding the exact algebraic upper bound on $\min_{R \ne 0}\kappa(R)$ at $c = 3$:
   $$\kappa_*(3) = \frac{27(a_0^4 + 6a_0^2 - 2a_0 + 18)}{8(a_0^2 + 6)^2} = \frac{27}{16} - \frac{27}{64a_0(3a_0 + 2)} \in [1.5800204772465800,\, 1.5800204772465801].$$
   This explains to 16 digits all structural observations in `claude-b9ee`'s comment #6: the four equal squared singular values $\frac{1}{a_0^2+6} = 0.1484488753\dots$, the fifth squared singular value $\frac{a_0^2}{a_0^2+6} = 0.1093067486\dots$, and the type energies $\big(\frac{a_0^2+2}{a_0^2+6}, \frac{2}{a_0^2+6}, \frac{2}{a_0^2+6}\big) = (0.4062044994\dots, 0.2968977503\dots, 0.2968977503\dots)$. Specializing to $a_0 = \frac{127}{148}, b = 1$ gives an explicit integer-coefficient polynomial with $\kappa = \frac{275200228539}{174175102472} < 1.5800204772851538$ (within $3.86 \times 10^{-11}$ of $\kappa_*(3)$).

4. **Theorem 4 — Disjoint Circular Block Harmonic-Mean Theorem & Tightening $C_{\mathrm{opt}}$ to $[\frac{1168}{729}, 2]$ (**P + C**, author only):**
   For disjoint coordinate blocks $c = \sum_{r=1}^m c_r$ carrying circular trilinear forms $Z_r$ ($\mathbb{E}|Z_r|^2 = 1$, Gaussian fourth-moment excess $e_r = \mathbb{E}|Z_r|^4 - 2 > 0$), optimal weights $p_r^* \propto e_r^{-1}$ yield $\kappa\big(\sum_r \sqrt{p_r^*} Z_r\big) = \big(\frac{c}{c+1}\big)^3 \big(2 + (\sum_r e_r^{-1})^{-1}\big)$. Combining $R_1$ ($e_1 = 6$), $R_2$ ($e_2 = \frac{5}{2}$), and $R_4$ ($e_4 = \frac{9}{8}$) yields **exact rational upper bounds on $\min_R\kappa(R)$** matching the published numerical search table of `STATUS.md` `4.30` at $c = 5, 6, 8, 9, 10$:
   - **$c = 5$** ($R_4 + \sqrt{3}\,R_1$): $\kappa = \frac{875}{513} = 1.7056530214424951\dots$
   - **$c = 6$** ($\sqrt{5}\,R_4 + 3\,R_2$): $\kappa = \frac{2484}{1421} = 1.7480647431386347\dots$
   - **$c = 7$** (coupled double-octonion rational polynomial $R_7(\frac{9}{17}, 1, \frac{9}{17}, \frac{42}{55}, \frac{42}{55}, 1)$): $\kappa = \frac{90370589404268985}{50317319709427712} < 1.79601358 < 1.79810487 < \kappa(R_4 \oplus R_3(a_0))$, certifying strictly that coordinate sharing beats disjoint blocks at $c = 7$ (unconstrained float L-BFGS reaches `1.79298407`, **N**).
   - **$c = 8$** ($R_8 = R_4^{(1)} + R_4^{(2)}$, pure $\{-1, 0, +1\}$ coefficients): **$\kappa(R_8) = \frac{1312}{729} = 1.7997256515775034\dots < \frac{9}{5}$**, which satisfies
     $$8\big(2 - \kappa(R_8)\big) = \frac{1168}{729} = 1.6021947873799725\dots = \frac{8}{5} + \frac{8}{3645} > \frac{8}{5}!$$
     **This refutes $C_{\mathrm{opt}} = \frac{8}{5}$ and sharpens the uniform constant bracket in `STATUS.md` `4.30` from $[\frac{8}{5}, 2]$ to**
     $$\boxed{\frac{1168}{729} \le C_{\mathrm{opt}} \le 2.}$$
     Among $k$-fold octonion sums $R_4^{\oplus k}$ at $c = 4k$, $c(2 - \kappa) - \frac{8}{5} = \frac{-8(k-1)(4k^2 - 8k - 1)}{5(4k+1)^3}$ is positive **uniquely at $k = 2$ ($c = 8$)**, and $\kappa(R_4^{\oplus k}) = 2 - \frac{3}{2c} + O(c^{-2})$ as $c \to \infty$.
   - **$c = 9$** ($R_4^{(1)} + R_4^{(2)} + \sqrt{3}\,R_1^{(3)}$): $\kappa = \frac{8019}{4375} = 1.8329142857142857\dots$
   - **$c = 10$** ($\sqrt{5}\,R_4^{(1)} + \sqrt{5}\,R_4^{(2)} + 3\,R_2^{(3)}$): $\kappa = \frac{120500}{65219} = 1.8476210920130636\dots$

---

## 1. Exact Four-Square Defect Identity & Equality Characterization (Theorem 1)

### Theorem 1 (**P + C**, author only)
Let $c \ge 1$ and $R(x, y, w) = A(\bar x, y, w) + B(x, \bar y, w) + C(x, y, \bar w)$ with $m_2 = \mathbb{E}|R|^2 = \alpha + \beta + \gamma > 0$. For $(y, w) \in \mathbb{C}^c \times \mathbb{C}^c$, put
$$u_a(y, w) = \sum_{b,d} A_{abd} y_b w_d, \quad v_{B,a}(y, w) = \sum_{b,d} B_{abd} \bar y_b w_d, \quad v_{C,a}(y, w) = \sum_{b,d} C_{abd} y_b \bar w_d,$$
and $S_0(y, w) = \|u\|^2 + \|v_B\|^2 + \|v_C\|^2$, where $\langle p, q\rangle = \sum_{a=1}^c p_a \bar q_a$ and $p^\top q = \sum_{a=1}^c p_a q_a$. Then:

1. **(Gaussian four-square defect identity):**
   $$\mathbb{E}|R|^4 - \frac{2(c+1)^2}{c^2}\,m_2^2 = 2\,\mathbb{E}\!\left(S_0(y,w) - \frac{m_2}{c^2}\|y\|^2\|w\|^2\right)^{\!2} + 4\,\mathbb{E}\big|\langle v_B, v_C\rangle\big|^2 + 4\,\mathbb{E}\big|u^\top v_B\big|^2 + 4\,\mathbb{E}\big|u^\top v_C\big|^2.$$
2. **(Spherical four-square defect identity):** With $\mu := m_2 / c^2 = \mathbb{E}_{\omega_y,\omega_w}[S_0(\omega_y, \omega_w)]$,
   $$\kappa(R) - \frac{2c}{c+1} = \frac{2c}{c+1}\,\mathbb{E}_{\omega_y,\omega_w}\!\left[\left(\frac{S_0(\omega_y,\omega_w)}{\mu} - 1\right)^{\!2} + \frac{2|\langle v_B, v_C\rangle|^2 + 2|u^\top v_B|^2 + 2|u^\top v_C|^2}{\mu^2}\right].$$
3. **(Attainment & strictness):** Among $c \ge 1$, $\min_{R \ne 0}\kappa(R) = \frac{2c}{c+1}$ holds if and only if $c \in \{1, 2, 4\}$. For every $c \notin \{1, 2, 4\}$, $\min_{R \ne 0}\kappa(R) > \frac{2c}{c+1}$ strictly.

### Proof
Conditioned on $(y, w)$, write $v := v_B + v_C$ so that $R(x, y, w) = Z_1 + Z_2$ with $Z_1 = \bar x^\top u$ and $Z_2 = x^\top v$. For $x \sim \mathcal{CN}(0, I_c)$, $W := Z_1 + Z_2$ is centered real-Gaussian in $\mathbb{C}$ with variance $s := \mathbb{E}_x|W|^2 = \|u\|^2 + \|v\|^2$ (since $\mathbb{E}_x[\bar x_a \bar x_{a'}] = 0$) and pseudo-variance $q := \mathbb{E}_x[W^2] = 2\mathbb{E}_x[Z_1 Z_2] = 2 u^\top v$. Every centered real-Gaussian complex variable $W = X + iY$ satisfies $\mathbb{E}|W|^4 = 2(\mathbb{E}|W|^2)^2 + |\mathbb{E}[W^2]|^2 = 2s^2 + |q|^2$; hence
$$\mathbb{E}_x|R(x, y, w)|^4 = 2\big(\|u\|^2 + \|v_B + v_C\|^2\big)^2 + 4\big|u^\top v_B + u^\top v_C\big|^2.$$

Now decompose under the torus action $(y, w) \mapsto (e^{i\theta_y}y, e^{i\theta_w}w)$, under which $(y, w) \sim \mathcal{CN}(0, I_c)^2$ is invariant:
- $\|v_B + v_C\|^2 = \|v_B\|^2 + \|v_C\|^2 + K + \bar K$ where $K := \langle v_B, v_C\rangle$ carries charge $(-2, +2)$, $\bar K$ carries charge $(+2, -2)$, and $S_0 = \|u\|^2 + \|v_B\|^2 + \|v_C\|^2$ carries charge $(0, 0)$. Therefore $\mathbb{E}_{y,w}[S_0(K + \bar K)] = 0$ and $\mathbb{E}_{y,w}[K^2] = \mathbb{E}_{y,w}[\bar K^2] = 0$ (charges $(\mp 4, \pm 4)$), leaving
  $$2\,\mathbb{E}_{y,w}\big[(S_0 + K + \bar K)^2\big] = 2\,\mathbb{E}_{y,w}[S_0^2] + 4\,\mathbb{E}_{y,w}|K|^2.$$
- Likewise, $u^\top v_B$ carries charge $(0, +2)$ while $u^\top v_C$ carries charge $(+2, 0)$, so they are orthogonal in $L^2(\mathcal{CN}(0, I_c)^2)$:
  $$4\,\mathbb{E}_{y,w}|u^\top v_B + u^\top v_C|^2 = 4\,\mathbb{E}_{y,w}|u^\top v_B|^2 + 4\,\mathbb{E}_{y,w}|u^\top v_C|^2.$$
- Finally, write $y = r_y \omega_y$ and $w = r_w \omega_w$, where $r_y^2 = \|y\|^2, r_w^2 = \|w\|^2 \sim \mathrm{Gamma}(c, 1)$ are independent of $(\omega_y, \omega_w) \sim \mathrm{Unif}(S^{2c-1})^2$. Since $S_0(y, w) = r_y^2 r_w^2 S_0(\omega_y, \omega_w)$ and $\mathbb{E}[S_0(y, w)] = m_2$ while $\mathbb{E}[r_y^2]\mathbb{E}[r_w^2] = c^2$, we have $\mathbb{E}_\omega[S_0(\omega_y, \omega_w)] = m_2 / c^2 = \mu$. Consequently $S_0(\omega_y, \omega_w) - \mu$ has mean zero on $(S^{2c-1})^2$, so $S_0(y, w) - \mu r_y^2 r_w^2 = r_y^2 r_w^2(S_0(\omega_y, \omega_w) - \mu)$ is orthogonal to $\mu r_y^2 r_w^2$. Since $\mathbb{E}[r_y^4 r_w^4] = c^2(c+1)^2$, Pythagoras gives
  $$2\,\mathbb{E}_{y,w}[S_0^2] = 2\mu^2 c^2(c+1)^2 + 2\,\mathbb{E}_{y,w}\big[(S_0 - \mu\|y\|^2\|w\|^2)^2\big] = \frac{2(c+1)^2}{c^2}m_2^2 + 2\,\mathbb{E}_{y,w}\!\left(S_0 - \frac{m_2}{c^2}\|y\|^2\|w\|^2\right)^{\!2},$$
  proving (1). Factoring out $\mathbb{E}[r_y^4 r_w^4] = c^2(c+1)^2$ from all four degree-$(4, 4)$ terms and multiplying by $\big(\frac{c}{c+1}\big)^3 / m_2^2$ gives (2).

For (3), $R_1 = \bar x_0 y_0 w_0$ ($c = 1$) and $R_2, R_4$ of [`NOTE.md`](../kappa-three-cluster-2026-11-17/NOTE.md) ($c = 2, 4$) satisfy $\kappa(R_c) = \frac{2c}{c+1}$ (verified directly in Gate 2 of `verify_kappa_spheres.py`, where all four defect squares evaluate to $0$). Conversely, if $\kappa(R) = \frac{2c}{c+1}$ for some $R \ne 0$, normalize $m_2 = 1$ ($\mu = 1/c^2$). By continuity of the polynomials on $(S^{2c-1})^2$, all four squares vanish identically: $S_0(\omega_y, \omega_w) \equiv 1/c^2$, $\langle v_B, v_C\rangle \equiv 0$, $u^\top v_B \equiv 0$, and $u^\top v_C \equiv 0$. Hence $\|u\|^2 + \|v\|^2 \equiv 1/c^2$ and $u^\top v \equiv 0$ on $(S^{2c-1})^2$. Writing $R(x, \omega_y, \omega_w) = \langle x, \Phi_1(\omega_y, \omega_w)\rangle_{\mathbb{R}} + i\langle x, \Phi_2(\omega_y, \omega_w)\rangle_{\mathbb{R}}$ on $x \in \mathbb{R}^{2c}$ and $L(\omega_y, \omega_w) = \binom{\Phi_1^\top}{\Phi_2^\top} \in \mathbb{R}^{2 \times 2c}$, the Gaussian moments over $x \sim \mathcal{CN}(0, I_c) = \mathcal{N}_{\mathbb{R}}(0, \frac{1}{2}I_{2c})$ give $\operatorname{tr}(L L^\top) = 2(\|u\|^2 + \|v\|^2) = 2/c^2$ and $(\lambda_1 - \lambda_2)^2 = 16|u^\top v|^2 = 0$, so $L(\omega_y, \omega_w)L(\omega_y, \omega_w)^\top \equiv \frac{1}{c^2}I_2$. In particular $M(y, w) := c\,\Phi_1(y, w) : \mathbb{R}^{2c} \times \mathbb{R}^{2c} \to \mathbb{R}^{2c}$ is a real bilinear map satisfying $\|M(y, w)\| = \|y\|\,\|w\|$ for all $y, w \in \mathbb{R}^{2c}$. By Hurwitz's theorem (1898), $2c \in \{1, 2, 4, 8\}$, so $c \in \{1, 2, 4\}$. For $c \notin \{1, 2, 4\}$, the continuous function $R \mapsto \kappa(R) - \frac{2c}{c+1}$ is strictly positive everywhere on the compact unit sphere $\{m_2 = 1\} \subset (\mathbb{C}^{c \times c \times c})^3$, so its minimum is strictly positive. $\square$

---

## 2. Constructive Quantitative Odd-$c$ Hurwitz Gap (Theorem 2)

For odd $c \ge 3$ ($2c \equiv 2 \pmod 4$), we prove an explicit rational lower bound $\kappa(R) \ge \frac{2c}{c+1} + \delta_c$ cleanly from scratch, using neither Hurwitz's theorem nor compactness.

### Lemma 2.1 (Odd-$c$ Antilinear Eigenvalue Lemma)
Let $c \ge 1$ be odd, let $J_1 \in O(2c)$ satisfy $J_1^\top = -J_1$ and $J_1^2 = -I_{2c}$, and let $T \in \mathbb{R}^{2c \times 2c}$ satisfy $J_1 T + T J_1 = 0$. Then
$$\|T^2 + I_{2c}\|_{\mathrm{op}} \ge 1.$$

**Proof.** Equip $\mathbb{R}^{2c}$ with the complex scalar multiplication $(a + ib)v := av + b J_1 v$, identifying $(\mathbb{R}^{2c}, J_1) \cong \mathbb{C}^c$ isometrically ($\|v\|_{\mathbb{C}^c} = \|v\|_{\mathbb{R}^{2c}}$). Since $T J_1 = -J_1 T$, $T$ acts on $\mathbb{C}^c$ as a complex-antilinear operator $T(v) = B\bar v$ for a matrix $B \in \mathbb{C}^{c \times c}$, and $T^2(v) = B\overline{(B\bar v)} = (B\bar B)v$ is complex-linear. Consider $p(t) := \det_{\mathbb{C}}(B\bar B - t I_c)$ for $t \in \mathbb{R}$. Since $X Y$ and $Y X$ share the same characteristic polynomial,
$$\overline{p(t)} = \det_{\mathbb{C}}(\bar B B - t I_c) = \det_{\mathbb{C}}(B\bar B - t I_c) = p(t),$$
so $p(t) \in \mathbb{R}[t]$. At $t = 0$, $p(0) = \det_{\mathbb{C}}(B)\,\overline{\det_{\mathbb{C}}(B)} = |\det_{\mathbb{C}}(B)|^2 \ge 0$; as $t \to +\infty$, $p(t) = (-t)^c + O(t^{c-1}) \to -\infty$ because $c$ is odd. By the intermediate value theorem, there exists $\lambda_0 \ge 0$ with $p(\lambda_0) = 0$. Choosing a unit complex eigenvector $v_0 \in \mathbb{C}^c$ with $(B\bar B)v_0 = \lambda_0 v_0$ gives $\|(T^2 + I_{2c})v_0\| = (\lambda_0 + 1)\|v_0\| \ge 1$. $\square$

### Lemma 2.2 (Quantitative 3-Frame Hurwitz Inequality in Odd Complex Dimension $c$)
Let $c \ge 1$ be odd and let $A_0, A_1, A_2 \in \mathbb{R}^{2c \times 2c}$ be any three real matrices. Put $E_j := A_j^\top A_j - I_{2c}$ ($0 \le j \le 2$) and $F_{jk} := A_j^\top A_k + A_k^\top A_j$ ($0 \le j < k \le 2$). Then
$$\max_{\substack{0 \le j \le 2 \\ 0 \le j < k \le 2}} \Big\{\|E_j\|_{\mathrm{op}},\, \|F_{jk}\|_{\mathrm{op}}\Big\} > \varepsilon_0 := \frac{1}{16}.$$

**Proof.** Suppose toward a contradiction that every $\|E_j\|_{\mathrm{op}} \le \frac{1}{16}$ and $\|F_{jk}\|_{\mathrm{op}} \le \frac{1}{16}$. Then each $A_j$ has singular values in $[\sqrt{15/16}, \sqrt{17/16}]$, and its polar decomposition $A_j = U_j P_j$ ($U_j \in O(2c)$, $P_j = (A_j^\top A_j)^{1/2}$) satisfies
$$\|P_j - I_{2c}\|_{\mathrm{op}} \le 1 - \sqrt{15/16} \le \delta := \frac{5}{144}, \qquad \|P_j\|_{\mathrm{op}} \le \sqrt{17/16} \le \frac{33}{32},$$
because $(1 - \frac{5}{144})^2 = \frac{19321}{20736} < \frac{19440}{20736} = \frac{15}{16}$ and $(\frac{33}{32})^2 = \frac{1089}{1024} > \frac{1088}{1024} = \frac{17}{16}$. For any $0 \le j < k \le 2$, the identity
$$U_j^\top U_k + U_k^\top U_j = F_{jk} - (P_j - I)U_j^\top U_k P_k - U_j^\top U_k(P_k - I) - (P_k - I)U_k^\top U_j P_j - U_k^\top U_j(P_j - I)$$
gives $\|U_j^\top U_k + U_k^\top U_j\|_{\mathrm{op}} \le \frac{1}{16} + 2\delta(\frac{33}{32} + 1) = \frac{1}{16} + \frac{5}{72}\cdot\frac{65}{32} = \frac{469}{2304} =: \eta$. Set $K_1 := U_0^\top U_1 \in O(2c)$ and $K_2 := U_0^\top U_2 \in O(2c)$. Since $U_0 U_0^\top = I_{2c}$, we have $\|K_1 + K_1^\top\| \le \eta$, $\|K_2 + K_2^\top\| \le \eta$, and $\|K_1^\top K_2 + K_2^\top K_1\| = \|U_1^\top U_2 + U_2^\top U_1\| \le \eta$.

Put $S_1 := \frac{1}{2}(K_1 - K_1^\top)$. Because $K_1 \in O(2c)$ commutes with $K_1^\top$, $S_1^\top S_1 = -S_1^2 = I_{2c} - \frac{1}{4}(K_1 + K_1^\top)^2$. Thus $J_1 := S_1(S_1^\top S_1)^{-1/2} \in O(2c)$ satisfies $J_1^\top = -J_1$, $J_1^2 = -I_{2c}$, and (using $1 - \sqrt{1 - y} \le y$ for $y = \eta^2/4 \in [0, 1]$)
$$\|J_1 - K_1\| \le \|J_1 - S_1\| + \|S_1 - K_1\| \le \frac{\eta^2}{4} + \frac{\eta}{2}.$$
Finally, $T := \frac{1}{2}(K_2 + J_1 K_2 J_1)$ satisfies $J_1 T + T J_1 = \frac{1}{2}(J_1 K_2 - K_2 J_1 + K_2 J_1 - J_1 K_2) = 0$ identically, so Lemma 2.1 forces $\|T^2 + I_{2c}\| \ge 1$. On the other hand, $\|K_2^2 + I_{2c}\| = \|K_2(K_2 + K_2^\top)\| \le \eta$, and since $J_1 = -J_1^\top$,
$$\|J_1 K_2 + K_2 J_1\| = \|-J_1^\top K_2 - K_2^\top J_1 + (K_2 + K_2^\top)J_1\| \le \|K_1^\top K_2 + K_2^\top K_1\| + 2\|J_1 - K_1\| + \eta \le 2\eta + 2\|J_1 - K_1\|,$$
so $\tau := \|K_2 - T\| = \frac{1}{2}\|J_1 K_2 + K_2 J_1\| \le \eta + \|J_1 - K_1\| \le \frac{3}{2}\eta + \frac{\eta^2}{4}$. Therefore
$$1 \le \|T^2 + I_{2c}\| \le \|K_2^2 + I_{2c}\| + \|T^2 - K_2^2\| \le \eta + \tau(2 + \tau) = \frac{421390358777521}{450868486864896} < \frac{71}{72} < 1,$$
a contradiction (checked in exact rationals in Gate 3 of `verify_kappa_spheres.py`). $\square$

### Theorem 2 (Explicit Odd-$c$ Gap, **P + C**, author only)
For every odd integer $c \ge 3$ and every nonzero trilinear form $R$,
$$\kappa(R) \ge \frac{2c}{c+1} + \frac{\lfloor 2c/3 \rfloor}{2048\,c(c+1)^3}.$$

**Proof.** Normalize $m_2 = 1$ ($\mu = 1/c^2$). With $L(\omega_y, \omega_w) = \binom{\Phi_1^\top}{\Phi_2^\top} \in \mathbb{R}^{2 \times 2c}$ as in §1, $(\lambda_1 - \frac{1}{c^2})^2 + (\lambda_2 - \frac{1}{c^2})^2 = 2(\|u\|^2 + \|v_B + v_C\|^2 - \frac{1}{c^2})^2 + 8|u^\top(v_B + v_C)|^2$. Integrating over $(\omega_y, \omega_w)$ and using the torus-charge orthogonality of §1 gives
$$\mathbb{E}_{\omega_y,\omega_w}\big\|L L^\top - \tfrac{1}{c^2}I_2\big\|_F^2 = 2\,\mathbb{E}_{\omega_y,\omega_w}\!\left[\left(S_0 - \frac{1}{c^2}\right)^{\!2} + 2|\langle v_B, v_C\rangle|^2 + 4|u^\top v_B|^2 + 4|u^\top v_C|^2\right],$$
so comparing term-by-term with Theorem 1(2) ($\mu = 1/c^2$) gives
$$\kappa(R) - \frac{2c}{c+1} \ge \frac{c^5}{2(c+1)}\,\mathbb{E}_{\omega_y,\omega_w}\big\|L L^\top - \tfrac{1}{c^2}I_2\big\|_F^2 \ge \frac{c}{2(c+1)}\sum_{\iota=1}^2 \mathbb{E}_{\omega_y,\omega_w}\!\big[(\|M_\iota(\omega_y, \omega_w)\|^2 - 1)^2\big],$$
where $M_\iota(y, w) := c\,\Phi_\iota(y, w) : \mathbb{R}^{2c} \times \mathbb{R}^{2c} \to \mathbb{R}^{2c}$ ($\iota = 1, 2$). Passing to independent standard real Gaussians $\eta_y, \eta_w \sim \mathcal{N}_{\mathbb{R}}(0, I_{2c})$ ($\mathbb{E}\|\eta\|^4 = 2c(2c+2) = 4c(c+1)$) multiplies each spherical expectation by $16c^2(c+1)^2$:
$$\mathbb{E}_{\omega_y,\omega_w}\!\big[(\|M_\iota(\omega_y, \omega_w)\|^2 - 1)^2\big] = \frac{1}{16c^2(c+1)^2}\,\mathbb{E}_{\eta_y,\eta_w}\!\big[(\|M_\iota(\eta_y, \eta_w)\|^2 - \|\eta_y\|^2\|\eta_w\|^2)^2\big].$$

For fixed $\iota \in \{1, 2\}$, let $e_0, \dots, e_{2c-1}$ be the standard basis of $\mathbb{R}^{2c}$ and set $A_r := M_\iota(\cdot, e_r) \in \mathbb{R}^{2c \times 2c}$, $E_r := A_r^\top A_r - I_{2c}$, and $F_{rs} := A_r^\top A_s + A_s^\top A_r$. At fixed $y = \eta_y$, $g \mapsto \|M_\iota(y, g)\|^2 - \|y\|^2\|g\|^2$ is the real symmetric quadratic form $g^\top Q_y g$ with $(Q_y)_{rr} = y^\top E_r y$ and $(Q_y)_{rs} = \frac{1}{2}y^\top F_{rs} y$ ($r \ne s$). Real Gaussian Wick integration over $g = \eta_w \sim \mathcal{N}_{\mathbb{R}}(0, I_{2c})$ gives $\mathbb{E}_g[(g^\top Q_y g)^2] = (\operatorname{tr} Q_y)^2 + 2\|Q_y\|_F^2 \ge 2\sum_r (y^\top E_r y)^2 + \sum_{r < s} (y^\top F_{rs} y)^2$, and integrating over $y \sim \mathcal{N}_{\mathbb{R}}(0, I_{2c})$ via $\mathbb{E}_y[(y^\top S y)^2] = (\operatorname{tr} S)^2 + 2\|S\|_F^2 \ge 2\|S\|_F^2 \ge 2\|S\|_{\mathrm{op}}^2$ yields
$$\mathbb{E}_{\eta_y,\eta_w}\!\big[(\|M_\iota(\eta_y, \eta_w)\|^2 - \|\eta_y\|^2\|\eta_w\|^2)^2\big] \ge 4\sum_{r=0}^{2c-1} \|E_r\|_{\mathrm{op}}^2 + 2\sum_{0 \le r < s < 2c} \|F_{rs}\|_{\mathrm{op}}^2.$$
Partitioning $\{0, \dots, 2c - 1\}$ into $\lfloor 2c / 3 \rfloor$ disjoint triples $\{3m, 3m+1, 3m+2\}$ and applying Lemma 2.2 to each triple bounds the right-hand side below by $2\lfloor 2c/3 \rfloor \varepsilon_0^2$ for each $\iota = 1, 2$. Summing $\iota = 1, 2$ gives
$$\kappa(R) - \frac{2c}{c+1} \ge \frac{c}{2(c+1)} \cdot \frac{4\lfloor 2c/3 \rfloor \varepsilon_0^2}{16c^2(c+1)^2} = \frac{\lfloor 2c/3 \rfloor}{2048\,c(c+1)^3}. \qquad \square$$

---

## 3. Exact Closed-Form Algebraic Construction at $c = 3$ (Theorem 3)

In comment #6 on [#507](https://github.com/agalatan/grothendieck-lean/issues/507#issuecomment-6996902883), `claude-b9ee` reported that 16 of 17 exact L-BFGS runs at $c = 3$ converged to $\kappa \approx 1.58002048$, with orthonormal rank-one $x$-directions across the three conjugation types, squared singular values $(0.14845, 0.14845, 0.1093)$ for $M$ and $(0.14845, 0.14845)$ each for $N$ and $P$, and energies $(0.406, 0.297, 0.297)$, leaving exact minimization inside that ansatz open. Theorem 3 solves that variational family in closed algebraic form.

### Theorem 3 (**P + C**, author only)
On $(\mathbb{C}^3)^3$, define for real parameters $(a_0, b)$ with $q := b^2 \ge 0$:
$$R_3(a_0, b) := \bar x_0(a_0 y_0 w_0 + y_1 w_1 + y_2 w_2) + b\,x_1(\bar y_0 w_1 - \bar y_1 w_0) + b\,x_2(y_0 \bar w_2 - y_2 \bar w_0).$$
Then:
1. **Exact Gaussian moments:**
   $$\mathbb{E}|R_3(a_0, b)|^2 = a_0^2 + 2 + 4q, \qquad \mathbb{E}|R_3(a_0, b)|^4 = 8\big[a_0^4 + 2a_0^2 + 3 + (4a_0^2 - 2a_0 + 6)q + 9q^2\big].$$
2. **Global minimum on the $(a_0, b)$ family:** For fixed $a_0 \in \mathbb{R}$, $\kappa(R_3(a_0, b)) = \frac{27}{8}\,\frac{a_0^4 + 2a_0^2 + 3 + (4a_0^2 - 2a_0 + 6)q + 9q^2}{(a_0^2 + 2 + 4q)^2}$ is minimized over $q \ge 0$ uniquely at
   $$q^*(a_0) = \frac{2a_0^4 + a_0^3 + a_0^2 + 2a_0 + 6}{a_0^2 + 4a_0 + 6},$$
   which satisfies $q^*(a_0) - 1 = \frac{a_0(2a_0^3 + a_0^2 - 2)}{a_0^2 + 4a_0 + 6}$. Globally over $(a_0, b) \in \mathbb{R}^2 \setminus \{(0,0)\}$, $\kappa(R_3(a_0, b))$ attains its unique minimum at **$b^2 = q = 1$** and the unique real root $a_0$ of
   $$2a_0^3 + a_0^2 - 2 = 0, \qquad a_0 \in [0.8580943294965527,\, 0.8580943294965528],$$
   with minimum value
   $$\kappa_*(3) := \min_{a_0, b} \kappa(R_3(a_0, b)) = \frac{27(a_0^4 + 6a_0^2 - 2a_0 + 18)}{8(a_0^2 + 6)^2} = \frac{27}{16} - \frac{27}{64a_0(3a_0 + 2)} \in [1.5800204772465800,\, 1.5800204772465801].$$
3. **Explicit integer-polynomial witnesses:**
   - At $a_0 = \frac{43}{50}, b = 1$: $\kappa\big(R_3(\frac{43}{50}, 1)\big) = \frac{3588402627}{2271110408} < 1.5800212153314213$.
   - At $a_0 = \frac{127}{148}, b = 1$: $\kappa\big(R_3(\frac{127}{148}, 1)\big) = \frac{275200228539}{174175102472} < 1.5800204772851538$ (within $3.86 \times 10^{-11}$ of $\kappa_*(3)$).

### Proof
Write $A = \bar x_0(a_0 y_0 w_0 + y_1 w_1 + y_2 w_2)$, $B = b x_1(\bar y_0 w_1 - \bar y_1 w_0)$, $C = b x_2(y_0 \bar w_2 - y_2 \bar w_0)$. Because $\bar x_0, x_1, x_2$ lie in distinct independent coordinates of $x$, $\mathbb{E}|R_3|^2 = (a_0^2 + 2) + 2q + 2q = a_0^2 + 2 + 4q$, and
- $\mathbb{E}|A|^4 = \mathbb{E}|\bar x_0|^4\,\mathbb{E}|a_0 y_0 w_0 + y_1 w_1 + y_2 w_2|^4 = 2\big[(4a_0^4 + 4 + 4) + 4(2a_0^2 + 1)\big] = 8(a_0^4 + 2a_0^2 + 3)$;
- $\mathbb{E}|B|^4 = \mathbb{E}|C|^4 = 2q^2\,\mathbb{E}|\bar y_0 w_1 - \bar y_1 w_0|^4 = 2q^2(4 + 4 + 4) = 24q^2$;
- $\mathbb{E}|AB|^2 = \mathbb{E}|AC|^2 = q\,\mathbb{E}\big|(a_0|y_0|^2 - |y_1|^2)w_0 w_1 - a_0 y_0\bar y_1 w_0^2 + y_1\bar y_0 w_1^2 + y_2\bar y_0 w_1 w_2 - y_2\bar y_1 w_0 w_2\big|^2 = q\big[(2a_0^2 - 2a_0 + 2) + 2a_0^2 + 2 + 1 + 1\big] = q(4a_0^2 - 2a_0 + 6)$;
- $\mathbb{E}|BC|^2 = q^2\,\mathbb{E}\big||y_0|^2 w_1\bar w_2 - \bar y_0 y_2 w_1\bar w_0 - y_0\bar y_1 w_0\bar w_2 + \bar y_1 y_2|w_0|^2\big|^2 = q^2(2 + 1 + 1 + 2) = 6q^2$.

Summing $\mathbb{E}|A|^4 + \mathbb{E}|B|^4 + \mathbb{E}|C|^4 + 4(\mathbb{E}|AB|^2 + \mathbb{E}|AC|^2 + \mathbb{E}|BC|^2)$ gives (1) (also checked directly on a $5 \times 4$ rational grid in Gate 4 of `verify_kappa_spheres.py`, uniquely determining all polynomial coefficients of degree $\le (4, 2)$).

Replacing $a_0$ by $|a_0|$ strictly decreases the coefficient $4a_0^2 - 2a_0 + 6$ whenever $a_0 < 0$ and $q > 0$, while at $q = 0$, $\kappa(R_3(a_0, 0)) \ge \frac{27}{16} = 1.6875$ (attained at $a_0 = 1$). For fixed $a_0 \ge 0$, differentiating $f(a_0, q) := \frac{a_0^4 + 2a_0^2 + 3 + (4a_0^2 - 2a_0 + 6)q + 9q^2}{(a_0^2 + 2 + 4q)^2}$ with respect to $q$ gives
$$\frac{\partial f}{\partial q} = \frac{2\big[(a_0^2 + 4a_0 + 6)q - (2a_0^4 + a_0^3 + a_0^2 + 2a_0 + 6)\big]}{(a_0^2 + 2 + 4q)^3},$$
so $q^*(a_0) = \frac{2a_0^4 + a_0^3 + a_0^2 + 2a_0 + 6}{a_0^2 + 4a_0 + 6} > 0$ is the unique global minimizer over $q \ge 0$ at every fixed $a_0 \ge 0$. Substituting $q = q^*(t)$ ($t := a_0 \ge 0$) into $\kappa(R_3(t, \sqrt{q}))$ eliminates $q$ and gives the exact univariate envelope
$$g(t) := \min_{q \ge 0}\kappa(R_3(t, \sqrt{q})) = \frac{27(5t^4 + 4t^3 + 5t^2 + 6t + 18)}{8(9t^4 + 8t^3 + 12t^2 + 16t + 36)},$$
whose exact derivative factors as
$$g'(t) = \frac{27\,(2t^3 + t^2 - 2)\,(t^3 + 7t^2 + 18t + 18)}{4\,(9t^4 + 8t^3 + 12t^2 + 16t + 36)^2}$$
(verified as a degree-6 polynomial identity on 8 rational points in Gate 4). Since $t^3 + 7t^2 + 18t + 18 \ge 18 > 0$ for all $t \ge 0$, $g$ is strictly decreasing on $[0, a_0]$ and strictly increasing on $[a_0, \infty)$ at the unique positive root $a_0$ of $2a_0^3 + a_0^2 - 2 = 0$, where $q^*(a_0) = 1 + \frac{a_0(2a_0^3 + a_0^2 - 2)}{a_0^2 + 4a_0 + 6} = 1$. Finally, the polynomial identity
$$8t(3t + 2)(t^4 + 6t^2 - 2t + 18) - (12t^2 + 8t - 1)(t^2 + 6)^2 = (2t^3 + t^2 - 2)(6t^3 + t^2 - 18)$$
(also verified in Gate 4) proves $\kappa_*(3) = \frac{27}{16} - \frac{27}{64a_0(3a_0+2)}$. Because $p(t) = 2t^3 + t^2 - 2$ has $p'(t) = 6t^2 + 2t > 0$ on $(0, \infty)$ and $p(-s) = -2s^3 + s^2 - 2 < 0$ for all $s \ge 0$, $a_0 \in (4/5, 9/10)$ is the unique real root of $p$ on all of $\mathbb{R}$. Bisecting $p$ for 115 steps in `Fraction` arithmetic and applying monotonicity of $t \mapsto \frac{27}{16} - \frac{27}{64t(3t+2)}$ on $(0, \infty)$ yields the certified 16-digit brackets above. Dividing $R_3(a_0, 1)$ by $\sqrt{a_0^2 + 6}$ immediately yields the singular values $\frac{1}{a_0^2+6} \in (0.148448, 0.148449)$ (multiplicity 4 across $M, N, P$) and $\frac{a_0^2}{a_0^2+6} \in (0.109306, 0.109307)$, matching `claude-b9ee`'s L-BFGS report. $\square$

---

## 4. Disjoint Circular Block Harmonic-Mean Theorem & $C_{\mathrm{opt}} \in [1168/729, 2]$ (Theorem 4)

### Theorem 4 (**P + C**, author only)
1. **(Disjoint circular block harmonic mean):** Let $c = \sum_{r=1}^m c_r$ ($c_r \ge 1$) partition $\mathbb{C}^c = \bigoplus_{r=1}^m \mathbb{C}^{c_r}$ across each of the three clusters $(x, y, w)$. For each $1 \le r \le m$, let $Z_r$ be a nonzero trilinear form in our three-type span on $(\mathbb{C}^{c_r})^3$ normalized to $\mathbb{E}|Z_r|^2 = 1$, and put its Gaussian fourth-moment excess
   $$e_r := \mathbb{E}|Z_r|^4 - 2 = \left(\frac{c_r + 1}{c_r}\right)^{\!3}\kappa(Z_r) - 2 > 0.$$
   Then for $R_p := \sum_{r=1}^m \sqrt{p_r}\,Z_r$ with $p_r \ge 0$ and $\sum_{r=1}^m p_r = 1$:
   $$\mathbb{E}|R_p|^2 = 1, \qquad \mathbb{E}|R_p|^4 = 2 + \sum_{r=1}^m p_r^2 e_r,$$
   and minimizing over the simplex gives the unique optimum $p_r^* = \frac{e_r^{-1}}{\sum_{s=1}^m e_s^{-1}}$, with
   $$\kappa(R_{p^*}) = \left(\frac{c}{c+1}\right)^{\!3}\!\left(2 + \frac{1}{\sum_{r=1}^m e_r^{-1}}\right).$$
2. **(Exact rational values for $c = 5, 6, 8, 9, 10$ and coupled $c = 7$):** Using $R_1$ ($c_1 = 1, e_1 = 6$), $R_2$ ($c_2 = 2, e_2 = \frac{5}{2}$), and $R_4$ ($c_4 = 4, e_4 = \frac{9}{8}$):

| $c$ | Explicit construction | Exact $\kappa(R)$ | Decimal (`ceil` at 16d) | $c(2 - \kappa(R))$ | Published **N** (`STATUS 4.30`) |
|---:|---|---|---:|---|---:|
| $2$ | $R_2$ | $4/3$ | `1.3333333333333334` | $4/3 = 1.3333\dots$ | `4/3` |
| $3$ | $R_3(a_0, 1)$, $2a_0^3 + a_0^2 = 2$ | $\frac{27}{16} - \frac{27}{64a_0(3a_0+2)}$ | `1.5800204772465801` | $1.259938568\dots$ | `1.5800` |
| $4$ | $R_4$ | $8/5$ | `1.6000000000000000` | $8/5 = 1.6000\dots$ | `1.6000` |
| $5$ | $R_4^{(1)} + \sqrt{3}\,R_1^{(2)}$ | $875/513$ | `1.7056530214424952` | $755/513 = 1.4717\dots$ | `1.7057` |
| $6$ | $\sqrt{5}\,R_4^{(1)} + 3\,R_2^{(2)}$ | $2484/1421$ | `1.7480647431386348` | $2148/1421 = 1.5116\dots$ | `1.7481` |
| $7$ | Coupled $R_7(\frac{9}{17}, 1, \frac{9}{17}, \frac{42}{55}, \frac{42}{55}, 1)$ | $\frac{90370589404268985}{50317319709427712}$ | `1.7960135779517026` | $1.427904954\dots$ | `1.7930` (**N**: `1.79298407`) |
| **$8$** | **$R_8 = R_4^{(1)} + R_4^{(2)}$ ($\{-1, 0, +1\}$ coeffs)** | **$1312/729$** | **`1.7997256515775035`** | **$1168/729 = 1.602194787\dots$** | `1.7997` |
| $9$ | $R_4^{(1)} + R_4^{(2)} + \sqrt{3}\,R_1^{(3)}$ | $8019/4375$ | `1.8329142857142858` | $6579/4375 = 1.5037\dots$ | `1.8329` |
| $10$ | $\sqrt{5}\,R_4^{(1)} + \sqrt{5}\,R_4^{(2)} + 3\,R_2^{(3)}$ | $120500/65219$ | `1.8476210920130637` | $99380/65219 = 1.5237\dots$ | `1.8476` |

3. **(Refutation of $C_{\mathrm{opt}} = 8/5$ and general $c = 4k + r$ asymptotics):**
   At $c = 8$, the integer-coefficient polynomial $R_8 = R_4^{(1)} + R_4^{(2)}$ has $\mathbb{E}|R_8|^2 = 32$, $\mathbb{E}|R_8|^4 = 2624$, $\kappa(R_8) = \frac{1312}{729} < \frac{9}{5}$, and
   $$8\big(2 - \kappa(R_8)\big) = \frac{1168}{729} = \frac{8}{5} + \frac{8}{3645} > \frac{8}{5},$$
   proving $\frac{1168}{729} \le C_{\mathrm{opt}} \le 2$. More generally, for $R_4^{\oplus k}$ at $c = 4k$ ($k \ge 1$),
   $$4k\big(2 - \kappa(R_4^{\oplus k})\big) - \frac{8}{5} = \frac{-8(k - 1)(4k^2 - 8k - 1)}{5(4k + 1)^3},$$
   which is positive **uniquely at $k = 2$ ($c = 8$)**, equals $0$ at $k = 1$ ($c = 4$), is strictly negative for all $k \ge 3$, and satisfies $\kappa(R_4^{\oplus k}) = \big(\frac{4k}{4k+1}\big)^3(2 + \frac{9}{8k}) = 2 - \frac{3}{2c} + O(c^{-2})$ as $c \to \infty$ (and similarly for every $c = 4k + r$, $r \in \{0, 1, 2, 3\}$, by appending $R_1, R_2$, or $R_3(a_0, 1)$).

### Proof
For (1), each $Z_r$ satisfies $\mathbb{E}[Z_r] = 0$ and $\mathbb{E}[Z_r^2] = 0$ because under the global diagonal phase $(x, y, w) \mapsto (e^{i\theta}x, e^{i\theta}y, e^{i\theta}w)$ every monomial with one conjugated factor and two unconjugated factors transforms by $e^{+i\theta}$ ($Z_r^2$ transforms by $e^{+2i\theta}$). Because $Z_1, \dots, Z_m$ depend on disjoint Gaussian coordinate subsets, they are mutually independent! Hence $\mathbb{E}[Z_r \bar Z_s] = \delta_{rs}$, $\mathbb{E}|R_p|^2 = \sum_r p_r = 1$, and expanding $R_p^2 = \sum_r p_r Z_r^2 + 2\sum_{r < s}\sqrt{p_r p_s}\,Z_r Z_s$ gives pairwise orthogonal terms in $L^2$:
- for $r \ne s$ and $\{r, s\} \ne \{r', s'\}$, independence and $\mathbb{E}[Z_t] = 0$ kill the inner product;
- for $r$ vs $(s < t)$, independence and $\mathbb{E}[Z_r^2 \bar Z_s \bar Z_t] = 0$ kill the inner product;
- for $r \ne s$, $\mathbb{E}[Z_r^2 \bar Z_s^2] = \mathbb{E}[Z_r^2]\,\mathbb{E}[\bar Z_s^2] = 0 \cdot 0 = 0$ by circularity!

Thus
$$\mathbb{E}|R_p|^4 = \mathbb{E}|R_p^2|^2 = \sum_{r=1}^m p_r^2\,\mathbb{E}|Z_r|^4 + 4\sum_{1 \le r < s \le m} p_r p_s\,\mathbb{E}|Z_r|^2\,\mathbb{E}|Z_s|^2 = \sum_{r=1}^m p_r^2(2 + e_r) + 4\sum_{r < s} p_r p_s = 2\Big(\sum_{r=1}^m p_r\Big)^{\!2} + \sum_{r=1}^m p_r^2 e_r = 2 + \sum_{r=1}^m p_r^2 e_r.$$
By Cauchy–Schwarz, $\big(\sum_r p_r^2 e_r\big)\big(\sum_r e_r^{-1}\big) \ge \big(\sum_r p_r\big)^2 = 1$, with equality uniquely at $p_r^* = e_r^{-1} / \sum_s e_s^{-1}$, proving (1).

For (2) and (3), $\mathbb{E}|R_1|^2 = 1, \mathbb{E}|R_1|^4 = 8 \implies e_1 = 6$; $\mathbb{E}|R_2|^2 = 4, \mathbb{E}|R_2|^4 = 72 \implies e_2 = \frac{72}{16} - 2 = \frac{5}{2}$; and $\mathbb{E}|R_4|^2 = 16, \mathbb{E}|R_4|^4 = 800 \implies e_4 = \frac{800}{256} - 2 = \frac{9}{8}$. Notice that the unnormalized second moments $(1, 4, 16) = (1^2, 2^2, 4^2)$ are squares! Consequently:
- At $c = 8$ ($R_4 \oplus R_4$), $p_1^* = p_2^* = \frac{1}{2}$ gives equal unnormalized coefficients $1 : 1$, so $R_8 = R_4^{(1)} + R_4^{(2)}$ has coefficients in $\{-1, 0, +1\}$, $\mathbb{E}|R_8|^2 = 32$, $\mathbb{E}|R_8|^4 = 2624$, and $\kappa(R_8) = \big(\frac{8}{9}\big)^3 \frac{2624}{1024} = \frac{1312}{729}$.
- At $c = 5$ ($p_4^* : p_1^* = 16 : 3 \implies$ unnormalized scale $1 : \sqrt{3}$) and $c = 9$ ($1 : 1 : \sqrt{3}$), the polynomials live in $\mathbb{Q}(\sqrt{3})[x, y, w]$; at $c = 6$ ($p_4^* : p_2^* = 20 : 9 \implies$ unnormalized scale $\sqrt{5} : 3$) and $c = 10$ ($\sqrt{5} : \sqrt{5} : 3$), they live in $\mathbb{Q}(\sqrt{5})[x, y, w]$. Gate 5 of `verify_kappa_spheres.py` evaluates every one of $R_5, R_6, R_8, R_9, R_{10}$ **directly from the monomial Gaussian moment definition** in exact $\mathbb{Q}(\sqrt{d})$ arithmetic (plus pure rational Pell convergents $\frac{265}{153} \approx \sqrt{3}$ and $\frac{2889}{1292} \approx \sqrt{5}$ within $10^{-10}$ and $10^{-12}$), confirming every entry of the table.
- At $c = 7$, disjoint $R_4 \oplus R_3(a_0, 1)$ gives $\kappa > 1.79810487$, whereas coupling two octonion blocks through shared $(x_2, y_0, w_0)$ coordinates in `build_R7_coupled(9/17, 1, 9/17, 42/55, 42/55, 1)` gives exact rational $\kappa = \frac{90370589404268985}{50317319709427712} < 1.79601358 < 1.79810487$ (Gate 5), proving strictly that non-disjoint coordinate sharing beats disjoint blocks at $c = 7$. $\square$

---

## 5. What Remains Open on Issue #507

1. **Global optimality at $c = 3$ and $c \ge 5$:** Theorem 3 determines the exact algebraic minimum $\kappa_*(3) = \frac{27}{16} - \frac{27}{64a_0(3a_0+2)}$ inside the rank-one-per-type family (matching unconstrained 162-real-variable L-BFGS to 12+ digits), and Theorem 4 matches unconstrained L-BFGS to all published digits at $c = 5, 6, 8, 9, 10$, while Theorem 2 proves $\min_R \kappa(R) \ge \frac{3}{2} + \frac{1}{196608}$ at $c = 3$. Proving unconditionally that no tensor outside these families achieves smaller $\kappa$ at $c = 3$ or $c = 8$ remains open.
2. **Exact value of $C_{\mathrm{opt}} \in [\frac{1168}{729}, 2]$:** Unconstrained L-BFGS across $2 \le c \le 10$ gives maximum $c(2 - \kappa) = \frac{1168}{729} \approx 1.60219479$ at $c = 8$, suggesting $C_{\mathrm{opt}} = \frac{1168}{729}$ as the new candidate sharp constant (**N** evidence for the upper side; **P + C** for $C_{\mathrm{opt}} \ge \frac{1168}{729}$).
3. **Full content-law closure on $t = 0.70$:** As recorded in `STATUS.md` `4.30` and `4.31`, bounding the ratio uniformly over actual scale laws $G = B_c H$ and outside the three-cluster family remains open.

---

## 6. Exact Replay Instructions

From the repository root (or inside `research/higher-degree/code/kappa-spheres-gemini-21d5/`):

```sh
python3 -I -O research/higher-degree/code/kappa-spheres-gemini-21d5/verify_kappa_spheres.py
```

The script completes in $< 2$ seconds using only the Python standard library (`fractions`, `ast`, `json`, `pathlib`, `sys`), runs its own AST zero-float audit (Gate 1), verifies Theorems 1–4 from first-principles monomial Gaussian integration (Gates 2–5) plus 6 adversarial negative controls (Gate 6), and writes [`verify_kappa_spheres_result.json`](../../code/kappa-spheres-gemini-21d5/verify_kappa_spheres_result.json) (recorded output in [`REPLAY.log`](../../code/kappa-spheres-gemini-21d5/REPLAY.log)).
