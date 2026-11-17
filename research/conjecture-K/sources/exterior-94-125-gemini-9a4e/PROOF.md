<!-- Author: gemini-9a4e · 2026-11-17 · Task #511 (Refs #177, #440) -->
# Exterior consumer unification up to ε = 94/125 with > 10⁻⁴ central allowance

**Status summary.** No unconditional improvement of $K_G^{\mathbb{C}}$ is claimed here; the central retained all-sector inequalities $(C_i)$ remain **open**. What is proved and certified (**P + C, author only**; replayed in standard-library `python3 -I` using exact `fractions.Fraction` arithmetic and outward-rounded integer intervals):

1. **Zero-tail spectral mass row via exact homothety transfer (§1).** For every $\varepsilon > 0$ with $c(\varepsilon) := \frac{2141}{3150}\varepsilon < 1$, the piecewise quadratic-linear potential $\varphi_c^{(\varepsilon)}(r) = \max_{y \in [0, 1]}(2\varepsilon r y - c y^2)$ satisfies the exact homothety identity
   $$\varphi_{c(\varepsilon)}^{(\varepsilon)}(r) = \frac{\varepsilon}{\varepsilon_1}\,\varphi_{c_1}^{(\varepsilon_1)}(r)\qquad\forall r \ge 0,\quad \varepsilon_1 = \frac{25}{31},\; c_1 = \frac{2141}{3906}.$$
   Replaying the 136-node pruned spectral Stein certificate `cert_mass_0.5_pruned.json` (`../identity-tail/STATUS.md` 5.5, fact (3); SHA-256 `f3fe6535d0ae45a05907d103d327c12cd53180604ee2a57f73159d8c70999f28`, **C**, outside Lean, whose hypotheses are Lean's `Moments`, `SteinCut` and `Lower.ρ`) therefore proves, for **every** pure-cubic witness $T_\varepsilon = P_{1,0} - \varepsilon P_{2,1}$ ($\nu = 0$, no identity tail) and every unimodular pair $(f, g)$,
   $$V_\varepsilon(f, g) \le (1 - c(\varepsilon))\,t^2 + c(\varepsilon) + \frac{\varepsilon}{\varepsilon_1}\,S_1 - \|P_{1,0} k\|_2^2 - \varepsilon\|P_{2,1} h\|_2^2,\qquad S_1 = \frac{3798855002922010337121170986221578569}{22939068096000000000000000000000000000}.$$
   This eliminates the $t \approx 0$ crude-row barrier ($\varepsilon \rho^2 < 500/701$) that previously prevented pushing the single-witness exterior consumer above $\varepsilon = 299/400 = 0.7475$ (`STATUS.md` 8.9).

2. **Exterior consumer at $\varepsilon = 3/4 = 0.7500$ from Lean's `Lower.ρ` alone (§2).** Combining the homothety-transferred mass row, the 19 Lean rows at $\varepsilon_0 = 149/200$, retained-square two-row mixing (`RowHolds.mix`, `Grothe/LowerAnalytic/Rows.lean`), operator-change square recompletion, and the response-energy bound `2.12b` (**P + C**), **without** any external radius bound beyond Lean's `Lower.ρ = 973612157/10^9`, proves
   $$V_{3/4}(f, g) \le \frac{7132652}{10^7} < \frac{500}{701}\qquad\text{whenever } t \le \frac{159}{200} = 0.795 \text{ or } \frac{108}{125} = 0.864 \le t \le \frac{\sqrt{\pi}}{2}$$
   (1,635 of 1,773 exact cells $[j/2000, (j+1)/2000]$ accepted; 613 use `2.12b`). On the remaining central interval $[159/200, 108/125]$, a certified 9-row bank achieves a minimum admissible all-sector allowance **$> 7.57\cdot 10^{-5}$** (exact $7.5748\cdot 10^{-5}$, $> 2.49\times$ the $3.03\cdot 10^{-5}$ binding allowance at $\varepsilon = 299/400$ in `STATUS.md` 8.10).

3. **Exterior consumer at $\varepsilon = 94/125 = 0.7520$ with $> 10^{-4}$ central allowance (§§2–4).** Adding the reviewed radius certificate $\rho = 46731/50000 = 0.93462$ (`STATUS.md` 3.7, **P + C**) proves
   $$V_{94/125}(f, g) \le \frac{7132660}{10^7} < \frac{500}{701}\qquad\text{whenever } t \le \frac{1503}{2000} = 0.7515 \text{ or } \frac{863}{1000} = 0.863 \le t \le \frac{\sqrt{\pi}}{2}$$
   (1,550 of 1,773 exact cells accepted; 454 use `2.12b`). On the remaining central interval $[1503/2000, 863/1000]$, a certified 13-row bank satisfies $S_i < S_i^{\mathrm{upper}}$ with **every single row admitting an exact all-sector error budget $\eta_{\max, i} > 10^{-4}$** (minimum allowance $> 1.021\cdot 10^{-4}$, a **$> 3.36\times$ increase** over `STATUS.md` 8.10 and strictly above the $99\cdot 10^{-6}$ all-sector peak error budget of `STATUS.md` 7.5.3). Moreover, Row 8 ($[21/25, 847/1000] = [0.840, 0.847]$, $\ell_8 = 4209371/5\cdot 10^6$, $\beta_8 = 1428641/10^7$) lies strictly inside **both** the proved remote profile rectangle (`STATUS.md` 3.15) and the proved retained $A$-core rectangle (`STATUS.md` 11.53) with $u < \lambda^2 \cdot 0.0463$ ($\lambda = 1880/1891$), so Layers L1 and L4 (the retained $A$-core at every amplitude and sharing) are already unconditionally proved below $\eta_{\max, 8}$ on that central slab.

---

## 1. Zero-tail spectral mass row via exact homothety

Let $f, g : \Omega \to S^1$ be measurable unimodular functions in any finite complex Gaussian dimension, put $h = (f + g)/2$, $k = (f - g)/2$, $t = \|P_{1,0} h\|_2 \in [0, \sqrt{\pi}/2]$, $Q = P_{2,1}$, $q = Q k$, and $\sigma = \|q\|_2$. By the parallelogram law $|h|^2 + |k|^2 = \frac{1}{2}(|f|^2 + |g|^2) = 1$ a.e., so $|k| \le 1$ a.e. and
$$\|k\|_2^2 = 1 - \|h\|_2^2 \le 1 - \|P_{1,0} h\|_2^2 = 1 - t^2.$$
For the pure-cubic witness $T_\varepsilon = P_{1,0} - \varepsilon Q$ ($\varepsilon > 0$), self-adjointness and idempotence of $P_{1,0}$ and $Q$ give
$$V_\varepsilon(f, g) := \operatorname{Re}\langle f, (P_{1,0} - \varepsilon Q) g\rangle = t^2 - \|P_{1,0} k\|_2^2 - \varepsilon\|Q h\|_2^2 + \varepsilon\sigma^2.$$

### Lemma 1.1 (Pointwise potential and exact homothety)
For every $\varepsilon > 0$ and $c > 0$, define $\varphi_c^{(\varepsilon)} : [0, \infty) \to [0, \infty)$ by
$$\varphi_c^{(\varepsilon)}(r) := \max_{y \in [0, 1]}\big(2\varepsilon r y - c y^2\big) = \begin{cases} \dfrac{\varepsilon^2 r^2}{c}, & 0 \le r \le \dfrac{c}{\varepsilon}, \\[8pt] 2\varepsilon r - c, & r \ge \dfrac{c}{\varepsilon}. \end{cases}$$
Fix $\varepsilon_1 = \frac{25}{31}$ and $c_1 = \frac{2141}{3906}$, so $\frac{c_1}{\varepsilon_1} = \frac{2141}{3150}$. For any $\varepsilon > 0$, set $c(\varepsilon) := \frac{2141}{3150}\varepsilon$. Then for every $r \ge 0$,
$$\varphi_{c(\varepsilon)}^{(\varepsilon)}(r) = \frac{\varepsilon}{\varepsilon_1}\,\varphi_{c_1}^{(\varepsilon_1)}(r).$$

*Proof.* For $0 \le y \le 1$, if $r \le c/\varepsilon$ then $\frac{\varepsilon^2 r^2}{c} - (2\varepsilon r y - c y^2) = c(y - \frac{\varepsilon r}{c})^2 \ge 0$ with equality at $y = \frac{\varepsilon r}{c} \in [0, 1]$; if $r \ge c/\varepsilon$ then $(2\varepsilon r - c) - (2\varepsilon r y - c y^2) = (1 - y)(2\varepsilon r - c(1 + y)) \ge 0$ since $2\varepsilon r \ge 2c \ge c(1 + y)$, with equality at $y = 1$. Next, $c(\varepsilon)/\varepsilon = \frac{2141}{3150} = c_1/\varepsilon_1$, so the kink point is identical; on $[0, \frac{2141}{3150}]$, $\frac{\varepsilon^2}{c(\varepsilon)} = \frac{3150}{2141}\varepsilon = \frac{\varepsilon}{\varepsilon_1}\frac{\varepsilon_1^2}{c_1}$, and on $[\frac{2141}{3150}, \infty)$, $2\varepsilon r - c(\varepsilon) = \frac{\varepsilon}{\varepsilon_1}(2\varepsilon_1 r - c_1)$. $\square$

### Theorem 1.2 (Zero-tail spectral mass row for $T_\varepsilon$)
For every $\varepsilon \in (0, \frac{3150}{2141})$, every dimension, and every unimodular pair $(f, g)$,
$$V_\varepsilon(f, g) \le (1 - c(\varepsilon))\,t^2 + c(\varepsilon) + \frac{\varepsilon}{\varepsilon_1}\,S_1 - \|P_{1,0} k\|_2^2 - \varepsilon\|Q h\|_2^2,$$
where $c(\varepsilon) = \frac{2141}{3150}\varepsilon$, $\varepsilon_1 = \frac{25}{31}$, and $S_1 = \frac{3798855002922010337121170986221578569}{22939068096000000000000000000000000000}$.

*Proof.* Since $Q$ is an orthogonal projection, $\sigma^2 = \|Q k\|_2^2 = \operatorname{Re}\langle k, q\rangle$, whence $\varepsilon\sigma^2 = 2\varepsilon\operatorname{Re}\langle k, q\rangle - \varepsilon\sigma^2$. Subtracting and adding $c(\varepsilon)\|k\|_2^2$ and applying Lemma 1.1 pointwise at $r = |q(\omega)|$ and $y = |k(\omega)| \in [0, 1]$ gives
$$\varepsilon\sigma^2 - c(\varepsilon)\|k\|_2^2 = \mathbb{E}\big[2\varepsilon\operatorname{Re}(\overline{k}\,q) - c(\varepsilon)|k|^2\big] - \varepsilon\sigma^2 \le \mathbb{E}\big[\varphi_{c(\varepsilon)}^{(\varepsilon)}(|q|)\big] - \varepsilon\sigma^2 = \frac{\varepsilon}{\varepsilon_1}\Big(\mathbb{E}\big[\varphi_{c_1}^{(\varepsilon_1)}(|q|)\big] - \varepsilon_1\sigma^2\Big).$$
If $\sigma = 0$, the parenthesis equals $0 < S_1$. If $\sigma > 0$, then $0 < \sigma \le \rho_{\mathrm{Lean}} = \frac{973612157}{10^9}$ (`normQk_le_rho`) and the normalised modulus-squared law $U = |q|^2/\sigma^2$ satisfies Lean's `Moments` and `SteinCut` (`exists_wick_repr`, `gaussian_moments`, `gaussian_gramInputs`, `steinCut_of_inputs`). The exact script `verify_mass_row.py` transcribes Lean's `posCert`, `posOn`, `tailOn`, `cutCells`, `specPolyV`, `sweepTop`, and `chordMax` and verifies on all 136 spectral nodes (28,935 polynomial pieces) of `cert_mass_0.5_pruned.json` that $\Psi(s) := \varphi_{c_1}^{(\varepsilon_1)}(s/\delta)$ ($\delta = 3/4$) satisfies `CapsHold` ($\kappa = \frac{358422939}{250000000} \le \varepsilon_1/\delta^2$ with $\frac{\varepsilon_1}{\delta^2} - \kappa = \frac{19}{69750000000}$, $s_{\max} = \frac{2151}{1000} \ge 2\varepsilon_1/\delta$) and
$$\mathbb{E}\big[\varphi_{c_1}^{(\varepsilon_1)}(\sigma\sqrt{U})\big] - \varepsilon_1\sigma^2 \le \mathbb{E}\big[\Psi(\delta\sigma\sqrt{U})\big] - \kappa(\delta\sigma)^2 \le S_1 - 10^{-11} < S_1\qquad\forall\sigma \in [0, \rho_{\mathrm{Lean}}].$$
Since $0 < c(\varepsilon) < 1$ and $\|k\|_2^2 \le 1 - t^2$, we conclude
$$\varepsilon\sigma^2 = \big(\varepsilon\sigma^2 - c(\varepsilon)\|k\|_2^2\big) + c(\varepsilon)\|k\|_2^2 \le \frac{\varepsilon}{\varepsilon_1}\,S_1 + c(\varepsilon)(1 - t^2),$$
which yields the theorem upon adding $t^2 - \|P_{1,0} k\|_2^2 - \varepsilon\|Q h\|_2^2$. $\square$

---

## 2. Two-row mixing, operator change, and exact 1,773-cell exterior covers

Each of the 19 Lean rows $R_i = (\ell_i, \beta_i, \mathrm{cap}_i)$ (`Grothe/Lower/RowData01.lean`..`RowData19.lean`) is proved in Lean via `Grothe.Lower.rowOf_of_shared` and `Grothe.LowerAnalytic.reductionHyp_of_nodeCaps` (satisfying `RowHolds` of `Grothe/LowerAnalytic/Rows.lean`, which also defines `RowHolds.mix`) at $\varepsilon_0 = \frac{149}{200}$ with one common vector $v \in H_{2,1}$ satisfying $\|v\|_2^2 = 2$ (`norm_vL_sq`):
$$V_{\varepsilon_0}(f, g) \le t^2 - 2\ell_i t + C_i - \varepsilon_0\left\|Q h + \frac{\beta_i}{\varepsilon_0}v\right\|_2^2,\qquad C_i = \frac{2\beta_i^2}{\varepsilon_0} + \mathrm{cap}_i + 10^{-11}.$$

### Lemma 2.1 (Retained-square mixing + operator-change recompletion)
1. **Convex row mixing (`RowHolds.mix`).** For any two Lean rows $R_i, R_j$ and $\theta \in [0, 1]$, put $(\ell_\theta, \beta_\theta, \mathrm{cap}_\theta) := (1 - \theta)(\ell_i, \beta_i, \mathrm{cap}_i) + \theta(\ell_j, \beta_j, \mathrm{cap}_j)$. Because $\|v\|_2^2 = 2$,
   $$(1 - \theta)\left\|Q h + \frac{\beta_i}{\varepsilon_0}v\right\|_2^2 + \theta\left\|Q h + \frac{\beta_j}{\varepsilon_0}v\right\|_2^2 = \left\|Q h + \frac{\beta_\theta}{\varepsilon_0}v\right\|_2^2 + \frac{2}{\varepsilon_0^2}\theta(1 - \theta)(\beta_i - \beta_j)^2,$$
   and multiplying by $-\varepsilon_0$ cancels $(1 - \theta)\frac{2\beta_i^2}{\varepsilon_0} + \theta\frac{2\beta_j^2}{\varepsilon_0} - \frac{2}{\varepsilon_0}\theta(1 - \theta)(\beta_i - \beta_j)^2 = \frac{2\beta_\theta^2}{\varepsilon_0}$ identically. Hence the mixed triple $(\ell_\theta, \beta_\theta, \mathrm{cap}_\theta)$ satisfies `RowHolds` at $\varepsilon_0$ with its full $h$-square retained.
2. **Operator shift to $\varepsilon = \varepsilon_0 + d$ ($d > 0$).** Using $V_\varepsilon - V_{\varepsilon_0} = d(\|Q k\|_2^2 - \|Q h\|_2^2)$ and completing the square $-\varepsilon_0\|Q h + \frac{\beta}{\varepsilon_0}v\|_2^2 - d\|Q h\|_2^2 = -\varepsilon\|Q h + \frac{\beta}{\varepsilon}v\|_2^2 - \frac{2 d \beta^2}{\varepsilon_0 \varepsilon} \le -\frac{2 d \beta^2}{\varepsilon_0 \varepsilon}$ yields
   $$V_\varepsilon(f, g) \le t^2 - 2\ell_\theta t + \frac{2\beta_\theta^2}{\varepsilon} + \mathrm{cap}_\theta + 10^{-11} + d\,\|Q k\|_2^2.$$
3. **Cubic energy cap.** For every cell $[t_{\mathrm{lo}}, t_{\mathrm{hi}}] \subset [0, \sqrt{\pi}/2]$ and $0 < d < 2/3$, $\|Q k\|_2^2 \le \min\{\rho^2,\; \frac{3}{2}(\frac{\pi}{4} - t^2) + B(A - t)\}$ (`STATUS.md` 2.12b, $A = \frac{886762780}{10^9}$, $B = \frac{432306903}{10^9}$), and both resulting bounds in $t$ are convex quadratics on $[t_{\mathrm{lo}}, t_{\mathrm{hi}}]$ (leading coefficients $1 > 0$ and $1 - \frac{3}{2}d > 0$), so their exact maxima on $[t_{\mathrm{lo}}, t_{\mathrm{hi}}]$ occur at the endpoints $\{t_{\mathrm{lo}}, t_{\mathrm{hi}}\}$.

### Theorem 2.2 (Exact 1,773-cell exterior covers at $\varepsilon = 3/4$ and $\varepsilon = 94/125$)
Using Machin's rational upper bound $\pi < \pi_{\mathrm{hi}} < \frac{314159266}{10^8}$ so $(\frac{1773}{2000})^2 > \frac{\pi_{\mathrm{hi}}}{4} > \frac{\pi}{4}$, `verify_exterior.py` checks every cell $[j/2000, (j+1)/2000]$ ($0 \le j \le 1772$) in exact `Fraction` arithmetic:
- **At $\varepsilon = 3/4 = 0.7500$ with $\rho = \rho_{\mathrm{Lean}} = \frac{973612157}{10^9}$:** 1,635 of 1,773 cells are accepted below $\frac{7132652}{10^7} < \frac{500}{701}$ (635 by Theorem 1.2, 986 by single transferred Lean rows, 14 by adjacent two-row mixes; 613 use `2.12b`; largest accepted cap $0.7132651687\dots$). The **only** uncovered cells are $1590 \le j \le 1727$, i.e. $t \in (\frac{159}{200}, \frac{108}{125}) = (0.795, 0.864)$.
- **At $\varepsilon = 94/125 = 0.7520$ with $\rho = \frac{46731}{50000} = 0.93462$ (`STATUS.md` 3.7):** 1,550 of 1,773 cells are accepted below $\frac{7132660}{10^7} < \frac{500}{701}$ (624 by Theorem 1.2, 924 by single transferred Lean rows, 2 by adjacent two-row mixes; 454 use `2.12b`; largest accepted cap $0.7132654583\dots$). The **only** uncovered cells are $1503 \le j \le 1725$, i.e. $t \in (\frac{1503}{2000}, \frac{863}{1000}) = (0.7515, 0.863)$.

---

## 3. Outward-rounded integer Rice-benchmark enclosures

For a central row $(\ell, \beta)$ with $a = \ell - 2\beta > 0$, $b = \beta > 0$, and price $p = 1/\varepsilon$, the Gaussian benchmark is $S(\ell, \beta; \varepsilon) = \sup_{v \ge 0} J(v)$, where for $v > 0$,
$$J(v) := 2\,\mathbb{E}\big|Z(a + b|Z|^2) + \sqrt{v}\,W\big| - p v = \sqrt{\pi v}\int_0^\infty e^{-t}\big[(1 + x(t)) y_0(z(t)) + x(t) y_1(z(t))\big]\,dt - p v,$$
with $x(t) = t(a + bt)^2/v$, $z(t) = x(t)/2$, and $y_n(z) = e^{-z} I_n(z)$.

### Analytical ingredients of `verify_central_94_125.py`
1. **Integration by parts on $[0, T_0]$ ($T_0 = 28$) and nonnegative tails.** Put $h(t) = \frac{2x(t)}{x'(t)} = \frac{2t(a + bt)}{a + 3bt}$. Since $x y_1(z) = x y_0(z) + h(t)\frac{d}{dt} y_0(z(t))$ and $h(0) = 0$,
   $$J(v) = \sqrt{\pi v}\int_0^{T_0} e^{-t}\big(1 + 2x(t) + h(t) - h'(t)\big) y_0(z(t))\,dt - p v + \sqrt{\pi v}\,e^{-T_0} h(T_0) y_0(z(T_0)) + R_J(T_0),$$
   where $R_J(T_0) = \int_{T_0}^\infty e^{-t}\,2\mathbb{E}|r(t) + \sqrt{v}\,W|\,dt \in \big[0,\; e^{-T_0}\big(2(T_0 + 1)a + 2(T_0^2 + 2T_0 + 2)b + \sqrt{\pi v}\big)\big]$ since $\sqrt{t} \le t$ and $t^{3/2} \le t^2$ for $t \ge 1$. Similarly,
   $$J'(v) = \frac{\sqrt{\pi}}{2\sqrt{v}}\int_0^{T_0} e^{-t} y_0(z(t))\,dt - p + R_{J'}(T_0),\qquad R_{J'}(T_0) \in \left[0,\; \frac{\sqrt{\pi}}{2\sqrt{v}}\,e^{-T_0}\right].$$
2. **Global concavity of $J(v)$ on $(0, \infty)$.** As reviewed in `SHOULDER_REVIEW.md` §4 (`NOTES.md` §4), $X = Z(a + b|Z|^2)$ has radial decreasing planar density $e^{-t}/[\pi(a + bt)(a + 3bt)]$, which is preserved under Gaussian convolution; since $\min(N, |w|^{-1})$ has disk superlevel sets, monotone convergence gives $J'(v) = \frac{1}{2}\mathbb{E}|X + \sqrt{v}\,W|^{-1} - p$ nonincreasing on $(0, \infty)$. Hence certified strict signs $J'(v_l) > 0 > J'(v_r)$ bracket every global maximizer $v^* \in (v_l, v_r)$, and concavity at $v_m = (v_l + v_r)/2$ gives
   $$S = J(v^*) \le J(v_m) + |J'(v_m)|\,(v_r - v_l).$$
3. **Purely algebraic enclosure of $y_0(z) = e^{-z} I_0(z)$ and its derivatives ($S = 10^{45}$ fixed-point integers).**
   - For $0 \le z \le 45$, $I_0(z) = \sum_{m=0}^\infty \frac{(z/2)^{2m}}{(m!)^2}$ has nonnegative terms with ratio $\le \frac{22.5^2}{101^2} < \frac{1}{20}$ for $m \ge 100$, so $\sum_{m=0}^{100} t_m \le I_0(z) \le \sum_{m=0}^{100} t_m + t_{100}$.
   - For $z > 45$, substituting $u = \sin(\theta/2)$ in $y_0(z) = \frac{1}{\pi}\int_0^\pi e^{-z(1 - \cos\theta)}\,d\theta$ gives the exact Laplace representation
     $$y_0(z) = \frac{2}{\pi}\int_0^1 e^{-2 z u^2}(1 - u^2)^{-1/2}\,du.$$
     Since $(1 - w)^{-1/2} = \sum_{k=0}^\infty \binom{2k}{k}\frac{w^k}{4^k}$ has strictly positive coefficients, $(1 - u^2)^{-1/2} \ge 1 + \frac{1}{2}u^2 + \frac{3}{8}u^4 + \frac{5}{16}u^6$ on $[0, 1)$, while on $[0, 1/2]$ ($w = u^2 \le 1/4$) the tail is $\le \frac{35}{128}w^4 \sum_{j=0}^\infty (1/4)^j = \frac{4}{3}\cdot\frac{35}{128}u^8$, and on $[1/2, 1]$ we have $\frac{2}{\pi}\int_{1/2}^1 e^{-2zu^2}(1-u^2)^{-1/2}\,du \le \frac{2}{\pi} e^{-z/2}\cdot \frac{\pi}{3} = \frac{2}{3}e^{-z/2}$. Integrating the Gaussian moments on $[0, \infty)$ and subtracting the $[1, \infty)$ tail ($\le \frac{35}{16\pi(2z - 3)} e^{-2z} < 3 e^{-2z}$ for $z > 45$) gives
     $$\frac{1}{\sqrt{2\pi z}}\left(1 + \frac{1}{8z} + \frac{9}{128z^2} + \frac{75}{1024z^3}\right) - 3e^{-2z} \le y_0(z) \le \frac{1}{\sqrt{2\pi z}}\left(1 + \frac{1}{8z} + \frac{9}{128z^2} + \frac{75}{1024z^3} + \frac{3675}{24576z^4}\right) + \frac{2}{3}e^{-z/2}.$$
   - Differentiating $y_0(z) = \frac{1}{\pi}\int_0^\pi e^{-z c(\theta)}\,d\theta$ ($c(\theta) = 1 - \cos\theta = 2u^2 \in [0, 2]$) gives $0 \le -y_0'(z) \le 2 y_0(z)$ and $0 \le \frac{1}{2}y_0''(z) \le 2 y_0(z)$ for all $z \ge 0$. For $z \ge 1$, splitting $u \in [0, 1]$ at $1/\sqrt{2}$ (where $(1 - u^2)^{-1/2} \le \sqrt{2}$ on $[0, 1/\sqrt{2}]$ and $\frac{2}{\pi}\int_{1/\sqrt{2}}^1 (1 - u^2)^{-1/2}\,du = \frac{1}{2}$) yields
     $$-y_0'(z) \le \frac{1}{2\sqrt{\pi}}z^{-3/2} + e^{-z} < z^{-3/2},\qquad \frac{1}{2}y_0''(z) \le \frac{3}{8\sqrt{\pi}}z^{-5/2} + e^{-z} < \frac{3}{2}z^{-5/2}\qquad\forall z \ge 1$$
     (since $\max_{z\ge 1} z^{3/2}e^{-z} = (3/2)^{3/2}e^{-3/2} < 0.41$ and $\max_{z\ge 1} z^{5/2}e^{-z} = (5/2)^{5/2}e^{-5/2} < 0.82$).
   - On each quadrature panel $[t_m - h, t_m + h]$, degree-2 automatic differentiation (`Jet2`) encloses $\frac{1}{2}G''([t_m - h, t_m + h])$ and applies the exact midpoint-Taylor formula $\int_{t_m - h}^{t_m + h} G(t)\,dt \in 2h\,G(t_m) + \frac{2}{3}h^3\cdot \frac{1}{2}G''([t_m - h, t_m + h])$.

---

## 4. Certified central consumer banks at ε = 94/125 and ε = 3/4

### 4.1 Thirteen central rows covering $[1503/2000, 863/1000] = [0.7515, 0.863]$ at $\varepsilon = 94/125 = 0.7520$

For a row $(\ell_i, \beta_i)$ at witness multiplier $\varepsilon > 0$ (price $p = 1/\varepsilon$), put $a_i = \ell_i - 2\beta_i$, $L_i = z_1(a_i + \beta_i|z_1|^2)$, and define the retained functional (`STATUS.md` 2.10a; A15R `FOUNDATIONS.md` §§3–4)
$$\widehat{\Lambda}_i(G) := \min_{\xi \in H_{1,0}}\big\{\|\xi\|_2^2 + \mathbb{E}|L_i + G - \xi| + \mathbb{E}|L_i - G + \xi|\big\} - \frac{\|G\|_2^2}{\varepsilon}.$$
As proved in A15R `FOUNDATIONS.md` §§3–4, every phase-normalised unimodular response with $P_{1,0} h = t z_1$ satisfies the retained row inequality
$$V_\varepsilon(f, g) \le t^2 - 2\ell_i t + \frac{2\beta_i^2}{\varepsilon} + \widehat{\Lambda}_i(\varepsilon Q k).$$
Since $t \mapsto t^2 - 2\ell_i t + 2\beta_i^2/\varepsilon$ is convex on $I_i = [t_{\mathrm{lo}, i}, t_{\mathrm{hi}, i}]$, its maximum on $I_i$ occurs at $\{t_{\mathrm{lo}, i}, t_{\mathrm{hi}, i}\}$, so the exact admissible all-sector error budget above $S_i^{\mathrm{upper}}$ below the target $\frac{500}{701}$ is
$$\eta_{\max, i} := \frac{500}{701} - \max_{t \in \{t_{\mathrm{lo}, i}, t_{\mathrm{hi}, i}\}}\!\left(t^2 - 2\ell_i t + \frac{2\beta_i^2}{\varepsilon}\right) - S_i^{\mathrm{upper}}.$$
Every terminating decimal or fraction below is exact (`central_94_125_certificate.json`). For each row $i \in \{1, \dots, 13\}$ at $\varepsilon = \frac{94}{125}$, if every actual unimodular response with $t \in I_i$ satisfies the retained all-sector inequality
$$\widehat{\Lambda}_i\!\left(\frac{94}{125} P_{2,1} k\right) \le S_i^{\mathrm{upper}} + \frac{1}{10000},\tag{$C_i$}$$
then combining with Theorem 2.2 gives $\|P_{1,0} - \frac{94}{125} P_{2,1}\|_{\infty \to 1} < \frac{500}{701}$ and $K_G^{\mathbb{C}} > \frac{701}{500} = 1.402$.

| $i$ | $t$ interval $I_i$ | $\ell_i$ | $\beta_i$ | certified $S_i^{\mathrm{upper}}$ | exact allowance $\eta_{\max, i}$ | $u$ cap | $\|G\|_2^2$ cap |
|---:|---|---:|---:|---:|---:|---:|---:|
| 1 | $[0.7515, 0.7700]$ | `0.7051063` | `0.1041357` | `1.171687500` | `5.7019e-3` | `0.132272` | `0.220232086` |
| 2 | $[0.7700, 0.7850]$ | `0.7298418` | `0.1112016` | `1.206107000` | `3.8986e-3` | `0.114181` | `0.191832869` |
| 3 | $[0.7850, 0.8000]$ | `0.7556724` | `0.1185484` | `1.242562200` | `2.4035e-3` | `0.099513` | `0.168380229` |
| 4 | $[0.8000, 0.8120]$ | `0.7771810` | `0.1246313` | `1.273301500` | `1.4521e-3` | `0.084844` | `0.144545873` |
| 5 | $[0.8120, 0.8220]$ | `0.7957166` | `0.1298422` | `1.300063000` | `8.4009e-4` | `0.073110` | `0.125203554` |
| 6 | $[0.8220, 0.8310]$ | `0.8129036` | `0.1346442` | `1.325096000` | `4.3996e-4` | `0.063331` | `0.108898338` |
| 7 | $[0.8310, 0.8400]$ | `0.8305981` | `0.1395547` | `1.351083200` | `1.9179e-4` | `0.054530` | `0.094078592` |
| **8** | **$[0.8400, 0.8470]$** | **`0.8418742`** | **`0.1428641`** | **`1.367604800`** | **`1.0554e-4`** | **`0.045729`** | **`0.079121428`** |
| 9 | $[0.8470, 0.8505]$ | `0.8487500` | `0.1445533` | `1.377964600` | `1.0211e-4` | `0.038884` | `0.067393074` |
| 10 | $[0.8505, 0.8540]$ | `0.8522500` | `0.1455123` | `1.383173600` | `1.0679e-4` | `0.035461` | `0.061497724` |
| 11 | $[0.8540, 0.8575]$ | `0.8592115` | `0.1474149` | `1.393558400` | `1.2998e-4` | `0.032039` | `0.055581591` |
| 12 | $[0.8575, 0.8605]$ | `0.8665870` | `0.1494233` | `1.404596100` | `1.7994e-4` | `0.028616` | `0.049644676` |
| 13 | $[0.8605, 0.8630]$ | `0.8729838` | `0.1511590` | `1.414198300` | `2.4460e-4` | `0.025682` | `0.044539351` |

- **Minimum central allowance across all 13 rows:** $\eta_{\max, 9} = \frac{2691299123611}{26357600000000000} \approx 1.02107\cdot 10^{-4} > 10^{-4}$, leaving an exact reserve $\frac{55539123611}{26357600000000000} > 2.107\cdot 10^{-6}$ after spending $10^{-4}$ on every row.
- **Unconditional L1 + L4 closure on Row 8 ($[0.840, 0.847]$):** With $\lambda = \frac{94/125}{1891/2500} = \frac{1880}{1891}$, Row 8 has $a_8 = \ell_8 - 2\beta_8 = \frac{556146}{10^6}$, satisfying
  $$0 < \frac{a_8}{\lambda} - \frac{699}{1250} = \frac{188043}{940000000} < \frac{1}{2500},\qquad 0 < \frac{\beta_8}{\lambda} - \frac{179}{1250} = \frac{9400131}{18800000000} < \frac{1}{800},$$
  and $\frac{u_{\mathrm{cap}, 8}}{\lambda^2} < 0.046267 < 0.0463$, $\frac{\|G\|_{\mathrm{cap}, 8}^2}{\lambda^2} < 0.080051$. Hence **both** `STATUS.md` 3.15 ($\Lambda(q) < S_8 + 9.934\cdot 10^{-5}$) and `STATUS.md` 11.53 ($\widehat{\Lambda}_8(q + (T - 1)r) < S_8 + 9.79\cdot 10^{-5}$) apply directly to Row 8 without any new remote or $A$-core profile transfer.

### 4.2 Nine central rows covering $[159/200, 108/125] = [0.795, 0.864]$ at $\varepsilon = 3/4 = 0.7500$

Certified in the same script (`ROWS_3_4` in `verify_central_94_125.py` and `central_94_125_certificate.json`), every row has $\eta_{\max, i} > \frac{3}{40000} = 7.5\cdot 10^{-5}$ (minimum $\frac{26549658193}{350500000000000} \approx 7.5748\cdot 10^{-5} > 7.57\cdot 10^{-5}$ on Row 7, $[0.8515, 0.856]$, $> 2.49\times$ `STATUS.md` 8.10), paired with an exterior cover that uses **only** Lean's `Lower.ρ` as its radius input.

---

## 5. Replay instructions

All three checkers require **only Python 3 and its standard library** (`python3 -I`, no `flint`, `numpy`, or `scipy`), reject `-O`, and run in about 2.7 minutes total (~2 s + ~14 s + ~148 s) on a single laptop core:

```sh
cd research/conjecture-K/code/exterior-94-125-gemini-9a4e
python3 -I verify_mass_row.py
python3 -I verify_exterior.py
python3 -I verify_central_94_125.py
```

The transcript is recorded in `REPLAY.log`, and the certified rational budgets and intervals are written to `central_94_125_certificate.json`.
