# Sharpened smoothed two-step Ornstein–Uhlenbeck deficit remainder and complete closure of the near-Gaussian sliver at the peak row

*Author: `gemini-21d5`, 24 November 2026. Task [#593](https://github.com/agalatan/grothendieck-lean/issues/593) (parent [#509](https://github.com/agalatan/grothendieck-lean/issues/509), [#446](https://github.com/agalatan/grothendieck-lean/issues/446), [#177](https://github.com/agalatan/grothendieck-lean/issues/177)).*
*Status labels follow [`STATUS.md`](../../STATUS.md) §0: **P + C, author only** (written proof and self-contained pure-stdlib exact rational / 220-bit outward interval / integer Bernstein verification with AST-audited zero floating-point operations; independent review requested on the PR), building on previously reviewed inputs **P** / **P + C** / **Lean** cited explicitly by tag below.*

---

## 1. Main results

Fix the peak visible profile $L = z_1(a + b|z_1|^2)$ with $(a, b) = \big(\frac{699}{1250}, \frac{179}{1250}\big)$ and price $p = \frac{1}{\varepsilon} = \frac{2500}{1891}$. For any remote cubic $q \in H_{2,1}(\mathbb{C}^n)$ ($n \ge 1$) independent of $z_1$, write
$$u = \mathbb{E}|q|^2, \qquad \delta = \mathbb{E}|q|^4 - 2u^2, \qquad \chi = \frac{\delta}{u^2} \in [0, 42] \quad (u > 0), \qquad \kappa_6^{\mathbb{C}} = \mathbb{E}|q|^6 - 6u^3 - 9u\delta,$$
$$B(u) = 2\,\mathbb{E}|L + \sqrt{u}\,W|, \qquad D(q) = B(u) - 2\,\mathbb{E}|L + q|, \qquad c_A(q) = \Pi_{1,\mathrm{rem}}\big[F_A(q)\big],$$
where $W$ is an independent standard proper complex Gaussian and $F_A(w) = \mathbb{E}_{z_1}[(|z_1|^2 - 1)\operatorname{ph}(L + w)] = w\,g_A(|w|^2)$.

In [`STATUS.md`](../../STATUS.md) `3.19` ([`KCR`](../cumulant-remainder-codex-a7c4/PROOF.md), **P**), bounding the two-step Stein remainder of $h(x) = \pi\mathbb{E}|\operatorname{Re} L + \sqrt{u/2}\,x|$ via $\|h^{(7)}\|_\infty \le 128(u/2)^{7/2}\mathbb{E}[V_L^{-3}]$ gave $|R| \le 2700\sqrt{u}\,\delta^{3/2}$ ($\chi \le \frac{1}{100}$) and $5700\sqrt{u}\,\delta^{3/2}$ (all shapes), which stopped at $\chi \le \frac{1}{5000}$ for $D(q) > 0$ and $\chi \le 10^{-4}$ for $D(q) \ge \frac{\delta}{8}$. Meanwhile, the Stieltjes–Maclaurin and 79-dual Stein covers of [`KRAW`](../raw-content-2026-11-17-gemini-5331/PROOF.md) (`3.29`, `6.3.43`) started at $\chi = \frac{1}{64}$ on $(\frac{1}{4000}, \frac{3}{250}]$ and at $\chi = \frac{49}{10000}$ on $[\frac{3}{250}, \frac{463}{10000}]$, leaving open a near-Gaussian sliver across the entire peak energy band.

By evaluating the exact Gaussian scale-mixture representation of the two-step Ornstein–Uhlenbeck resolvent kernel (`KSR` Lemma 1.1) **after** $P_{\varepsilon_V}$ smoothing at $e^{-2\varepsilon_V} = \frac{u}{V_L + u}$, retaining Wiener-chaos orthogonality $U \in \mathcal{H}_2 \oplus \mathcal{H}_4 \perp \mathcal{H}_0 \oplus \mathcal{H}_6 \oplus \mathcal{H}_8$ on the constant centering subtraction, sharpening the Hermite–Gaussian square-root constant from $3\sqrt{5} \approx 6.7082$ to $\frac{17}{4} = 4.25$, and damping all $V_L$ inverse moments with algebraically certified Markov–Krein Hermite/Radau polynomials on $[0, \infty)$, we prove and machine-certify:

### Theorem 1 — Smoothed two-step OU deficit remainder and sharpened signed regimes (`STATUS.md` `3.19`, **P + C, author only**)

*For every $n \ge 1$ and every remote cubic $q \in H_{2,1}(\mathbb{C}^n)$ with $0 < u \le \frac{463}{10000}$, the expansion*
$$2\,\mathbb{E}|L + q| = B(u) + \frac{\delta}{4}\,B''(u) + \frac{\kappa_6^{\mathbb{C}}}{36}\,B'''(u) + R(q)$$
*satisfies the slabwise monotone upper bounds $|R(q)| \le R_{\mathrm{cap}}(u)\,\delta^{3/2}$ of Table 1 (in particular $R_{\mathrm{cap}}(u) \le 109$ on $[\frac{28}{625}, \frac{463}{10000}]$, compared with $2700\sqrt{0.0463} \approx 581.2$ in `KCR`), while $-B''(u)/4 \ge 0.54054119$ and $B'''(u) \le 17.541631$ at the top of the band (compared with $0.42$ and $47$ in `KCR`). Consequently, uniformly in dimension:*

1. **Signed $\frac{7}{50}\delta$ and $\frac{1}{8}\delta$ regimes ($48\times$ and $45\times$ wider in $\chi$):**
   - *Whenever $0 < u \le \frac{463}{10000}$ and $0 \le \chi \le \frac{1}{250} = 0.004$, $D(q) \ge \frac{7}{50}\,\delta$.*
   - *Whenever $0 < u \le \frac{463}{10000}$ and $0 \le \chi \le \frac{9}{2000} = 0.0045$, $D(q) \ge \frac{1}{8}\,\delta$.*
2. **All-shape small-energy regimes ($2.5\times$ and $3\times$ wider in $u$):**
   - *Whenever $0 \le u \le \frac{1}{1600} = 0.000625$, every shape ($0 \le \chi \le 42$ when $u > 0$) satisfies $D(q) \ge \frac{9}{50}\,\delta$ (certified $\ge 0.19640955\,\delta$) and exact $\|c_A(q)\|^2 \le \frac{6}{25}\,D(q)$ (strict when $q \ne 0$).*
   - *Whenever $0 < u \le \frac{3}{4000} = 0.00075$, every nonzero remote cubic ($0 < \chi \le 42$) satisfies $D(q) \ge 0.04533944\,\delta > 0$.*
3. **Retained A-shell and shell-free odd-sector corollaries:**
   - *On $\frac{3}{100} \le u \le \frac{463}{10000}$, $\|c_{3/5}(q)\|_2^2 \le \frac{3}{10}\,D(q)$ and $\hat\Lambda(q + (T - 1)r) \le S - \frac{\delta}{250}$ hold for every remote linear form $r$ (all amplitudes and sharing) up to $\chi \le \frac{9}{2000}$ (and $\hat\Lambda(q + (T - 1)r) \le S - \frac{19}{1000}\delta$ up to $\chi \le \frac{1}{250}$).*
   - *With no A/B shells, $\Lambda(q + O) \le S - \frac{\delta}{8} - \frac{1988}{47275}\|O\|_2^2$ holds on $0 < u \le \frac{463}{10000}$ for $\chi \le \frac{9}{2000}$, for all genuine odd sectors $O$ with arbitrary sharing.*

### Theorem 2 — Complete closure of the near-Gaussian sliver in `STATUS.md` `3.29`, `6.3.18`, and `6.3.43` (**P + C, author only**)

*Uniformly over every dimension $n \ge 1$ and every remote cubic $q \in H_{2,1}(\mathbb{C}^n)$:*

1. **Strict deficit positivity (`3.29`) without any near-Gaussian sliver:**
   - *Purely analytically (zero Stein duals), $D(q) > 0$ holds strictly on $(u, \chi) \in (0, \frac{3}{250}] \times (0, \frac{1}{9}]$ (strictly containing $(0, \frac{1}{64}]$ with $> 7.1\times$ overlap) and on $(u, \chi) \in [\frac{3}{250}, \frac{463}{10000}] \times (0, \frac{1}{125}]$ (strictly containing $(0, \frac{49}{10000}]$ with $> 1.63\times$ overlap).*
   - *Combined with the Stieltjes–Maclaurin and 79-dual Stein covers of `3.29` (`KRAW`), **$D(q) > 0$ holds strictly on the entire connected domain $(u, \chi) \in (0, \frac{463}{10000}] \times (0, \frac{49}{100}] \cup (0, \frac{3}{4000}] \times (0, 42]$** (every nonzero remote cubic with $\chi \le 0.49$ across the entire peak energy band, with zero sliver).*
2. **Exact zero-slack raw A-content inequality (`6.3.18`, `6.3.43`) without any near-Gaussian sliver:**
   - *Purely analytically — even using the unsmoothed constant $K_A(0) = \frac{3\sqrt{6}}{4}g_A'(0)^2 < \frac{5353}{625}$ alone — exact $\|c_A(q)\|_2^2 \le \frac{6}{25}\,D(q)$ (strict whenever $q \ne 0$) holds on $[0, \frac{3}{250}] \times [0, \frac{2}{25}]$ (containing all of $[0, \frac{49}{625}]$ on $[0, \frac{3}{250}]$ without needing Maclaurin boxes!) and on $[\frac{3}{250}, \frac{463}{10000}] \times [0, \frac{1}{200}]$ ($\frac{1}{200} = 0.0050 > \frac{49}{10000}$; reaching $[0, \frac{3}{500}] = [0, 0.0060]$ with the Radau-smoothed $K_A(u)$ caps).*
   - *Combined with the 54 Stein boxes of `6.3.43(c)` on $[\frac{3}{250}, \frac{463}{10000}] \times [\frac{49}{10000}, \frac{49}{625}]$ (and Maclaurin on $[\frac{1}{4000}, \frac{3}{250}] \times [\frac{1}{64}, \frac{1}{4}]$), **exact zero-slack $\|c_A(q)\|_2^2 \le \frac{6}{25}\,D(q)$ holds unconditionally on the entire connected rectangle $[0, \frac{463}{10000}] \times [0, \frac{49}{625}]$, as well as on $[0, \frac{1}{1600}] \times [0, 42]$ and $[0, \frac{3}{250}] \times [0, \frac{1}{4}]$**, closing 100% of the near-Gaussian sliver.*

---

## 2. Analytic proof of the smoothed two-step OU remainder identity

### 2.1 Circular real projection and Gaussian scale-mixture smoothing

By `STATUS.md` `2.7` (**P**), $L = z_1(a + b|z_1|^2) \stackrel{\mathrm{law}}{=} \sqrt{V_L}\,W$ where $V_L > 0$ is independent of $(W, q)$. Since $q \in H_{2,1}(\mathbb{C}^n)$ satisfies $q(e^{-i\phi}z) = e^{-i\phi}q(z)$ and $W \sim \mathcal{CN}(0, 1)$ is circular, $\sqrt{V_L}\,W + q$ is circular conditionally on $V_L$, so $\mathbb{E}|\operatorname{Re}(\sqrt{V_L}\,W + q)| = \frac{2}{\pi}\mathbb{E}|\sqrt{V_L}\,W + q|$ (`edgeworth-codex-a7c4/PROOF.md` §4, **P**). Setting $N_0 := \sqrt{2}\operatorname{Re} W \sim \mathcal{N}(0, 1)$, $F := \sqrt{2/u}\operatorname{Re} q \in \mathcal{H}_3(\mathbb{R}^{2n})$ ($\mathbb{E}[F^2] = 1$), $c := \mathbb{E}|N_0| = \sqrt{2/\pi}$, and
$$r_V := \frac{u}{V_L + u} = e^{-2\varepsilon_V} \in (0, 1) \qquad (\varepsilon_V > 0 \text{ a.s. since } V_L > 0 \text{ a.s.}),$$
Mehler's representation of the 1D Ornstein–Uhlenbeck semigroup $h_\varepsilon(x) := (P_\varepsilon|\cdot|)(x) = \mathbb{E}_{N_0}|e^{-\varepsilon}x + \sqrt{1 - e^{-2\varepsilon}}\,N_0|$ gives
$$2\,\mathbb{E}|L + q| = \pi\,\mathbb{E}\left|\sqrt{\frac{V_L}{2}}\,N_0 + \sqrt{\frac{u}{2}}\,F\right| = \frac{\sqrt{\pi}}{c}\,\mathbb{E}_{V_L}\!\Big[\sqrt{V_L + u}\;\mathbb{E}_F\big[h_{\varepsilon_V}(F)\big]\Big]. \tag{1}$$

### 2.2 Two-step Stein cumulant expansion at fixed $\varepsilon > 0$ and exact $P_\varepsilon$ kernel collapse

For any fixed $\varepsilon > 0$, $h_\varepsilon \in C^\infty(\mathbb{R})$ is even, of linear growth $|h_\varepsilon(x)| \le |x| + c$, with bounded derivatives of every order $\ge 1$, and satisfies $\mathbb{E}h_\varepsilon(N_0) = c$, $\mathbb{E}[\operatorname{He}_4(N_0)h_\varepsilon(N_0)] = -c e^{-4\varepsilon}$, and $\mathbb{E}[\operatorname{He}_6(N_0)h_\varepsilon(N_0)] = 3c e^{-6\varepsilon}$ (since $P_\varepsilon\operatorname{He}_m = e^{-m\varepsilon}\operatorname{He}_m$ and $\mathbb{E}[\operatorname{He}_4(N_0)|N_0|] = -c$, $\mathbb{E}[\operatorname{He}_6(N_0)|N_0|] = 3c$). Put $U := \|DF\|^2 - 3 = U_2 + U_4 \in \mathcal{H}_2 \oplus \mathcal{H}_4$. By the reviewed two-step Stein identity (`edgeworth-codex-a7c4/PROOF.md` eqs. (6) & (9), [`KCR`](../cumulant-remainder-codex-a7c4/PROOF.md) §3, **P**),
$$\mathbb{E}_F[h_\varepsilon(F)] = c - c e^{-4\varepsilon}\,\frac{\kappa_4(F)}{24} + c e^{-6\varepsilon}\,\frac{\kappa_6(F)}{240} + R_{h_\varepsilon}(F), \tag{2}$$
$$R_{h_\varepsilon}(F) = -\frac{1}{27}\sum_{k \in \{2, 4\}}\sum_{l \in \{0, 2, 4, 6, 8\}} \mathbb{E}_F\Big[(R_{2 - l/3}R_{4 - k/3}v_{h_\varepsilon})(F)\,U\,\Pi_l(U U_k)\Big], \tag{3}$$
where $\phi_{h_\varepsilon}' - x\phi_{h_\varepsilon} = h_\varepsilon - c$ and $v_{h_\varepsilon} = \phi_{h_\varepsilon}^{(5)} - \mathbb{E}[\phi_{h_\varepsilon}^{(5)}(N_0)]$.

First check the leading cumulant terms when `(2)` is substituted into `(1)`. By circularity of $q \in H_{2,1}(\mathbb{C}^n)$, $\kappa_4(F) = \frac{3\delta}{2u^2}$ and $\kappa_6(F) = \frac{5\kappa_6^{\mathbb{C}}}{2u^3}$ (`edgeworth-codex-a7c4/PROOF.md` `(14)`). Since $B(u) = \sqrt{\pi}\,\mathbb{E}_{V_L}[\sqrt{V_L + u}]$ has $B''(u) = -\frac{\sqrt{\pi}}{4}\mathbb{E}_{V_L}[(V_L + u)^{-3/2}]$ and $B'''(u) = \frac{3\sqrt{\pi}}{8}\mathbb{E}_{V_L}[(V_L + u)^{-5/2}]$, while $e^{-4\varepsilon_V} = \frac{u^2}{(V_L+u)^2}$ and $e^{-6\varepsilon_V} = \frac{u^3}{(V_L+u)^3}$:
- Zeroth term: $\frac{\sqrt{\pi}}{c}\mathbb{E}_{V_L}[\sqrt{V_L+u}\cdot c] = B(u)$;
- Fourth-cumulant term: $-\frac{\sqrt{\pi}}{c}\mathbb{E}_{V_L}\!\big[\sqrt{V_L+u}\cdot c\frac{u^2}{(V_L+u)^2}\big]\frac{3\delta/(2u^2)}{24} = -\frac{\sqrt{\pi}}{16}\mathbb{E}_{V_L}[(V_L+u)^{-3/2}]\,\delta = \frac{\delta}{4}\,B''(u)$;
- Sixth-cumulant term: $\frac{\sqrt{\pi}}{c}\mathbb{E}_{V_L}\!\big[\sqrt{V_L+u}\cdot c\frac{u^3}{(V_L+u)^3}\big]\frac{5\kappa_6^{\mathbb{C}}/(2u^3)}{240} = \frac{\sqrt{\pi}}{96}\mathbb{E}_{V_L}[(V_L+u)^{-5/2}]\,\kappa_6^{\mathbb{C}} = \frac{\kappa_6^{\mathbb{C}}}{36}\,B'''(u)$.

Now evaluate $(R_{2 - l/3}R_{4 - k/3}v_{h_\varepsilon})(x)$ explicitly for $\varepsilon > 0$.

**Lemma 2.1 (Smoothed two-step OU kernel formula).** *Let $r := e^{-2\varepsilon} \in (0, 1)$ and $h_4(s) := (s^2 - 6s + 3)e^{-s/2}$. For every $k \in \{2, 4\}$, $l \in \{0, 2, 4, 6, 8\}$, and $x \in \mathbb{R}$,*
$$(R_{2 - l/3}R_{4 - k/3}v_{h_\varepsilon})(x) = -\frac{c}{2}\,r^3\int_0^1 W_{k/3, l/3}(\theta)\,\theta^2\left[(1 - r\theta)^{-5/2}\,h_4\!\left(\frac{r\theta\,x^2}{1 - r\theta}\right) - 3\right]d\theta, \tag{4}$$
*where, for $\alpha = k/3$, $\beta = l/3$, and $d = \beta + 2 - \alpha > 0$,*
$$W_{\alpha,\beta}(\theta) := \frac{1}{d}\left(\frac{\theta^{-(\beta+4)/2} - 1}{\beta + 4} - \frac{\theta^{-(\alpha+2)/2} - 1}{\alpha + 2}\right) > 0 \qquad (\theta \in (0, 1)) \tag{5}$$
*is strictly positive and strictly decreasing on $(0, 1)$, satisfying $W_{\alpha,\beta}(\theta) \le \frac{\theta^{-(\beta+4)/2}}{d(\beta+4)}$ on $(0, 1)$ and $W_{\alpha,\beta}(1 - t) \le \frac{t^2}{8}(1 - t)^{-(\beta+6)/2}$ for $t = 1 - \theta \in (0, 1)$.*

*Proof.* Because $(\frac{d}{dx} - x)(e^{-\varepsilon}P_\varepsilon\phi_{|x|}) = P_\varepsilon(\phi_{|x|}' - x\phi_{|x|}) = h_\varepsilon - c$, $\frac{d}{dx}P_\varepsilon = e^{-\varepsilon}P_\varepsilon\frac{d}{dx}$, and $P_\varepsilon$ commutes with $R_\lambda$, we have $\phi_{h_\varepsilon}' = e^{-2\varepsilon}P_\varepsilon(\phi_{|x|}')$ and
$$(R_{2 - l/3}R_{4 - k/3}v_{h_\varepsilon})(x) = e^{-6\varepsilon}\,(P_\varepsilon g_{k,l})(x) = r^3\,(P_\varepsilon g_{k,l})(x),$$
where $g_{k,l} = R_{2 - l/3}R_{4 - k/3}v_{|x|}$. By Lemma 1.1 of [`KSR`](../sharp-radius-2026-11-17-gemini-2762/PROOF.md) (§1.2, proved by substituting $(\theta, \eta) = (w e^{-2T}, e^{-2T})$ into $\phi_{|x|}'(x) = -\frac{c}{2}\int_0^1 (1-w)^{-1/2}\exp(-\frac{wx^2}{2(1-w)})\,dw$, together with $W_{\alpha,\beta}'(\theta) = -\frac{1}{2d}\theta^{-(\beta+6)/2}(1 - \theta^{d/2}) < 0$ and Bernoulli's inequality $(1-t)^{d/2+1} \ge 1 - (\frac{d}{2}+1)t$ for the $t = 1-\theta$ bound),
$$g_{k,l}(y) = -\frac{c}{2}\int_0^1 W_{k/3, l/3}(\theta)\,\theta^2\left[(1 - \theta)^{-5/2}h_4\!\left(\frac{\theta y^2}{1 - \theta}\right) - 3\right]d\theta.$$
Notice that for $r \in (0, 1)$ fixed, the integrand in `(4)` is bounded uniformly in $(\theta, x)$ by $W_{k/3,l/3}(\theta)\theta^2\big[3(1 - r)^{-5/2} + 3\big]$, which is integrable on $\theta \in (0, 1)$ for every $l \le 8$ since $\theta^2 W_{k/3,l/3}(\theta) = O(\theta^{(2 - l/3)/2}) = O(\theta^{-1/3})$ as $\theta \downarrow 0$. For each $\theta \in (0, 1)$, put $\gamma := \frac{\theta}{1 - \theta} > 0$, so $(1 - \theta)^{-5/2} = (1 + \gamma)^{5/2}$. Under $y = \sqrt{r}\,x + \sqrt{1 - r}\,N_0$ ($N_0 \sim \mathcal{N}(0, 1)$), writing $K_\gamma(y) := e^{-\gamma y^2/2}$ gives $K_\gamma^{(4)}(y) = \gamma^2 h_4(\gamma y^2)$, while Gaussian expectation over $N_0$ yields
$$(P_\varepsilon K_\gamma)(x) = \mathbb{E}_{N_0}\!\big[e^{-\frac{\gamma}{2}(\sqrt{r}\,x + \sqrt{1-r}\,N_0)^2}\big] = \frac{1}{\sqrt{1 + \gamma(1 - r)}}\exp\!\left(-\frac{\gamma r\,x^2}{2(1 + \gamma(1 - r))}\right) = \left(\frac{1 - \theta}{1 - r\theta}\right)^{1/2}\exp\!\left(-\frac{r\theta\,x^2}{2(1 - r\theta)}\right)$$
since $1 + \gamma(1 - r) = \frac{1 - r\theta}{1 - \theta}$. Differentiating four times in $x$ and using $\frac{d^4}{dx^4}(P_\varepsilon K_\gamma)(x) = e^{-4\varepsilon}(P_\varepsilon K_\gamma^{(4)})(x) = r^2\gamma^2\,P_\varepsilon\big[h_4(\gamma\,\cdot^2)\big](x)$ gives
$$(1 - \theta)^{-5/2}\,P_\varepsilon\big[h_4(\gamma\,\cdot^2)\big](x) = (1 - \theta)^{-5/2} r^{-2}\gamma^{-2}\left(\frac{1 - \theta}{1 - r\theta}\right)^{1/2}\left(\frac{r\theta}{1 - r\theta}\right)^2 h_4\!\left(\frac{r\theta\,x^2}{1 - r\theta}\right) = (1 - r\theta)^{-5/2}\,h_4\!\left(\frac{r\theta\,x^2}{1 - r\theta}\right)$$
(with all factors of $r^2\theta^2$ and $(1 - \theta)^2$ cancelling identically). Fubini's theorem on $(0, 1) \times \mathbb{R}$ (justified for fixed $r \in (0, 1)$ when $l \le 4$ by boundedness of $|h_4| \le 3$, and for $l \in \{6, 8\}$ by $|(1-\theta)^{-5/2}h_4(\frac{\theta y^2}{1-\theta}) - 3| \le C\theta^{1/2}(1-\theta)^{-3}|y| + 3((1-\theta)^{-5/2}-1)$ near $\theta = 0$ from Lemma 2.2 below) yields `(4)`. $\square$

### 2.3 Cancellation of $(V_L + u)^{-5/2}$ and chaos orthogonality on the constant subtraction

Substitute `(3)` and `(4)` at $r = r_V = \frac{u}{V_L + u}$ into `(1)`. First, the prefactor $\frac{\sqrt{\pi}}{c}\cdot(-\frac{1}{27})\cdot(-\frac{c}{2}) = +\frac{\sqrt{\pi}}{54}$ cancels $c = \sqrt{2/\pi}$. Second, put
$$A_V := V_L + u, \qquad B_{V,\theta} := V_L + u(1 - \theta) > 0.$$
Since $\sqrt{V_L + u}\,r_V^3 = u^3 A_V^{-5/2}$ and $1 - r_V\theta = \frac{B_{V,\theta}}{A_V}$, we obtain the **exact singularity-cancelling identity**
$$A_V^{-5/2}\left[(1 - r_V\theta)^{-5/2}h_4\!\left(\frac{r_V\theta\,F^2}{1 - r_V\theta}\right) - 3\right] = \underbrace{B_{V,\theta}^{-5/2}\left[h_4\!\left(\frac{u\theta\,F^2}{B_{V,\theta}}\right) - 3\right]}_{\text{Term I}} + \underbrace{3\Big(B_{V,\theta}^{-5/2} - A_V^{-5/2}\Big)}_{\text{Term II}}, \tag{6}$$
and hence
$$R(q) = \frac{\sqrt{\pi}}{54}\,u^3\sum_{k \in \{2, 4\}}\sum_{l \in \{0, 2, 4, 6, 8\}}\int_0^1 W_{k/3, l/3}(\theta)\,\theta^2\,\mathbb{E}_{V_L, F}\Big[\big(\text{Term I} + \text{Term II}\big)\,U\,\Pi_l(U U_k)\Big]d\theta. \tag{7}$$

Observe two structural simplifications in `(6)`–`(7)`:
1. **Wiener-chaos orthogonality kills Term II for $l \in \{0, 6, 8\}$:** Term II $= 3(B_{V,\theta}^{-5/2} - A_V^{-5/2})$ depends only on $(V_L, u, \theta)$ and is **independent of $F$**. Because $U = U_2 + U_4 \in \mathcal{H}_2 \oplus \mathcal{H}_4$ is orthogonal to $\mathcal{H}_0$, $\mathcal{H}_6$, and $\mathcal{H}_8$,
   $$\mathbb{E}_F\big[U\,\Pi_l(U U_k)\big] = \langle \Pi_l U,\, U U_k\rangle = 0 \qquad \forall\, l \in \{0, 6, 8\},$$
   while for $l \in \{2, 4\}$, $|\mathbb{E}_F[U\,\Pi_l(U U_k)]| = |\langle U_l, \Pi_l(U U_k)\rangle| \le \|U_l\|_2\,\|\Pi_l(U U_k)\|_2$, and by convexity of $v \mapsto v^{-5/2}$ on $(0, \infty)$,
   $$0 \le 3\Big(B_{V,\theta}^{-5/2} - A_V^{-5/2}\Big) \le \min\!\Big\{3 B_{V,\theta}^{-5/2},\; \frac{15}{2}\,u\theta\,B_{V,\theta}^{-7/2}\Big\}. \tag{8}$$
2. **Sharp square-root Hermite envelope on Term I:**

**Lemma 2.2.** *For all $s \ge 0$, $|h_4(s)| \le 3$ and $|h_4(s) - 3| \le \frac{17}{4}\sqrt{s} = 4.25\sqrt{s}$.*

*Proof.* By [`KSR`](../sharp-radius-2026-11-17-gemini-2762/PROOF.md) Lemma 1.2 (re-verified in `verify_sliver_closure.py` §2), $|h_4(s)| \le 3$ for all $s \ge 0$. In particular, $h_4(s) - 3 \le 0 \le \frac{17}{4}\sqrt{s}$ for all $s \ge 0$, so only $3 - h_4(t^2) \le \frac{17}{4}t$ ($t = \sqrt{s} \ge 0$) needs proof. For $t \ge \frac{24}{17}$, $3 - h_4(t^2) \le 6 \le \frac{17}{4}t$ holds immediately from $h_4 \ge -3$. Multiplying by $e^{t^2/2} > 0$, we need $\Phi(t) := (\frac{17}{4}t - 3)e^{t^2/2} + (t^4 - 6t^2 + 3) \ge 0$ on $[0, \frac{24}{17}]$:
- On $[0, \frac{12}{17}]$, $\frac{17}{4}t - 3 \le 0$ and $w := \frac{t^2}{2} \in [0, \frac{72}{289}] \subset [0, 1]$. For $w \in [0, 1]$, $e^w = \sum_{j=0}^4 \frac{w^j}{j!} + \sum_{j=5}^\infty \frac{w^j}{j!} \le \sum_{j=0}^4 \frac{w^j}{j!} + \frac{w^5}{120(1 - 1/6)} < \sum_{j=0}^4 \frac{w^j}{j!} + \frac{w^5}{60} =: E_{\mathrm{ub}}(t)$. Thus $\Phi(t) \ge (\frac{17}{4}t - 3)E_{\mathrm{ub}}(t) + (t^4 - 6t^2 + 3) = t\,Q_{\mathrm{left}}(t)$, and exact integer Bernstein coefficients of $Q_{\mathrm{left}}$ on $[0, \frac{12}{17}]$ are all strictly positive in **1 leaf**.
- On $[\frac{12}{17}, \frac{24}{17}]$, $\frac{17}{4}t - 3 \ge 0$ and $e^{t^2/2} \ge \sum_{j=0}^6 \frac{(t^2/2)^j}{j!} =: E_{\mathrm{lb}}(t)$, and exact integer Bernstein subdivision certifies $(\frac{17}{4}t - 3)E_{\mathrm{lb}}(t) + (t^4 - 6t^2 + 3) > 0$ on $[\frac{12}{17}, \frac{24}{17}]$ in **2 leaves**. $\square$

Applying Lemma 2.2 to Term I gives, at every $(V_L, \theta, F)$:
$$|\text{Term I}| \le \min\!\Big\{6 B_{V,\theta}^{-5/2},\; \frac{17}{4}\sqrt{u\theta}\,B_{V,\theta}^{-3}\,|F|\Big\}, \tag{9}$$
where the second branch has **integer** inverse power $B_{V,\theta}^{-3} = \big(V_L + u(1 - \theta)\big)^{-3}$ and is **linear in $|F|$**, plugging directly into the reviewed contraction inequalities of [`KCR`](../cumulant-remainder-codex-a7c4/PROOF.md) §3 (`verify.py`, **P**): with $A = \|U_2\|_2$, $C = \|U_4\|_2$, $y = C/A \in [0, \sqrt{3/4}] \subset [0, \frac{7}{8}]$, $\kappa_4(F) = A^2(\frac{1}{2} + y^2) = \frac{3\delta}{2u^2}$ (so $u^3 \kappa_4(F)^{3/2} = (\frac{3}{2})^{3/2}\delta^{3/2}$, cancelling $u^3$ identically!), $\|U\|_2/A = \sqrt{1 + y^2} \le 1 + \frac{1}{2}y^2$, and $\||F|U\|_2/A \le \|F\|_4(1.97 + 5.03 y)$.

---

## 3. Exact visible inverse moments and algebraic Markov–Krein envelopes

### 3.1 Exact rational integer inverse moments $m_1, \dots, m_9 \in \mathbb{Q}$

As in `edgeworth-codex-a7c4/PROOF.md` §3 (**P**), put $H(t) = t(a + bt)^2$ and $\tau = H^{-1}$ on $[0, \infty)$ ($H'(t) = (a + bt)(a + 3bt) > 0$). The radial squared-modulus density of $|L|^2$ is
$$k(s) = e^{-\tau(s)}\tau'(s) = -\frac{d}{ds}\big(e^{-\tau(s)}\big) = \mathbb{E}\big[V_L^{-1}e^{-s/V_L}\big] \qquad (s > 0).$$
Analyticity of $\tau$ at $s = 0$ and monotone convergence of $V_L^{-k}e^{-s/V_L}$ as $s \downarrow 0^+$ identify every integer inverse moment as an exact rational Taylor coefficient:
$$m_k := \mathbb{E}[V_L^{-k}] = (-1)^{k-1}k^{(k-1)}(0) = (-1)^k k!\,[s^k]\big(e^{-\tau(s)}\big) \in \mathbb{Q} \qquad (k \ge 1). \tag{10}$$
`verify_sliver_closure.py` computes $t_1, \dots, t_9 \in \mathbb{Q}$ recursively from $a^2\tau + 2ab\tau^2 + b^2\tau^3 \equiv s \pmod{s^{10}}$, checks that polynomial congruence directly in $\mathbb{Q}[s]/(s^{10})$, computes $m_1, \dots, m_9 \in \mathbb{Q}$ via `(10)`, and verifies exact agreement of $m_1, m_2, m_3$ with the closed forms $a^{-2}$, $a^{-4} + 4ba^{-5}$, and $a^{-6} + 12ba^{-7} + 42b^2a^{-8}$ of `KCR` Eq. `(13)`.

### 3.2 Self-contained half-integer moments $M_0, \dots, M_8$ and Markov–Krein polynomials

`verify_sliver_closure.py` (§3) encloses $M_k := \sqrt{\pi}\,\mathbb{E}[V_L^{1/2 - k}]$ ($k = 0, \dots, 8$) and $g_A'(0)$ to 220 dyadic bits using only Machin's identity for $\pi$, alternating error-function series at $r = a/b$, the single-pole recurrence $I_k = \int_0^\infty e^{-x^2}(a + bx^2)^{-k}\,dx$, and exact polynomial verification of every partial-fraction identity, re-certifying from scratch $K_A(0) = \frac{3\sqrt{6}}{4}g_A'(0)^2 < \frac{5353}{625}$ and all six Radau-smoothed $K_A(u)$ caps of `6.3.43(a)`.

To retain sharp $u$-damping across $[0, \frac{463}{10000}]$ without Taylor divergence, `verify_sliver_closure.py` (§4) constructs four rational Hermite/Radau interpolants on $y \ge 0$ and proves their global inequalities **purely algebraically in $\mathbb{Q}[y]$** via exact zero-remainder polynomial division (`pdiv_exact`), integer Bernstein positivity on $[0, y_{\mathrm{split}}]$, and shifted-coefficient positivity on $[y_{\mathrm{split}}, \infty)$:
1. **Hermite lower bound $P_5(y) \le (1 + y)^{-3/2}$ for all $y \ge 0$** (double tangency at $y_j = r_j^2 - 1$ for $r \in \{\frac{11}{10}, \frac{7}{5}, 2\}$, split at $y_{\mathrm{split}} = \frac{18}{5}$): on $[0, \frac{18}{5}]$, $1 - (1 + y)^3 P_5(y)^2 = \prod_{j=1}^3(y - y_j)^2\,Q_{\mathrm{herm}}(y) \ge 0$ gives $P_5(y) \le |P_5(y)| \le (1 + y)^{-3/2}$, while on $[\frac{18}{5}, \infty)$, $-P_5(\frac{18}{5} + t)$ has strictly positive coefficients, so $P_5(y) < 0 < (1 + y)^{-3/2}$. Evaluating at $y = u/V_L$ yields
   $$-\frac{B''(u)}{4} = \frac{\sqrt{\pi}}{16}\,\mathbb{E}\big[V_L^{-3/2}(1 + u V_L^{-1})^{-3/2}\big] \ge \frac{1}{16}\sum_{j=0}^5 P_5[j]\,u^j\,M_{2+j}. \tag{11}$$
2. **Radau upper bounds $Q_{4,5}(y) \ge (1 + y)^{-5/2}$ and $Q_{4,7}(y) \ge (1 + y)^{-7/2}$ for all $y \ge 0$** ($r \in \{\frac{11}{10}, \frac{3}{2}\}$, $y_{\mathrm{split}} = 6$), certified via $(1 + y)^p Q_{4,p}(y)^2 - 1 = y\prod_{j=1}^2(y - y_j)^2\,Q_{\mathrm{rad},p}(y) \ge 0$ and $Q_{4,p} > 0$ on $[0, \infty)$, yielding certified upper bounds on $\sqrt{\pi}\mathbb{E}[(V_L + c)^{-5/2}]$ (hence $B'''(u) = \frac{3}{8}\sqrt{\pi}\mathbb{E}[(V_L + u)^{-5/2}]$) and $\sqrt{\pi}\mathbb{E}[(V_L + c)^{-7/2}]$.
3. **Pure-rational Radau upper bound $Q_{6,3}(y) \ge (1 + y)^{-3}$ for all $y \ge 0$** (nodes $y \in \{\frac{1}{5}, \frac{4}{5}, \frac{5}{2}\}$, $y_{\mathrm{split}} = 10$), certified directly without squaring via $(1 + y)^3 Q_{6,3}(y) - 1 = y\prod_{j=1}^3(y - y_j)^2\,R_2(y) \ge 0$, yielding
   $$\mathbb{E}\big[(V_L + c)^{-3}\big] \le \sum_{j=0}^6 Q_{6,3}[j]\,c^j\,m_{3+j} \qquad \forall\, c \ge 0. \tag{12}$$

---

## 4. Whole-interval monotone slab certification and summary table

Partition $(0, \frac{463}{10000}]$ into 13 contiguous slabs $[u_{\mathrm{lo}}, u_{\mathrm{hi}}]$ (`verify_slab_partition` checks exact contiguity on $[0, \frac{3}{250}]$, $[\frac{3}{250}, \frac{463}{10000}]$, and $[0, \frac{463}{10000}]$). On each slab $[u_{\mathrm{lo}}, u_{\mathrm{hi}}]$:
- By complete monotonicity of $(V_L + c)^{-q}$ in $c \ge 0$, $-B''(u)/4$ attains its slab minimum at $u_{\mathrm{hi}}$, $B'''(u)$ attains its slab maximum at $u_{\mathrm{lo}}$, and inside `(7)`–`(9)` every expectation $\mathbb{E}[(V_L + u(1 - \theta))^{-q}]$ on a Riemann cell $\theta \in [\theta_a, \theta_b]$ is bounded above by its value at $c_{\mathrm{lo}} := u_{\mathrm{lo}}(1 - \theta_b)$, while $\sqrt{u\theta} \le \sqrt{u_{\mathrm{hi}}\theta_b}$ and $u\theta \le u_{\mathrm{hi}}\theta_b$.
- Splitting $\theta \in (0, 1)$ into the analytic left tail $(0, 2^{-16}]$ (using the $\sqrt{s}$ branch of `(9)` for all $l \le 8$, where $\int_0^{\theta_\varepsilon}\theta^{(3 - l/3)/2}\,d\theta = \frac{6}{9 - l}\theta_\varepsilon^{(9-l)/6}$ converges cleanly even at $l = 8$), 575 monotone Riemann cells on $[2^{-16}, 1 - 2^{-9}]$, and the analytic right tail $[1 - 2^{-9}, 1)$ (using Lemma 2.1's $(1 - \theta)^2/8$ bound and the constant-$6$ branch of `(9)` at $c_{\mathrm{lo}} = 0$), summing over $(k, l)$ produces an explicit degree-5 polynomial $P_5(y) \in \mathbb{Q}[y]$ such that $|R(q)| \le \frac{(3/2)^{3/2}P_5(y)}{54(1/2 + y^2)^{3/2}}\delta^{3/2}$ for all $y = C/A \in [0, \frac{7}{8}]$.
- Clearing positive square roots reduces $|R(q)| \le R_{\mathrm{cap}}\,\delta^{3/2}$ across **all** tensors on $[u_{\mathrm{lo}}, u_{\mathrm{hi}}]$ to strict positivity of the degree-10 rational polynomial
  $$Q_{10}(y) := (54 R_{\mathrm{cap}})^2\left(\frac{1}{2} + y^2\right)^3 - \frac{27}{8}\,P_5(y)^2 > 0 \qquad \forall\, y \in \left[0, \frac{7}{8}\right],$$
  certified by exact integer Bernstein coefficients (**1 leaf per slab** across all 13 slabs!).

Finally, since $\kappa_6^{\mathbb{C}} \le C_6\,\delta^{3/2}$ with $C_6 = \frac{4045313}{100000}$ (`STATUS.md` `3.4`, **Lean**) and $B'''(u) > 0$, on every slab $[u_{\mathrm{lo}}, u_{\mathrm{hi}}]$ we have
$$D(q) \ge \left[-\frac{B''(u_{\mathrm{hi}})}{4} - \left(\frac{C_6}{36}\,B'''(u_{\mathrm{lo}}) + R_{\mathrm{cap}}\right)u_{\mathrm{hi}}\sqrt{\chi}\right]\delta,$$
and since $\|c_A(q)\|_2^2 \le K_A(u_{\mathrm{lo}})\,\delta^{3/2} = K_A(u_{\mathrm{lo}})\,u\sqrt{\chi}\,\delta \le K_A(u_{\mathrm{lo}})\,u_{\mathrm{hi}}\sqrt{\chi}\,\delta$, exact $\|c_A(q)\|_2^2 \le \frac{6}{25}\,D(q)$ holds whenever
$$-\frac{B''(u_{\mathrm{hi}})}{4} - \left(\frac{C_6}{36}\,B'''(u_{\mathrm{lo}}) + R_{\mathrm{cap}} + \frac{25}{6}\,K_A(u_{\mathrm{lo}})\right)u_{\mathrm{hi}}\sqrt{\chi} \ge 0$$
(and $\chi$ lies within the fourth-moment cap $\chi_{\beta} = \frac{2}{3}(\beta_{\mathrm{use}}^4 - 3)$ used to build $P_5$).

| Slab $[u_{\mathrm{lo}}, u_{\mathrm{hi}}]$ | $-B''(u_{\mathrm{hi}})/4 \ge$ | $B'''(u_{\mathrm{lo}}) \le$ | $R_{\mathrm{cap}}$ | $\chi_{\max}(D > 0)$ | $\chi_{\max}(C_A^2 \le \frac{6}{25}D)$ (unsmoothed $K_A(0)$) | $\chi_{\max}(C_A^2 \le \frac{6}{25}D)$ (smoothed $K_A(u)$) |
|---|---:|---:|---:|---:|---:|---:|
| $(0,\, 1/1600]$ (all shapes) | `0.82252951` | `42.824527` | `106` (`44` at $\beta_{\mathrm{low}}$) | `42` (`3/4000` for $D>0$) | `42` ($D \ge \frac{9}{50}\delta$) | `42` |
| $[1/1600,\, 1/250]$ | `0.79113799` | `41.982559` | `109` | `0.26200500` | `0.26200500` | `0.26200500` |
| $[1/250,\, 1/125]$ | `0.75702307` | `37.879741` | `136` | `0.26200500` | `0.19506899` | `0.19506899` |
| $[1/125,\, 1/100]$ | `0.74110642` | `33.855600` | `265/2` | `0.18883868` | `0.12913884` | `0.12913884` |
| $[1/100,\, 3/250]$ | `0.72588947` | `32.127639` | `271/2` | `0.12426104` | `0.08515857` | `0.09020197` |
| $[3/250,\, 9/500]$ | `0.68402537` | `30.560346` | `299/2` | `0.02396906` | `0.02396906` | `0.02396906` |
| $[9/500,\, 3/125]$ | `0.64707721` | `26.640744` | `143` | `0.02396906` | `0.01670190` | `0.01768445` |
| $[3/125,\, 3/100]$ | `0.61420862` | `23.594069` | `271/2` | `0.01596951` | `0.01072455` | `0.01192301` |
| $[3/100,\, 7/200]$ | `0.58943884` | `21.164397` | `126` | `0.01264211` | `0.00824514` | `0.00959132` |
| $[7/200,\, 1/25]$ | `0.56670334` | `19.534560` | `241/2` | `0.00989147` | `0.00632528` | `0.00752840` |
| $[1/25,\, 43/1000]$ | `0.55392454` | `18.286872` | `227/2` | `0.00923501` | `0.00575994` | `0.00702690` |
| $[43/1000,\, 28/625]$ | `0.54654081` | `17.760550` | `221/2` | `0.00874482` | `0.00539161` | `0.00660737` |
| $[28/625,\, 463/10000]$ | `0.54054119` | `17.541631` | `109` | `0.00822736` | `0.00504314` | `0.00626813` |

On $(0, \frac{3}{250}]$, the minimum certified $\chi_{\max}(D > 0)$ is $> 0.1242 > \frac{1}{9} > \frac{1}{64}$ and the minimum certified $\chi_{\max}(C_A^2 \le \frac{6}{25}D)$ is $> 0.0851 > \frac{2}{25} > \frac{49}{625} > \frac{1}{64}$. On $[\frac{3}{250}, \frac{463}{10000}]$, the minimum certified $\chi_{\max}(D > 0)$ is $> 0.00822 > \frac{1}{125} = 0.0080 > \frac{49}{10000} = 0.0049$, and the minimum certified $\chi_{\max}(C_A^2 \le \frac{6}{25}D)$ is $> 0.00504 > \frac{1}{200} = 0.0050 > \frac{49}{10000}$ even with unsmoothed $K_A(0)$ alone ($> 0.00626 > \frac{3}{500} = 0.0060$ with smoothed $K_A(u)$). Every sliver in `3.29`, `6.3.18`, and `6.3.43` is therefore closed with strict overlap.

---

## 5. Verification and exact replay

Run from the repository root with isolated standard-library Python 3 (works identically with or without `-O`):

```sh
python3 -I research/conjecture-K/code/sliver-closure-gemini-21d5/verify_sliver_closure.py
python3 -I -O research/conjecture-K/code/sliver-closure-gemini-21d5/verify_sliver_closure.py --quiet
```

The verifier completes in ~2.2 seconds, performs a startup AST self-audit rejecting any floating-point literal or call, derives all visible moments and Markov–Krein polynomials from first principles, checks all 15 whole-interval degree-10 Bernstein contraction certificates, and executes 6 adversarial negative controls (rejecting an over-tight $\frac{21}{5}\sqrt{s}$ Hermite bound, a perturbed Hermite $P_5$, a corrupted inverse-moment series, an over-tight $R_{\mathrm{cap}} = 50$ on the top slab, an over-wide $\chi = \frac{1}{20}$ at $u = \frac{463}{10000}$, and a gapped slab partition).
