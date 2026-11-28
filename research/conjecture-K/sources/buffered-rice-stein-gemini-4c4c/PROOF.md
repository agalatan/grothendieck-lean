# Sharp Gaussian-Buffered Complex Cubic Radius through $s \le \frac{5}{8}$ and Remote Mid-$t$ Closure through $t \le \frac{61}{100}$

*Author: `gemini-4c4c` (`KBRS`), 28 November 2026. Task [#784](https://github.com/agalatan/grothendieck-lean/issues/784) (refs [#177](https://github.com/agalatan/grothendieck-lean/issues/177), [#436](https://github.com/agalatan/grothendieck-lean/issues/436), [#453](https://github.com/agalatan/grothendieck-lean/issues/453), [#628](https://github.com/agalatan/grothendieck-lean/issues/628), [#751](https://github.com/agalatan/grothendieck-lean/issues/751), [#769](https://github.com/agalatan/grothendieck-lean/issues/769)).*
*Status labels follow [`STATUS.md`](../../STATUS.md) §0: **P + C, author only** (self-contained written proof + zero-float, `-O`-safe pure-stdlib exact `Fraction` / integer Sturm verifier [`verify.py`](../../code/buffered-rice-stein-gemini-4c4c/verify.py) and 14-corruption + `P3` §§6–7 negative-control suite [`test_controls.py`](../../code/buffered-rice-stein-gemini-4c4c/test_controls.py)), depending solely on previously reviewed **Lean** / **P** / **P + C** inputs listed in §1.4.*

---

## 1. Main results and dependency ledger

Let $Z \sim \mathcal{CN}(0, 1)$ be a standard proper complex Gaussian ($\mathbb{E}|Z|^2 = 1$, density $\pi^{-1}e^{-|z|^2}$ on $\mathbb{C}$, $R_0 := \mathbb{E}|Z| = \frac{\sqrt{\pi}}{2} = 0.8862269254\dots$), and let $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ ($n \ge 1$ arbitrary) be a unit-variance bidegree-$(2, 1)$ complex Wiener-chaos polynomial independent of $Z$. Put
$$U := |q|^2 \quad (\mathbb{E}[U] = 1), \qquad \chi := \mathbb{E}[U^2] - 2 \in [0, 42], \qquad \kappa_6^{\mathbb{C}}(q) := \mathbb{E}[U^3] - 6 - 9\chi \le C_6\,\chi^{3/2},$$
with $C_6 = \frac{4045313}{100000} = 40.45313$ (`STATUS.md` `3.4`, **Lean**). Conditioning on $U = v \ge 0$ expresses the Gaussian-buffered first moment as
$$\mathbb{E}\big|Z + \sqrt{s}\,q\big| = \mathbb{E}\big[\rho(s U)\big], \qquad \rho(x) := \mathbb{E}\big|Z + \sqrt{x}\big| = R_0\,e^{-x/2}\Big[(1 + x)I_0\!\left(\tfrac{x}{2}\right) + x\,I_1\!\left(\tfrac{x}{2}\right)\Big] \qquad (x \ge 0). \tag{1}$$

In [`STATUS.md`](../../STATUS.md) `3.5a` (`buffered-rice-codex-a7c4/PROOF.md`, **P + C**, reviewed in `#735`), moment-only covers proved the sharp Gaussian inequality $\mathbb{E}|Z + \sqrt{s}\,q| \le R_0\sqrt{1 + s}$ for $0 \le s \le \frac{1}{6}$, yielding the exact remote cubic energy cap $\|P_{2,1}^{\mathrm{rem}} k\|_2^2 \le \frac{\pi}{4} - t^2$ down to $t \ge R_0\sqrt{6/7} = 0.8204869\dots$. That cutoff left `[0.751, 0.8205]` in the priced-peak consumer `8.13` (`#769`) using an inflated envelope, missed six rationalised degree-5 rows `0.70–0.80` in `#453` / `#751`, and did not reach the intermediate-$t$ window $t \in [\frac{1}{4}, \frac{13}{20}]$ of [`#628` `ATK P3`](../../../../higher-degree/sources/degree5-attack-2026-11-25/problems/P3-mid-t-direct-bound.md).

Because a single complex coordinate $q_1(z) = z_1(|z_1|^2 - 2)/\sqrt{2}$ ($\chi = 42$) already exceeds $R_0\sqrt{1 + s}$ by $s = 1$, no moment-only bound can cross $s \approx \frac{1}{6}$, and no pure Stein bound can reach $\chi \to 0^+$ either (any nonzero Stein test $\phi$ couples $c_1 + c_2 - 3$ of norm $\Theta(\sqrt{\chi})$ against $O(1)$ test terms, paying $+c\sqrt{\chi} \gg \Theta(\chi)$ as $\chi \downarrow 0$). By combining a **midpoint-centered two-step Ornstein–Uhlenbeck cumulant expansion at $V_L \equiv 1$** for small $\chi$ with a **pure-$v$ Level-2 Matrix Stein + 5-scalar Lean Gram LP certificate** against a **complete-monotonicity Hermite cubic Rice cap bank** for bulk and high $\chi$, we prove:

### Theorem 1 — Sharp Gaussian-buffered complex cubic radius through $s \le \frac{5}{8}$ (`STATUS.md` `3.5a`, **P + C, author only**)

*For every dimension $n \ge 1$, every $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$, and every $\sigma, \tau \ge 0$ with $0 \le s := \frac{\tau^2}{\sigma^2}\|q\|_2^2 \le \frac{5}{8} = 0.625$ (when $\sigma > 0$),*
$$\mathbb{E}\big|\sigma Z + \tau q\big| \le \frac{\sqrt{\pi}}{2}\sqrt{\sigma^2 + \tau^2\|q\|_2^2}, \qquad\text{equivalently}\qquad \mathbb{E}\big|Z + \sqrt{s}\,q\big| \le \frac{\sqrt{\pi}}{2}\sqrt{1 + s} \quad \big(\|q\|_2 = 1,\; 0 \le s \le \tfrac{5}{8}\big). \tag{2}$$
*Equality holds along asymptotic Gaussian sequences $q_N = \frac{1}{\sqrt{N}}\sum_{j=1}^N e_{2,1}(z_j)$ ($\chi(q_N) = \frac{42}{N} \to 0$), so the constant $\frac{\sqrt{\pi}}{2}\sqrt{1 + s}$ is sharp at every $s \in [0, \frac{5}{8}]$. Moreover, for every $0 < s \le \frac{5}{8}$ and every nonzero finite-dimensional $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ ($\chi > 0$ by `STATUS.md` `6.3.32`), inequality `(2)` is strict.*

### Corollary 1a — Exact remote cubic energy frontier down to $\sqrt{2\pi/13} < 0.695215 < \frac{7}{10}$ (`STATUS.md` `2.12g`)

*Let $(f, g)$ be any measurable unimodular pair on $\mathbb{C}^{1+m}$ ($|f| = |g| = 1$ a.s.), put $h = \frac{f+g}{2}$, $k = \frac{f-g}{2}$, $t = |\langle z_1, h\rangle|$, and let $q_{\mathrm{rem}} := P_{2,1}^{\mathrm{rem}} k \in \mathcal{H}_{2,1}(z_2, \dots, z_{1+m})$ be the remote cubic projection of $k$. Whenever*
$$\sqrt{\frac{2\pi}{13}} = 0.695213726\dots \le t \le \frac{\sqrt{\pi}}{2} = 0.886226925\dots \qquad \left(\text{in particular for all } t \in \left[\frac{139043}{200000},\, \frac{\sqrt{\pi}}{2}\right] \supset \left[\frac{7}{10},\, \frac{\sqrt{\pi}}{2}\right]\right),$$
*the remote cubic energy satisfies the exact Gaussian ceiling*
$$\big\|P_{2,1}^{\mathrm{rem}} k\big\|_2^2 \le \frac{\pi}{4} - t^2, \qquad\text{hence}\qquad u_{\mathrm{rem}} = \big\|\varepsilon P_{2,1}^{\mathrm{rem}} k\big\|_2^2 \le \varepsilon^2\!\left(\frac{\pi}{4} - t^2\right) =: e_{\max}(t). \tag{3}$$
*This covers **100%** of the `[0.751, 0.8205]` interval in `STATUS.md` `8.13` (`#769`) with zero cap inflation and **all 19 of 19** rationalised degree-5 rows `0.70–0.886` in `#453` / `#751`.*

### Theorem 2 — Quantitative buffered Rice curve for $s > \frac{5}{8}$ and continuum closure of `#628` `ATK P3` §5 on $t \in [0, \frac{61}{100}]$

*1. **Certified buffered Rice upper curve.** Uniformly over all $n \ge 1$ and all unit-variance $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ ($\chi \in [0, 42]$), $\mathbb{E}|Z + \sqrt{s_j}\,q| \le R_{\mathrm{buf}}(s_j)$ holds at the seven rational nodes $s_j \in \{1, \frac{17}{16}, \frac{5}{4}, \frac{3}{2}, 2, 3, \frac{9}{2}\}$ with the certified rational constants `midt_nodes` in [`cert_buffered_rice.json`](../../code/buffered-rice-stein-gemini-4c4c/cert_buffered_rice.json) (e.g., $R_{\mathrm{buf}}(1) = \frac{627047}{500000} = 1.254094$ vs Gaussian $1.253314$, ratio $< 1.00063$; $R_{\mathrm{buf}}(\frac{17}{16}) = \frac{1273809}{1000000} = 1.273809$ vs Gaussian $1.272747$, ratio $< 1.00084$).*

*2. **Remote mid-$t$ closure (`#628` `ATK P3` §5).** For $T = P_{1,0} - \frac{39}{50}P_{2,1} + \frac{779}{10000}P_{3,2}$, every $n \ge 2$, and every unimodular pair $(f, g)$ on $\mathbb{C}^n$ with $P_{1,0}\frac{f+g}{2} = t z_1$ ($0 \le t \le \frac{61}{100}$) whose cubic difference projection is remote ($P_{2,1}\frac{f-g}{2} \in \mathcal{H}_{2,1}(z_2, \dots, z_n)$),*
$$V(f, g) = \operatorname{Re}\langle f, T g\rangle \le \left(1 - \frac{779}{10000}\right)t^2 + \frac{779}{10000} + \left(\frac{39}{50} - \frac{779}{10000}\right)\|P_{2,1} k\|_2^2 < \frac{500}{701} - 9 \cdot 10^{-4}. \tag{4}$$

*3. **Tightness at the Gaussian barrier (`#628` `ATK P3` §6 negative result).** Along the remote Gaussian sequence $f_N = \operatorname{ph}(z_1 + c q_N), g_N = \operatorname{ph}(z_1 - c q_N)$ with $q_N = \frac{1}{\sqrt{N}}\sum_{j=1}^N e_{2,1}(y_j)$, $\lim_{N\to\infty}\|P_{2,1} k_N\|_2^2 = \frac{\pi}{4} - t(c)^2$, and the right-hand side of `(4)` equals $\frac{500}{701}$ at*
$$t_* = \sqrt{\frac{\frac{500}{701} - \eta - (\varepsilon - \eta)\frac{\pi}{4}}{1 - \varepsilon}} = 0.6176889\dots < \frac{618}{1000}.$$
*Thus no bound using `(4)` alone can reach $t = \frac{618}{1000}$, and Theorem 2 closes `[0, 0.610]` within `0.00769` of the absolute barrier of `(4)`.*

### 1.4 Complete dependency inventory

Every external input used in this proof has been independently reviewed (**Lean**, **P**, or **P + C**):

| Tag / Row | Statement used | Status |
|---|---|---|
| `STATUS.md` `3.4` (`Grothe.Cumulant6`) | $\chi = \mathbb{E}|q|^4 - 2 \in [0, 42]$ and $\kappa_6^{\mathbb{C}}(q) \le \frac{4045313}{100000}\,\chi^{3/2}$ for unit $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ | **Lean** |
| `STATUS.md` `6.3.20` (`#441`, `#512`) | Exact Level-2 complex Stein identities, radial cones, and 5-scalar `(n, h, b, y, z)` Gram LP cuts + fourth-moment bridges `(198 + 150/\alpha_1)H_0 + 150\alpha_1 S_0` and `(11781/32 + 135/(2\alpha_2))H_0 + (135/2)\alpha_2 S_0` | **P + C** |
| `STATUS.md` `3.19` ([`KCR`](../cumulant-remainder-codex-a7c4/PROOF.md), `#468`) & [`KSR`](../sharp-radius-2026-11-17-gemini-2762/PROOF.md) | Real projection $2\mathbb{E}|Z + \sqrt{s}\,q| = \pi\mathbb{E}|\frac{N_0}{\sqrt{2}} + \sqrt{\frac{s}{2}}F|$, two-step Stein cumulant expansion `(6)`–`(9)`, OU resolvent kernel `W_{k/3, l/3}(\theta)` (`KSR` Lemma 1.1), and real third-chaos contraction constants $c_{j,k,l}$ | **P** |
| `STATUS.md` `3.7` | Global unbuffered complex cubic radius $\rho_* \le \frac{2287}{2500} = 0.9148$ (used only on $t \in [0, \frac{1}{5}]$ in Theorem 2) | **P + C** |
| `STATUS.md` `2.12g`, `3.5a` (`#735`) | Three-line response inequality $t + \lambda\|q_{\mathrm{rem}}\|_2^2 \le \mathbb{E}|Z + \lambda q_{\mathrm{rem}}|$ and asymptotic Gaussian equality | **P + C** |

*(In particular, we do **not** rely on any `author only` row: the low-$s$ `[0, 1/6]` cover, the $V_L \equiv 1$ OU remainder bounds, and the Bessel/Hermite Rice cap bank are re-proved and verified from scratch inside `verify.py`.)*

---

## 2. Regime A: Self-contained low-$s$ cover on $[0, \frac{1}{6}] \times [0, 49]$

On $s \in [0, \frac{1}{6}]$ and $y := \sqrt{\chi} \in [0, 7]$ ($\chi \le 49 \supset [0, 42]$), we replay and verify from scratch the three-regime cover of [`buffered-rice-codex-a7c4/PROOF.md`](../buffered-rice-codex-a7c4/PROOF.md) (`STATUS.md` `3.5a`, reviewed in `#735`), using the Beta Laplace-transform representation $\rho'(x) = \frac{R_0}{2}\mathbb{E}_{T \sim \mathrm{Beta}(1/2, 3/2)}[e^{-xT}]$ proved self-containedly in §4.1 Eq. `(8)` below, with moments $\mu_k = \mathbb{E}[T^k] = 1, \frac{1}{4}, \frac{1}{8}, \frac{5}{64}, \frac{7}{128}$ ($k = 0, \dots, 4$):

1. **Small excess $y \in [0, \frac{1}{11}]$:** By `KCR` §§3–4 (`buffered-rice-codex-a7c4/PROOF.md` Eq. `(2)`), for $F = \sqrt{2}\operatorname{Re} q$ ($\mathbb{E}[F^4] = 3 + \frac{3}{2}y^2 < (\frac{33}{25})^4 \implies K_\beta \le \frac{81}{20}$), $(R_0\sqrt{1+s} - \mathbb{E}\rho(sU)) / (R_0 s^2 y^2) \ge \frac{1}{16(1+s)^{3/2}} - y\big[\frac{C_6 s}{96(1+s)^{5/2}} + \frac{81}{20}\frac{12}{7}\sqrt{3/\pi}\,s^{3/2}\big] > \frac{1}{500}$ (`verify_low_s_regime` lines 348–352).
2. **Intermediate excess $y \in [\frac{1}{11}, 1]$:** Writing $\frac{\rho(x)}{R_0} = 1 + \frac{1}{2}\mathbb{E}[(1 - e^{-xT})/T] \le 1 + \frac{x}{2} - \frac{x^2}{16} + \frac{x^3}{96} - \frac{5x^4}{3072(1 + 7x/40)}$ (`buffered-rice-codex-a7c4/PROOF.md` Eq. `(3)`–`(4)`) and applying Cauchy–Schwarz $\mathbb{E}[\frac{U^4}{1 + 7sU/40}] \ge \frac{M_0^2}{2 + y^2 + 7sM_0/40}$ with monotonicity in $M_0 \le M_3(y) := 6 + 9y^2 + \frac{40454}{1000}y^3$ yields rational box lower bounds certified across $[0, \frac{1}{6}] \times [\frac{1}{11}, 1]$.
3. **Large excess $y \in [1, 7]$:** Subtracting $\rho(sU)$ from its tangent at $s$ via $e^{-z} - 1 + z \ge \frac{z^2}{2(1 + z_+/2)}$ and log-convex Jensen under the $T$-weighted $\mathrm{Beta}(\frac{3}{2}, \frac{3}{2})$ law (`buffered-rice-codex-a7c4/PROOF.md` Eq. `(5)`) yields $\frac{\rho(s) - \mathbb{E}\rho(sU)}{R_0} \ge \frac{s^2(1 - s/2)(1+y^2)^2}{16(1 + y^2 + \frac{s}{4}(3 + 7y^2 + \frac{40454}{1000}y^3))}$, exceeding $\frac{\rho(s) - R_0\sqrt{1+s}}{R_0} \le \frac{s^2}{16}(1 - \frac{5}{6}s + \frac{5}{8}s^2)$ on adaptive dyadic boxes verified by strip sweep (`verify_low_s_regime` lines 361–393).

---

## 3. Regime B: Midpoint-centered two-step Ornstein–Uhlenbeck remainder at $V_L \equiv 1$

Specializing `KCR` / `KSR` to the unshifted Gaussian visible field $L = Z$ gives deterministic scale $V_L \equiv 1$! Put $N_0 := \sqrt{2}\operatorname{Re} Z \sim \mathcal{N}(0, 1)$, $F := \sqrt{2}\operatorname{Re} q \in \mathcal{H}_3(\mathbb{R}^{2n})$ ($\mathbb{E}[F^2] = 1$, $\kappa_4(F) = \frac{3}{2}\chi$, $\kappa_6(F) = \frac{5}{2}\kappa_6^{\mathbb{C}}(q)$), $c := \mathbb{E}|N_0| = \sqrt{2/\pi}$, and $e^{-2\varepsilon} = r_s := \frac{s}{1 + s} \in (0, 1)$ for $s > 0$. By circularity of $Z + \sqrt{s}\,q$,
$$2\,\mathbb{E}\big|Z + \sqrt{s}\,q\big| = \frac{\sqrt{\pi}}{c}\sqrt{1 + s}\;\mathbb{E}_F\big[(P_\varepsilon|\cdot|)(F)\big] = \sqrt{\pi}\sqrt{1 + s} - \frac{\sqrt{\pi}}{16}(1 + s)^{-3/2}s^2\chi + \frac{\sqrt{\pi}}{96}(1 + s)^{-5/2}s^3\kappa_6^{\mathbb{C}}(q) + R_2(s, q), \tag{5}$$
where, with $U_{\mathbb{R}} := \|DF\|^2 - 3 = U_2 + U_4 \in \mathcal{H}_2 \oplus \mathcal{H}_4$, $A_s := 1 + s$, $B_{s,\theta} := 1 + s(1 - \theta)$, and $h_4(w) := (w^2 - 6w + 3)e^{-w/2}$ (`KSR` Lemma 1.1; re-derived in §2.2 of [`KSLIV`](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md) via Gaussian expectation of $K_\gamma(y) = e^{-\gamma y^2/2}$),
$$R_2(s, q) = \frac{\sqrt{\pi}}{54}\,s^3\sum_{k \in \{2, 4\}}\sum_{l \in \{0, 2, 4, 6, 8\}}\int_0^1 W_{k/3, l/3}(\theta)\,\theta^2\,\mathbb{E}_F\!\left[\left(B_{s,\theta}^{-5/2}h_4\!\left(\frac{s\theta F^2}{B_{s,\theta}}\right) - 3 A_s^{-5/2}\right)U_{\mathbb{R}}\,\Pi_l(U_{\mathbb{R}} U_k)\right]d\theta, \tag{6}$$
$$W_{\alpha,\beta}(\theta) = \frac{1}{d}\left(\frac{\theta^{-(\beta+4)/2} - 1}{\beta + 4} - \frac{\theta^{-(\alpha+2)/2} - 1}{\alpha + 2}\right) > 0 \qquad (\alpha = k/3,\; \beta = l/3,\; d = \beta + 2 - \alpha > 0).$$

### Lemma 3.1 — Asymmetric Hermite range, midpoint centering, and chaos-wise $\|U_{\mathbb{R}}\|_4$ bound

*The following inequalities hold and are verified algebraically via exact integer Sturm chains in `verify_ou_envelopes_and_table()`:*
1. **$-\frac{371}{200} \le h_4(w) \le 3$ for all $w \ge 0$, hence $\big|h_4(w) - \frac{23}{40}\big| \le \frac{243}{100} = 2.43$:**
   *For $w \ge 0$, $e^{w/2} \ge 1 + \frac{w}{2} + \frac{w^2}{8} + \frac{w^3}{48}$, and $3(1 + \frac{w}{2} + \frac{w^2}{8} + \frac{w^3}{48}) - (w^2 - 6w + 3) = \frac{w}{16}((w - 5)^2 + 95) \ge 0$, proving $h_4(w) \le 3$. For the lower bound, $w^2 - 6w + 3 \ge 3 > 0$ for all $w \ge 6$, while on $[0, 6]$, $e^{w/2} \ge \sum_{j=0}^8 \frac{(w/2)^j}{j!} =: E_8(w)$ and exact integer Sturm evaluation proves $(w^2 - 6w + 3) + \frac{371}{200}E_8(w) > 0$ on $[0, 6]$. Subtracting the midpoint $m_0 := \frac{3 - 371/200}{2} = \frac{23}{40}$ gives $|h_4(w) - \frac{23}{40}| \le 3 - \frac{23}{40} = \frac{23}{40} + \frac{371}{200} = \frac{243}{100}$ (`2.47x` tighter than $|h_4 - 3| \le 6$).*
2. **Square-root envelope $\big|h_4(w) - 3\big| \le \frac{17}{4}\sqrt{w}$ for all $w \ge 0$:**
   *Since $h_4(w) \le 3$, we need $3 - h_4(t^2) \le \frac{17}{4}t$ ($t = \sqrt{w} \ge 0$). For $t \ge \frac{24}{17}$, $3 - h_4(t^2) \le \frac{971}{200} < 6 \le \frac{17}{4}t$. On $[0, \frac{12}{17}]$, $\frac{17}{4}t - 3 \le 0$ and $\frac{t^2}{2} \in [0, 1]$, so $e^{t^2/2} \le \sum_{j=0}^4 \frac{(t^2/2)^j}{j!} + \frac{(t^2/2)^5}{60} =: E_{\mathrm{ub}}(t)$, and $(\frac{17}{4}t - 3)E_{\mathrm{ub}}(t) + (t^4 - 6t^2 + 3) = t\,Q_L(t)$ with $Q_L > 0$ on $[0, \frac{12}{17}]$ by Sturm. On $[\frac{12}{17}, \frac{24}{17}]$, $\frac{17}{4}t - 3 \ge 0$, $e^{t^2/2} \ge \sum_{j=0}^6 \frac{(t^2/2)^j}{j!} =: E_{\mathrm{lb}}(t)$, and $(\frac{17}{4}t - 3)E_{\mathrm{lb}}(t) + (t^4 - 6t^2 + 3) > 0$ on $[\frac{12}{17}, \frac{24}{17}]$ by Sturm.*
3. **Chaos-wise fourth-norm bound $\|U_{\mathbb{R}}\|_4 \le A\,L_{U,4}(y)$ on $y = \|U_4\|_2 / \|U_2\|_2 \in [0, \frac{7}{8}]$:**
   *Put $A = \|U_2\|_2$, $C = \|U_4\|_2$, $y = C/A \in [0, \sqrt{3/4}] \subset [0, \frac{7}{8}]$ (`KCR` §3: $\kappa_4(F) = A^2(\frac{1}{2} + y^2)$ and $\mathbb{E}[F^2] = 1 \implies A^2 \ge 0, y^2 \le \frac{3}{4}$). Since $U_{\mathbb{R}}^2 = U_2^2 + 2U_2 U_4 + U_4^2 = \sum_{l \in \{0,2,4,6,8\}}\Pi_l(U_{\mathbb{R}}^2)$ is an orthogonal Wiener-chaos sum and $\|\Pi_l(U_j U_k)\|_2 \le c_{j,k,l}\|U_j\|_2\|U_k\|_2$,*
   $$\|U_{\mathbb{R}}\|_4^4 = \mathbb{E}[U_{\mathbb{R}}^4] = \sum_{l \in \{0,2,4,6,8\}}\|\Pi_l(U_{\mathbb{R}}^2)\|_2^2 \le A^4\sum_{l \in \{0,2,4,6,8\}}\big(\bar c_{2,2,l} + 2\bar c_{2,4,l}\,y + \bar c_{4,4,l}\,y^2\big)^2 =: A^4 Q_{U,4}(y).$$
   *Exact integer Sturm evaluation certifies $L_{U,4}(y)^4 - Q_{U,4}(y) > 0$ on $[0, \frac{7}{8}]$ for $L_{U,4}(y) := \frac{197}{100} + \frac{183}{50}y + \frac{93}{100}y^2$, hence $\||F|\,U_{\mathbb{R}}\|_2 \le \|F\|_4\|U_{\mathbb{R}}\|_4 \le (3 + \frac{3}{2}\chi)^{1/4} A\,L_{U,4}(y)$ by Cauchy–Schwarz.*

### Lemma 3.2 — Deterministic centering at $V_L \equiv 1$ and exact rational $\theta = u^6$ kernel integration

*Fix a slab $s \in [s_a, s_b] \subset (0, \infty)$ and $\theta \in [\theta_a, \theta_b] \subset [0, 1]$. Because $A_s = 1 + s$ and $B_{s,\theta} = 1 + s(1 - \theta)$ are deterministic scalars (independent of $F$), put $c(s, \theta) := 3(B_{s,\theta}/A_s)^{5/2} \in (0, 3]$, which is strictly decreasing in $s$ and in $\theta$:*
1. **For $l \in \{0, 6, 8\}$:** *Since $U_{\mathbb{R}} \in \mathcal{H}_2 \oplus \mathcal{H}_4 \perp \mathcal{H}_l$, $\mathbb{E}_F[\gamma\,U_{\mathbb{R}}\,\Pi_l(U_{\mathbb{R}} U_k)] = 0$ for **every** deterministic scalar $\gamma$, in particular for $\gamma = \frac{23}{40}B_{s,\theta}^{-5/2} - 3A_s^{-5/2}$ and for $\gamma = 3(B_{s,\theta}^{-5/2} - A_s^{-5/2})$! Hence*
   $$\Big|\mathbb{E}_F\Big[\big(B_{s,\theta}^{-5/2}h_4(w) - 3A_s^{-5/2}\big)U_{\mathbb{R}}\Pi_l(U_{\mathbb{R}} U_k)\Big]\Big| \le \min\!\left\{\frac{243}{100}B_{s,\theta}^{-5/2}\|U_{\mathbb{R}}\|_2,\; \frac{17}{4}\sqrt{s\theta}\,B_{s,\theta}^{-3}\||F|U_{\mathbb{R}}\|_2\right\}\|\Pi_l(U_{\mathbb{R}} U_k)\|_2.$$
2. **For $l \in \{2, 4\}$:** *Writing $B_{s,\theta}^{-5/2}h_4(w) - 3A_s^{-5/2}$ in three algebraically identical ways—(i) $(h_4(w) - \frac{23}{40})B_{s,\theta}^{-5/2} + B_{s,\theta}^{-5/2}(\frac{23}{40} - c(s,\theta))$, (ii) $B_{s,\theta}^{-5/2}(h_4(w) - c(s,\theta))$, and (iii) $(h_4(w) - 3)B_{s,\theta}^{-5/2} + 3(B_{s,\theta}^{-5/2} - A_s^{-5/2})$ with $0 \le 3(B_{s,\theta}^{-5/2} - A_s^{-5/2}) \le \min\{B_{s,\theta}^{-5/2}(3 - c(s,\theta)), \frac{15}{2}s\theta B_{s,\theta}^{-7/2}\}$—and using $|\mathbb{E}_F[U_{\mathbb{R}}\Pi_l(U_{\mathbb{R}} U_k)]| \le \|U_l\|_2\|\Pi_l(U_{\mathbb{R}} U_k)\|_2$ gives three valid cell upper bounds in `certify_ou_slab`, taking the tightest on each $\theta$-cell.*
3. **Exact $\theta = u^6$ antiderivatives:** *Substituting $\theta = u^6$ ($d\theta = 6u^5\,du$, $u \in [0, 1]$) converts $W_{k/3, l/3}(u^6)\,u^{12 + 6r}\,(6u^5\,du)$ for $r \in \{0, \frac{1}{2}, 1\}$ into exact rational Laurent combinations $\frac{6}{d}\big(\frac{u^{5+6r-l} - u^{17+6r}}{\beta+4} - \frac{u^{11+6r-k} - u^{17+6r}}{\alpha+2}\big)du$, whose antiderivatives on rational $u$-knots $u_m \in \mathbb{Q}$ are pure rationals (plus $2\operatorname{artanh}(\frac{u_b-u_a}{u_b+u_a})$ at $r = 0, l = 6$ for $u_a > 0$, bounded above via its positive power series and cross-checked against monotone Riemann sandwiches inside `build_ou_theta_table()`).*

Summing over $(k, l)$ yields a degree-5 polynomial $P_{\mathrm{OU}}(y) \in \mathbb{Q}[y]$ such that $|R_2(s, q)| \le r_{\mathrm{cap}}\,s^3\chi^{3/2}$ whenever $(54 r_{\mathrm{cap}})^2(\frac{1}{2} + y^2)^3 - \frac{27}{8}(\sqrt{\pi}_{\mathrm{hi}}P_{\mathrm{OU}}(y))^2 > 0$ on $y \in [0, \frac{7}{8}]$, verified by exact integer Sturm sequences. Across all 13 contiguous slabs covering $[\frac{1}{6}, \frac{5}{8}]$, `certify_ou_slab` certifies strict positivity of $R_0\sqrt{1+s} - \mathbb{E}|Z + \sqrt{s}\,q|$ for all $0 < \chi \le \chi_{\mathrm{OU}}(s)$ with $\chi_{\mathrm{OU}}(s) \ge \frac{11}{2000} = 0.0055$ on every slab (`0.0375` at $[\frac{1}{6}, \frac{5}{24}]$, `0.0100` at $[\frac{3}{8}, \frac{5}{12}]$, `0.0055` at $[\frac{39}{64}, \frac{5}{8}]$).

---

## 4. Regime C: Complete-monotonicity Rice cap bank and pure-$v$ Level-2 Matrix Stein

### 4.1 Positive-term Bessel enclosures and complete-monotonicity Hermite cubic caps

Differentiating `(1)` using $I_0'(z) = I_1(z)$ and $I_1'(z) = I_0(z) - \frac{1}{z}I_1(z)$ gives
$$\frac{d}{dx}\Big(e^{-x/2}\big[(1 + x)I_0(\tfrac{x}{2}) + x I_1(\tfrac{x}{2})\big]\Big) = \frac{1}{2}e^{-x/2}\Big[I_0\!\left(\tfrac{x}{2}\right) + I_1\!\left(\tfrac{x}{2}\right)\Big] > 0 \implies \rho'(x) = \frac{R_0}{2}e^{-x/2}\Big[I_0\!\left(\tfrac{x}{2}\right) + I_1\!\left(\tfrac{x}{2}\right)\Big] > 0. \tag{7}$$
Because $I_0(z) = \sum_{k=0}^\infty \frac{(z/2)^{2k}}{(k!)^2}$, $I_1(z) = \frac{z}{2}\sum_{k=0}^\infty \frac{(z/2)^{2k}}{k!(k+1)!}$, and $e^{z} = \sum_{k=0}^\infty \frac{z^k}{k!}$ have **strictly positive terms** for all $z = \frac{x}{2} > 0$, `rice_val_and_deriv_bounds` encloses both $\rho(x)$ and $\rho'(x)$ on $x \in [0, 64]$ to $2^{-100}$ precision with **zero alternating cancellation**.

Next, substituting $I_0(z) = \frac{1}{\pi}\int_0^\pi e^{z\cos\theta}\,d\theta$, $I_1(z) = \frac{1}{\pi}\int_0^\pi \cos\theta\,e^{z\cos\theta}\,d\theta$, and $T := \frac{1 - \cos\theta}{2} \in [0, 1]$ ($dT = \sqrt{T(1-T)}\,d\theta$, $1 + \cos\theta = 2(1-T)$) into `(7)` gives the completely monotone Laplace-transform representation
$$\rho'(x) = \frac{R_0}{2\pi}\int_0^\pi (1 + \cos\theta)\,e^{-\frac{x}{2}(1 - \cos\theta)}\,d\theta = \frac{R_0}{2}\int_0^1 \frac{2}{\pi}T^{-1/2}(1 - T)^{1/2}\,e^{-xT}\,dT = \frac{R_0}{2}\,\mathbb{E}_{T \sim \mathrm{Beta}(1/2, 3/2)}\!\big[e^{-xT}\big],$$
and differentiating three times under the bounded $[0, 1]$-integral gives
$$\rho''(x) = -\frac{R_0}{2}\mathbb{E}_T\!\big[T\,e^{-xT}\big] < 0, \qquad \rho^{(4)}(x) = -\frac{R_0}{2}\mathbb{E}_T\!\big[T^3\,e^{-xT}\big] < 0 \qquad \forall\, x \ge 0. \tag{8}$$
Let $[a, b] \subset [0, 64]$ ($h = b - a > 0$) and let $H_{[a,b]}(x)$ be the exact cubic Hermite interpolant of $\rho$ at $\{a, b\}$. By Peano's Hermite error formula, for every $x \in [a, b]$ there exists $\xi \in (a, b)$ such that
$$\rho(x) - H_{[a,b]}(x) = \frac{\rho^{(4)}(\xi)}{24}(x - a)^2(x - b)^2 \le 0 \implies \rho(x) \le H_{[a,b]}(x) \quad \forall\, x \in [a, b].$$
Writing $t = \frac{x - a}{h} \in [0, 1]$, the four Hermite basis functions satisfy
$$h_{00}(t) = (1-t)^2(1+2t) \ge 0, \quad h_{01}(t) = t^2(3-2t) \ge 0, \quad h_{10}(t) = t(1-t)^2 \ge 0, \quad h_{11}(t) = -t^2(1-t) \le 0.$$
Replacing $(\rho(a), \rho(b), \rho'(a), \rho'(b))$ by $(\rho_{\mathrm{hi}}(a), \rho_{\mathrm{hi}}(b), \rho'_{\mathrm{hi}}(a), \rho'_{\mathrm{lo}}(b))$ therefore increases every basis term pointwise on $[a, b]$, and expanding in powers of $x \ge 0$ with each coefficient $c_j$ rounded **upward** to $10^{-16}$ (`build_rice_cap_bank`) yields 136 rational cubics $C_m(x) \ge \rho(x)$ on $[0, 64]$. On $[64, \infty)$, Cauchy–Schwarz gives the sublinear upper bound
$$\rho(x) = \mathbb{E}|Z + \sqrt{x}| \le \sqrt{\mathbb{E}|Z + \sqrt{x}|^2} = \sqrt{1 + x} < \sqrt{x} + \frac{1}{16} \qquad \forall\, x \ge 64,$$
since $(\sqrt{x} + \frac{1}{16})^2 = x + \frac{\sqrt{x}}{8} + \frac{1}{256} \ge x + 1 + \frac{1}{256} > 1 + x$ whenever $x \ge 64$.

### 4.2 Whole-half-line Sturm verification of Level-2 Matrix Stein models

Let $C_{\mathrm{Rice}}(x) \ge \rho(x)$ denote the piecewise upper cap on $[0, \infty)$ constructed in §4.1. At any fixed node $s_0 > 0$, we apply the reviewed Level-2 complex Matrix Stein framework of `STATUS.md` `6.3.20` (`#512`; see also `cubic-radius-ou-l3-gemini-4c4c/PROOF.md` §3, `PR #725`), allowing an optional nonnegative linear radial slope $\mathrm{sl}_{\xi_2}\,v$ ($\mathrm{sl}_{\xi_2} \ge 0$) in $\xi_2(v) = \xi_{2,\mathrm{hat}}(v) + \mathrm{sl}_{\xi_2}\,v$, which preserves $\xi_2(v) \ge 0$ and $4\xi_1(v)\xi_2(v) \ge 4\xi_1(v)\xi_{2,\mathrm{hat}}(v) \ge \xi_a(v)^2$ pointwise for all $v \ge 0$. On the common refinement of the model's rational $u$-knots $0 = u_0 < \dots < u_K$ and the scaled cap breakpoints $\{a_m / s_0\}$:
- On $[0, v_1]$, $G_i(v)$ and $v Y_i(v) = v p_i(v) - G_i(v)$ are divisible by $v$ (`div_xk(..., 1)`), so $D_2(v), D_3(v), D_4(v) \in \mathbb{Q}[v]$ are exact polynomials in $v$ of degree $\le 9$;
- On every $[v_a, v_b] \subset (0, 64/s_0]$, $D_2(v), v^2 D_3(v), v^3 D_4(v) \in \mathbb{Q}[v]$ are exact polynomials in $v$ of degree $\le 11$;
- On $[v_a, v_b] \subset [64/s_0, \infty)$ (where $\rho(s_0 r^2) < \sqrt{s_0}_{\mathrm{hi}}\,r + \frac{1}{16}$ in $r = \sqrt{v}$), substituting $v = r^2$ makes $r^6 D_4(r^2) \in \mathbb{Q}[r]$ an exact polynomial in $r$ certified on $[\sqrt{v_a}_{\mathrm{lo}}, \sqrt{v_b}_{\mathrm{hi}}]$ (or $[\sqrt{v_a}_{\mathrm{lo}}, \infty)$ on the unbounded tail).

`verify_l2_model_halfline` checks strict positivity of $M_{11}(u_k), D_2(v), D_3(v), D_4(v)$ on every segment covering $[0, \infty)$ via primitive integer Sturm chains (`positive_on`), checks the $C^*$ radial cone and $M_{33}$ inequalities at every knot, and combines the resulting moment functional with the reviewed 5-scalar `(n, h, b, y, z)` Gram LP dual (`eval_model_on_chi_interval`, pricing $\mathbb{E}[|q|^6]$ via nonnegative weights $(l_{3,0}, l_{3,1}, l_{3,2})$ across `3.4` and the two `6.3.20` fourth-moment bridges, which is convex in $\chi$ on $[\chi_{\mathrm{lo}}, \chi_{\mathrm{hi}}]$ and therefore maximized at $\{\chi_{\mathrm{lo}}, \chi_{\mathrm{hi}}\}$).

### 4.3 Curvature-compensated $s$-chord interpolation across 2D tiles

Fix a unit-variance $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ with excess $\chi \in [\chi_{\mathrm{lo}}, \chi_{\mathrm{hi}}]$, and put $F_q(s) := \mathbb{E}[\rho(s U)]$ and $\Delta_q(s) := R_0\sqrt{1 + s} - F_q(s)$ on $[s_a, s_b] \subset [\frac{1}{6}, \frac{5}{8}]$. By `(8)`, for every $\xi \in [s_a, s_b]$, $-F_q''(\xi) = -\mathbb{E}[U^2\rho''(\xi U)] = \frac{R_0}{2}\mathbb{E}_{U,T}[U^2 T e^{-\xi U T}] \ge 0$ satisfies three simultaneous elementary upper bounds:
1. **$L^2$ bound:** Since $e^{-\xi U T} \le 1$ and $\mathbb{E}[T] = \frac{1}{4}$, $\frac{1}{2}\mathbb{E}[U^2 T e^{-\xi U T}] \le \frac{2 + \chi_{\mathrm{hi}}}{8}$.
2. **$L^{3/2}$ bound:** Since $e = \sum_{k=0}^\infty \frac{1}{k!} > \sum_{k=0}^5 \frac{1}{k!} = \frac{163}{60}$, convexity $e^{w-1} \ge w$ gives $w e^{-w} \le \frac{1}{e} < \frac{60}{163}$ for all $w \ge 0$, and setting $w = 2z$ gives $\sqrt{z}\,e^{-z} \le \frac{1}{\sqrt{2e}} < \sqrt{\frac{30}{163}} < \frac{43}{100}$ for all $z \ge 0$. Writing $U^2 T e^{-\xi U T} = \frac{U^{3/2}\sqrt{T}}{\sqrt{\xi}}(\sqrt{\xi U T}\,e^{-\xi U T}) \le \frac{43}{100\sqrt{s_a}}U^{3/2}\sqrt{T}$ and using $\mathbb{E}[\sqrt{T}] = \frac{2}{\pi}\int_0^1 (1-T)^{1/2}\,dT = \frac{4}{3\pi}$ and $\mathbb{E}[U^{3/2}] \le \sqrt{\mathbb{E}[U]\mathbb{E}[U^2]} \le \sqrt{2 + \chi_{\mathrm{hi}}}$ yields $\frac{1}{2}\mathbb{E}[U^2 T e^{-\xi U T}] \le \frac{43}{150\pi_{\mathrm{lo}}}\sqrt{\frac{2 + \chi_{\mathrm{hi}}}{s_a}}$.
3. **$L^1$ ($\chi$-independent) bound:** Writing $U^2 T e^{-\xi U T} = \frac{U}{\xi}(\xi U T e^{-\xi U T}) \le \frac{60}{163 s_a}U$ and $\mathbb{E}[U] = 1$ yields $\frac{1}{2}\mathbb{E}[U^2 T e^{-\xi U T}] \le \frac{30}{163 s_a}$.

Combining these with $\frac{d^2}{d\xi^2}(R_0\sqrt{1+\xi}) = -\frac{R_0}{4}(1+\xi)^{-3/2} \le -\frac{R_0}{4}(1+s_b)^{-3/2}$ gives, for all $\xi \in [s_a, s_b]$,
$$\Delta_q''(\xi) \le K_{\mathrm{hi}} := \max\!\left\{R_{0,\mathrm{hi}}\min\!\left\{\frac{2 + \chi_{\mathrm{hi}}}{8},\; \frac{43}{150\pi_{\mathrm{lo}}}\sqrt{\frac{2 + \chi_{\mathrm{hi}}}{s_a}}_{\mathrm{hi}},\; \frac{30}{163 s_a}\right\} - \frac{R_{0,\mathrm{lo}}}{4(1+s_b)\sqrt{1+s_b}_{\mathrm{hi}}},\; 0\right\}. \tag{9}$$
For any twice-differentiable function $\Delta_q$ on $[s_a, s_b]$ with $\Delta_q''(\xi) \le K_{\mathrm{hi}}$, standard linear-interpolation error gives, for every $s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}] \subset [s_a, s_b]$:
$$\Delta_q(s) \ge \frac{(s_b - s)\Delta_q(s_a) + (s - s_a)\Delta_q(s_b)}{s_b - s_a} - \frac{K_{\mathrm{hi}}}{2}(s - s_a)(s_b - s) \ge \min_{s_e \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\}}\frac{(s_b - s_e)d_a + (s_e - s_a)d_b}{s_b - s_a} - \frac{K_{\mathrm{hi}}}{2}(z_* - s_a)(s_b - z_*), \tag{10}$$
where $d_a, d_b$ are the certified endpoint lower bounds on $\Delta_q(s_a), \Delta_q(s_b)$ across $\chi \in [\chi_{\mathrm{lo}}, \chi_{\mathrm{hi}}]$ and $z_* = \min(s_{\mathrm{hi}}, \max(s_{\mathrm{lo}}, \frac{s_a + s_b}{2}))$ maximizes $(s - s_a)(s_b - s) \ge 0$ on $[s_{\mathrm{lo}}, s_{\mathrm{hi}}]$. An independent strip sweep in `verify_certificate` checks that the 13 OU slabs and the certified 2D Stein tiles cover $[\frac{1}{6}, \frac{5}{8}] \times [0, 42]$ with **zero gap**. Combined with Regime A (§2) on $[0, \frac{1}{6}] \times [0, 42]$ and `STATUS.md` `6.3.32` ($\chi > 0$ for every nonzero finite-dimensional $q$), Theorem 1 follows. $\square$

