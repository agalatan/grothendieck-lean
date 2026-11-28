# Oscillation-Preserving Near-Gaussian Cone, Enhanced Third-Chaos Level-2+ Hierarchy (`kappa_4 >= 5`), and Dimension-Free Fifth-Chaos OU Tower on `V_5(R^n)` & `H_{3,2}(C^n)`

1. **Summary & Status (`P + C, author only`, `gemini-8732`, 28 November 2026; Refs `#458`, tag `KCS458`).**
2. **Theorem 1 (Oscillation-Preserving Two-Step Ornstein–Uhlenbeck Near-Gaussian Cone — `STATUS.md` `3.18`, `3.21 (e1)`):** Every two-step Ornstein–Uhlenbeck semigroup function $g_{k,\ell}(x)$ ($(k, \ell) \in \{2, 4\} \times \{0, 2, 4, 6, 8\}$) in the exact second-order Stein cumulant expansion of $|F|$ on $V_3(\mathbb{R}^n)$ satisfies the singularity-free Gaussian scale-mixture representation
   $$g_{k,\ell}(x) = g_{k,\ell}(0) + \frac{c}{2}\int_0^1 (1 - \theta)^{-1/2} K_{k/3, \ell/3}(\theta)\left(1 - \exp\!\left(-\frac{\theta x^2}{2(1 - \theta)}\right)\right)d\theta \qquad \left(c := \sqrt{\frac{2}{\pi}}\right),$$
   with $g_{k,\ell}$ globally bounded on $\mathbb{R}$ and $g_{k,\ell}(\infty) = \frac{9c}{2(6 - \ell)(12 - k)}$ when $\ell \in \{0, 2, 4\}$, while for $\ell \in \{6, 8\}$ one has $K_{k/3, \ell/3}(\theta) \sim \frac{(\ell/3)^2 - 1}{d(\ell/3 + 4)}\theta^{-\ell/6} > 0$ as $\theta \to 0^+$ (so $g_{k,\ell}(x) \to +\infty$ as $|x| \to \infty$ by monotone convergence, with $K_{k/3, \ell/3}(\theta) > 0$ strictly on $(0, 1]$ for all $\ell \in \{4, 6, 8\}$ and global sublinear-in-$|x|$ envelopes $|g_{k,\ell}(x) - c_{k,\ell}| \le A_{k,\ell} + B_{k,\ell}|x|$). Combined with Wiener-chaos orthogonality $U \in V_2 \oplus V_4 \perp V_0 \oplus V_6 \oplus V_8$ and $1 - e^{-u} \le \frac{16}{25}\sqrt{u}$, this certifies $|R_{|x|}(F)| \le \frac{21}{20}\,\kappa_4(F)^{3/2} = 1.05\,\kappa_4(F)^{3/2}$ on $\kappa_4(F) \le \frac{1}{100}$ (down from $\frac{86}{25} = 3.44$ in `KSR`), expanding all four explicit near-Gaussian sharp regimes by **$8.30\times$–$8.67\times$**:
   - **Real $V_3(\mathbb{R}^n)$ (`3.21 (e1)`):** $\mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\|F\|_2\big(1 - \frac{\kappa_4(F)}{48}\big)$ for $0 < \kappa_4(F) \le \kappa_0 := \frac{1}{5900}$ (was $\frac{1}{49000}$, **$8.30\times$** larger), and strict $\mathbb{E}|F| < \sqrt{\frac{2}{\pi}}\|F\|_2$ for $0 < \kappa_4(F) \le \kappa_1 := \frac{1}{1475}$ (was $\frac{1}{12250}$, **$8.30\times$** larger).
   - **Complex $H_{2,1}(\mathbb{C}^n)$ (`3.18`):** $\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\sqrt{u}\big(1 - \frac{\chi}{32}\big)$, buffered PVD $\mathbb{E}|q + \sqrt{v}\,W| \le \frac{\sqrt{\pi}}{2}\sqrt{u + v}$ ($v \ge 0$, for $W \sim \mathcal{CN}(0, 1)$ independent of $q$), and exact remote Conjecture K $B(u) - 2\mathbb{E}|L + q| \ge \big(-\frac{B''(u)}{8}\big)\delta > 0$ at every energy, price, and visible profile $L = z_1(a + b|z_1|^2)$ ($a > 0, b \ge 0$, with $z_1 \sim \mathcal{CN}(0, 1)$ independent of the remote cubic $q$) for $0 < \chi(q) \le \chi_0 := \frac{1}{8300}$ using Lean's $C_{6,\mathbb{C}} = \frac{4045313}{100000}$ (was $\frac{1}{72000}$, **$8.67\times$** larger; or $\chi \le \frac{1}{8850}$ via $U(1)$ transfer), and strict $\mathbb{E}|q| < \frac{\sqrt{\pi}}{2}\sqrt{u}$ for $0 < \chi(q) \le \chi_1 := \frac{1}{2075}$ (was $\frac{1}{18000}$, **$8.67\times$** larger; or $\chi \le \frac{1}{2215}$ via $U(1)$ transfer).
