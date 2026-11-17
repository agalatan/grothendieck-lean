# Explicit sharp-radius regimes, damped higher-order Stein hierarchy on $H_{2,1}(\mathbb{C}^n)$, and the complex quintic chaos $H_{3,2}(\mathbb{C}^n)$

*Author: `gemini-2762`, 17 November 2026. Task [#523](https://github.com/agalatan/grothendieck-lean/issues/523) (parent [#458](https://github.com/agalatan/grothendieck-lean/issues/458); continuing [#504](https://github.com/agalatan/grothendieck-lean/issues/504) / [PR #512](https://github.com/agalatan/grothendieck-lean/pull/512)).*
*Labels follow [`STATUS.md`](../../STATUS.md) §0: **P + C, author only** (written proof and exact stdlib integer/rational verification replayed within the author's session; not yet independently reviewed), **P** / **C** (previously reviewed inputs cited by tag), **N** (floating-point numerical searches and diagnostics), **open** (unproved).*

---

## 0. Main results and overview

Let $z = (z_1, \dots, z_n)$ be independent standard complex Gaussians ($\mathbb{E}|z_j|^2 = 1$, $\mathbb{E}z_j^2 = 0$), and let $H_{p,q}(\mathbb{C}^n)$ denote the complex Wick chaos of bidegree $(p, q)$. On $H_{2,1}(\mathbb{C}^n)$ and on $H_{3,2}(\mathbb{C}^n)$, normalised sums of $N$ independent copies tend in law and in $L^2$ to a standard circular complex Gaussian $W$ ($\mathbb{E}|W|^2 = 1$, $\mathbb{E}|W| = \sqrt{\pi}/2 = 0.8862269254\dots$), asking for the **sharp Gaussian radius** $\mathbb{E}|q| \le (\sqrt{\pi}/2)\|q\|_2$.

This note proves and machine-verifies three sets of results addressing Tasks 1–3 of [#523](https://github.com/agalatan/grothendieck-lean/issues/523):

### Theorem 1 — Explicit near-Gaussian sharp cone on $\mathcal{H}_3(\mathbb{R}^n)$ and $H_{2,1}(\mathbb{C}^n)$ (**P + C, author only**)

1. **Real third Wiener chaos** ([`STATUS.md`](../../STATUS.md) `3.21 (e1)`). *For every $n \ge 1$ and every nonzero $F \in \mathcal{H}_3(\mathbb{R}^n)$ normalised to $\|F\|_2 = 1$, put $\kappa_4(F) = \mathbb{E}[F^4] - 3 > 0$. Then:*
   - *Whenever $0 < \kappa_4(F) \le \kappa_0 := \frac{1}{49000}$,*
     $$\mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\,\|F\|_2\left(1 - \frac{\kappa_4(F)}{48}\right).$$
   - *Whenever $0 < \kappa_4(F) \le \kappa_1 := \frac{1}{12250}$, strict Gaussian domination holds:*
     $$\mathbb{E}|F| < \sqrt{\frac{2}{\pi}}\,\|F\|_2.$$

2. **Complex cubic chaos and exact remote K** ([`STATUS.md`](../../STATUS.md) `3.18`). *For every $n \ge 1$ and every nonzero $q \in H_{2,1}(\mathbb{C}^n)$ with $u = \|q\|_2^2 > 0$, $\delta = \mathbb{E}|q|^4 - 2u^2$, and $\chi(q) = \delta/u^2 \in (0, 42]$:*
   - *Whenever $0 < \chi(q) \le \chi_0 := \frac{1}{72000}$ (via the Lean sixth-moment constant $C_6 = \frac{4045313}{100000}$; or $0 < \chi(q) \le \frac{1}{73500}$ via $U(1)$ phase-averaging and the real constant $67$),*
     $$\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\,\|q\|_2\left(1 - \frac{\chi(q)}{32}\right),$$
     *and for every Gaussian buffer $v \ge 0$ and every visible profile $L = z_1(a + b|z_1|^2)$ ($a > 0$, $b \ge 0$), buffered PVD and exact remote K hold at every energy $u > 0$ and every price $p = 1/\varepsilon > 0$:*
     $$\mathbb{E}|q + \sqrt{v}\,W| \le \frac{\sqrt{\pi}}{2}\sqrt{u + v}, \qquad B(u) - 2\mathbb{E}|L + q| \ge -\frac{B''(u)}{8}\,\delta > 0.$$
   - *Whenever $0 < \chi(q) \le \chi_1 := \frac{1}{18000}$ (or $\frac{1}{18375}$ via $U(1)$ phase-averaging), strict unbuffered domination $\mathbb{E}|q| < \frac{\sqrt{\pi}}{2}\|q\|_2$ holds.*

Certified in pure Python stdlib exact arithmetic (zero floating-point operations) by [`verify_near_gaussian.py`](../../code/sharp-radius-gemini-2762/verify_near_gaussian.py).

---

### Theorem 2 — Damped fourth/fifth-order Stein hierarchy, sharpened $H_{2,1}$ radius, and high-kurtosis sharp regime (**P + C, author only**)

*For every $n \ge 1$ and every $q \in H_{2,1}(\mathbb{C}^n)$,*
$$\mathbb{E}|q| \le \frac{1829}{2000}\,\|q\|_2 = 0.9145\,\|q\|_2$$
*(strict whenever $q \ne 0$), certified across $\chi = \mathbb{E}|q|^4/\|q\|_2^4 - 2 \in [0, 42]$ by the 14-row rational certificate [`cert_915.json`](../../code/sharp-radius-gemini-2762/cert_915.json) (5 Compactly-Supported Damped Level-3 rows on $\chi \in [2, 7]$ with damping $\varepsilon = 1/40$ and support $[0, 68^2]$, and 9 Level-2 flank rows on $[0, 2] \cup [7, 42]$), whose global maximum is*
$$\rho_{\mathrm{cert},3} := \frac{234065164214019206310668315551053737400241729}{255983918816774582499039772672000000000000000} \le 0.9143744861 < \frac{1829}{2000} = 0.9145.$$
*Moreover, on the entire high-kurtosis regime $\chi(q) \in [26, 42]$, [`cert_915.json`](../../code/sharp-radius-gemini-2762/cert_915.json) certifies the dimension-free **sharp Gaussian bound** with strict margin:*
$$\mathbb{E}|q| \le \frac{443}{500}\,\|q\|_2 = 0.886\,\|q\|_2 < \frac{\sqrt{\pi}}{2}\,\|q\|_2 \qquad \forall\, q \in H_{2,1}(\mathbb{C}^n) \text{ with } \chi(q) \in [26, 42]$$
*(largest bound on $[26, 42]$: $\le 0.8858291448$).*

**Degree-5 small-$t$ consequences** (checked in exact rationals by [`check_identities_exact.py`](../../code/sharp-radius-gemini-2762/check_identities_exact.py) Part C):
1. At $t = 0$, the necessary moment-layer cap $\lambda_1 \le (500/701)/(\rho^*)^2$ ([`higher-degree/STATUS.md`](../../../higher-degree/STATUS.md) `4.12`) becomes $\lambda_1 \le \frac{2000000000}{2345013941} = 0.852873\dots$ at $\rho_0 = \frac{1829}{2000}$ ($\frac{20000000}{23475789} = 0.851941\dots$ at $\frac{183}{200}$).
2. By Proposition 5 of [`K3R`](../complex-radius-2026-11-17-gemini-2762/PROOF.md) (`codex-6d92`), for the capped degree-5 witness $T = P_{1,0} - \frac{39}{50}P_{2,1} + \frac{779}{10000}P_{3,2}$, $\rho_0 = \frac{1829}{2000}$ proves directly — with zero sector hypotheses, zero interval covers, and zero `libm` assumptions — that
   $$\operatorname{Re}\langle f, T g\rangle \le \frac{9221}{10000}\,t^2 + 0.654799 < \frac{500}{701} \qquad \forall\, t \le \frac{2518}{10000} = 0.2518 > \frac{1}{4}$$
   (and for all $t \le \frac{2502}{10000} = 0.2502 > \frac{1}{4}$ at $\rho_0 = \frac{183}{200}$).

Dual-verified in pure Python stdlib exact arithmetic (zero floats) by [`verify_cert_level3.py`](../../code/sharp-radius-gemini-2762/verify_cert_level3.py) (Sturm sequences) and [`verify_bernstein_level3.py`](../../code/sharp-radius-gemini-2762/verify_bernstein_level3.py) (recursive determinants and Bernstein subdivision).

---

### Theorem 3 — The complex quintic chaos $H_{3,2}(\mathbb{C}^n)$ (**P + C, author only**; numerical survey **N**)

1. **Asymptotic lower bound** (**P**). *Normalised diffuse sums $Q_N = N^{-1/2}\sum_{j=1}^N q_1(z_j) \in H_{3,2}(\mathbb{C}^N)$ ($q_1(z) = (z^3\bar z^2 - 6z^2\bar z + 6z)/\sqrt{12}$, $\chi(Q_N) = 1840/N$) and multilinear sums $M_K = K^{-1/2}\sum_{r=1}^K z_{5r-4}z_{5r-3}z_{5r-2}\bar z_{5r-1}\bar z_{5r} \in H_{3,2}(\mathbb{C}^{5K})$ ($\chi(M_K) = 30/K$) satisfy $\lim_{N\to\infty}\mathbb{E}|Q_N| = \lim_{K\to\infty}\mathbb{E}|M_K| = \sqrt{\pi}/2$, so $\sup_{n \ge 1,\, 0 \ne q \in H_{3,2}(\mathbb{C}^n)} \mathbb{E}|q|/\|q\|_2 \ge \sqrt{\pi}/2$.*
2. **Exact sharp bound on hyperplane-vanishing and conditionally Gaussian quintics** (**P + C, author only**). *Let $q \in H_{3,2}(\mathbb{C}^n)$ vanish on a complex hyperplane $\{\langle e, z\rangle = 0\}$ ($e \in \mathbb{C}^n$, $\|e\|_2 = 1$), or be conditionally proper Gaussian given a sub-$\sigma$-field. Writing $X = \langle e, z\rangle$ and $Y$ for the orthogonal coordinates, $q$ decomposes orthogonally into nine radial-Laguerre components $(a, b) \in \{0,1,2,3\} \times \{0,1,2\}$ ($a + b \ge 1$, $a \ne b$) whose exact conditional radial weights have rational constants $\gamma_{a,b}$ in*
   $$\left\{1,\, 1,\, \frac{7}{8},\, \frac{7}{8},\, \frac{51}{64},\, \frac{3}{4},\, \frac{3}{4},\, \frac{11}{16},\, \frac{5}{8}\right\} \subset (0, 1].$$
   *Consequently,*
   $$\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\,\sqrt{\sum_{(a,b)} \gamma_{a,b}\,\|q_{a,b}\|_2^2} \le \frac{\sqrt{\pi}}{2}\,\|q\|_2,$$
   *with strict inequality unless $q$ lies purely in the conditionally Gaussian components $(1, 0) \oplus (0, 1)$. In particular, $\mathbb{E}|q| < (\sqrt{\pi}/2)\|q\|_2$ holds on all of $H_{3,2}(\mathbb{C}^1)$ ($\mathbb{E}|q_1| = 0.60332138\dots$, deficit $0.28290554\dots$) and for every single Wick monomial $:z^\alpha \bar z^\beta:$ ($|\alpha| = 3, |\beta| = 2$) in every dimension.*
3. **Numerical survey on $H_{3,2}(\mathbb{C}^d)$, $d = 1 \dots 6$** (**N**, [`search_quintic_h32.py`](../../code/sharp-radius-gemini-2762/search_quintic_h32.py)). *Multi-start L-BFGS-B optimization over general tensors in $H_{3,2}(\mathbb{C}^d)$ ($\dim_{\mathbb{C}} = \binom{d+2}{3}\binom{d+1}{2} = 1, 12, 60, 200, 525, 1176$), re-scored on independent $4\times 10^5$-draw samples, finds out-of-sample maxima $0.6031, 0.6573, 0.6838, 0.6855, 0.6878, 0.6919$ ($\pm 0.0012$), all strictly below $\sqrt{\pi}/2 = 0.886227$.*
4. **Dimension-free `< 1` upper bound across all of $H_{3,2}(\mathbb{C}^n)$** (**P + C, author only**). *From first principles (§4 below), every $q \in H_{3,2}(\mathbb{C}^n)$ with $u = \|q\|_2^2 = 1$ and $s = \mathbb{E}|q|^4 - 2$ satisfies $0 \le s \le 1840$, the two antiholomorphic radial Stein identities `Form I` (factor $1/2$) and `Form II` (factor $1/3$), $0 \le \mathbb{E}[V\rho] \le \frac{5}{2}s$, the kernel budgets $\mathbb{E}[(c_1 + c_2 - 5)^2] + 2\mathbb{E}|a|^2 \le 10s$ and $\mathbb{E}[(c_2 - 2)^2] \le \frac{1013}{100}s$, and the sixth-moment bound $\mathbb{E}[V^3] \le 6 + 9s + 115400\,s^{3/2}$ (proved by exact enumeration of all $154{,}578$ loopless bipartite multigraphs). On $[0, 1840]$, the 14-row rational certificate [`cert_h32.json`](../../code/sharp-radius-gemini-2762/cert_h32.json) (`51,236 B`, SHA-256 `f0074f28c7ee33f864999a4a8891e91773414640703be3e65d9c4d8bdf890a1a`, dual-verified by exact Sturm sequences and Bernstein subdivision in [`verify_cert_h32.py`](../../code/sharp-radius-gemini-2762/verify_cert_h32.py)) proves unconditionally:*
   $$\mathbb{E}|q| \le \frac{999999}{1000000}\,\|q\|_2 < \|q\|_2 \qquad \forall\, n \ge 1,\; \forall\, q \in H_{3,2}(\mathbb{C}^n)$$
   *(largest row bound: $\le 0.9999968653$ on $s \in [140, 230]$).*

---

## 1. Explicit near-Gaussian cone (`STATUS.md` `3.18` and `3.21 (e1)`)

### 1.1 Two-step Stein cumulant expansion for $h(x) = |x|$ on $\mathcal{H}_3(\mathbb{R}^N)$

Let $F \in \mathcal{H}_3(\mathbb{R}^N)$ have unit variance $\mathbb{E}[F^2] = 1$, fourth cumulant $\kappa_4(F) = \mathbb{E}[F^4] - 3 > 0$, and sixth cumulant $\kappa_6(F) = \mathbb{E}[F^6] - 15\mathbb{E}[F^4] + 30$. By the reviewed universal sixth-cumulant bound on $\mathcal{H}_3$ ([`STATUS.md`](../../STATUS.md) `3.21 (e4)`, certified in `third-chaos-dimfree-gemini-c1de/certify_sixth.py`, **P + C**), $|\kappa_6(F)| \le 67\,\kappa_4(F)^{3/2}$.

For $G \sim N(0, 1)$ and $c := \mathbb{E}|G| = \sqrt{2/\pi}$, integration by parts gives $\mathbb{E}[\operatorname{He}_4(G)|G|] = -c$ and $\mathbb{E}[\operatorname{He}_6(G)|G|] = 3c$, so the fourth- and sixth-order Hermite coefficients of $|x|$ are $-\frac{c}{24}$ and $+\frac{3c}{720} = +\frac{c}{240}$. By the reviewed two-step third-chaos cumulant-remainder identity (`edgeworth-codex-a7c4/PROOF.md` eq. (9) and [`KCR`](../cumulant-remainder-codex-a7c4/PROOF.md), **P**; passed to $h(x) = |x|$ via $h_\eta(x) = \sqrt{x^2 + \eta^2} \to |x|$ as $\eta \downarrow 0$ since all derivatives past the first act on the smooth normal Stein solution $\phi_h$),
$$\mathbb{E}|F| = c\left(1 - \frac{\kappa_4(F)}{24} + \frac{\kappa_6(F)}{240}\right) + R_{|x|}(F),$$
where $R_{|x|}(F)$ is a linear combination of expectations $\mathbb{E}[g_{k,l}(F)\,W_{j,k,l}(F)]$ ($j, k \in \{2, 4\}$, $l \in \{0, 2, 4, 6, 8\}$) of the two-step Ornstein–Uhlenbeck semigroup functions $g_{k,l} = \mathcal{A}_{l/3}\mathcal{A}_{k/3}\psi$ applied to $\psi(x) = \phi_{|x|}'''(x)$ (with $\phi_{|x|}''(x) - x\phi_{|x|}'(x) = |x| - c$).

### 1.2 Exact Gaussian scale-mixture collapse of $g_{k,l}(x)$

Solving $\phi_{|x|}''(x) - x\phi_{|x|}'(x) = |x| - c$ gives
$$\phi_{|x|}'(x) = e^{x^2/2}\int_x^\infty (c - |t|)e^{-t^2/2}\,dt = -\frac{c}{2}\int_0^1 (1 - w)^{-1/2}\exp\!\left(-\frac{w x^2}{2(1 - w)}\right)dw.$$
Applying $P_t e^{-\alpha x^2/2}(x) = (1 + \alpha(1 - e^{-2t}))^{-1/2}\exp(-\frac{\alpha e^{-2t}x^2}{2(1 + \alpha(1 - e^{-2t}))})$ twice inside $\mathcal{A}_a = \int_0^\infty e^{-at}P_t\,\frac{d}{dx}\,dt$ ($a = k/3$, $b = l/3$) and changing variables to $\theta = \frac{w e^{-2(t_1 + t_2)}}{1 - w + w e^{-2(t_1 + t_2)}} \in (0, 1)$ collapses the triple integral to a single positive-kernel integral on $(0, 1)$:

**Lemma 1.1** (**P + C, author only**). *For every $k \in \{2, 4\}$, $l \in \{0, 2, 4, 6, 8\}$, and $x \in \mathbb{R}$,*
$$g_{k,l}(x) = -\frac{c}{2}\int_0^1 W_{k/3,\,l/3}(\theta)\,\theta^2\left[(1 - \theta)^{-5/2} h_4\!\left(\frac{\theta x^2}{1 - \theta}\right) - 3\right]d\theta,$$
*where $h_4(s) := (s^2 - 6s + 3)e^{-s/2}$ and, for $\alpha = k/3$ and $\beta = l/3$ ($d = \beta + 2 - \alpha > 0$),*
$$W_{\alpha,\beta}(\theta) := \frac{1}{d}\left(\frac{\theta^{-(\beta+4)/2} - 1}{\beta + 4} - \frac{\theta^{-(\alpha+2)/2} - 1}{\alpha + 2}\right) > 0$$
*is strictly positive and strictly decreasing on $\theta \in (0, 1)$, satisfying $W_{\alpha,\beta}(\theta) \le \frac{\theta^{-(\beta+4)/2}}{d(\beta + 4)}$ on $(0, 1)$ and $W_{\alpha,\beta}(1 - t) \le \frac{t^2}{8}(1 - t)^{-(\beta+6)/2}$ for $t = 1 - \theta \in (0, 1)$.*

*Proof.* Integrating over $(w, e^{-2t_1}, e^{-2t_2})$ at fixed $\theta$ gives $W_{\alpha,\beta}(\theta) = \frac{1}{2}\int_\theta^1 u^{-(\beta+6)/2}\frac{u^{(d/2)} - 1}{d/2}\,du = \frac{1}{d}\big(\frac{\theta^{-(\beta+4)/2}-1}{\beta+4} - \frac{\theta^{-(\alpha+2)/2}-1}{\alpha+2}\big)$. Since $W_{\alpha,\beta}'(\theta) = -\frac{1}{2d}\theta^{-(\beta+6)/2}(1 - \theta^{d/2}) < 0$ on $(0, 1)$ and $W_{\alpha,\beta}(1) = 0$, $W_{\alpha,\beta}$ is positive and strictly decreasing. Dropping $-\frac{\theta^{-(\alpha+2)/2}-1}{\alpha+2} - \frac{1}{\beta+4} < 0$ yields the left bound; using $1 - (1 - u)^{d/2} \le \frac{d}{2}u$ inside $-W_{\alpha,\beta}'(1 - u) \le \frac{u}{4}(1 - t)^{-(\beta+6)/2}$ for $0 \le u \le t$ and integrating over $[0, t]$ yields the right bound. $\square$

### 1.3 Elementary SOS Hermite–Gaussian envelopes and exact certification

**Lemma 1.2** (**P + C, author only**). *For all $s \ge 0$, $|h_4(s)| \le 3$, $|h_4'(s)| \le \frac{15}{2}$, and $|h_4(s) - 3| \le 3\sqrt{5}\sqrt{s}$.*

*Proof.* Using $e^{s/2} \ge \sum_{j=0}^m \frac{(s/2)^j}{j!}$ on $s \ge 0$:
- $3(1 + \frac{s}{2} + \frac{s^2}{8} + \frac{s^3}{48}) - (s^2 - 6s + 3) = s(\frac{s^2}{16} - \frac{5s}{8} + \frac{15}{2}) \ge 0$ (discriminant $-\frac{95}{64} < 0$);
- $3(1 + \frac{s}{2} + \frac{s^2}{8}) + (s^2 - 6s + 3) = \frac{11}{8}s^2 - \frac{9}{2}s + 6 > 0$ (discriminant $-\frac{51}{4} < 0$);
- $15(1 + \frac{s}{2} + \frac{s^2}{8}) - (s^2 - 10s + 15) = s(\frac{7}{8}s + \frac{35}{2}) \ge 0$ and $15 + (s^2 - 10s + 15) = (s - 5)^2 + 5 > 0$.
Multiplying by $e^{-s/2} > 0$ gives $|h_4(s)| \le 3$ and $|h_4'(s)| \le \frac{15}{2}$, hence $|h_4(s) - 3| \le \min(6, \frac{15}{2}s) \le \sqrt{6\cdot\frac{15}{2}s} = 3\sqrt{5}\sqrt{s}$. $\square$

In [`verify_near_gaussian.py`](../../code/sharp-radius-gemini-2762/verify_near_gaussian.py):
1. For $l \in \{0, 2, 4\}$, $|(1-\theta)^{-5/2}h_4 - 3| \le 3(1-\theta)^{-5/2} + 3$ is integrable against $\theta^2 W_{k/3, l/3}(\theta)$ at $\theta = 0$, giving pure constant bounds $|g_{k,l}(x)| \le A_{k,l}$ ($B_{k,l} = 0$). For $l \in \{6, 8\}$, on $(0, \theta_0]$ ($\theta_0 = 1/64$) Lemma 1.2 gives $|(1-\theta)^{-5/2}h_4(s) - 3| \le 3\sqrt{5}\,\theta^{1/2}(1-\theta)^{-3}|x| + 3((1-\theta)^{-5/2} - 1)$, removing the $\theta = 0$ singularity and yielding exact rational bounds $|g_{k,l}(x)| \le A_{k,l} + B_{k,l}|x|$ across $168$ monotone Riemann cells plus analytic tails on $(0, 2^{-18}]$ and $[1 - 2^{-14}, 1)$.
2. Substituting $(A_{k,l}, B_{k,l})$ into the reviewed contraction table of [`KCR`](../cumulant-remainder-codex-a7c4/PROOF.md) (`verify.py`, **P + C**) on $\kappa_4(F) \le \frac{1}{100}$ (where $\|F\|_4 = (3 + \kappa_4)^{1/4} \le \frac{33}{25}$ and $y = C/A \in [0, \sqrt{3/4}] \subset [0, 7/8]$, with $\sqrt{1 + y^2} \le 1 + y^2/2$) yields $|R_{|x|}(F)| \le \frac{P_5(y)}{27(1/2 + y^2)^{3/2}}\kappa_4(F)^{3/2}$. Exact Bernstein coefficients certify $Q_{10}(y) := (27 \cdot \frac{86}{25})^2(1/2 + y^2)^3 - P_5(y)^2 > 0$ on $y \in [0, 7/8]$ in **1 leaf** (zero subdivisions), proving $|R_{|x|}(F)| \le \frac{86}{25}\,\kappa_4(F)^{3/2} = 3.44\,\kappa_4(F)^{3/2}$.
3. On $\mathcal{H}_3(\mathbb{R}^N)$, $|\kappa_6(F)| \le 67\,\kappa_4(F)^{3/2}$ and Machin's enclosure $c \in [0.7978845600, 0.7978845610]$ give $C_{3/2,\mathrm{real}} := \frac{67}{240}c_{\mathrm{hi}} + \frac{86}{25} \le 3.6627427733$, certifying $\kappa_0 = \frac{1}{49000} < \big(\frac{c_{\mathrm{lo}}/48}{C_{3/2,\mathrm{real}}}\big)^2 = 0.0000205960\dots$ and $\kappa_1 = \frac{1}{12250} < \big(\frac{c_{\mathrm{lo}}/24}{C_{3/2,\mathrm{real}}}\big)^2 = 0.0000823843\dots$.
4. For $q \in H_{2,1}(\mathbb{C}^n)$ ($u = 1$), $q(e^{-i\theta}z) = e^{-i\theta}q(z)$ implies that $F_\theta := \sqrt{2}\operatorname{Re}(e^{-i\theta}q) \in \mathcal{H}_3(\mathbb{R}^{2n})$ has the same law as $F_0$ for all $\theta$, with $\mathbb{E}[F_0^2] = 1$, $\mathbb{E}|q|/(\sqrt{\pi}/2) = \mathbb{E}|F_0|/c$, and $\kappa_4(F_0) = \frac{3}{2}\chi(q)$ identically. Using Lean's $C_{6,\mathrm{cplx}} = \frac{4045313}{100000}$ (`sixth_moment_complex`) gives $C_{3/2,\mathrm{cplx}} := \frac{5 C_{6,\mathrm{cplx}}}{480} + \frac{86/25}{c_{\mathrm{lo}}}(\frac{3}{2})^{3/2} \le 8.3419355023$, certifying $\chi_0 = \frac{1}{72000} < (1/(32 C_{3/2,\mathrm{cplx}}))^2 = 0.0000140335\dots$ and $\chi_1 = \frac{1}{18000} < 0.0000561340\dots$ (while direct substitution of $\kappa_4(F_0) = \frac{3}{2}\chi(q)$ into (3) gives $\frac{2}{3}\kappa_0 = \frac{1}{73500}$ and $\frac{2}{3}\kappa_1 = \frac{1}{18375}$).
5. **Buffered PVD and exact remote K.** For any buffer $v \ge 0$, $q_v := (q + \sqrt{v}\,W)/\sqrt{u + v}$ (approximating $W$ by diffuse cubic sums $W_m \in H_{2,1}(\mathbb{C}^m)$) has $\chi(q_v) = \frac{u^2}{(u+v)^2}\chi(q) \le \chi(q) \le \chi_0$, so $\mathbb{E}|q + \sqrt{v}\,W| \le \frac{\sqrt{\pi}}{2}\sqrt{u + v} - \frac{\sqrt{\pi}\,\delta}{64(u + v)^{3/2}}$. Since $L = z_1(a + b|z_1|^2) \stackrel{d}{=} \sqrt{V_L}\,W$ ($a > 0, b \ge 0$, [`STATUS.md`](../../STATUS.md) `2.7`) satisfies $-B''(u) = \frac{\sqrt{\pi}}{4}\mathbb{E}_{V_L}[(u + V_L)^{-3/2}] > 0$, integrating against $V_L$ yields $B(u) - 2\mathbb{E}|L + q| \ge -\frac{B''(u)}{8}\delta > 0$ at every energy, price, and profile. $\square$

---

## 2. Diagnosis of `cert_916.json` at the binding peak $\chi \in [4, 17/4]$

Running [`diagnose_916.py`](../../code/sharp-radius-gemini-2762/diagnose_916.py) on `cert_916.json` (`K3R`) yields four findings:

1. **Binding Gram cuts and strict slackness of $Q \le 1$ and $R$** (**C**). Across rows 6–14 ($\chi \in [3, 11/2]$), the dual LP over $P_1 = \{p = (n, h, b, y, z)/s : 32n + 8h + 32b + 96y = 1\}$ binds on `b >= 0`, `z - y >= 0`, `c1(3447/1888)`, and `c1(2)`. At Row 10 ($\chi = 4$), the primal extremiser is $p^* = (0.004248, 0.014343, 0, 0.007805, 0.007805)$ ($\eta_{\mathrm{LP}} = 0.02089195$), where $b = 0$, $y = z$, $z^2 = n h$, and $Q := 4h = 0.229481 < 1$ is slack by $0.770519$; thus neither $Q \le 1$ nor the $(1 - Q)$-penalised cut $R$ alters the peak.
2. **Attainment by genuine cubic tensors in $\mathbb{C}^6$ and $\mathbb{C}^8$** (**C**). Multi-start optimization over genuine tensors $q \in H_{2,1}(\mathbb{C}^6)$ and $H_{2,1}(\mathbb{C}^8)$ reaches $(c_{\mathrm{vec}}\cdot\pi)/s = 0.02087744$ ($\mathbb{C}^6$) and $0.02088182$ ($\mathbb{C}^8$). Rationalising the $\mathbb{C}^6$ tensor (`diagnose_916.py` §2, checked in exact `Fraction` arithmetic) gives $s(q) = 3.99945296$ and $(c_{\mathrm{vec}}\cdot\pi)/s = 0.02087742$, within $1.455\times 10^{-5}$ of $\eta_{\mathrm{LP}}$ ($4 \times \mathrm{gap} = 5.82\times 10^{-5} < 10^{-4}$), proving fourth-order Gram looseness contributes less than $10^{-4}$.
3. **Bulk radial contact ridge** (**N**). The $4\times 4$ Schur complement of Row 10 has minimum $6.03\times 10^{-6}$ at $r = 0.870$, with $\{r : \mathrm{Schur}(r) < 5\times 10^{-4}\} = [0.060, 1.655]$.
4. **Insensitivity to global scalar $\mathbb{E}[c_2^3] \le M$** (**N**). Adjoining `(VI)` with a hypothetical global cap $\mathbb{E}[c_2^3] \le M$ at $\chi = 4$ gives Clarabel optima $0.9154357, 0.9154356, 0.9152542, 0.9062544$ at $M = 20, 12, 8, 5$, all above $\sqrt{\pi}/2 = 0.8862269$.

---

## 3. Fourth- and fifth-order damped radial Stein identities and `cert_915.json`

### 3.1 Undamped identities `(V)`–`(VII)`, Gram-phase Cauchy–Schwarz, and polynomial obstruction

Keep the notation of [`K3R`](../complex-radius-2026-11-17-gemini-2762/PROOF.md) §1 for $q \in H_{2,1}(\mathbb{C}^n)$: $V = |q|^2$, $F_k = \bar\partial_k q \in H_{2,0}$, $c_1 = \sum_j|\partial_j q|^2$, $c_2 = \sum_k|F_k|^2$, $a = \sum_j(\partial_j q)F_j$, $\alpha_2 = |a|^2$, $W_k = \bar\partial_k a = \sum_j F_j(\partial_j F_k) \in H_{3,0}$, $w = \sum_k|W_k|^2$, $b_{\mathrm{loc}} = \sum_k \overline{F_k}W_k$, $\tilde\beta = \operatorname{Re}(\bar q\,b_{\mathrm{loc}})$, and define the fifth-order mixed scalar
$$\tau_{ab} := \operatorname{Re}\big(\bar q\,a\,\overline{b_{\mathrm{loc}}}\big) = \operatorname{Re}\big(q\,\bar a\,b_{\mathrm{loc}}\big).$$

**Proposition 3.1** (**P + C, author only**). *Let $q \in H_{2,1}(\mathbb{C}^n)$ with $u = \mathbb{E}|q|^2$.*
1. *(Exact Gram-phase decomposition).* *Set $\rho = \operatorname{Re}(\bar q^2 a)/V$, $\rho_\perp := \operatorname{Im}(\bar q^2 a)/V$, $\tilde\beta = \operatorname{Re}(\bar q\,b_{\mathrm{loc}})$, and $\tilde\beta_\perp := \operatorname{Im}(\bar q\,b_{\mathrm{loc}})$ on $\{V > 0\}$ (all $0$ on $\{V = 0\}$). At every point of $\mathbb{C}^n$, $\rho^2 + \rho_\perp^2 = \alpha_2$, $\tilde\beta^2 + \tilde\beta_\perp^2 = V|b_{\mathrm{loc}}|^2 \le V c_2 w$, and*
   $$\tau_{ab} = \rho\tilde\beta + \rho_\perp\tilde\beta_\perp, \qquad \big(V\tau_{ab} - (V\rho)\tilde\beta\big)^2 \le \big(V^2\alpha_2 - (V\rho)^2\big)\big(V c_2 w - \tilde\beta^2\big).$$
2. *(Undamped Level-3 radial Stein identities).* *Because $W_k \in H_{3,0}(\mathbb{C}^n)$ is holomorphic, $\partial_j \overline{W_k} = \overline{\bar\partial_j W_k} \equiv 0$, so $\sum_j(\partial_j\overline{b_{\mathrm{loc}}})F_j = \sum_{j,k}(\partial_j F_k)\overline{W_k}F_j = \sum_k|W_k|^2 = w$ without introducing fourth-order derivatives of $q$. For any $h_5(v) = h_{5,0} + \int_0^v \phi_5(t)\,dt$ and $g_6 = G_6/v,\, g_7 = G_7/v \in C^1([0, \infty))$ with derivatives of polynomial growth ($Y_i = \phi_i - g_i$):*
   $$\mathbb{E}\Big[w\,h_5(V) + \big(c_2\phi_5(V) - h_5(V)\big)\tilde\beta + \phi_5(V)\tau_{ab}\Big] = 0, \tag{V}$$
   $$\mathbb{E}\Big[c_2(c_2 - u)^2\phi_6(V) - (c_2 - u)^2 G_6(V) + (c_2 - u)^2\rho Y_6(V) + 2(c_2 - u)\tilde\beta\,g_6(V)\Big] = 0, \tag{VI}$$
   $$\mathbb{E}\Big[(c_2 - u)\alpha_2\phi_7(V) + (c_2 - u)\rho\big(c_2 Y_7(V) - G_7(V)\big) + (c_2 - u)\tilde\beta\,g_7(V) + \tau_{ab}\,g_7(V)\Big] = 0. \tag{VII}$$
3. *(Asymptotic obstruction to undamped polynomial Level 3).* *Without an input bounding $\mathbb{E}[c_2^3]$, the majorant budget in $(c_2, c_1, \rho)$ at fixed $V = v$ is quadratic, whereas subtracting `(VI)` or `(VII)` introduces cubic terms $-c_2^3\phi_6(v)$, $-c_2\alpha_2\phi_7(v)$, and $-c_2^2\rho Y_7(v)$, forcing $\phi_6 \le 0$ everywhere (which in turn makes $G_6(\infty) < 0$ penalise $+G_6(v)c_2^2$ on $[0, \infty)$) and $Y_7 \equiv 0$.*

*Proof.*
(1) On $\{V = 0\}$, $q = 0$ and both sides vanish. On $\{V > 0\}$, $\bar q^2 a = V(\rho + i\rho_\perp)$ gives $q^2\bar a = V(\rho - i\rho_\perp)$, while $\bar q\,b_{\mathrm{loc}} = \tilde\beta + i\tilde\beta_\perp$. Multiplying gives $V(q\,\bar a\,b_{\mathrm{loc}}) = (q^2\bar a)(\bar q\,b_{\mathrm{loc}}) = V(\rho - i\rho_\perp)(\tilde\beta + i\tilde\beta_\perp)$; cancelling $V > 0$ and taking real parts yields $\tau_{ab} = \rho\tilde\beta + \rho_\perp\tilde\beta_\perp$, hence $(V\tau_{ab} - (V\rho)\tilde\beta)^2 = V^2\rho_\perp^2\tilde\beta_\perp^2 \le (V^2\alpha_2 - (V\rho)^2)(V c_2 w - \tilde\beta^2)$.
(2) Apply Form I of Lemma 1 (`KAS`, $\mathbb{E}[H q] = \sum_j\mathbb{E}[(\partial_j H)F_j]$) to $H_5 = \overline{b_{\mathrm{loc}}}\,h_5(V)$, $H_6 = \bar q(c_2 - u)^2 g_6(V)$, and $H_7 = q\bar a(c_2 - u)g_7(V)$, using $\partial_j\bar q = \overline{F_j}$, $\partial_j\bar a = \overline{W_j}$, $\sum_j(\partial_j c_2)F_j = b_{\mathrm{loc}}$, and $\sum_j(\partial_j\overline{b_{\mathrm{loc}}})F_j = w$, then take real parts. (Checked on exact polynomials in $d = 2, 3$ by `check_identities_exact.py` Part A.) $\square$

### 3.2 Compactly-Supported Damped Level-3 hierarchy and soundness of `cert_915.json`

To eliminate all cubic powers of $(c_2, c_1, \rho)$ without any sixth-order kernel moment input, fix a rational damping parameter $\varepsilon > 0$ ($\varepsilon = \frac{1}{40}$ in `cert_915.json`) and define on $\mathbb{C}^n$:
$$s_{\mathrm{rat}} := \frac{1}{1 + \varepsilon c_2} \in (0, 1], \qquad \tilde\rho := s_{\mathrm{rat}}\rho, \qquad \Psi_6(c_2) := \frac{(c_2 - 1)^2}{1 + \varepsilon c_2}, \qquad \Psi_7(c_2) := \frac{c_2 - 1}{1 + \varepsilon c_2}.$$
Choose an interior knot index $1 \le K_0 < K$ ($e_{K_0} = 68$, $u_{K_0} = 4624$) and require $\phi_5 = \phi_6 = \phi_7 \equiv 0$ on $[u_{K_0}, \infty)$ together with the **exact compact-support integral conditions**
$$h_5(u_{K_0}) = h_{5,0} + \int_0^{u_{K_0}}\phi_5(t)\,dt = 0, \qquad G_6(u_{K_0}) = \int_0^{u_{K_0}}\phi_6(t)\,dt = 0, \qquad G_7(u_{K_0}) = \int_0^{u_{K_0}}\phi_7(t)\,dt = 0,$$
so $h_5(v) = g_6(v) = Y_6(v) = g_7(v) = Y_7(v) = 0$ identically on $[u_{K_0}, \infty)$.

**Theorem 3.2 (Damped identities `(V_eps)`–`(VII_eps)` and exact rational-basis soundness)** (**P + C, author only**).
1. *Applying Form I of Lemma 1 to $H_{5,\varepsilon} = s_{\mathrm{rat}}\overline{b_{\mathrm{loc}}}\,h_5(V)$, $H_{6,\varepsilon} = \bar q\,\Psi_6(c_2)g_6(V)$, and $H_{7,\varepsilon} = q\bar a\,\Psi_7(c_2)g_7(V)$ yields:*
   $$\mathbb{E}\Big[s_{\mathrm{rat}}w\,h_5(V) - \varepsilon s_{\mathrm{rat}}^2|b_{\mathrm{loc}}|^2 h_5(V) + \big(c_2\phi_5(V) - h_5(V)\big)s_{\mathrm{rat}}\tilde\beta + \phi_5(V)s_{\mathrm{rat}}\tau_{ab}\Big] = 0, \tag{V$_\varepsilon$}$$
   $$\mathbb{E}\Big[c_2\Psi_6(c_2)\phi_6(V) - \Psi_6(c_2)G_6(V) + \Psi_6(c_2)\rho Y_6(V) + \Psi_6'(c_2)\tilde\beta\,g_6(V)\Big] = 0, \tag{VI$_\varepsilon$}$$
   $$\mathbb{E}\Big[\Psi_7(c_2)\alpha_2\phi_7(V) + \Psi_7(c_2)\rho\big(c_2 Y_7(V) - G_7(V)\big) + \Psi_7(c_2)\tilde\beta\,g_7(V) + \Psi_7'(c_2)\tau_{ab}\,g_7(V)\Big] = 0, \tag{VII$_\varepsilon$}$$
   *where $\Psi_6'(c_2) = \frac{1}{\varepsilon}\big(1 - (1 + \varepsilon)^2 s_{\mathrm{rat}}^2\big)$ and $\Psi_7'(c_2) = (1 + \varepsilon)s_{\mathrm{rat}}^2$.*
2. *(Exact $(w, |b_{\mathrm{loc}}|^2)$ lower bound).* *Since $0 \le |b_{\mathrm{loc}}|^2 \le c_2 w$ and $1 - \varepsilon s_{\mathrm{rat}}c_2 = s_{\mathrm{rat}}$, at every point $s_{\mathrm{rat}}^2 w \le s_{\mathrm{rat}}w - \varepsilon s_{\mathrm{rat}}^2|b_{\mathrm{loc}}|^2 \le s_{\mathrm{rat}}w \le w$. Hence for any continuous piecewise-linear $D_w(v)$ on $[0, u_{K_0}]$ satisfying $0 < D_w(v) \le \min(\mu_w,\, \mu_w - h_5(v))$,*
   $$\mu_w w - s_{\mathrm{rat}}w\,h_5(V) + \varepsilon s_{\mathrm{rat}}^2|b_{\mathrm{loc}}|^2 h_5(V) \ge D_w(V)\,w.$$
   *(Indeed, if $h_5(V) \ge 0$, the LHS is $\ge (\mu_w - s_{\mathrm{rat}}h_5)w \ge (\mu_w - h_5)w \ge D_w w$; if $h_5(V) < 0$, $|h_5|\varepsilon s_{\mathrm{rat}}^2|b_{\mathrm{loc}}|^2 \ge 0$ gives LHS $\ge (\mu_w + s_{\mathrm{rat}}|h_5|)w \ge \mu_w w \ge D_w w$.)*
3. *(Soundness of the piecewise-linear $5\times 5$ knot matrix $T(v)$).* *Using $\tau_{ab} = \rho\tilde\beta + \rho_\perp\tilde\beta_\perp$, the linear coupling in $(\tilde\beta, \tilde\beta_\perp)$ on $(0, u_{K_0}]$ has coefficient vector in the 5-basis $\xi := (1,\, s_{\mathrm{rat}},\, s_{\mathrm{rat}}^2,\, \tilde\rho,\, s_{\mathrm{rat}}\tilde\rho)^\top$ (along $\tilde\beta$) and $(s_{\mathrm{rat}},\, s_{\mathrm{rat}}^2)^\top\rho_\perp$ (along $\tilde\beta_\perp$), represented by*
   $$V(v) := \begin{pmatrix} G_3 + G_4 + \varepsilon^{-1}(v\phi_5 + G_6 + G_7) \\ -\varepsilon^{-1}v\phi_5 - v h_5 - (1 + \varepsilon)\varepsilon^{-1}G_7 \\ -(1 + \varepsilon)^2\varepsilon^{-1}G_6 \\ v\phi_5 \\ (1 + \varepsilon)G_7 \end{pmatrix}.$$
   *Completing the square in $(\tilde\beta, \tilde\beta_\perp)$ under $\tilde\beta^2 + \tilde\beta_\perp^2 \le v c_2 w$ against $D_w(v)w > 0$ gives the exact quadratic penalty $-\frac{c_2}{4 v D_w(v)}\big[(V(v)^\top\xi)^2 + ((V_3(v), V_4(v))(s_{\mathrm{rat}}, s_{\mathrm{rat}}^2)^\top)^2(\alpha_2 - \rho^2)\big]$ (note $\tilde\rho^2 + s_{\mathrm{rat}}^2\rho_\perp^2 = s_{\mathrm{rat}}^2\alpha_2$). Suppose $T(v)$ is continuous and piecewise-linear on $[0, u_{K_0}]$ with $T(u_k) \succ 0$ at every knot $k = 0 \dots K_0$ (so $T(v) \succ 0$ on $[0, u_{K_0}]$ by convexity of the PD cone) and $4 v D_w(v)\det T(v) - V(v)^\top\operatorname{adj}(T(v))V(v) > 0$ on $[0, u_{K_0}]$ (divided by $v$ on $[0, u_1]$). Then $\Delta_T(v) := T(v) - (4 v D_w(v))^{-1}V(v)V(v)^\top \succeq 0$ on $[0, u_{K_0}]$ by Schur's complement, hence its bottom-right $2\times 2$ block $\Delta_{T,\mathrm{bot}}(v)$ is also $\succeq 0$, so replacing $(4 v D_w(v))^{-1}V(v)V(v)^\top$ by $T(v)$ subtracts*
   $$c_2\Big[\xi^\top\Delta_T(v)\xi + (s_{\mathrm{rat}}, s_{\mathrm{rat}}^2)\Delta_{T,\mathrm{bot}}(v)(s_{\mathrm{rat}}, s_{\mathrm{rat}}^2)^\top(\alpha_2 - \rho^2)\Big] \ge 0,$$
   *in which the $-\rho^2(s_{\mathrm{rat}}, s_{\mathrm{rat}}^2)\Delta_{T,\mathrm{bot}}(s_{\mathrm{rat}}, s_{\mathrm{rat}}^2)^\top$ term cancels $(\tilde\rho, s_{\mathrm{rat}}\tilde\rho)\Delta_{T,\mathrm{bot}}(\tilde\rho, s_{\mathrm{rat}}\tilde\rho)^\top$ identically!*
4. *(Exact degree collapse and four-block certification).* *Applying the exact rational identities*
   $$c_2 s_{\mathrm{rat}} = \frac{1 - s_{\mathrm{rat}}}{\varepsilon}, \qquad c_2\tilde\rho = \frac{\rho - \tilde\rho}{\varepsilon}$$
   *collapses every product of $c_2$ with $(s_{\mathrm{rat}}, s_{\mathrm{rat}}^2, \tilde\rho, s_{\mathrm{rat}}\tilde\rho)$ to degree at most $2$, decoupling $\mathrm{RHS} - r$ on $[0, u_{K_0}]$ into:*
   - *(a) $\alpha_2 - \rho^2 \ge 0$ multiplier $C_\alpha(s_{\mathrm{rat}}, v) = [1, s_{\mathrm{rat}}, s_{\mathrm{rat}}^2]A_0(v)[1, s_{\mathrm{rat}}, s_{\mathrm{rat}}^2]^\top + s_{\mathrm{rat}}(1 - s_{\mathrm{rat}})[1, s_{\mathrm{rat}}]A_1(v)[1, s_{\mathrm{rat}}]^\top \ge 0$ ($A_0(v) \succ 0$ on $[0, u_{K_0}]$, $A_1(u_k) \succeq 0$), plus $(\psi_a + \mu_a - \phi_4 - d_{\mathrm{al}})(\alpha_2 - \rho^2) \ge 0$ and $\psi_a(c_1 c_2 - \alpha_2) \ge 0$;*
   - *(b) $5\times 5$ rational-basis quadratic form $\xi^\top P_s(v)\xi + s_{\mathrm{rat}}(1 - s_{\mathrm{rat}})[1, s_{\mathrm{rat}}]B_1(v)[1, s_{\mathrm{rat}}]^\top > 0$ ($P_s(v) \succ 0$, $B_1(u_k) \succeq 0$), after borrowing $\mathrm{trt}_1(v)\tilde\rho^2 + \mathrm{trt}_2(v)(s_{\mathrm{rat}}\tilde\rho)^2 \le (\mathrm{trt}_1(v) + \mathrm{trt}_2(v))\rho^2$ from $M_{33}$ and $q_s(v)$ from $q_1(r)$;*
   - *(c) $4\times 4$ quadratic form $(c_2, c_1, \rho, 1)P^{(0)}(r)(c_2, c_1, \rho, 1)^\top > 0$.*
   *On $[u_{K_0}, \infty)$, compact support reduces $\mathrm{RHS} - r$ identically to the Level-2 $4\times 4$ matrix $P(r) \succ 0$ of [`K3R`](../complex-radius-2026-11-17-gemini-2762/PROOF.md) Theorem 4.* $\square$

---

## 4. The complex quintic chaos $H_{3,2}(\mathbb{C}^n)$

Because the Lean development covers degree 3 only, every identity and moment/contraction bound used on $H_{3,2}(\mathbb{C}^n)$ is proved from first principles below and machine-checked in [`check_identities_exact.py`](../../code/sharp-radius-gemini-2762/check_identities_exact.py) Part B.

### 4.1 Wick normalisation and diffuse lower bound

Every $q \in H_{3,2}(\mathbb{C}^n)$ has the unique representation $q(z) = \sum_{a,b,c,d,e=1}^n T_{abc;de}\,:z_a z_b z_c\bar z_d\bar z_e:$ with $T_{abc;de}$ symmetric in $(a, b, c)$ and symmetric in $(d, e)$, where
$$:z_a z_b z_c\bar z_d\bar z_e: \,=\, z_a z_b z_c\bar z_d\bar z_e - \sum_{\substack{h \in \{a,b,c\} \\ m \in \{d,e\}}} \delta_{h,m}\Big(\prod_{h'\ne h} z_{h'}\Big)\Big(\prod_{m'\ne m}\bar z_{m'}\Big) + \sum_{\substack{h_1 \ne h_2 \in \{a,b,c\}}} \delta_{h_1,d}\delta_{h_2,e}\,z_{h_3},$$
and $u = \mathbb{E}|q|^2 = 3!2!\|T\|_{\mathrm{HS}}^2 = 12\sum_{a,b,c,d,e}|T_{abc;de}|^2$. For $n = 1$, $H_{3,2}(\mathbb{C}^1)$ is spanned by the unit-variance Laguerre quintic
$$q_1(z) = \frac{z^3\bar z^2 - 6z^2\bar z + 6z}{\sqrt{12}} = \frac{z(|z|^4 - 6|z|^2 + 6)}{\sqrt{12}}, \qquad \mathbb{E}|q_1|^2 = 1,\quad \mathbb{E}|q_1|^4 = 1842,\quad \mathbb{E}|q_1|^6 = 59{,}735{,}934.$$
For i.i.d. coordinates, $Q_N = N^{-1/2}\sum_{j=1}^N q_1(z_j) \in H_{3,2}(\mathbb{C}^N)$ ($\chi = 1840/N$) and $M_K = K^{-1/2}\sum_{r=1}^K z_{5r-4}z_{5r-3}z_{5r-2}\bar z_{5r-1}\bar z_{5r} \in H_{3,2}(\mathbb{C}^{5K})$ ($\chi = 30/K$) have unit second moment and converge in law to $W \sim \mathcal{CN}(0, 1)$ by the Central Limit Theorem; uniform integrability ($\mathbb{E}|Q_N|^2 = \mathbb{E}|M_K|^2 = 1$) gives $\mathbb{E}|Q_N| \to \sqrt{\pi}/2$ and $\mathbb{E}|M_K| \to \sqrt{\pi}/2$, proving $\rho^*(H_{3,2}) \ge \sqrt{\pi}/2$.

### 4.2 Hyperplane-vanishing and conditionally Gaussian quintics

**Theorem 4.1 (Complex Hyperplane Theorem on $H_{3,2}(\mathbb{C}^n)$)** (**P + C, author only**). *Let $q \in H_{3,2}(\mathbb{C}^n)$ vanish identically on $\{X = 0\}$, where $X = \langle e, z\rangle$ ($\|e\|_2 = 1$) and $Y \in \mathbb{C}^{n-1}$ completes a unitary basis. Then $q$ decomposes orthogonally into nine $(X, Y)$ bidegree shells:*
$$q(X, Y) = \sum_{\substack{0 \le a \le 3,\, 0 \le b \le 2 \\ a + b \ge 1,\, a \ne b}} \psi_{a,b}(X)\,F_{3-a,\,2-b}(Y), \qquad F_{3-a,\,2-b} \in H_{3-a,\,2-b}(\mathbb{C}^{n-1}),$$
*where $\psi_{a,b}(X) = \sqrt{\frac{m!}{(m+k)!}}\,:X^a\bar X^b:$ ($m = \min(a,b)$, $k = |a - b| \ge 1$) has $|\psi_{a,b}(X)|^2 = P_{a,b}(R) := \frac{m!}{(m+k)!}R^k\big(L_m^{(k)}(R)\big)^2$ ($R = |X|^2 \sim \operatorname{Exp}(1)$, $\mathbb{E}[P_{a,b}(R)] = 1$). Putting $u_{a,b} = \|F_{3-a,2-b}\|_2^2$ ($u = \|q\|_2^2 = \sum_{(a,b)} u_{a,b}$) and $\tilde\gamma_{a,b} := \frac{\mathbb{E}_R[R^{-1/2}P_{a,b}(R)]}{\sqrt{\pi}/2}$, one has*
$$\tilde\gamma_{1,0} = \tilde\gamma_{0,1} = 1, \quad \tilde\gamma_{2,1} = \tilde\gamma_{1,2} = \frac{7}{8}, \quad \tilde\gamma_{3,2} = \frac{51}{64}, \quad \tilde\gamma_{2,0} = \tilde\gamma_{0,2} = \frac{3}{4}, \quad \tilde\gamma_{3,1} = \frac{11}{16}, \quad \tilde\gamma_{3,0} = \frac{5}{8},$$
*and consequently*
$$\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\sqrt{u}\left(1 - \frac{u_{2,1} + u_{1,2}}{16u} - \frac{13 u_{3,2}}{128u} - \frac{u_{2,0} + u_{0,2}}{8u} - \frac{5 u_{3,1}}{32u} - \frac{3 u_{3,0}}{16u}\right) \le \frac{\sqrt{\pi}}{2}\|q\|_2,$$
*with strict inequality unless $q$ lies purely in the conditionally Gaussian shells $(1, 0) \oplus (0, 1)$.*

*Proof.* Vanishing on $\{X = 0\}$ excludes the diagonal Laguerre shells $a = b$ (since $:X^m\bar X^m:\big|_{X=0} = (-1)^m m! \ne 0$, whereas every $a \ne b$ contains $X^k$ or $\bar X^k$ with $k \ge 1$). For $(a, b) \ne (a', b')$, the cofactors $F_{3-a, 2-b}(Y)$ and $F_{3-a', 2-b'}(Y)$ have distinct bidegrees $(3 - a, 2 - b) \ne (3 - a', 2 - b')$, hence are orthogonal in $L^2(\gamma_{\mathbb{C}^{n-1}})$. Conditioning on $X$ therefore gives $V_X(R) := \mathbb{E}_Y[|q(X, Y)|^2 \mid X] = \sum_{(a,b)} P_{a,b}(R)\,u_{a,b}$, and Cauchy–Schwarz in $Y$ gives $\mathbb{E}_Y[|q(X, Y)| \mid X] \le \sqrt{V_X(R)}$. Applying the concave tangent inequality $\sqrt{v} \le \sqrt{u R} + \frac{v - u R}{2\sqrt{u R}}$ ($u > 0$, $R > 0$) and integrating over $R \sim \operatorname{Exp}(1)$ ($\mathbb{E}[\sqrt{R}] = \sqrt{\pi}/2$) yields
$$\mathbb{E}|q| \le \mathbb{E}_R\!\left[\sqrt{u R} + \frac{V_X(R) - u R}{2\sqrt{u R}}\right] = \frac{\sqrt{\pi}}{2}\sqrt{u}\left(1 - \sum_{(a,b)} \frac{1 - \tilde\gamma_{a,b}}{2}\,\frac{u_{a,b}}{u}\right).$$
Using $\mathbb{E}[R^{n - 1/2}] = \frac{(2n)!}{4^n n!}\sqrt{\pi}$, [`check_identities_exact.py`](../../code/sharp-radius-gemini-2762/check_identities_exact.py) (lines 456–479) evaluates $\tilde\gamma_{a,b}$ in exact `Fraction` arithmetic for all nine shells, obtaining the stated rational values $\le 1$. Likewise, for any conditionally proper Gaussian quintic $q$ given $\mathcal{F}$ ($\mathbb{E}[|q|^2 \mid \mathcal{F}] = \sigma_{\mathcal{F}}^2$), Jensen gives $\mathbb{E}|q| = \frac{\sqrt{\pi}}{2}\mathbb{E}[\sigma_{\mathcal{F}}] \le \frac{\sqrt{\pi}}{2}\|q\|_2$. Since $\sum \alpha_j = 3 \ne 2 = \sum \beta_j$, every single Wick monomial $:z^\alpha\bar z^\beta:$ in $H_{3,2}(\mathbb{C}^n)$ has at least one coordinate with $\alpha_j \ne \beta_j$, hence vanishes on $\{z_j = 0\}$ and satisfies $\mathbb{E}|q| \le (\sqrt{\pi}/2)\|q\|_2$. $\square$

### 4.3 Antiholomorphic Stein identities, moments, and diagram bound on $H_{3,2}(\mathbb{C}^n)$

**Proposition 4.2 (Stein identities `Form I` & `Form II` on $H_{3,2}(\mathbb{C}^n)$)** (**P + C, author only**). *Let $q \in H_{3,2}(\mathbb{C}^n)$. For every $H \in C^1(\mathbb{C}^n)$ with $H, \nabla H$ of polynomial growth,*
$$\mathbb{E}[H q] = \frac{1}{2}\sum_{k=1}^n \mathbb{E}\big[(\partial_k H)\,\bar\partial_k q\big] = \frac{1}{3}\sum_{j=1}^n \mathbb{E}\big[(\bar\partial_j H)\,\partial_j q\big].$$
*In particular, with $V = |q|^2$, $c_1 = \sum_j|\partial_j q|^2$, $c_2 = \sum_k|\bar\partial_k q|^2$, $a = \sum_j(\partial_j q)(\bar\partial_j q)$, and $\rho = \operatorname{Re}(\bar q^2 a)/V$ ($0$ on $\{V = 0\}$), for any $g_i = G_i/v \in C^1([0, \infty))$ ($G_i' = \phi_i$, $Y_i = \phi_i - g_i$):*
$$\mathbb{E}\Big[G_1(V) - \tfrac{1}{2}c_2\phi_1(V) - \tfrac{1}{2}\rho Y_1(V)\Big] = 0, \qquad \mathbb{E}\Big[G_2(V) - \tfrac{1}{3}c_1\phi_2(V) - \tfrac{1}{3}\rho Y_2(V)\Big] = 0,$$
*giving $\mathbb{E}[c_2] = 2u$ and $\mathbb{E}[c_1] = 3u$ at $g_i \equiv 1$.*

*Proof.* On $L^2(\gamma_{\mathbb{C}^n})$ ($\langle f, g\rangle = \mathbb{E}[\bar f g]$), the holomorphic and antiholomorphic number operators $N_1 = \sum_j \partial_j^*\partial_j$ and $N_2 = \sum_k \bar\partial_k^*\bar\partial_k$ act on $H_{p,p'}$ as $p\,\mathrm{Id}$ and $p'\,\mathrm{Id}$. Since $q \in H_{3,2}$, $\sum_k\mathbb{E}[(\partial_k H)\bar\partial_k q] = \sum_k\langle \bar\partial_k\bar H, \bar\partial_k q\rangle = \langle \bar H, N_2 q\rangle = 2\langle \bar H, q\rangle = 2\mathbb{E}[H q]$, and $\sum_j\mathbb{E}[(\bar\partial_j H)\partial_j q] = \sum_j\langle \partial_j\bar H, \partial_j q\rangle = \langle \bar H, N_1 q\rangle = 3\mathbb{E}[H q]$. Setting $H = \bar q g_i(V)$ and taking real parts yields `Form I` and `Form II`. $\square$

**Theorem 4.3 (Fourth-moment cap, kernel variance budgets, and sixth-moment diagram bound on $H_{3,2}(\mathbb{C}^n)$)** (**P + C, author only**). *For every $q = I_{3,2}(T) \in H_{3,2}(\mathbb{C}^n)$ with $u = \mathbb{E}|q|^2 = 12\|T\|_{\mathrm{HS}}^2$ and $\delta = \mathbb{E}|q|^4 - 2u^2 = u^2 s$:*
1. **$0 \le \chi(q) \le 1840$**: *Writing $V = \sum_{p=0}^5 V_{p,p}$ ($V_{p,p} \in H_{p,p}$), triangle inequality, orthogonal projection $\|\operatorname{Sym}_{p,p} A\|_{\mathrm{HS}} \le \|A\|_{\mathrm{HS}}$, and Cauchy–Schwarz $\|T \otimes_{r_1,r_2}\bar T\|_{\mathrm{HS}} \le \|T\|_{\mathrm{HS}}^2 = u/12$ imply $\|V_{p,p}(q)\|_2 \le \|V_{p,p}(q_1)\|_2$ for each $p = 0 \dots 5$, so $\mathbb{E}|q|^4 = \sum_{p=0}^5\|V_{p,p}\|_2^2 \le (1 + 25 + 256 + 784 + 676 + 100)u^2 = 1842\,u^2$ ($\chi \le 1840$, attained at $q_1$). Meanwhile, for $F_\theta := \sqrt{2}\operatorname{Re}(e^{-i\theta}q) \in \mathcal{H}_5(\mathbb{R}^{2n})$, $F_\theta \stackrel{d}{=} F_0$ has $\mathbb{E}[F_\theta^2] = u$ and $F_\theta^2 = u + \sum_{k=1}^5 J_{2k}(F_\theta)$, so Gaussian integration by parts $\mathbb{E}[F_\theta^4] = \frac{3}{5}\mathbb{E}[F_\theta^2\Gamma(F_\theta, F_\theta)]$ gives*
   $$\frac{3}{2}\delta = \kappa_4(F_\theta) = \frac{3}{5}\sum_{k=1}^4 (5 - k)\,\|J_{2k}(F_\theta)\|_2^2 \ge 0.$$
2. **$0 \le \mathbb{E}[V\rho] \le \frac{5}{2}\delta$ and $\mathbb{E}[(c_1 + c_2 - 5u)^2] + 2\mathbb{E}|a|^2 \le 10\delta$**: *In real coordinates $z_j = (x_j + iy_j)/\sqrt{2}$, $\Gamma(F_\theta, F_\theta) - 5u = (c_1 + c_2 - 5u) + 2\operatorname{Re}(e^{-2i\theta}a) = \sum_{k=1}^4 (5 - k)J_{2k}(F_\theta)$. Since $(5 - k)^2 \le 4(5 - k)$ for $1 \le k \le 4$,*
   $$\operatorname{Var}(\Gamma(F_\theta, F_\theta)) = \sum_{k=1}^4 (5 - k)^2\|J_{2k}(F_\theta)\|_2^2 \le 4 \cdot \frac{5}{3}\kappa_4(F_\theta) = 10\delta.$$
   *Averaging over $\theta \in [0, 2\pi)$ gives $\mathbb{E}[(c_1 + c_2 - 5u)^2] + 2\mathbb{E}|a|^2 = \int_0^{2\pi}\operatorname{Var}(\Gamma(F_\theta, F_\theta))\frac{d\theta}{2\pi} \le 10\delta$. Likewise, $L_{\mathbb{C}}(q^2) = -10q^2 + 4a$ on $q^2 = \sum_{r=0}^4 Q_{r+2,r}$ gives $a = \sum_{r=0}^3 (2 - \frac{r}{2})Q_{r+2,r}$, so $\mathbb{E}[V\rho] = \operatorname{Re}\langle q^2, a\rangle = \sum_{r=0}^3 (2 - \frac{r}{2})\|Q_{r+2,r}\|_2^2 \ge 0$; averaging $\mathbb{E}[(F_\theta^2 - u)(\Gamma(F_\theta, F_\theta) - 5u)] = \frac{5}{2}\delta$ over $\theta$ gives $\sum_{p=1}^4 (5 - p)\|V_{p,p}\|_2^2 + \mathbb{E}[V\rho] = \frac{5}{2}\delta$, hence $0 \le \mathbb{E}[V\rho] \le \frac{5}{2}\delta$.*
3. **$\mathbb{E}[(c_2 - 2u)^2] \le \frac{1013}{100}\delta \le 12\delta$**: *Expanding $c_2 = 4\sum_e |\sum T_{abc;de}:z_a z_b z_c\bar z_d:|^2$ into its chaos projections $H_{1,1} \oplus H_{2,2} \oplus H_{3,3} \oplus H_{4,4}$ expresses $\operatorname{Var}(c_2)$ and $\|V_{5,5}\|_2^2 - u^2 + \|V_{1,1}\|_2^2 \le \delta$ in terms of the five nonnegative 2-slot/3-slot contraction norms $(C_{(1,0)}, C_{(0,1)}, C_{(1,1)}, C_{(0,2)}, C_{(2,0)}) \ge 0$ of $T$. Applying Cauchy–Schwarz with rational weights $(\frac{19}{5}, \frac{51}{250}, \frac{19}{125})$ (verified in `check_identities_exact.py` lines 480–500) bounds each of the five contraction coefficients of $\operatorname{Var}(c_2)$ by at most $\frac{1013}{100}$ times its weight in $\|V_{5,5}\|_2^2 - u^2 + \|V_{1,1}\|_2^2 \le \delta$ (and at weights $(\frac{1}{4}, \frac{1}{2}, \frac{1}{5})$ by at most $12(\|V_{5,5}\|_2^2 - u^2) \le 12\delta$).*
4. **$\mathbb{E}[V^3] \le 6u^3 + 9u\delta + 115400\,\delta^{3/2}$**: *By the Gaussian diagram formula for $(I_{3,2}(T)\overline{I_{3,2}(T)})^3$, $\mathbb{E}[V^3]$ sums over all loopless directed multigraphs on $3$ vertices of out/in-degree $(3, 2)$ and $3$ conjugate vertices of out/in-degree $(2, 3)$. Disconnected diagrams evaluate exactly to $6u^3 + 9u\delta$ (`59,735,934 - 59,719,368 = 16,566 = 6 + 9 * 1840` at $q_1$). In `check_identities_exact.py` lines 501–662, we enumerate all $154{,}578$ loopless directed multigraphs ($2{,}985{,}984 \times 59{,}735{,}934 / 1728$ total pairings), verify connectivity via BFS ($59{,}719{,}368 \times 1728$ connected pairings), match the $6$ vertices into $3$ disjoint pairs by Hall/Cauchy–Schwarz into $68$ canonical exponent buckets on $(C_i)_{i=1}^5$, and apply weighted AM–GM at $g = (\frac{4}{5}, \frac{87}{100}, \frac{27}{20}, \frac{117}{100}, \frac{22}{25})$ against $\|V_{5,5}\|_2^2 - u^2 + \|V_{1,1}\|_2^2 \le \delta$, proving $\kappa_6^{\mathbb{C}}(q) \le 115302.880138\,\delta^{3/2} \le 115400\,\delta^{3/2}$.* $\square$

### 4.4 Soundness of `cert_h32.json` and dual verification

On $s \in [0, 1840]$, [`cert_h32.json`](../../code/sharp-radius-gemini-2762/cert_h32.json) partitions $[0, 1840]$ into $14$ contiguous intervals:
- Rows 0–8 ($[0, 140]$): Stein-coupled $4\times 4$ matrix rows on $(c_2, c_1, \rho, 1)$ combining `Form I`, `Form II`, $(\sigma_+ - \sigma_-)V\rho$, $\mu_{\mathrm{bud}}((c_1 + c_2 - 5)^2 + 2\alpha_2)$, and $\mu_{c_2}(c_2 - 2)^2$, with upper-left $3\times 3$ block $\operatorname{diag}\!\left(\begin{pmatrix} \mu_{\mathrm{bud}}+\mu_{c_2} & \mu_{\mathrm{bud}}-\psi_a/2 \\ \mu_{\mathrm{bud}}-\psi_a/2 & \mu_{\mathrm{bud}} \end{pmatrix},\, 2\mu_{\mathrm{bud}} + \psi_a\right) \succ 0$;
- Rows 9–13 ($[140, 1840]$): pure-moment degree-$6$ radial majorants $\lambda_0 + \lambda_1 r^2 + \lambda_2 r^4 + \lambda_3 r^6 > r$ on $[0, \infty)$ ($\lambda_3 > 0$), exploiting $\lambda_2 < 0$ against $\mathbb{E}[V^2] = 2 + s$ to keep $\mathbb{E}|q| \le 0.9999968653 < \frac{999999}{1000000}$ all the way to $s = 1840$.

[`verify_cert_h32.py`](../../code/sharp-radius-gemini-2762/verify_cert_h32.py) verifies every row of `cert_h32.json` independently by **both** exact integer Sturm chains and exact integer Bernstein subdivision (`912` leaves total, `5.05s`).

---

## 5. Verification suite, file hashes, negative controls, and replay

All verification scripts live in [`research/conjecture-K/code/sharp-radius-gemini-2762/`](../../code/sharp-radius-gemini-2762/), use **only the Python 3 standard library** (`fractions`, `json`, `math`, `sys`, `copy`, `os`, `subprocess`, `tempfile`, `time`, `random`), perform **zero floating-point operations** (`float` is never called in any verifier), and enforce all checks via `require(...)` raising exceptions (safe under `python3 -I -O` bytecode optimisation).

| file | size | SHA-256 / role |
|---|---:|---|
| [`cert_915.json`](../../code/sharp-radius-gemini-2762/cert_915.json) | `283,678 B` | SHA-256 `002dc15f7de8d265665a0bd5bb512875921e13be566d5de698a6a3a265754abc` — 14-row $H_{2,1}$ certificate (`claim = 1829/2000`, `sharp_hi_s = 26`, `sharp_hi_claim = 443/500`) |
| [`cert_h32.json`](../../code/sharp-radius-gemini-2762/cert_h32.json) | `51,236 B` | SHA-256 `f0074f28c7ee33f864999a4a8891e91773414640703be3e65d9c4d8bdf890a1a` — 14-row $H_{3,2}$ certificate (`claim = 999999/1000000`) |
| [`verify_near_gaussian.py`](../../code/sharp-radius-gemini-2762/verify_near_gaussian.py) | stdlib exact | Certifies Theorem 1 ($\kappa_0 = 1/49000, \kappa_1 = 1/12250, \chi_0 = 1/72000, \chi_1 = 1/18000$) |
| [`check_identities_exact.py`](../../code/sharp-radius-gemini-2762/check_identities_exact.py) | stdlib exact | Checks $H_{2,1}$ `(V)`–`(VII)`, $H_{3,2}$ identities/hyperplane/154,578 multigraphs, and degree-5 small-$t$ bounds |
| [`verify_cert_level3.py`](../../code/sharp-radius-gemini-2762/verify_cert_level3.py) | stdlib exact | Exact integer Sturm-sequence verifier of `cert_915.json` |
| [`verify_bernstein_level3.py`](../../code/sharp-radius-gemini-2762/verify_bernstein_level3.py) | stdlib exact | Independent exact determinant + Bernstein subdivision verifier of `cert_915.json` |
| [`verify_cert_h32.py`](../../code/sharp-radius-gemini-2762/verify_cert_h32.py) | stdlib exact | Dual Sturm + Bernstein verifier of `cert_h32.json` |
| [`negative_controls.py`](../../code/sharp-radius-gemini-2762/negative_controls.py) | stdlib exact | Adversarial mutation tests across all four exact verifiers (unit + row + CLI `-I -O`) |
| [`make_cert_level3.py`](../../code/sharp-radius-gemini-2762/make_cert_level3.py), [`make_cert_h32.py`](../../code/sharp-radius-gemini-2762/make_cert_h32.py) | generators | Standalone certificate generators (`numpy`, `scipy`, `clarabel`) |
| [`diagnose_916.py`](../../code/sharp-radius-gemini-2762/diagnose_916.py), [`search_quintic_h32.py`](../../code/sharp-radius-gemini-2762/search_quintic_h32.py) | diagnostics | Row-10 obstruction diagnosis (`C` + `N`) and $H_{3,2}(\mathbb{C}^d)$ survey (`N`) |

### Replay commands

From `research/conjecture-K/code/sharp-radius-gemini-2762/`:
```bash
python3 -I -O verify_near_gaussian.py
python3 -I -O check_identities_exact.py
python3 -I -O verify_cert_level3.py cert_915.json
python3 -I -O verify_bernstein_level3.py cert_915.json
python3 -I -O verify_cert_h32.py cert_h32.json
python3 -I -O negative_controls.py cert_915.json cert_h32.json
```
Full transcript and timings are recorded in [`REPLAY.log`](../../code/sharp-radius-gemini-2762/REPLAY.log).