---

## 5. Exact remote-energy frontier and continuum closure of `#628` `ATK P3` §5

### 5.1 Proof of Corollary 1a

Let $q_{\mathrm{rem}} = P_{2,1}^{\mathrm{rem}} k$ have norm $\sigma_q := \|q_{\mathrm{rem}}\|_2$. If $\sigma_q = 0$, `(3)` holds trivially since $t \le R_0 \implies \frac{\pi}{4} - t^2 \ge 0$. If $\sigma_q > 0$, write $q_{\mathrm{rem}} = \sigma_q \hat q$ ($\|\hat q\|_2 = 1$). For any $\lambda \ge 0$ with $s := \lambda^2\sigma_q^2 \le \frac{5}{8}$, the response inequality (`2.12g`) and Theorem 1 give
$$t + \lambda\sigma_q^2 \le \mathbb{E}\big|z_1 + \lambda q_{\mathrm{rem}}\big| = \mathbb{E}\big|z_1 + \sqrt{s}\,\hat q\big| \le R_0\sqrt{1 + \lambda^2\sigma_q^2}. \tag{11}$$
Put $s_{\max} = \frac{5}{8}$ and suppose $t \ge \frac{R_0}{\sqrt{1 + s_{\max}}} = \sqrt{\frac{\pi/4}{13/8}} = \sqrt{\frac{2\pi}{13}}$. Evaluate `(11)` at $\lambda_* := \frac{\sqrt{R_0^2 - t^2}}{\sigma_q\,t} \ge 0$: then
$$s = \lambda_*^2\sigma_q^2 = \frac{R_0^2 - t^2}{t^2} = \frac{R_0^2}{t^2} - 1 \le (1 + s_{\max}) - 1 = \frac{5}{8},$$
so Theorem 1 applies at $\lambda_*$, yielding
$$t + \frac{\sqrt{R_0^2 - t^2}}{t}\,\sigma_q \le R_0\sqrt{1 + \frac{R_0^2 - t^2}{t^2}} = \frac{R_0^2}{t} \implies \frac{\sqrt{R_0^2 - t^2}}{t}\,\sigma_q \le \frac{R_0^2 - t^2}{t}.$$
For $t = R_0$, evaluating `(11)` at $\lambda \downarrow 0$ (or taking $s = \lambda^2\sigma_q^2 \le \frac{5}{8}$ with $\lambda > 0$: $R_0 + \lambda\sigma_q^2 \le R_0\sqrt{1 + \lambda^2\sigma_q^2} < R_0(1 + \frac{1}{2}\lambda^2\sigma_q^2) \implies \sigma_q = 0$ on letting $\lambda \downarrow 0$) gives $\sigma_q^2 = 0 = \frac{\pi}{4} - R_0^2$; for $\sqrt{2\pi/13} \le t < R_0$, dividing by $\frac{\sqrt{R_0^2 - t^2}}{t} > 0$ gives $\sigma_q \le \sqrt{R_0^2 - t^2}$, i.e., $\sigma_q^2 \le \frac{\pi}{4} - t^2$. Finally, `verify_certificate` checks $2\pi_{\mathrm{hi}} < 13\cdot(\frac{139043}{200000})^2$, proving $\sqrt{2\pi/13} < \frac{139043}{200000} = 0.695215 < \frac{7}{10} < \frac{751}{1000}$. $\square$