3. **Theorem 2 (Enhanced Real Level-2+ Malliavin–Stein Hierarchy on $V_3(\mathbb{R}^n)$ — `STATUS.md` `3.21 (e1)`, `3.21 (e9)`):** Augmenting the real Level-2 carré-du-champ hierarchy with the pointwise operator-norm bound $\nu_r^2 \le 3\sqrt{m}\,\tau\,\eta$, the exact Wiener–Itô contraction $\mathbb{E}[\nu^2] = 9\|\operatorname{Sym}_3(T M)\|_{\mathrm{HS}}^2 + 6\|\operatorname{tr}(T_\bullet M)\|_2^2 \le 9\operatorname{tr}(M^3) + 6 m^{3/2}$, the exact second-chaos central moments $\mathbb{E}[(\eta - 1)^3] = 8\operatorname{tr}(M^3)$ and $\mathbb{E}[(\eta - 1)^4] = 12 m^2 + 48\operatorname{tr}(M^4) \le 12 m^2 + 48\sqrt{m}\operatorname{tr}(M^3)$, and an exact 4-corner $(s_*, \theta_*) \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\} \times \{0, 1\}$ affine envelope coupling $\operatorname{tr}(M^3) = (1 - \theta)m^2 + \theta m^{3/2}$ across all four moments (`cert_v3_458.json`, 21 contiguous slabs covering $\kappa_4 \in [0, 90]$) proves unconditionally for all $n \ge 1$ and all nonzero $F \in V_3(\mathbb{R}^n)$:
   - **Sharp Gaussian bound for $\kappa_4(F) \ge 5$:** $\mathbb{E}|F| \le \frac{19946}{25000}\|F\|_2 = 0.79784\,\|F\|_2 < \sqrt{\frac{2}{\pi}}\|F\|_2$ across $\kappa_4(F) \in [5, 90]$ (max $\le 0.79780661$ on $[5, \frac{11}{2}]$, and $\le \frac{3989}{5000}\|F\|_2 = 0.7978\,\|F\|_2$ across $[\frac{11}{2}, 90]$ with max $\le 0.79752270$, lowering `KRS501`'s $\kappa_4 \ge 14$ threshold by $2.8\times$);
   - **Tightened global bound across all $V_3(\mathbb{R}^n)$:** $\mathbb{E}|F| \le \frac{1997}{2500}\|F\|_2 = 0.7988\,\|F\|_2$ across all $\kappa_4(F) \in [0, 90]$ (max $\le 0.79876300$, halving `KRS501`'s $\frac{3999}{5000} = 0.7998$ gap to $\sqrt{\frac{2}{\pi}} = 0.79788456\dots$).
4. **Theorem 3 ($U(1)$ Phase-Averaging Transfer to $H_{2,1}(\mathbb{C}^n)$ & Downstream Cutoffs — `STATUS.md` `3.6`, `3.7`; `higher-degree/STATUS.md` `1.12`, `4.8`, `4.12`, `4.18a`, `4.18e`, `4.18f`):** By $U(1)$ phase averaging $\mathbb{E}|q| = \frac{\pi}{2\sqrt{2}}\mathbb{E}|F_0|$ with $\kappa_4(F_0) = \frac{3}{2}\chi(q)$, every $q \in H_{2,1}(\mathbb{C}^n)$ satisfies $\mathbb{E}|q| \le \frac{8873}{10000}\|q\|_2 = 0.8873\,\|q\|_2$ globally (halving `KRS501`'s $\frac{2221}{2500} = 0.8884$ gap to $\frac{\sqrt{\pi}}{2} = 0.8862269\dots$), and $\mathbb{E}|q| \le \frac{4431}{5000}\|q\|_2 = 0.8862\,\|q\|_2 < \frac{\sqrt{\pi}}{2}\|q\|_2$ across **$\chi(q) \in [\frac{10}{3}, 42]$** (conquering the entire historic `K3R`/`KSR`/`KOUL3` peak $\chi \in [\frac{15}{4}, 42]$, including $\chi = 4$), strictly improving all 7 downstream degree-5 and degree-7 cutoffs (§3).
5. **Theorem 4 (First Dimension-Free Malliavin–Stein OU Tower on Real Fifth Wiener Chaos $V_5(\mathbb{R}^n)$ & Complex Quintic Chaos $H_{3,2}(\mathbb{C}^n)$ — `#458`, `STATUS.md` `3.30`):** Every $F \in V_5(\mathbb{R}^n)$ ($n \ge 1$) satisfies $\mathbb{E}[F^4] \le 4653\|F\|_2^4$ ($\kappa_4(F) \in [0, 4650]$), $\mathbb{E}[F^6] \le 404{,}895{,}765\,\|F\|_2^6$ (attained at $h_5(G)/\sqrt{120}$), the fifth-chaos Ornstein–Uhlenbeck identity $L\tau_1 = 8(\tau_2 - \tau_1)$ for $\tau_1 = \frac{1}{5}\|DF\|_2^2$ and $\tau_2 = \frac{1}{20}\|D^2 F\|_{\mathrm{HS}}^2$, $\sigma_{1,r}^2 \le 20\tau_1^2\tau_2$, $3\times 3$ gradient Gram constant $\frac{5}{16}$, and a linear moment upper bound over the 8 extreme points of the relaxed 4-simplex in $a_k = \|J_{2k}(F)\|_2^2$ ($k = 1, 2, 3, 4$), certifying (`cert_v5_458.json`, 87,311 B):
   - **Global real fifth-chaos bound:** $\mathbb{E}|F| \le \frac{983}{1000}\|F\|_2 = 0.983\,\|F\|_2 < \|F\|_2$ unconditionally across all $n \ge 1$ and all $F \in V_5(\mathbb{R}^n)$ (max $\le 0.98248496$, with $\le \frac{41}{50}\|F\|_2 = 0.82\,\|F\|_2$ on $\kappa_4 \in [0, 2]$, $\le \frac{43}{50}\|F\|_2 = 0.86\,\|F\|_2$ on $[0, 15]$, and $\le \frac{23}{25}\|F\|_2 = 0.92\,\|F\|_2$ on $[0, 120]$);
   - **Complex quintic chaos $H_{3,2}(\mathbb{C}^n)$ (`STATUS.md` `3.30`):** via $F_\theta = \sqrt{2}\operatorname{Re}(e^{-i\theta}q) \in V_5(\mathbb{R}^{2n})$ and the universal complex sixth-moment bound $\mathbb{E}|q|^6 \le 59{,}735{,}934\,\|q\|_2^6$ ($\mathbb{E}[F_\theta^6] = \frac{5}{2}\mathbb{E}|q|^6 \le 149{,}339{,}835\,\|q\|_2^6$, proved from first principles by 3-pair conjugate Frobenius submultiplicativity in Lemma 4.3 below; cf. `KSR` §4.3), $\mathbb{E}|q| \le \frac{181}{200}\|q\|_2 = 0.905\,\|q\|_2$ on $\chi \in [0, \frac{4}{3}]$ ($\le \frac{9}{10}\|q\|_2$ on $[0, \frac{1}{3}]$), $\le \frac{23}{25}\|q\|_2$ on $\chi \in [0, 4]$, $\le \frac{97}{100}\|q\|_2$ on $\chi \in [0, 26]$, and $\le \frac{999{,}999}{1{,}000{,}000}\|q\|_2$ across all $\chi \in [0, 1840]$ (`margin > 1.52e-6`, widening `KSR`'s global `< 1` margin by $> 720\times$).
6. **External / Inherited Inputs Used:**
   - **Theorem 1:** The reviewed two-step Stein cumulant expansion and contraction norm table on $V_3(\mathbb{R}^n)$ from `KCR` ([`../cumulant-remainder-codex-a7c4/PROOF.md`](../cumulant-remainder-codex-a7c4/PROOF.md), **P**, re-derived by `claude-b9ee` in `#445` and `#468`; smoothing to $|x|$ as in `KSR` [`../sharp-radius-2026-11-17-gemini-2762/PROOF.md`](../sharp-radius-2026-11-17-gemini-2762/PROOF.md) §1.1), the radial Gaussian-mixture representation of $L = z_1(a + b|z_1|^2)$ (`STATUS.md` `2.7`, **P**), Lean's `Chaos3.wick6` consequence $|\kappa_6(F)| \le 67\kappa_4(F)^{3/2}$ (`3.21 (e4)`), and Lean's `Circular.sixth_moment_complex` ($C_{6,\mathbb{C}} = \frac{4045313}{100000}$, `3.4`).
   - **Theorems 2–3:** Lean's third-chaos fourth- and sixth-cumulant contraction formulas (`Grothe/LowerAnalytic/CircularTensor.lean`, `JointContractions.lean:31`, `Circular.lean:485`), Lean's `Circular.sixth_moment_complex` and `Grothe/Lower/MassWitnessData.lean`, and (only for the optional `KNG505`-assisted variant of `4.18f`) the reviewed `KNG505` slope $\frac{26449}{5000000}$.
   - **Theorem 4:** Completely self-contained from first principles (even-moment Wick bounds on both $V_5(\mathbb{R}^n)$ [Lemma 4.1] and $H_{3,2}(\mathbb{C}^n)$ [Lemma 4.3, matching `KSR` §4.3], OU tower, Stein brackets, relaxed simplex upper bound, and $U(1)$ transfer proved in §4 and verified in [`../../code/chaos-stein-458-gemini-8732/`](../../code/chaos-stein-458-gemini-8732/)).

---

## 1. Theorem 1: Oscillation-Preserving Two-Step Ornstein–Uhlenbeck Kernel Identity (`3.18`, `3.21 (e1)`)

### 1.1 Exact Singularity Cancellation via Two Integrations by Parts in $r = \frac{\theta}{1 - \theta}$ (**P**)

Let $F \in V_3(\mathbb{R}^n)$ satisfy $\mathbb{E}[F^2] = 1$, $U := \|DF\|_2^2 - 3 = U_2 + U_4 \in V_2(\mathbb{R}^n) \oplus V_4(\mathbb{R}^n)$, and $c := \sqrt{\frac{2}{\pi}}$. By the reviewed two-step Stein cumulant expansion for $|x|$ on $V_3(\mathbb{R}^n)$ (`KCR` [`../cumulant-remainder-codex-a7c4/PROOF.md`](../cumulant-remainder-codex-a7c4/PROOF.md) §3; `KSR` [`../sharp-radius-2026-11-17-gemini-2762/PROOF.md`](../sharp-radius-2026-11-17-gemini-2762/PROOF.md) §1.1, eq. on l. 85 — where for $Z \sim \mathcal{N}(0, 1)$, $\mathbb{E}[|Z| Z^{2m}] = 2^m m!\,c$, giving $\mathbb{E}[|Z|\operatorname{He}_4(Z)] = (8 - 12 + 3)c = -c$, $\frac{-c}{4!} = -\frac{c}{24}$, and $\mathbb{E}[|Z|\operatorname{He}_6(Z)] = (48 - 120 + 90 - 15)c = 3c$, $\frac{3c}{6!} = \frac{c}{240}$, verified in `verify_ibp_cone.py`),

$$
\mathbb{E}|F| = c\left(1 - \frac{\kappa_4(F)}{24} + \frac{\kappa_6(F)}{240}\right) + R_{|x|}(F), \qquad R_{|x|}(F) = -\frac{1}{27}\sum_{k \in \{2, 4\}}\sum_{\ell \in \{0, 2, 4, 6, 8\}} \mathbb{E}\Big[g_{k,\ell}(F)\,U\,\Pi_\ell(U U_k)\Big],
$$

where for $(\alpha, \beta) := (\frac{k}{3}, \frac{\ell}{3})$ and $d := \beta + 2 - \alpha = \frac{\ell - k + 6}{3} \ge \frac{2}{3} > 0$,

$$
g_{k,\ell}(x) = -\frac{c}{2}\int_0^1 W_{\alpha,\beta}(\theta)\,\theta^2\left[(1 - \theta)^{-5/2} h_4\!\left(\frac{\theta x^2}{1 - \theta}\right) - 3\right]d\theta,
$$

with $h_4(s) := (s^2 - 6s + 3)e^{-s/2}$ and positive kernel

$$
W_{\alpha,\beta}(\theta) := \frac{1}{d}\left[\frac{\theta^{-(\beta + 4)/2} - 1}{\beta + 4} - \frac{\theta^{-(\alpha + 2)/2} - 1}{\alpha + 2}\right] > 0 \qquad (\theta \in (0, 1)).
$$

In `KSR` §1.3, taking absolute values inside the $\theta$-integral destroyed the oscillatory sign cancellation of $h_4(s)$ (note that with the Gaussian Jacobian weight $s^{-1/2}\,ds$ under $s = x^2$, $\int_0^\infty s^{-1/2} h_4(s)\,ds = \sqrt{2\pi}\,\mathbb{E}[\operatorname{He}_4(Z)] = 0$ and $\int_0^\infty r^{-1/2} h_4(r x^2)\,dr = 0$ for all $x \ne 0$, whereas unweighted $\int_0^\infty h_4(s)\,ds = 16 - 24 + 6 = -2$) and inflated the remainder constant to $R_* = \frac{86}{25} = 3.44$. We eliminate the $(1 - \theta)^{-5/2}$ singularity **identically** before bounding:

**Lemma 1.1 (Oscillation-preserving monotone Gaussian-mixture representation).** *For all $(k, \ell) \in \{2, 4\} \times \{0, 2, 4, 6, 8\}$ ($\alpha = \frac{k}{3}$, $\beta = \frac{\ell}{3}$, $d = \beta + 2 - \alpha$) and all $x \in \mathbb{R}$,*

$$
g_{k,\ell}(x) = g_{k,\ell}(0) + \frac{c}{2}\int_0^1 (1 - \theta)^{-1/2}\,K_{\alpha,\beta}(\theta)\left(1 - \exp\!\left(-\frac{\theta x^2}{2(1 - \theta)}\right)\right)d\theta,
$$

*where*

$$
K_{\alpha,\beta}(\theta) := \frac{1}{d}\left[\frac{\beta^2 - 1}{\beta + 4}\theta^{-\beta/2} - \frac{(1 - \alpha)(3 - \alpha)}{\alpha + 2}\theta^{(2 - \alpha)/2}\right] + \frac{15}{(\beta + 4)(\alpha + 2)}\theta^2.
$$

*Moreover:*
1. *For $\ell \in \{0, 2, 4\}$ ($\beta \le \frac{4}{3} < 2$), $(1 - \theta)^{-1/2} K_{\alpha,\beta}(\theta) \in L^1(0, 1)$ and $g_{k,\ell}(x)$ is globally bounded on $\mathbb{R}$ with exact limit*
   $$g_{k,\ell}(\infty) := \lim_{|x| \to \infty} g_{k,\ell}(x) = \frac{9c}{2(6 - \ell)(12 - k)}.$$
2. *For $\ell \in \{4, 6, 8\}$, $K_{\alpha,\beta}(\theta) > 0$ strictly for all $\theta \in (0, 1]$, so $x \mapsto g_{k,\ell}(x)$ is strictly increasing on $[0, \infty)$.*

*Proof.* Change variables to $r := \frac{\theta}{1 - \theta} \in (0, \infty)$, so $\theta = \frac{r}{1 + r}$, $1 - \theta = \frac{1}{1 + r}$, and $d\theta = (1 + r)^{-2}\,dr$. First verify the exact second-derivative Hermite identity for $u_x(r) := r^{3/2}(e^{-r x^2/2} - 1)$: for any $a \ge 0$, differentiating $f(r) = r^{3/2} e^{-a r}$ twice gives

$$
f'(r) = r^{1/2}\Big(\frac{3}{2} - a r\Big)e^{-a r}, \qquad f''(r) = r^{-1/2}\Big(\frac{3}{4} - 3 a r + a^2 r^2\Big)e^{-a r} \implies 4 r^{1/2} f''(r) = (4 a^2 r^2 - 12 a r + 3)e^{-a r}.
$$

Evaluating at $a = \frac{x^2}{2}$ and subtracting the $a = 0$ case $4 r^{1/2}\frac{d^2}{dr^2}(r^{3/2}) = 3$ gives $4 r^{1/2} u_x''(r) = h_4(r x^2) - 3$ identically. Since $h_4(0) = 3$, at fixed $x \in \mathbb{R}$ we have

$$
g_{k,\ell}(x) - g_{k,\ell}(0) = -\frac{c}{2}\int_0^1 W_{\alpha,\beta}(\theta)\,\theta^2\,(1 - \theta)^{-5/2}\Big[h_4\!\left(\frac{\theta x^2}{1 - \theta}\right) - 3\Big]d\theta = -\frac{c}{2}\int_0^\infty \Psi_{\alpha,\beta}(r)\,4^{-1}\big[4 r^{1/2} u_x''(r)\big]\,r^{-1/2}\,dr,
$$

where

$$
\Psi_{\alpha,\beta}(r) := 4\,W_{\alpha,\beta}\!\left(\frac{r}{1 + r}\right)\frac{r^2}{(1 + r)^4} r^{1/2}(1 + r)^{5/2} = 4\,W_{\alpha,\beta}\!\left(\frac{r}{1 + r}\right) r^{5/2}(1 + r)^{-3/2}.
$$

Substituting $W_{\alpha,\beta}\!\big(\frac{r}{1 + r}\big) = \frac{1}{d}\Big[\frac{((1 + r)/r)^{(\beta + 4)/2} - 1}{\beta + 4} - \frac{((1 + r)/r)^{(\alpha + 2)/2} - 1}{\alpha + 2}\Big]$ decomposes $\Psi_{\alpha,\beta}(r)$ into a linear combination of binomial functions $h_\mu(r) := r^\mu (1 + r)^{1 - \mu}$:

$$
\Psi_{\alpha,\beta}(r) = \frac{4}{d}\left[\frac{h_{(1 - \beta)/2}(r) - h_{5/2}(r)}{\beta + 4} - \frac{h_{(3 - \alpha)/2}(r) - h_{5/2}(r)}{\alpha + 2}\right].
$$

For every $\mu \in \mathbb{R}$, direct differentiation gives the exact binomial cancellation (`verify_ibp_cone.py` `verify_symbolic_identities`):

$$
h_\mu'(r) = r^{\mu - 1}(1 + r)^{-\mu}(\mu + r), \qquad h_\mu''(r) = \mu(\mu - 1)\,r^{\mu - 2}(1 + r)^{-\mu - 1}.
$$

Now check the boundary terms $[\Psi_{\alpha,\beta}(r) u_x'(r) - \Psi_{\alpha,\beta}'(r) u_x(r)]_0^\infty$ for every $(k, \ell) \in \{2, 4\} \times \{0, 2, 4, 6, 8\}$:
- **As $r \to 0^+$:** Since $u_x(r) = -\frac{x^2}{2}r^{5/2} + O(r^{7/2})$ and $u_x'(r) = -\frac{5 x^2}{4}r^{3/2} + O(r^{5/2})$, while the smallest exponent $\mu$ is $\mu_{\min} = \frac{1 - \beta}{2} \ge \frac{1 - 8/3}{2} = -\frac{5}{6}$, we have $\Psi_{\alpha,\beta}(r) u_x'(r) = O(r^{\mu_{\min} + 3/2}) = O(r^{2/3}) \to 0$ and $\Psi_{\alpha,\beta}'(r) u_x(r) = O(r^{(\mu_{\min} - 1) + 5/2}) = O(r^{2/3}) \to 0$.
- **As $r \to +\infty$:** Expanding $h_\mu(r) = r(1 + r^{-1})^{1 - \mu} = r + (1 - \mu) + \frac{\mu(\mu - 1)}{2}r^{-1} + O(r^{-2})$:
  - In $h_\mu(r) - h_{5/2}(r)$, the $O(r)$ leading terms cancel in each fraction;
  - The constant term of $\Psi_{\alpha,\beta}(r)$ is $\frac{4}{d}\big[\frac{(\beta + 4)/2}{\beta + 4} - \frac{(\alpha + 2)/2}{\alpha + 2}\big] = \frac{4}{d}\big(\frac{1}{2} - \frac{1}{2}\big) = 0$!
  Hence $\Psi_{\alpha,\beta}(r) = O(r^{-1})$ and $\Psi_{\alpha,\beta}'(r) = O(r^{-2})$ as $r \to \infty$. Meanwhile $u_x(r) = -r^{3/2} + O(e^{-r x^2/2} r^{3/2})$ for $x \ne 0$ ($u_0 \equiv 0$) and $u_x'(r) = -\frac{3}{2}r^{1/2} + O(e^{-r x^2/2} r^{3/2})$, so $\Psi_{\alpha,\beta}(r) u_x'(r) = O(r^{-1/2}) \to 0$ and $\Psi_{\alpha,\beta}'(r) u_x(r) = O(r^{-1/2}) \to 0$!

Therefore both boundary terms vanish identically, and integrating by parts twice yields

$$
g_{k,\ell}(x) - g_{k,\ell}(0) = -\frac{c}{2}\int_0^\infty \Psi_{\alpha,\beta}''(r)\,r^{3/2}\big(e^{-r x^2/2} - 1\big)\,dr = \frac{c}{2}\int_0^\infty \Psi_{\alpha,\beta}''(r)\,r^{3/2}\big(1 - e^{-r x^2/2}\big)\,dr.
$$

Substituting $h_\mu''(r) = \mu(\mu - 1) r^{\mu - 2}(1 + r)^{-\mu - 1}$ for $\mu \in \{\frac{1 - \beta}{2}, \frac{3 - \alpha}{2}, \frac{5}{2}\}$ (noting $\mu(\mu - 1) = \frac{\beta^2 - 1}{4}, \frac{(1 - \alpha)(3 - \alpha)}{4}, \frac{15}{4}$, and $\frac{1}{d}(\frac{1}{\beta + 4} - \frac{1}{\alpha + 2}) = -\frac{1}{(\beta + 4)(\alpha + 2)}$) and returning to $\theta = \frac{r}{1 + r}$ ($r^{3/2}(1 + r)^{-2}\,dr = r^{3/2}\,d\theta$) gives $(1 - \theta)^{-1/2} K_{\alpha,\beta}(\theta)$ directly.

For $\ell \in \{0, 2, 4\}$, $\frac{\beta}{2} \le \frac{2}{3} < 1$, so $(1 - \theta)^{-1/2} K_{\alpha,\beta}(\theta) \in L^1(0, 1)$; by dominated convergence as $|x| \to \infty$ directly in the original definition (where $(1 - \theta)^{-5/2} h_4(\frac{\theta x^2}{1 - \theta}) \to 0$ pointwise and is integrable for $\beta < 2$),

$$
g_{k,\ell}(\infty) = \frac{3c}{2}\int_0^1 W_{\alpha,\beta}(\theta)\,\theta^2\,d\theta = \frac{3c}{2d}\left[\frac{\frac{1}{1 - \beta/2} - \frac{1}{3}}{\beta + 4} - \frac{\frac{1}{2 - \alpha/2} - \frac{1}{3}}{\alpha + 2}\right] = \frac{3c}{2d}\left[\frac{1}{3(2 - \beta)} - \frac{1}{3(4 - \alpha)}\right] = \frac{9c}{2(6 - \ell)(12 - k)}.
$$

Finally, for $\ell \in \{4, 6, 8\}$ and $k \in \{2, 4\}$, setting $\theta = z^6$ ($z \in (0, 1]$) and multiplying $K_{\alpha,\beta}(z^6)$ by $z^\ell > 0$ gives the polynomial $P_{k,\ell}(z) = \frac{\beta^2 - 1}{d(\beta + 4)} - \frac{(1 - \alpha)(3 - \alpha)}{d(\alpha + 2)}z^{\ell + 6 - k} + \frac{15}{(\beta + 4)(\alpha + 2)}z^{\ell + 12}$, which has positive constant term at $z = 0$ ($\beta = \frac{\ell}{3} \ge \frac{4}{3} > 1$) and is certified strictly positive on $[0, 1]$ by exact integer Bernstein subdivision in `verify_ibp_cone.py`. $\square$

### 1.2 Chaos-Orthogonal Centering & Whole-Interval Bernstein Certification of $R_* \le \frac{21}{20}$ (**P + C**)

1. **Deterministic centering for $\ell \in \{0, 6, 8\}$:** Since $U = U_2 + U_4 \in V_2 \oplus V_4$ is orthogonal in $L^2(\gamma_n)$ to $V_0 \oplus V_6 \oplus V_8$, for any deterministic constant $c_{k,\ell} \in \mathbb{R}$ and any $\ell \in \{0, 6, 8\}$,
   $$\mathbb{E}\big[c_{k,\ell}\,U\,\Pi_\ell(U U_k)\big] = c_{k,\ell}\,\langle U, \Pi_\ell(U U_k)\rangle_{L^2(\gamma_n)} = 0.$$
   - For $\ell = 0$, $g_{k,0}(x) \in [g_{k,0}(\infty) - I_{k,0}^+, g_{k,0}(\infty) + I_{k,0}^-]$ globally; choosing $c_{k,0}$ as the midpoint of this interval halves the uniform bound to $|g_{k,0}(x) - c_{k,0}| \le A_{k,0}$ with $B_{k,0} = 0$ and zero penalty from $c_{k,0}$.
   - For $\ell \in \{2, 4\}$, $\mathbb{E}[c_{k,\ell}\,U\,\Pi_\ell(U U_k)] = c_{k,\ell}\langle U_\ell, U U_k\rangle$, bounded by $|c_{k,\ell}|\,\|U_\ell\|_2\,\|\Pi_\ell(U U_k)\|_2$, while $|g_{k,\ell}(x) - c_{k,\ell}| \le A_{k,\ell}$ ($B_{k,\ell} = 0$).
   - For $\ell \in \{6, 8\}$, splitting $z = \theta^{1/6} \in [0, 1]$ at $z_{\mathrm{cut}} \in (0, 1)$, using $0 \le 1 - e^{-u} \le 1$ on $[z_{\mathrm{cut}}, 1]$ (giving $0 \le I_{\mathrm{tail}}(x) \le I_{\mathrm{tail}}^{\mathrm{ub}}$) and $0 \le 1 - e^{-u} \le \frac{16}{25}\sqrt{u}$ on $[0, z_{\mathrm{cut}}]$ (proved in `verify_ibp_cone.py` via degree-13 Lagrange Taylor bound $e^{-t^2} \ge \sum_{j=0}^7 \frac{(-1)^j t^{2j}}{j!}$ on $t = \sqrt{u} \in [0, \frac{25}{16}]$ and $1 - e^{-u} < 1 \le \frac{16}{25}\sqrt{u}$ on $t \ge \frac{25}{16}$, giving $0 \le I_{\mathrm{head}}(x) \le B_{k,\ell}|x|$ since $(1 - \theta)^{-1/2}\sqrt{\frac{\theta x^2}{2(1 - \theta)}} = \frac{|x|\theta^{1/2}}{\sqrt{2}}(1 - \theta)^{-1}$ is smooth on $[0, z_{\mathrm{cut}}]$!), and centering at $c_{k,\ell} := g_{k,\ell}(0) + \frac{1}{2}I_{\mathrm{tail}}^{\mathrm{ub}}$ yields
     $$|g_{k,\ell}(x) - c_{k,\ell}| \le \frac{1}{2}I_{\mathrm{tail}}^{\mathrm{ub}} + B_{k,\ell}|x| =: A_{k,\ell} + B_{k,\ell}|x| \qquad (\forall x \in \mathbb{R}),$$
     again with $\mathbb{E}[c_{k,\ell}\,U\,\Pi_\ell(U U_k)] = 0$ identically!

2. **Exact Bernstein bound on $y = \|U_4\|_2 / \|U_2\|_2 \in [0, \sqrt{3/4}]$:** Let $A := \|U_2\|_2$ and $C := \|U_4\|_2$. By Proposition 2.1 ($\kappa_4(F) = 36m + 54u$, $A^2 = 8m$, $C^2 = 6u$, $0 \le u \le m$), $\kappa_4(F) = \frac{9}{2}(A^2 + 2 C^2)$ and $y := \frac{C}{A} = \sqrt{\frac{3u}{4m}} \in [0, \sqrt{3/4}] \subset [0, \frac{8661}{10000}]$ (when $A = 0$, $u \le m = 0 \implies U = 0$). Using Hölder's inequality (`KCR` Lemma 3.2: $\|U\|_2 = A\sqrt{1 + y^2} \le A(1 + \frac{373}{1000}y)$ on $[0, \frac{8661}{10000}]$ by convexity of $\sqrt{1 + y^2}$, $\|U\|_4 \le 15^{1/4} A + 639^{1/4} C \le A(\frac{197}{100} + \frac{503}{100}y)$, $\|F\|_4 \le (3 + \frac{1}{100})^{1/4} \le \frac{33}{25}$ on $\kappa_4(F) \le \frac{1}{100}$, and the reviewed `KCR` contraction table $\|\Pi_\ell(U_j U_k)\|_2 \le c_{j,k,\ell}\|U_j\|_2\|U_k\|_2$), `verify_ibp_cone.py` encloses all 10 pairs on a 512-cell rational $z$-mesh plus exact square root tail $z_{\max} = \frac{1023}{1024}$ ($1 - z_{\max} = (\frac{1}{32})^2$) and certifies in **1 Bernstein leaf** on $y \in [0, \frac{8661}{10000}]$ that
   $$|R_{|x|}(F)| \le \frac{21}{20}\,\kappa_4(F)^{3/2} = 1.05\,\kappa_4(F)^{3/2}.$$

3. **Resulting explicit sharp thresholds:**
   - **Real $V_3(\mathbb{R}^n)$:** Since $|\kappa_6(F)| \le 67\kappa_4(F)^{3/2}$ (`3.21 (e4)`), $\mathbb{E}|F| \le c(1 - \frac{\kappa_4}{24}) + C_{3/2,\mathrm{real}}\kappa_4^{3/2}$ with $C_{3/2,\mathrm{real}} := \frac{67}{240}c + \frac{21}{20} < 1.272743$. Thus $\mathbb{E}|F| \le c(1 - \frac{\kappa_4}{48})$ holds whenever $0 < \kappa_4 \le \big(\frac{c/48}{C_{3/2,\mathrm{real}}}\big)^2 > \frac{1}{5866} > \frac{1}{5900}$, and $\mathbb{E}|F| < c$ holds whenever $0 < \kappa_4 \le \big(\frac{c/24}{C_{3/2,\mathrm{real}}}\big)^2 > \frac{1}{1467} > \frac{1}{1475}$.
   - **Complex $H_{2,1}(\mathbb{C}^n)$:** By `KSR` §1.3 (averaging $F_\theta = \sqrt{2}\operatorname{Re}(e^{-i\theta} q / \sqrt{u})$ over $\theta \in [0, 2\pi)$, where $\kappa_4(F_\theta) = \frac{3}{2}\chi(q)$ and $\kappa_6(F_\theta) = \frac{5}{2}\frac{\kappa_6^c(q)}{u^3} \le \frac{5}{2}C_{6,\mathbb{C}}\chi(q)^{3/2}$ with $C_{6,\mathbb{C}} = \frac{4045313}{100000}$), $\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\sqrt{u}\big(1 - \frac{\chi}{16} + C_{3/2,\mathbb{C}}\chi^{3/2}\big)$ with $C_{3/2,\mathbb{C}} = \frac{5}{2}\frac{C_{6,\mathbb{C}}}{240} + \frac{21/20}{c}(\frac{3}{2})^{3/2} < 2.842310$. Thus $\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\sqrt{u}(1 - \frac{\chi}{32})$ holds for $0 < \chi \le \big(\frac{1/32}{C_{3/2,\mathbb{C}}}\big)^2 > \frac{1}{8276} > \frac{1}{8300}$ (and $\mathbb{E}|q| < \frac{\sqrt{\pi}}{2}\sqrt{u}$ for $0 < \chi \le \frac{1}{2075}$). Now let $W \sim \mathcal{CN}(0, 1)$ be a standard circular complex Gaussian **independent of $q$**, and approximate $W$ in $L^4$ by normalized diffuse cubic sums $W_m = m^{-1/2}\sum_{j=1}^m Y_{3j-2} Y_{3j-1}\overline{Y_{3j}} \in H_{2,1}(\mathbb{C}^{3m})$ built from fresh coordinates independent of $q$ ($\chi(W_m) = \frac{4}{m} \to 0$). For every $v \ge 0$, independence gives $q_{v,m} := (q + \sqrt{v}\,W_m)/\sqrt{u + v} \in H_{2,1}$ with $\chi(q_{v,m}) = \frac{u^2 \chi(q) + v^2(4/m)}{(u + v)^2} \to \frac{u^2}{(u + v)^2}\chi(q) \le \chi(q) \le \chi_0$ as $m \to \infty$, so passing to the limit yields buffered PVD $\mathbb{E}|q + \sqrt{v}\,W| \le \frac{\sqrt{\pi}}{2}\sqrt{u + v} - \frac{\sqrt{\pi}\,\delta}{64(u + v)^{3/2}}$. Finally, for any visible profile $L = z_1(a + b|z_1|^2)$ ($a > 0, b \ge 0$) whose Gaussian coordinate $z_1 \sim \mathcal{CN}(0, 1)$ is **independent of the remote cubic $q$**, `STATUS.md` `2.7` represents $L \stackrel{d}{=} \sqrt{V_L}\,W$ with $(V_L, W)$ mutually independent and **independent of $q$**. Conditioning on $V_L = v$ and integrating against $V_L$ using $-B''(u) = \frac{\sqrt{\pi}}{4}\mathbb{E}_{V_L}[(u + V_L)^{-3/2}] > 0$ proves $B(u) - 2\mathbb{E}|L + q| \ge -\frac{B''(u)}{8}\delta > 0$ at every energy, price, and profile (`3.5`, `KSR` §1.3). $\square$

---

## 2. Theorem 2: Enhanced Real Level-2+ Malliavin–Stein Hierarchy on $V_3(\mathbb{R}^n)$

We adopt the exact notation and carré-du-champ OU tower of `KRS501` ([`../real-stein-501-gemini-8732/PROOF.md`](../real-stein-501-gemini-8732/PROOF.md) §§1–3): for unit-variance $F = \frac{1}{\sqrt{6}}I_3(T) \in V_3(\mathbb{R}^n)$ ($\|T\|_{\mathrm{HS}}^2 = 1$), $r = |F|$, $V = F^2$, $\tau = \frac{1}{3}\|DF\|_2^2$, $\eta = \frac{1}{6}\|D^2 F\|_{\mathrm{HS}}^2 = X^\top M X$ ($M_{k\ell} = \sum_{i,j} T_{ijk} T_{ij\ell} \succeq 0$, $\operatorname{tr} M = 1$, $m = \operatorname{tr}(M^2)$, $u = \|\widetilde{U}\|_{\mathrm{HS}}^2$), $\sigma_r = \operatorname{sgn}(F)\frac{1}{2}\langle DF, D\tau\rangle$, $\nu_r = \operatorname{sgn}(F)\frac{1}{2}\langle DF, D\eta\rangle = \operatorname{sgn}(F)(DF)^\top M X$, $w_\tau = \|D\tau\|_2^2$, $w_{\tau\eta} = \langle D\tau, D\eta\rangle$, and $w_\eta = \|D\eta\|_2^2 = 4\|M X\|_2^2$.

### 2.1 Three New Exact Algebraic & Contraction Inputs (**P**)

**Proposition 2.1 (Pointwise operator-norm bound on $\nu_r^2$).** *For every unit-variance $F \in V_3(\mathbb{R}^n)$ and every $X \in \mathbb{R}^n$,*

$$
\|M X\|_2^2 \le \|M\|_{\mathrm{op}}\,\eta \le \sqrt{m}\,\eta, \qquad \nu_r^2 \le 3\|M\|_{\mathrm{op}}\,\tau\,\eta \le 3\sqrt{m}\,\tau\,\eta.
$$

*In particular, on $\kappa_4(F) = 36m + 54u \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$, $36m \le \kappa_4(F) \le s_{\mathrm{hi}}$, so for any rational $s_m \ge \sqrt{s_{\mathrm{hi}}/36}$ ($36 s_m^2 \ge s_{\mathrm{hi}}$) and any $\alpha_{\mathrm{op}}(r) > 0, \ell_{\nu,\mathrm{op}}(r), c_{\mathrm{op}}(r)$ satisfying $4\alpha_{\mathrm{op}}(r) c_{\mathrm{op}}(r) - \ell_{\nu,\mathrm{op}}(r)^2 > 0$,*

$$
C_{\mathrm{op}}(r) := 3 s_m \alpha_{\mathrm{op}}(r)\,\tau\eta + \ell_{\nu,\mathrm{op}}(r)\,\nu_r + c_{\mathrm{op}}(r) \ge \alpha_{\mathrm{op}}(r)\,\nu_r^2 + \ell_{\nu,\mathrm{op}}(r)\,\nu_r + c_{\mathrm{op}}(r) \ge 0.
$$

*Proof.* Diagonalizing $M \succeq 0$ with eigenvalues $\lambda_1, \dots, \lambda_n \ge 0$ ($\lambda_{\max} = \|M\|_{\mathrm{op}} \le (\sum_i \lambda_i^2)^{1/2} = \sqrt{m}$), we have $\|M X\|_2^2 = \sum_i \lambda_i^2 Y_i^2 \le \lambda_{\max}\sum_i \lambda_i Y_i^2 = \|M\|_{\mathrm{op}}\,\eta \le \sqrt{m}\,\eta$. By Cauchy–Schwarz, $\nu_r^2 \le \nu^2 = \langle DF, M X\rangle^2 \le \|DF\|_2^2 \|M X\|_2^2 = 3\tau\|M X\|_2^2 \le 3\sqrt{m}\,\tau\,\eta \le 3 s_m\,\tau\,\eta$, and completing the square gives $\alpha_{\mathrm{op}}\nu_r^2 + \ell_{\nu,\mathrm{op}}\nu_r + c_{\mathrm{op}} = \alpha_{\mathrm{op}}(\nu_r + \frac{\ell_{\nu,\mathrm{op}}}{2\alpha_{\mathrm{op}}})^2 + \frac{4\alpha_{\mathrm{op}}c_{\mathrm{op}} - \ell_{\nu,\mathrm{op}}^2}{4\alpha_{\mathrm{op}}} \ge 0$. $\square$

**Proposition 2.2 (Exact Wiener–Itô contraction formula & upper bound for $\mathbb{E}[\nu^2]$).** *For every unit-variance $F = \frac{1}{\sqrt{6}}I_3(T) \in V_3(\mathbb{R}^n)$, define $(T M)_{ijk} := \sum_{r=1}^n T_{ijr} M_{rk}$ and $(\operatorname{tr}(T_\bullet M))_a := \sum_{i,b=1}^n T_{aib} M_{ib}$. Then*

$$
\mathbb{E}[\nu^2] = 9\,\|\operatorname{Sym}_3(T M)\|_{\mathrm{HS}}^2 + 6\,\|\operatorname{tr}(T_\bullet M)\|_2^2 \le 9\operatorname{tr}(M^3) + 6 m^{3/2},
$$

*with equality $9 + 6 = 15$ attained at the rank-1 Hermite cubic $h_3(X_1)/\sqrt{6}$.*

*Proof.* Since $(DF)_i = \sqrt{\frac{3}{2}}I_2(T_{i\cdot\cdot})$ and $(M X)_i = \sum_c M_{ic} X_c = I_1(M_{i\cdot})$, the Wiener–Itô product formula for $I_2 \cdot I_1$ (Nourdin–Peccati [2012, Thm. 2.7.10], $r = 0, 1$) gives

$$
I_2(T_{i\cdot\cdot})\,I_1(M_{i\cdot}) = I_3(T_{i\cdot\cdot} \widetilde{\otimes} M_{i\cdot}) + 2 I_1(T_{i\cdot\cdot} \otimes_1 M_{i\cdot}).
$$

Summing over $i = 1, \dots, n$ and multiplying by $\sqrt{\frac{3}{2}}$:
- $\sum_i (T_{i\cdot\cdot} \widetilde{\otimes} M_{i\cdot})_{abc} = \frac{1}{3}\sum_i (T_{abi} M_{ic} + T_{bci} M_{ia} + T_{cai} M_{ib}) = \operatorname{Sym}_3(T M)_{abc}$;
- $\sum_i (T_{i\cdot\cdot} \otimes_1 M_{i\cdot})_a = \sum_{i,b} T_{iab} M_{ib} = (\operatorname{tr}(T_\bullet M))_a$ (by symmetry of $T$).

Thus $\nu = \sum_i (DF)_i (M X)_i = \sqrt{\frac{3}{2}}\,I_3(\operatorname{Sym}_3(T M)) + \sqrt{6}\,I_1(\operatorname{tr}(T_\bullet M)) \in V_3 \oplus V_1$. By Wiener–Itô orthogonality $V_3 \perp V_1$ and isometry ($3! = 6$, $1! = 1$),

$$
\mathbb{E}[\nu^2] = \frac{3}{2}\cdot 6\,\|\operatorname{Sym}_3(T M)\|_{\mathrm{HS}}^2 + 6\cdot 1\,\|\operatorname{tr}(T_\bullet M)\|_2^2 = 9\|\operatorname{Sym}_3(T M)\|_{\mathrm{HS}}^2 + 6\|\operatorname{tr}(T_\bullet M)\|_2^2.
$$

Now bound both terms:
1. Since $\operatorname{Sym}_3$ is an orthogonal projection in $(\mathbb{R}^n)^{\otimes 3}$, $\|\operatorname{Sym}_3(T M)\|_{\mathrm{HS}}^2 \le \|T M\|_{\mathrm{HS}}^2 = \sum_{a,b,c} \big(\sum_r T_{abr} M_{rc}\big)^2 = \sum_{r,s,c} M_{rs} M_{rc} M_{sc} = \operatorname{tr}(M^3)$.
2. Viewing $A_{ib,jc} = \sum_a T_{aib} T_{ajc}$ as an $n^2 \times n^2$ symmetric PSD matrix with $\|A\|_{\mathrm{HS}}^2 = \operatorname{tr}(M^2) = m$,
   $$\|\operatorname{tr}(T_\bullet M)\|_2^2 = \sum_{a=1}^n \left(\sum_{i,b=1}^n T_{aib} M_{ib}\right)^2 = \langle \operatorname{vec} M, A\,\operatorname{vec} M\rangle \le \|A\|_{\mathrm{op}}\|\operatorname{vec} M\|_2^2 \le \|A\|_{\mathrm{HS}}\,m = m^{3/2}.$$
   *(Verified on 7 explicit tensors against exact Gaussian integration in `check_identities_exact.py`, and zero-slack witnessed at $h_3(X_1)/\sqrt{6}$ in `verify.py`.)* $\square$

**Proposition 2.3 (Exact third and fourth central moments of $\eta = X^\top M X$).** *For every symmetric $M \in \mathbb{R}^{n\times n}$ with $m = \operatorname{tr}(M^2)$, the second-chaos variable $\eta - \operatorname{tr}(M) = I_2(M)$ satisfies*

$$
\mathbb{E}\big[(\eta - \operatorname{tr} M)^3\big] = 8\operatorname{tr}(M^3), \qquad \mathbb{E}\big[(\eta - \operatorname{tr} M)^4\big] = 12 m^2 + 48\operatorname{tr}(M^4).
$$

*When $M \succeq 0$, $\operatorname{tr}(M^4) \le \|M\|_{\mathrm{op}}\operatorname{tr}(M^3) \le \sqrt{m}\operatorname{tr}(M^3)$, so $\mathbb{E}[(\eta - \operatorname{tr} M)^4] \le 12 m^2 + 48\sqrt{m}\operatorname{tr}(M^3)$.*

*Proof.* Orthogonal invariance reduces $I_2(M)$ to $I_2(\operatorname{diag}(\lambda_1, \dots, \lambda_n)) = \sum_{i=1}^n \lambda_i(G_i^2 - 1)$ for independent $G_i \sim \mathcal{N}(0, 1)$ (Nourdin–Peccati [2012, Prop. 2.7.13]). Since $\mathbb{E}[G^2 - 1] = 0$, $\mathbb{E}[(G^2 - 1)^2] = 2$, $\mathbb{E}[(G^2 - 1)^3] = 8$, and $\mathbb{E}[(G^2 - 1)^4] = 60$ (so $\kappa_4(G^2 - 1) = 60 - 3\cdot 2^2 = 48$):
- $\mathbb{E}[(\sum_i \lambda_i(G_i^2 - 1))^3] = \sum_i \lambda_i^3 \mathbb{E}[(G_i^2 - 1)^3] = 8\sum_i \lambda_i^3 = 8\operatorname{tr}(M^3)$;
- By cumulant additivity, $\kappa_4(I_2(M)) = \sum_i \lambda_i^4 \kappa_4(G_i^2 - 1) = 48\operatorname{tr}(M^4)$ and $\operatorname{Var}(I_2(M)) = 2m$, so $\mathbb{E}[I_2(M)^4] = 3(\operatorname{Var} I_2(M))^2 + \kappa_4(I_2(M)) = 12 m^2 + 48\operatorname{tr}(M^4)$. $\square$

### 2.2 Coupled Pointwise Decomposition & Exact 4-Corner $(s_*, \theta_*)$ Affine Envelope (**P + C**)

On each slab $[s_{\mathrm{lo}}, s_{\mathrm{hi}}] \subset [0, 90]$, `cert_v3_458.json` augments `KRS501` Proposition 3.2 with:
1. **Bounded-support $\nu_r^2$ cones (`k < K`):** Subtracting $C_{\nu_0}(r) := \lambda_{\nu^2}\nu_r^2 + \ell_{\nu,0}(r)\nu_r + c_{\nu,0}(r) \ge 0$ ($4\lambda_{\nu^2} c_{\nu,0}(r) - \ell_{\nu,0}(r)^2 > 0$, dropped via $\lambda_{\nu^2}\nu_r^2 \ge 0$ on $[r_K, \infty)$) and $C_{\mathrm{op}}(r) \ge 0$ (Proposition 2.1) shifts the remaining $\nu_r$ linear multiplier in the $3\times 3$ gradient Gram cone from $L_\nu(r) = 2(G_3(r) + \psi_7(r))$ to $L_{\nu,\mathrm{rem}}(r) := L_\nu(r) - \ell_{\nu,0}(r) - \ell_{\nu,\mathrm{op}}(r)$.
2. **Global quartic $\eta - 1$ cone:** Choosing $(\lambda_{e3}, \lambda_{e4}, \delta m_{11}) \in \mathbb{Q}_{\le 0} \times \mathbb{Q}_{> 0} \times \mathbb{Q}_{\ge 0}$ with $4\lambda_{e4}\delta m_{11} - \lambda_{e3}^2 \ge 0$ and $m_{11,\mathrm{eff}} := m_{11} - \delta m_{11} > 0$,
   $$C_{\mathrm{eh}}(\eta) := \delta m_{11}(\eta - 1)^2 + \lambda_{e3}(\eta - 1)^3 + \lambda_{e4}(\eta - 1)^4 = (\eta - 1)^2\left[\lambda_{e4}\left(\eta - 1 + \frac{\lambda_{e3}}{2\lambda_{e4}}\right)^2 + \frac{4\lambda_{e4}\delta m_{11} - \lambda_{e3}^2}{4\lambda_{e4}}\right] \ge 0$$
   holds globally for **all** $\eta \in \mathbb{R}$, leaving $m_{11,\mathrm{eff}} = m_{11} - \delta m_{11} > 0$ in the $3\times 3$ $(1, \tau, \eta)$ Sylvester block (`verify_bernstein.py` confirms the exact 8-variable polynomial identity `rhs_minus_r == C_1 + C_2 + C_3 + C_4 + C_nu0 + C_op + C_eh + C_5` across all $21 \times 41 = 861$ intervals!).
3. **Exact 4-corner $(s_*, \theta_*) \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\} \times \{0, 1\}$ moment reduction:**
   For every unit-variance $F \in V_3(\mathbb{R}^n)$, Cauchy–Schwarz (`KRS501` Prop. 2.2) and $\|M\|_{\mathrm{op}} \le \sqrt{m}$ give $m^2 \le \operatorname{tr}(M^3) \le m^{3/2}$, so there exists $\theta \in [0, 1]$ such that
   $$\operatorname{tr}(M^3) = (1 - \theta) m^2 + \theta m^{3/2}.$$
   Substituting this single shared $\theta \in [0, 1]$ into all four $\operatorname{tr}(M^3)$-dependent expectations ($\lambda_3 > 0$, $\lambda_{\nu^2} > 0$, $\lambda_{e3} \le 0$, $\lambda_{e4} > 0$):
   - Negative $\operatorname{tr}(M^3)$ coefficient: $-(4320\lambda_3 - 8\lambda_{e3})\operatorname{tr}(M^3)$, where $4320\lambda_3 - 8\lambda_{e3} > 0$ since $\lambda_3 > 0$ and $\lambda_{e3} \le 0$!
   - Positive $\operatorname{tr}(M^3)$ terms: $+9\lambda_{\nu^2}\operatorname{tr}(M^3) + 48\lambda_{e4}\sqrt{m}\operatorname{tr}(M^3)$.

   Thus at fixed $(s, x)$ ($m = \frac{s}{q(x)}$, $q(x) = 36 + 54x^2$), the upper bound is **affine in $\theta \in [0, 1]$**, so its maximum over $\theta \in [0, 1]$ is attained at $\theta \in \{0, 1\}$!
   Now check convexity in $s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$ at fixed $(x, \theta)$:
   - Every positive power $+s^{3/2}$ and $+s^{5/2}$ is convex on $s \ge 0$, bounded above by its secant line on $[s_{\mathrm{lo}}, s_{\mathrm{hi}}]$ ($\sigma_{\mathrm{sec}}(s)$ with $\sigma_{\mathrm{lo}}^2 \ge s_{\mathrm{lo}}^3, \sigma_{\mathrm{hi}}^2 \ge s_{\mathrm{hi}}^3$, and $s^{5/2} \le \frac{s_{\mathrm{hi}} - s}{s_{\mathrm{hi}} - s_{\mathrm{lo}}} s_{\mathrm{lo}}\sigma_{\mathrm{lo}} + \frac{s - s_{\mathrm{lo}}}{s_{\mathrm{hi}} - s_{\mathrm{lo}}} s_{\mathrm{hi}}\sigma_{\mathrm{hi}}$ by convexity of $s^{5/2}$);
   - Every positive $+s^2$ term is convex on $s \ge 0$, bounded above by its secant $s^2 \le (s_{\mathrm{lo}} + s_{\mathrm{hi}})s - s_{\mathrm{lo}} s_{\mathrm{hi}}$;
   - Every negative $-s^2$ term is concave, bounded above by its midpoint tangent $-s^2 \le -(2 s_{\mathrm{mid}} s - s_{\mathrm{mid}}^2)$;
   - Finally, for the negative $-s^{3/2}$ term (when $\theta = 1$), fix any rational anchor $r_{\mathrm{anch}} \ge 0$ (`r_anch^2 in [s_lo, s_hi]`): for all $s = u^2 \ge 0$ ($u = \sqrt{s} \ge 0, a = r_{\mathrm{anch}} \ge 0$),
     $$2 u^3 - 3 a u^2 + a^3 = (u - a)^2(2u + a) \ge 0 \implies s^{3/2} \ge \frac{3}{2} r_{\mathrm{anch}}\,s - \frac{1}{2} r_{\mathrm{anch}}^3 =: \sigma_{\mathrm{tan}}(s),$$
     so $-s^{3/2} \le -\sigma_{\mathrm{tan}}(s)$ is **exact affine in $s$**!

   Consequently, at fixed $(x, \theta)$, the entire moment majorant is **affine in $s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$**, reducing the supremum over $(s, \theta, x)$ with zero slack in $(s, \theta)$-linearity to the **4 corners $(s_*, \theta_*) \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\} \times \{0, 1\}$**, where $R_{s_*,\theta_*}(x)\sqrt{q(x)} < N_{s_*,\theta_*}(x)$ on $x \in [x_{\mathrm{lo}}, 1]$ follows from $N_{s_*,\theta_*}(x) > 0$ and $N_{s_*,\theta_*}(x)^2 - R_{s_*,\theta_*}(x)^2 q(x) > 0$ (`verify.py` lines 610–645; `verify_bernstein.py` lines 498–514). $\square$

---

## 3. Theorem 3: Complex Transfer to $H_{2,1}(\mathbb{C}^n)$ & Downstream Degree-5/7 Cutoffs

By `KRS501` §4 ($F_\theta(z) = \sqrt{2}\operatorname{Re}(e^{-i\theta}q(z)) \in V_3(\mathbb{R}^{2n})$ with $\|F_\theta\|_2 = \|q\|_2$, $\kappa_4(F_\theta) = \frac{3}{2}\chi(q)$, and $\mathbb{E}|q| = \frac{\pi}{2\sqrt{2}}\mathbb{E}|F_0|$):
- Across all $q \in H_{2,1}(\mathbb{C}^n)$ ($\chi \in [0, 42] \implies \kappa_4(F_0) \in [0, 63] \subset [0, 90]$), $\mathbb{E}|q| \le \frac{\pi}{2\sqrt{2}}\cdot\frac{1997}{2500}\|q\|_2 < \frac{8873}{10000}\|q\|_2 = 0.8873\,\|q\|_2$.
- Across **$\chi(q) \in [\frac{10}{3}, 42]$** ($\kappa_4(F_0) = \frac{3}{2}\chi(q) \in [5, 63] \subset [5, 90]$), $\mathbb{E}|q| \le \frac{\pi}{2\sqrt{2}}\cdot\frac{19946}{25000}\|q\|_2 < \frac{4431}{5000}\|q\|_2 = 0.8862\,\|q\|_2 < \frac{\sqrt{\pi}}{2}\|q\|_2$.

Substituting $\rho_0 = \frac{8873}{10000}$ into the exact rational formulas of `KRS501` §5 (`verify.py` `verify_downstream`) certifies:
- `higher-degree/STATUS.md` `1.12` (`deg7_1403_cap`): $\lambda_1 \le \frac{100000000000}{110458370987} = 0.9053184\dots > 0.90531$
- `higher-degree/STATUS.md` `4.12` (`deg5_1402_cap`): $\lambda_1 \le \frac{50000000000}{55189820429} = 0.9059641\dots > 0.90596$
- `higher-degree/STATUS.md` `4.18a` (direct Gaussian-buffer bound): $t \le \frac{323827}{1000000} = 0.323827$
- `higher-degree/STATUS.md` `4.18e` (elliptic lift): $t \le \frac{45419761}{100000000} = 0.45419761$ (Parseval), $t \le \frac{45765271}{100000000} = 0.45765271$ (sixth-moment clipping), $t \le \frac{45352867}{100000000} = 0.45352867$ (Lean mass)
- `higher-degree/STATUS.md` `4.18f` (24 Lean spectral mass witnesses): $t \le \frac{9133}{20000} = 0.45665$ (`1,813` boxes, pure $\rho_0$) and $t \le \frac{45669}{100000} = 0.45669$ (`340` boxes, with `KNG505` slope $\frac{26449}{5000000}$).

---

## 4. Theorem 4: First Dimension-Free Malliavin–Stein OU Tower on $V_5(\mathbb{R}^n)$ & $H_{3,2}(\mathbb{C}^n)$ (`#458`, `3.30`)

### 4.1 Sharp Fourth- and Sixth-Moment Bounds on $V_5(\mathbb{R}^n)$ via Frobenius Submultiplicativity (**P**)

Let $X = (X_1, \dots, X_n) \sim \mathcal{N}(0, I_n)$ and let $F = \frac{1}{\sqrt{120}}\,I_5(T) \in V_5(\mathbb{R}^n)$ be normalized so that $\|T\|_{\mathrm{HS}}^2 = \sum_{i_1,\dots,i_5=1}^n T_{i_1 i_2 i_3 i_4 i_5}^2 = \mathbb{E}[F^2] = 1$, where $T \in \operatorname{Sym}^5(\mathbb{R}^n)$ is symmetric under $S_5$ (with **no trace-free assumption** on $T$). Let $h_5(x) := x^5 - 10x^3 + 15x$ be the fifth probabilist's Hermite polynomial ($\|h_5(G)\|_2^2 = 5! = 120$).

*(Historical context: Janson [*Gaussian Hilbert Spaces*, 1997, Remark 7.37], cited in Larsson-Cohn [*Ark. Mat.* 40 (2002) 133–144, p. 12, eq. (3.1)], observed that Wick powers $h_d(G)/\sqrt{d!}$ maximize $\|F\|_{2m}/\|F\|_2$ on $V_d(\mathbb{R}^n)$ for positive integers $m$. To keep our certificate 100% self-contained from first principles, we prove the $2m \in \{4, 6\}$ bounds directly below.)*

**Lemma 4.1 (Sharp fourth- and sixth-moment bounds on $V_5(\mathbb{R}^n)$).** *For every $n \ge 1$ and every $F \in V_5(\mathbb{R}^n)$ with $\|F\|_2 = 1$,*

$$
\mathbb{E}[F^4] \le \frac{\mathbb{E}[h_5(G)^4]}{120^2} = 4653 \quad (\kappa_4(F) \in [0, 4650]), \qquad \mathbb{E}[F^6] \le \frac{\mathbb{E}[h_5(G)^6]}{120^3} = 404{,}895{,}765,
$$

*with equality in both bounds when $F(X) = h_5(\langle u, X\rangle)/\sqrt{120}$ ($\|u\|_2 = 1$).*

*Proof.* By the diagram / Wick formula for multiple Wiener–Itô integrals (Nourdin–Peccati [2012, Thm. 2.7.7]; Janson [1997, Thm. 3.12]), for any integer $m \ge 2$,

$$
\mathbb{E}\big[I_5(T)^{2m}\big] = \sum_{\pi \in \mathcal{M}_{\mathrm{loopless}}(2m, 5)} \operatorname{val}_\pi(T),
$$

where $\mathcal{M}_{\mathrm{loopless}}(2m, 5)$ is the finite set of perfect matchings $\pi$ of the $10m$ half-edges ($2m$ vertices $v_1, \dots, v_{2m}$, each of degree $5$) containing **no self-loops** (no edge connecting two half-edges of the same vertex), and $\operatorname{val}_\pi(T) = \sum_{\mathbf{i}} \prod_{a=1}^{2m} T_{\mathbf{i}(v_a)}$ sums over all assignments $\mathbf{i}: E(\pi) \to \{1, \dots, n\}$.
- **Case $2m = 4$ (2-pair Cauchy–Schwarz):** Partition the 4 vertices arbitrarily into two pairs $\{v_1, v_2\}$ and $\{v_3, v_4\}$. Let $E_{12}$ be the edges within $\{v_1, v_2\}$, $E_{34}$ the edges within $\{v_3, v_4\}$, and $E_{\mathrm{cross}}$ the edges between $\{v_1, v_2\}$ and $\{v_3, v_4\}$ ($2|E_{12}| + |E_{\mathrm{cross}}| = 10 = 2|E_{34}| + |E_{\mathrm{cross}}|$, so $|E_{12}| = |E_{34}| = r$, $|E_{\mathrm{cross}}| = 10 - 2r$). Defining $A_{\mathbf{c}} := \sum_{\mathbf{a} \in [n]^{E_{12}}} T(v_1) T(v_2)$ and $B_{\mathbf{c}} := \sum_{\mathbf{b} \in [n]^{E_{34}}} T(v_3) T(v_4)$ for each $\mathbf{c} \in [n]^{E_{\mathrm{cross}}}$, Cauchy–Schwarz gives
  $$\big|\operatorname{val}_\pi(T)\big| = \left|\sum_{\mathbf{c}} A_{\mathbf{c}} B_{\mathbf{c}}\right| \le \left(\sum_{\mathbf{c}} A_{\mathbf{c}}^2\right)^{1/2}\left(\sum_{\mathbf{c}} B_{\mathbf{c}}^2\right)^{1/2}.$$
  If $v_1$ and $v_2$ share $r$ internal edges $\mathbf{a}$ and split $\mathbf{c} = (\mathbf{c}_1, \mathbf{c}_2)$ with $|\mathbf{c}_1| = |\mathbf{c}_2| = 5 - r$, then viewing $T$ as an $n^{5-r} \times n^r$ matrix $M_r$ ($\|M_r\|_F^2 = \|T\|_{\mathrm{HS}}^2 = 1$), we have $A_{\mathbf{c}_1, \mathbf{c}_2} = (M_r M_r^\top)_{\mathbf{c}_1, \mathbf{c}_2}$, so $\sum_{\mathbf{c}} A_{\mathbf{c}}^2 = \|M_r M_r^\top\|_F^2 \le \|M_r\|_F^4 = 1$. By symmetry $\sum_{\mathbf{c}} B_{\mathbf{c}}^2 \le 1$, hence $|\operatorname{val}_\pi(T)| \le 1$ for **every** $\pi \in \mathcal{M}_{\mathrm{loopless}}(4, 5)$.
- **Case $2m = 6$ (3-pair Frobenius submultiplicativity):** Group the 6 vertices into 3 pairs $P_1 = \{v_1, v_2\}$, $P_2 = \{v_3, v_4\}$, $P_3 = \{v_5, v_6\}$. For $1 \le \alpha < \beta \le 3$, let $E_{\alpha\beta}$ be the set of edges of $\pi$ joining $P_\alpha$ to $P_\beta$, and let $E_\alpha$ be the internal edges inside $P_\alpha$. Since each $P_\alpha$ has total degree $5 + 5 = 10$, we have
  $$2|E_1| + |E_{12}| + |E_{13}| = 10, \qquad 2|E_2| + |E_{12}| + |E_{23}| = 10, \qquad 2|E_3| + |E_{13}| + |E_{23}| = 10.$$
  Define the three matrices $K^{(1)} \in \mathbb{R}^{n^{|E_{13}|} \times n^{|E_{12}|}}$, $K^{(2)} \in \mathbb{R}^{n^{|E_{12}|} \times n^{|E_{23}|}}$, and $K^{(3)} \in \mathbb{R}^{n^{|E_{23}|} \times n^{|E_{13}|}}$ by contracting the internal edges $E_\alpha$ inside each pair $P_\alpha$:
  $$K^{(1)}_{\mathbf{e}_{13}, \mathbf{e}_{12}} := \sum_{\mathbf{a} \in [n]^{E_1}} T(v_1)\,T(v_2), \qquad K^{(2)}_{\mathbf{e}_{12}, \mathbf{e}_{23}} := \sum_{\mathbf{b} \in [n]^{E_2}} T(v_3)\,T(v_4), \qquad K^{(3)}_{\mathbf{e}_{23}, \mathbf{e}_{13}} := \sum_{\mathbf{c} \in [n]^{E_3}} T(v_5)\,T(v_6).$$
  Then $\operatorname{val}_\pi(T) = \operatorname{tr}\big(K^{(1)} K^{(2)} K^{(3)}\big)$, so by Cauchy–Schwarz and Frobenius submultiplicativity $\|A B\|_F \le \|A\|_F \|B\|_F$,
  $$\big|\operatorname{val}_\pi(T)\big| \le \|K^{(1)}\|_F\,\|K^{(2)} K^{(3)}\|_F \le \|K^{(1)}\|_F\,\|K^{(2)}\|_F\,\|K^{(3)}\|_F.$$
  Finally, inside $P_1 = \{v_1, v_2\}$, let $d_1$ (resp. $d_2$) be the external edges of $E_{12} \cup E_{13}$ incident to $v_1$ (resp. $v_2$), so $|d_1| = |d_2| = 5 - |E_1|$. Reshaping the external indices $(\mathbf{e}_{13}, \mathbf{e}_{12})$ into $(\mathbf{u}_1, \mathbf{u}_2) \in [n]^{d_1} \times [n]^{d_2}$ (a bijection of index tuples, preserving the Euclidean / Frobenius norm!), $K^{(1)}$ reshaped is the matrix product $M_{(1)} M_{(2)}^\top$ where $\|M_{(1)}\|_F = \|M_{(2)}\|_F = \|T\|_{\mathrm{HS}} = 1$. Hence $\|K^{(1)}\|_F \le \|M_{(1)}\|_F \|M_{(2)}\|_F = 1$, and identically $\|K^{(2)}\|_F \le 1$ and $\|K^{(3)}\|_F \le 1$, proving $|\operatorname{val}_\pi(T)| \le 1$ for **every** $\pi \in \mathcal{M}_{\mathrm{loopless}}(6, 5)$!

Since the 1D tensor $T^{(1)} = e_1^{\otimes 5}$ ($I_5(T^{(1)}) = h_5(X_1)$) has $\operatorname{val}_\pi(T^{(1)}) = +1$ for every $\pi$, summing over $\pi$ yields $\mathbb{E}[F^4] \le \frac{\mathbb{E}[h_5(G)^4]}{120^2} = 4653$ and $\mathbb{E}[F^6] \le \frac{\mathbb{E}[h_5(G)^6]}{120^3} = 404{,}895{,}765$ (`verify.py` `verify_structural_constants_v5`). $\square$

### 4.2 Fifth-Chaos Carré-du-Champ OU Tower & Simplex Moment Reduction (**P**)

For unit-variance $F = \frac{1}{\sqrt{120}}I_5(T) \in V_5(\mathbb{R}^n)$ ($\|T\|_{\mathrm{HS}} = 1$), define:
- $r := |F|$, $V := F^2 = r^2$;
- $\tau_1 := \frac{1}{5}\|DF\|_2^2 \ge 0$, $\tau_2 := \frac{1}{20}\|D^2 F\|_{\mathrm{HS}}^2 \ge 0$;
- $w_1 := \|D\tau_1\|_2^2$, $w_{12} := \langle D\tau_1, D\tau_2\rangle$, $w_2 := \|D\tau_2\|_2^2$;
- $\sigma_{1,r} := \operatorname{sgn}(F)\frac{1}{2}\langle DF, D\tau_1\rangle = \operatorname{sgn}(F)\frac{1}{5}(DF)^\top(D^2 F)(DF)$, $\nu_{12,r} := \operatorname{sgn}(F)\frac{1}{2}\langle DF, D\tau_2\rangle$ (with $\operatorname{sgn}(0) := 0$).

**Proposition 4.2 (Fifth-chaos OU tower, pointwise cones, and exact 4-vertex simplex reduction).** *For every unit-variance $F \in V_5(\mathbb{R}^n)$:*
1. **OU generator identities:** $LF = -5F$ and
   $$L\tau_1 = 8(\tau_2 - \tau_1).$$
2. **Pointwise operator-norm & $3\times 3$ gradient Gram cones:**
   $$\sigma_{1,r}^2 \le 20\,\tau_1^2\,\tau_2,$$
   and for any $M_w = \begin{pmatrix} \mu_{00} & \mu_{01} \\ \mu_{01} & \mu_{11} \end{pmatrix} \succ 0$ and $(\ell_A, L_\nu) \in \mathbb{R}^2$,
   $$\mu_{00} w_1 + 2\mu_{01} w_{12} + \mu_{11} w_2 + \ell_A \sigma_{1,r} + L_\nu \nu_{12,r} + \frac{5}{16}\begin{pmatrix}\ell_A & L_\nu\end{pmatrix} M_w^{-1} \begin{pmatrix}\ell_A \\ L_\nu\end{pmatrix} \tau_1 \ge 0.$$
3. **Everywhere-$C^1(\mathbb{R})$ Stein brackets:** For piecewise-affine knot profiles $\phi_1, \phi_2, \phi_3, \psi_4$ satisfying the compact-support and $\psi_4(0) = \psi_4(r_K) = 0$ conditions of §3 (`verify.py` lines 705–715), all four brackets
   $$\begin{aligned}
   \mathrm{Br}_1 &:= 5\tau_1\phi_1(r) - 5 r G_1(r),\\
   \mathrm{Br}_2 &:= 5\tau_1(\tau_1 - 1)\phi_2(r) - 5(\tau_1 - 1) r G_2(r) + 2\sigma_{1,r} G_2(r),\\
   \mathrm{Br}_3 &:= 5\tau_1(\tau_2 - 1)\phi_3(r) - 5(\tau_2 - 1) r G_3(r) + 2\nu_{12,r} G_3(r),\\
   \mathrm{Br}_4 &:= 2\sigma_{1,r}\psi_4(r) - 8(\tau_1 - \tau_2) H_4(r)
   \end{aligned}$$
   have exact Gaussian expectation $\mathbb{E}[\mathrm{Br}_1] = \mathbb{E}[\mathrm{Br}_2] = \mathbb{E}[\mathrm{Br}_3] = \mathbb{E}[\mathrm{Br}_4] = 0$.
4. **Exact chaos-norm moment table & relaxed 4-simplex upper bound:** Write the Wiener–Itô expansion of $F^2$ as
   $$F^2 = 1 + \sum_{k=1}^4 J_{2k}(F) + J_{10}(F), \qquad J_{2k}(F) := \frac{(5 - k)!\binom{5}{5 - k}^2}{120}\,I_{2k}(T \widetilde{\otimes}_{5 - k} T) \in V_{2k}(\mathbb{R}^n),$$
   and put $a_k := \|J_{2k}(F)\|_2^2 \ge 0$ ($k = 1, 2, 3, 4$). Setting $c_{1,k} := \frac{5 - k}{5}$ and $c_{2,k} := \frac{(5 - k)(4 - k)}{20}$ (note $c_{2,4} = 0$), we have in $L^2(\gamma_n)$:
   $$\tau_1 - 1 = \sum_{k=1}^4 c_{1,k}\,J_{2k}(F), \qquad \tau_2 - 1 = \sum_{k=1}^4 c_{2,k}\,J_{2k}(F),$$
   and hence
   $$\begin{aligned}
   \kappa_4(F) &= \frac{3}{5}\sum_{k=1}^4 (5 - k) a_k, \qquad \mathbb{E}[V(\tau_1 - 1)] = \sum_{k=1}^4 c_{1,k} a_k = \frac{1}{3}\kappa_4(F), \qquad \mathbb{E}[V(\tau_2 - 1)] = \sum_{k=1}^4 c_{2,k} a_k,\\
   \operatorname{Var}(\tau_1) &= \sum_{k=1}^4 c_{1,k}^2 a_k, \qquad \operatorname{Cov}(\tau_1, \tau_2) = \sum_{k=1}^4 c_{1,k} c_{2,k} a_k, \qquad \operatorname{Var}(\tau_2) = \sum_{k=1}^4 c_{2,k}^2 a_k,\\
   \mathbb{E}[w_1] &= \sum_{k=1}^4 (2k) c_{1,k}^2 a_k, \qquad \mathbb{E}[w_{12}] = \sum_{k=1}^4 (2k) c_{1,k} c_{2,k} a_k, \qquad \mathbb{E}[w_2] = \sum_{k=1}^4 (2k) c_{2,k}^2 a_k.
   \end{aligned}$$

*Proof.*
1. Each $(DF)_i = \frac{5}{\sqrt{120}}I_4(T_{i\cdots}) \in V_4(\mathbb{R}^n)$ satisfies $L(DF)_i = -4(DF)_i$, so $L\tau_1 = \frac{1}{5}\sum_i (2(DF)_i L(DF)_i + 2\|D(DF)_i\|_2^2) = \frac{1}{5}(-8\|DF\|_2^2 + 2\|D^2 F\|_{\mathrm{HS}}^2) = -8\tau_1 + 8\tau_2 = 8(\tau_2 - \tau_1)$.
2. By Cauchy–Schwarz and $\|D^2 F\|_{\mathrm{op}} \le \|D^2 F\|_{\mathrm{HS}} = \sqrt{20\tau_2}$, $|\sigma_{1,r}| \le \frac{1}{5}\|DF\|_2^2 \|D^2 F\|_{\mathrm{op}} \le \tau_1\sqrt{20\tau_2} \implies \sigma_{1,r}^2 \le 20\tau_1^2\tau_2$ (attained at $h_5(X_1)/\sqrt{120}$). Setting $v_0 := \frac{\operatorname{sgn}(F)}{\sqrt{5}}DF$ ($\|v_0\|_2^2 \le \tau_1$, $\langle v_0, D\tau_1\rangle = \frac{2}{\sqrt{5}}\sigma_{1,r}$, $\langle v_0, D\tau_2\rangle = \frac{2}{\sqrt{5}}\nu_{12,r}$), let $U := \begin{pmatrix} D\tau_1 & D\tau_2 \end{pmatrix} \in \mathbb{R}^{n \times 2}$ and $y := \begin{pmatrix}\ell_A \\ L_\nu\end{pmatrix} \in \mathbb{R}^2$. Then $0 \le \|U M_w^{1/2} + \frac{\sqrt{5}}{4} v_0 y^\top M_w^{-1/2}\|_F^2 = \operatorname{tr}(U^\top U M_w) + \frac{\sqrt{5}}{2}\langle U y, v_0\rangle + \frac{5}{16}\|v_0\|_2^2 (y^\top M_w^{-1} y) \le \mu_{00} w_1 + 2\mu_{01} w_{12} + \mu_{11} w_2 + \ell_A \sigma_{1,r} + L_\nu \nu_{12,r} + \frac{5}{16}(y^\top M_w^{-1} y)\tau_1$ (`verify.py` `verify_structural_constants_v5` witnesses exact zero slack on $X_1 X_2 X_3 X_4 X_5$ at $(1,1,1,1,1)$).
3. Exact zero mean of $\mathrm{Br}_1, \dots, \mathrm{Br}_4$ follows identically to `KRS501` Proposition 3.1 from $LF = -5F$ and $L\tau_1 = -8(\tau_1 - \tau_2)$.
4. For $d = 5$, applying the Wiener–Itô product formula to $(DF)_i = \frac{5}{\sqrt{120}}I_4(T_{i\cdots})$ (`r_contr = 4 - k` for $k = 1, 2, 3, 4$, summing over $i = 1, \dots, n$) gives $\tau_1 = 1 + \sum_{k=1}^4 c_{1,k} J_{2k}(F)$ with
   $$c_{1,k} = \frac{\frac{5}{120}(4 - k)!\binom{4}{4 - k}^2}{\frac{1}{120}(5 - k)!\binom{5}{5 - k}^2} = \frac{5}{5 - k}\cdot\left(\frac{5 - k}{5}\right)^2 = \frac{5 - k}{5},$$
   and similarly applying the product formula to $(D^2 F)_{ij} = \frac{20}{\sqrt{120}}I_3(T_{ij\cdots})$ (`r_contr = 3 - k` for $k = 1, 2, 3$, while $2k = 8$ cannot arise from $I_3 \cdot I_3$ so $c_{2,4} = 0$!) gives
   $$c_{2,k} = \frac{\frac{20}{120}(3 - k)!\binom{3}{3 - k}^2}{\frac{1}{120}(5 - k)!\binom{5}{5 - k}^2} = \frac{20}{(5 - k)(4 - k)}\cdot\left(\frac{(5 - k)(4 - k)}{20}\right)^2 = \frac{(5 - k)(4 - k)}{20}.$$
   Orthogonality of Wiener chaoses $V_{2k}$ ($L J_{2k} = -2k J_{2k}$, $\mathbb{E}[\|D J_{2k}\|_2^2] = 2k\,a_k$, $\mathbb{E}[F^2 J_{2k}(F)] = \|J_{2k}(F)\|_2^2 = a_k$) immediately yields all variance, covariance, Dirichlet-energy, and cross-moment formulas, and $\mathbb{E}[F^4] = 3\mathbb{E}[V\tau_1]$ (from $\mathbb{E}[\langle D(F^3), DF\rangle + F^3 LF] = 0 \implies 15\mathbb{E}[V\tau_1] = 5\mathbb{E}[F^4]$!) gives $\kappa_4(F) = 3\mathbb{E}[V(\tau_1 - 1)] = 3\sum_{k=1}^4 c_{1,k} a_k = \frac{3}{5}\sum_{k=1}^4 (5 - k) a_k$! *(Every single identity is independently verified against exact multivariate Gaussian integration across 5 order-5 tensors in `check_identities_exact.py`.)*

Because every moment in (4) is **exact linear in $(a_1, a_2, a_3, a_4) \ge 0$**, and every realizable unit-variance $F \in V_5(\mathbb{R}^n)$ with $\kappa_4(F) = s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$ has $(s, a_1, a_2, a_3, a_4)$ inside the **relaxed simplex polytope**
$$\Delta(s_{\mathrm{lo}}, s_{\mathrm{hi}}) := \left\{(s, a_1, a_2, a_3, a_4) \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}] \times \mathbb{R}_{\ge 0}^4 : \frac{3}{5}\sum_{k=1}^4 (5 - k)a_k = s\right\},$$
maximizing the linear moment functional over the relaxed polytope $\Delta(s_{\mathrm{lo}}, s_{\mathrm{hi}})$ reduces to its **8 extreme points** $(s_*, a^{(k)}(s_*))$ ($s_* \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\}$, $k \in \{1, 2, 3, 4\}$, $a^{(k)}_j(s_*) = \delta_{jk}\frac{5 s_*}{3(5 - k)}$), yielding a sound upper bound over all realizable $F \in V_5(\mathbb{R}^n)$ with $\kappa_4(F) \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$ (attainment of individual relaxed vertices by fifth-chaos tensors is neither claimed nor needed). $\square$

