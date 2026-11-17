<!-- Original research note by gemini-5331, 17 November 2026; Refs #513, #509, #177. -->
# Universal $O(\delta^{3/2})$ raw content bounds, closure of the near-Gaussian raw A-core (`6.1.5`), peak deficit positivity, and bounded-kurtosis regimes

Agent-ID: `gemini-5331`. Baseline: `25d56fcbb`. Issues: `#513` (part of `#509`, `#177`).

**Status: `P, author only` for the new analytic proofs and implications below; `C, author only` for the exact rational, 220-bit outward dyadic interval, and Bernstein verifications in `code/raw-content-2026-11-17-gemini-5331/verify_raw_content.py`, pending independent external review.** Candidate SOCP dual generation in `generate_stein_duals.py` is **`N`** only and never enters acceptance. No Lean theorem or new unconditional Grothendieck constant endpoint is claimed here.

---

## 1. Summary of results and scope

Let $Z$ be a standard proper complex Gaussian, $T = |Z|^2$, $a > 0$, $b \ge 0$, and $L = Z(a + b T)$. Let $q \in H_{2,1}(\mathbb{C}^n)$ be any genuine remote complex Wick cubic in $n \ge 1$ standard proper complex Gaussian variables independent of $Z$, with energy $u = \mathbb{E}|q|^2$, fourth-moment excess $\delta = \mathbb{E}|q|^4 - 2u^2 \ge 0$, and normalized excess kurtosis $\chi = \delta / u^2 \in [0, 42]$ (when $u > 0$). Define the raw $A$- and $B$-sector response maps and first-chaos contents:
$$\Phi_A(y) = \mathbb{E}_Z\big[(T - 1)\operatorname{ph}(L + y)\big] = y \, g_A(|y|^2), \qquad \Phi_B(y) = \mathbb{E}_Z\!\left[\frac{Z^2}{\sqrt{2}} \overline{\operatorname{ph}(L + y)}\right] = y \, g_B(|y|^2),$$
$$c_A(q) = \Pi_{1,0}\Phi_A(q), \quad C_A(q) = \|c_A(q)\|_2, \qquad c_B(q) = \Pi_{1,0}\Phi_B(q), \quad C_B(q) = \|c_B(q)\|_2.$$
At the peak profile $(a, b) = (\frac{699}{1250}, \frac{179}{1250})$ with price $p = \frac{2500}{1891}$, write $V(s) = 2\mathbb{E}_Z|L + \sqrt{s}|$, $B(u) = 2\mathbb{E}_{Z,W}|L + \sqrt{u}W|$, $S = \sup_{\sigma \ge 0}(B(\sigma^2) - p\sigma^2)$, $\Lambda(G) = \mathbb{E}|L + G| + \mathbb{E}|L - G| - p\|G\|_2^2$, and $D(q) = B(u) - 2\mathbb{E}|L + q|$.

This note establishes five main theorems, valid in **every finite ambient dimension $n \ge 1$** and for **arbitrary driver sharing**:

1. **Theorem 1 (Exact scalar third-derivative supremum and universal $O(\delta^{3/2})$ raw content bounds):**
   For **every** $a > 0, b \ge 0$, the 1D scalar responses $m_A(x) = \mathbb{E}_Z[(T - 1)\operatorname{sign}(\operatorname{Re} L + x)]$ and $m_B(x) = \mathbb{E}_Z[(Z^2/\sqrt{2})\operatorname{sign}(\operatorname{Re} L + x)]$ satisfy the exact Gaussian-atom Laplace representations
   $$m_A(x) = -\frac{1}{\sqrt{\pi}} \int_0^\infty \lambda^{-1/2} x e^{-\lambda x^2}\,\mu_A(d\lambda), \qquad m_B(x) = -\frac{1}{\sqrt{2\pi}} \int_0^\infty \lambda^{-3/2} x e^{-\lambda x^2}\,\mu_B(d\lambda),$$
   with positive Borel measures $\mu_A, \mu_B \ge 0$, and attain their global third-derivative suprema **uniquely at $x = 0$**:
   $$\|m_A'''\|_\infty = m_A'''(0) = \frac{32}{\pi} g_A'(0), \qquad \|m_B'''\|_\infty = m_B'''(0) = \frac{32}{\pi} g_B'(0), \qquad \|(m_A - \sqrt{2}m_B)'''\|_\infty = \frac{32}{\pi}\big(g_A'(0) - \sqrt{2}g_B'(0)\big).$$
   Combining this with the 1D Ornstein–Uhlenbeck resolvent bound on real third chaos (`content_tensor_next.md` §§1–2; `STATUS.md` `11.30`) and circular angular conversion (`C7E2R2` `remote/RAW_CONTENT_BOUND.md` §§1–2), reproduced self-containedly in §§3.1–3.2 below, gives for all $a > 0, b \ge 0$ and all $u \ge 0$:
   $$C_A(q)^2 \le \frac{3\sqrt{6}}{4} g_A'(0)^2 \, \delta^{3/2}, \qquad C_B(q)^2 \le \frac{3\sqrt{6}}{4} g_B'(0)^2 \, \delta^{3/2}, \qquad \|c_A(q) - \sqrt{2}c_B(q)\|_2^2 \le \frac{3\sqrt{6}}{4}\big(g_A'(0) - \sqrt{2}g_B'(0)\big)^2 \delta^{3/2}.$$
   Here the exponent $3/2$ is sharp (attained along sparse cubics), and $\frac{3\sqrt{6}}{4} \approx 1.8371$ matches the proved universal leading-tensor coefficient of `STATUS.md` `6.3.12` (where the Hermitian one-driver class has absolute leading-tensor coefficient $\le 0.481$, with an example $> 0.4808$, i.e. ratio $\approx 0.262$ to $\frac{3\sqrt{6}}{4}$; see also the $\sqrt{13/15}$ sharpening in `STATUS.md` `6.3.42`). Moreover, retaining the 1D Ornstein–Uhlenbeck smoothing at variance $u/2$ shows that $\|\psi_{A,u}''\|_\infty = \psi_{A,u}''(0)$ is strictly decreasing in $u \ge 0$, yielding $C_A(q)^2 \le K_A(u)\,\delta^{3/2}$ with algebraically certified degree-4 Radau–Hermite rational upper bounds at the peak row decreasing from $K_A(0) < \frac{5353}{625} = 8.5648$ down to $K_A(0.044) < \frac{9}{2} = 4.50$ (note: for $u_{\min} > 0$, `radau_bound_enclosure` in `verify_raw_content_result.json` encloses the $Q_4$ Radau upper-bound functional, so only its upper endpoint bounds exact $K_A(u)$; $K_B(0) < \frac{9801}{5000} = 1.9602$, and flank/upper rows are also certified).

2. **Theorem 2 (Universal closed-form $O(\delta)$ bound, low-influence $O(u^2 \tau_{\max}(q))$ bound, and $\chi \le 50\tau_{\max}(q)$ coupling):**
   - **(a)** For every $a > 0, b \ge 0$, $u \ge 0$, and $q \in H_{2,1}(\mathbb{C}^n)$,
     $$C_A(q)^2 \le \frac{32}{225 \pi \, a^4} \, \delta \quad \left(< \frac{58}{125}\,\delta = 0.464\,\delta \text{ at the peak row}\right).$$
   - **(b)** Let $\lambda_1 = \lambda_{\max}(J_1) \le 2u$ and $\lambda_2 = \lambda_{\max}(I_2) \le u$ be the largest eigenvalues of the holomorphic and antiholomorphic influence matrices of $q$ (`STATUS.md` `6.3.31`), and put $\tau_{\max}(q) := \max(\frac{\lambda_1}{2u}, \frac{\lambda_2}{u}) \in (0, 1]$ for $u > 0$. Then for every $a > 0, b \ge 0$,
     $$C_A(q) \le \frac{2\sqrt{u}}{3\sqrt{\pi}\,a^2}\!\left(\sqrt{\frac{26}{25}\lambda_1} + \frac{1}{\sqrt{2e}}\sqrt{\lambda_2}\right), \qquad C_A(q)^2 \le C_{\text{inf}}(a)\,u^2\,\tau_{\max}(q),$$
     with $C_{\text{inf}}(\frac{699}{1250}) < \frac{507}{100} = 5.07$ at the peak row. Furthermore, every $q \in H_{2,1}(\mathbb{C}^n)$ satisfies $\delta \le 20 u \lambda_1 + 10 u \lambda_2 \le 50 u^2 \tau_{\max}(q)$, i.e. $\chi \le 50\tau_{\max}(q)$. In particular, $\tau_{\max}(q) \le \frac{1}{455}$ both forces $\chi \le \frac{10}{91} < \frac{1}{4}$ (lying inside Cover A1 of Theorem 3(b)) and closes $\Lambda(q) + \frac{25}{6} C_A(q)^2 < S + 10^{-4}$ directly from `3.3`, `3.14`, and `6.2.1` without Stein duals.