### 5.2 Proof of Theorem 2 (`#628` `ATK P3` §5 continuum closure on $[0, \frac{61}{100}]$)

1. **Certified buffered Rice constants $R_{\mathrm{buf}}(s_j)$:** At each $s_j \in \{1, \frac{17}{16}, \frac{5}{4}, \frac{3}{2}, 2, 3, \frac{9}{2}\}$, `verify_certificate` checks:
   - On $\chi \in [0, \chi_{\mathrm{OU}}(s_j)]$, `certify_ou_slab(s_j, s_j, \chi_{\mathrm{OU}}(s_j))` proves $\mathbb{E}|Z + \sqrt{s_j}\,\hat q| \le R_0\sqrt{1 + s_j} \le R_{\mathrm{buf}}(s_j)$;
   - On $\chi \in [\chi_{\mathrm{OU}}(s_j), 42]$, contiguous Stein strips with verified half-line models at $s_0 = s_j$ satisfy $\mathrm{ub}_{\mathrm{Stein}} < R_{\mathrm{buf}}(s_j)$.
2. **Quadratic response cap on $\|P_{2,1} k\|_2^2$:** For any fixed $s > 0$ with $\mathbb{E}|Z + \sqrt{s}\,\hat q| \le R_{\mathrm{buf}}(s)$ and any $t < R_{\mathrm{buf}}(s)$, if $\sigma_q = \|P_{2,1} k\|_2 > 0$, choosing $\lambda = \frac{\sqrt{s}}{\sigma_q} > 0$ in $t + \lambda\sigma_q^2 \le \mathbb{E}|z_1 + \lambda P_{2,1} k|$ gives
   $$t + \sqrt{s}\,\sigma_q \le \mathbb{E}\big|z_1 + \sqrt{s}\,\hat q\big| \le R_{\mathrm{buf}}(s) \implies \sigma_q^2 \le \frac{\big(R_{\mathrm{buf}}(s) - t\big)^2}{s}$$
   (which also holds trivially when $\sigma_q = 0$). Substituting into `(4)` (`#628` `ATK P3` Eq. `(2)`, proved in 2 lines from `V = t^2 - \varepsilon\|P_{2,1}h\|_2^2 + \eta\|P_{3,2}h\|_2^2 - \|P_{1,0}k\|_2^2 + \varepsilon\|P_{2,1}k\|_2^2 - \eta\|P_{3,2}k\|_2^2` and $\|P_{3,2}h\|_2^2 \le \|h\|_2^2 - t^2 = 1 - \|k\|_2^2 - t^2 \le 1 - \sigma_q^2 - t^2$) gives, on any interval $[t_a, t_b] \subset [0, R_{\mathrm{buf}}(s))$,
   $$V(f, g) \le P_s(t) := (1 - \eta)t^2 + \eta + \frac{\varepsilon - \eta}{s}\big(R_{\mathrm{buf}}(s) - t\big)^2.$$
   Since $1 - \eta = \frac{9221}{10000} > 0$ and $\frac{\varepsilon - \eta}{s} = \frac{7021}{10000 s} > 0$, **$P_s''(t) = 2(1 - \eta) + \frac{2(\varepsilon - \eta)}{s} > 0$**: $P_s(t)$ is a **strictly convex quadratic** in $t$, so $\max_{t \in [t_a, t_b]} P_s(t) = \max\{P_s(t_a), P_s(t_b)\}$!