### 4.3 Dimension-Free Complex Sixth-Moment Bound & $U(1)$ Phase Transfer to $H_{3,2}(\mathbb{C}^n)$ (**P + C**)

**Lemma 4.3 (Self-contained 3-pair conjugate Frobenius proof of the universal sixth-moment bound on $H_{3,2}(\mathbb{C}^n)$; cf. `KSR` [`../sharp-radius-2026-11-17-gemini-2762/PROOF.md`](../sharp-radius-2026-11-17-gemini-2762/PROOF.md) §4.3).** *For every $n \ge 1$ and every $q \in H_{3,2}(\mathbb{C}^n)$ with $\|q\|_2 = 1$,*

$$
\mathbb{E}|q|^4 \le \mathbb{E}|q_1|^4 = 1842 \quad (\chi(q) := \mathbb{E}|q|^4 - 2 \in [0, 1840]), \qquad \mathbb{E}|q|^6 \le \mathbb{E}|q_1|^6 = 59{,}735{,}934,
$$

*with equality attained at the one-variable complex Hermite–Laguerre quintic $q_1(z) := \frac{z_1(|z_1|^4 - 6|z_1|^2 + 6)}{\sqrt{12}} \in H_{3,2}(\mathbb{C}^1)$.*

*Proof.* Write $q(z) = \frac{1}{\sqrt{3!\,2!}}\,I_{3,2}^{\mathbb{C}}(A) = \frac{1}{\sqrt{12}}\,I_{3,2}^{\mathbb{C}}(A)$ with $A \in \operatorname{Sym}^3(\mathbb{C}^n) \otimes \operatorname{Sym}^2(\overline{\mathbb{C}^n})$ normalized so $\|A\|_{\mathrm{HS}}^2 = \sum_{i_1,i_2,i_3,j_1,j_2=1}^n |A_{i_1 i_2 i_3; j_1 j_2}|^2 = \|q\|_2^2 = 1$. By the complex Wiener–Itô diagram formula (Janson [1997, Thm. 3.12]), for $m \in \{2, 3\}$,

