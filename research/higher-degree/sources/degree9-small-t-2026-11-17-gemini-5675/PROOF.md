# The Degree-9 Game near $t = 0$, the Two-Chaos Radius Problem, and the Degree-7 Comparison (Issue #524)

- **Author:** `gemini-5675`
- **Date:** 17 November 2026
- **Issue:** [#524](https://github.com/agalatan/grothendieck-lean/issues/524)
- **Verification suite:** `research/higher-degree/code/degree9-small-t-gemini-5675/` (`python3 -I` stdlib certificates + numerical Hankel probe)

---

## 0. Executive Summary & Dependency Inventory

Let $P_{p,q}$ denote the orthogonal projection in $L^2(\mathbb{C}^n, \gamma_n)$ onto the complex Hermite (Wick) chaos $H_{p,q}(\mathbb{C}^n)$. Issue #524 studies the degree-9 Hermite game (`HD 1.6`)
$$T_9 = P_{1,0} - a_1 P_{2,1} + a_2 P_{3,2} - a_3 P_{4,3} + a_4 P_{5,4}, \qquad (a_1, a_2, a_3, a_4) = \left(\frac{936}{1000},\, \frac{72057}{100000},\, \frac{59202}{100000},\, \frac{23468}{100000}\right),$$
near $t = \|P_{1,0}(f + g)/2\|_2 = 0$, alongside the degree-7 game (`HD 1.4`)
$$T_7 = P_{1,0} - a_{1,7} P_{2,1} + a_{2,7} P_{3,2} - a_{3,7} P_{4,3}, \qquad (a_{1,7}, a_{2,7}, a_{3,7}) = \left(\frac{906596}{1000000},\, \frac{541570}{1000000},\, \frac{242531}{1000000}\right).$$
For $T_9$, the diffuse remote-only pair $f = W_3/|W_3|, g = -f$ ($W_3 \sim \mathcal{CN}(0, 1)$ a diffuse cubic) has $t = 0$ and scores
$$V_9^{\mathrm{rem}} := a_1\frac{\pi}{4} - a_4\frac{\pi}{32} = \frac{181333}{800000}\,\pi = 0.7120930258167475\dots,$$
matching to five decimals the cutting-plane model norm $N_9 \in [0.71209, 0.71210]$ ($1/N_9 \approx 1.40430$) recorded in `HD 1.6`.

### Main Results (by status label)

1. **Task 1a — Sharp Diffuse Two-Chaos Theorem (**P + C**, author only):**
   Over any number $m \ge 1$ of independent diffuse cubic Gaussians $\mathbf{W}_3 \sim \mathcal{CN}(0, I_m)$ and any independent higher-grade remote variables $\mathbf{Y}$ ($W_5, W_7, W_9, \dots$), for every measurable $f(\mathbf{W}_3, \mathbf{Y})$ with $|f| \le 1$ a.e.,
   $$\|P_{2,1}f\|_2^2 - c\,\|P_{5,4}f\|_2^2 \le \frac{\pi}{4} - c\,\frac{\pi}{32} \iff 0 \le c \le 2,$$
   with equality for $0 < c < 2$ iff $f(\mathbf{W}_3, \mathbf{Y}) = e^{i\alpha}(u\cdot\mathbf{W}_3)/|u\cdot\mathbf{W}_3|$ a.e. ($\|u\|_2 = 1$). In particular, $W_3/|W_3|$ is uniquely optimal across all diffuse graded competitors on the entire range $0 \le c \le 0.3$ (including $c_9 := a_4/a_1 = 5867/23400 \approx 0.2507265$).
2. **Task 1a — General $\mathbb{C}^n$ Two-Chaos Problem: Local Stability vs Conjecture K 3.6 (**P + C**, author only; global sharp bound **open**):**
   In general finite-dimensional $\mathbb{C}^n$, Parseval gives $\sup_{n,|f|=1}(\|P_{2,1}f\|_2^2 - c\|P_{5,4}f\|_2^2) \ge (1+c)\rho_*^2 - c$ where $\rho_* = \sup_{q \in H_{2,1}}\mathbb{E}|q|/\|q\|_2$. Thus at $c = 0$ the sharp bound is Conjecture `K 3.6` ($\rho_* = \sqrt{\pi}/2$, **open**), and at $c = c_9$ proving $\le \frac{\pi}{4} - c_9\frac{\pi}{32}$ already forces $\rho_* \le 0.899299 < 2289/2500 = 0.9156$ (strictly stronger than `K 3.7`). Locally along $f_\tau(z, W_3) = \operatorname{ph}(W_3 + \tau B(z))$ for **every** nonzero unit-norm $B \in H_{2,1}(\mathbb{C}^d)$, the exact $\tau^4$ two-chaos variation is strictly negative for all $0 \le c < 8/25 = 0.32$ (covering $0 \le c \le 0.3$), whereas for $c > 8/17 \approx 0.47059$, $B(z_1) = H_{2,1}(z_1)$ strictly beats $W_3/|W_3|$ in finite dimensions despite $c < 2$.
3. **Task 1b — Refutation of Remote-Only Attainment of $N_9^0$ & Certified Lower Bound $N_9^0 > N_9 + 10^{-5}$ (**P + C**, author only, plus **N**):**
   For the full 5-weight operator $T_9$ on the $t = 0$ slice $g = -f$, **$N_9^0$ is NOT attained by the remote-only pair $(W_3/|W_3|, -W_3/|W_3|)$, and $N_9^0 > 0.71211 \ge N_9 + 10^{-5}$:**
   - **Mechanism:** Although $B(z_1) = H_{2,1}(z_1)$ loses $-\frac{21}{16}\pi a_1\tau^4$ on $+a_1\|P_{2,1}f\|_2^2$ and pays $-\frac{11}{16}\pi a_2\tau^4$ on $-a_2\|P_{3,2}f\|_2^2$, it simultaneously gains $+\frac{31}{16}\pi a_3\tau^4$ on $+a_3\|P_{4,3}f\|_2^2$ (via large $A_1 = \|P_{3,1}B^2\|_2^2 = 24$ and $C_2 = \|P_{2,2}|B|^2\|_2^2 = 25$) and drops $-\frac{357}{128}\pi a_4\tau^4$ off $-a_4\|P_{5,4}f\|_2^2$, yielding net positive $\tau^4$ balance $\big(-\frac{21}{16}a_1 - \frac{11}{16}a_2 + \frac{31}{16}a_3 + \frac{357}{128}a_4\big)\pi\tau^4 = +\frac{248589}{3200000}\pi\tau^4 > 0$.
   - **Certified concrete witnesses (**P + C**, outward integer interval arithmetic in `verify_t0_refutation_exact.py`):**
     - Single coordinate + bath ($\ell = 1, \tau = 1/50$): $V_9(f_{1,1/50}, -f_{1,1/50}) - V_9^{\mathrm{rem}} \in [+1.3995 \times 10^{-8},\, +1.4319 \times 10^{-8}] > 0$.
     - $1600$ coordinates + bath ($\ell = 1600, \tau = 1/20, h(z_j) = H_{2,1}(z_j) + \frac{3}{250}H_{3,2}(z_j)$): via rigorous finite-$m$ Parseval approximation $W_{3,m} \to W_3$ in $\mathbb{C}^{1600+3m}$,
       $$N(\lambda_9) \ge N_9^0 \ge V_9(f_{1600,1/20}, -f_{1600,1/20}) \in [0.71214069,\, 0.71214162] > 0.712110 = N_9 + 10^{-5},$$
       certifying $1/N(\lambda_9) \le 1/N_9^0 < 1.404218$ (strictly below the `1.40430–1.40431` model estimate of `HD 1.6` and `HD 1.8`).
   - **Numerical multi-coordinate survey (**N**, `probe_multimode_hankel.py`):**
     - Parameter-free pure $\mathbb{C}^\ell$ cubic sum $f_\ell(z) = \operatorname{ph}(\sum_{j=1}^\ell H_{2,1}(z_j)), g_\ell = -f_\ell$: exact series $V_9/\pi = \frac{181333}{800000} + \frac{248589}{3200000}\ell^{-1} - \frac{4371711867}{25600000}\ell^{-2} + O(\ell^{-3})$; at $\ell = 4000$, $V_9 = 0.71212128 > 0.71211$.
     - Pure $\mathbb{C}^{1600}$ two-mode sum ($H_{2,1} + \frac{3}{250}H_{3,2}$, no diffuse bath): **$V_9 = 0.71216039$** (`0.71214717` on $\mathbb{C}^{1200}$; bath + $1600$-spike at $\tau = 2/25$: $V_9 = 0.71215418$), revising $1/N(\lambda_9) \lesssim 1.4041781$ and cutting $\approx 68\%$ of $\lambda_9$'s previously believed gain over degree 7's $1.404113$ while leaving $9.03 \times 10^{-5}$ room below $1/1.404 = 250/351 = 0.71225071$.
4. **Task 2 — Small-$t$ Bounds for $T_9$: Obstructions, Exact Multi-Chaos Reduction & Bargmann SOS Floor for $R_9$ (**P + C**, author only):**
   - **Parseval obstruction (**P + C**):** Bounding $a_2\|P_{3,2}h\|_2^2 \le a_2(1 - \|k\|_2^2 - t^2)$ as in `SMALL_T.md` / `HD 4.18` has $t = 0$ value $\ge a_2 = 0.72057 > 250/351$ at degree 9 even at $G_3 = 0$ for **every** $C_9 \in H_{5,4}$, and $\ge 0.75146 > 250/351$ at degree 7.
   - **Radius necessity (**P + C**):** A dual bound at $t=0$ with $B<250/351$ that discards both negative $k$-penalties in Proposition 3.2(1) forces $\|P_{2,1}f\|_2^2 - c_9\|P_{5,4}f\|_2^2 \le \frac{31250}{41067} = 0.7609516\dots$ on $|f|=1$, hence $\rho_*<0.899374$. For an unrestricted primal bound, Proposition 3.2(2) gives $\rho_*<0.94044$.
   - **Exact multi-chaos gate-free reduction (**P + C**):** Keeping $\langle h, P_{1,0}h\rangle = t^2$ directly and dualizing $P_{3,2}h, P_{5,4}h$ on $h$ together with $P_{2,1}k, P_{4,3}k$ and the $H_{5,4}$ multiplier $C_9 = \beta R_9(q)$ ($R_9(q) = \frac{1}{\sqrt{2}}P_{5,4}(q^2\bar q)$, $q = G_3/\|G_3\|_2$) on $k$ yields $\operatorname{Re}\langle f, T_9 g\rangle \le t^2 + B_9^*$ for **all** $t \ge 0$ ($A = 1$). Globally over all $(\sigma_3, \sigma_5, \sigma_7, \sigma_9) \in [0, \infty)^4$ in the diffuse Gaussian ideal, **we prove and interval-certify $B_9^{*,\mathrm{Gauss}} = V_9^{\mathrm{rem}} = 0.7120930258\dots$** (zero inflation from $H_{3,2}, H_{4,3}, H_{5,4}$), giving conditional reach $t_0 = \sqrt{250/351 - B_0} \ge 0.01255$ at the Gaussian ideal and $t_0 \ge 0.00952$ at $B_0 = 0.71216$.
   - **Bargmann Sum-of-Squares & Wick classification of $R_9(q)$ (**P + C**):** The $5!\cdot 4! = 2880$ Wick contractions of $\|R_9(q)\|_2^2$ partition into 19 real isomorphism classes ($16$ of type `[2,2,2]`, $336$ of type `[2,4]`, $2528$ connected `[6]`). Via Bargmann–Fock representation on $\mathbb{C}^n_w \times \mathbb{C}^n_\zeta$, we prove unconditionally for every unit-norm $q \in H_{2,1}(\mathbb{C}^n)$ that
     $$\|R_9(q)\|_2^2 \ge 1 + \operatorname{tr}(N^2) + 4\operatorname{tr}(M^2) + 4\operatorname{tr}(N^\top M) \ge 1 + \frac{9}{n} > 1,$$
     with equality in $1+9/n$ attainable exactly when $3\mid n$. The squared norms are $4$ at $z_0 z_1 \bar z_2$, $6$ at $z_0^2\bar z_1/\sqrt{2}$, $36$ at $z_0(|z_1|^2 - 1)$, and $180$ at $H_{2,1}(z_0)$.
5. **Task 3 — Degree-7 Contrast (`HD 1.4`, **P + C**, author only):**
   Unlike $T_9$ (where $a_1 = 0.936 < 3 a_3 = 1.77606$), $T_7$ satisfies **$a_{1,7} = 0.906596 > 3 a_{3,7} = 0.727593$**, so its universal $\tau^4$ variation along $\operatorname{ph}(W_3 + \tau B(z))$ is **strictly negative for every nonzero $B \in H_{2,1}(\mathbb{C}^d)$**:
   $$\frac{V_7(\tau) - V_7(0)}{\pi\tau^4} = -\left(\frac{a_{1,7}}{48} + \frac{a_{2,7}}{64}\right)A_0 - \left(\frac{a_{1,7}}{96} - \frac{a_{3,7}}{64}\right)A_1 - \left(\frac{a_{1,7}}{24} + \frac{a_{2,7}}{16}\right)C_1 - \left(\frac{a_{1,7}}{48} - \frac{a_{3,7}}{16}\right)C_2 < 0.$$
   Its multi-chaos Gaussian ideal is algebraically $B_7^{*,\mathrm{Gauss}} = a_{1,7}\frac{\pi}{4} = \frac{226649}{1000000}\pi = 0.7120388333\dots$ (conditional reach $t_0 \ge 0.01455$), while a dual certificate discarding both $k$-penalties at $B<250/351$ requires $\rho_*<0.886359$. Primal Parseval gives $\rho_*<0.94767$. The dual threshold is within $1.32\times10^{-4}$ of $\sqrt\pi/2$ (Conjecture `K 3.6`).

### Dependency Inventory

| Dependency | Status | Where used |
|---|---|---|
| Quartic excess decomposition $\chi = \frac{2}{3}A_0 + \frac{1}{3}A_1 + \frac{4}{3}C_1 + \frac{2}{3}C_2$ for unit $B \in H_{2,1}(\mathbb{C}^d)$ | **P** (`../conjecture-K/STATUS.md` 6.3.21; `Grothe/LowerAnalytic/SixthMoment.lean`) | Universal $\tau^4$ formulas in §§1.2, 2.1, 4.1 (also verified on canonical blocks in `verify_t0_refutation_exact.py`) |
| Best proved cubic $L^1$ radius $\rho_* \le 2289/2500 = 0.9156$ | **P + C** (`../conjecture-K/STATUS.md` 3.7) | Comparison benchmark only in §1.2 & §3.2 (not an input to our theorems) |
| Standard complex Hermite / Bargmann–Fock orthogonality and Weber–Schafheitlin integral $\int_0^\infty J_1(x)\frac{dx}{x} = 1$ | Classical (**P**) | Derived self-contained below |

---

## 1. Task 1a: The Two-Chaos Problem $\sup_{|f|=1}(\|P_{2,1}f\|_2^2 - c\|P_{5,4}f\|_2^2)$

### 1.1 Sharp Theorem on the Diffuse Graded Space (**P + C**, author only)

Let $\mathbf{W}_3 = (W_{3,1}, \dots, W_{3,m}) \sim \mathcal{CN}(0, I_m)$ ($m \ge 1$) be any finite collection of independent diffuse cubic Gaussians (each of underlying bidegree $(2, 1)$), and let $\mathbf{Y}$ denote any collection of independent diffuse Gaussians in higher odd grades $(k+1, k)$ with $k \ge 2$ (specifically $(3,2), (4,3), (5,4), \dots$).

**Theorem 1.1 (Diffuse Two-Chaos Optimality).** *For $c \in \mathbb{R}$, the inequality*
$$\|P_{2,1}f\|_2^2 - c\,\|P_{5,4}f\|_2^2 \le \frac{\pi}{4} - c\,\frac{\pi}{32} \qquad \forall\, f(\mathbf{W}_3, \mathbf{Y}) \text{ measurable with } |f| \le 1\text{ a.e.}$$
*holds if and only if $0 \le c \le 2$. Moreover, for $0 < c < 2$, equality holds if and only if $f(\mathbf{W}_3, \mathbf{Y}) = e^{i\alpha}(u\cdot\mathbf{W}_3)/|u\cdot\mathbf{W}_3|$ a.e. for some $\alpha \in \mathbb{R}$ and unit vector $u \in \mathbb{C}^m$.*

*Proof.*
- **Necessity of $c \ge 0$:** If $c < 0$, take $m = 1$ and $f_{r_0}(W_3) = \operatorname{sgn}(|W_3|^2 - r_0)\,W_3/|W_3|$ for large $r_0 > 0$. By Region III below, $g_1(r_0)^2 = \frac{\pi}{4} - 2\sqrt{\pi}\,r_0^{1/2}e^{-r_0}(1 + O(r_0^{-1}))$ while $g_2(r_0)^2 = \frac{\pi}{32} + \frac{\sqrt{\pi}}{2}r_0^{3/2}e^{-r_0}(1 + O(r_0^{-1}))$, so for every $c < 0$ and sufficiently large $r_0$, $g_1(r_0)^2 - c g_2(r_0)^2 = \frac{\pi}{4} - c\frac{\pi}{32} + |c|\frac{\sqrt{\pi}}{2}r_0^{3/2}e^{-r_0}(1 + o(1)) > \frac{\pi}{4} - c\frac{\pi}{32}$.
- **Necessity of $c \le 2$:** Take $m = 1$, $f_{r_0}(W_3) = \operatorname{sgn}(|W_3|^2 - r_0)\,W_3/|W_3|$ for small $r_0 > 0$. By (1.2) below, $F_c(r_0) := \|P_{2,1}f_{r_0}\|_2^2 - c\|P_{5,4}f_{r_0}\|_2^2 = \frac{\pi}{4} - c\frac{\pi}{32} + \frac{2\sqrt{\pi}}{3}(c - 2)r_0^{3/2} + O(r_0^{5/2})$, which strictly exceeds $\frac{\pi}{4} - c\frac{\pi}{32}$ for all $c > 2$ and small $r_0 > 0$ (certified rationally at $c = 21/10, r_0 = 1/100$ in `verify_two_chaos_diffuse.py`).

Assume now $0 \le c \le 2$ and let $|f(\mathbf{W}_3, \mathbf{Y})| \le 1$ a.e.
1. **Conditioning out $\mathbf{Y}$:** Every variable in $\mathbf{Y}$ has bidegree $(k+1, k)$ with $k \ge 2$, so no Hermite polynomial involving $\mathbf{Y}$ can have bidegree $(2, 1)$. Thus $\tilde f(\mathbf{W}_3) := \mathbb{E}_{\mathbf{Y}}[f(\mathbf{W}_3, \mathbf{Y})]$ satisfies $|\tilde f| \le 1$ a.e., $P_{2,1}\tilde f = P_{2,1}f$, and $\|P_{5,4}\tilde f\|_2^2 \le \|P_{5,4}f\|_2^2$ by conditional Jensen/projection orthogonality across $\mathbf{Y}$-Hermite modes (with equality for $c > 0$ requiring all $\mathbf{Y}$-dependent $(5,4)$-modes, including $\langle f, W_9\rangle$, to vanish).
2. **Unitary rotation of $\mathbb{C}^m$ and Bessel drop to 1D:** In the diffuse model on $\mathbf{W}_3 \sim \mathcal{CN}(0, I_m)$, $H_{2,1}^{\mathrm{amb}} \cap L^2(\mathbf{W}_3) = \operatorname{span}\{W_{3,1}, \dots, W_{3,m}\}$. Choose a unitary rotation of $\mathbb{C}^m$ so that $\langle \tilde f, W_{3,j}\rangle = 0$ for $j \ge 2$ and $\langle \tilde f, W_{3,1}\rangle \ge 0$. Writing $\mathbf{W}_3 = (W, \mathbf{W}')$ with $W = W_{3,1} \sim \mathcal{CN}(0,1)$ and $\mathbf{W}' \sim \mathcal{CN}(0, I_{m-1})$, define $h(W) := \mathbb{E}_{\mathbf{W}'}[\tilde f(W, \mathbf{W}')]$ ($|h| \le 1$). Then $\|P_{2,1}\tilde f\|_2^2 = |\langle h, W\rangle|^2$ while $H_{2,1}(W) = \frac{1}{\sqrt{2}}W(|W|^2 - 2) \in P_{5,4}^{\mathrm{amb}}(L^2(\mathbf{W}_3))$ has unit norm, so Bessel's inequality gives
   $$\|P_{5,4}\tilde f\|_2^2 \ge \big|\langle \tilde f, H_{2,1}(W)\rangle\big|^2 = \big|\langle h, H_{2,1}(W)\rangle\big|^2.$$
3. **Angular projection and Neyman–Pearson classification:** Write $W = \sqrt{R}\,e^{i\theta}$ ($R \sim \operatorname{Exp}(1)$, $\theta \sim \operatorname{Unif}[0, 2\pi)$) and set $u(R) := \operatorname{Re}\frac{1}{2\pi}\int_0^{2\pi} e^{-i\theta} h(\sqrt{R}e^{i\theta})\,d\theta \in [-1, 1]$ (adjusting global phase of $\tilde f$ if needed so $\langle h, W\rangle \ge 0$; note if $\langle h, H_{2,1}(W)\rangle$ were complex while $\langle h, W\rangle \ge 0$, taking $\operatorname{Re}(e^{-i\theta}h)$ preserves $\langle h, W\rangle$ and only reduces $|\langle h, H_{2,1}(W)\rangle| \ge |\operatorname{Re}\langle e^{-i\theta}h, \frac{1}{\sqrt{2}}\sqrt{R}(R-2)\rangle|$, which cannot decrease the objective since $c \ge 0$). Thus it suffices to maximize $J_c(u) := I_1(u)^2 - c\,I_2(u)^2$ over measurable $u : (0, \infty) \to [-1, 1]$, where
   $$I_1(u) = \int_0^\infty u(R)\,R^{1/2} e^{-R}\,dR, \qquad I_2(u) = \int_0^\infty u(R)\,\frac{R^{1/2}(2 - R)}{\sqrt{2}} e^{-R}\,dR.$$
   Let $\mathcal{K} := \{(I_1(u), I_2(u)) : u \in L^\infty((0,\infty); [-1,1])\} \subset \mathbb{R}^2$, which is compact and convex by weak-$*$ compactness of the unit ball of $L^\infty$. Fix any maximizer $(x_*, y_*) \in \mathcal{K}$ of $(x, y) \mapsto x^2 - c y^2$ with $x_* \ge 0$. Maximizing $x$ at fixed $y = y_*$ shows that $(x_*, y_*)$ lies on the boundary $\partial\mathcal{K}$, so by supporting-hyperplane separation (Neyman–Pearson) there exists $(\alpha_1, \alpha_2) \ne (0,0)$ such that $u_*(R) = \operatorname{sgn}\big(\alpha_1 + \alpha_2(2 - R)\big)$ a.e. Because $R \mapsto \alpha_1 + \alpha_2(2 - R)$ is **affine** and non-zero, it changes sign at most once on $(0, \infty)$. Up to global sign $\pm 1$ (under which $J_c$ is invariant), every boundary profile has the single-threshold form $u_{r_0}(R) = \operatorname{sgn}(R - r_0) = 1 - 2\,\mathbf{1}_{R < r_0}$ for some $r_0 \in [0, \infty]$.
4. **Gap-free analysis of $F_c(r_0) := g_1(r_0)^2 - c\,g_2(r_0)^2$ on $[0, \infty]$:**
   Substituting $s = \sqrt{R}$ gives
   $$g_1(r_0) := I_1(u_{r_0}) = \frac{\sqrt{\pi}}{2} - 4\int_0^{\sqrt{r_0}} s^2 e^{-s^2}\,ds, \qquad g_2(r_0) := I_2(u_{r_0}) = \frac{\sqrt{2\pi}}{8} - 2\sqrt{2}\int_0^{\sqrt{r_0}} s^2(2 - s^2)e^{-s^2}\,ds, \tag{1.1}$$
   with derivatives $g_1'(r_0) = -2 r_0^{1/2} e^{-r_0} < 0$ and $g_2'(r_0) = -\sqrt{2}(2 - r_0) r_0^{1/2} e^{-r_0}$. On $(0, 2)$, $g_2$ is strictly decreasing from $g_2(0) = +\frac{\sqrt{2\pi}}{8}$ to $g_2(2) < -\frac{\sqrt{2\pi}}{8}$, so $g_2$ has a unique zero $r_{0,\mathrm{zero}} \in (0, 2)$. In `verify_two_chaos_diffuse.py` we enclose
   $$r_{0,\mathrm{zero}} \in [0.378372927322,\, 0.378372927323] \subset (0, 1).$$
   - **Region I ($0 < r_0 \le r_{0,\mathrm{zero}}$):** Differentiating $F_c(r_0)$ gives
     $$F_c'(r_0) = -4 r_0^{1/2} e^{-r_0}\left[g_1(r_0) - \frac{c}{\sqrt{2}}(2 - r_0) g_2(r_0)\right]. \tag{1.2}$$
     On $(0, r_{0,\mathrm{zero}}]$, both $2 - r_0 > 0$ and $g_2(r_0) \ge 0$, so for all $0 \le c \le 2$,
     $$g_1(r_0) - \frac{c}{\sqrt{2}}(2 - r_0) g_2(r_0) \ge H(r_0) := g_1(r_0) - \sqrt{2}(2 - r_0) g_2(r_0).$$
     Now $H(0) = \frac{\sqrt{\pi}}{2} - 2\sqrt{2}\cdot\frac{\sqrt{2\pi}}{8} = 0$, and
     $$H'(r_0) = g_1'(r_0) + \sqrt{2}\,g_2(r_0) - \sqrt{2}(2 - r_0)g_2'(r_0) = \sqrt{2}\,g_2(r_0) + 2\big((2 - r_0)^2 - 1\big)r_0^{1/2}e^{-r_0} > 0$$
     for all $r_0 \in (0, r_{0,\mathrm{zero}}) \subset (0, 1)$. Thus $H(r_0) > 0$ and $F_c'(r_0) < 0$ throughout $(0, r_{0,\mathrm{zero}}]$, so $F_c(r_0) < F_c(0) = \frac{\pi}{4} - c\frac{\pi}{32}$.
   - **Region II ($r_{0,\mathrm{zero}} \le r_0 \le 2$):** Since $g_1$ is strictly decreasing, $g_1(2) \le g_1(r_0) \le g_1(r_{0,\mathrm{zero}})$. Outward rational arithmetic in `verify_two_chaos_diffuse.py` certifies $g_1(r_{0,\mathrm{zero}}) \in [0.637697, 0.637698]$ and $g_1(2) \in [-0.422794, -0.422793]$, so on all of $[r_{0,\mathrm{zero}}, 2]$,
     $$F_c(r_0) \le g_1(r_0)^2 \le 0.406659 < 0.589048 < \frac{3\pi}{16} \le \frac{\pi}{4} - c\,\frac{\pi}{32} \qquad (0 \le c \le 2).$$
   - **Region III ($r_0 \ge 2$):** Rewriting the integrals on $(\sqrt{r_0}, \infty)$ using $\int_0^\infty s^2 e^{-s^2}ds = \frac{\sqrt{\pi}}{4}$ and $\int_0^\infty s^2(2-s^2)e^{-s^2}ds = \frac{\sqrt{\pi}}{8}$ gives $g_1(r_0) = -\frac{\sqrt{\pi}}{2} + 4\int_{\sqrt{r_0}}^\infty s^2 e^{-s^2}ds \in (-\frac{\sqrt{\pi}}{2}, \frac{\sqrt{\pi}}{2})$ and, since $s^2 - 2 > 0$ on $(\sqrt{r_0}, \infty) \subset (\sqrt{2}, \infty)$,
     $$g_2(r_0) = -\frac{\sqrt{2\pi}}{8} - 2\sqrt{2}\int_{\sqrt{r_0}}^\infty s^2(s^2 - 2)e^{-s^2}\,ds < -\frac{\sqrt{2\pi}}{8}.$$
     Hence $g_1(r_0)^2 < \frac{\pi}{4}$ and $g_2(r_0)^2 > \frac{\pi}{32}$, so $F_c(r_0) < \frac{\pi}{4} - c\frac{\pi}{32}$ for every $c \ge 0$.

Finally, for $0 < c < 2$, attaining equality requires $r_0 \in \{0, \infty\}$ ($h(W) = e^{i\alpha}W/|W|$ a.e.), which since $|h(W)| = |\mathbb{E}[\tilde f \mid W]| \le 1$ forces $f(\mathbf{W}_3, \mathbf{Y}) = e^{i\alpha}W/|W|$ a.e. $\square$

**Remark 1.2 (Chirp phases across two diffuse cubics).** For $F_d(W_1, W_2) = \operatorname{ph}(W_1)\exp(i d \operatorname{Im}(\bar W_1 W_2))$ with $x = d^2/4 > 0$, conditioning on $W_1$ gives $\mathbb{E}_{W_2}[\exp(i d \operatorname{Im}(\bar W_1 W_2)) \overline{H_{p_2,q_2}(W_2)}] = \frac{(d\bar W_1/2)^{p_2}(-d W_1/2)^{q_2}}{\sqrt{p_2!q_2!}} e^{-x|W_1|^2}$, yielding the exact rational forms (`verify_two_chaos_diffuse.py`)
$$\|P_{2,1}F_d\|_2^2 = \frac{\pi}{4(1+x)^2}, \qquad \|P_{5,4}F_d\|_2^2 = \frac{\pi(1 + 35x + 43x^2 + 9x^3)}{32(1+x)^5},$$
which strictly lose to $W_1/|W_1|$ for all $0 \le c \le 2$ and $d \ne 0$.

---

### 1.2 General $\mathbb{C}^n$: Equivalence to Conjecture K 3.6 and Universal $\tau^4$ Local Stability (**P + C**, author only)

Let $\rho_* := \sup_{n \ge 1}\sup_{q \in H_{2,1}(\mathbb{C}^n)\setminus\{0\}} \mathbb{E}|q|/\|q\|_2$.

**Theorem 1.3 (General $\mathbb{C}^n$ Two-Chaos Structure).**
1. **Parseval lower bound (**P**):** *For every $c \ge 0$,*
   $$\sup_{n \ge 1}\sup_{|f|=1}\big(\|P_{2,1}f\|_2^2 - c\,\|P_{5,4}f\|_2^2\big) \ge (1 + c)\rho_*^2 - c.$$
   *In particular: at $c = 0$ the sharp bound $\le \frac{\pi}{4}$ is literally Conjecture `K 3.6` ($\rho_* = \frac{\sqrt{\pi}}{2}$); at $c_9 = \frac{5867}{23400}$, proving $\le \frac{\pi}{4} - c_9\frac{\pi}{32}$ forces $\rho_* \le \sqrt{\frac{\frac{\pi}{4} - c_9\frac{\pi}{32} + c_9}{1 + c_9}} = 0.89929843\dots \le 0.899299 < \frac{2289}{2500} = 0.9156$ (`verify_small_t_and_wick.py`).*
2. **Universal $\tau^4$ perturbation formula (**P + C**):** *Let $B \in H_{2,1}(\mathbb{C}^d)$ have $\|B\|_2 = 1$, fourth excess $\chi = \mathbb{E}|B|^4 - 2$, and chaos norms $A_0 = \|P_{2,0}B^2\|_2^2, A_1 = \|P_{3,1}B^2\|_2^2, C_1 = \|P_{1,1}|B|^2\|_2^2, C_2 = \|P_{2,2}|B|^2\|_2^2$, and set $f_\tau(z, W_3) = \operatorname{ph}(W_3 + \tau B(z))$ ($W_3 \sim \mathcal{CN}(0,1)$ diffuse cubic). Then as $\tau \to 0$:*
   $$\begin{aligned}
   \|P_{1,0}f_\tau\|_2^2 &= O(\tau^6), \qquad
   \frac{\|P_{2,1}f_\tau\|_2^2}{\pi} = \frac{1}{4} - \frac{\chi}{32}\tau^4 + O(\tau^6),\\
   \frac{\|P_{3,2}f_\tau\|_2^2}{\pi} &= \left(\frac{1}{64}A_0 + \frac{1}{16}C_1\right)\tau^4 + O(\tau^6), \qquad
   \frac{\|P_{4,3}f_\tau\|_2^2}{\pi} = \left(\frac{1}{64}A_1 + \frac{1}{16}C_2\right)\tau^4 + O(\tau^6),\\
   \frac{\|P_{5,4}f_\tau\|_2^2}{\pi} &= \frac{1}{32} - \left(\frac{7}{384}A_0 + \frac{13}{768}A_1 + \frac{13}{192}C_1 + \frac{25}{384}C_2\right)\tau^4 + O(\tau^6).
   \end{aligned} \tag{1.3}$$
   *Consequently, the two-chaos $\tau^4$ variation is*
   $$\frac{\big(\|P_{2,1}f_\tau\|_2^2 - c\|P_{5,4}f_\tau\|_2^2\big) - \big(\frac{\pi}{4} - c\frac{\pi}{32}\big)}{\pi\tau^4} = \frac{7c - 8}{384}A_0 + \frac{13c - 8}{768}A_1 + \frac{13c - 8}{192}C_1 + \frac{25c - 8}{384}C_2 + O(\tau^2),$$
   *which is **strictly negative for every nonzero $B \in H_{2,1}(\mathbb{C}^d)$ whenever $0 \le c < \frac{8}{25} = 0.32$** (in particular across all of $0 \le c \le 0.3$), whereas for $c > \frac{8}{17} \approx 0.47059$, $B(z_1) = H_{2,1}(z_1)$ gives $+\frac{21}{128}(17c - 8)\pi\tau^4 > 0$, strictly beating $W_3/|W_3|$ in finite dimensions.*

*Proof.*
(1) For any unit-norm $q \in H_{2,1}(\mathbb{C}^n)$, let $f = \operatorname{ph}(q)$ (`= 1` on $\{q=0\}$). Then $\|P_{2,1}f\|_2 \ge \langle f, q\rangle = \mathbb{E}|q|$ while $\|P_{2,1}f\|_2^2 + \|P_{5,4}f\|_2^2 \le \|f\|_2^2 = 1$, so $\|P_{2,1}f\|_2^2 - c\|P_{5,4}f\|_2^2 \ge (1+c)\|P_{2,1}f\|_2^2 - c \ge (1+c)(\mathbb{E}|q|)^2 - c$. Taking the supremum over $q$ gives $(1+c)\rho_*^2 - c$.

(2) Conditioned on $z$, write $B(z) = |B|e^{i\alpha}$. By rotation invariance of $W_3 \sim \mathcal{CN}(0,1)$,
$$M_{p_W, q_W}(\tau B) := \mathbb{E}_{W_3}\!\big[\operatorname{ph}(W_3 + \tau B)\,\overline{H_{p_W, q_W}(W_3)}\big] = e^{i(1 - p_W + q_W)\alpha}\,M_{p_W, q_W}^{\mathrm{rad}}(\tau|B|).$$
Shifting $W_3 \mapsto W_3 - a$ ($a > 0$) and integrating over the angle and radius of $W_3$ gives the exact Taylor polynomials (verified in `verify_t0_refutation_exact.py`):
$$\begin{aligned}
M_{0,0}(\tau B)/\sqrt{\pi} &= \tfrac{1}{2}\tau B - \tfrac{1}{8}\tau^3 B|B|^2 + O(\tau^5), &
M_{1,0}(\tau B)/\sqrt{\pi} &= \tfrac{1}{2} - \tfrac{1}{4}\tau^2|B|^2 + \tfrac{3}{32}\tau^4|B|^4 + O(\tau^6),\\
M_{0,1}(\tau B)/\sqrt{\pi} &= -\tfrac{1}{8}\tau^2 B^2 + O(\tau^4), &
M_{1,1}(\tau B)/\sqrt{\pi} &= -\tfrac{1}{4}\tau B + \tfrac{3}{16}\tau^3 B|B|^2 + O(\tau^5),\\
M_{2,0}(\tau B)/\sqrt{\pi} &= \tfrac{1}{\sqrt{2}}\big(-\tfrac{1}{4}\tau\bar B + \tfrac{3}{16}\tau^3\bar B|B|^2\big) + O(\tau^5), &
M_{2,1}(\tau B)/\sqrt{\pi} &= \tfrac{1}{\sqrt{2}}\big(-\tfrac{1}{4} + \tfrac{3}{8}\tau^2|B|^2 - \tfrac{15}{64}\tau^4|B|^4\big) + O(\tau^6),
\end{aligned}$$
and $M_{0,2}(\tau B) = O(\tau^3 B^3)$. Ambient bidegree $(k+1, k)$ decomposes orthogonally across $(p_W, q_W)$ into $z$-projections $P_{k+1 - 2p_W - q_W,\, k - p_W - 2q_W}^{(z)} M_{p_W, q_W}(\tau B)$ (justified in finite dimensions via $W_{3,m} \to W_3$ in Lemma 2.2 below):
- $k = 0$ ($(1,0)$): only $(p_W,q_W) = (0,0)$ contributes, where $P_{1,0}B = 0$, leaving $P_{1,0}(M_{0,0}) = -\frac{\sqrt{\pi}}{8}\tau^3 P_{1,0}(B|B|^2) + O(\tau^5)$, whose squared norm is $\frac{\pi}{64}\|P_{1,0}(B|B|^2)\|_2^2\tau^6 = O(\tau^6)$.
- $k = 1$ ($(2,1)$): $(1,0)$ gives $P_{0,0}M_{1,0} = \sqrt{\pi}(\frac{1}{2} - \frac{1}{4}\tau^2 + \frac{3(2+\chi)}{32}\tau^4)$, and $(0,0)$ gives $P_{2,1}M_{0,0} = \sqrt{\pi}(\frac{1}{2}\tau B - \frac{1}{8}\tau^3 P_{2,1}(B|B|^2))$ with $\langle B, P_{2,1}(B|B|^2)\rangle = \mathbb{E}|B|^4 = 2 + \chi$. Summing squares cancels $\tau^2$ (`-1/4 + 1/4 = 0`) and leaves $\frac{1}{4} - \frac{\chi}{32}\tau^4 + O(\tau^6)$.
- $k = 2$ ($(3,2)$): $(1,0) \to P_{1,1}(-\frac{\sqrt{\pi}}{4}\tau^2|B|^2)$ gives $\frac{1}{16}C_1\tau^4$; $(0,1) \to P_{2,0}(-\frac{\sqrt{\pi}}{8}\tau^2 B^2)$ gives $\frac{1}{64}A_0\tau^4$; $(0,0) \to P_{3,2}(-\frac{\sqrt{\pi}}{8}\tau^3 B|B|^2)$ is $O(\tau^6)$.
- $k = 3$ ($(4,3)$): $(1,0) \to P_{2,2}(-\frac{\sqrt{\pi}}{4}\tau^2|B|^2)$ gives $\frac{1}{16}C_2\tau^4$; $(0,1) \to P_{3,1}(-\frac{\sqrt{\pi}}{8}\tau^2 B^2)$ gives $\frac{1}{64}A_1\tau^4$; $(1,1)$ and $(2,0)$ have remaining bidegrees $(1,0)$ and $(0,1)$ where $P_{1,0}B = P_{0,1}\bar B = 0$, giving $O(\tau^6)$.
- $k = 4$ ($(5,4)$): five channels contribute through $\tau^4$:
  - $(2,1) \to P_{0,0}$: $\frac{1}{32} - \frac{3}{32}\tau^2 + (\frac{3}{16} + \frac{15}{256}\chi)\tau^4$,
  - $(1,1) \to P_{2,1}$: $+\frac{1}{16}\tau^2 - (\frac{3}{16} + \frac{24}{256}\chi)\tau^4$,
  - $(2,0) \to P_{1,2}$ (since $\bar B \in H_{1,2}$ has $\|\bar B\|_2 = 1$): $+\frac{1}{32}\tau^2 - (\frac{3}{32} + \frac{12}{256}\chi)\tau^4$,
  - $(0,1) \to P_{4,2}$: $+\frac{1}{64}\|P_{4,2}B^2\|_2^2\tau^4 = \frac{1}{64}(2 + \chi - A_0 - A_1)\tau^4$,
  - $(1,0) \to P_{3,3}$: $+\frac{1}{16}\|P_{3,3}|B|^2\|_2^2\tau^4 = \frac{1}{16}(1 + \chi - C_1 - C_2)\tau^4$.
  Summing cancels both $\tau^2$ (`-3/32 + 1/16 + 1/32 = 0`) and the $\chi$-independent $\tau^4$ constants (`3/16 - 3/16 - 3/32 + 1/32 + 1/16 = 0`), leaving $(-\frac{1}{256}\chi - \frac{1}{64}A_0 - \frac{1}{64}A_1 - \frac{1}{16}C_1 - \frac{1}{16}C_2)\tau^4$. Substituting $\chi = \frac{2}{3}A_0 + \frac{1}{3}A_1 + \frac{4}{3}C_1 + \frac{2}{3}C_2$ (`K 6.3.21`) yields (1.3). For every $B \in H_{2,1}(\mathbb{C}^d)$, integrating by parts along the orthonormal family $\{|z_j|^2 - 1\}_{j=1}^d \subset H_{1,1}(\mathbb{C}^d)$ gives $\sum_{j=1}^d \langle |B|^2, |z_j|^2 - 1\rangle = \sum_{j=1}^d \mathbb{E}[|\partial_{z_j}B|^2 + |\partial_{\bar z_j}B|^2] = 3\|B\|_2^2$, so Bessel's inequality and Cauchy–Schwarz yield $C_1 = \|P_{1,1}|B|^2\|_2^2 \ge \frac{1}{d}(3\|B\|_2^2)^2 = \frac{9}{d}\|B\|_2^4 > 0$ whenever $B \ne 0$. Since $A_0, A_1, C_1, C_2 \ge 0$ with $C_1 > 0$, all four coefficients in the two-chaos $\tau^4$ combination are negative and their sum is strictly negative for $0 \le c < 8/25$. At $B(z_1) = H_{2,1}(z_1)$, $(A_0, A_1, C_1, C_2) = (8, 24, 9, 25)$ gives $\frac{21}{128}(17c - 8)\tau^4 > 0$ for $c > 8/17$. $\square$

---

## 2. Task 1b: Refutation of Remote-Only Attainment of $N_9^0$ & Certified Lower Bound $N_9^0 > N_9 + 10^{-5}$

### 2.1 Universal $\tau^4$ Formula for $T_9$ and Finite-Dimensional Realization (**P + C**, author only)

On the $t = 0$ slice $g = -f$ ($f + g = 0 \implies P_{1,0}(f + g) = 0$ identically), the 5-weight payoff of $T_9$ is
$$V_9(f, -f) := \operatorname{Re}\langle f, T_9(-f)\rangle = -\|P_{1,0}f\|_2^2 + a_1\|P_{2,1}f\|_2^2 - a_2\|P_{3,2}f\|_2^2 + a_3\|P_{4,3}f\|_2^2 - a_4\|P_{5,4}f\|_2^2.$$
Combining the five expansions of (1.3) for $f_\tau(z, W_3) = \operatorname{ph}(W_3 + \tau B(z))$ gives (`verify_t0_refutation_exact.py`):
$$\frac{V_9(f_\tau, -f_\tau) - V_9^{\mathrm{rem}}}{\pi\tau^4} = -\frac{508433}{19200000}A_0 + \frac{66677}{19200000}A_1 - \frac{3271}{48000}C_1 + \frac{314687}{9600000}C_2 + O(\tau^2). \tag{2.1}$$
Unlike the two-chaos functional (where all four coefficients are negative) and unlike $T_7$ (§4.1), **the coefficients of $A_1$ ($+0.003473$) and $C_2$ ($+0.032780$) are strictly positive!** Evaluating (2.1) at the one-coordinate cubic junta $B(z_1) = H_{2,1}(z_1)$ (`(A_0, A_1, C_1, C_2) = (8, 24, 9, 25)`) gives the exact rational series:
$$\frac{V_9(f_\tau, -f_\tau) - V_9^{\mathrm{rem}}}{\pi} = +\frac{248589}{3200000}\tau^4 - \frac{667197}{5120}\tau^6 + \frac{219348680259}{12800000}\tau^8 + O(\tau^{10}). \tag{2.2}$$

To promote graded $(z, W_3)$ evaluations to genuine finite-dimensional $\mathbb{C}^n$ responses with **no** loss on negative-weight chaos norms, we record the exact Parseval convergence lemma:

**Lemma 2.2 (Norm-exact finite-dimensional realization of a diffuse cubic bath).** *Fix $\ell \ge 1$ and any measurable odd function $S : \mathbb{C}^\ell \to \mathbb{C}$ ($S(-z) = -S(z)$). On $\mathbb{C}^{\ell + 3m}$ with coordinates $(z, \zeta)$ ($\zeta = (\zeta_{r,1}, \zeta_{r,2}, \zeta_{r,3})_{r=1}^m$), put $\xi_r := \zeta_{r,1}\zeta_{r,2}\bar\zeta_{r,3} \in H_{2,1}(\mathbb{C}^3_r)$, $W_{3,m}(\zeta) := \frac{1}{\sqrt{m}}\sum_{r=1}^m \xi_r$, and $f^{(m)}(z, \zeta) := \operatorname{ph}(W_{3,m}(\zeta) + S(z))$. Then $|f^{(m)}| = 1$ a.e., $f^{(m)}(-z, -\zeta) = -f^{(m)}(z, \zeta)$, $(f^{(m)}, -f^{(m)})$ has $t = 0$, and for every $(P, Q) \in \mathbb{Z}_{\ge 0}^2$:*
$$\lim_{m \to \infty} \big\|P_{P,Q}^{(z,\zeta)} f^{(m)}\big\|_{L^2(\gamma_{\ell+3m})}^2 = \sum_{\substack{p_W, q_W \ge 0 \\ 2p_W + q_W \le P,\, p_W + 2q_W \le Q}} \big\|\big(P_{P - 2p_W - q_W,\, Q - p_W - 2q_W}^{(z)} \otimes P_{H_{p_W, q_W}}^{(W_3)}\big) f\big\|_{L^2(\gamma_\ell \otimes \gamma_1)}^2,$$
*where $f(z, W_3) = \operatorname{ph}(W_3 + S(z))$, $W_3 \sim \mathcal{CN}(0,1)$.*

*Proof.* For each $(p_W, q_W)$ and each $(z$-Hermite index $\alpha)$, let $\Psi_{\alpha, p_W, q_W}^{(m)}(z, \zeta) := H_\alpha(z) \otimes \mathcal{S}_{p_W, q_W}^{(m)}(\zeta)$, where
$$\mathcal{S}_{p_W, q_W}^{(m)}(\zeta) := \frac{1}{\sqrt{p_W! q_W!\, m_{(p_W + q_W)}}} \sum_{\substack{r_1, \dots, r_{p_W}, s_1, \dots, s_{q_W} \in \{1,\dots,m\}\\ \text{all } p_W + q_W \text{ indices distinct}}} \prod_{u=1}^{p_W} \xi_{r_u} \prod_{v=1}^{q_W} \bar\xi_{s_v}$$
($m_{(d)} = m(m-1)\cdots(m-d+1)$). Because the $3$-coordinate blocks $\mathbb{C}^3_r$ are independent and $\xi_r \in H_{2,1}(\mathbb{C}^3_r)$ with $\|\xi_r\|_2 = 1$, the functions $\{\Psi_{\alpha, p_W, q_W}^{(m)}\}$ are **orthonormal** in $L^2(\gamma_{\ell+3m})$, and $\Psi_{\alpha, p_W, q_W}^{(m)} \in H_{p_\alpha + 2p_W + q_W,\, q_\alpha + p_W + 2q_W}(\mathbb{C}^{\ell+3m})$. Moreover, by Newton's identities expressing elementary/monomial symmetric sums of $(\xi_r, \bar\xi_r)$ in terms of power sums (where $m^{-1}\sum_{r=1}^m |\xi_r|^2 \to 1$ in $L^p$ and all higher collision power sums $m^{-(a+b)/2}\sum_{r=1}^m \xi_r^a \bar\xi_r^b \to 0$ in $L^p$ for $a + b \ge 3$), $\mathcal{S}_{p_W, q_W}^{(m)}(\zeta) - H_{p_W, q_W}(W_{3,m}(\zeta)) \to 0$ in $L^2(\gamma_{3m})$. Since $(z, W_{3,m}) \Rightarrow (z, W_3)$ with $\mathbb{P}(W_3 + S(z) = 0) = 0$ and $\operatorname{ph}$ is continuous off $0$ and bounded by $1$, $\langle f^{(m)}, \Psi_{\alpha, p_W, q_W}^{(m)}\rangle \to \langle f, H_\alpha \otimes H_{p_W, q_W}\rangle$ for every $(\alpha, p_W, q_W)$. Finally, by Parseval on $L^2(\gamma_\ell \otimes \gamma_1)$,
$$\sum_{\alpha, p_W, q_W} \big|\langle f, H_\alpha \otimes H_{p_W, q_W}\rangle\big|^2 = \|f\|_2^2 = 1 = \big\|f^{(m)}\big\|_2^2.$$
For any finite precision $\varepsilon > 0$, choose a finite set $\mathcal{F}$ of $(\alpha, p_W, q_W)$ carrying $\ge 1 - \varepsilon$ of $\|f\|_2^2 = 1$. For large $m$, $\sum_{\mathcal{F}} |\langle f^{(m)}, \Psi^{(m)}\rangle|^2 \ge 1 - 2\varepsilon$, so the total $L^2$ norm squared of $f^{(m)}$ orthogonal to $\operatorname{span}\{\Psi_{\alpha,p_W,q_W}^{(m)} : (\alpha, p_W, q_W) \in \mathcal{F}\}$ is $\le 2\varepsilon$. Projecting onto $H_{P,Q}(\mathbb{C}^{\ell+3m})$ proves convergence of $\|P_{P,Q}^{(z,\zeta)} f^{(m)}\|_2^2$ to the stated sum. $\square$

---

### 2.2 Exact Hankel Identity & Certified Finite-Parameter Bounds (**P + C**, author only)

Let $S_\ell(z) := \tau\sum_{j=1}^\ell h(z_j)$ where $h(r e^{i\theta}) = h_{\mathrm{rad}}(r)e^{i\theta}$ with $h_{\mathrm{rad}}(r) = H_{2,1}^{\mathrm{rad}}(r) + \alpha_{3,2} H_{3,2}^{\mathrm{rad}}(r)$, and $f(z, W_3) = \operatorname{ph}(W_3 + S_\ell(z))$.

**Lemma 2.3 (Exact Hankel–Bessel representation).** *For every $p_W, q_W \ge 0$ and every multiset $\mathbf{t} = ((p_1, q_1), \dots, (p_s, q_s))$ of nonzero bidegrees ($s \le \ell$) with $2p_W + q_W + \sum_{a=1}^s p_a = k+1$ and $p_W + 2q_W + \sum_{a=1}^s q_a = k$, the inner product $c_{p_W, q_W, \mathbf{t}} := \langle f, H_{p_W, q_W}(W_3)\prod_{a=1}^s H_{p_a, q_a}(z_a)\rangle$ equals*
$$c_{p_W, q_W, \mathbf{t}} = (-1)^{(p_W + q_W + \sum_{a=1}^s |p_a - q_a| - 1)/2} \int_0^\infty \frac{(\kappa/2)^{p_W + q_W}}{\sqrt{p_W! q_W!}}\, e^{-\kappa^2/4}\, F_{0,0}(\kappa)^{\ell - s} \prod_{a=1}^s F_{p_a, q_a}(\kappa)\,\frac{d\kappa}{\kappa}, \tag{2.3}$$
*where $F_{p,q}(\kappa) := \int_0^\infty 2r e^{-r^2} R_{p,q}(r)\, J_{|p-q|}\big(\tau\kappa\, h_{\mathrm{rad}}(r)\big)\,dr$.*

*Proof.* For any $Z = |Z|e^{i\Theta} \in \mathbb{C}\setminus\{0\}$, $\int_0^\infty J_1(\kappa|Z|)\frac{d\kappa}{\kappa} = \int_0^\infty J_1(x)\frac{dx}{x} = 1$, and for all $0 < \varepsilon < K < \infty$,
$$I_{\varepsilon, K}(Z) := \int_\varepsilon^K e^{i\Theta} J_1(\kappa|Z|)\,\frac{d\kappa}{\kappa} = \int_\varepsilon^K \left(\frac{1}{2\pi i}\int_0^{2\pi} e^{i\psi}\exp\!\big(i\kappa\operatorname{Re}(e^{-i\psi}Z)\big)\,d\psi\right)\frac{d\kappa}{\kappa}$$
satisfies $|I_{\varepsilon, K}(Z)| \le 2\sup_{Y > 0}\big|\int_0^Y J_1(x)\frac{dx}{x}\big| < 4$ uniformly in $(\varepsilon, K, Z)$ and $I_{\varepsilon, K}(Z) \to Z/|Z|$ everywhere on $\mathbb{C}\setminus\{0\}$. Since $\mathbb{P}(W_3 + S_\ell(z) = 0) = 0$ and every Hermite basis element $\Phi \in L^2$ is in $L^1$, Dominated Convergence swaps $\lim_{\varepsilon\to 0^+, K\to\infty}$ with $\mathbb{E}$, and Fubini on the compact rectangle $[\varepsilon, K]\times[0, 2\pi]$ factors the independent expectations over $W_3, z_1, \dots, z_\ell$:
- $\mathbb{E}_{W_3}[\overline{H_{p_W, q_W}(W_3)}\exp(i\kappa\operatorname{Re}(e^{-i\psi}W_3))] = \frac{(i\kappa e^{-i\psi}/2)^{p_W}(i\kappa e^{i\psi}/2)^{q_W}}{\sqrt{p_W!q_W!}} e^{-\kappa^2/4}$,
- $\mathbb{E}_{z}[\overline{H_{p,q}(z)}\exp(i\kappa\tau h_{\mathrm{rad}}(|z|)\cos(\theta - \psi))] = e^{-i(p-q)\psi}\, i^{|p-q|} F_{p,q}(\kappa)$,
using $\frac{1}{2\pi}\int_0^{2\pi} e^{-i m \phi + i x \cos\phi}d\phi = i^{|m|} J_{|m|}(x)$ for all $m \in \mathbb{Z}, x \in \mathbb{R}$. Since $(2p_W + q_W + \sum p_a) - (p_W + 2q_W + \sum q_a) = p_W - q_W + \sum(p_a - q_a) = 1$, the $\psi$-phase $e^{i(1 - (p_W - q_W) - \sum(p_a - q_a))\psi} \equiv 1$, and $i^{p_W + q_W + \sum|p_a - q_a| - 1} = (-1)^{(p_W + q_W + \sum|p_a - q_a| - 1)/2}$. $\square$

**Theorem 2.4 (Certified Refutation & Lower Bound on $N_9^0$, **P + C**, author only).**
1. *At $\ell = 1, \tau = \frac{1}{50}, \alpha_{3,2} = 0$, outward integer interval arithmetic (`verify_t0_refutation_exact.py`, Part 2a) certifies*
   $$V_9(f_{1, 1/50}, -f_{1, 1/50}) - V_9^{\mathrm{rem}} \in [+1.3995 \times 10^{-8},\, +1.4319 \times 10^{-8}] > 0.$$
   *By Lemma 2.2, $N_9^0$ is strictly larger than $V_9^{\mathrm{rem}}$ and is **not** attained by $(W_3/|W_3|, -W_3/|W_3|)$.*
2. *At $\ell = 1600, \tau = \frac{1}{20}, \alpha_{3,2} = \frac{3}{250}$, outward integer interval arithmetic (`verify_t0_refutation_exact.py`, Part 2b: exact incomplete-Gamma polynomial expansion on $r^2 \in [0, 26]$, alternating Bessel tail + $[26, \infty)$ tail bounds, 2-point Gauss–Legendre with rigorous 4-jet $(h^5/4320)g^{(4)}$ remainder on $180$ panels of $\kappa \in [0, 13.5]$, plus $\kappa \ge 13.5$ Gaussian tail) certifies*
   $$V_9(f_{1600, 1/20}, -f_{1600, 1/20}) \in [0.71214069,\, 0.71214162] > 0.712110 \ge N_9 + 10^{-5}.$$
   *By Lemma 2.2, in sufficiently high finite dimension $\mathbb{C}^{1600 + 3m}$,*
   $$N(\lambda_9) \ge N_9^0 > 0.71214069 \qquad \left(\frac{1}{N(\lambda_9)} \le \frac{1}{N_9^0} < 1.404218\right).$$

### 2.3 Pure $\mathbb{C}^\ell$ Asymptotics (**P + C**) and Multi-Mode Numerical Maxima (**N**)

- **Exact parameter-free $\mathbb{C}^\ell$ series (**P + C**, `verify_t0_refutation_exact.py` Part 1d):** Without any diffuse bath ($f_\ell(z) = \operatorname{ph}(\sum_{j=1}^\ell H_{2,1}(z_j)), g_\ell = -f_\ell$ directly on $\mathbb{C}^\ell$), expanding (2.3) in $1/\ell$ yields
  $$\frac{V_9(f_\ell, -f_\ell)}{\pi} = \frac{181333}{800000} + \frac{248589}{3200000}\,\frac{1}{\ell} - \frac{4371711867}{25600000}\,\frac{1}{\ell^2} + O(\ell^{-3}). \tag{2.4}$$
- **Numerical values (**N**, `probe_multimode_hankel.py`):**

| Family (all with $g = -f$, $t = 0$) | Dimension | $V_9(f, -f)$ | Excess over $V_9^{\mathrm{rem}}$ | $1 / V_9$ |
|---|---|---|---|---|
| Diffuse remote-only $W_3/|W_3|$ | limit | `0.7120930258` | `0` | `1.4043109` |
| Pure cubic sum $\operatorname{ph}(\sum_{j=1}^{4000} H_{2,1}(z_j))$ | $\mathbb{C}^{4000}$ | `0.7121212796` | `+2.825e-5` | `1.4042552` |
| Pure 2-mode $\operatorname{ph}(\sum_{j=1}^{1200}[H_{2,1} + \frac{3}{250}H_{3,2}])$ | $\mathbb{C}^{1200}$ | `0.7121471690` | `+5.414e-5` | `1.4042041` |
| Pure 2-mode $\operatorname{ph}(\sum_{j=1}^{1600}[H_{2,1} + \frac{3}{250}H_{3,2}])$ | $\mathbb{C}^{1600}$ | **`0.7121603877`** | `+6.736e-5` | **`1.4041781`** |
| Pure 4-mode $\operatorname{ph}(\sum_{j=1}^{1500}\sum_{m=1}^4 \alpha_m H_{m+1,m})$ | $\mathbb{C}^{1500}$ | `0.7121541107` | `+6.108e-5` | `1.4041904` |
| Bath + 1600-spike ($\tau = 1/20, \alpha_{3,2} = 3/250$) | $\mathbb{C}^{1600+3m}$ | **`0.7121411856`** (**C**: `> 0.71214069`) | `+4.816e-5` | `1.4042159` |
| Bath + 1600-spike ($\tau = 2/25, \alpha_{3,2} = 3/250$) | $\mathbb{C}^{1600+3m}$ | `0.7121541779` | `+6.115e-5` | `1.4041903` |

*Why the cutting-plane search (`PD2` / `HD 1.6`) missed this:* `PD2`'s oracles tested `W3`, `W3+W5`, `h∘ρ` (single-coordinate radial preprocessing), and `Z3`/`Z4` ($n \le 4$). At $n = 1..4$, the $-\frac{170.77\pi}{\ell^2}$ penalty crushes the $+\frac{0.07768\pi}{\ell}$ gain; the gain emerges only for mesoscopic $\ell \sim 10^3$, where each coordinate sits at weak amplitude $\tau \sim \ell^{-1/2}$ against the collective CLT bath of the other $\ell - 1$ coordinates.

---

## 3. Task 2: Small-$t$ Bounds $V \le A t^2 + B$ for $T_9$

Write $h = (f + g)/2, k = (f - g)/2$, so $|h|^2 + |k|^2 = 1$, $t = \|P_{1,0}h\|_2$, and
$$\operatorname{Re}\langle f, T_9 g\rangle = \langle h, T_9 h\rangle - \langle k, T_9 k\rangle.$$

### 3.1 Two Exact Obstructions (**P + C**)

The [independent derivation and replay](https://github.com/agalatan/grothendieck-lean/issues/776#issuecomment-7239966106) covers the clipped obstructions and the dual and primal radius thresholds.

**Proposition 3.1 (Failure of the `SMALL_T` Parseval step at degrees 7 and 9).** *If $a_2\|P_{3,2}h\|_2^2$ (and $a_4\|P_{5,4}h\|_2^2 \le a_2\|P_{5,4}h\|_2^2$) is bounded via Parseval $\le a_2(\|h\|_2^2 - t^2) = a_2(1 - \|k\|_2^2 - t^2)$ as in `SMALL_T.md` / `HD 4.18`, then for any $G_3 \in H_{2,1}$ and any $C_9 \in H_{5,4}$, the resulting pointwise clipped upper bound at $t = 0$ is*
$$\mathbb{E}\!\left[2|G_3 + C_9| + \frac{(a_2 - |G_3 + C_9|)_+^2}{a_2}\right] - \frac{\|G_3\|_2^2}{a_1} + \frac{\|C_9\|_2^2}{a_4}.$$
- *For $T_9$: since $2x + \frac{(a_2 - x)_+^2}{a_2} = a_2 + \frac{x^2}{a_2} \ge a_2$ for $0 \le x \le a_2$ and $2x \ge 2a_2 > a_2$ for $x \ge a_2$, even at $G_3 = 0$ and **every** $C_9 \in H_{5,4}$ this bound is $\ge a_2 + \frac{\|C_9\|_2^2}{a_4} \ge a_2 = \frac{72057}{100000} = 0.72057 > \frac{250}{351} = 0.71225071\dots$.*
- *For $T_7$ ($C_9 = 0$): at $G_3 = \frac{3}{4}W_3$, exact evaluation (`verify_small_t_and_wick.py`) certifies value $\ge 0.75146 > \frac{250}{351}$ (`0.75146612\dots`).* To realize this obstruction in the supremum over finite cubics, take $W_{3,m}=m^{-1/2}\sum_{j=1}^m z_{3j-2}z_{3j-1}\bar z_{3j}$ on disjoint triples. The complex central limit theorem gives $W_{3,m}\Rightarrow W_3$. Their second moments are one, ensuring uniform integrability of the clipped integrand, which grows at most linearly.

**Proposition 3.2 (Necessary radius caps for $B < 250/351$, `verify_small_t_and_wick.py`).** *Consider a certificate of $\operatorname{Re}\langle f,T_dg\rangle\le At^2+B$ on a band containing $t=0$, with $B<250/351$. Its radius implications depend on which penalties it retains.*
1. **Standard dual / zero-odd-leakage constraint:** *In any dual certificate at $t = 0$ that drops the nonpositive $k$-penalties $-\|P_{1,0}k\|_2^2 - a_2\|P_{3,2}k\|_2^2 \le 0$ (as in `HD 4.11`–`4.12`, `SMALL_T.md`, and (3.1)–(3.2) below), testing $g=-f$ for every unimodular $f$ gives $h=0$, $k=f$. The radius statements follow by specializing to $f=\operatorname{ph}(q)$, for which $\|P_{2,1}f\|_2\ge\mathbb E|q|$ when $\|q\|_2=1$. Thus*
   - *for $T_7$: $a_{1,7}\rho_*^2 \le B < \frac{250}{351} \implies \rho_* \le \sqrt{\frac{125000000}{159107598}} = 0.88635877\dots \le 0.886359$ (within $1.32 \times 10^{-4}$ of $\frac{\sqrt{\pi}}{2} = 0.88622692\dots$, matching #523);*
   - *for $T_9$: $\sup_{n,|f|=1}(\|P_{2,1}f\|_2^2 - c_9\|P_{5,4}f\|_2^2) \le \frac{250/351}{a_1} = \frac{31250}{41067} \approx 0.76095162$, which by Theorem 1.3(1) forces $\rho_* < \sqrt{8309317/10272717} < 0.899374 < \frac{2289}{2500} = 0.9156$ (strictly beyond `K 3.7`).*
   *For a primal certificate the same test applies to individual $f$ satisfying $P_{1,0}f=P_{3,2}f=0$. When $f=\operatorname{ph}(q)$ is restricted this way, the resulting radius bound concerns the supremum over those $q$.*

   **Leakage tests.** For the unit cubic $q=z_1z_2\bar z_3$, $f=\operatorname{ph}(q)$ is invariant under $\operatorname{diag}(\omega,\omega,\omega^2)$, where $\omega=e^{2\pi i/3}$. This symmetry has no fixed coordinate, so $P_{1,0}f=0$ as in ledger 4.14. Yet the unit vector $v=z_1(|z_1|^2-2)z_2\bar z_3/\sqrt2$ belongs to $H_{3,2}$. Independence and $R=|z_j|^2\sim\mathrm{Exp}(1)$ give
   \[
   \mathbb E[\bar v f]
     =\frac{\Gamma(5/2)-2\Gamma(3/2)}{\sqrt2}\,\Gamma(3/2)^2
     =-\frac{\pi^{3/2}}{16\sqrt2},\qquad \|P_{3,2}f\|_2^2\ge\frac{\pi^3}{512}>0.
   \]
   The linear penalty can also occur for a physical cubic. For $q=z(|z|^2-2)/\sqrt2$, $\mathbb E[\bar z\operatorname{ph}(q)]=2\mathbb E[\sqrt R\,1_{R>2}]-\sqrt\pi/2$. By Cauchy–Schwarz the tail expectation is at most $\sqrt{\mathbb E[R\,1_{R>2}]\Pr(R>2)}=\sqrt3 e^{-2}$, so the coefficient is below $-2/5$. Each pair $(f,-f)$ has $t=0$.
2. **Unconditional primal Parseval constraint on all of $H_{2,1}$:** *Even without symmetry or dual relaxation, testing $f = \operatorname{ph}(q), g = -f$ ($t = 0$) and bounding $\|P_{1,0}f\|_2^2 + a_2\|P_{3,2}f\|_2^2 + a_4\|P_{5,4}f\|_2^2 \le 1 - \|P_{2,1}f\|_2^2$ gives $(1 + a_1)\rho_*^2 - 1 \le N_d^0 \le B < \frac{250}{351}$, forcing $\rho_* \le 0.94767$ (`0.94766390\dots`) at degree 7 and $\rho_* \le 0.94044$ (`0.94043980\dots`) at degree 9.*

---

### 3.2 Exact Multi-Chaos Gate-Free Bound $V \le t^2 + B^*$ and Global Gaussian Ideal (**P + C**, author only)

Instead of applying Parseval to $P_{3,2}h$, retain $\langle h, P_{1,0}h\rangle = t^2$ directly and drop only the nonpositive terms $-a_1\|P_{2,1}h\|_2^2 - a_3\|P_{4,3}h\|_2^2$ on $h$ and $-\|P_{1,0}k\|_2^2 - a_2\|P_{3,2}k\|_2^2$ on $k$:
$$\operatorname{Re}\langle f, T_9 g\rangle \le t^2 + \Big(a_2\|P_{3,2}h\|_2^2 + a_4\|P_{5,4}h\|_2^2 + a_1\|P_{2,1}k\|_2^2 + a_3\|P_{4,3}k\|_2^2 - a_4\|P_{5,4}k\|_2^2\Big). \tag{3.1}$$
Using $\|X\|_2^2 = \sup_{G}\big(2\operatorname{Re}\langle G, X\rangle - \|G\|_2^2\big)$ on the four positive chaos norms and bounding $-\|P_{5,4}k\|_2^2 \le -2\operatorname{Re}\langle C_9, k\rangle + \|C_9\|_2^2$ for any $C_9 \in H_{5,4}$, write $2\operatorname{Re}\langle H_{\mathrm{ev}}, h\rangle + 2\operatorname{Re}\langle K_{\mathrm{odd}}, k\rangle = \operatorname{Re}\langle H_{\mathrm{ev}} + K_{\mathrm{odd}}, f\rangle + \operatorname{Re}\langle H_{\mathrm{ev}} - K_{\mathrm{odd}}, g\rangle \le \mathbb{E}|H_{\mathrm{ev}} + K_{\mathrm{odd}}| + \mathbb{E}|H_{\mathrm{ev}} - K_{\mathrm{odd}}|$ for $|f|, |g| \le 1$, where $H_{\mathrm{ev}} = G_5 + G_9^+ \in H_{3,2} \oplus H_{5,4}$ and $K_{\mathrm{odd}} = G_3 + G_7 - C_9 \in H_{2,1} \oplus H_{4,3} \oplus H_{5,4}$ (replacing $C_9 \mapsto -C_9$ for sign convenience so $K_{\mathrm{odd}} = G_3 + G_7 + C_9$). This proves:

**Theorem 3.3 (Multi-Chaos Gate-Free Small-$t$ Bound & Global Gaussian Ideal).**
1. **Exact reduction (**P**):** *For every dimension $n \ge 1$ and every unimodular pair $(f, g)$ with $t = \|P_{1,0}(f+g)/2\|_2$,*
   $$\operatorname{Re}\langle f, T_9 g\rangle \le t^2 + B_9^*, \qquad B_9^* := \sup_{\substack{G_3 \in H_{2,1},\, G_5 \in H_{3,2}\\ G_7 \in H_{4,3},\, G_9^+ \in H_{5,4}}} \inf_{C_9 \in H_{5,4}} \Psi_9(G_3, G_5, G_7, G_9^+; C_9), \tag{3.2}$$
   *where $\Psi_9 = \mathbb{E}|H_{\mathrm{ev}} + K_{\mathrm{odd}}| + \mathbb{E}|H_{\mathrm{ev}} - K_{\mathrm{odd}}| - \frac{\|G_3\|_2^2}{a_1} - \frac{\|G_5\|_2^2}{a_2} - \frac{\|G_7\|_2^2}{a_3} - \frac{\|G_9^+\|_2^2}{a_4} + \frac{\|C_9\|_2^2}{a_4}$, $H_{\mathrm{ev}} = G_5 + G_9^+$, $K_{\mathrm{odd}} = G_3 + G_7 + C_9$.*
2. **Global Gaussian-ideal certification (**P + C**, `verify_small_t_and_wick.py`):** *In the diffuse Gaussian ideal where $G_{2k+1} = \sigma_{2k+1} W_{2k+1}$ for independent $W_3, W_5, W_7, W_9 \sim \mathcal{CN}(0,1)$ and $C_9 = \beta H_{2,1}(W_3)$, choosing the explicit multiplier rule $\beta(\sigma_3,v) = 0$ for $\sigma_3 < \frac{82}{100}\sigma_3^*$ (or $v \ge \frac{9}{100}$ on $[0.82, 0.95]\sigma_3^*$) and $\beta(\sigma_3,v) = \frac{a_4}{2\sqrt{2}a_1}\sigma_3$ otherwise ($\sigma_3^* = \frac{\sqrt{\pi}}{2}a_1$), we have globally over all $(\sigma_3, \sigma_5, \sigma_7, \sigma_9) \in [0, \infty)^4$:*
   $$B_9^{*,\mathrm{Gauss}} = a_1\frac{\pi}{4} - a_4\frac{\pi}{32} = \frac{181333}{800000}\,\pi = 0.7120930258167475\dots$$
   *(Conditional consequence: under any multi-chaos sector bound $B_9^* \le B_0 < \frac{250}{351}$, $\operatorname{Re}\langle f, T_9 g\rangle < \frac{250}{351}$ holds for $0\le t<t_0 := \sqrt{\frac{250}{351} - B_0}$, with the non-strict bound at $t=t_0$; at $B_0 = B_9^{*,\mathrm{Gauss}}$, $t_0 \ge 0.012557$; at $B_0 = 0.71216$, $t_0 \ge 0.009524$.)*

*Proof of (2).* Write $\sigma=\sigma_3$, $\sigma_* = a_1\sqrt\pi/2$, $\lambda=\sigma/\sigma_*$, and $B=(a_1/4-a_4/32)\pi$. In the nonzero branch set $\gamma=\beta/(\sqrt2\,\sigma)=a_4/(4a_1)$. Then $m(W)=\sigma W[1+\gamma(|W|^2-2)]$ has the phase of $W$ because $1-2\gamma>0$. At $v=0$, using $\mathbb E|W|=\sqrt\pi/2$ and $\mathbb E[|W|(|W|^2-2)]=-\sqrt\pi/4$, the exact objective is
\[
  2\mathbb E|m(W)|-\sigma^2/a_1+\beta^2/a_4
   =\pi\left[\frac{a_1}{2}(1-\gamma/2)\lambda
       -\left(\frac{a_1}{4}-\frac{a_1^2\gamma^2}{2a_4}\right)\lambda^2\right]
   =B\lambda(2-\lambda).
\]
At $\lambda=1$, using half of this $\beta$ instead gives $B+\pi a_4/128=(731199/3200000)\pi>250/351$.

This also gives a lower bound for the supremum of the infima. Fix $\lambda=1$, $v=0$ and $f=\operatorname{ph}(W_3)$. For every allowed $C_9$, the supporting inequality $|\sigma_*W_3+C_9|\ge\operatorname{Re}[\bar f(\sigma_*W_3+C_9)]$ and completing the square in $C_9$ give $\Psi_9\ge a_1\pi/4-a_4\|P_{5,4}f\|_2^2$. In the diffuse graded space this projection has only the $H_{2,1}(W_3)$ component: $f$ depends only on $W_3$ and has charge one, and grade nine requires Hermite degree three in $W_3$. Its coefficient is $-\sqrt\pi/(4\sqrt2)$ by the same moments, so the lower bound is $B$. The chosen $C_9$ attains it at this point.

Conditioned on $W_3$, both $H_{\mathrm{ev}} \pm (\sigma_7 W_7 + m(W_3))$ have the law of $\pm m(W_3) + \sqrt{v}\,Z$ where $Z \sim \mathcal{CN}(0,1)$, $v = \sigma_5^2 + \sigma_7^2 + \sigma_9^2 \ge 0$, and $m(W_3) = W_3(\sigma_3 + \beta\frac{|W_3|^2 - 2}{\sqrt{2}})$. Since $a_2 > a_3 > a_4$, $-\frac{\sigma_5^2}{a_2} - \frac{\sigma_7^2}{a_3} - \frac{\sigma_9^2}{a_4} \le -\frac{v}{a_2}$. By the 2D heat equation ($\Delta_{\mathbb{R}^2}|w| = |w|^{-1}$) and Weber's Bessel integral, for $v > 0$,
$$\frac{\partial}{\partial v}\Big[2\,\mathbb{E}_{Z}|m + \sqrt{v}\,Z|\Big] = \frac{1}{2}\,\mathbb{E}_Z\!\left[\frac{1}{|m + \sqrt{v}\,Z|}\right] = \frac{\sqrt{\pi}}{2\sqrt{v}}\,e^{-x} I_0(x) = \frac{\sqrt{2\pi x}\,e^{-x} I_0(x)}{2|m|}, \qquad x = \frac{|m|^2}{2v}.$$
Since $e^{-x} I_0(x) = \frac{1}{\pi}\int_0^\pi e^{-x(1-\cos\theta)}d\theta \le 1$ is strictly decreasing in $x \ge 0$, `verify_small_t_and_wick.py` certifies: (i) $\sup_{x > 0}\sqrt{2\pi x}e^{-x}I_0(x) < \frac{6}{5}$ and $\sup_{x \ge 3} < \frac{27}{25}$, $\sup_{x \ge 8} < \frac{104}{100}$ (via $u = \sin(\theta/2)$ analytic tail on $[16, \infty)$ plus 800 monotone rational intervals on $(0, 16]$); (ii) for $\lambda = \sigma_3/\sigma_3^* \ge \frac{95}{100}$ with the nonzero multiplier above, $\sup_{v>0}\partial_v(2\mathbb E|m+\sqrt v Z|)<1.3762 < \frac{1}{a_2} = 1.38779$, so the upper envelope with penalty $-v/a_2$ decreases in $v$ and $\Psi(\sigma_3, v) \le \Psi(\sigma_3, 0) = \lambda(2 - \lambda)B_9^{*,\mathrm{Gauss}} \le B_9^{*,\mathrm{Gauss}}$; (iii) for $\lambda \le \frac{82}{100}$ with $\beta = 0$, $2\mathbb{E}|\sigma_3 W_3 + \sqrt{v}Z| = \sqrt{\pi}\sqrt{\sigma_3^2 + v}$ gives global maximum $< 0.7114 < B_9^{*,\mathrm{Gauss}}$; and (iv) on $\lambda \in [\frac{82}{100}, \frac{95}{100}]$, $\beta = 0$ closes $v \ge \frac{9}{100}$ while scaling the derivative of $2\mathbb E|m+\sqrt v Z|$ closes $v \in [0, \frac{9}{100}]$ across 65 rational slices. $\square$

---

### 3.3 The Cubic-Tied $H_{5,4}$ Multiplier $R_9(q)$ and Bargmann Sum-of-Squares Floor (**P + C**, author only)

For a general unit-norm cubic $q(z) = \frac{1}{\sqrt{2}}\sum_{i,j,k=1}^n T_{ij,k} :z_i z_j \bar z_k: \in H_{2,1}(\mathbb{C}^n)$ ($T_{ij,k} = T_{ji,k}$, $\sum_{i,j,k}|T_{ij,k}|^2 = \|q\|_2^2 = 1$), the natural cubic-tied $H_{5,4}$ multiplier is
$$R_9(q) := P_{5,4}\!\left[\frac{1}{\sqrt{2}}\,q\big(|q|^2 - 2\big)\right] = \frac{1}{\sqrt{2}}\,P_{5,4}(q^2\bar q) = \frac{1}{4}\sum T_{i_1 i_2, k_1} T_{i_3 i_4, k_2} \overline{T_{j_1 j_2, l_1}} :z_{i_1}z_{i_2}z_{i_3}z_{i_4}z_{l_1}\bar z_{j_1}\bar z_{j_2}\bar z_{k_1}\bar z_{k_2}:,$$
since every internal Wick contraction between the three factors drops total bidegree below $(5,4)$ and is annihilated by $P_{5,4}$. Define the two Hermitian PSD Gram matrices $N_{ab} := \sum_{i,j} T_{ij,a}\overline{T_{ij,b}}$ and $M_{ab} := \sum_{j,k} T_{aj,k}\overline{T_{bj,k}}$ ($\operatorname{tr} N = \operatorname{tr} M = 1$).

**Theorem 3.4 (Bargmann SOS Identity & Universal Norm Floor for $R_9(q)$).** *For every $n \ge 1$ and every unit-norm $q \in H_{2,1}(\mathbb{C}^n)$:*
1. **Wick classification (**C**, `verify_small_t_and_wick.py`):** *The $5!\cdot 4! = 2880$ bipartite Wick contractions of $\|R_9(q)\|_2^2$ decompose into $19$ real isomorphism classes: $1$ disconnected `[2,2,2]` class ($16$ matchings, value $1$), $4$ `[2,4]` classes ($336$ matchings), and $14$ connected `[6]` classes ($2528$ matchings).*
2. **Bargmann representation & universal floor (**P**):** *Putting $F_T(w, \bar\zeta) := \frac{1}{\sqrt{2}}\sum_{i,j,k} T_{ij,k} w_i w_j \bar\zeta_k$ on independent $w, \zeta \sim \mathcal{CN}(0, I_n)$,*
   $$\|R_9(q)\|_2^2 = \frac{1}{2}\,\mathbb{E}_{w,\zeta}\!\Big[|F_T(w, \bar\zeta)|^4\,|F_T(\zeta, \bar w)|^2\Big] \ge 1 + \operatorname{tr}(N^2) + 4\operatorname{tr}(M^2) + 4\operatorname{tr}(N^\top M) \ge 1 + \frac{9}{n} > 1.$$
   *There exists a unit cubic attaining the floor $1+9/n$ if and only if $3\mid n$.*

*Proof of (2).* In $\mathcal{F}_{\mathrm{hol}}(\mathbb{C}^n_w) \otimes \mathcal{F}_{\mathrm{anti}}(\mathbb{C}^n_\zeta)$, the monomials $:z_A \bar z_B:$ of $H_{5,4}(\mathbb{C}^n)$ have identical inner products to $w_A \bar\zeta_B$ because $w$ and $\zeta$ are independent standard complex Gaussians, giving $\|R_9(q)\|_2^2 = \frac{1}{2}\mathbb{E}_{w,\zeta}|F_T(w, \bar\zeta)^2 \overline{F_T(\zeta, \bar w)}|^2$.
For any holomorphic $P(w)$ and linear form $L(w) = v\cdot w$ on $\mathbb{C}^n$, Bargmann integration by parts ($\bar w_j e^{-|w|^2} = -\partial_{w_j} e^{-|w|^2}$, or monomial expansion in an eigenbasis of $v v^*$) gives the exact identity
$$\mathbb{E}_w\!\big[|P(w)|^2\,|v\cdot w|^2\big] = \|v\|^2\,\mathbb{E}_w|P(w)|^2 + \mathbb{E}_w\!\big[|(v^*\cdot\nabla_w)P(w)|^2\big]. \tag{3.3}$$
1. Fix $\zeta$ and apply (3.3) in $w$ with $P(w) = F_T(w, \bar\zeta)^2$ and $L(w) = \overline{F_T(\zeta, \bar w)} = \overline{u(\zeta)}\cdot w$, where $u_k(\zeta) = \frac{1}{\sqrt{2}}\sum_{i,j} T_{ij,k}\zeta_i\zeta_j$:
   $$\|R_9(q)\|_2^2 = \frac{1}{2}\,\mathbb{E}_{w,\zeta}\!\Big[|F_T(w, \bar\zeta)|^4\,\|u(\zeta)\|^2\Big] + 2\,\mathbb{E}_{w,\zeta}\!\Big[|F_T(w, \bar\zeta)|^2\,\big|(u(\zeta)\cdot\nabla_w)F_T(w,\bar\zeta)\big|^2\Big].$$
2. Drop the second (nonnegative) integral, swap $\mathbb{E}_w$ and $\mathbb{E}_\zeta$ by Tonelli, and for fixed $w$ write $\overline{F_T(w, \bar\zeta)} = m(w)\cdot\zeta$ (**linear** holomorphic in $\zeta$!), where $m_a(w) = \frac{1}{\sqrt{2}}\sum_{i,j}\overline{T_{ij,a}}\bar w_i\bar w_j$. Applying (3.3) twice in $\zeta$ to $|u_k(\zeta)|^2\,|m(w)\cdot\zeta|^4$ and summing over $k = 1, \dots, n$ ($\sum_k \|u_k\|_2^2 = 1$) gives
   $$\frac{1}{2}\sum_{k=1}^n \mathbb{E}_\zeta\!\big[|u_k(\zeta)|^2\,|m(w)\cdot\zeta|^4\big] = \|m(w)\|^4 + 2\|m(w)\|^2\sum_{k=1}^n \|(m(w)^*\cdot\nabla_\zeta)u_k\|_2^2 + \frac{1}{2}\sum_{k=1}^n \|(m(w)^*\cdot\nabla_\zeta)^2 u_k\|_2^2.$$
3. Write $D=N^\top$. Then $\mathbb E_w[mm^*]=D$, while the derivative in step 2 gives
   \[
   \sum_k\|(m^*\cdot\nabla_\zeta)u_k\|_2^2
   =2\sum_{j,k}\left|\sum_a\bar m_a T_{aj,k}\right|^2=2m^*Mm.
   \]
   For symmetric complex matrices $A,B$ and $P_A(\bar w)=\bar w^\top A\bar w/\sqrt2$, the 24 Wick pairings give
   \[
     \mathbb E|P_A P_B|^2=\|A\|_F^2\|B\|_F^2+|\langle A,B\rangle_F|^2+
           4\,\operatorname{tr}(A B^* B A^*).
   \]
   Summing over the component quadratics of $m$ gives $\mathbb E\|m\|^4=1+\operatorname{tr}(D^2)+4\operatorname{tr}(M^2)$.
   Apply the same identity to $m_a$ and $v^*m$ and sum over $a$. Keeping the first two terms gives
   $\mathbb E[\|m\|^2|v^*m|^2]\ge v^*Dv+v^*D^2v$, since $\mathbb E[m\,\overline{v^*m}]=Dv$.
   Sum over an orthonormal eigenbasis of $M$, with each term weighted by its eigenvalue. Step 2 now yields
   \[
   \|R_9(q)\|_2^2\ge 1+\operatorname{tr}\big((D+2M)^2\big)+4\operatorname{tr}(M D^2).
   \]
4. Both $D$ and $M$ are positive semidefinite of trace one. The last summand is nonnegative since $\operatorname{tr}(MD^2)=\|D M^{1/2}\|_F^2$. The eigenvalues of $D+2M$ sum to three, so their squares sum to at least $9/n$. Equality in the dimension bound requires $D+2M=(3/n)I$ and $D M^{1/2}=0$. Consequently $D^2=(3/n)D$ and $\operatorname{rank}D=n/3$ by its trace. Thus equality requires $3\mid n$.

   Conversely, take $n=3b$ and $q=b^{-1/2}\sum_{j=1}^b x_j y_j\bar z_j$ on disjoint triples of Gaussian coordinates. In the Bargmann representation $F_T(w,\bar\zeta)$ uses the $x,y$ coordinates of $w$ and the $z$ coordinates of $\zeta$. The swapped factor uses the complementary coordinates, hence is independent with second moment one. Each product in the normalized sum $F_T$ is centered and circular, with second moment one and fourth moment $2^3=8$. In the fourth-moment expansion the equal-index terms give $8b$, and the two distinct-index pairings give $2b(b-1)$, before division by $b^2$. Therefore
   \[
     \|R_9(q)\|_2^2=\tfrac12\mathbb E|F_T|^4=1+3/b=1+9/n.
   \]
   This proves attainment in every dimension divisible by three and strict inequality for each unit cubic in every other dimension. $\square$

**Complex control and replay.** For $T=v\otimes v\otimes v$ with $v=(1,i)/\sqrt2$, $M=N=vv^*$ and $v^\top v=0$. Then $1+\operatorname{tr}((D+2M)^2)=6$, whereas substituting $N$ for $D$ gives $10$. In independent coordinates $X=v^\top z$ and $Y=v^*z$ the cubic is $X^2\bar Y/\sqrt2$, whose squared top norm is $6$. The [exact monomial replay](../../code/degree9-small-t-gemini-5675/verify_ninth_floor.py) verifies this witness, disjoint triples, and dense complex tensors by counting holomorphic and antiholomorphic multiplicities. Run `python3 -IB -O research/higher-degree/code/degree9-small-t-gemini-5675/verify_ninth_floor.py` from the repository root. The sharp dimension estimate and equality argument are due to codex-062a (#941, **P + C, author only**).

*(Remark on non-Gaussian $q$ in (3.2): when $q \in H_{2,1}(\mathbb{C}^n)$ has excess $s = \mathbb{E}|q|^4 - 2 > 0$, choosing $C_9 = \beta R_9(q)$ introduces a non-constant multiplier cost $+\beta^2\|R_9(q)\|_2^2 / a_4 > \beta^2 / a_4$, while simultaneously $q(|q|^2 - 2)/\sqrt{2}$ has lower-chaos projections onto $H_{2,1}$ and $H_{1,0}$ (`SixthMoment.lean`) and orthogonal $H_{5,4}$ variance; closing $B_9^* < 250/351$ unconditionally over general non-Gaussian $(G_3, G_5, G_7, G_9^+)$ therefore requires both a two-chaos radius bound below $0.8994$ and a fifth/seventh/ninth-chaos content–deficit inequality analogous to `K_5`, which remains **open**.)*

---

## 4. Task 3: The Degree-7 Comparison (`HD 1.4`)

**Theorem 4.1 (Degree-7 Local Stability, Gaussian Ideal, and Radius Equivalence, **P + C**, author only).** *For $T_7 = P_{1,0} - a_{1,7} P_{2,1} + a_{2,7} P_{3,2} - a_{3,7} P_{4,3}$ (`(0.906596, 0.541570, 0.242531)`):*
1. **Global optimality on the diffuse odd graded space (**P**):** *Across any number of independent diffuse odd Gaussians $(\mathbf{W}_3, \mathbf{W}_5, \mathbf{W}_7, \dots)$ (where $W_{2a+1}$ has bidegree $(a+1, a)$ for $a \ge 1$) and every unimodular pair $(f, g)$,*
   $$\operatorname{Re}\langle f, T_7 g\rangle \le t^2 + a_{1,7}\frac{\pi}{4} = t^2 + \frac{226649}{1000000}\,\pi,$$
   *so at $t = 0$, $W_3/|W_3|$ is uniquely optimal among all diffuse odd graded responses.*
2. **Universal finite-dimensional cubic $\tau^4$ stability (**P + C**):** *Along $f_\tau(z, W_3) = \operatorname{ph}(W_3 + \tau B(z)), g = -f_\tau$ for **every** nonzero unit-norm $B \in H_{2,1}(\mathbb{C}^d)$,*
   $$\frac{V_7(f_\tau, -f_\tau) - a_{1,7}\frac{\pi}{4}}{\pi\tau^4} = -\frac{2625547}{96000000}A_0 - \frac{1085599}{192000000}A_1 - \frac{1718951}{24000000}C_1 - \frac{179003}{48000000}C_2 + O(\tau^2) < 0,$$
   *because $a_{1,7} = 0.906596 > 3 a_{3,7} = 0.727593$ makes all four coefficients strictly negative (and $C_1 \ge \frac{9}{d}\|B\|_2^4 > 0$).*
3. **Multi-chaos gate-free bound & Gaussian ideal (**P + C**):** *For every unimodular pair $(f, g)$, $\operatorname{Re}\langle f, T_7 g\rangle \le t^2 + B_7^*$, where in the diffuse Gaussian ideal $(W_3, W_5, W_7)$ ($\sigma_3 W_3 + \sigma_5 W_5 \pm \sigma_7 W_7 \sim \mathcal{CN}(0, \sigma_3^2 + \sigma_5^2 + \sigma_7^2)$), since $a_{1,7} > a_{2,7} > a_{3,7} > 0$,*
   $$B_7^{*,\mathrm{Gauss}} = \sup_{\sigma_3, \sigma_5, \sigma_7 \ge 0}\!\left(\sqrt{\pi}\sqrt{\sigma_3^2 + \sigma_5^2 + \sigma_7^2} - \frac{\sigma_3^2}{a_{1,7}} - \frac{\sigma_5^2}{a_{2,7}} - \frac{\sigma_7^2}{a_{3,7}}\right) = a_{1,7}\frac{\pi}{4} = \frac{226649}{1000000}\,\pi = 0.7120388333\dots$$
   *(Conditional reach below $250/351$: $t_0 = \sqrt{250/351 - B_7^{*,\mathrm{Gauss}}} \ge 0.014556$; a dual certificate dropping both $k$-penalties at $t=0$ with $B<250/351$ requires $\rho_* \le 0.886359$, within $1.32 \times 10^{-4}$ of $\sqrt{\pi}/2$, matching issue #523.)*

*Proof of (1).* In the diffuse odd graded space, a Hermite polynomial $\prod_a H_{p_a, q_a}(W_{2a+1})$ ($a \ge 1$) has total charge $\sum_a (p_a - q_a)$ and total degree $\sum_a (2a + 1)(p_a + q_a)$. Charge $1$ forbids $\sum_a (p_a + q_a) = 2$ by parity, while $\sum_a (p_a + q_a) \ge 3$ implies total degree $\ge 3\times 3 = 9 > 7$. Hence no nonlinear Hermite polynomial of diffuse odd variables can land in $(2,1), (3,2)$, or $(4,3)$ (degree 9 is the **first** odd degree where a nonlinear diffuse term, $H_{2,1}(W_3)$ in $(5,4)$, appears). Therefore $P_{2,1}k, P_{3,2}h, P_{4,3}k$ lie purely in the linear span of $(\mathbf{W}_3, \mathbf{W}_5, \mathbf{W}_7)$, so $G_3, G_5, G_7$ in part (3) are genuinely independent complex Gaussians, making $\operatorname{Re}\langle f, T_7 g\rangle \le t^2 + B_7^{*,\mathrm{Gauss}} = t^2 + a_{1,7}\frac{\pi}{4}$ unconditional on the entire diffuse odd graded space. $\square$

---

## 5. Replay Instructions

All **C** verification scripts use only the Python 3 standard library (`fractions`, `math`, `itertools`, `collections`) and run with `-I` (isolated mode):

```bash
cd research/higher-degree/code/degree9-small-t-gemini-5675
python3 -I verify_two_chaos_diffuse.py     # ~1.5 s  (Task 1a diffuse theorem, root & Region II/III bounds, c>2 witness, chirp)
python3 -I verify_t0_refutation_exact.py   # ~77–120 s (Task 1b/3 exact series + finite-parameter interval enclosures V_9 > 0.71214)
python3 -I verify_small_t_and_wick.py      # ~3.5 s  (Task 2/3 Parseval obstruction, radius caps, B_9^{*,Gauss}, 2880 Wick classes)
```

For the multi-coordinate floating-point survey (**N**, requires `numpy` and `scipy`):
```bash
python3 -I probe_multimode_hankel.py
```