3. **Continuum partition of $[0, \frac{61}{100}]$:**
   - On $[0, \frac{1}{5}]$, the reviewed unbuffered global radius $\rho_* \le \frac{2287}{2500}$ (`3.7`) gives $V(f, g) \le (1 - \eta)(\frac{1}{5})^2 + \eta + (\varepsilon - \eta)(\frac{2287}{2500})^2 < 0.7021 < \frac{500}{701} = 0.7132667\dots$;
   - On $[\frac{1}{5}, \frac{61}{100}]$, contiguous segments using $s \in \{\frac{9}{2}, 3, 2, \frac{3}{2}, \frac{5}{4}, \frac{17}{16}, 1, \frac{5}{8}\}$ satisfy $\max\{P_s(t_a), P_s(t_b)\} < \frac{500}{701}$ with minimum reserve $> 9 \cdot 10^{-4}$ across the entire continuum $[0, \frac{61}{100}]$.
4. **Gaussian barrier proof at $t = \frac{618}{1000}$:** Along $f_N = \operatorname{ph}(z_1 + c q_N), g_N = \operatorname{ph}(z_1 - c q_N)$ with $q_N = \frac{1}{\sqrt{N}}\sum_{j=1}^N e_{2,1}(y_j) \Rightarrow W \sim \mathcal{CN}(0, 1)$, bounded convergence of $\bar z_1 \operatorname{ph}(z_1 + c q_N)$ and $\bar q_N \operatorname{ph}(z_1 + c q_N)$ (uniformly integrable since $\mathbb{E}|q_N|^4 = 2 + \frac{42}{N} \le 44$) yields $\lim_{N\to\infty} t_N = t(c) = \frac{R_0}{\sqrt{1+c^2}}$ and $\lim_{N\to\infty}\|P_{2,1} k_N\|_2^2 = |\langle W, \operatorname{ph}(z_1 + c W)\rangle|^2 = \frac{\pi}{4} - t(c)^2$. At $t = \frac{618}{1000}$, `verify_certificate` checks $\frac{\pi_{\mathrm{lo}}}{4} - (\frac{618}{1000})^2 > \frac{(500/701 - \eta) - (1 - \eta)(618/1000)^2}{\varepsilon - \eta}$, proving `(4)` strictly exceeds $\frac{500}{701}$ at $t = 0.618$. $\square$