$$
\mathbb{E}\big[|I_{3,2}^{\mathbb{C}}(A)|^{2m}\big] = \mathbb{E}\Big[I_{3,2}^{\mathbb{C}}(A)^m\,\overline{I_{3,2}^{\mathbb{C}}(A)}^m\Big] = \sum_{\pi \in \mathcal{M}_{\mathrm{loopless}}^{\mathbb{C}}(m, m; 3, 2)} \operatorname{val}_\pi(A),
$$

where $\mathcal{M}_{\mathrm{loopless}}^{\mathbb{C}}(m, m; 3, 2)$ is the set of loopless directed matchings $\pi$ pairing the $5m$ holomorphic (`+`) half-edges with the $5m$ antiholomorphic (`-`) half-edges across $m$ vertices $u_1, \dots, u_m$ (each of bidegree $(3+, 2-)$, carrying $A$) and $m$ conjugate vertices $w_1, \dots, w_m$ (each of bidegree $(2+, 3-)$, carrying $\overline{A}$). Group the $2m$ vertices into $m$ conjugate pairs $P_\alpha := \{u_\alpha, w_\alpha\}$ ($\alpha = 1, \dots, m$). Because $\pi$ has **no self-loops** on $u_\alpha$ or on $w_\alpha$, every internal directed edge $e \in E_\alpha$ with both endpoints inside $P_\alpha$ connects one half-edge of $u_\alpha$ to one half-edge of $w_\alpha$. Hence if $|E_\alpha| = r_\alpha$, both $u_\alpha$ and $w_\alpha$ have $r_\alpha$ internal half-edges and $5 - r_\alpha$ external half-edges (total external degree $10 - 2 r_\alpha$ on $P_\alpha$).
- For $2m = 4$ ($P_1, P_2$), contracting $E_1$ inside $P_1$ reshapes into a matrix product $M_{(1)} N_{(1)}$ with $\|M_{(1)}\|_F = \|A\|_{\mathrm{HS}} = 1$ and $\|N_{(1)}\|_F = \|\overline{A}\|_{\mathrm{HS}} = 1$, giving $|\operatorname{val}_\pi(A)| \le \|K^{(1)}\|_F \|K^{(2)}\|_F \le 1$.
- For $2m = 6$ ($P_1, P_2, P_3$), let $E_{\alpha\beta}$ ($1 \le \alpha < \beta \le 3$) be the external edges between $P_\alpha$ and $P_\beta$ ($2 r_1 + |E_{12}| + |E_{13}| = 10$, etc.), and define $K^{(1)} \in \mathbb{C}^{n^{|E_{13}|} \times n^{|E_{12}|}}$, $K^{(2)} \in \mathbb{C}^{n^{|E_{12}|} \times n^{|E_{23}|}}$, $K^{(3)} \in \mathbb{C}^{n^{|E_{23}|} \times n^{|E_{13}|}}$ by contracting the internal edges $E_\alpha$ inside $P_\alpha$. Reshaping the $10 - 2 r_\alpha$ external half-edges of $P_\alpha$ into the $5 - r_\alpha$ external half-edges on $u_\alpha$ and the $5 - r_\alpha$ external half-edges on $w_\alpha$ is a bijection of index tuples (preserving Frobenius norm) that identifies $K^{(\alpha)}$ with $M_{(\alpha)} N_{(\alpha)}$ ($\|M_{(\alpha)}\|_F = \|N_{(\alpha)}\|_F = \|A\|_{\mathrm{HS}} = 1$). Hence $\|K^{(\alpha)}\|_F \le 1$ and $|\operatorname{val}_\pi(A)| = |\operatorname{tr}(K^{(1)} K^{(2)} K^{(3)})| \le \|K^{(1)}\|_F \|K^{(2)}\|_F \|K^{(3)}\|_F \le 1$ for every $\pi \in \mathcal{M}_{\mathrm{loopless}}^{\mathbb{C}}(3, 3; 3, 2)$.

