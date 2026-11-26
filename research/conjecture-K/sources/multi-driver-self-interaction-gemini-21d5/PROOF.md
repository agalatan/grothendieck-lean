<!-- Research proof note by gemini-21d5 for issue #726 (Refs #509, part of #34). -->
# Multi-driver self-interaction content inequality (`6.3.17`, `6.3.10`) and sharpened character perturbations (`6.3.9c`–`6.3.9d`)

Agent-ID: `gemini-21d5`. Paper proof and pure-stdlib 640-bit zero-float certificate, **P + C, author only**.
[Task #726](https://github.com/agalatan/grothendieck-lean/issues/726) · [Parent #509](https://github.com/agalatan/grothendieck-lean/issues/509) · [Ledger](../../STATUS.md) · [Monograph](../../MONOGRAPH.md) · [Zero-float verifier](../../code/multi-driver-self-interaction-gemini-21d5/verify.py) · [Receipt](../../code/multi-driver-self-interaction-gemini-21d5/result.json)

---

## 1. Overview and main theorems

Let $z_1 \sim \mathcal{CN}(0, 1)$, $T = |z_1|^2 \sim \mathrm{Exp}(1)$, and $L = z_1(a + bT)$ at the three profile rows (`peak`: $(a, b) = (699/1250, 179/1250)$; `flank`: $(14/25, 1467/10000)$; `upper`: $(573/1000, 19/125)$), each satisfying $a > 3b > 0$. For a remote random variable $q$ independent of $z_1$ with energy $u = \mathbb{E}|q|^2$, recall
$$\Phi(z) = \varphi(|z|^2) = 2\mathbb{E}_{z_1}|L + z|, \qquad B(u) = \mathbb{E}_{W \sim \mathcal{CN}(0, 1)}\bigl[\varphi(u|W|^2)\bigr], \qquad D(q) = B(u) - \mathbb{E}[\Phi(q)],$$
$$\Psi_A(z) = \mathbb{E}_{z_1}\bigl[(T - 1)\operatorname{ph}(L + z)\bigr] = -z\,k_A(|z|^2), \qquad C(q) = \bigl\|\Pi_{1,0}\Psi_A(q)\bigr\|_2,$$
where $\Pi_{1,0}$ projects onto the holomorphic remote first chaos $H_{1,0}$.

Why was ledger row `6.3.17` ("Several self-interacting drivers") previously open while one-driver self-interactions (`6.3.5`, `6.3.13`–`6.3.16`) and non-self-interacting multi-driver blocks (`6.3.4`, `6.3.16a`) were proved? As recorded in `STATUS.md` §14 item 32 (`REC §4`), conditioning on one driver $X_j$ leaves the remaining self-interacting drivers $R_{-j} = \sum_{k \ne j} c_k X_k(|X_k|^2 - 2)$ inside the nonlinear radial kernel $k_A(|q_j + R_{-j}|^2)$, and $R_{-j}$ is neither conditionally Gaussian nor a bounded-moment cofactor independent of a single carrier.

This note resolves the pure multi-driver self-interaction problem globally on $(0, 463/10000]$ with constant **$9/100 = 0.09$** (strictly below the adverse joint $A+B$ constant $1/10 = 0.10$ of `7.4.2`, while also upgrading the unchecked `0.103` **R** bound of `6.3.10` on the single Wick monomial), extends it to **shared-bath multi-driver self-interactions** $q = \sum_{j=1}^m [c_j X_j(|X_j|^2 - 2) + X_j P_j(Y) + \bar X_j H_j(Y)]$ with arbitrary cofactor sharing across all $m$ drivers, and **sharpens the unitary and real character perturbation denominators** of `6.3.9c` and `6.3.9d` across all core constants.

What remains open: arbitrary $O(1)$ bath shares on $m \gg 1$ equal self-interacting drivers beyond the quadratic perturbation scale $e \lesssim \frac{\sum u_j^2}{u_0}$ of Theorem 3, comparable-energy even driver shells beyond Theorem 4's $D(p)/n$ neighbourhood, and the unrestricted intermediate-kurtosis content inequality `6.3.18`. No Lean file or published Grothendieck endpoint changes.

---

### Theorem 1 (1D Hankel–Bernstein identities and Pick/Bernstein tails on disjoint circular blocks)

Let $a > 3b > 0$, $A(t) = a + bt$, $J(t) = a + 3bt$, $H(t) = t A(t)^2$, and let $\mu_D, \mu_A$ be the finite positive Borel measures on $(0, \infty)$ representing the completely monotone functions $f_D(H(t)) = \frac{e^{-t}}{A(t)J(t)}$ and $f_A(H(t)) = \frac{e^{-t}}{A(t)^2}$ ([`CONTENT_KERNELS.md` §1](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md)). Define
$$\psi_L(\xi) := \int_0^\infty \lambda^{-1} e^{-\xi/\lambda}\,\mu_D(d\lambda), \qquad \tilde\chi_A(\xi) := \int_0^\infty \lambda^{-2} e^{-\xi/\lambda}\,\mu_A(d\lambda) \qquad (\xi \ge 0),$$
and $A_1(x) := \frac{J_1(2\sqrt{x})}{\sqrt{x}} = \sum_{k=0}^\infty \frac{(-x)^k}{k!(k+1)!}$ ($A_1(0) = 1$, $|A_1(x)| \le 1$).

1. **Positive completely monotone Bessel representations.** Both $\psi_L$ and $\tilde\chi_A$ are strictly positive, strictly decreasing, and convex (indeed completely monotone) on $[0, \infty)$, and satisfy the nonsingular $T$-integrals
   $$\psi_L(\xi) = \int_0^\infty e^{-T}\,J_0\bigl(2\sqrt{\xi H(T)}\bigr)\,dT, \qquad \tilde\chi_A(\xi) = \int_0^\infty T e^{-T} A(T) J(T)\,A_1\bigl(\xi H(T)\bigr)\,dT.$$
2. **Exact 1D deficit and noise-averaged content identities.** Let $q = \sum_{j=1}^m q_j$ be a sum of independent circular ($U(1)$-invariant) square-integrable remote blocks with $u_j = \mathbb{E}|q_j|^2$, $u = \sum_{j=1}^m u_j$, and radial characteristic functions $\psi_j(\xi) := \mathbb{E}\bigl[J_0(2\sqrt{\xi}|q_j|)\bigr] \in [-1, 1]$. Then
   $$D(q) = \frac{1}{2}\int_0^\infty \xi^{-3/2}\,\psi_L(\xi)\,\left[\prod_{j=1}^m \psi_j(\xi) - e^{-u\xi}\right] d\xi.$$
   Furthermore, for each block $j \in \{1, \dots, m\}$, let $R_{-j} = \sum_{k \ne j} q_k$ and $\psi_{R_{-j}}(\xi) = \prod_{k \ne j} \psi_k(\xi) \in [-1, 1]$. Then the noise-averaged A-profile $\Psi_{A, R_{-j}}(y) := \mathbb{E}_{R_{-j}}[\Psi_A(y + R_{-j})] = -y\,k_{A, R_{-j}}(|y|^2)$ satisfies
   $$k_{A, R_{-j}}(s) = \frac{1}{2}\int_0^\infty \xi^{1/2}\,\tilde\chi_A(\xi)\,\psi_{R_{-j}}(\xi)\,A_1(\xi s)\,d\xi \qquad (s \ge 0),$$
   and hence $|k_{A, R_{-j}}(0) - k_{A, R_{-j}}(s)| \le k_A(0) - k_A(s)$ for all $s \ge 0$ (because $1 - A_1(\xi s) \ge 0$ and $|\psi_{R_{-j}}(\xi)| \le 1$). In addition, for any linear form $\ell_j$ in block $j$ with $\mathbb{E}[\bar\ell_j q_j] = 0$,
   $$\bigl|\mathbb{E}[\bar\ell_j \Psi_A(q)]\bigr| = \bigl|\mathbb{E}_{q_j}[\bar\ell_j \Psi_{A, R_{-j}}(q_j)]\bigr| \le \frac{1}{2}\int_0^\infty \xi^{1/2}\,\tilde\chi_A(\xi)\,\Bigl|\mathbb{E}_{q_j}\bigl[\bar\ell_j q_j\,A_1(\xi|q_j|^2)\bigr]\Bigr|\,d\xi.$$
3. **Exact Pick/Bernstein high-frequency exponential bounds.** Since $a > 3b > 0$, $\sigma_0 := (a - b)^2 = -H(-1)$ lies strictly inside the analyticity disk $|s| < \frac{4a^3}{27b}$ of the principal inverse $h = H^{-1}$ ($h(0) = 0$), yielding $\int_0^\infty e^{\sigma_0\lambda}\,\mu_D(d\lambda) = \frac{e}{(a - b)(a - 3b)}$ and $\int_0^\infty e^{\sigma_0\lambda}\,\mu_A(d\lambda) = \frac{e}{(a - b)^2}$. With $\alpha := \frac{173}{100}(a - b) < \sqrt{3}(a - b)$, for every $\xi > 0$:
   $$\psi_L(\xi) \le \frac{4}{(a - b)(a - 3b)\,\xi}\,e^{-\alpha\sqrt{\xi}}, \qquad \tilde\chi_A(\xi) \le \frac{64}{e(a - b)^2\,\xi^2}\,e^{-\alpha\sqrt{\xi}}.$$

---

### Theorem 2 (Multi-driver diagonal self-interaction `6.3.17` and Wick monomial bound `6.3.10`)

Let $m \ge 1$, let $X_1, \dots, X_m$ be independent standard proper complex Gaussians, let $(c_1, \dots, c_m) \in \mathbb{C}^m \setminus \{0\}$, and set
$$q_0(X) = \sum_{j=1}^m c_j X_j(|X_j|^2 - 2), \qquad u_j = \mathbb{E}\bigl|c_j X_j(|X_j|^2 - 2)\bigr|^2 = 2|c_j|^2, \qquad u = \sum_{j=1}^m u_j \in \Bigl(0, \frac{463}{10000}\Bigr].$$
Then at all three rows (`peak`, `flank`, `upper`), in every dimension $m \ge 1$ and at every energy $u \in (0, 463/10000]$:
$$C(q_0)^2 < \frac{9}{100}\,D(q_0) < \frac{1}{10}\,D(q_0), \qquad D(q_0) \ge \kappa_D \sum_{j=1}^m u_j^2,$$
with certified constants (verified in 640-bit zero-float integer intervals in `verify.py`):

| row | certified upper bound on $\sup_{m, c} \frac{C(q_0)^2}{D(q_0)}$ | certified lower bound on $\inf_{m, c} \frac{D(q_0)}{\sum_j u_j^2}$ | ledger constant $\kappa_D$ |
|---|---|---|---|
| `peak` | $8949693 / 10^8 < \mathbf{0.0894970} < 9/100$ | $279612751 / 5\cdot 10^7 > \mathbf{5.592255}$ | $11/2 = 5.5$ |
| `flank` | $4468281 / 5\cdot 10^7 < \mathbf{0.0893657} < 9/100$ | $55653697 / 10^7 > \mathbf{5.565369}$ | $11/2 = 5.5$ |
| `upper` | $8638217 / 10^8 < \mathbf{0.0863822} < 9/100$ | $133996543 / 2.5\cdot 10^7 > \mathbf{5.359861}$ | $53/10 = 5.3$ |

At $m = 1$ and $u = 463/10000$ on the `peak` row, the single Wick monomial satisfies the certified two-sided enclosure
$$\frac{C(q_0)^2}{D(q_0)} \in \left[\frac{416663}{5000000},\;\frac{892467}{10000000}\right] = \bigl[0.0833326,\;0.0892467\bigr] \subset \Bigl(\frac{83}{1000},\;\frac{9}{100}\Bigr),$$
containing the floating-point value `0.087565304234` of `6.4.2` and replacing the unchecked `0.103` (**R**) bound of `6.3.10` across all three rows and all $u \in (0, 463/10000]$.

---

### Theorem 3 (Shared-bath multi-driver self-interactions `6.3.17`)

Let $X = (X_1, \dots, X_m)$ and $Y = (Y_1, \dots, Y_d)$ be independent standard proper complex Gaussian vectors ($m, d \ge 1$ arbitrary). Let $q_0(X) = \sum_{j=1}^m c_j X_j(|X_j|^2 - 2)$ have energy $u_0 = \sum_{j=1}^m u_j > 0$ ($u_j = 2|c_j|^2$), and let
$$h(X, Y) = \sum_{j=1}^m \bigl[X_j P_j(Y) + \bar X_j H_j(Y)\bigr], \qquad q(X, Y) = q_0(X) + h(X, Y),$$
where $P_j(Y), H_j(Y) \in L^2(Y)$ are arbitrary square-integrable variables with $\mathbb{E}_Y[P_j] = \mathbb{E}_Y[H_j] = 0$ and **arbitrary mutual dependence/sharing across $j = 1, \dots, m$** (in particular covering all $(1, 1)$ quadratics $P_j \in H_{1,1}(Y)$ and holomorphic quadratics $H_j \in H_{2,0}(Y)$ so $q \in H_{2,1}(X, Y)$). Put $e = \mathbb{E}|h|^2 = \sum_{j=1}^m (\|P_j\|_2^2 + \|H_j\|_2^2)$ and assume $u = \|q\|_2^2 = u_0 + e \le \frac{463}{10000}$.

1. **Exact first-chaos & first-variation cancellations and sharp $\frac{3\sqrt{\pi}}{4}$ moment bound.**
   We have $\Pi_{1,0}^Y \Psi_A(q) = 0$, $\mathbb{E}[\overline{q_0} h] = 0$, $\mathbb{E}[D\Phi(q_0)[h]] = 0$, $\mathbb{E}[\bar Z_\alpha D\Psi_A(q_0)[h]] = 0$ for every unit $Z_\alpha \in H_{1,0}(X)$, and $\mathbb{E}[|Z_\alpha|\,|h|^2] \le \frac{3\sqrt{\pi}}{4}\,e$ (with equality at $h = X_1 P_1(Y)$, $Z_\alpha = X_1$). Consequently, at every $(a, b)$ with $a > 3b > 0$:
   $$C(q) \le C(q_0) + \frac{e}{2a^2}, \qquad D(q) \ge D(q_0) - \bigl(\varphi'(0) - B'(u)\bigr)\,e \ge D(q_0) - 2\bigl(-\varphi''(0)\bigr)\,u\,e.$$
   Hence $C(q)^2 \le K\,D(q)$ holds whenever $\bigl(C(q_0) + \frac{e}{2a^2}\bigr)^2 + 2K\bigl(-\varphi''(0)\bigr)\,u\,e \le K\,D(q_0)$.
2. **Explicit dimension-free rational regimes.** At all three rows (`peak`, `flank`, `upper`), for all $m, d \ge 1$ and all $0 < u = u_0 + e \le \frac{463}{10000}$:
   - $e \le \frac{1}{5}\,\frac{\sum_{j=1}^m u_j^2}{u_0} \implies C(q)^2 \le \frac{6}{25}\,D(q) = 0.24\,D(q)$;
   - $e \le \frac{1}{6}\,\frac{\sum_{j=1}^m u_j^2}{u_0} \implies C(q)^2 \le \frac{11}{50}\,D(q) = 0.22\,D(q)$;
   - $e \le \frac{1}{10}\,\frac{\sum_{j=1}^m u_j^2}{u_0} \implies C(q)^2 \le \frac{3}{20}\,D(q) = 0.15\,D(q)$.

---

### Theorem 4 (Sharpened unitary and real character perturbation denominators `6.3.9c`–`6.3.9d`)

In the setting of [`6.3.9c`](../mixed-driver-sign-perturbation-codex-a7c4/PROOF.md) — $p, h \in H_{2,1}$, $p(gz) = \chi(g)p(z)$ for a continuous modulus-one character $\chi$ of a compact unitary group $\mathcal{G}$, $\int_{\mathcal{G}} \overline{\chi(g)} h(gz)\,dg = 0$, $D_0 = D(p) > 0$, $C(p)^2 \le \kappa D_0$, and $\|p + h\|_2^2 \le \frac{463}{10000}$ — and likewise in the real orthogonal sign-character transfer of [`6.3.9d`](../real-trilinear-neighbourhood-codex-a7c4/REAL_CHARACTERS.md):

1. Replacing the Jensen lower bound on $B'(u)$ by the exact concavity bound $\varphi'(0) - B'(u) = \int_0^u (-B''(v))\,dv \le 2(-\varphi''(0))\,u \le 2(-\varphi''(0))\,u_{\max}$ ($< 0.15489$ on `peak`, $< 0.15496$ on `flank`, $< 0.14504$ on `upper`, vs $0.443$ in `6.3.9c`) and bounding $D_0 = B(u_0) - \mathbb{E}[\Phi(p)] \le B(u_0) - B(0) \le \varphi'(0) u_{\max}$ gives the adaptive criterion
   $$\|h\|_2^2\,\left[L^2 + \frac{5}{4a^2}\min\!\left(\sqrt{\kappa\,\varphi'(0)\,u_{\max}},\,\frac{M_0^A\sqrt{u_{\max}}}{2}\right) + 2K\bigl(-\varphi''(0)\bigr) u_{\max}\right] \le (K - \kappa)\,D_0 \implies C(p + h)^2 \le K\,D(p + h),$$
   where $L = \frac{1 + 2e^{-3/2}}{2} M_0^A$.
2. Consequently, $\|h\|_2^2 \le D_0 / n$ implies $C(p + h)^2 \le K\,D(p + h)$ for the sharp minimal integers $n$ below (with $n - 1$ failing the budget inequality in every cell):

| row | $K = 6/25$, $\kappa = 9/100$ | $K = 6/25$, $\kappa = 1/10$ | $K = 6/25$, $\kappa = 11/50$ | $K = 6/25$, $\kappa = 9/40$ | $K = 6/25$, $\kappa = 47/200$ | $K = 11/50$, $\kappa = 9/100$ | $K = 11/50$, $\kappa = 1/10$ |
|---|---:|---:|---:|---:|---:|---:|---:|
| `peak` | **5** | **6** | **39** (was 42) | **51** (was 56) | **153** (was 167) | **6** | **7** |
| `flank` | **5** | **6** | **38** (was 42) | **51** (was 56) | **152** (was 167) | **6** | **7** |
| `upper` | **5** | **5** | **36** (was 40) | **48** (was 54) | **144** (was 160) | **6** | **6** |

In particular, applying the negation involution $X \mapsto -X$ to the multi-driver self-interaction core $p = q_0(X)$ of Theorem 2 ($\kappa = 9/100$) allows **any even-in-$X$ cubic perturbation** $h_{\mathrm{even}} \in H_{2,1}(X, Y)$ — simultaneously combining $(|X_j|^2 - 1)V_j(Y)$, $X_j \bar X_k V_{jk}(Y)$ ($j \ne k$), $X_j X_k \overline{W_{jk}(Y)}$, and pure-bath cubics $R_0(Y)$ — of energy up to $\|h_{\mathrm{even}}\|_2^2 \le D(q_0)/5$ (at $K = 6/25$, i.e. $\|h_{\mathrm{even}}\|_2^2 \le \frac{11}{10}\sum_{j=1}^m u_j^2$ on `peak`/`flank` and $\frac{53}{50}\sum_{j=1}^m u_j^2$ on `upper`) or $\|h_{\mathrm{even}}\|_2^2 \le D(q_0)/6$ (at $K = 11/50$).

---

### Corollary 5 (All-amplitude raw A-shell and joint $A + B$ consequences via `6.2.1`–`6.2.3` and `7.4.17`)

For every cubic $q \in H_{2,1}$ covered by Theorems 2, 3, or 4 with $0 < u = \|q\|_2^2 \le \frac{463}{10000}$:
1. **Raw A-shell (`6.2.1`–`6.2.3`, upgraded to all amplitudes by `7.4.17`):** Whenever $C(q)^2 \le \frac{6}{25} D(q)$, $\Lambda(q + (T - 1)U) \le B(u) - \frac{u}{\varepsilon}$ holds at all three rows for every remote first-chaos linear form $U \in H_{1,0}$ at **every** amplitude $\|U\|_2 < \infty$ (since $\kappa_{\mathrm{diag}} = \frac{7}{25}, \frac{3}{10}, \frac{31}{100} > \frac{6}{25}$ in [`7.4.17`](../raw-joint-ab-gemini-4c4c/PROOF.md), and already for $\|U\|_2^2 \le 0.0113$ by `6.2.1`), hence $\Lambda(q + (T - 1)U) \le S$ at the `peak` row.
2. **Global joint $A + B$ shells (`7.4.2`, `7.4.17`):** At the `peak` row, for arbitrary jointly distributed first-chaos drivers $r_A, r_B \in H_{1,0}$ with no variance caps ($h = (T - 1)r_A + z_1^2 \bar r_B / \sqrt{2}$):
   - Under signed **Target S** ($C(q)^2 \le \frac{6}{25} D(q)$): $\Lambda(q + h) < S + 2.74\cdot 10^{-6}$;
   - Under diagonal **Target D** ($C(q)^2 \le \frac{11}{50} D(q)$): $\Lambda(q + h) < S + 3.18\cdot 10^{-5}$ (and $< S + 2.88\cdot 10^{-6}$ whenever $C(q)^2 \le \frac{3}{20} D(q)$, including every pure multi-driver $q_0$ of Theorem 2 since $\frac{9}{100} < \frac{3}{20}$).

---

## 2. Proof of Theorem 1 (Hankel–Bernstein representations and Pick/Bernstein tails)

### 2.1 Positive Bessel integrals for $\psi_L(\xi)$ and $\tilde\chi_A(\xi)$

By [`CONTENT_KERNELS.md` §1–§2](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md), $f_D(s) = \int_0^\infty e^{-\lambda s}\,\mu_D(d\lambda)$ and $f_A(s) = \int_0^\infty e^{-\lambda s}\,\mu_A(d\lambda)$ with finite positive Borel measures $\mu_D, \mu_A$ on $(0, \infty)$ satisfying $\int_0^\infty \lambda^{-1}\mu_D(d\lambda) = 1$. To verify $\int_0^\infty \lambda^{-2}\mu_A(d\lambda) < \infty$ and obtain the Bessel representations simultaneously, expand $J_0(2\sqrt{\xi s}) = \sum_{k=0}^\infty \frac{(-\xi s)^k}{(k!)^2}$ and $A_1(\xi s) = \sum_{k=0}^\infty \frac{(-\xi s)^k}{k!(k+1)!}$ for $\lambda > 0$ and $\xi \ge 0$. Termwise Laplace integration on $(0, \infty)$ (justified by $\int_0^\infty s^k e^{-\lambda s}\,ds = k!\,\lambda^{-k-1}$ and dominated convergence via $\sum_{k=0}^\infty \frac{(\xi/\lambda)^k}{k!} = e^{\xi/\lambda} < \infty$) gives the exact identities
$$\lambda^{-1} e^{-\xi/\lambda} = \int_0^\infty e^{-\lambda s}\,J_0(2\sqrt{\xi s})\,ds, \qquad \lambda^{-2} e^{-\xi/\lambda} = \int_0^\infty s\,e^{-\lambda s}\,A_1(\xi s)\,ds \qquad (\lambda > 0,\; \xi \ge 0).$$
At $\xi = 0$ ($J_0(0) = A_1(0) = 1$), Tonelli with $\mu_D \ge 0$ and $\mu_A \ge 0$ gives
$$\int_0^\infty \lambda^{-2}\,\mu_A(d\lambda) = \int_0^\infty s\,f_A(s)\,ds \stackrel{s = H(T)}{=} \int_0^\infty T A(T)^2 \cdot \frac{e^{-T}}{A(T)^2}\cdot A(T)J(T)\,dT = \int_0^\infty T e^{-T} A(T)J(T)\,dT < \infty.$$
Since $|J_0(2\sqrt{\xi s})| \le 1$ and $|A_1(\xi s)| \le 1$, Fubini applies for every $\xi \ge 0$:
$$\psi_L(\xi) = \int_0^\infty f_D(s)\,J_0(2\sqrt{\xi s})\,ds = \int_0^\infty e^{-T}\,J_0\bigl(2\sqrt{\xi H(T)}\bigr)\,dT,$$
$$\tilde\chi_A(\xi) = \int_0^\infty s\,f_A(s)\,A_1(\xi s)\,ds = \int_0^\infty T e^{-T} A(T)J(T)\,A_1\bigl(\xi H(T)\bigr)\,dT.$$
Writing $u = 1/\lambda > 0$, $\psi_L(\xi) = \int_0^\infty u\,e^{-u\xi}\,\widetilde\nu_D(du)$ and $\tilde\chi_A(\xi) = \int_0^\infty u^2 e^{-u\xi}\,\widetilde\nu_A(du)$ are Laplace transforms of non-zero finite positive measures on $(0, \infty)$, so both are strictly positive, strictly decreasing, and strictly convex (completely monotone) on $[0, \infty)$.

### 2.2 Proof of the 1D deficit and noise-averaged content identities

1. **Deficit identity.** For every $Z \in \mathbb{C}$, substituting $\xi = \frac{x^2}{4|Z|^2}$ ($d\xi = \frac{x}{2|Z|^2}\,dx$, $\frac{1}{2}\xi^{-3/2}\,d\xi = 2|Z|\,x^{-2}\,dx$) and integrating by parts gives
   $$\frac{1}{2}\int_0^\infty \xi^{-3/2}\bigl(1 - J_0(2\sqrt{\xi}|Z|)\bigr)\,d\xi = 2|Z|\int_0^\infty \frac{1 - J_0(x)}{x^2}\,dx = 2|Z|\int_0^\infty \frac{J_1(x)}{x}\,dx = 2|Z|,$$
   since $J_0(x) = \frac{2}{\pi}\int_0^{\pi/2}\cos(x\sin\theta)\,d\theta$ and $\int_0^\infty \frac{1 - \cos(u)}{u^2}\,du = \frac{\pi}{2}$. Moreover, $0 \le 1 - J_0(2\sqrt{\xi}|Z|) \le \min(2, 2\xi|Z|^2)$, so for any square-integrable $Z$, Tonelli justifies exchanging $\mathbb{E}$ and $\int_0^\infty d\xi$.

   For any $\omega \in \mathbb{C}$ with $|\omega|^2 = \xi$, uniform phase averaging gives $\mathbb{E}_{\varphi \sim \mathrm{Unif}[0, 2\pi)}\bigl[e^{2i\operatorname{Re}(e^{-i\varphi}\bar\omega Z)}\bigr] = J_0(2\sqrt{\xi}|Z|)$. Since $L$ and $q_1, \dots, q_m$ are mutually independent and each is $U(1)$-invariant ($e^{i\varphi} L \stackrel{d}{=} L$, $e^{i\varphi} q_j \stackrel{d}{=} q_j$), for every $\omega$ with $|\omega|^2 = \xi$:
   $$\mathbb{E}\bigl[J_0(2\sqrt{\xi}|L + q|)\bigr] = \mathbb{E}\bigl[e^{2i\operatorname{Re}(\bar\omega(L + q))}\bigr] = \mathbb{E}\bigl[e^{2i\operatorname{Re}(\bar\omega L)}\bigr]\prod_{j=1}^m \mathbb{E}\bigl[e^{2i\operatorname{Re}(\bar\omega q_j)}\bigr] = \psi_L(\xi)\prod_{j=1}^m \psi_j(\xi),$$
   where $\mathbb{E}[e^{2i\operatorname{Re}(\bar\omega L)}] = \mathbb{E}_{V, W}[e^{2i\operatorname{Re}(\bar\omega\sqrt{V} W)}] = \mathbb{E}_V[e^{-V|\omega|^2}] = \psi_L(\xi)$ by `CONTENT_KERNELS.md` eq. (3). Likewise $\mathbb{E}[J_0(2\sqrt{\xi}|L + \sqrt{u}\,W|)] = \psi_L(\xi) e^{-u\xi}$. Subtracting $2\mathbb{E}|L + q|$ from $B(u) = 2\mathbb{E}|L + \sqrt{u}\,W|$ yields the stated integral for $D(q)$ (integrable at $0$ since $1 - \psi_j(\xi) = u_j\xi + O(\xi^2)$ cancels $1 - e^{-u\xi} = u\xi + O(\xi^2)$ to order $O(\xi^2)$, making $\xi^{-3/2}[\prod \psi_j - e^{-u\xi}] = O(\xi^{1/2})$ as $\xi \downarrow 0$).

2. **Noise-averaged A-kernel identity.** By [`CONTENT_KERNELS.md` eq. (144)](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md), $P_A(|z|^2) = \mathbb{E}_{z_1}[(T - 1)|L + z|] = \frac{\sqrt{\pi}}{4}\int_0^\infty \lambda^{-3/2}\,\mathbb{E}_\theta[e^{-\lambda|z|^2\cos^2\theta}]\,\mu_A(d\lambda)$ with $\Psi_A(z) = \nabla_{\mathbb{R}^2} P_A(|z|^2)$. Introducing $G \sim \mathcal{N}(0, 1)$ independent of $\theta \sim \mathrm{Unif}[0, 2\pi)$ gives
   $$\mathbb{E}_\theta\bigl[e^{-\lambda|z|^2\cos^2\theta}\bigr] = \mathbb{E}_{G, \theta}\Bigl[e^{i\sqrt{2\lambda}\,G\,|z|\cos\theta}\Bigr] = \mathbb{E}_G\Bigl[J_0\bigl(\sqrt{2\lambda}\,|G|\,|z|\bigr)\Bigr] = \frac{\lambda^{-1/2}}{\sqrt{\pi}}\int_0^\infty \xi^{-1/2} e^{-\xi/\lambda}\,J_0(2\sqrt{\xi}|z|)\,d\xi,$$
   under $\xi = \frac{\lambda}{2}G^2$ ($|G|$ has density $\sqrt{2/\pi}\,e^{-g^2/2}$ on $(0, \infty)$). Since $|J_0| \le 1$ and $\int_0^\infty \xi^{-1/2}\tilde\chi_A(\xi)\,d\xi = \sqrt{\pi}\int_0^\infty \lambda^{-3/2}\mu_A(d\lambda) < \infty$, Fubini gives
   $$P_A(|z|^2) = \frac{1}{4}\int_0^\infty \xi^{-1/2}\,\tilde\chi_A(\xi)\,J_0(2\sqrt{\xi}|z|)\,d\xi.$$
   Setting $z = y + R_{-j}$ and averaging over the independent circular variable $R_{-j}$ factors $J_0(2\sqrt{\xi}|y + R_{-j}|)$ into $\psi_{R_{-j}}(\xi)\,J_0(2\sqrt{\xi}|y|)$. Differentiating in $y \in \mathbb{R}^2$ under the integral sign (dominated by $\frac{1}{2}\xi^{1/2}\tilde\chi_A(\xi)|y|$, since $\nabla_y J_0(2\sqrt{\xi}|y|) = -2\xi\,y\,A_1(\xi|y|^2)$ and $|A_1| \le 1$, with $\int_0^\infty \xi^{1/2}\tilde\chi_A(\xi)\,d\xi = \frac{\sqrt{\pi}}{2}\int_0^\infty \lambda^{-1/2}\mu_A(d\lambda) < \infty$) yields
   $$\Psi_{A, R_{-j}}(y) = -y\cdot \frac{1}{2}\int_0^\infty \xi^{1/2}\,\tilde\chi_A(\xi)\,\psi_{R_{-j}}(\xi)\,A_1(\xi|y|^2)\,d\xi.$$
   Since $A_1(x) = \frac{2}{\pi}\int_0^\pi \sin^2\theta\cos(2\sqrt{x}\cos\theta)\,d\theta \le \frac{2}{\pi}\int_0^\pi \sin^2\theta\,d\theta = 1$, we have $1 - A_1(\xi s) \ge 0$ for all $\xi, s \ge 0$; with $\tilde\chi_A(\xi) > 0$ and $|\psi_{R_{-j}}(\xi)| \le 1$, this gives $|k_{A, R_{-j}}(0) - k_{A, R_{-j}}(s)| \le k_A(0) - k_A(s)$. Finally, if $\mathbb{E}[\bar\ell_j q_j] = 0$, Fubini (dominated by $\frac{1}{2}|\ell_j|\,|q_j|\int_0^\infty \xi^{1/2}\tilde\chi_A(\xi)\,d\xi \in L^1$) and $|\psi_{R_{-j}}(\xi)| \le 1$ give item 2's projection inequality.

### 2.3 Covering-space proof of the Pick/Bernstein disk and exponential high-frequency bounds

Consider the cubic polynomial $H(z) = z(a + bz)^2$ on $\mathbb{C}$. Its derivative $H'(z) = (a + bz)(a + 3bz)$ vanishes only at $z_1 = -\frac{a}{3b}$ and $z_2 = -\frac{a}{b}$, with critical values $H(z_1) = -\frac{4a^3}{27b}$ and $H(z_2) = 0$. Hence $H: \mathbb{C} \to \mathbb{C}$ is a degree-3 proper branched covering whose critical values in $\mathbb{C}$ are $\{0, -\frac{4a^3}{27b}\}$, so $H$ restricts to an unbranched covering over the punctured open disk $D_0^* := D\bigl(0, \frac{4a^3}{27b}\bigr) \setminus \{0\}$. Because $H'(0) = a^2 > 0$, the local inverse branch $h$ with $h(0) = 0$ is already holomorphic and single-valued on $D(0, \delta)$ for small $\delta > 0$; having trivial monodromy around $0$, it continues analytically along radial rays to a single-valued holomorphic function $h: D\bigl(0, \frac{4a^3}{27b}\bigr) \to \mathbb{C}$ satisfying $H(h(s)) = s$. Neither $a + b h(s)$ nor $a + 3b h(s)$ can vanish on $D\bigl(0, \frac{4a^3}{27b}\bigr)$: if $h(s) = -a/b$, then $s = H(-a/b) = 0$, contradicting $h(0) = 0 \ne -a/b$; if $h(s) = -a/(3b)$, then $s = H(-a/(3b)) = -\frac{4a^3}{27b} \notin D\bigl(0, \frac{4a^3}{27b}\bigr)$.

Therefore $f_D(s) = \frac{e^{-h(s)}}{(a + bh(s))(a + 3bh(s))}$ and $f_A(s) = \frac{e^{-h(s)}}{(a + bh(s))^2}$ are holomorphic on $|s| < \frac{4a^3}{27b}$. Since $a > 3b > 0$, $-1 \in \bigl(-\frac{a}{3b}, 0\bigr)$, where $H$ is strictly increasing on the real axis, so $\sigma_0 := (a - b)^2 = -H(-1) \in \bigl(0, \frac{4a^3}{27b}\bigr)$ and $h(-\sigma_0) = -1$. By [`CONTENT_KERNELS.md` eq. (2)](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md), $(-1)^n f_i^{(n)}(0) = \int_0^\infty \lambda^n \mu_i(d\lambda) \ge 0$; summing the convergent Maclaurin series at $s = -\sigma_0$ by Tonelli gives
$$\int_0^\infty e^{\sigma_0\lambda}\,\mu_D(d\lambda) = f_D(-\sigma_0) = \frac{e}{(a - b)(a - 3b)}, \qquad \int_0^\infty e^{\sigma_0\lambda}\,\mu_A(d\lambda) = f_A(-\sigma_0) = \frac{e}{(a - b)^2}.$$
Now split $\frac{\xi}{\lambda} = \frac{\xi}{4\lambda} + \frac{3\xi}{4\lambda}$ for $\xi, \lambda > 0$. From $x e^{-x} \le e^{-1}$ and $x^2 e^{-x} \le 4e^{-2}$ at $x = \frac{\xi}{4\lambda}$, we get $\lambda^{-1} e^{-\xi/(4\lambda)} \le \frac{4}{e\xi}$ and $\lambda^{-2} e^{-\xi/(4\lambda)} \le \frac{64}{e^2\xi^2}$. By AM-GM and $(173/100)^2 = 29929/10000 < 3$,
$$\frac{3\xi}{4\lambda} + \sigma_0\lambda \ge 2\sqrt{\frac{3}{4}\sigma_0\xi} = \sqrt{3}(a - b)\sqrt{\xi} > \frac{173}{100}(a - b)\sqrt{\xi} = \alpha\sqrt{\xi},$$
so $e^{-3\xi/(4\lambda)} \le e^{-\alpha\sqrt{\xi}} e^{\sigma_0\lambda}$. Integrating against $\mu_D$ and $\mu_A$ cancels $e^1$ and proves Theorem 1(3). $\square$

---

## 3. Proof of Theorem 2 (Multi-driver diagonal self-interaction)

### 3.1 Reduction to 1D per-block scalar inequalities

Let $q_j = c_j X_j(|X_j|^2 - 2)$ ($u_j = 2|c_j|^2$, $\sum_{j=1}^m u_j = u \le u_{\max} = \frac{463}{10000}$). Because $X_1, \dots, X_m$ are independent and circular, $q_1, \dots, q_m$ are independent circular blocks, and under $X_k \mapsto e^{i\phi_k} X_k$ only block $j$ transforms with charge $1$ in $X_j$, so $\Pi_{1,0} \Psi_A(q_0) = \bigoplus_{j=1}^m \Pi_{1,0}^{(j)} \Psi_A(q_0)$ orthogonally:
$$C(q_0)^2 = \sum_{j=1}^m \bigl\|\Pi_{1,0}^{(j)} \Psi_A(q_0)\bigr\|_2^2 = \sum_{j=1}^m \bigl|\mathbb{E}[\bar X_j \Psi_A(q_0)]\bigr|^2.$$
Write $R_j = |X_j|^2 \sim \mathrm{Exp}(1)$ and $W(R) := \frac{1}{2} R(R - 2)^2$, so $|q_j|^2 = |c_j|^2 R_j(R_j - 2)^2 = u_j W(R_j)$. Then $\psi_j(\xi) = \psi_{\mathrm{Wick}}(u_j\xi)$, where
$$\psi_{\mathrm{Wick}}(\zeta) := \int_0^\infty e^{-R}\,J_0\bigl(2\sqrt{\zeta W(R)}\bigr)\,dR, \qquad \Delta_{\mathrm{Wick}}(\zeta) := \psi_{\mathrm{Wick}}(\zeta) - e^{-\zeta}.$$
Likewise, in Theorem 1(2) with $\ell_j = X_j$ ($\mathbb{E}[\bar X_j q_j] = c_j\mathbb{E}[R_j(R_j - 2)] = 0$), $\mathbb{E}_{q_j}[\bar X_j q_j A_1(\xi|q_j|^2)] = c_j M_{\mathrm{Wick}}(u_j\xi)$ with $|c_j| = \sqrt{u_j / 2}$ and
$$M_{\mathrm{Wick}}(\zeta) := \int_0^\infty R(R - 2) e^{-R}\,A_1\bigl(\zeta W(R)\bigr)\,dR.$$
Setting $\xi = \tau^2$ ($d\xi = 2\tau\,d\tau$, $\frac{1}{2}\xi^{1/2}\,d\xi = \tau^2\,d\tau$), Theorem 1(2) gives, for every $j \in \{1, \dots, m\}$,
$$\bigl|\mathbb{E}[\bar X_j \Psi_A(q_0)]\bigr|^2 \le \widetilde C_2(u_j) := \frac{u_j}{2}\left(\int_0^\infty \tau^2\,\tilde\chi_A(\tau^2)\,\bigl|M_{\mathrm{Wick}}(u_j\tau^2)\bigr|\,d\tau\right)^2.$$

Now examine $D(q_0)$ using Theorem 1(2):
1. **Strict positivity $\Delta_{\mathrm{Wick}}(\zeta) > 0$ on $(0, 4]$.** Section 3.2 below certifies in 640-bit interval arithmetic that $\psi_{\mathrm{Wick}}(\zeta) > e^{-\zeta} > 0$ for every $\zeta \in (0, 4]$ (whereas $\Delta_{\mathrm{Wick}}(49/10) < 0$, Control 3).
2. **Low- and medium-frequency telescoping on $\xi \in (0, 4/u_{\max}]$.** For every $\xi \in (0, 4/u_{\max}] = (0, 40000/463]$ (which contains $[0, \tau_D^2]$ for $\tau_D = 17/2 = 8.5$, since $8.5^2 = 72.25 < 86.393$), every block satisfies $u_j\xi \le u_{\max}\xi \le 4$, so $B_j := e^{-u_j\xi} > 0$ and $\Delta_j := \Delta_{\mathrm{Wick}}(u_j\xi) \ge 0$. Expanding $\prod_{j=1}^m (B_j + \Delta_j) - \prod_{j=1}^m B_j$ and dropping all products of two or more $\Delta$'s (all non-negative) gives
   $$\prod_{j=1}^m \psi_j(\xi) - e^{-u\xi} \ge \sum_{j=1}^m \Delta_j \prod_{k \ne j} B_k = \sum_{j=1}^m e^{-(u - u_j)\xi}\,\Delta_{\mathrm{Wick}}(u_j\xi) \ge \sum_{j=1}^m e^{-(u_{\max} - u_j)\xi}\,\Delta_{\mathrm{Wick}}(u_j\xi).$$
   In particular, the integrand on $[\tau_D^2, 4/u_{\max}]$ is non-negative and can be dropped for a lower bound.
3. **High-frequency tail on $\xi > 4/u_{\max}$.** Fix any $\xi > 4/u_{\max}$ ($\sqrt{\xi} > \tau_* := \frac{929}{100}$, since $(929/100)^2 = 86.3041 < 40000/463$). Either $u_j\xi \le 4$ for all $j$ — in which case $\prod_{j=1}^m \psi_j(\xi) - e^{-u\xi} \ge 0$ — or there exists at least one index $j_*$ with $u_{j_*}\xi > 4$. In the latter case, $\sum_{j=1}^m u_j^2 \ge u_{j_*}^2 > \frac{16}{\xi^2}$ and $u\xi \ge u_{j_*}\xi > 4$, while $|\prod_j \psi_j(\xi)| \le 1$, so
   $$\prod_{j=1}^m \psi_j(\xi) - e^{-u\xi} \ge -\bigl(1 + e^{-4}\bigr) > -\frac{51}{50} \ge -\frac{51}{800}\,\xi^2\sum_{j=1}^m u_j^2.$$
   Integrating against $\frac{1}{2}\xi^{-3/2}\psi_L(\xi)\,d\xi$ on $[\tau_*^2, \infty)$ with Theorem 1(3) ($\xi = \tau^2$, $\frac{1}{2}\tau^{-3}\cdot \frac{4}{(a-b)(a-3b)\tau^2} e^{-\alpha\tau} \cdot \tau^4 \cdot 2\tau\,d\tau = \frac{4}{(a-b)(a-3b)} e^{-\alpha\tau}\,d\tau$) gives
   $$\frac{1}{2}\int_{\tau_*^2}^\infty \xi^{-3/2}\psi_L(\xi)\left(\prod_{j=1}^m \psi_j(\xi) - e^{-u\xi}\right) d\xi \ge -C_{\mathrm{tail}}^D\sum_{j=1}^m u_j^2, \qquad C_{\mathrm{tail}}^D := \frac{51\,e^{-\alpha\tau_*}}{200(a - b)(a - 3b)\alpha}.$$

Combining (2) and (3) decomposes $D(q_0)$ superadditively across the $m$ blocks:
$$D(q_0) \ge \sum_{j=1}^m \widetilde D(u_j), \qquad \widetilde D(v) := \int_0^{\tau_D} \tau^{-2}\,\psi_L(\tau^2)\,e^{-(u_{\max} - v)\tau^2}\,\Delta_{\mathrm{Wick}}(v\tau^2)\,d\tau - C_{\mathrm{tail}}^D\,v^2.$$
Therefore, certifying $\widetilde D(v) \ge \kappa_D v^2$ and $\widetilde C_2(v) \le \kappa_0 \widetilde D(v)$ for **every single scalar** $v \in (0, u_{\max}]$ implies $D(q_0) \ge \kappa_D \sum_{j=1}^m u_j^2$ and $C(q_0)^2 \le \sum_{j=1}^m \widetilde C_2(u_j) \le \kappa_0 \sum_{j=1}^m \widetilde D(u_j) \le \kappa_0 D(q_0)$ simultaneously for **every** $m \ge 1$ and **every** $(c_1, \dots, c_m) \in \mathbb{C}^m \setminus \{0\}$.

### 3.2 Exact moment bounds, Bessel derivative envelopes, and panel quadratures

Every analytic bound invoked by `verify.py` has a closed-form elementary proof:

1. **Global bounds on $M_{\mathrm{Wick}}(\zeta)$.** Since $(R^2 e^{-R})' = R(2 - R)e^{-R}$ and $\int_0^\infty R(R - 2)e^{-R}\,dR = 0$, we have $\int_0^\infty R|R - 2|e^{-R}\,dR = 2\int_0^2 R(2 - R)e^{-R}\,dR = 8e^{-2} < \frac{11}{10}$. Thus $|M_{\mathrm{Wick}}(\zeta)| \le \frac{11}{10}$ for all $\zeta \ge 0$. Moreover, $0 \le 1 - A_1(x) = \frac{2}{\pi}\int_0^\pi \sin^2\theta(1 - \cos(2\sqrt{x}\cos\theta))\,d\theta \le \frac{2}{\pi}\int_0^\pi \sin^2\theta\cdot 2x\cos^2\theta\,d\theta = \frac{x}{2}$, and $\mathbb{E}[R^2|R - 2|^3] = \mathbb{E}[R^2(R - 2)^3] + 2\int_0^2 R^2(2 - R)^3 e^{-R}\,dR = 32 + 2(-32 + 248e^{-2}) = 496e^{-2} - 32$, giving
   $$\bigl|M_{\mathrm{Wick}}(\zeta)\bigr| = \left|\int_0^\infty R(R - 2)e^{-R}\bigl(1 - A_1(\zeta W(R))\bigr)\,dR\right| \le \frac{\zeta}{4}\mathbb{E}\bigl[R^2|R - 2|^3\bigr] = \bigl(124e^{-2} - 8\bigr)\,\zeta < \frac{44}{5}\,\zeta \qquad (\zeta \ge 0).$$
   Integrating $\tau^2\tilde\chi_A(\tau^2)|M_{\mathrm{Wick}}(v\tau^2)|$ on $[\tau_C, \infty)$ ($\tau_C = 23/2 = 11.5$) with Theorem 1(3) bounds the high-frequency $C$-tail by $\min\bigl(C_{\mathrm{lin}}^C\,v,\, C_{\mathrm{cst}}^C\bigr)$, where $C_{\mathrm{lin}}^C = \frac{44\cdot 64}{5 e(a - b)^2\alpha} e^{-\alpha\tau_C}$ and $C_{\mathrm{cst}}^C = \frac{11\cdot 64}{10 e(a - b)^2 \tau_C^2 \alpha} e^{-\alpha\tau_C}$.
2. **Small-$\zeta$ polynomial bounds on $\Delta_{\mathrm{Wick}}(\zeta)$.**
   - *Pointwise non-negativity $J_0(2\sqrt{y}) - (1 - y) \ge 0$ and clamped cubic lower bound:* For $0 \le y \le 2$, grouping consecutive pairs in the alternating series $J_0(2\sqrt{y}) - (1 - y) = \sum_{m=1}^\infty \frac{y^{2m}}{((2m)!)^2}\bigl(1 - \frac{y}{(2m + 1)^2}\bigr)$ gives $\ge 0$ since $y \le 2 < 9 \le (2m + 1)^2$; for $y \ge 2$, $1 - y \le -1 \le J_0(2\sqrt{y})$ (`DLMF 10.9.1`). Hence $J_0(2\sqrt{y}) - (1 - y) \ge 0$ for **every** $y \ge 0$. Moreover, $J_0(2\sqrt{y}) - (1 - y) \ge \frac{y^2}{4} - \frac{y^3}{36}$ for all $y \ge 0$ (by alternating-series truncation for $0 \le y \le 16$, since $y/25 < 1$, and by $1 - y + \frac{y^2}{4} - \frac{y^3}{36} = 1 - y - \frac{y^2(y - 9)}{36} < -1 \le J_0(2\sqrt{y})$ for $y \ge 16$). Dropping $[S_0, \infty)$ ($S_0 = 14$) from the non-negative integrand $e^{-R}\bigl[J_0(2\sqrt{\zeta W(R)}) - (1 - \zeta W(R))\bigr]$ with $\mathbb{E}[W(R)] = 1$ and subtracting $e^{-\zeta} - (1 - \zeta) \le \frac{\zeta^2}{2}$ gives, with zero constant remainder:
     $$\Delta_{\mathrm{Wick}}(\zeta) \ge \left(\frac{1}{16}\int_0^{S_0} R^2(R - 2)^4 e^{-R}\,dR - \frac{1}{2}\right)\zeta^2 - \left(\frac{1}{288}\int_0^{S_0} R^3(R - 2)^6 e^{-R}\,dR\right)\zeta^3 \qquad (\zeta \ge 0).$$
   - *Upper bound:* Symmetrically, for $0 \le y \le 4$, $J_0(2\sqrt{y}) \le 1 - y + \frac{y^2}{4}$ by alternating series ($y/16 \le 1/4 < 1$), while for $y \ge 4$, $1 - y + \frac{y^2}{4} = \bigl(\frac{y}{2} - 1\bigr)^2 \ge 1 \ge J_0(2\sqrt{y})$. Combining $J_0(2\sqrt{y}) \le 1 - y + \frac{y^2}{4}$ on $[0, \infty)$ ($\frac{1}{4}\mathbb{E}[W(R)^2] = \frac{1}{16}\mathbb{E}[R^2(R - 2)^4] = \frac{176}{16} = 11$) with $e^{-\zeta} \ge 1 - \zeta + \frac{\zeta^2}{2} - \frac{\zeta^3}{6}$ yields $\Delta_{\mathrm{Wick}}(\zeta) \le \frac{21}{2}\zeta^2 + \frac{1}{6}\zeta^3$ for all $\zeta \ge 0$.
3. **Second-derivative envelopes for `Jet1` Taylor interpolation.**
   Writing $f_0(x) = J_0(2\sqrt{x})$, Poisson's integral $f_0^{(m)}(x) = (-1)^m \frac{J_m(2\sqrt{x})}{x^{m/2}} = \frac{(-1)^m}{\sqrt{\pi}\Gamma(m + 1/2)}\int_0^\pi \cos(2\sqrt{x}\cos\theta)\sin^{2m}\theta\,d\theta$ and Bessel's integral $|J_n(z)| \le 1$ give $|f_0''(x)| = \frac{|J_2(2\sqrt{x})|}{x} \le \min\bigl(\frac{1}{2}, \frac{1}{x}\bigr)$ and (using $\frac{6}{z}J_3(z) = J_2(z) + J_4(z)$) $|A_1''(x)| = |f_0'''(x)| = \frac{|J_3(2\sqrt{x})|}{x^{3/2}} \le \min\bigl(\frac{1}{6}, \frac{2}{3x}\bigr)$ for all $x > 0$. Consequently:
   - $|\Delta_{\mathrm{Wick}}''(\zeta)| \le |\psi_{\mathrm{Wick}}''(\zeta)| + e^{-\zeta} \le \min\bigl(\frac{1}{2}\mathbb{E}[W(R)^2],\, \frac{1}{\zeta}\mathbb{E}[W(R)]\bigr) + 1 = \min\bigl(23,\, \frac{1}{\zeta} + 1\bigr)$;
   - $|M_{\mathrm{Wick}}''(\zeta)| \le \min\Bigl(\frac{1}{24}\mathbb{E}[R^3|R - 2|^5],\, \frac{1}{3\zeta}\mathbb{E}[R^2|R - 2|^3]\Bigr) < \min\Bigl(453,\, \frac{12}{\zeta}\Bigr)$, since $\mathbb{E}[R^3|R - 2|^5] = 10848 + 2\int_0^2 R^3(2 - R)^5 e^{-R}\,dR < 10848 + 2\cdot 2^9 B(4, 6) = 10848 + \frac{128}{63} < 10872 = 24 \times 453$, and $\frac{1}{3}\mathbb{E}[R^2|R - 2|^3] = \frac{496e^{-2} - 32}{3} < \frac{36}{3} = 12$.

### 3.3 Continuum `(0, 4]` positivity cover and two-sided 640-bit panel quadratures

1. **Truncation of $R$-integrals at $S = 18$.** Writing $I_n(S) = \int_0^S R^n e^{-R}\,dR$ (computed in `verify.py` via upward convergent tail series at $N = \max(n_{\max}, 3S)$ and exact backward recurrence $I_{n-1}(S) = \frac{I_n(S) + S^n e^{-S}}{n}$) and $\Gamma(k + 1, S) = k! e^{-S}\sum_{j=0}^k \frac{S^j}{j!}$, on $[0, S]$ the alternating Bessel power series of $J_0(2\sqrt{\zeta W(R)})$, $A_1(\zeta W(R))$, and $J_2(2\sqrt{\zeta W(R)})/(\zeta W(R))$ have monotone remainders whenever $\frac{\zeta}{2} S(S - 2)^2 < K_{\mathrm{use}}^2$, while the $[S, \infty)$ tails of $\psi_{\mathrm{Wick}}, \psi_{\mathrm{Wick}}', M_{\mathrm{Wick}}, M_{\mathrm{Wick}}'$ are bounded by $e^{-S}$, $\frac{1}{2}\Gamma(4, S)$, $\Gamma(3, S)$, and $\frac{1}{2}\Gamma(6, S)$ respectively (since $W(R) \le \frac{1}{2}R^3$, $R|R - 2| \le R^2$, and $R|R - 2|W(R) \le \frac{1}{2}R^5$ for $R \ge 18$).
2. **Continuum positivity on $(0, 4]$.**
   - On $(0, 1/50]$: $\Delta_{\mathrm{Wick}}(\zeta) \ge \bigl(C_2^{\mathrm{small,lo}} - \frac{1}{50} C_3^{\mathrm{small,hi}}\bigr)\zeta^2 > 0$.
   - On $[1/50, 2/5]$: 381 fine `Jet1` cells of width $\Delta\zeta = 1/1000$, using $|\Delta_{\mathrm{Wick}}'(\xi)| \le 23\xi$ (since $\Delta_{\mathrm{Wick}}'(0) = 0$ and $|\Delta_{\mathrm{Wick}}''| \le 23$).
   - On $[2/5, 4]$: 361 coarse `Jet1` cells of width $\Delta\zeta = 1/100$, using $|\Delta_{\mathrm{Wick}}'(\xi)| \le \min(2, 23\xi)$ (since $|\psi_{\mathrm{Wick}}'| \le \mathbb{E}[W(R)] = 1$ and $e^{-\xi} \le 1$).
   Across `[1/50, 4]` and the `(0, 1/50]` bracket, the certified minimum margin in `result.json` exceeds $2509689 / 10^9 > 2.509\cdot 10^{-3} > 0$.
3. **Small-amplitude strip $v \in (0, 1/2000]$ and 355-slab cover of $[1/2000, 463/10000]$.**
   - On $v \in (0, u_{\mathrm{sm}}]$ ($u_{\mathrm{sm}} = 1/2000$): integrating $\tau \in [0, 5]$ (`200` panels) with $e^{-(u_{\max} - v)\tau^2} \ge e^{-u_{\max}\tau_{k+1}^2}$ and $\Delta_{\mathrm{Wick}}(v\tau^2) \ge (C_2^{\mathrm{small,lo}} - C_3^{\mathrm{small,hi}} u_{\mathrm{sm}}\tau_{k+1}^2) v^2\tau^4$ gives $\widetilde D(v) \ge D_{\mathrm{sm}}\,v^2$, while $|M_{\mathrm{Wick}}(v\tau^2)| \le \frac{44}{5} v\tau^2$ gives $\widetilde C_2(v) \le C_{\mathrm{sm}}\,v^3$, so $\widetilde C_2(v)/\widetilde D(v) \le (C_{\mathrm{sm}}/D_{\mathrm{sm}}) u_{\mathrm{sm}} < 0.024 < 9/100$ at all three rows.
   - On $v \in [u_{\mathrm{lo}}, u_{\mathrm{hi}}] \subset [1/2000, 463/10000]$ (355 exact rational slabs):
     - For $\widetilde D(v)$ on panel $[\tau_k, \tau_{k+1}] \subset [0, 17/2]$ (`340` panels, $\Delta\tau = 1/40$): convexity of $\psi_L(\xi)$ gives the pointwise non-negative midpoint-tangent minorant $\psi_L(\tau^2) \ge P_k - Q_k\tau^2 \ge 0$ ($\xi_m = (\tau_k^2 + \tau_{k+1}^2)/2$), while Taylor's theorem at the nearest `Jet1` node $z_0$ gives $\Delta_{\mathrm{Wick}}(v\tau^2) \ge \alpha_\Delta + \beta_\Delta v\tau^2$ (clamped to $\ge 0$ on $[u_{\mathrm{lo}}\tau_k^2, u_{\mathrm{hi}}\tau_{k+1}^2]$) alongside the polynomial bound $(C_2^{\mathrm{small,lo}} - C_3^{\mathrm{small,hi}} u_{\mathrm{hi}}\tau_{k+1}^2) u_{\mathrm{lo}}^2\tau^4$. Because both factors are pointwise non-negative on $[\tau_k, \tau_{k+1}]$, integrating their product against $\tau^{-2}\,d\tau$ in **two-sided 640-bit interval arithmetic** handles either sign of $\alpha_\Delta$ and $\beta_\Delta$ soundly and takes the exact minimum over $v \in [u_{\mathrm{lo}}, u_{\mathrm{hi}}]$ at the appropriate endpoint.
     - For $\widetilde C_2(v)$ on panel $[\tau_k, \tau_{k+1}] \subset [0, 23/2]$ (`575` panels, $\Delta\tau = 1/50$): convexity of $\tilde\chi_A(\xi)$ gives $\tilde\chi_A(\tau^2) \le \frac{(\xi_{k+1} - \tau^2)U_k + (\tau^2 - \xi_k)U_{k+1}}{\xi_{k+1} - \xi_k}$ for **any** valid endpoint upper bounds $U_k \ge \tilde\chi_A(\xi_k)$ (using the minimum of the alternating Bessel bound and the Pick/Bernstein bound on $\tau \le 87/10$, and the Pick/Bernstein bound on $\tau \in (87/10, 23/2]$), since both secant weights are non-negative on $[\tau_k, \tau_{k+1}]$. Pairing this positive secant majorant with the non-negative `Jet1` affine majorant $|M_{\mathrm{Wick}}(v\tau^2)| \le \alpha_M + \beta_M v\tau^2$ in two-sided 640-bit interval arithmetic yields the certified slab bounds of Theorem 2. $\square$

---

## 4. Proofs of Theorems 3 and 4 (Shared-bath self-interactions and sharpened character perturbations)

### 4.1 Exact single-pole integrals and the concavity bound $\varphi'(0) - B'(u) \le 2(-\varphi''(0))\,u$

For $c = a/b > 0$, differentiating $f(t) = \int_0^\infty \frac{e^{-t(c + r^2)}}{c + r^2}\,dr$ gives $f'(t) = -\frac{\sqrt{\pi}}{2\sqrt{t}} e^{-ct}$ and $f(\infty) = 0$, hence at $t = 1$:
$$I_1(a, b) := \int_0^\infty \frac{e^{-r^2}}{a + b r^2}\,dr = \frac{e^c}{b} f(1) = \frac{\sqrt{\pi}}{\sqrt{ab}}\,e^c\left(\frac{\sqrt{\pi}}{2} - \sqrt{c}\sum_{k=0}^\infty \frac{(-c)^k}{k!(2k + 1)}\right),$$
and integration by parts yields $2k a\,I_{k+1}(a, b) = (2k - 1 - 2c)\,I_k(a, b) + \frac{2}{b}\,I_{k-1}(a, b)$ ($I_0 = \sqrt{\pi}/2$). Partial fractions in $r^2$ between $A(r^2) = a + br^2$ and $J(r^2) = a + 3br^2$ ($J - 3A = -2a$) express every integral $\int_0^\infty e^{-r^2} A(r^2)^{-p} J(r^2)^{-q}\,dr$ as an exact rational combination of $I_1(a, b), \dots, I_p(a, b)$ and $I_1(a, 3b), \dots, I_q(a, 3b)$.

From [`CONTENT_KERNELS.md` eqs. (1), (4), (6), and §4](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md):
- $\varphi'(0) = I_1(a, b)$, and $\varphi'(v) = \frac{\sqrt{\pi}}{2}\int_0^\infty \lambda^{-1/2}\left(\int_0^1 \mathbb{E}_\theta[e^{-\lambda v r \cos^2\theta}]\,dr\right)\mu_D(d\lambda)$ is completely monotone on $[0, \infty)$;
- Differentiating at $v = 0$ ($\int_0^1 r\,dr = \frac{1}{2}$, $\mathbb{E}_\theta[\cos^2\theta] = \frac{1}{2}$) and converting via $\int_0^\infty s^{-1/2}(-\partial_s f_D(s))\,ds = \sqrt{\pi}\int_0^\infty \lambda^{1/2}\mu_D(d\lambda)$ with $s = H(r^2)$ ($s^{-1/2}\,ds = 2 J(r^2)\,dr$) gives
  $$-\varphi''(0) = \frac{\sqrt{\pi}}{8}\int_0^\infty \lambda^{1/2}\,\mu_D(d\lambda) = \frac{1}{4}\int_0^\infty e^{-r^2}\Bigl[A(r^2)^{-2}J(r^2)^{-1} + b\,A(r^2)^{-3}J(r^2)^{-1} + 3b\,A(r^2)^{-2}J(r^2)^{-2}\Bigr] dr.$$
Because $\varphi'$ is completely monotone, $0 \le -\varphi''(x) \le -\varphi''(0)$ for every $x \ge 0$. Differentiating $B(v) = \int_0^\infty e^{-R}\varphi(vR)\,dR$ twice under the integral sign (dominated by $R^2 e^{-R}(-\varphi''(0))$) gives
$$-B''(v) = \int_0^\infty R^2 e^{-R}\bigl(-\varphi''(vR)\bigr)\,dR \le \bigl(-\varphi''(0)\bigr)\int_0^\infty R^2 e^{-R}\,dR = 2\bigl(-\varphi''(0)\bigr) \qquad (v \ge 0).$$
Since $B'(0) = \varphi'(0)$, integrating on $[0, u]$ gives $\varphi'(0) - B'(u) \le 2(-\varphi''(0))\,u$.

Now let $q = p + h$ satisfy $\mathbb{E}[\bar p h] = 0$ ($u = u_0 + e$, $u_0 = \|p\|_2^2$, $e = \|h\|_2^2$) and $\mathbb{E}[D\Phi(p)[h]] = 0$. Concavity of $B$ yields $B(u_0 + e) - B(u_0) \ge B'(u)\,e$, while $D^2\Phi(z)[h, h] \le 2\varphi'(0)|h|^2$ (`CONTENT_KERNELS.md` §2) and $\mathbb{E}[D\Phi(p)[h]] = 0$ yield $\mathbb{E}[\Phi(p + h)] - \mathbb{E}[\Phi(p)] \le \varphi'(0)\,e$. Subtracting gives
$$D(p + h) \ge D(p) - \bigl(\varphi'(0) - B'(u)\bigr)\,e \ge D(p) - 2\bigl(-\varphi''(0)\bigr)\,u\,e.$$

### 4.2 Proof of Theorem 3

Let $q(X, Y) = q_0(X) + h(X, Y)$ with $h(X, Y) = \sum_{j=1}^m [X_j P_j(Y) + \bar X_j H_j(Y)]$ and $\mathbb{E}_Y[P_j] = \mathbb{E}_Y[H_j] = 0$.
1. **Parity and conditioning cancellations.** Under the measure-preserving involution $(X, Y) \mapsto (-X, Y)$, $q(-X, Y) = -q(X, Y)$; since $\Psi_A(-w) = -\Psi_A(w)$, $\mathbb{E}[\bar Y_\ell \Psi_A(q)] = -\mathbb{E}[\bar Y_\ell \Psi_A(q)] = 0$ for every $\ell = 1, \dots, d$, so $\Pi_{1,0}^{(X, Y)}\Psi_A(q) = \Pi_{1,0}^X \Psi_A(q)$. Next, $\mathbb{E}_Y[h(X, Y)] = 0$ a.s. in $X$. Because $q_0(X)$, $D\Phi(q_0(X))$ ($\|D\Phi\|_\infty \le 2$), and $\bar Z_\alpha(X) D\Psi_A(q_0(X))$ ($\|D\Psi_A\|_\infty \le M_0^A$, $|Z_\alpha|\,|h| \in L^1$ by Cauchy–Schwarz) depend on $X$ alone, Fubini gives $\mathbb{E}[\overline{q_0} h] = 0$, $\mathbb{E}[D\Phi(q_0)[h]] = 0$, and $\mathbb{E}[\bar Z_\alpha D\Psi_A(q_0)[h]] = 0$ for every unit $Z_\alpha = \sum_{j=1}^m \alpha_j X_j \in H_{1,0}(X)$, as well as $\mathbb{E}|h|^2 = \sum_{j=1}^m (\mathbb{E}|P_j|^2 + \mathbb{E}|H_j|^2) = e$.
2. **Sharp $\frac{3\sqrt{\pi}}{4}$ moment bound via global $U(1)$ charge-$2$ cancellation.** Fix $Y$ and write $p = (P_1(Y), \dots, P_m(Y))$, $r = (H_1(Y), \dots, H_m(Y))$, so $h(X, Y) = p^\top X + r^\top \bar X$ and
   $$|h(X, Y)|^2 = |p^\top X|^2 + |r^\top \bar X|^2 + 2\operatorname{Re}\bigl((p^\top X)(r^* X)\bigr).$$
   Under global phase rotation $X \mapsto e^{i\phi} X$ ($\phi \sim \mathrm{Unif}[0, 2\pi)$), $|Z_\alpha(e^{i\phi} X)| = |Z_\alpha(X)|$ is invariant while $(p^\top(e^{i\phi}X))(r^*(e^{i\phi}X)) = e^{2i\phi}(p^\top X)(r^* X)$ has charge $+2$ and integrates to $0$. Extending $W_1 := Z_\alpha(X)$ to an orthonormal basis $W_1, \dots, W_m$ of $H_{1,0}(X)$ (i.i.d. $\mathcal{CN}(0, 1)$, $\mathbb{E}|W_1|^3 = \Gamma(5/2) = \frac{3\sqrt{\pi}}{4}$, $\mathbb{E}|W_1| = \frac{\sqrt{\pi}}{2}$) gives $p^\top X = \sum_{k=1}^m \tilde p_k W_k$ with $\sum_k |\tilde p_k|^2 = \|p\|_2^2$, hence
   $$\mathbb{E}_X\bigl[|Z_\alpha(X)|\,|p^\top X|^2\bigr] = \frac{3\sqrt{\pi}}{4}|\tilde p_1|^2 + \frac{\sqrt{\pi}}{2}\sum_{k=2}^m |\tilde p_k|^2 \le \frac{3\sqrt{\pi}}{4}\|p\|_2^2,$$
   and identically $\mathbb{E}_X[|Z_\alpha(X)|\,|r^\top \bar X|^2] \le \frac{3\sqrt{\pi}}{4}\|r\|_2^2$ (since $|W_1| = |\bar W_1|$). Averaging over $Y$ gives $\mathbb{E}[|Z_\alpha|\,|h|^2] \le \frac{3\sqrt{\pi}}{4}\,e$.
3. **Second-order remainder and dimensionless cancellation.** By `CONTENT_KERNELS.md` §5 and [`KRAW` eq. (4.1)](../raw-content-2026-11-17-gemini-5331/PROOF.md) (also cited in `6.3.9c`), $\|D^2\Psi_A\|_\infty \le \frac{4}{3\sqrt{\pi} a^2}$. Since $\mathbb{E}[\bar Z_\alpha D\Psi_A(q_0)[h]] = 0$, Taylor's theorem gives
   $$\operatorname{Re}\mathbb{E}\bigl[\bar Z_\alpha\bigl(\Psi_A(q_0 + h) - \Psi_A(q_0)\bigr)\bigr] \le \frac{1}{2}\cdot \frac{4}{3\sqrt{\pi} a^2}\cdot \frac{3\sqrt{\pi}}{4}\,e = \frac{e}{2a^2},$$
   and taking the supremum over unit $Z_\alpha \in H_{1,0}(X)$ proves $C(q) \le C(q_0) + \frac{e}{2a^2}$.
4. **Rational regimes.** Suppose $e \le \beta\,\frac{S_2}{u_0}$ where $S_2 := \sum_{j=1}^m u_j^2 \le u_0^2$ and $\beta > 0$. By Theorem 2, $C(q_0) \le \frac{3}{10}\sqrt{D(q_0)}$ and $D(q_0) \ge \kappa_D S_2$. Since $\sqrt{S_2} \le u_0$, we have $\frac{e}{\sqrt{D(q_0)}} \le \frac{\beta S_2}{u_0\sqrt{\kappa_D S_2}} = \frac{\beta}{\sqrt{\kappa_D}}\frac{\sqrt{S_2}}{u_0} \le \frac{\beta}{\sqrt{\kappa_D}}$, and simultaneously $e \le \beta u_0$, so
   $$\frac{u\,e}{D(q_0)} = \frac{(u_0 + e)\,e}{D(q_0)} \le \frac{(1 + \beta)u_0 \cdot \beta(S_2 / u_0)}{\kappa_D S_2} = \frac{\beta(1 + \beta)}{\kappa_D},$$
   cancelling $u_0$, $S_2$, and $m$ identically! Thus $C(q)^2 \le K\,D(q)$ holds whenever
   $$\left(\frac{3}{10} + \frac{\beta}{2a^2\sqrt{\kappa_D}}\right)^2 + 2K\bigl(-\varphi''(0)\bigr)\frac{\beta(1 + \beta)}{\kappa_D} \le K.$$
   `verify.py` certifies this inequality in 640-bit arithmetic at all three rows: for $(K, \beta) = (6/25, 1/5)$ the left-hand side is at most $0.225443$ (`peak`), $0.225121$ (`flank`), $0.220926$ (`upper`) $< 0.24$; for $(11/50, 1/6)$ at most $0.197111, 0.196855, 0.193587 < 0.22$; and for $(3/20, 1/10)$ at most $0.145592, 0.145454, 0.143818 < 0.15$. $\square$

### 4.3 Proof of Theorem 4

All symmetry cancellations and the Lipschitz/Hessian expansion $C(p + h)^2 \le C(p)^2 + \bigl[L^2 + \frac{5}{4a^2} C(p)\bigr] e$ ($e = \|h\|_2^2$, $L = \frac{1 + 2e^{-3/2}}{2} M_0^A$) are identical to [`6.3.9c`](../mixed-driver-sign-perturbation-codex-a7c4/PROOF.md) (and [`6.3.9d`](../real-trilinear-neighbourhood-codex-a7c4/REAL_CHARACTERS.md) in the real sign-character transfer, since the real slice $P_R = \operatorname{Re} p$ and $H_R = \operatorname{Re} h$ satisfies the same orthogonality, vanishing first variation, and real-slice concavity bound on $B$). Two steps are sharpened:
1. By §4.1, $D(p + h) \ge D_0 - \bigl(\varphi'(0) - B'(u)\bigr) e \ge D_0 - 2(-\varphi''(0)) u_{\max}\,e$ whenever $u = \|p + h\|_2^2 \le u_{\max} = \frac{463}{10000}$ (certified in `result.json` as $2(-\varphi''(0))u_{\max} \le 0.154883$ on `peak`, $\le 0.154959$ on `flank`, $\le 0.145036$ on `upper`).
2. Since $\Phi$ is convex and phase-invariant, Jensen gives $\mathbb{E}[\Phi(p)] \ge \Phi(\mathbb{E}[p]) = \Phi(0) = B(0)$; since $B$ is concave with $B'(0) = \varphi'(0)$, $D_0 = B(u_0) - \mathbb{E}[\Phi(p)] \le B(u_0) - B(0) \le \varphi'(0) u_0 \le \varphi'(0) u_{\max}$. Hence $C(p) \le \min\bigl(\sqrt{\kappa D_0},\, \frac{1}{2}M_0^A\sqrt{u_0}\bigr) \le \min\bigl(\sqrt{\kappa\,\varphi'(0)\,u_{\max}},\, \frac{1}{2}M_0^A\sqrt{u_{\max}}\bigr)$.

Evaluating the resulting budget in 640-bit outward-rounded interval arithmetic in `verify.py` (cross-checking containment of $M_0^A$ and $M_1^A$ inside the SHA-256-pinned `content_kernels_exact_result.json`, and checking both $(n - 1)(K - \kappa) < \text{budget} \le n(K - \kappa)$ in every cell) certifies Theorem 4's table. $\square$

---

## 5. Replay and adversarial controls

From the repository root:
- **Fast zero-float audit (< 2.5 s, stdlib only, works with `-IB` and `-IB -O`):**
  ```sh
  python3 -IB research/conjecture-K/code/multi-driver-self-interaction-gemini-21d5/verify.py
  python3 -IB -O research/conjecture-K/code/multi-driver-self-interaction-gemini-21d5/verify.py
  ```
- **Full 640-bit zero-float continuum recomputation (~114 s on Apple Silicon):**
  ```sh
  python3 -IB -O research/conjecture-K/code/multi-driver-self-interaction-gemini-21d5/verify.py --recompute
  ```
Both modes execute 12 built-in adversarial controls (AST rejection of float literals, `float()` calls, and bare `assert`s; strict sign flip $\Delta_{\mathrm{Wick}}(49/10) < 0$; false target $83/1000$ failing against the certified peak Wick monomial lower bound; sharpness of $\frac{3\sqrt{\pi}}{4}$; necessity of global $U(1)$ charge-$2$ cancellation; non-cubic indicator tail counterexample vs Theorem 3's $L^2$ freedom; $n - 1$ boundary failure in Theorem 4; and tampered `max_slab_ratio_upper`, slab count, upstream SHA-256, and binding-slab scaled enclosures).