---

## 6. Verification, negative controls, and explicit scope boundaries

### 6.1 Exact replay

```sh
python3 -IB research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/verify.py
python3 -IB -O research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/verify.py --quiet
python3 -IB research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/test_controls.py
python3 -IB -O research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/test_controls.py
```

`test_controls.py` runs an AST self-audit rejecting any `float`/`complex` literal or call and any `assert` statement across both Python files, executes 14 independent corruption controls (including a direct strip-sweep gap test, half-line positivity failure, negative LP cut multiplier, unused `par` detection, false frontier threshold below $\sqrt{2\pi/13}$, false Gaussian mid-$t$ cap, and breaching the $0.6177$ Gaussian barrier), verifies the mandatory `#628` `ATK P3` §6 rejection of false cap `0.62` at `t = 0.30` (both in the certificate checker and via explicit driver witness $c = \frac{11}{4}$ giving $t \approx 0.3029, V > 0.6323 > 0.62$), and checks all seven benchmark columns of `#628` `ATK P3` §3 item 4 in exact rational arithmetic via the orthogonal Gaussian rotation $U_c = \frac{z_1 + cW}{\sqrt{1+c^2}}, V_c = \frac{cz_1 - W}{\sqrt{1+c^2}}$.

### 6.2 Explicit scope boundaries

- **Theorem 1 and Corollary 1a** hold **unconditionally** in all dimensions $n \ge 1$ for arbitrary remote $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$.
- **Theorem 2 (`#628` `ATK P3` §5)** covers all unimodular pairs on $t \in [0, \frac{61}{100}]$ whose cubic projection $P_{2,1} k$ is **remote** ($P_{2,1} k \in \mathcal{H}_{2,1}(z_2, \dots, z_n)$, the class analyzed in `#628` `ATK P3` §5 Eq. `(3)` where Jensen previously failed across all of `[0.25, 0.65]`). Bounding pairs with mixed visible-and-remote cubic components on $[\frac{940}{2500}, \frac{61}{100}]$ (`0.376` to `0.610`) and closing $[\frac{61}{100}, \frac{13}{20}]$ (above the `0.6177` Gaussian barrier of `(4)`, which requires retaining $-\|P_{1,0}k\|_2^2 - \eta\|P_{3,2}k\|_2^2$) remain **open**; the global complex Grothendieck constant lower bound $> 1.403$ likewise remains **open** pending downstream multi-row degree-3 (`8.13`) and degree-5 (`#751`) assembly.