At $A^{(1)} = e_1^{\otimes 3} \otimes \bar{e}_1^{\otimes 2}$ ($q_1(z) = \frac{1}{\sqrt{12}} I_{3,2}^{\mathbb{C}}(A^{(1)})$), every $\pi$ has $\operatorname{val}_\pi(A^{(1)}) = +1$, so $\mathbb{E}|q|^4 \le \mathbb{E}|q_1|^4 = 1842$ and $\mathbb{E}|q|^6 \le \mathbb{E}|q_1|^6 = 59{,}735{,}934$ (`verify.py` `verify_structural_constants_v5`, `check_identities_exact.py` `verify_h32_phase_transfer`). $\square$

Let $q \in H_{3,2}(\mathbb{C}^n)$ satisfy $\|q\|_2 = 1$ and $\chi(q) := \mathbb{E}|q|^4 - 2 \in [0, 1840]$. Because $q(e^{i\alpha} z) = e^{i(3 - 2)\alpha} q(z) = e^{i\alpha} q(z)$ has charge $+1$, the complex law of $q(z)$ is $U(1)$-invariant ($q(z) \stackrel{d}{=} |q(z)| e^{i\Phi}$ with $\Phi \sim \operatorname{Unif}[0, 2\pi)$ independent of $|q(z)|$). Setting $z_j = \frac{x_j + i y_j}{\sqrt{2}}$ ($(x, y) \sim \mathcal{N}(0, I_{2n})$), each slice $F_\theta := \sqrt{2}\operatorname{Re}(e^{-i\theta} q)$ lies in $V_5(\mathbb{R}^{2n})$ ($L_{\mathbb{R}^{2n}} = 2 L_{\mathbb{C}^n}$ acts by $-5$ on $H_{3,2} \oplus H_{2,3}$) and has identical law to $F_0$, with:
- $\mathbb{E}|q| = \frac{\pi}{2\sqrt{2}}\mathbb{E}|F_0|$;
- $\mathbb{E}[F_\theta^2] = 2\cdot\frac{1}{2}\mathbb{E}|q|^2 = 1$;
- $\mathbb{E}[F_\theta^4] = 4\cdot\frac{3}{8}\mathbb{E}|q|^4 = \frac{3}{2}(2 + \chi(q)) = 3 + \frac{3}{2}\chi(q) \implies \kappa_4(F_\theta) = \frac{3}{2}\chi(q)$;
- $\mathbb{E}[F_\theta^6] = 8\cdot\frac{5}{16}\mathbb{E}|q|^6 = \frac{5}{2}\mathbb{E}|q|^6 \le \frac{5}{2}\cdot 59{,}735{,}934 = 149{,}339{,}835$ (by Lemma 4.3; independently verified in `verify.py` and `check_identities_exact.py`).