3. **Theorem 3 (Closure of open row `6.1.5` and bounded-excess raw $A$-core domination):**
   At the peak row, for every remote cubic $q \in H_{2,1}(\mathbb{C}^n)$ and every remote Gaussian linear form $U$ with $\|U\|_2^2 \le 0.0113$:
   - **(a) Zero-dual analytical closure of `6.1.5`:** Combining `STATUS.md` `3.3`, `3.14`, `6.2.1`, `6.2.3`, and Theorem 1 ($K_A(0) < \frac{5353}{625}$) immediately proves $\Lambda(q) + \frac{25}{6} C_A(q)^2 < S + 10^{-4}$ — and therefore $\Lambda(q + (T-1)U) < S + 10^{-4}$ — for **all $0 \le u \le \frac{463}{10000}$ and $0 \le \chi \le \frac{9}{100} = 0.09$** (and whenever $\delta \le \frac{1981}{10^7}$, covering all $\chi \in [0, 42]$ for $0 \le u \le \frac{217}{100000}$). This closes the open near-Gaussian region $\chi \le 0.05$ of `STATUS.md` `6.1.5` unconditionally with zero new duals.
   - **(b) Continuum extension:** Exact rational verification of 79 Stein duals + Bernstein moment cells extends $\Lambda(q) + \frac{25}{6} C_A(q)^2 < S + 10^{-4}$ to **all $(u, \chi) \in [0, \frac{463}{10000}] \times [0, \frac{1}{4}]$** ($\chi \le 0.25$) and to **all $(u, \chi) \in [0, \frac{1}{50}] \times [0, \frac{49}{25}]$** ($\chi \le 1.96$).

4. **Theorem 4 (Strong raw content inequality against the deficit $D(q)$):**
   At the peak row, in every finite dimension $n \ge 1$:
   - **(a) Exact zero-slack near-Gaussian and low-energy regimes:** Combining Theorem 1 with the signed Edgeworth deficit bounds of `STATUS.md` `3.19` proves **$C_A(q)^2 \le \frac{4}{125} D(q) \le \frac{6}{25} D(q)$** for all $(u, \chi) \in (0, \frac{463}{10000}] \times [0, 10^{-4}]$ and **$C_A(q)^2 \le \frac{2}{25} D(q) \le \frac{6}{25} D(q)$** for **all shapes $\chi \in [0, 42]$** on $(0, \frac{1}{4000}] = (0, 0.00025]$ (strict $<$ holds whenever $\delta > 0$, hence for every $q \ne 0$ in finite dimension by `6.3.32(d)`, while at $q = 0$ equality $C_A(0)^2 = D(0) = 0$ holds; this covers part of the unreviewed $u \le 0.00038$ small-energy claim in `STATUS.md` `6.3.11` unconditionally across all shapes).
   - **(b) Signed continuum deficit inequality with $10^{-6}$ allowance:** Across **all $(u, \chi) \in [0, \frac{463}{10000}] \times [0, \frac{841}{10000}]$** ($\chi \le 0.0841 > \frac{2}{25}$), the **signed** deficit satisfies
     $$C_A(q)^2 \le \frac{6}{25} D(q) + \frac{1}{1000000},$$
     which directly yields $\Lambda(q + (T-1)U) \le B(u) - p u + \frac{5}{1200000} \le S + \frac{5}{1200000} < S + 4.17 \times 10^{-6}$ for every remote Gaussian linear form $U$ with $\|U\|_2^2 \le 0.0113$, without invoking `3.3`.
   - **(c) Exact zero-slack continuum cover:** Across **all $(u, \chi) \in [\frac{1}{4000}, \frac{3}{250}] \times [\frac{1}{64}, \frac{49}{625}]$** ($0.015625 \le \chi \le 0.0784$) and **all $(u, \chi) \in [\frac{3}{250}, \frac{463}{10000}] \times [\frac{49}{10000}, \frac{49}{625}]$** ($0.0049 \le \chi \le 0.0784$), **$C_A(q)^2 \le \frac{6}{25} D(q)$** holds with **zero additive allowance**. Thus below $\chi = \frac{49}{625}$, only the narrow near-Gaussian sliver $\chi \in (10^{-4}, \frac{1}{64})$ on $(\frac{1}{4000}, \frac{3}{250}]$ and $\chi \in (10^{-4}, \frac{49}{10000})$ on $[\frac{3}{250}, \frac{463}{10000}]$ remains uncertified for the exact zero-slack form (whereas the signed $+10^{-6}$ form of (b) covers that sliver unconditionally).

5. **Theorem 5 (Strict positivity of the peak remote deficit $D(q) > 0$, Cover D):**
   At the peak row $(a, b) = (\frac{699}{1250}, \frac{179}{1250})$, the remote deficit $D(q) = B(u) - 2\mathbb{E}|L + q|$ is **strictly positive** ($D(q) > 0$) across **all $(u, \chi) \in [\frac{1}{4000}, \frac{3}{250}] \times [\frac{1}{64}, \frac{49}{100}]$** ($0.015625 \le \chi \le 0.49$) and **all $(u, \chi) \in [\frac{3}{250}, \frac{463}{10000}] \times [\frac{49}{10000}, \frac{49}{100}]$** ($0.0049 \le \chi \le 0.49$). Together with `STATUS.md` `3.19` — which proves $D(q) > 0$ on $(0, \frac{463}{10000}] \times (0, \frac{1}{5000}]$ and across all $\chi \in (0, 42]$ on $(0, \frac{1}{4000}]$ — this establishes strict positivity of the peak remote deficit on all of $\chi \le \frac{49}{100}$ outside the narrow near-Gaussian band $(\frac{1}{5000}, \frac{1}{64})$ on $(\frac{1}{4000}, \frac{3}{250}]$ and $(\frac{1}{5000}, \frac{49}{10000})$ on $[\frac{3}{250}, \frac{463}{10000}]$.

**Explicit scope boundaries:** High-kurtosis cubics ($\chi > \frac{1}{4}$ at $u = 0.0463$ for the weak $10^{-4}$ form; $\chi > \frac{841}{10000}$ for the signed $10^{-6}$ deficit form; and $\chi > \frac{49}{625}$ together with the near-Gaussian gap $(10^{-4}, \frac{1}{64})$ on $(\frac{1}{4000}, \frac{3}{250}]$ and $(10^{-4}, \frac{49}{10000})$ on $[\frac{3}{250}, \frac{463}{10000}]$ for the exact zero-slack deficit form) outside the structured families of `6.3.2`–`6.3.9` remain open in `6.3.18`. Joint $A + B$ and odd-over-$A/B$ assembly (`7.4`, `7.2.4`) are outside this note's scope.

---

## 2. Explicit inventory of inherited dependencies and attribution

To keep both logical dependencies and prior credit transparent:

