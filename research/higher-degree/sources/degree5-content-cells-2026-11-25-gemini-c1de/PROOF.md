# First-Chaos Content of a Cubic Chaos Element per `(u, chi)` Cell (`P1`, Issue `#623`)

**Author:** `gemini-c1de`
**Date:** 2026-11-25
**Status:** **`P + C, author only`** (unreviewed; numerical searches graded **`N`**)
**Problem reference:** [P1-content-law-on-covering-rows.md](../degree5-attack-2026-11-25/problems/P1-content-law-on-covering-rows.md)

---

## 1. Executive Summary

We study Problem `P1`: for arbitrary ambient dimension $n \ge 1$, every cubic chaos element $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ of energy $u = \|q\|_2^2 > 0$ and fourth excess $\chi = \delta(q)/u^2 > 0$ ($\delta(q) := \mathbb{E}[|q|^4] - 2 u^2$) satisfying the Rice gate
$$\inf_{\lambda > 0}\left(\mathbb{E}\bigl[\rho(\lambda^2 |q|^2)\bigr] - \frac{\lambda u}{0.78}\right) \ge t_{\mathrm{lo}}, \qquad \rho(x) := \mathbb{E}_{Z \sim \mathcal{N}_{\mathbb{C}}(0,1)}\bigl|Z + \sqrt{x}\bigr|, \tag{R1}$$
bound the sectorial first-chaos content ratio
$$r_h(q) := \frac{\|c[h](q)\|_2^2}{\delta(q)\,\widehat{\omega}_h(q)}, \qquad c[h](q) := \mathbb{E}\bigl[\bar{Z}\,q(Z)\,h(|q(Z)|^2)\bigr] \in \mathbb{C}^n,$$
where $k(v) := \int_0^\infty h(v + u\tau) e^{-\tau}\,d\tau$, $k'(v) = (k(v) - h(v))/u$, and $\widehat{\omega}_h(q) := \frac{3}{2}\mathbb{E}[V k'(V)^2] - \frac{3}{4 u}(\mathbb{E}[V k'(V)])^2$ ($V = |q|^2$), on both profile sectors $h \in \{h_A, h_B\}$ of the 14 Case I covering rows of `fin_table_fundFull.json`.

### Main Results

1. **Dimension-Free Minimax Linearized Joint-Kantorovich Duality (`JM1`, Theorem 2.1, `P`):**
   Starting from the joint first-chaos content bound $M_1(e)$ (`P1` §1.2), the change of dual variables
   $$\beta := \frac{3\xi}{2(u + d_1)} \ge 0, \qquad \gamma := \frac{3\xi\zeta\sqrt{d_2}}{4(u + d_1)} > 0$$
   eliminates the unknown contraction invariants $(d_1, d_2) \in \Lambda(u, \chi) := \{0 \le d_1 \le 2 u,\; 0 \le d_2 \le u,\; d_1^2 + d_2^2 \le \frac{\chi}{2} u^2\}$ from inside the Gaussian expectation and renders $(d_1, d_2)$ **purely linear** outside. Maximizing analytically over $(d_1, d_2) \in \Lambda(u, \chi_{\mathrm{hi}})$ avoids any 2D subdivision of $(d_1, d_2)$ and covers every $\chi \in (0, \chi_{\mathrm{hi}}]$ continuously down to $\chi \to 0^+$.
2. **Continuous-Law Cone-$\mathcal{K}$ + Coupled-Gram Stein + Rational Kummer/Cauchy–Schwarz Rice Certificates (`P + C, author only`):**
   Combining `JM1` with piecewise-linear-plus-quadratic Kantorovich duality for $\tau_e \sim \mathrm{Exp}(1)$, rational Stein identities $f_m(U) = (1 + U/c_m)^{-1}$, Coupled-Gram inequalities (`Grothe/Lower/Gram.lean`, $s_j \ge 2$), the holomorphic radial mean bound $\mathbb{E}[\sqrt{U}] \le \frac{2287}{2500}$ (`Conjecture K` `3.7`), the sixth-moment bound $\mathbb{E}[U^3] \le 6 + 9\chi + \frac{4045313}{100000}\chi^{3/2}$, and 29 certified rational tangent lines to $\rho(x)$ (25 Kummer-series tangents up to $x = 70$ plus 4 Cauchy–Schwarz AM–GM tangents $\rho(x) \le \sqrt{x+1} \le \frac{m^2+1}{2m} + \frac{x}{2m}$ at $m \in \{12, 32, 100, 250\}$, across 32 Rice scales $\lambda_k \in [0.22, 60]$) reduces each $(u, [\chi_{\mathrm{lo}}, \chi_{\mathrm{hi}}])$ cell to verifying $\sup_{U \in [0, \infty)} \mathcal{M}(U) < 0$ on a contiguous partition of $m_1 = \mathbb{E}[V k'(V)]$, with **zero $U$-grid discretization gap** and **zero `libm` dependency** (`109` total certificates across 7 `< 220 KB` shards: `90` `JM1_BOUND` + `19` `INFEAS_R1`).
3. **100% Continuous-$\chi$ Closure of Pieces 16 and 17, Partial Cell Closure on Pieces 12–15, and `(R1)` Infeasibility Tails (`P + C, author only`):**
   - **Piece 17 (`[0.863036, 0.866656]`, row `0.865`):** **11/11 (`100%`)** of active `(u, chi)` cells (`theta < 50`) in `fin_table_fundFull.json` close continuously over $\chi \in (0, 6]$ (at $0.85 u_{\mathrm{cap}}$) and $\chi \in (0, 8]$ (at $0.92 u_{\mathrm{cap}}$), with certified bounds `5.968`–`10.677` against allowances `12.834`–`46.347`, plus seamless `[prev_c, 42]` coverage across all 5 energies (`JM1_BOUND` `7.862`–`12.035 < 50` and `[39, 42]` `INFEAS_R1` at $0.92 u_{\mathrm{cap}}$).
   - **Piece 16 (`[0.857393, 0.863036]`, row `0.860`):** **35/35 (`100%`)** of active `(u, chi)` cells close continuously in $\chi$, including the tightest cell `(0.92 u_cap, chi in [10, 12], theta_allow = 5.10062)` certified across 10 subintervals at `5.0639`–`5.09256 <= 5.10062` (where uncoupled `(PM)` fails on both sectors at `5.106` and `5.199`), plus seamless `[prev_c, 42]` coverage across all 5 energies (`JM1_BOUND` `7.597`–`14.182 < 50` and `[39, 42]` `INFEAS_R1` at $0.92 u_{\mathrm{cap}}$).
   - **Pieces 1–15 (rows `0.740`–`0.855`):** Closes small/moderate-$\chi$ cells at $0.78 u_{\mathrm{cap}}$ on Pieces 12–15 (`[0, 1]` on Pc 12–15 at `4.1126`–`5.6101 <= 5.2343`–`13.8331`, and Pc 15 `chi = 20` at `6.5410 <= 6.5452`), certifies **17 `(R1)` Farkas infeasibility (`INFEAS_R1`)** high-$\chi$ tails (`chi >= 30..42`) across Pieces 1–15, and records **16 benchmark `JM1_BOUND` upper bounds** (`3.7512`–`6.6830` vs allowances `0.6449`–`4.1463`) across Pieces 1–14, quantifying the single-direction radial-law gap to the three-cluster benchmark (`~0.246`, §5).
4. **Exact Algebraic Negative Controls (`P` & `P + C, author only`):**
   - **Low-energy Wick junta ($u \to 0^+$):** By Green's theorem, $G_X''(0) = 0$ identically on every Case I row, so $h_X(v) = h_X(0) + h_X'(0) v + O(v^{3/2})$. On $q_u(X) = \sqrt{u}\,X(|X|^2 - 2)/\sqrt{2}$, exact Gaussian Wick moments yield $\lim_{u \to 0^+} r_{h_X}(q_u) = \frac{256}{63} = 4.063492\dots$, and at $u = 10^{-6}$ our C++17 certifier encloses $r_{h_A}(q_u) \in [3.662013, 4.496763]$ on row `0.800` and $[3.636248, 4.527469]$ on row `0.865` while `(R1)` holds with $\inf_{\lambda > 0}(\dots) \ge 0.883546 > 0.866656$ — rigorously refuting any single energy-independent constant $\le 3.63$ across all energies (additionally, at $u = 1/128, \chi \in [36, 42]$ on row `0.800`, `F_certified = 13.2087 > 1.139` and the live C++17 binary rejects `F_claimed = 1.139`).
   - **Own-row `0.70` (`theta = 0.085`):** Our certifier refuses `0.085` at `(u = 0.1572, chi = 12, t_lo = 0.6949)` (`F_certified = 8.6474`, and the live C++17 binary rejects `F_claimed = 0.085`), and an explicit Hurwitz cubic witness on $\mathbb{C}^{13}$ (`c = 4`, §4.2) satisfies `(R1)` with $\chi \le 12$ and $r_{h_A}(q) \approx 0.1155 > 0.085$ (**`N`**).

---

## 2. Mathematical Proof Chain (`P`)

### 2.1 Minimax Linearized Joint-Kantorovich Bound (`JM1`)

**Theorem 2.1.** *Let $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ have energy $u = \|q\|_2^2 > 0$, fourth cumulant $\delta(q) = \chi u^2 > 0$ with $\chi \in (0, \chi_{\mathrm{hi}}]$, and contraction invariants $d_1(e) = \|Q_e\|_2^2 - u$, $d_2(e) = \|\widetilde{B}_e\|_2^2$ along any unit vector $e \in \mathbb{C}^n$. For any bounded measurable $h : [0, \infty) \to \mathbb{R}$, any $\beta \ge 0$, $\gamma > 0$, and $\lambda_K \in \mathbb{R}$,*
$$\frac{\|c[h](q)\|_2^2}{\delta(q)} \le \left(\frac{\beta^2}{3} + \lambda_K\right)u + M_{\Lambda(\chi_{\mathrm{hi}})}\!\left(\frac{\beta^2}{3} + \lambda_K,\; \frac{\beta^2}{4\gamma} + \lambda_K\right) + \sup_{\|e\|_2 = 1} \mathbb{E}\Bigl[\tau_e H_{\beta,\gamma,\lambda_K}(|q(Z)|^2)\Bigr],$$
*where $\tau_e := |\langle Z, e\rangle|^2 \sim \mathrm{Exp}(1)$, $V = |q(Z)|^2$,*
$$H_{\beta,\gamma,\lambda_K}(v) := \left(\frac{3}{2} + \gamma\right) v k'(v)^2 - \beta v k'(v) - \lambda_K v,$$
*and for any $(c_1, c_2) \in \mathbb{R}^2$,*
$$M_{\Lambda(\chi)}(c_1, c_2) := \max_{\substack{0 \le d_1 \le 2 u,\; 0 \le d_2 \le u \\ d_1^2 + d_2^2 \le \frac{\chi}{2} u^2}} (c_1 d_1 + c_2 d_2) \le \min\!\Bigl(2 u (c_1)_+ + u (c_2)_+,\; u\sqrt{\tfrac{\chi}{2}}\sqrt{(c_1)_+^2 + (c_2)_+^2}\Bigr)$$
*(sharpened further on $2 < \chi < 10$ by splitting $(c_1)_+ = p_1 + q_1$ or $(c_2)_+ = p_2 + q_2$ with $p_i \ge 0$, $q_i \ge 0$).*

*Proof.* By the joint first-chaos content inequality (`P1` §1.2 / `CONTENT_LEMMA_D5`) along a unit maximizer $e \in \mathbb{C}^n$ with $\|c[h](q)\|_2 = |\langle c[h](q), e\rangle|$, for every $\xi \ge 0$ and $\zeta > 0$:
$$\frac{|\langle c[h](q), e\rangle|^2}{\delta(q)} \le \frac{3\xi^2}{4(u + d_1)}(u + d_1)^2 \cdot \frac{1}{u + d_1} + \frac{3\xi}{4\zeta(u + d_1)}\sqrt{d_2} + \mathbb{E}\!\left[\tau_e\left(\left(\frac{3}{2} + \frac{3\xi\zeta\sqrt{d_2}}{4(u + d_1)}\right)V k'(V)^2 - \frac{3\xi}{2(u + d_1)} V k'(V)\right)\right].$$
Substituting $\xi = \frac{2(u + d_1)}{3}\beta$ and $\zeta = \frac{2\gamma}{\beta\sqrt{d_2}}$ (when $\beta > 0$ and $d_2 > 0$; by continuity at $\beta = 0$ or $d_2 \to 0^+$, where the $d_2$-term vanishes) gives:
- $\frac{3\xi}{2(u + d_1)} = \beta$,
- $\frac{3\xi\zeta\sqrt{d_2}}{4(u + d_1)} = \gamma$,
- $\frac{3\xi^2}{4(u + d_1)} = \frac{\beta^2}{3}(u + d_1)$,
- $\frac{3\xi}{4\zeta(u + d_1)} \sqrt{d_2} = \frac{\beta^2}{4\gamma} d_2$.
Adding and subtracting $\lambda_K \mathbb{E}[\tau_e V] = \lambda_K(u + d_1 + d_2)$ (since $\mathbb{E}[|\langle Z, e\rangle|^2 |q(Z)|^2] = u + d_1(e) + d_2(e)$ on $\mathcal{H}_{2,1}(\mathbb{C}^n)$) yields
$$\frac{|\langle c[h](q), e\rangle|^2}{\delta(q)} \le \left(\frac{\beta^2}{3} + \lambda_K\right)(u + d_1) + \left(\frac{\beta^2}{4\gamma} + \lambda_K\right) d_2 + \mathbb{E}\bigl[\tau_e H_{\beta,\gamma,\lambda_K}(V)\bigr].$$
Since $(d_1, d_2) \in \Lambda(u, \chi) \subseteq \Lambda(u, \chi_{\mathrm{hi}})$ (`P1` §1.2: $d_1^2 + d_2^2 \le \frac{1}{2}\delta(q) = \frac{\chi}{2} u^2$), taking the maximum of the linear form over $\Lambda(u, \chi_{\mathrm{hi}})$ proves the inequality. Every sub-decomposition $c_1 \le (c_1)_+ = p_1 + q_1$, $c_2 \le (c_2)_+ = p_2 + q_2$ ($p_i, q_i \ge 0$) satisfies $c_1 d_1 + c_2 d_2 \le 2 u p_1 + u p_2 + u\sqrt{\chi_{\mathrm{hi}}/2}\sqrt{q_1^2 + q_2^2}$ by Cauchy–Schwarz on $d_1^2 + d_2^2 \le \frac{\chi_{\mathrm{hi}}}{2} u^2$. $\square$

### 2.2 Exponential Kantorovich Duality for $\mathbb{E}[\tau_e X]$

**Lemma 2.2.** *For $\tau_e \sim \mathrm{Exp}(1)$, any real random variable $X = H_{\beta,\gamma,\lambda_K}(V)$, knots $0 = t_0 < t_1 < \dots < t_M$, nondecreasing thresholds $x_1 \le \dots \le x_M$, and $\varepsilon_K > 0$,*
$$\mathbb{E}[\tau_e X] \le \sum_{m=1}^{M-1} x_m\bigl(e^{-t_{m-1}} - e^{-t_m}\bigr) + x_M e^{-t_{M-1}} + \frac{e^{-t_M}}{\varepsilon_K} + \mathbb{E}\bigl[\Phi_{\mathrm{Kant}}(X)\bigr],$$
*where $\Phi_{\mathrm{Kant}}(x) := \max_{0 \le m \le M}\bigl(t_m x - \sum_{j=1}^m (t_j - t_{j-1}) x_j\bigr) + \frac{\varepsilon_K}{2}(x - x_M)_+^2$ is convex and nondecreasing on $\mathbb{R}$.*

*Proof.* Define the step function $\psi_0(\tau) := \sum_{m=1}^{M-1} x_m \mathbf{1}_{[t_{m-1}, t_m)}(\tau) + x_M \mathbf{1}_{[t_{M-1}, \infty)}(\tau)$. For any $x \in \mathbb{R}$, pick $m^* \in \{0, \dots, M\}$ with $x_{m^*} \le x \le x_{m^*+1}$ ($x_0 := -\infty, x_{M+1} := +\infty$). Since $(x_j)$ is nondecreasing, $x - \psi_0(s) \ge 0$ on $[0, t_{m^*})$ and $x - \psi_0(s) \le 0$ on $(t_{m^*}, t_M]$, so for every $\tilde{\tau} := \min(\tau, t_M) \in [0, t_M]$,
$$\tilde{\tau} x - \int_0^{\tilde{\tau}} \psi_0(s)\,ds = \int_0^{\tilde{\tau}} \bigl(x - \psi_0(s)\bigr)\,ds \le \int_0^{t_{m^*}} \bigl(x - \psi_0(s)\bigr)\,ds = t_{m^*} x - \sum_{j=1}^{m^*} (t_j - t_{j-1}) x_j \le \max_{0 \le m \le M}\Bigl(t_m x - \sum_{j=1}^m (t_j - t_{j-1}) x_j\Bigr).$$
Meanwhile, by Fubini's theorem for $\tau \sim \mathrm{Exp}(1)$, $\mathbb{E}\bigl[\int_0^{\min(\tau, t_M)} \psi_0(s)\,ds + (\tau - t_M)_+ x_M\bigr] = \int_0^{t_M} \psi_0(s) e^{-s}\,ds + x_M e^{-t_M} = \sum_{m=1}^{M-1} x_m(e^{-t_{m-1}} - e^{-t_m}) + x_M e^{-t_{M-1}}$, and for $\tau > t_M$, Young's inequality gives $(\tau - t_M)(x - x_M) \le \frac{(\tau - t_M)^2}{2\varepsilon_K} + \frac{\varepsilon_K}{2}(x - x_M)_+^2$ with $\int_{t_M}^\infty \frac{(\tau - t_M)^2}{2\varepsilon_K} e^{-\tau}\,d\tau = \frac{e^{-t_M}}{\varepsilon_K}$. Adding and taking expectations proves the lemma. $\square$

### 2.3 Cone-$\mathcal{K}$ + Coupled-Gram Rational Stein Duality and Kummer Rice Polygon

Write $U := |q|^2 / u \ge 0$, and let $(v(Z), r(Z))$ denote the normalized radial Stein coordinates
$$v := \frac{\Gamma(q, \bar{q})}{3 u} - 1, \qquad r := \frac{\operatorname{Re}(\Gamma(q, q)\bar{q}^2)}{3 u |q|^2} \quad (r := 0 \text{ when } q = 0),$$
where $\Gamma(f, g) = \langle \partial f, \partial g\rangle + \langle \bar{\partial} f, \bar{\partial} g\rangle$. Since $\Gamma(q, \bar{q}) \ge 0$ and $|\Gamma(q, q)| \le \Gamma(q, \bar{q})$ by Cauchy–Schwarz on $(\partial q, \bar{\partial} q)$, $(v, r) \in \mathcal{K} := \{(v, r) \in \mathbb{R}^2 : 1 + v \ge 0,\; |r| \le 1 + v\}$ pointwise, and:
1. **Normalized moments & sixth moment:** $\mathbb{E}[1] = 1$, $\mathbb{E}[U] = 1$, $\mathbb{E}[v] = 0$, $\mathbb{E}[U^2 - 2 U v - U r] = 2$, $2 + \chi_{\mathrm{lo}} \le \mathbb{E}[U^2] \le 2 + \chi_{\mathrm{hi}}$, $\mathbb{E}[U^3] \le 6 + 9\chi_{\mathrm{hi}} + \frac{4045313}{100000}\chi_{\mathrm{hi}}^{3/2}$ (`P1` §1.3), and $\mathbb{E}[\sqrt{U}] \le \frac{2287}{2500}$ (`Conjecture K` `3.7`).
2. **Bihomogeneous $(2, 1)$ gradient identities & Coupled-Gram cuts (`Grothe/Lower/Gram.lean`):**
   $\mathbb{E}[U r - \frac{1}{3} U^2] \le -\frac{2}{3}$, $\mathbb{E}[-U r] \le 0$, $\mathbb{E}[v^2 - \frac{2}{3} U v] \le 0$, $\mathbb{E}[r^2 - \frac{2}{3} U r] \le 0$, and for every Coupled-Gram parameter $s_j \ge 2$, $\mathbb{E}\bigl[v^2 - \frac{s_j + 5}{9} U v + \frac{s_j + 1/2 - 3/s_j}{9} U r\bigr] \le 0$.
3. **Rational Stein identities (`Grothe/Lower/Stein.lean`):** For each pole $c_m > 0$ and $f_m(U) = (1 + U/c_m)^{-1}$, $\mathbb{E}[U f_m(U) - (1 + v)(f_m(U) + U f_m'(U)) - r U f_m'(U)] = 0$.
4. **Exact Cone-$\mathcal{K}$ quadratic conjugate:** For any $\lambda_S > 0, \mu_S > 0$ and $(A, B) \in \mathbb{R}^2$,
   $$\Psi_{\mathcal{K}}(A, B; \lambda_S, \mu_S) := \sup_{(v, r) \in \mathcal{K}}\bigl(-2 A v - 2 B r - \lambda_S v^2 - \mu_S r^2\bigr) = \begin{cases} \dfrac{A^2}{\lambda_S} + \dfrac{B^2}{\mu_S}, & \mu_S(\lambda_S - A) \ge \lambda_S |B|, \\[6pt] 2 A - \lambda_S + \dfrac{(\lambda_S - A + |B|)_+^2}{\lambda_S + \mu_S}, & \text{otherwise,} \end{cases}$$
   which is convex on $\mathbb{R}^2$ and hence maximized over any interval rectangle $[A_{\mathrm{lo}}, A_{\mathrm{hi}}] \times [B_{\mathrm{lo}}, B_{\mathrm{hi}}]$ at its four corners.
5. **Kummer + Cauchy–Schwarz rational Rice polygon:** Since $\rho(x) = \frac{\sqrt{\pi}}{2} e^{-x}\,{}_1 F_1(\frac{3}{2}; 1; x)$ has $\rho''(x) = -\frac{\sqrt{\pi}}{8} e^{-x}\,{}_1 F_1(\frac{3}{2}; 2; x) < 0$ for all $x \ge 0$, every tangent line at a rational node $x_k \ge 0$ ($0 \le x_k \le 70$, 25 nodes) rounded outward to dyadic rationals $(a_k, b_k)$ with $a_k \ge \rho_{\mathrm{hi}}(x_k) - \rho'_{\mathrm{lo}}(x_k) x_k$ and $b_k \ge \rho'_{\mathrm{hi}}(x_k) > 0$ satisfies $\rho(x) \le a_k + b_k x$ for all $x \ge 0$. In addition, by Cauchy–Schwarz and AM–GM, $\rho(x) \le \sqrt{\mathbb{E}|Z + \sqrt{x}|^2} = \sqrt{x + 1} \le \frac{m^2 + 1}{2m} + \frac{x}{2m}$ for every $m > 0$ ($m \in \{12, 32, 100, 250\}$, 4 nodes), so $\rho(x) \le \min_{1 \le k \le 29}(a_k + b_k x)$ on $[0, \infty)$.
6. **Slice concavity elimination:** On each slice $m_1 = \mathbb{E}[V k'(V)] \in [a_r, b_r]$, convexity of $m_1 \mapsto m_1^2$ gives $m_1^2 \le (a_r + b_r) m_1 - a_r b_r$, so $\widehat{\omega}_h(q) \ge \frac{3 a_r b_r}{4 u} + \mathbb{E}\bigl[\frac{3}{2} V k'(V)^2 - \frac{3(a_r + b_r)}{4 u} V k'(V)\bigr]$.

### 2.4 Outward-Rounded 2D Row Profile Enclosures & Backward $k_X$ Contraction Recurrence

For each of the 15 rows $(\ell, \beta, b_A, b_B, \nu_5, \sigma_A, \sigma_B)$, `certify_content_cells.cpp` encloses $G_A(s), G_B(s)$ directly from their defining 2D Gaussian polar integrals (`P1` §1.1) using:
- Exact cancellation of the polar Jacobian $r$ against $1/(r P_L(r^2))$ on the zero-tube $s \in [0, s_1]$ ($s_1 = 2^{-13}$);
- Centered 3-variable quadratic Taylor-affine forms $(e_1, e_2, e_3) \in [-1, 1]^3$ around the vortex and polar cells with exact analytical integration over $(e_1, e_2) \in [-1, 1]^2$;
- Compactification $\varepsilon = 1/s \in [0, 1/8]$ on $s \in [8, \infty)$;
- **Exact dependency-free backward interval contraction recurrence for $k_X'(v)$:** on any mesh $0 = w_0 < w_1 < \dots < w_{N_W} = 256$ with $r_j = e^{-(w_{j+1} - w_j)/u}$ and $h_X'([w_j, w_{j+1}]) \subseteq H'_j$, the monotone endpoint expression $k_X'(w_j) \in K'_j := H'_j + r_j (K'_{j+1} - H'_j)$ (evaluated at extreme $r_j$ endpoints without interval dependency between $r_j$ and $1 - r_j$) encloses every node, and by affine monotonicity in $\alpha(v) = e^{-(w_{j+1} - v)/u} \in [r_j, 1]$, $k_X'(v) \in \operatorname{hull}(K'_j, K'_{j+1})$ on each panel $[w_j, w_{j+1}]$ (evaluated panel-by-panel without cross-panel $(k_X'^2, k_X')$ chimera mixing).

---

## 3. Verification Summary (`P + C, author only`)

All `109` continuous-law certificates (`90` `JM1_BOUND` + `19` `INFEAS_R1`, stored across `dual_certs.json` and shards `dual_certs_1.json`..`dual_certs_7.json`, each `< 220 KB`) are verified reproducibly by `verify.py` and `certify_content_cells.cpp` (`result.json`):

- **Piece 17 (`[0.863036, 0.866656]`, row `0.865`):** **11/11 (`100%`)** of active `(u, chi)` cells (`theta < 50`) closed continuously in $\chi$ (`5.968`–`10.677` vs `12.834`–`46.347`), plus seamless `[prev_c, 42]` tail coverage across all 5 energies (`7.862`–`12.035 < 50` and `[39, 42]` `INFEAS_R1` at $0.92 u_{\mathrm{cap}}$).
- **Piece 16 (`[0.857393, 0.863036]`, row `0.860`):** **35/35 (`100%`)** of active `(u, chi)` cells closed continuously in $\chi$, including `(0.92 u_cap, chi in [10, 12], theta_allow = 5.10062)` (`5.0639`–`5.09256 <= 5.10062`), plus seamless `[prev_c, 42]` tail coverage across all 5 energies (`7.597`–`14.182 < 50` and `[39, 42]` `INFEAS_R1` at $0.92 u_{\mathrm{cap}}$).
- **Pieces 1–15 (`0.740`–`0.855`):** Closes small/moderate-$\chi$ cells at $0.78 u_{\mathrm{cap}}$ on Pieces 12–15 (`[0, 1]` on Pc 12–15 at `4.1126`–`5.6101 <= 5.2343`–`13.8331`, and Pc 15 `chi = 20` at `6.5410 <= 6.5452`), certifies **17 `(R1)` infeasibility tails** (`chi >= 30..42`) across Pieces 1–15, and certifies **16 benchmark `JM1_BOUND` bounds** (`3.7512`–`6.6830`) across Pieces 1–14.

---

## 4. Negative Controls (`P` & `P + C, author only`)

1. **Low-Energy 1D Wick Junta (`P1` §6 Control 1):**
   On $H(X) = \frac{1}{\sqrt{2}} X(|X|^2 - 2)$ ($X \sim \mathcal{N}_{\mathbb{C}}(0,1)$, $T = |X|^2 \sim \mathrm{Exp}(1)$), $\mathbb{E}[|H|^2] = 1$, $\mathbb{E}[|H|^4] = 44$ ($\delta(\sqrt{u}\,H) = 42 u^2$), $\mathbb{E}[T^2(T - 2)^3] = 32$, so for $h_X(v) = h_X(0) + h_X'(0) v + O(v^{3/2})$ (where $G_X''(0) = 0$ by Green's theorem since $\operatorname{Re}(\operatorname{ph}(w + 1) - \operatorname{ph}(w - 1)) = \partial_x(|w + 1| - |w - 1|)$ integrates to $0$ over $\mathbb{R}^2$),
   $$\lim_{u \to 0^+} \frac{|c_X(\sqrt{u}\,H)|^2}{\delta(\sqrt{u}\,H)} = \frac{32^2}{8 \cdot 42} h_X'(0)^2 u = \frac{64}{21} h_X'(0)^2 u, \qquad \lim_{u \to 0^+} \frac{\widehat{\omega}_X(\sqrt{u}\,H)}{u} = \frac{3}{4} h_X'(0)^2,$$
   hence $\lim_{u \to 0^+} r_{h_X}(\sqrt{u}\,H) = \frac{64/21}{3/4} = \frac{256}{63} = 4.06349206\dots$. At $u = 10^{-6}$ (centered algebraically around $m_0 = \operatorname{mid}(h_A'(0))$ using the exact identities $\mathbb{E}[p(T)] = 1$ and $\mathbb{E}[\frac{T(T-2)}{\sqrt{2}} p(T)] = 8\sqrt{2}$), `certify_content_cells.cpp` encloses $r_{h_A}(q_u) \in [3.662013, 4.496763]$ on row `0.800` and $[3.636248, 4.527469]$ on row `0.865` while $\inf_{\lambda > 0}(\mathbb{E}[\rho(\lambda^2 V)] - \lambda u / 0.78) \ge 0.883546 > 0.866656$. Additionally, at `(u = 1/128, chi in [36, 42])` on row `0.800`, `certify_content_cells.cpp` certifies `F_certified = 13.2087` and rejects `F_claimed = 1.139` with exit code `2` (Control 13 of `test_controls.py`).
2. **Own-Row `0.70` (`P1` §6 Control 2):**
   At `(u = 0.1572, chi = 12, t_lo = 0.6949)` on own-row `0.70` (tilt `(0.4, 0.30)`, allowance `0.085`), `certify_content_cells.cpp` refuses `0.085` (certifying `F_certified = 8.6474`, and rejecting `F_claimed = 0.085` with exit code `2` in Control 12 of `test_controls.py`). Moreover, numerical evaluation (**`N`**) on the $c = 4$ Hurwitz cubic witness on $\mathbb{C}^{13}$ at $u = 0.1572$, $\chi \le 12$, satisfying `(R1)` above `0.6949` achieves $r_{h_A}(q) \approx 0.1155 > 0.085$.

---

## 5. Structural Findings on `P1` §5 Questions (`P` & `N`)

1. **Beyond the Three-Cluster Scale Family (`P1` §5 Question 1):**
   On $K$ pairwise orthogonal bilinear-conjugate clusters $R_w = \sum_{k=1}^K \sqrt{w_k}\,X_k Y_k \overline{W_k}$ ($w_k \ge 0$, $\sum_{k=1}^K w_k = 1$), exact Gaussian Wick contractions (`verify.py`, **`P`**) give $\mathbb{E}[|R_w|^2] = 1$ and $\mathbb{E}[|R_w|^4] = 2 + 6\sum_{k=1}^K w_k^2 \ge 2 + \frac{6}{K}$, with equality at equal weights $w_k = 1/K$ ($\chi = 6/K$: $\chi = 2$ at $K = 3$ as in `P5`, $\chi = 3/2$ at $K = 4$). Numerical optimization (**`N`**) on row `0.800` at $u = 0.85 u^*$ relaxing `(H1)` and `(H2)` of `P5` shows that every tested relaxation *lowers* $r_{h_A}$ relative to the symmetric 3-cluster `(2,2,2)` value `0.2460` (`0.2440` on asymmetric `(3,3,2)`, `0.2398` on 4-cluster `(2,2,2,2)`, and `0.2244` on full $y$-bulk tensor models).
2. **Why Single-Law Duality Plateaus Above `~3.75` While 3-Cluster Witnesses Sit Near `0.246` (`P1` §5 Question 2):**
   In `JM1`, taking $\sup_{\|e\|_2 = 1} \mathbb{E}[\tau_e H(V)]$ bounds the **single** direction $e = c[h]/\|c[h]\|_2$ using only the radial law of $V = |q|^2$ plus $(d_1(e), d_2(e)) \in \Lambda(u, \chi)$. On a $K$-cluster witness ($K = 3$), the total energy $u$ and fourth cumulant $\delta(q)$ are split across $K = 3$ nearly orthogonal subspaces, whereas along any unit vector $e$ aligned with a mixture of clusters, $\tau_e$ correlates with only $\approx 1/K$ of the cubic energy while $\delta(q)$ accumulates all $K$ clusters; single-direction radial-law relaxation treats all of $V$ as potentially concentrated along $e$, explaining the structural gap between `JM1` (`~3.75`–`6.68`, sufficient for `100%` of Pieces 16–17 and small/moderate-$\chi$ cells on Pieces 12–15) and the lower-piece allowances (`0.506`–`3.7` on Pieces 1–15). Closing Pieces 1–15 below `3.75` requires a **multi-direction / trace-budget** identity coupling $\sum_j |\langle c[h], e_j\rangle|^2$ to $\sum_j d_1(e_j)^2 = \|Q\|_F^2 - u^2 \le \frac{1}{2}\delta(q)$ rather than maximizing along one unit vector $e$ in isolation.