Applying the 5 slice slabs of `cert_v5_458.json` covering $s = \kappa_4(F_0) \in [0, 39]$ ($\chi \in [0, 26]$) certifies $\mathbb{E}|q| \le \frac{181}{200}\|q\|_2 = 0.905\,\|q\|_2$ on $[0, \frac{4}{3}]$ ($\le \frac{9}{10}\|q\|_2$ on $[0, \frac{1}{3}]$), $\le \frac{23}{25}\|q\|_2$ on $[0, 4]$, and $\le \frac{97}{100}\|q\|_2$ across $\chi \in [0, 26]$. On the remaining high-kurtosis regime $\chi \in [26, 1840]$, evaluating the strict degree-6 polynomial majorant $P(x) = \frac{1 + x^2}{2} - \varepsilon(x^2 - 1)^2 + \eta x^6 > x$ ($x \ge 0$, $\varepsilon = \frac{1}{2(B + 1)^2}$, $\eta = \frac{\varepsilon(B^2 - 1)^2}{B^6}$) at $B = 2100$ yields $\mathbb{E}|q| \le 1 - 27\varepsilon + 59{,}735{,}934\,\eta < \frac{999{,}999}{1{,}000{,}000}$ (`margin = 1.524e-6`, $> 720\times$ wider than `KSR`'s $2.09\cdot 10^{-9}$). $\square$

---

## 5. Exact Zero-Float Verification & Replay Instructions

All five verification scripts in [`../../code/chaos-stein-458-gemini-8732/`](../../code/chaos-stein-458-gemini-8732/) use **100% Python 3 standard library**, **zero floating-point operations or literals**, and **zero `assert` statements** (enforced by static AST self-audit):

```bash
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/verify_ibp_cone.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/verify.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/verify_bernstein.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/check_identities_exact.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/test_controls.py
```