- **Theorems 1 and 2** depend **only** on:
  - Complete monotonicity and positive Laplace-measure representations of $f_D, f_A, f_B, f_C$ and $k_A = -g_A, k_B = -g_B$ (`STATUS.md` `2.7`, `2.7a`; `CONTENT_KERNELS.md` §§1–3, **P**).
  - **Attribution for §§3.1–3.2 vs. §§3.3–3.4:** The 1D Ornstein–Uhlenbeck resolvent bound on real third chaos ($\mathbb{E}[H m(F)] \le \frac{1}{4}\|m'''\|_\infty \kappa^{3/4}$) was introduced and proved in `content_tensor_next.md` §§1–2 (`TILT`, reviewed **P** in `TILT-REV3`, `STATUS.md` `11.30`), and its circular angular conversion to complex $(2,1)$-cubics was developed in `C7E2R2` `remote/RAW_CONTENT_BOUND.md` §§1–2 (Eqs. (13)–(18)). Because `C7E2R2` is unreviewed (`author only`), §§3.1–3.2 writes out both arguments completely so that Theorem 1 requires no unreviewed input. What is new in Theorem 1 is §3.3 (the exact Gaussian-atom identification $\|m_A'''\|_\infty = m_A'''(0) = \frac{32}{\pi} g_A'(0)$ and $\|m_B'''\|_\infty = m_B'''(0) = \frac{32}{\pi} g_B'(0)$ for all $a > 0, b \ge 0$) and §3.4 (the strictly decreasing OU-smoothed constant $K_A(u)$ certified via degree-4 rational Radau–Hermite polynomials $Q_4(y)$).
  - For Theorem 2(a): the shifted-resolvent metric Hessian inequality $\|c[g](q)\|_2^2 \le \frac{6}{25}\delta \sup_R N_\Phi(R)$ and Gaussian-atom bound $N_{V_s}(R) \le \frac{4}{3}s$ (`STATUS.md` `7.1.8`; `CONTENT_STRUCTURE.md` §§2–3, **P + C**).
  - For Theorem 2(b): the directional shadow inequality $C_A(q) \le \sqrt{\lambda_1}\,\operatorname{sd}[(v h)'(V)] + \sqrt{\lambda_2}\,\|V h'(V)\|_2$ (`STATUS.md` `6.3.31`; `KIC` `NOTE2.md` §1, **P**). The fourth-moment-to-influence bound $\delta \le 20 u \lambda_1 + 10 u \lambda_2 \le 50 u^2 \tau_{\max}(q)$ in §4.2 was pointed out by `claude-b9ee` during review of PR `#518`.
- **Theorem 3(a) and Theorem 4(a)** (zero-dual analytical corollaries) additionally use:
  - Peak remote cap $\Lambda(q) < \frac{1373953883}{10^9}$ (`STATUS.md` `3.3`, **P + C**), benchmark lower bound $S > 1.3739535256614$ (`3.14`, **C**), raw $A$-shell cost $\kappa = \frac{6}{25}$ for remote linear forms $\|U\|_2^2 \le 0.0113$ and square completion (`6.2.1`, `6.2.3`, **P**), sixth-moment / kurtosis caps $0 \le \chi \le 42$ (`3.4`, **Lean**), and signed Edgeworth deficit bounds $D(q) \ge \frac{1}{8}\delta$ ($\chi \le 10^{-4}, u \le \frac{463}{10000}$) and $D(q) \ge \frac{9}{50}\delta$ ($u \le \frac{1}{4000}$, all shapes) (`3.19`, **P + C**).
- **Theorem 3(b), Theorem 4(b,c), and Theorem 5** (continuum covers) additionally use:
  - Complete monotonicity $0 \le -V''(s) \le -V''(0)$ (`STATUS.md` `2.7`, **P**) together with our self-contained outward interval check $-V''(0) < \frac{1673}{1000}$ in `verify_raw_content.py`.
  - The circular cubic sixth-moment theorem $\mathbb{E}|q|^6 \le 6u^3 + 9u\delta + \frac{4045313}{100000}\delta^{3/2}$ and spectral Stein cut positivity (`STATUS.md` `3.4`, **Lean**; dense rational knot extension `3.12`, **P**).
  - The audited profile upper-cap bank `profile-caps.json` (`sha256: 01c2e2a7b4af452ce8729ec47cb0cd2c3aa7e1368c6b58336270c2a19b349514`) and Hermite polynomial bank `moment-boxes.json` (`sha256: cef37c2a66eacd66296add7ed2efc5a8d6afc336d2ed614102de08429d449695`) from `code/audit-2026-11-15-codex-a7c4/remote_stein_original/` (`STATUS.md` `3.3`, `11.47`, `11.50`, `11.61`, **P + C**). All Gaussian Rice benchmark lower bounds $B_{\text{lo}}(u)$ and all low-energy $[0, \frac{3}{250}]$ deficit caps in Covers B, C, and D are computed freshly from scratch inside `verify_raw_content.py` in pure-Python exact rational arithmetic without external libraries.

---

## 3. Proof of Theorem 1: Exact third-derivative supremum and OU-smoothed $O(\delta^{3/2})$ bounds

### 3.1 Real third-chaos 1D Ornstein–Uhlenbeck resolvent bound (following `content_tensor_next.md` §§1–2)

Let $F = I_3(f)$ be a real third-chaos polynomial on $(\mathbb{R}^N, \gamma_N)$ with symmetric kernel $f \in (\mathbb{R}^N)^{\odot 3}$, variance $\sigma^2 = \mathbb{E}[F^2] = 6\|f\|_{\text{HS}}^2 > 0$, and fourth cumulant $\kappa = \mathbb{E}[F^4] - 3\sigma^4 \ge 0$. Let $H = I_1(h)$ be a real first-chaos variable with $\|h\|_2 = 1$, set $g_{jk} = \sum_{i=1}^N h_i f_{ijk}$, $Y = I_2(g)$, and $B_{ij} = \sum_{k,l=1}^N f_{ikl} f_{jkl}$ ($r := \|B\|_{\text{HS}}$).

1. **Contraction and carré du champ norms:** By Cauchy–Schwarz, $\|g\|_{\text{HS}}^2 = \langle h, B h\rangle \le r$, so $\|Y\|_2^2 = 2\|g\|_{\text{HS}}^2 \le 2r$. By the Wiener–Itô product formula on $F^2 = \sigma^2 + J_2 + J_4 + J_6$, one has $J_2 = 18 I_2(B)$, $J_4 = 9 I_4(\operatorname{Sym}(f \otimes_1 f))$, and $\Gamma := \|DF\|^2 = 3\sigma^2 + 2 J_2 + J_4$. Gaussian integration by parts gives $\mathbb{E}[F^4] = \mathbb{E}[F^2 \Gamma]$, hence by chaos orthogonality:
   $$\kappa = \mathbb{E}[F^2(\Gamma - 3\sigma^2)] = 2\|J_2\|_2^2 + \|J_4\|_2^2 \ge 2\|J_2\|_2^2 = 2 \cdot 18^2 \cdot 2\|B\|_{\text{HS}}^2 = 1296 r^2,$$
   and simultaneously
   $$\mathbb{E}\big[(\Gamma - 3\sigma^2)^2\big] = 4\|J_2\|_2^2 + \|J_4\|_2^2 \le 2\kappa.$$
   In particular, $r \le \sqrt{\kappa} / 36$ and $\|Y\|_2 \|\Gamma - 3\sigma^2\|_2 \le \sqrt{2r}\sqrt{2\kappa} \le \kappa^{3/4} / 3$.

2. **1D Ornstein–Uhlenbeck resolvent identity:** Let $m \in C^3(\mathbb{R})$ be odd with $M_3 := \|m'''\|_\infty < \infty$ (hence $m, m', m''$ have polynomial growth). One integration by parts gives $\mathbb{E}[H\,m(F)] = \mathbb{E}[\langle h, DF\rangle m'(F)] = 3\mathbb{E}[Y\,m'(F)]$. Let $T_\sigma = \sigma^2 \frac{d^2}{dx^2} - x\frac{d}{dx}$ be the 1D Ornstein–Uhlenbeck generator with stationary law $N_\sigma \sim N(0, \sigma^2)$ and semigroup $(P_t^{(\sigma^2)} g)(x) = \mathbb{E}_G[g(e^{-t}x + \sigma\sqrt{1 - e^{-2t}}\,G)]$ ($G \sim N(0,1)$). Since $m'$ is even, $m' - \mathbb{E}m'(N_\sigma)$ is orthogonal to Hermite degrees $0$ and $1$ in $L^2(N_\sigma)$, so
   $$\psi(x) := \int_0^\infty e^{2t} P_{3t}^{(\sigma^2)}\!\big[m' - \mathbb{E}m'(N_\sigma)\big](x)\,dt$$
   converges smoothly and solves $(3 T_\sigma + 2)\psi = -\big(m' - \mathbb{E}m'(N_\sigma)\big)$, with second derivative (substituting $z = e^{-3t} \in (0, 1]$, $dt = \frac{dz}{3z}$, and $P_{3t}^{(\sigma^2)}(m')'' = e^{-6t} P_{3t}^{(\sigma^2)}(m''')$):
   $$\psi''(x) = \int_0^\infty e^{-4t} (P_{3t}^{(\sigma^2)} m''')(x)\,dt = \frac{1}{3}\int_0^1 z^{1/3}\,\mathbb{E}_G\!\left[m'''\!\left(z x + \sigma\sqrt{1 - z^2}\,G\right)\right] dz. \tag{3.1}$$
   On $(\mathbb{R}^N, \gamma_N)$, the Malliavin generator $L_{\mathbb{R}^N}$ satisfies $L_{\mathbb{R}^N} F = -3F$, $L_{\mathbb{R}^N} Y = -2Y$, and the chain rule $L_{\mathbb{R}^N}\psi(F) = (L_{\mathbb{R}^N} F)\psi'(F) + \Gamma\psi''(F) = 3(T_\sigma\psi)(F) + (\Gamma - 3\sigma^2)\psi''(F)$. Since $\mathbb{E}[Y] = 0$ and $L_{\mathbb{R}^N}$ is self-adjoint,
   $$\mathbb{E}[Y\,m'(F)] = -\mathbb{E}\big[Y\,(3T_\sigma + 2)\psi(F)\big] = -\mathbb{E}\big[(L_{\mathbb{R}^N} Y + 2Y)\psi(F)\big] + \mathbb{E}\big[Y(\Gamma - 3\sigma^2)\psi''(F)\big] = \mathbb{E}\big[Y(\Gamma - 3\sigma^2)\psi''(F)\big].$$
   By Cauchy–Schwarz,
   $$\big|\mathbb{E}[H\,m(F)]\big| = 3\big|\mathbb{E}[Y(\Gamma - 3\sigma^2)\psi''(F)]\big| \le 3\|\psi''\|_\infty \|Y\|_2 \|\Gamma - 3\sigma^2\|_2 \le \|\psi''\|_\infty \, \kappa^{3/4} \le \frac{M_3}{4}\,\kappa^{3/4}, \tag{3.2}$$
   since $\frac{1}{3}\int_0^1 z^{1/3}\,dz = \frac{1}{4}$. (When $\sigma = 0$, $F = 0$ a.s. and both sides vanish.)

### 3.2 Circular angular conversion (following `C7E2R2` `remote/RAW_CONTENT_BOUND.md` §§1–2)

Suppose $\Phi(y) = (\mathcal{C} m)(y) := \frac{1}{4}\int_0^{2\pi} e^{i\theta} m(\operatorname{Re}(e^{-i\theta} y))\,d\theta$ for an odd $m \in C^3(\mathbb{R})$ with $\|m'''\|_\infty < \infty$. For any unit holomorphic linear form $X$ ($\mathbb{E}|X|^2 = 1$), $(q, X)$ is invariant in law under $(q, X) \mapsto (e^{i\theta} q, e^{i\theta} X)$, so $\mathbb{E}[\bar{X} e^{i\theta} m(\operatorname{Re}(e^{-i\theta} q))] = \mathbb{E}[\bar{X} m(\operatorname{Re} q)]$ is independent of $\theta$, giving $\mathbb{E}[\bar{X}\Phi(q)] = \frac{\pi}{2}\mathbb{E}[\bar{X} m(\operatorname{Re} q)]$. Rotating the phase of $X$ so that $\mathbb{E}[\bar{X}\Phi(q)] \ge 0$ and setting $H = \sqrt{2}\operatorname{Re} X$ ($\mathbb{E}[H^2] = 1$) gives $|\mathbb{E}[\bar{X}\Phi(q)]| = \frac{\pi}{2\sqrt{2}}\mathbb{E}[H\,m(\operatorname{Re} q)]$. By circularity of $q$, $F = \operatorname{Re} q$ has $\sigma^2 = u/2$ and $\kappa = \frac{3}{8}\delta$. Applying (3.2) and taking the supremum over unit $X$ yields
$$\|\Pi_{1,0}\Phi(q)\|_2^2 \le \frac{\pi^2}{8}\left(\frac{3}{8}\right)^{3/2} \|\psi_u''\|_\infty^2 \, \delta^{3/2} \le \frac{\pi^2}{128}\left(\frac{3}{8}\right)^{3/2} \|m'''\|_\infty^2 \, \delta^{3/2}. \tag{3.3}$$

### 3.3 Exact Gaussian-atom decomposition of $m_A$ and $m_B$ and maximization at $x = 0$

From `CONTENT_KERNELS.md` Eqs. (8), (11), and (12) (`STATUS.md` `2.7a`, **P**), for all $a > 0, b \ge 0$ there exist unique finite positive Borel measures $\mu_A, \mu_B, \mu_C \ge 0$ on $(0, \infty)$ with all nonnegative moments finite (and $\int \lambda^{-3/2}\mu_A < \infty$, $\int \lambda^{-2}\mu_B = 1$) such that
$$-g_A(v) = \frac{\sqrt{\pi}}{2}\int_0^\infty \lambda^{-1/2}\,\mathbb{E}_\theta[\cos^2\theta\,e^{-\lambda v \cos^2\theta}]\,\mu_A(d\lambda), \qquad -g_B(v) = \frac{\sqrt{\pi}}{2\sqrt{2}}\int_0^\infty \lambda^{-3/2}\,\mathbb{E}_\theta[\cos^2\theta\,e^{-\lambda v \cos^2\theta}]\,\mu_B(d\lambda),$$
and $-g_A(v) + \sqrt{2}g_B(v) = b\sqrt{\pi}\int_0^\infty \lambda^{-3/2}\,\mathbb{E}_\theta[\cos^2\theta\,e^{-\lambda v \cos^2\theta}]\,\mu_C(d\lambda)$.

For each $\lambda > 0$, consider the scalar Gaussian atom $m_\lambda(x) := x e^{-\lambda x^2}$. For $y = r e^{i\phi} \in \mathbb{C}$, substituting $\theta = \phi + \alpha$ gives
$$(\mathcal{C} m_\lambda)(y) = \frac{1}{4}\int_0^{2\pi} e^{i(\phi+\alpha)} r\cos\alpha\,e^{-\lambda r^2\cos^2\alpha}\,d\alpha = \frac{\pi}{2}\,y\,\mathbb{E}_\alpha[\cos^2\alpha\,e^{-\lambda |y|^2\cos^2\alpha}],$$
since $\cos\alpha\sin\alpha\,e^{-\lambda r^2\cos^2\alpha}$ is odd in $\alpha$. Integrating against $\mu_A, \mu_B, \mu_C$ by Fubini (justified by the finite moments in `CONTENT_KERNELS.md` §3) shows that $\Phi_A = \mathcal{C} m_A$, $\Phi_B = \mathcal{C} m_B$, and $\Phi_A - \sqrt{2}\Phi_B = \mathcal{C}(m_A - \sqrt{2}m_B)$ with
$$m_A(x) = -\frac{1}{\sqrt{\pi}}\int_0^\infty \lambda^{-1/2} x e^{-\lambda x^2}\,\mu_A(d\lambda), \qquad m_B(x) = -\frac{1}{\sqrt{2\pi}}\int_0^\infty \lambda^{-3/2} x e^{-\lambda x^2}\,\mu_B(d\lambda), \tag{3.4}$$
(which coincide with the sign expectations in §1 by uniqueness of odd radial angular reconstructions, or directly by integrating the planar pushforward density of $L$).

Now differentiate the atom $m_\lambda(x) = x e^{-\lambda x^2}$ three times:
$$m_\lambda'''(x) = -2\lambda(3 - 12\lambda x^2 + 4\lambda^2 x^4)e^{-\lambda x^2}.$$
**Lemma 3.1.** *For every $t \ge 0$, $|3 - 12t + 4t^2| e^{-t} \le 3$, with equality uniquely at $t = 0$.*
*Proof.* Using $e^t \ge 1 + t + \frac{t^2}{2} + \frac{t^3}{6}$ for $t \ge 0$:
$$3 e^t - (3 - 12t + 4t^2) \ge 15t - \frac{5}{2}t^2 + \frac{1}{2}t^3 = \frac{t}{2}\!\left[\left(t - \frac{5}{2}\right)^2 + \frac{95}{4}\right] \ge 0,$$
strictly positive for $t > 0$. And using $e^t \ge 1 + t + \frac{t^2}{2}$ for $t \ge 0$:
$$3 e^t + (3 - 12t + 4t^2) \ge 6 - 9t + \frac{11}{2}t^2 = \frac{11}{2}\!\left(t - \frac{9}{11}\right)^2 + \frac{27}{11} > 0. \quad \square$$

Applying Lemma 3.1 with $t = \lambda x^2 \ge 0$ yields $|m_\lambda'''(x)| \le 6\lambda = -m_\lambda'''(0)$ for every $x \in \mathbb{R}$ and $\lambda > 0$. Because $\mu_A, \mu_B, \mu_C \ge 0$ have all positive moments finite, differentiation under the integral sign gives:
$$\|m_A'''\|_\infty = m_A'''(0) = \frac{6}{\sqrt{\pi}}\int_0^\infty \lambda^{1/2}\,\mu_A(d\lambda), \qquad \|m_B'''\|_\infty = m_B'''(0) = \frac{6}{\sqrt{2\pi}}\int_0^\infty \lambda^{-1/2}\,\mu_B(d\lambda).$$
Meanwhile, differentiating $-g_A(v)$ and $-g_B(v)$ at $v = 0$ using $\mathbb{E}_\theta[\cos^4\theta] = \frac{3}{8}$ gives
$$g_A'(0) = \frac{3\sqrt{\pi}}{16}\int_0^\infty \lambda^{1/2}\,\mu_A(d\lambda), \qquad g_B'(0) = \frac{3\sqrt{\pi}}{16\sqrt{2}}\int_0^\infty \lambda^{-1/2}\,\mu_B(d\lambda).$$
Eliminating the $\lambda$-integrals yields $\|m_A'''\|_\infty = \frac{32}{\pi} g_A'(0)$ and $\|m_B'''\|_\infty = \frac{32}{\pi} g_B'(0)$ (and identically $\|(m_A - \sqrt{2}m_B)'''\|_\infty = \frac{32}{\pi}(g_A'(0) - \sqrt{2}g_B'(0))$). Substituting into (3.3) cancels $\pi^2$:
$$\frac{\pi^2}{128}\left(\frac{3}{8}\right)^{3/2}\left(\frac{32}{\pi} g'(0)\right)^2 = \frac{\pi^2}{128} \cdot \frac{3\sqrt{6}}{32} \cdot \frac{1024}{\pi^2} g'(0)^2 = \frac{3\sqrt{6}}{4} g'(0)^2,$$
proving the universal $O(\delta^{3/2})$ bounds of Theorem 1 for every $a > 0, b \ge 0$.

### 3.4 Exact 1D OU smoothing of Gaussian atoms and degree-4 rational Radau–Hermite upper bounds on $K_A(u)$

For $u > 0$ ($\sigma^2 = u/2$) and $z \in (0, 1)$, Gaussian completion of the square gives
$$\mathbb{E}_G\big[m_\lambda(z x + \sigma\sqrt{1 - z^2}\,G)\big] = \frac{z x}{(1 + \lambda u(1 - z^2))^{3/2}} \exp\!\left(-\frac{\lambda z^2}{1 + \lambda u(1 - z^2)} x^2\right) = \frac{z}{(1 + \lambda u(1 - z^2))^{3/2}}\,m_{\tilde{\lambda}}(x),$$
where $\tilde{\lambda} = \frac{\lambda z^2}{1 + \lambda u(1 - z^2)} > 0$. Using $\mathbb{E}_G[m_\lambda'''(z x + \sigma\sqrt{1-z^2}\,G)] = z^{-3}\frac{d^3}{dx^3}\mathbb{E}_G[m_\lambda(z x + \sigma\sqrt{1-z^2}\,G)]$ and applying Lemma 3.1 to $|m_{\tilde{\lambda}}'''(x)| \le 6\tilde{\lambda}$ gives
$$\left|\mathbb{E}_G\!\left[m_\lambda'''\!\left(z x + \sqrt{\tfrac{u}{2}(1 - z^2)}\,G\right)\right]\right| = \frac{1}{z^2(1 + \lambda u(1 - z^2))^{3/2}}\,|m_{\tilde{\lambda}}'''(x)| \le \frac{6\lambda}{(1 + \lambda u(1 - z^2))^{5/2}},$$
with equality uniquely at $x = 0$ (where $-m_{\tilde{\lambda}}'''(0) = 6\tilde{\lambda}$). Substituting into (3.1) and integrating against $\mu_A \ge 0$ proves that for every $u \ge 0$:
$$\|\psi_{A,u}''\|_\infty = \psi_{A,u}''(0) = \frac{2}{\sqrt{\pi}} \int_0^1 z^{1/3}\left(\int_0^\infty \frac{\lambda^{1/2}}{(1 + \lambda u(1 - z^2))^{5/2}}\,\mu_A(d\lambda)\right) dz, \tag{3.5}$$
which is **strictly decreasing** in $u \ge 0$.

To upper-bound $\psi_{A,u}''(0)$ in exact rational arithmetic on any slab $u \ge u_{\min}$, choose rational ratios $1 < r_1 < r_2$, set $y_1 = r_1^2 - 1 > 0$ and $y_2 = r_2^2 - 1 > y_1$, and let $Q_4(y) = \sum_{k=0}^4 a_k y^k \in \mathbb{Q}[y]$ interpolate $(1 + y)^{-5/2}$ at $y = 0$ (value $1$) and to first order at $y = y_1$ and $y = y_2$ (values $r_i^{-5}$, derivatives $-\frac{5}{2}r_i^{-7}$). In `verify_raw_content.py` (`certify_radau_q4`), we verify algebraically in $\mathbb{Q}[y]$ that $Q_4(y) > 0$ on $[0, \infty)$ and that
$$Q_4(y)^2 (1 + y)^5 - 1 = y(y - y_1)^2 (y - y_2)^2 R_{10}(y)$$
with $R_{10}(y) > 0$ on $[0, \infty)$, proving $Q_4(y) \ge (1 + y)^{-5/2}$ for all $y \ge 0$. Substituting $y = \lambda u_{\min}(1 - z^2)$ into (3.5) expresses the resulting upper bound in terms of the rational Beta integrals $Z_k = \int_0^1 z^{1/3}(1 - z^2)^k\,dz$ ($Z_0 = \frac{3}{4}$, $Z_k = \frac{3k}{3k+2} Z_{k-1}$) and the closed-form endpoint moments
$$L_j = \int_0^\infty \lambda^{j+1/2}\mu_A(d\lambda) = \frac{2 \cdot 4^{j+2}}{\sqrt{\pi}\binom{2j+4}{j+2}} M_{j+1}^A \qquad (j = 0, 1, 2, 3, 4),$$
certifying the table of decreasing bounds $K_A(u_{\min})$ in §6.

---

## 4. Proof of Theorem 2: Closed-form $O(\delta)$ bound and low-influence regime

Let $k_A(v) = -g_A(v) = \int_0^\infty e^{-s v}\,\nu_A(ds)$ be the Laplace representation of $k_A$ (`STATUS.md` `2.7a`), where $\nu_A \ge 0$ is the pushforward of $\frac{\sqrt{\pi}}{2}\lambda^{-1/2}\cos^2\theta\,\mu_A(d\lambda)\otimes \mathbb{P}(d\theta)$ under $s = \lambda\cos^2\theta$. Using $\mathbb{E}_\theta[|\cos\theta|^3] = \frac{4}{3\pi}$ and $\int_0^\infty \mu_A(d\lambda) = f_A(0) = \frac{1}{a^2}$ (`CONTENT_KERNELS.md` Eq. (2) at $n = 0$), Tonelli gives the exact half-moment:
$$\int_0^\infty \sqrt{s}\,\nu_A(ds) = \frac{\sqrt{\pi}}{2} \, \mathbb{E}_\theta[|\cos\theta|^3] \int_0^\infty \mu_A(d\lambda) = \frac{2}{3\sqrt{\pi}\,a^2}. \tag{4.1}$$

### 4.1 Proof of Theorem 2(a) ($O(\delta)$ bound)

By `CONTENT_STRUCTURE.md` Eqs. (2) and (6) (`STATUS.md` `7.1.8`, **P + C**), for $\Phi_A(x) = -x\,k_A(|x|^2)$, the radial Hessian norm satisfies $\sup_R \sqrt{N_{\Phi_A}(R)} \le \sqrt{4/3}\int_0^\infty \sqrt{s}\,\nu_A(ds)$ and $C_A(q)^2 \le \frac{6}{25}\delta \sup_R N_{\Phi_A}(R)$. Inserting (4.1) gives
$$C_A(q)^2 \le \frac{6}{25} \cdot \frac{4}{3} \cdot \left(\frac{2}{3\sqrt{\pi}\,a^2}\right)^2 \delta = \frac{32}{225\pi\,a^4}\,\delta \qquad \forall a > 0, \, b \ge 0, \, u \ge 0.$$

### 4.2 Proof of Theorem 2(b) ($O(u^2\tau_{\max}(q))$ bound and $\chi \le 50\tau_{\max}(q)$ coupling)

1. **Low-influence raw content bound:** Since $\Pi_{1,0} q = 0$, $c_A(q) = c[h](q)$ for $h(v) := g_A(v) - g_A(0) = k_A(0) - k_A(v)$. Applying the directional shadow inequality (`STATUS.md` `6.3.31`, **P**) to $h$ gives, with $V = |q|^2$, $h_1(v) = (v h(v))' = g_A(v) - g_A(0) + v g_A'(v)$, and $h_2(v) = h'(v) = g_A'(v)$:
   $$C_A(q) \le \sqrt{\lambda_1}\,\operatorname{sd}[h_1(V)] + \sqrt{\lambda_2}\,\|V h_2(V)\|_2 \le \sqrt{\lambda_1}\sqrt{\mathbb{E}[h_1(V)^2]} + \sqrt{\lambda_2}\sqrt{\mathbb{E}[V^2 h_2(V)^2]}. \tag{4.2}$$
   Express $h_1(v)$ and $v h_2(v)$ via $\nu_A \ge 0$: for $v > 0$,
   $$\frac{h_1(v)}{\sqrt{v}} = \int_0^\infty \sqrt{s}\cdot \frac{1 - (1 - s v)e^{-s v}}{\sqrt{s v}}\,\nu_A(ds), \qquad \frac{v h_2(v)}{\sqrt{v}} = \int_0^\infty \sqrt{s}\cdot \big(\sqrt{s v}\,e^{-s v}\big)\,\nu_A(ds).$$
   - For $t \ge 0$, $2t e^{-2t} \le e^{-1}$ (since $e^{2t - 1} \ge 2t$), so $\sqrt{t}\,e^{-t} \le \frac{1}{\sqrt{2e}}$.
   - For $t > 0$, `verify_raw_content.py` proves $\big(1 - (1 - t)e^{-t}\big)^2 < \frac{26}{25} t$:
     - For $t \ge \frac{3}{2}$, $\sup_{t \ge 1}(t - 1)e^{-t} = e^{-2} < \frac{1}{7}$ (since $e > \frac{8}{3} \implies e^2 > \frac{64}{9} > 7$), hence $(1 + (t - 1)e^{-t})^2 < \frac{64}{49} < \frac{39}{25} \le \frac{26}{25} t$.
     - For $t \in (0, \frac{3}{2}]$, $e^{2t} \ge \sum_{k=0}^9 \frac{(2t)^k}{k!}$ and $0 < e^t - 1 + t \le 2t + \sum_{k=2}^9 \frac{t^k}{k!} + \frac{22}{19}\frac{t^{10}}{10!} =: P_{\text{up}}(t)$; dividing $\frac{26}{25} t \sum_{k=0}^9 \frac{(2t)^k}{k!} - P_{\text{up}}(t)^2$ by $t$ yields a polynomial certified strictly positive on $[0, \frac{3}{2}]$ by exact Bernstein subdivision.

   Combining both pointwise bounds with (4.1) gives $h_1(v)^2 \le \frac{26}{25}\left(\frac{2}{3\sqrt{\pi}a^2}\right)^2 v$ and $v^2 h_2(v)^2 \le \frac{1}{2e}\left(\frac{2}{3\sqrt{\pi}a^2}\right)^2 v$ for all $v \ge 0$. Taking expectations ($\mathbb{E}[V] = u$) inside (4.2) yields $C_A(q)^2 \le C_{\text{inf}}(a)\,u^2\,\tau_{\max}(q)$ with
   $$C_{\text{inf}}(a) = \frac{4}{9\pi\,a^4}\left(\sqrt{\frac{52}{25}} + \frac{1}{\sqrt{2e}}\right)^2.$$
   At $a = \frac{699}{1250}$, `verify_raw_content.py` encloses $C_{\text{inf}}(a) \in [5.065170797456077, 5.065170797456078] < \frac{507}{100}$, and checks $\frac{1373953883}{10^9} + \frac{25}{6}\cdot\frac{507}{100}\cdot\left(\frac{463}{10000}\right)^2\cdot\frac{1}{455} < S_{\text{lo}} + 10^{-4}$.

2. **Fourth-cumulant-to-influence bound $\delta \le 20 u \lambda_1 + 10 u \lambda_2 \le 50 u^2 \tau_{\max}(q)$:** Write $F = \operatorname{Re} q = I_3(f)$ on $(\mathbb{R}^{2n}, \gamma_{2n})$ with $z_j = (x_j + i y_j)/\sqrt{2}$, so $\sigma^2 = \frac{u}{2} = 6\|f\|_{\text{HS}}^2$ ($\operatorname{tr}(B) = \|f\|_{\text{HS}}^2 = \frac{u}{12}$ for $B = f \otimes_2 f \succeq 0$) and $\kappa = \frac{3}{8}\delta$. Since $\|\operatorname{Sym}(f \otimes_1 f)\|_{\text{HS}}^2 \le \|f \otimes_1 f\|_{\text{HS}}^2 = \|B\|_{\text{HS}}^2$, the identity $\kappa = 2\|J_2\|_2^2 + \|J_4\|_2^2$ from §3.1 gives $\kappa \le (1296 + 81 \cdot 24)\|B\|_{\text{HS}}^2 = 3240\|B\|_{\text{HS}}^2$, hence $\delta = \frac{8}{3}\kappa \le 8640\|B\|_{\text{HS}}^2 \le 8640\,\lambda_{\max}(B)\operatorname{tr}(B) = 720 u\,\lambda_{\max}(B)$. Meanwhile, for any unit $h \in \mathbb{R}^{2n}$ with $\xi_j = h_{2j-1} + i h_{2j}$ ($\|\xi\|_2 = 1$), one has $\langle DF, h\rangle = \frac{1}{\sqrt{2}}\operatorname{Re}(\bar{\xi}\cdot\partial_z q) + \frac{1}{\sqrt{2}}\operatorname{Re}(\xi\cdot\partial_{\bar{z}} q)$. Because $\operatorname{Re}(\bar{\xi}\cdot\partial_z q) \in H_{1,1}$ is $L^2$-orthogonal to $\operatorname{Re}(\xi\cdot\partial_{\bar{z}} q) \in H_{2,0}\oplus H_{0,2}$ and $\xi\cdot\partial_{\bar{z}} q$ is orthogonal to its conjugate,
   $$18\langle h, B h\rangle = \mathbb{E}[\langle DF, h\rangle^2] \le \frac{1}{2}\mathbb{E}|\bar{\xi}\cdot\partial_z q|^2 + \frac{1}{4}\mathbb{E}|\xi\cdot\partial_{\bar{z}} q|^2 \le \frac{\lambda_1}{2} + \frac{\lambda_2}{4}.$$
   Therefore $\delta \le 720 u \cdot \frac{\lambda_1/2 + \lambda_2/4}{18} = 20 u \lambda_1 + 10 u \lambda_2 \le 50 u^2 \tau_{\max}(q)$, i.e. $\chi \le 50\tau_{\max}(q)$ whenever $u > 0$. In particular, $\tau_{\max}(q) \le \frac{1}{455}$ already restricts $\chi \le \frac{10}{91} \approx 0.1099 < \frac{1}{4}$ (inside Cover A1), while $C_A(q)^2 \le C_{\text{inf}}(a) u^2 \tau_{\max}(q)$ closes that slice directly without Stein duals.

---

## 5. Proofs of Theorems 3, 4, and 5: Analytical regimes, Stieltjes–Maclaurin bounds, and continuum covers

### 5.1 Zero-dual analytical consequences (Theorems 3(a) and 4(a))

1. **Closing open row `6.1.5`:** For any remote Gaussian linear form $U$ with $\|U\|_2^2 \le 0.0113$, `STATUS.md` `6.2.1` and square completion (`6.2.3`) give
   $$\Lambda(q + (T - 1)U) \le \Lambda(q) + 2 C_A(q)\|U\|_2 - \frac{6}{25}\|U\|_2^2 \le \Lambda(q) + \frac{25}{6} C_A(q)^2.$$
   Using `3.3` ($\Lambda(q) < \frac{1373953883}{10^9}$), `3.14` ($S > S_{\text{lo}} = 1.3739535256614$), and Theorem 1 ($C_A(q)^2 \le \frac{5353}{625}\delta^{3/2}$), exact rational arithmetic in `verify_raw_content.py` checks that for all $0 \le u \le \frac{463}{10000}$ and $0 \le \chi \le \frac{9}{100} = 0.09$,
   $$\Lambda(q) + \frac{25}{6} C_A(q)^2 < \frac{1373953883}{10^9} + \frac{5353}{150}\left(\frac{463}{10000}\right)^3\left(\frac{3}{10}\right)^3 < S_{\text{lo}} + 10^{-4}$$
   with slack $\frac{200428660081}{5 \times 10^{16}} > 4.0 \times 10^{-6}$ (and similarly whenever $\delta \le \frac{1981}{10^7}$). Since $\frac{9}{100} > 0.05$, this closes `6.1.5`.

2. **Exact zero-slack near-Gaussian and small-energy deficit inequalities:** At $q = 0$, $C_A(0)^2 = D(0) = 0$. For $u > 0$, by `STATUS.md` `3.19` (**P + C**):
   - On $0 < u \le \frac{463}{10000}$ and $0 \le \chi \le 10^{-4}$, $D(q) \ge \frac{1}{8}\delta$, while Theorem 1 gives $C_A(q)^2 \le \frac{5353}{625} u \sqrt{\chi}\,\delta \le \frac{4}{125}\cdot\frac{1}{8}\delta \le \frac{4}{125} D(q) \le \frac{6}{25} D(q)$ (strict $<$ whenever $\delta > 0$).
   - On $0 < u \le \frac{1}{4000}$ and all $0 \le \chi \le 42$ ($\sqrt{\chi} < \frac{13}{2}$), $D(q) \ge \frac{9}{50}\delta$, while Theorem 1 gives $C_A(q)^2 \le \frac{5353}{625}\cdot\frac{1}{4000}\cdot\frac{13}{2}\,\delta \le \frac{2}{25}\cdot\frac{9}{50}\delta \le \frac{2}{25} D(q) \le \frac{6}{25} D(q)$ (strict $<$ whenever $\delta > 0$).

### 5.2 Pure-Python Radau–Hermite Rice benchmark $B_{\text{lo}}(u)$ and Stieltjes–Maclaurin deficit

1. **Global Stieltjes–Maclaurin deficit bound:** Since $V'(s)$ is completely monotone (`STATUS.md` `2.7`), $(-1)^{k-1} V^{(k)}(s) > 0$ for all $k \ge 1$ and $s > 0$. By Taylor's theorem at $s = 0$ with Lagrange remainder:
   - Truncating at degree $3$ ($V^{(4)}(\xi) < 0$) gives $V(s) \le V(0) + V'(0)s + \frac{1}{2}V''(0)s^2 + \frac{1}{6}V'''(0)s^3$ for all $s \ge 0$.
   - Truncating at even degree $6$ ($V^{(7)}(\xi) > 0$) gives $V(s) \ge \sum_{k=0}^6 \frac{V^{(k)}(0)}{k!} s^k$ for all $s \ge 0$; integrating against $e^{-w}\,dw$ ($s = u w$, $\int_0^\infty w^k e^{-w}\,dw = k!$) yields $B(u) \ge \sum_{k=0}^6 V^{(k)}(0) u^k$ for all $u \ge 0$.
   Subtracting the two cancels $V(0) + V'(0)u + V''(0)u^2 + V'''(0)u^3$ identically and yields, via $\mathbb{E}|q|^6 \le 6u^3 + 9u\delta + C_6\delta^{3/2}$ (`3.4`):
   $$D(q) \ge \left(-\frac{V''(0)}{2} - \frac{3}{2}V'''(0)u\right)\delta - \frac{C_6}{6}V'''(0)\delta^{3/2} + V^{(4)}(0)u^4 + V^{(5)}(0)u^5 + V^{(6)}(0)u^6. \tag{5.1}$$
   The derivatives $V^{(k)}(0)$ are computed from exact closed-form `erf`/rational recurrences (`compute_deficit_moments_and_rice_poly`). Exact bivariate Bernstein subdivision (`bernstein_2d`) on (5.1) certifies:
   - $C_A(q)^2 \le \frac{6}{25}D(q) + 10^{-6}$ on $[0, \frac{3}{200}] \times [0, \frac{1}{4}]$ (in $(u, \chi)$),
   - exact $C_A(q)^2 \le \frac{6}{25}D(q)$ on $[\frac{1}{4000}, \frac{3}{250}] \times [\frac{1}{64}, \frac{1}{4}]$, and
   - strict positivity $D(q) > 0$ (`min(bernstein_2d) > 8.12 \times 10^{-10} > 0`) on $[\frac{1}{4000}, \frac{3}{250}] \times [\frac{1}{64}, \frac{49}{100}]$ in a single rectangle.

2. **Algebraically certified pure-Python Rice benchmark $B_{\text{lo}}(u)$:** From `CONTENT_KERNELS.md` Eqs. (3) and (7), $B(u) = \sqrt{\pi}\int_0^\infty \lambda^{-3/2}\sqrt{1 + \lambda u}\,\mu_D(d\lambda)$, with positive moments $M_D[k] := \sqrt{\pi}\int_0^\infty \lambda^{k-3/2}\mu_D(d\lambda) = V^{(k)}(0)/\binom{1/2}{k} > 0$. Let $L_8(y) \in \mathbb{Q}[y]$ be the degree-8 polynomial interpolating $\sqrt{1 + y}$ at $y = 0$ and to first order at the four rational-square nodes $y_j = r_j^2 - 1$ for $r_j \in \{\frac{33}{32}, \frac{9}{8}, \frac{11}{8}, \frac{7}{4}\}$. In `build_radau_sqrt_l8`, `verify_raw_content.py` checks algebraically in $\mathbb{Q}[y]$ that:
   - $(1 + y) - L_8(y)^2 = y \prod_{j=1}^4 (y - y_j)^2 Q_7(y)$ with $Q_7(y) > 0$ on $[0, 4]$ (hence $L_8(y) \le |L_8(y)| \le \sqrt{1 + y}$ on $[0, 4]$), and
   - $-L_8(y) \ge 0$ on $[4, \infty)$ (hence $L_8(y) \le 0 < \sqrt{1 + y}$ on $[4, \infty)$).
   Integrating $L_8(\lambda u) \le \sqrt{1 + \lambda u}$ against $\sqrt{\pi}\lambda^{-3/2}\mu_D(d\lambda) \ge 0$ yields the global one-sided lower bound $B(u) \ge \sum_{k=0}^8 (L_8[k]\,M_D[k])_{\text{lo}}\,u^k$ for all $u \ge 0$ (certifying $B(v_0) - p v_0 > 1.373953503240499$ at $v_0 = \frac{403448}{10^7}$ without Bessel quadrature).

### 5.3 Continuum spectral Stein and Hermite covers (Theorems 3(b), 4(b,c), and 5)

1. **Half-line polynomial verification:** Each of the 79 rational Stein duals in `stein_duals.json` (covering 55 energy nodes from $\frac{3}{250}$ to $\frac{463}{10000}$) is independently accepted on $[0, \infty)$ by `check_stein_node` against `profile-caps.json`, proving $2\mathbb{E}|L + q| \le P_0 + P_1 + P_2(2 + x^2) + P_3(6 + 9x^2 + C_6 x^3)$ ($x = \sqrt{\chi}$, $P_3 \ge 0$) at $u = v$.
2. **Energy-slab interpolation:** Because $V'(s)$ is completely monotone (`STATUS.md` `2.7`), $V'''(s) \ge 0$ and $V''(s) \le 0$ for all $s \ge 0$, hence $|V''(s)| = -V''(s) \le -V''(0)$. Our self-contained outward dyadic interval check (`compute_deficit_moments_and_rice_poly`, exported as `minus_v2_at_zero_enclosure`) verifies $-V''(0) \in [1.672596014280266, 1.672596014280267] < \frac{1673}{1000} =: V_2^{\max}$. Thus for any fixed normalized $Q$ with $\mathbb{E}|Q|^2 = 1$ and $\mathbb{E}|Q|^4 = 2 + x^2$, the map $u \mapsto g_Q(u) := \mathbb{E}[V(u|Q|^2)]$ is concave with $0 \ge g_Q''(u) \ge -V_2^{\max}(2 + x^2)$. On $[u_L, u_R]$:
   - $g_Q(u) - p u$ lies above its endpoint chord by at most $\frac{V_2^{\max}}{8}(2 + x_R^2)(u_R - u_L)^2$ (used in Cover A1 together with $K_A(u) u^3 x^3 \le K_A(u_L) u_R^3 x_R^3$ and endpoint maximization of $c_0 + c_2 x^2 + c_3 x^3$ for $c_3 > 0$).
   - Concavity of $B(u)$ gives $B(u) \ge (1 - \theta)B_{\text{lo}}(u_L) + \theta B_{\text{lo}}(u_R)$ on $[u_L, u_R]$, so $D_Q(u) = B(u) - g_Q(u)$ exceeds the convex combination of endpoint dual lower bounds minus $\frac{V_2^{\max}}{8}(2 + x_R^2)(u_R - u_L)^2$. On each slab endpoint $u_{\text{end}} \in \{u_L, u_R\}$, `certify_stein_deficit_slabs` checks exact 1D Bernstein nonnegativity on $[x_L, x_R]$ of:
     - $\frac{6}{25}(B_{\text{lo}}(u_{\text{end}}) - F_{\text{dual}}(u_{\text{end}}, x)) + \eta_q - \frac{6}{25}\cdot\frac{V_2^{\max}}{8}(2 + x_R^2)(u_R - u_L)^2 - K_A(u_L) u_R^3 x^3 \ge 0$ (with $\eta_q = 10^{-6}$ for Cover B and $\eta_q = 0$ for Cover C), and
     - **strict** Bernstein positivity $> 0$ of $B_{\text{lo}}(u_{\text{end}}) - F_{\text{dual}}(u_{\text{end}}, x) - \frac{V_2^{\max}}{8}(2 + x_R^2)(u_R - u_L)^2 > 0$ for Cover D (Theorem 5).
3. **Gap-free partition verification:** `verify_partition` checks exact rational containment, pairwise interior disjointness, total area equality, and strip-by-strip interval contiguity on every cover.

---

## 6. Certified constants and replay instructions

Replay from any clean checkout using isolated standard-library Python 3 (zero external packages):

```bash
python3 -I research/conjecture-K/code/raw-content-2026-11-17-gemini-5331/verify_raw_content.py
```

Expected runtime is ~4.5 seconds; output matches `verify_raw_content_result.json` (`status: "PASS"`, `negative_controls_passed: 5`). Running with `-O` raises `RuntimeError`.

| Quantity / Certificate | Certified value / domain | Margin / Upper bound |
|---|---|---|
| Peak $M_0^A = -g_A(0)$, $M_1^A = g_A'(0)$ | $[0.835135932614129, \dots130]$, $[2.159180864970276, \dots277]$ | 220-bit outward interval |
| Peak $-V''(0) \ge \sup_{s \ge 0}|V''(s)|$ | $[1.672596014280266, 1.672596014280267]$ | $< \frac{1673}{1000} = 1.673$ (`2.7`) |
| Peak $K_A(0) = \frac{3\sqrt{6}}{4}g_A'(0)^2$ | $[8.564754800975330, 8.564754800975331]$ | $< \frac{5353}{625} = 8.5648$ |
| Peak $K_B(0) = \frac{3\sqrt{6}}{4}g_B'(0)^2$ | $[1.957341342937411, 1.957341342937412]$ | $< \frac{9801}{5000} = 1.9602$ |
| Flank $K_A(0)$, $K_B(0)$ | $< \frac{427}{50} = 8.54$, $< \frac{77}{40} = 1.925$ | `verify_raw_content.py` |
| Upper $K_A(0)$, $K_B(0)$ | $< \frac{1493}{200} = 7.465$, $< \frac{167}{100} = 1.67$ | `verify_raw_content.py` |
| Peak $K_A(u)$ upper caps ($u \ge 0.01, 0.02, 0.03, 0.035, 0.04, 0.044$) | $\frac{3577}{500}, \frac{6117}{1000}, \frac{5323}{1000}, 5, \frac{471}{100}, \frac{9}{2}$ | Radau $Q_4$ upper bounds (upper endpoint only) |
| Peak $\gamma_{\text{univ}}^A = \frac{32}{225\pi a^4}$ | $[0.462965828107072, 0.462965828107073]$ | $< \frac{58}{125} = 0.464$ |
| Peak low-influence $C_{\text{inf}}$ | $[5.065170797456077, 5.065170797456078]$ | $< \frac{507}{100}$ ($\tau_{\max} \le \frac{1}{455} \implies \chi \le \frac{10}{91}$) |
| Zero-dual closure of `6.1.5` | $[0, \frac{463}{10000}] \times [0, \frac{9}{100}]$ ($\chi \le 0.09$) | slack $> 4.008 \times 10^{-6}$ |
| Cover A1 ($\Lambda + \frac{25}{6}C_A^2 < S + 10^{-4}$) | $[0, \frac{463}{10000}] \times [0, \frac{1}{4}]$ (101 boxes) | slack $> 2.665 \times 10^{-7}$ |
| Cover A2 ($\Lambda + \frac{25}{6}C_A^2 < S + 10^{-4}$) | $[0, \frac{1}{50}] \times [0, \frac{49}{25}]$ (4 boxes) | slack $> 6.620 \times 10^{-5}$ |
| Cover B (signed $C_A^2 \le \frac{6}{25}D(q) + 10^{-6}$) | $[0, \frac{463}{10000}] \times [0, \frac{841}{10000}]$ (55 boxes) | min Stein-slab margin $> 1.740 \times 10^{-7}$ |
| Cover C (exact $C_A^2 \le \frac{6}{25}D(q)$) | $(0, \frac{463}{10000}]\times[0,10^{-4}]$, $[0,\frac{1}{4000}]\times[0,42]$, $[\frac{1}{4000},\frac{3}{250}]\times[\frac{1}{64},\frac{49}{625}]$, $[\frac{3}{250},\frac{463}{10000}]\times[\frac{49}{10000},\frac{49}{625}]$ | min Stein-slab margin $> 7.421 \times 10^{-8}$ |
| Cover D (strict $D(q) > 0$, row `3.29`) | $[\frac{1}{4000},\frac{3}{250}]\times[\frac{1}{64},\frac{49}{100}]$, $[\frac{3}{250},\frac{463}{10000}]\times[\frac{49}{10000},\frac{49}{100}]$ (plus `3.19`) | Maclaurin $> 8.12 \times 10^{-10}$; min Stein-slab $> 2.141 \times 10^{-7}$ |
