# Independent Level C Clean-Room Replay of the Degree-5 Law Layer and Small-$t$ Certificate (`#625`, ATK P4)

- **Agent-ID:** `gemini-21d5`
- **Date:** 26 November 2026
- **Scope:** Issue `#625` ([`P4-replay-conditional-certificate.md`](../degree5-attack-2026-11-25/problems/P4-replay-conditional-certificate.md), **Level C** completed in full, together with exact rational primal lower bounds in $\mathcal{L}$ and exact rational envelope assembly), plus clean-room certification of the 26 plain-cover law caps at $\rho_0 = 2287/2500$ (`STATUS 4.42` and Hypothesis `H4` of `STATUS 4.45`).

---

## 0. Executive Summary and Verdicts

We independently re-derive and certify the degree-5 law-layer caps, small-$t$ bound, sanity checks, negative controls, and exact rational envelopes for the capped degree-5 Hermite projection game
$$
T = P_{1,0} - \varepsilon_1 P_{2,1} + \eta P_{3,2}, \qquad \varepsilon_1 = \frac{39}{50}, \quad \eta = \frac{779}{10000}, \qquad \text{target } \tau = \frac{500}{701} \approx 0.7132667618,
$$
using a **clean-room outward-rounded C++17 interval certifier** ([`certify_law_caps.cpp`](../../code/degree5-law-replay-gemini-21d5/certify_law_caps.cpp)) and a **zero-dependency pure Python 3 standard-library verifier** ([`verify_law_caps.py`](../../code/degree5-law-replay-gemini-21d5/verify_law_caps.py)) that share **zero code** and **zero precomputed node caps or covers** with the certificate author's (`claude-b9ee`) pipeline (`CERT2` / `SMALLT` / `DSGN`). Furthermore, `certify_law_caps.cpp` makes **zero calls to any `libm` transcendental function** (`asin`, `acos`, `atan`, `sin`, `cos`, `tan`, `exp`, `log`, `pow`), statically enforced by regex source audit in `verify_law_caps.py`, eliminating the 4-ulp `libm` `arcsin` assumption noted in `STATUS 4.17` and `4.18(b)`.

### Verdicts on Claims 1–4 of P4 and `STATUS 4.42` / `H4`

| Item | Statement | Verdict | Grade |
|---|---|---|---|
| **Claim 1** (P4 §2) | Five-step gate-free row inequality $V \le t^2 - 2\ell t + 2\beta^2/\varepsilon_1 + (b_A^2 + b_B^2)\|q\|_2^2/\eta + \Lambda_5(G_3, G_5)$, reduction under $K_5(\eta_5)$ to $G_r^+$, joint convexity/Lipschitz properties of $\Psi_5(s;\nu)$, and compact $(\sigma,\nu)$ domain cutoffs | **Confirmed** | **P** (written out in §1; also independently proved in `SECBUD`, [`../sector-budget-codex-a7c4/PROOF.md`](../sector-budget-codex-a7c4/PROOF.md)) |
| **Claim 2** (P4 §§2–3) | Upper bounds $G_r^+ + 2\beta_r^2/\varepsilon_1 \le C_r$ across all **29 rows** of [`rows2b.json`](../../code/degree5-attack/rows2b.json) at $\rho = 95133/100000$ (`29` plain covers over `(L1)–(L4)` and `5` Stein covers over `(L1)–(L5)` on `0.125L`–`0.300L`, **with zero `libm` `arcsin`**) | **Confirmed** on all 29 rows (`34/34` covers satisfy $C_{\mathrm{cert}} \le C_r$, bracketed from below by `29/29` exact rational primal witnesses $C_{\mathrm{lb}} \in \mathcal{L}$) | **C** (independent cross-family clean-room confirmation of `CERT2` / `STATUS 4.17`, removing the `libm` `arcsin` assumption; `C, author only` for this certifier alone) |
| **`STATUS 4.42` / `H4`** | Plain-cover law caps $G_r^+ + 2\beta_r^2/\varepsilon_1 \le C_r^{(2c)}$ across all **26 rows** (`0.250L`–`0.886`) of [`rows2c_final.json`](../../code/degree5-design/design-2026-11-25/certB_const/out/rows2c_final.json) at $\rho_0 = 2287/2500$ (`(L1)–(L4)` only, no Stein cuts) | **Confirmed** on all 26 rows (`26/26` covers satisfy $C_{\mathrm{cert}}^{(2c)} \le C_r^{(2c)}$, bracketed from below by `26/26` exact rational primal witnesses) | **C** (independent cross-family clean-room confirmation of `DSGN` §2 / `STATUS 4.42` / `H4` of `4.45`) |
| **Claim 3** (P4 §2, `SMALL_T.md`) | Direct small-$t$ bound $V \le \frac{2}{5}t^2 + \frac{7058083}{10^7}$ for all unimodular pairs, with no sector hypothesis | **Confirmed** by **two independent proofs**: (i) clean-room zero-`arcsin` 39-node Stein/moment cover certifying $N(3/5) \le 0.7057642321 \le 0.7058083$; (ii) elementary cover-free deduction from Lean-proved cubic mass and witness caps | **P + C** (removes the `libm` `arcsin` assumption in `STATUS 4.18(b)`; elementary proof matches `SECBUD`) |
| **Claim 4** (P4 §§2–3) | Exact rational envelopes and rooms on $[0, 886227/10^6]$ for `rows2b.json` (Stein $t_1 = 7967/125000$ and plain $t_1 = 57297/500000$), `rows2c_final.json` ($t_1 = 6213/31250$), and all 21 pieces of Design `D*` (`STATUS 4.44`) | **Confirmed digit-for-digit** ($B_5^{\mathrm{cert}} \le 0.7128902286 \le B_5 \le 0.7128940127$, room $\ge 3.7274\times 10^{-4}$; `rows2c` $B_{\mathrm{cert}}^{(2c)} \le 0.7128915468 \le B^{(2c)} \le 0.7128931981$, room $\ge 3.7356\times 10^{-4}$; `D*` 21-piece min room $\ge 3.7413\times 10^{-4}$ certified, $\ge 3.7356\times 10^{-4}$ published) | **P + C** (exact `Fraction` arithmetic in `verify_law_caps.py`) |

**Relation to `SECBUD` (`STATUS 4.40`).** Confirming Claims 1–4 establishes unconditionally that *if* $K_5(\eta_5(r))$ holds with $\eta_5(r) \le \operatorname{room}(r)$ on every row, then $V \le 500/701$, and confirms every published law cap $C_r$ as a rigorous upper bound on $G_r^+ + 2\beta_r^2/\varepsilon_1$. As proved independently in `SECBUD` (`STATUS 4.40`), on $t \in [1/4, 5/12]$ the unrestricted own-remote-cubic sector comparison $K_5$ is too stringent for $q = 0$ transverse pairs in $\mathbb{C}^{130}$ (even though Claim 1's unrelaxed row bound on row `0.250L` remains $> 0.172$ below $500/701$ there). In the updated assembly architecture `D*` (`STATUS 4.44–4.45`), the row constants $C_r^{(2c)}$ of `STATUS 4.42` certified here are invoked only on $[t_s, \sqrt{\pi}/2]$ with $t_s = 649/1000$.

---

## 1. Derivation of Claim 1, Properties of $\Psi_5$, and Outer-Domain Bounds

### 1.1 Setting and Wick Orthonormality

Let $z = (z_1, \dots, z_n) \sim \mathcal{CN}(0, I_n)$ have density $\pi^{-n} e^{-\|z\|^2}$ on $\mathbb{C}^n$, with inner product $\langle X, Y \rangle = \mathbb{E}[\overline{X} Y]$ (conjugate-linear in the first slot). For a single standard complex Gaussian $z_1$ with $T = |z_1|^2 \sim \mathrm{Exp}(1)$ ($\mathbb{E}[T^k] = k!$), the normalised one-variable Wick polynomials in $H_{a,b}(\mathbb{C})$ are
$$
e_{10}(z_1) = z_1, \quad e_{11}(z_1) = T - 1, \quad e_{20}(z_1) = \frac{z_1^2}{\sqrt{2}}, \quad e_{21}(z_1) = \frac{z_1(T - 2)}{\sqrt{2}}, \quad e_{32}(z_1) = \frac{z_1(T^2 - 6T + 6)}{\sqrt{12}}.
$$
Pairwise orthogonality holds across distinct bidegrees $(a,b)$ by phase invariance $z_1 \mapsto e^{i\phi} z_1$ whenever $a - b$ differs, and by Laguerre orthogonality when $a - b$ agrees; unit norms follow directly from $\mathbb{E}[T^k] = k!$:
- $\|e_{11}\|_2^2 = \mathbb{E}[(T-1)^2] = 2 - 2 + 1 = 1$;
- $\|e_{20}\|_2^2 = \frac{1}{2}\mathbb{E}[T^2] = 1$;
- $\|e_{21}\|_2^2 = \frac{1}{2}\mathbb{E}[T(T-2)^2] = \frac{1}{2}(6 - 8 + 4) = 1$;
- $\|e_{32}\|_2^2 = \frac{1}{12}\mathbb{E}[T(T^2 - 6T + 6)^2] = \frac{1}{12}(120 - 288 + 144 + 72 - 72 + 36) = 1$.

For measurable unimodular $f, g : \mathbb{C}^n \to \mathbb{C}$ ($|f| = |g| = 1$ a.e.), put
$$
h = \frac{f + g}{2}, \qquad k = \frac{f - g}{2}, \qquad f = h + k, \qquad g = h - k, \qquad t = \|P_{1,0} h\|_2.
$$
By $U(n)$-invariance of $\mathcal{CN}(0, I_n)$ and of every chaos projector $P_{a,b}$, choose an orthonormal frame $(z_1, w)$ with $w = (z_2, \dots, z_n)$ such that $P_{1,0} h = t z_1$ (if $t = 0$, any frame suffices; then $\langle z_1, h \rangle = \langle z_1, P_{1,0} h \rangle = t \ge 0$). By Cauchy–Schwarz and $|h| \le 1$, $t = \mathbb{E}[\bar z_1 h] \le \mathbb{E}|z_1| = \frac{\sqrt{\pi}}{2} = 0.88622692545\dots < \frac{886227}{10^6}$.

### 1.2 Self-Adjoint Expansion of $V$ and Norm of the Multiplier $C$

Each chaos projector $P_{a,b}$ is orthogonal and self-adjoint, so $T = P_{1,0} - \varepsilon_1 P_{2,1} + \eta P_{3,2}$ is self-adjoint. Consequently $\operatorname{Re}\langle h, T k \rangle - \operatorname{Re}\langle k, T h \rangle = \operatorname{Re}\langle h, T k \rangle - \operatorname{Re}\overline{\langle h, T k \rangle} = 0$, and therefore
$$
\begin{aligned}
V = \operatorname{Re}\langle f, T g \rangle
&= \operatorname{Re}\langle h + k, T(h - k) \rangle = \langle h, T h \rangle - \langle k, T k \rangle \\
&= t^2 - \varepsilon_1 \|P_{2,1} h\|_2^2 + \eta \|P_{3,2} h\|_2^2 - \|P_{1,0} k\|_2^2 + \varepsilon_1 \|P_{2,1} k\|_2^2 - \eta \|P_{3,2} k\|_2^2.
\end{aligned}
$$

Fix a rational row $r = (\ell, \beta, b_A, b_B)$. Define
$$
B = \beta \sqrt{2}\, e_{21}(z_1) = \beta z_1(|z_1|^2 - 2) \in H_{2,1}, \qquad L(z_1) = \ell z_1 + B = z_1\big(\ell + \beta(|z_1|^2 - 2)\big),
$$
with $\|B\|_2^2 = 2\beta^2$. Set $G_3 = \varepsilon_1 P_{2,1} k \in H_{2,1}(\mathbb{C}^n)$, $G_5 = \eta P_{3,2} h \in H_{3,2}(\mathbb{C}^n)$, and let $q(w) = \mathbb{E}[G_3 \mid w]$ be the conditional expectation onto the remote coordinates $w$. Writing $G_3$ in the tensor basis $e_{a_1, b_1}(z_1) \otimes P_{\alpha, \beta}(w)$ with $a_1 + |\alpha| = 2$, $b_1 + |\beta| = 1$, taking $\mathbb{E}[\,\cdot \mid w]$ annihilates every term with $(a_1, b_1) \ne (0,0)$ because $\mathbb{E}[e_{a_1, b_1}(z_1)] = 0$, leaving $q \in H_{2,1}(\mathbb{C}^{n-1})$. Now set
$$
C = b_A q(w) e_{11}(z_1) + b_B \overline{q(w)} e_{20}(z_1).
$$
Since $q \in H_{2,1}(w)$ implies $\bar q \in H_{1,2}(w)$, we have $q(w) e_{11}(z_1) \in H_{1,1}(z_1) \otimes H_{2,1}(w) \subset H_{3,2}(\mathbb{C}^n)$ and $\overline{q(w)} e_{20}(z_1) \in H_{2,0}(z_1) \otimes H_{1,2}(w) \subset H_{3,2}(\mathbb{C}^n)$. By independence of $z_1$ and $w$ together with $\langle e_{11}, e_{20} \rangle = 0$ and $\|e_{11}\|_2 = \|e_{20}\|_2 = 1$,
$$
\|C\|_2^2 = b_A^2 \|q\|_2^2 \|e_{11}\|_2^2 + b_B^2 \|\bar q\|_2^2 \|e_{20}\|_2^2 + 2 b_A b_B \operatorname{Re}\big(\mathbb{E}[q^2]\,\langle e_{11}, e_{20} \rangle\big) = (b_A^2 + b_B^2)\|q\|_2^2.
$$

### 1.3 Five-Step Proof of Claim 1 and Law Reduction

1. **Step (i) ($P_{2,1} h$ square completion):** Since $B \in H_{2,1}$, $\langle B, P_{2,1} h \rangle = \langle B, h \rangle$. Expanding $0 \le \varepsilon_1 \|P_{2,1} h + B/\varepsilon_1\|_2^2 = \varepsilon_1 \|P_{2,1} h\|_2^2 + 2\operatorname{Re}\langle B, h \rangle + \|B\|_2^2/\varepsilon_1$ and using $\|B\|_2^2 = 2\beta^2$ gives
   $$
   -\varepsilon_1 \|P_{2,1} h\|_2^2 \le 2\operatorname{Re}\langle B, h \rangle + \frac{2\beta^2}{\varepsilon_1}.
   $$
2. **Step (ii) ($P_{1,0} k$ drop):** $-\|P_{1,0} k\|_2^2 \le 0$.
3. **Step (iii) ($G_3$ and $G_5$ Legendre identities):** Since $G_3 = \varepsilon_1 P_{2,1} k$ and $P_{2,1}$ is an orthogonal projection, $\operatorname{Re}\langle G_3, k \rangle = \operatorname{Re}\langle G_3, P_{2,1} k \rangle = \varepsilon_1 \|P_{2,1} k\|_2^2 = \|G_3\|_2^2 / \varepsilon_1$, so
   $$
   \varepsilon_1 \|P_{2,1} k\|_2^2 = 2\operatorname{Re}\langle G_3, k \rangle - \frac{\|G_3\|_2^2}{\varepsilon_1}, \qquad \eta \|P_{3,2} h\|_2^2 = 2\operatorname{Re}\langle G_5, h \rangle - \frac{\|G_5\|_2^2}{\eta}.
   $$
4. **Step (iv) ($P_{3,2} k$ multiplier completion):** Since $C \in H_{3,2}$, $\langle C, P_{3,2} k \rangle = \langle C, k \rangle$. Expanding $0 \le \eta \|P_{3,2} k - C/\eta\|_2^2 = \eta \|P_{3,2} k\|_2^2 - 2\operatorname{Re}\langle C, k \rangle + \|C\|_2^2/\eta$ gives
   $$
   -\eta \|P_{3,2} k\|_2^2 \le -2\operatorname{Re}\langle C, k \rangle + \frac{(b_A^2 + b_B^2)\|q\|_2^2}{\eta}.
   $$
5. **Step (v) (Recombination and unimodular pairing):** Since $\langle z_1, h \rangle = t$, we have $t^2 = t^2 - 2\ell t + 2\operatorname{Re}\langle \ell z_1, h \rangle$. Summing Steps (i)–(iv) with $L = \ell z_1 + B$ yields
   $$
   V \le t^2 - 2\ell t + \frac{2\beta^2}{\varepsilon_1} + \frac{(b_A^2 + b_B^2)\|q\|_2^2}{\eta} + 2\operatorname{Re}\langle L + G_5, h \rangle + 2\operatorname{Re}\langle G_3 - C, k \rangle - \frac{\|G_3\|_2^2}{\varepsilon_1} - \frac{\|G_5\|_2^2}{\eta}.
   $$
   Writing $2h = f + g$ and $2k = f - g$, we have the algebraic identity
   $$
   2\operatorname{Re}\langle L + G_5, h \rangle + 2\operatorname{Re}\langle G_3 - C, k \rangle = \operatorname{Re}\langle L + G_5 + G_3 - C, f \rangle + \operatorname{Re}\langle L + G_5 - G_3 + C, g \rangle.
   $$
   Because $|f| = |g| = 1$ a.e., $\operatorname{Re}\langle X, f \rangle \le \mathbb{E}|X|$ and $\operatorname{Re}\langle Y, g \rangle \le \mathbb{E}|Y|$, giving Claim 1:
   $$
   V \le t^2 - 2\ell t + \frac{2\beta^2}{\varepsilon_1} + \frac{(b_A^2 + b_B^2)\|q\|_2^2}{\eta} + \Lambda_5(G_3, G_5).
   $$

**Reduction to $G_r^+$ under $K_5(\eta_5)$.** Write $q(w) = |q(w)| e^{i\alpha(w)}$. Conditioned on $w$, rotate the visible Gaussian by $z_1 = e^{i\alpha(w)} z_1'$ ($z_1' \sim \mathcal{CN}(0,1)$). Using $L(e^{i\alpha} z_1') = e^{i\alpha} L(z_1')$, $e_{32}(e^{i\alpha} z_1') = e^{i\alpha} e_{32}(z_1')$, $e_{11}(e^{i\alpha} z_1') = e_{11}(z_1')$, and $\bar q e_{20}(e^{i\alpha} z_1') = |q| e^{-i\alpha} e^{2i\alpha} e_{20}(z_1') = e^{i\alpha} |q| e_{20}(z_1')$, the phase $e^{i\alpha}$ factors out of the modulus:
$$
\mathbb{E}_{z_1}\big(|L + \nu e_{32} + q - C| + |L + \nu e_{32} - q + C|\big) = \Psi_5(|q|; \nu), \qquad D(z_1) = 1 - b_A e_{11}(z_1) - b_B e_{20}(z_1).
$$
Assuming $K_5(\eta_5)$ and setting $\sigma = \|q\|_2$ and $\kappa_r = \frac{1}{\varepsilon_1} - \frac{b_A^2 + b_B^2}{\eta}$, the two $\|q\|_2^2$ terms combine into $-\kappa_r \sigma^2$:
$$
\frac{(b_A^2 + b_B^2)\|q\|_2^2}{\eta} + \Lambda_5(G_3, G_5) \le \sup_{\nu \in \mathbb{R}}\big[\mathbb{E}_w \Psi_5(|q|; \nu) - \nu^2/\eta\big] - \kappa_r \sigma^2 + \eta_5.
$$
When $\sigma > 0$, $U = |q|^2 / \sigma^2$ belongs to the remote-cubic law class $\mathcal{L}$ (`STATUS 3.7` and the project's Lean moment theorems). When $\sigma = 0$ (including $n \le 1$, where the remote block is empty), $\sigma \sqrt{U} = 0$ for every law, and taking $U = |G|^2 \sim \mathrm{Exp}(1)$ for $G \sim \mathcal{CN}(0,1)$ gives an admissible witness in $\mathcal{L}$ ($\mathbb{E}U = 1$, $\mathbb{E}U^2 = 2 \in [2,44]$, $\mathbb{E}U^3 = 6 \le 6$, $\mathbb{E}\sqrt{U} = \sqrt{\pi}/2 < 2287/2500 < 95133/100000$, and for `(L5)` with $X = \operatorname{Re}G \sim \mathcal{N}(0, 1/2)$, Gaussian integration by parts $\mathbb{E}[X W(X)] = \frac{1}{2}\mathbb{E}[w(X)]$ yields $\mathbb{E}[h_{w,\mu}(X)] = -\mathbb{E}[w(X)^2]/(2\mu) \le 0 = \mu(2-2)/24$). Hence $\frac{(b_A^2 + b_B^2)\|q\|_2^2}{\eta} + \Lambda_5(G_3, G_5) \le G_r^+ + \eta_5$.

### 1.4 Convexity, Evenness, Lipschitz Constants, and Compact Parameter Domain

1. **Symmetry and evenness:** Under $z_1 \mapsto -z_1$ (which preserves $\mathcal{CN}(0,1)$), $L(-z_1) = -L(z_1)$, $e_{32}(-z_1) = -e_{32}(z_1)$, and $D(-z_1) = D(z_1)$ because $e_{11}(z_1) = |z_1|^2 - 1$ and $e_{20}(z_1) = z_1^2/\sqrt{2}$ are even. Thus $|-L - \nu e_{32} \pm s D| = |L + \nu e_{32} \mp s D|$, so the two expectations in $\Psi_5(s;\nu)$ are equal, $\Psi_5(-s;\nu) = \Psi_5(s;\nu)$, and $\Psi_5(s;\nu) = 2\mathbb{E}_{z_1}|L(z_1) + \nu e_{32}(z_1) + s D(z_1)|$.
2. **Joint convexity:** For each fixed $z_1 \in \mathbb{C}$, $(s,\nu) \mapsto |L(z_1) + \nu e_{32}(z_1) + s D(z_1)|$ is the Euclidean norm of an affine map $\mathbb{R}^2 \to \mathbb{C} \cong \mathbb{R}^2$, hence jointly convex in $(s,\nu)$. Integrating against the positive density $\pi^{-1} e^{-|z_1|^2}$ preserves joint convexity on $\mathbb{R}^2$.
3. **Global Lipschitz bounds:** By the reverse triangle inequality $\big||A_1| - |A_2|\big| \le |A_1 - A_2|$ (which holds everywhere, including at zeros of the integrand) and Cauchy–Schwarz,
   $$
   |\Psi_5(s_1;\nu) - \Psi_5(s_2;\nu)| \le 2|s_1 - s_2|\,\mathbb{E}|D(z_1)| \le 2\sqrt{\mathbb{E}|D(z_1)|^2}\,|s_1 - s_2| = L_s |s_1 - s_2|, \qquad L_s := 2\sqrt{1 + b_A^2 + b_B^2},
   $$
   since $1, e_{11}, e_{20}$ are orthonormal in $L^2(\mathcal{CN}(0,1))$, and similarly
   $$
   |\Psi_5(s;\nu_1) - \Psi_5(s;\nu_2)| \le 2|\nu_1 - \nu_2|\,\mathbb{E}|e_{32}(z_1)| \le 2\|e_{32}\|_2 |\nu_1 - \nu_2| = 2|\nu_1 - \nu_2|.
   $$
4. **Compact $(\sigma, \nu)$ domain:** Fix any law of $U$ satisfying $\mathbb{E}\sqrt{U} \le \rho$ and let $F(\sigma, \nu) = \mathbb{E}[\Psi_5(\sigma\sqrt{U}; \nu)] - \kappa_r \sigma^2 - \nu^2/\eta$.
   - *Outer $\sigma$ cutoff:* Since $\Psi_5(\sigma\sqrt{U}; \nu) - \Psi_5(0; \nu) \le L_s \sigma \sqrt{U}$, taking expectations gives
     $$
     F(\sigma, \nu) - F(0, \nu) \le L_s \rho \sigma - \kappa_r \sigma^2 = \sigma(L_s \rho - \kappa_r \sigma) \le 0 \qquad \forall\, \sigma \ge \sigma_{\max}(r) := \frac{L_s \rho}{\kappa_r}.
     $$
     Both `certify_law_caps.cpp` and `verify_law_caps.py` verify in exact rational/interval arithmetic across all 29 rows that $\kappa_r > 1.227 > 0$ and $\sigma_{\max}(r) < 1.558 < \frac{13}{8} = 1.625 = \Sigma_{\max}$.
   - *Outer $\nu$ cutoff:* For $|\nu| \ge \eta$, let $\nu_0 = \operatorname{sgn}(\nu)\eta$. Then $|\Psi_5(s;\nu) - \Psi_5(s;\nu_0)| \le 2(|\nu| - \eta)$, so
     $$
     F(\sigma, \nu) - F(\sigma, \nu_0) \le 2(|\nu| - \eta) - \frac{\nu^2 - \eta^2}{\eta} = -\frac{(|\nu| - \eta)^2}{\eta} \le 0.
     $$
     Hence $\sup_{\nu \in \mathbb{R}} F(\sigma,\nu) = \sup_{\nu \in [-\eta, \eta]} F(\sigma,\nu)$, and our $\nu$-grids span $[-164/2048, +164/2048] = [-0.080078125, +0.080078125] \supset [-\eta, \eta]$.

---

## 2. Clean-Room Zero-`libm` Interval and Dual/Primal Architecture

### 2.1 Directed-Rounding Arithmetic and Bracket-Verified `arcsin` (`Zero Transcendental libm`)

In [`certify_law_caps.cpp`](../../code/degree5-law-replay-gemini-21d5/certify_law_caps.cpp) (§2), the interval type `I = [l, h]` applies outward 1-ulp IEEE-754 bounds (`std::nextafter`) to correctly rounded IEEE-754 binary64 `+`, `-`, `*`, `/`, and `std::sqrt` compiled with `-ffp-contract=off` (avoiding compiler `FENV_ACCESS` reordering hazards across worker threads), together with exact dyadic `std::nearbyint` / `std::scalbn`. No `libm` transcendental function is called anywhere in the file:
- $\pi$ is enclosed to width $< 10^{-15}$ from Machin's identity $\pi = 16\arctan(1/5) - 4\arctan(1/239)$ with alternating series remainders.
- $e^{-x}$ ($x \ge 0$) is enclosed via range reduction $x = k\ln 2 + r$, $|r| \le \frac{1}{2}\ln 2$, degree-18 alternating/monotone Taylor remainder, and exact `std::scalbn(..., -k)`.
- $\sin x, \cos x$ on $[0, \pi]$ are reduced via $[0, \pi/4]$ Taylor polynomials of degree $15/16$ with explicit alternating truncation error bounds.
- **Zero-`libm` `verified_asin_0_1(u)` and `verified_acos_0_1(u)`:** On $[0, 1]$, we evaluate a pure polynomial/sqrt seed (Taylor polynomial of degree 17 for $u \le 1/\sqrt{2}$, and $\pi/2 - \arcsin\sqrt{1 - u^2}$ for $u > 1/\sqrt{2}$), expand by a tiny initial bracket, and **verify monotonically on every call** via `sincos_0_pi` that
  $$
  0 \le \theta_{\mathrm{lo}} \le \theta_{\mathrm{hi}} \le \frac{\pi}{2}, \qquad \sin_{\mathrm{lo}}(\theta_{\mathrm{lo}}) \le u_{\mathrm{lo}}, \qquad \sin_{\mathrm{hi}}(\theta_{\mathrm{hi}}) \ge u_{\mathrm{hi}}.
  $$
  Because $\sin$ is strictly increasing on $[0, \pi/2]$, those two verified inequalities *alone* constitute a complete, `libm`-free mathematical proof that $\arcsin([u_{\mathrm{lo}}, u_{\mathrm{hi}}]) \subseteq [\theta_{\mathrm{lo}}, \theta_{\mathrm{hi}}]$ (width $< 5\times 10^{-14}$ across all $1001$ startup self-test points).

### 2.2 2D Polar Enclosure of $\Psi_5(s; \nu)$ (`GL3PolarEngine`)

Writing $z_1 = r e^{i\theta}$ ($r \ge 0$, $T = r^2$), conjugation symmetry $z_1 \mapsto \bar z_1$ reduces the integral to $\theta \in [0, \pi]$:
$$
\Psi_5(s; \nu) = \frac{4}{\pi} \int_0^\pi \int_0^\infty r e^{-r^2} \sqrt{Q(r, \theta; s, \nu)}\, dr\, d\theta,
$$
where $A + i B := e^{-i\theta}\big(L(r e^{i\theta}) + \nu e_{32}(r e^{i\theta}) + s D(r e^{i\theta})\big)$ has real and imaginary parts
$$
A(r,\theta) = r g_\nu(r^2) + s\big((1 - b_A(r^2 - 1))\cos\theta - \tfrac{b_B}{\sqrt{2}} r^2 \cos\theta\big), \quad B(r,\theta) = -s\big((1 - b_A(r^2 - 1))\sin\theta + \tfrac{b_B}{\sqrt{2}} r^2 \sin\theta\big),
$$
and $Q = A^2 + B^2 \ge 0$.
- **Analytical radial tail ($r \ge R_{\max} = 6.5$, $T_{\max} = 42.25$):** Using $|L + \nu e_{32} + s D| \le |\ell|\sqrt{T} + |\beta|T^{3/2} + \frac{|\nu|}{\sqrt{12}}(T^{5/2} + 6 T^{1/2}) + s\big(1 + |b_A|T + \frac{|b_B|}{\sqrt{2}}T\big)$ and exact incomplete Gamma upper bounds on $[T_{\max}, \infty)$, the tail integral above $r = 6.5$ is $< 2\times 10^{-15}$ and added outward to every node enclosure.
- **Interior adaptive polar cells on $[0, 6.5] \times [0, \pi]$:** On each cell $[r_0, r_1] \times [\theta_0, \theta_1]$:
  - Whenever the interval enclosure of $Q$ on the cell satisfies $Q_{\mathrm{lo}} > 0$, $\sqrt{Q}$ is smooth; we integrate along $r$ and $\theta$ by the $3\times 3$ tensor Gauss–Legendre rule (exact through degree 5) and bound the $r$- and $\theta$-quadrature errors rigorously via univariate degree-6 interval Taylor jets (`Jet<6>`) and the Peano kernel constant $\frac{1}{15750} = \frac{2^7 (3!)^4}{7! (6!)^3}$ on $[-1, 1]$: $\big|\int_{a}^{b} \phi(t)\,dt - \mathrm{GL}_3(\phi)\big| \le \frac{(b-a)^7}{2^6 \cdot 15750} \cdot 6! \sup_{[a,b]} |[\phi]_6|$.
  - Near roots of $Q$ ($Q_{\mathrm{lo}} = 0$), where $\sqrt{Q}$ is non-smooth, cells are adaptively subdivided and enclosed directly by outward interval bounds on $r e^{-r^2}\sqrt{[0, Q_{\mathrm{hi}}]}$.
  - Batch evaluation along $s$-intervals $[s_b, s_e]$ reuses cell subdivisions across nearby $s$-nodes while keeping every node enclosure rigorous to width $\sim 10^{-10}$.

### 2.3 Plain Covers (`(L1)–(L4)`), Zero-`Arcsin` Stein Covers (`(L1)–(L5)`), and Primal Witnesses

1. **Plain polynomial majorants (`rows2b` all 29 rows; `rows2c` all 26 rows):** On a slice $\nu_j$, a majorant $p(s) = a_0 + a_1 s + a_2 s^2 + a_4 s^4 + a_6 s^6$ with $a_1, a_6 \ge 0$ is verified against $\Psi_5(s; \nu_j)$ on $[0, \infty)$ by:
   - On each grid panel $[s_i, s_{i+1}] \subset [0, S_R]$ ($S_R = 6$): since $\Psi_5(\cdot; \nu_j)$ is convex, $\Psi_5(s; \nu_j)$ lies below the chord joining $(s_i, \mathrm{cap}_i^{\mathrm{hi}})$ and $(s_{i+1}, \mathrm{cap}_{i+1}^{\mathrm{hi}})$; decomposing $p''(s) = p_+''(s) - p_-''(s)$ into positive and negative monomials bounds the chord sag of $p$ on $[s_i, s_{i+1}]$ in closed form.
   - On the ray $[S_R, \infty)$: verifying $a_6 \ge 0$, $p^{(4)}(S_R)/24 = a_4 + 15 a_6 S_R^2 \ge 0$, $p^{(3)}(S_R)/6 \ge 0$, $p''(S_R)/2 \ge 0$, $p'(S_R) \ge L_s^{\mathrm{hi}}$, and $p(S_R) \ge \mathrm{cap}(S_R)^{\mathrm{hi}}$ proves $p(s) \ge \mathrm{cap}(S_R)^{\mathrm{hi}} + L_s(s - S_R) \ge \Psi_5(s; \nu_j)$ for all $s \ge S_R$.
   - Under `(L1)–(L4)` with $x = \sqrt{m - 2} \in [0, \sqrt{42}]$ ($\sqrt{42} < 415/64 = X_{\max}$), $\mathbb{E}[p(\sigma\sqrt{U})] \le a_0 + a_1 \rho \sigma + a_2 \sigma^2 + a_4(2 + x^2)\sigma^4 + a_6(6 + 9x^2 + C_6 x^3)\sigma^6$. Since $a_6 \ge 0$ makes this convex in $x$ on $[0, \infty)$, the maximum over $x \in [x_a, x_b]$ occurs at $\{x_a, x_b\}$; convexity of $\Psi_5$ in $\nu$ on $[\nu_j, \nu_{j+1}]$ gives $\Psi_5(s; (1-\lambda)\nu_j + \lambda\nu_{j+1}) - ((1-\lambda)\nu_j + \lambda\nu_{j+1})^2/\eta \le (1-\lambda)(p_0(s) - \nu_j^2/\eta) + \lambda(p_1(s) - \nu_{j+1}^2/\eta) + \lambda(1-\lambda)\frac{(\nu_{j+1}-\nu_j)^2}{\eta}$, whose exact $\lambda \in [0,1]$ maximum is bounded over 16 $\sigma$-subpanels per box. Adaptive on-demand $\nu$-slab midpoint refinement eliminates $\frac{1}{4}(\Delta\nu)^2/\eta$ sag on tight peak slabs.
2. **Zero-`arcsin` Stein majorants (`0.125L`–`0.300L` and Claim 3):** For an even continuous piecewise-linear profile $w$ on knots $0 = y_0 < y_1 < \dots < y_K = 10$ (constant $w(x) = w_K$ for $x \ge y_K$), setting $\mu = M / \sigma^4$ in `(L5)` yields $\mathbb{E}\big[M \Psi_{\tilde w, 1}(\sigma\sqrt{U}/\sigma)\big]$ — equivalently, scaling $w$ to physical coordinates $y = s \cos\theta$ on a box $[\sigma_a, \sigma_b]$ with $c = \sigma^2 \in [\sigma_a^2, \sigma_b^2]$, `(L5)` gives
   $$
   \mathbb{E}\big[\Psi_W(\sigma\sqrt{U}; c)\big] \le \frac{M x^2 \sigma^4}{24}, \qquad \Psi_W(s; c) = \frac{2}{\pi}\int_0^{\pi/2}\Big(s\cos\theta \int_0^{s\cos\theta} W(u)\,du - \frac{c}{2}W(s\cos\theta) - \frac{1}{2M}W(s\cos\theta)^2\Big)d\theta,
   $$
   with $W = M u_{\mathrm{unit}}$. On every knot interval $(y_j, y_{j+1}]$ ($s \le 30$), splitting $[0, \pi/2]$ at $\theta_k(s) = \arcsin(y_k / s)$ yields an exact closed form in $\arcsin(y_k / s)$ and $\sqrt{s^2 - y_k^2}$, evaluated exclusively via `verified_asin_0_1` and `sqrti`. Because $\Psi_W(s; c)$ is affine in $c = \sigma^2$, using an affine intercept $A_0(c) = a_{0,\mathrm{base}} + d_{a_2} c$ (`a2_eff = a2_rest + d_a2`) and verifying $A_0(c) + a_1 s + a_{2,\mathrm{rest}} s^2 + a_4 s^4 + a_6 s^6 - \Psi_W(s; c) \ge \Psi_5(s; \nu)$ at both endpoints $c \in \{\sigma_a^2, \sigma_b^2\}$ (with exact $s \ge 30$ asymptotic tail bounds) certifies the inequality uniformly across $c \in [\sigma_a^2, \sigma_b^2]$.
3. **Exact rational multi-atom primal witnesses in $\mathcal{L}$ (`55/55` plain covers):** For every plain cover (`29` in `rows2b` and `26` in `rows2c`), `build_primal_witness` runs a two-stage global search over $(\nu, \sigma, x_e)$, extracts the active rational radii $r_k \in \mathbb{Q}_{\ge 0}$, mixes $10^{-6}$ of the exact 4-atom rationalized Gauss–Laguerre interior law $r \in \{14/25, 33/25, 53/25, 77/25\}$ ($\mathbb{E}U = 1$, $\mathbb{E}U^2 = 2.01$, $\mathbb{E}U^3 = 6.09 < 6.13045$, $\mathbb{E}\sqrt{U} \approx 0.89748 < 2287/2500$), projects the weights in exact 128-bit integer arithmetic onto $\sum p_k = 1$ and $\sum p_k r_k^2 = 1$, and encloses $\Psi_5(\sigma r_k; \nu)$ at each atom to produce a rigorous lower bound $C_{\mathrm{lb}} \le G_r^+ + 2\beta_r^2/\varepsilon_1$. `verify_law_caps.py` independently verifies `(L1)–(L4)` in pure `Fraction` arithmetic on all 55 witnesses.

---

## 3. Claim 2 Results: All 29 Rows of `rows2b.json` and All 26 Rows of `rows2c_final.json`

All decimal bounds below are formatted outward from exact IEEE-754 dyadic / rational values by `verify_law_caps.py --print-tables`: lower bounds (`C_lb` and `C_r - C_cert`) use `ROUND_FLOOR`, while upper bounds (`C_cert` and `C_r`) use `ROUND_CEILING`.

### 3.1 The 29 Rows of P4 (`rows2b.json`, $\rho = 95133/100000$, `STATUS 4.17`)

| row | kind | `C_lb` (primal `L`, floor) | `C_cert` (dual cover, ceil) | `C_r` published (ceil) | `C_r - C_cert` (floor) | boxes (Stein) |
|---|---|---:|---:|---:|---:|---:|
| `0.125L` | Stein `(L1)-(L5)` (plain lb `0.7272233`) | — | `0.7198448911` | `0.7198461173` | `1.22e-6` | 1048 (433) |
| `0.150L` | Stein `(L1)-(L5)` (plain lb `0.7376408`) | — | `0.7285350526` | `0.7285392979` | `4.24e-6` | 1118 (536) |
| `0.200L` | Stein `(L1)-(L5)` (plain lb `0.7574173`) | — | `0.7452878887` | `0.7452906266` | `2.73e-6` | 1239 (621) |
| `0.250L` | Stein `(L1)-(L5)` (plain lb `0.7863951`) | — | `0.7754947471` | `0.7754995952` | `4.84e-6` | 1011 (455) |
| `0.300L` | Stein `(L1)-(L5)` (plain lb `0.8191324`) | — | `0.8103909001` | `0.8104403382` | `4.94e-5` | 945 (401) |
| `0.400L` | plain `(L1)-(L4)` | `0.8742815659` | `0.8745007645` | `0.8745008820` | `1.17e-7` | 1273 |
| `0.500L` | plain `(L1)-(L4)` | `0.9407739402` | `0.9409621759` | `0.9409623028` | `1.26e-7` | 1112 |
| `0.550L` | plain `(L1)-(L4)` | `0.9631422012` | `0.9631739812` | `0.9631741123` | `1.31e-7` | 1085 |
| `0.600L` | plain `(L1)-(L4)` | `1.0080896173` | `1.0081646836` | `1.0081647603` | `7.66e-8` | 1106 |
| `0.700` | plain `(L1)-(L4)` | `1.0911573984` | `1.0914798580` | `1.0914821679` | `2.30e-6` | 913 |
| `0.720` | plain `(L1)-(L4)` | `1.1266716408` | `1.1267386973` | `1.1267388060` | `1.08e-7` | 957 |
| `0.740` | plain `(L1)-(L4)` | `1.1647911662` | `1.1649569452` | `1.1649592273` | `2.28e-6` | 976 |
| `0.760` | plain `(L1)-(L4)` | `1.2061418821` | `1.2063493151` | `1.2063498374` | `5.22e-7` | 1054 |
| `0.780` | plain `(L1)-(L4)` | `1.2509828062` | `1.2510357275` | `1.2510358769` | `1.49e-7` | 1117 |
| `0.790` | plain `(L1)-(L4)` | `1.2746936611` | `1.2747447667` | `1.2747449872` | `2.20e-7` | 977 |
| `0.800` | plain `(L1)-(L4)` | `1.2993458221` | `1.2993697765` | `1.2993703836` | `6.07e-7` | 1027 |
| `0.810` | plain `(L1)-(L4)` | `1.3248708658` | `1.3249153029` | `1.3249154875` | `1.84e-7` | 885 |
| `0.820` | plain `(L1)-(L4)` | `1.3514988801` | `1.3515073090` | `1.3515094893` | `2.18e-6` | 725 |
| `0.830` | plain `(L1)-(L4)` | `1.3791801813` | `1.3791943575` | `1.3791944508` | `9.32e-8` | 630 |
| `0.840` | plain `(L1)-(L4)` | `1.4077912894` | `1.4077987638` | `1.4078042318` | `5.46e-6` | 618 |
| `0.845` | plain `(L1)-(L4)` | `1.4224875503` | `1.4224958938` | `1.4224996911` | `3.79e-6` | 621 |
| `0.850` | plain `(L1)-(L4)` | `1.4374126138` | `1.4374237729` | `1.4374275478` | `3.77e-6` | 607 |
| `0.855` | plain `(L1)-(L4)` | `1.4526543987` | `1.4526668468` | `1.4526671860` | `3.39e-7` | 586 |
| `0.860` | plain `(L1)-(L4)` | `1.4681401667` | `1.4681484999` | `1.4681517090` | `3.20e-6` | 586 |
| `0.865` | plain `(L1)-(L4)` | `1.4839371751` | `1.4839534326` | `1.4839589870` | `5.55e-6` | 568 |
| `0.870` | plain `(L1)-(L4)` | `1.5000029722` | `1.5000086703` | `1.5000094484` | `7.78e-7` | 573 |
| `0.875` | plain `(L1)-(L4)` | `1.5163761424` | `1.5163804900` | `1.5163805139` | `2.39e-8` | 600 |
| `0.880` | plain `(L1)-(L4)` | `1.5330560042` | `1.5330793470` | `1.5330803916` | `1.04e-6` | 572 |
| `0.886` | plain `(L1)-(L4)` | `1.5519410018` | `1.5519871677` | `1.5519938249` | `6.65e-6` | 564 |

On the five Stein rows `0.125L`–`0.300L`, our plain `(L1)–(L4)` covers also pass every published `C_plain` in `rows2b.json`, while the zero-`arcsin` Stein covers above pass every published `C_stein` with margins $1.22\times 10^{-6}$ to $4.94\times 10^{-5}$. On the 24 plain rows `0.400L`–`0.886`, the primal-to-dual gap $C_{\mathrm{cert}} - C_{\mathrm{lb}}$ is typically $10^{-5}$ on the peak band (`1.12e-5` on `0.850`, `8.34e-6` on `0.845`), tightly bracketing the true semi-infinite LP value $G_r^+ + 2\beta_r^2/\varepsilon_1$.

### 3.2 The 26 Plain-Cover Rows at $\rho_0 = 2287/2500$ (`rows2c_final.json`, `STATUS 4.42` / `H4` of `4.45`)

| row | `C_lb` (primal `L`, floor) | `C_cert` (dual cover, ceil) | `C_r` published (ceil) | `C_r - C_cert` (floor) | boxes |
|---|---:|---:|---:|---:|---:|
| `0.250L` | `0.7665230822` | `0.7670695237` | `0.7670698544` | `3.30e-7` | 1185 |
| `0.300L` | `0.8057121302` | `0.8057741520` | `0.8057742241` | `7.21e-8` | 1101 |
| `0.400L` | `0.8669687252` | `0.8670850951` | `0.8670851850` | `8.99e-8` | 1188 |
| `0.500L` | `0.9372587309` | `0.9373002053` | `0.9373005149` | `3.09e-7` | 1159 |
| `0.550L` | `0.9597199513` | `0.9599500474` | `0.9599500733` | `2.59e-8` | 1056 |
| `0.600L` | `1.0058439766` | `1.0059265569` | `1.0059267052` | `1.48e-7` | 1219 |
| `0.700` | `1.0893458273` | `1.0894943549` | `1.0894961929` | `1.83e-6` | 937 |
| `0.720` | `1.1250316403` | `1.1252634699` | `1.1252648071` | `1.33e-6` | 934 |
| `0.740` | `1.1638337967` | `1.1639183725` | `1.1639184732` | `1.00e-7` | 1115 |
| `0.760` | `1.2056036753` | `1.2056653534` | `1.2056656336` | `2.80e-7` | 1128 |
| `0.780` | `1.2506343505` | `1.2506550257` | `1.2506550804` | `5.46e-8` | 972 |
| `0.790` | `1.2744576699` | `1.2744810851` | `1.2744812135` | `1.28e-7` | 1093 |
| `0.800` | `1.2991724017` | `1.2992071866` | `1.2992072747` | `8.81e-8` | 883 |
| `0.810` | `1.3248158358` | `1.3248329861` | `1.3248331513` | `1.65e-7` | 764 |
| `0.820` | `1.3514979787` | `1.3515064597` | `1.3515075611` | `1.10e-6` | 660 |
| `0.830` | `1.3791796871` | `1.3791825008` | `1.3791920640` | `9.56e-6` | 614 |
| `0.840` | `1.4077910608` | `1.4078034715` | `1.4078042318` | `7.60e-7` | 612 |
| `0.845` | `1.4224873982` | `1.4224990681` | `1.4224996439` | `5.75e-7` | 612 |
| `0.850` | `1.4374125251` | `1.4374237481` | `1.4374261913` | `2.44e-6` | 600 |
| `0.855` | `1.4526543522` | `1.4526643407` | `1.4526671000` | `2.75e-6` | 583 |
| `0.860` | `1.4681401627` | `1.4681514183` | `1.4681516177` | `1.99e-7` | 582 |
| `0.865` | `1.4839371751` | `1.4839578549` | `1.4839589870` | `1.13e-6` | 562 |
| `0.870` | `1.5000029722` | `1.5000087077` | `1.5000094484` | `7.40e-7` | 568 |
| `0.875` | `1.5163761424` | `1.5163804900` | `1.5163805139` | `2.39e-8` | 599 |
| `0.880` | `1.5330560042` | `1.5330792443` | `1.5330803751` | `1.13e-6` | 572 |
| `0.886` | `1.5519410018` | `1.5519871677` | `1.5519938087` | `6.64e-6` | 563 |

---

## 4. Claim 3 (`SMALL_T.md`): Two Independent Proofs of $V \le \frac{2}{5}t^2 + \frac{7058083}{10^7}$

### 4.1 Proof A: Clean-Room Zero-`Arcsin` 39-Node Stein/Moment Certificate (`STATUS 4.18(b)`)

Following the reduction of [`SMALL_T.md`](../degree5-capped-2026-11-16/SMALL_T.md) §1 with $\eta' = \frac{3}{5} > \eta$:
1. Using $\|P_{3,2} h\|_2^2 \le \|h\|_2^2 - t^2 - \|P_{2,1} h\|_2^2 = 1 - \|k\|_2^2 - t^2 - \|P_{2,1} h\|_2^2$ and dropping $-\varepsilon_1\|P_{2,1} h\|_2^2 - \|P_{1,0} k\|_2^2 - \eta\|P_{3,2} k\|_2^2 \le 0$ in the self-adjoint identity for $V$ gives $V \le (1 - \eta)t^2 + \eta(1 - \|k\|_2^2) + \varepsilon_1\|P_{2,1} k\|_2^2$.
2. For any $\eta' \in [\eta, 1]$, since $1 - \|k\|_2^2 \ge t^2$ (from $\|h\|_2^2 + \|k\|_2^2 = 1$ and $\|h\|_2^2 \ge t^2$), $(1 - \eta)t^2 + \eta(1 - \|k\|_2^2) \le (1 - \eta')t^2 + \eta'(1 - \|k\|_2^2)$. Setting $\eta' = 3/5$ gives $1 - \eta' = 2/5$ and
   $$
   V \le \frac{2}{5}t^2 + \sup_{f,g}\Big[\eta'(1 - \|k\|_2^2) + 2\operatorname{Re}\langle G_3, k \rangle - \frac{\|G_3\|_2^2}{\varepsilon_1}\Big], \qquad G_3 \in H_{2,1}(\mathbb{C}^n).
   $$
3. Pointwise over $(z) \in \mathbb{C}^n$, with $|k| \le 1$, $\max_{|k| \le 1}\big[\eta'(1 - |k|^2) + 2|G_3|\,|k|\big] = g_{\mathrm{phys}}(|G_3|)$, where
   $$
   g_{\mathrm{phys}}(s) = \begin{cases} \eta' + \dfrac{s^2}{\eta'}, & 0 \le s \le \eta', \\[6pt] 2s, & s \ge \eta', \end{cases}
   $$
   is $C^1$, convex, and $2$-Lipschitz on $[0, \infty)$ ($g_{\mathrm{phys}}(0) = 3/5$). Writing $\sigma = \|G_3\|_2$ and $U = |G_3|^2/\sigma^2 \in \mathcal{L}$ (now $G_3 \in H_{2,1}(\mathbb{C}^n)$ is the *full* cubic vector, so no visible/remote split or sector hypothesis $K_5$ is used!), we obtain $V \le \frac{2}{5}t^2 + \sup_{\sigma \ge 0}\big[F(\sigma) - \sigma^2/\varepsilon_1\big]$, where $F(\sigma) = \sup_{U \in \mathcal{L}} \mathbb{E}[g_{\mathrm{phys}}(\sigma\sqrt{U})]$ is convex on $[0, \infty)$ with $F(\sigma) \le \frac{3}{5} + 2\rho\sigma$.
4. Evaluating upper bounds $\hat F(\sigma_i) \ge F(\sigma_i)$ on the 39 rational nodes $\sigma_0 = 0.05, \dots, \sigma_{38} = 1.45$ via our zero-`arcsin` Kelley–Simplex Stein solver (`442` certified $x$-interval majorants, `176` using Stein profiles on $46$ knots), convexity of $F$ bounds $F(\sigma) - \sigma^2/\varepsilon_1$ on each $[\sigma_i, \sigma_{i+1}]$ by maximizing the affine chord minus $\sigma^2/\varepsilon_1$ in closed rational form, while $[0, 0.05]$ and $[1.45, \infty)$ are bounded by $\frac{3}{5} + 2\rho\sigma - \sigma^2/\varepsilon_1$. Both `certify_law_caps.cpp` and pure-`Fraction` assembly in `verify_law_caps.py` certify
   $$
   N(3/5) \le N_{\mathrm{cert}} \le 0.7057642321 < \frac{7058083}{10^7} = 0.7058083 \qquad (\text{margin } > 4.40\times 10^{-5}).
   $$

### 4.2 Proof B: Cover-Free Elementary Deduction from Lean-Proved Cubic Constants

Independently of all interval covers (matching `SECBUD`, [`../sector-budget-codex-a7c4/PROOF.md`](../sector-budget-codex-a7c4/PROOF.md) §"An independent proof of the small-$t$ bound"), let $x = t^2$, $K = \|k\|_2^2 \le 1 - x$, $A = \|P_{2,1} k\|_2^2$, $E = \frac{25}{31}$, $r = \frac{\varepsilon_1}{E} = \frac{1209}{1250}$, $u = \frac{47}{1953}$, and $c = 2u + \frac{1}{2} = \frac{2141}{3906}$. From the Lean theorems in `Grothe.LowerAnalytic` / `Grothe.Lower`:
- `twice_normSq_QkOf_le` and `integral_phiMass_QkOf_le` give $E A - c K \le \mathrm{massS} < \frac{166}{1000}$;
- `witnessCap_cert` applied to `tailNodeCaps_cert` for the cubic identity-tail witness $(191/250, 47/2000)$ gives $\widehat V := x - \|P_{1,0} k\|_2^2 + E(A - \|P_{2,1} h\|_2^2) - 2u K \le \frac{7064131}{10^7} < \frac{71}{100}$ (extending from $n \ge 2$ to $n = 1$ by adjoining an unused Gaussian coordinate, and trivial for $n = 0$).

Splitting at $x = 4/25$ ($t = 2/5$):
- **Case $0 \le x \le 4/25$:** Using $\|P_{3,2} h\|_2^2 \le 1 - K - x$, $V \le (1 - \eta)x + \eta + \varepsilon_1 A - \eta K \le (1 - \eta)x + \eta + r\cdot\frac{166}{1000} + (rc - \eta)K$. Since $rc = \frac{27833}{52500} > \eta = \frac{779}{10000}$ and $K \le 1 - x$, this is at most $(1 - rc)x + r(c + \frac{166}{1000})$, whose margin below $\frac{2}{5}x + \frac{7058083}{10^7}$ on $[0, 4/25]$ is minimized at $x = 4/25$ and equals $\frac{39251}{10^7} > 0$.
- **Case $x \ge 4/25$:** Subtracting $r\widehat V$ cancels $\varepsilon_1(A - \|P_{2,1} h\|_2^2)$ identically:
  $$
  V \le r\widehat V + \eta + (1 - r - \eta)x + (2ru - \eta)K - (1 - r)\|P_{1,0} k\|_2^2 \le r\cdot\frac{71}{100} + \eta + (1 - r - \eta)x,
  $$
  because $2ru = \frac{611}{13125} < \eta$ and $r < 1$. Its margin below $\frac{2}{5}x + \frac{7058083}{10^7}$ on $[4/25, \infty)$ is also minimized at $x = 4/25$ and equals $\frac{124123}{10^7} > 0$. Both rational margins are checked in `verify_law_caps.py`.

---

## 5. Claim 4: Exact Rational Envelopes, Rooms, and Design `D*` (`verify_law_caps.py`)

Because every row quadratic $Q_r(t) = t^2 - 2\ell_r t + C_r$ shares the same $t^2$ term, pairwise differences $Q_i(t) - Q_j(t) = -2(\ell_i - \ell_j)t + (C_i - C_j)$ are affine with exact rational crossings $t_{i,j} = \frac{C_i - C_j}{2(\ell_i - \ell_j)}$, and on each active interval $[a_r, b_r]$ convexity of $Q_r$ forces $\max_{[a_r, b_r]} Q_r = \max\{Q_r(a_r), Q_r(b_r)\}$. `verify_law_caps.py` computes the lower hull in pure `Fraction` arithmetic, checks global optimality of each active row against all competing rows at both cell endpoints, and verifies:

1. **`rows2b.json` with Stein rows ($t_1 = \frac{7967}{125000} = 0.063736$, P4 Claim 4 & `STATUS 4.17`):**
   - All 29 rows plus $[0, t_1]$ (`30` contiguous pieces) are active.
   - Global envelope maximum, attained at the crossing $t^* = \frac{C_{0.850} - C_{0.845}}{2(\ell_{0.850} - \ell_{0.845})} = 0.84759576884449\dots$ of rows `0.845` and `0.850`:
     $$
     B_5 \in [0.7128940126, 0.7128940127], \qquad \frac{500}{701} - B_5 \ge 3.7274\times 10^{-4} \quad (3.727491\dots\times 10^{-4}),
     $$
     reproducing P4 §§2–3 digit-for-digit. Replacing the published $C_r$ and $7058083/10^7$ by our own certified $C_{\mathrm{cert}}$ and $N_{\mathrm{cert}}$ yields an even smaller certified envelope $B_5^{\mathrm{cert}} \le 0.7128902286 \le B_5 < 500/701$.
2. **`rows2b.json` plain-only ($t_1 = \frac{57297}{500000} = 0.114594$):** All 29 rows plus $[0, t_1]$ are active, with the identical peak $B_5$ at $t^* \approx 0.847596$ (`CERT_STAGE2B.md` §4).
3. **`rows2c_final.json` at $\rho_0 = \frac{2287}{2500}$ ($t_1 = \frac{6213}{31250} = 0.198816$, `STATUS 4.42`):**
   - All 26 rows (`0.250L`–`0.886`) plus the direct bound on $[0, t_1]$ (`27` contiguous pieces) are active.
   - Exact rational `B` and `room` match `rows2c_final.json` **identically as exact rationals**:
     $$
     B^{(2c)} \in [0.7128931980, 0.7128931981], \qquad \frac{500}{701} - B^{(2c)} \ge 3.7356\times 10^{-4} \quad (3.735637\dots\times 10^{-4}),
     $$
     attained at the crossing $t^* \approx 0.8475197$ of rows `0.845` and `0.850`, with $B_{\mathrm{cert}}^{(2c)} \le 0.7128915468 \le B^{(2c)} < 500/701$.
4. **All 21 pieces of Design `D*` ([`fin_table.design.json`](../../code/degree5-design/design-2026-11-25/tables/fin_table.design.json), `STATUS 4.44` / `H4` of `4.45`):** Contiguous cover of $[649/1000, 886227/10^6]$ confirmed, with strictly positive exact rooms on all 21 pieces (minimum room $\ge 3.7413\times 10^{-4}$ for our certified $C_{\mathrm{cert}}^{(2c)}$, and $\ge 3.7356\times 10^{-4}$ for the published $C_r^{(2c)}$) at $\tau = 500/701$, $\tau = 1/1.40195$, and $\tau = 1/1.40210$.

---

## 6. Sanity Checks (P4 §§4, 8) and 12 Adversarial Negative Controls

### 6.1 Sanity Checks (`V2` in `verify_law_caps.py`)

1. **Exact closed form at $s = 0, \nu = 0$ on Row `0.850` (P4 §8):** For row `0.850`, $\ell = \frac{851203}{10^6}$ and $\beta = \frac{150857}{10^6} > 0$, so $\ell + \beta(T - 2) \ge \ell - 2\beta = \frac{549489}{10^6} > 0$ on all $T \ge 0$. Since $\mathbb{E}[\sqrt{T}] = \frac{\sqrt{\pi}}{2}$ and $\mathbb{E}[T^{3/2}] = \frac{3\sqrt{\pi}}{4}$ ($\mathbb{E}[\sqrt{T}(T-2)] = -\frac{\sqrt{\pi}}{4}$),
   $$
   \Psi_5(0; 0) = 2\mathbb{E}\big[\sqrt{T}(\ell + \beta(T - 2))\big] = \sqrt{\pi}\Big(\ell - \frac{\beta}{2}\Big) = \frac{1551549}{2\times 10^6}\sqrt{\pi} \in [1.37502449996, 1.37502449997].
   $$
   Our 1D radial interval engine, 2D `GL3PolarEngine`, and pure-`Fraction` Machin enclosure in `verify_law_caps.py` all enclose and overlap this exact value.
2. **Four Gaussian-law benchmarks (`U ~ Exp(1)`, P4 §4):** Rigorous 1536-panel midpoint/derivative + analytical tail quadrature encloses $t^2 - 2\ell t + \frac{2\beta^2}{\varepsilon_1} + \mathbb{E}_{U \sim \mathrm{Exp}(1)}[\Psi_5(\sigma\sqrt{U}; \nu)] - \kappa_r \sigma^2 - \nu^2/\eta$ at P4 §4's $(\sigma, \nu)$ on rows `0.700`, `0.800`, `0.850`, and `0.886`, matching P4 §4 (`0.6999095`, `0.7112159`, `0.7128653`, `0.7117053`) to within $< 3\times 10^{-6}$ and confirming strictly positive gaps below $t^2 - 2\ell t + C_r$.
   - *Diagnostic on Row `0.886`:* On `0.886`, $\sigma^* \approx 0.036$ ($\sigma^{*3} \approx 4.7\times 10^{-5}$), and because $\Psi_5(s;\nu) = \Psi_5(0;\nu) + c_2(\nu) s^2 + O(s^3)$ has its constant and $s^2$ expectations fixed across all laws in $\mathcal{L}$ by $\mathbb{E}[1] = \mathbb{E}[U] = 1$, the true non-Gaussian law excess over `Exp(1)` on `0.886` is $< 5\times 10^{-6}$ ($C_{\mathrm{lb}} = 1.55194100$ lies inside our interval enclosure $C_{\mathrm{Gauss}} \in [1.55193777, 1.55194541]$, within $4.41\times 10^{-6} < 5\times 10^{-6}$ of its upper end), whereas the $5.22\times 10^{-5}$ difference $C_r - C_{\mathrm{Gauss}}$ in `rows2b.json` is Stage-2b cover discretization slack (consistent with P4 §6's note of up to $5\times 10^{-5}$ cover slack on `0.82`–`0.886`). On `0.700`, `0.800`, and `0.850`, by contrast, our rational primal witnesses in $\mathcal{L}$ **strictly exceed** the upper end of $C_{\mathrm{Gauss}} = C_r - \text{law\_gap}$ (by $+6.91\times 10^{-3}$, $+3.05\times 10^{-4}$, and $+2.07\times 10^{-7}$ above $C_{\mathrm{Gauss}}^{\mathrm{hi}}$, i.e., $+6.92\times 10^{-3}$, $+3.07\times 10^{-4}$, and $+2.10\times 10^{-6}$ above the $C_{\mathrm{Gauss}}$ midpoint).
3. **Exact unitary-projection closed form for the four explicit driver pairs (P4 §8):** Let $f = \operatorname{ph}(z_1 + c W)$, $g = \operatorname{ph}(z_1 - c W)$ with $W \sim \mathcal{CN}(0,1)$ an independent diffuse $(2,1)$-variable. Setting $\alpha = (1 + c^2)^{-1/2}$ and $\gamma = c(1 + c^2)^{-1/2}$ ($\alpha^2 + \gamma^2 = 1$), the unitary rotation $U = \alpha z_1 + \gamma W \sim \mathcal{CN}(0,1)$, $V_\perp = \gamma z_1 - \alpha W \sim \mathcal{CN}(0,1)$ makes $U, V_\perp$ independent and $f = U / |U|$ independent of $V_\perp$! Substituting $z_1 = \alpha U + \gamma V_\perp$ and $W = \gamma U - \alpha V_\perp$, every inner product in P4 §8 drops all $V_\perp$-terms by zero-mean independence and reduces to elementary 1D radial moments $\mathbb{E}[|U|] = \frac{\sqrt{\pi}}{2}$, $\mathbb{E}[\bar U e_{21}(U)/|U|] = -\frac{\sqrt{2\pi}}{8}$, and $\mathbb{E}[\bar U e_{32}(U)/|U|] = \frac{\sqrt{3\pi}}{16}$:
   $$
   t(c) = \frac{\sqrt{\pi}}{2}\alpha, \qquad V(c) = \frac{\pi}{4}\left[\alpha^2 + \varepsilon_1 \gamma^2 - \frac{\varepsilon_1}{8}\alpha^6 + \frac{3\eta}{64}\alpha^4\big(\alpha^6 - 8\gamma^2\big)\right].
   $$
   Evaluated in both C++ intervals and pure `Fraction` arithmetic for $c \in \{29/100, 3/5, 13/10, 16/5\}$, this gives $(t, V) = (0.851153, 0.7122926)$, $(0.759933, 0.7065507)$, $(0.540343, 0.6709377)$, and $(0.264259, 0.6277643)$, reproducing P4 §8 to all printed digits and lying strictly below all 29 certified row parabolas.

### 6.2 Twelve Adversarial Negative and Corruption Controls (`V6`)

1. **Row constant lowered by its Gaussian law gap (P4 §6):** On all four benchmark rows (`0.700`, `0.800`, `0.850`, `0.886`), `run_plain_cover` **rejects** $C_r - \text{law\_gap}$, and on `0.700`, `0.800`, `0.850` our explicit rational primal witnesses in $\mathcal{L}$ satisfy $C_{\mathrm{lb}} > C_r - \text{law\_gap}$, proving mathematically that no valid dual cover can exist.
2. **Radius $\rho$ replaced by $\sqrt{\pi}/2$ on $t \le 0.6$ (P4 §6):** On **all 9 rows** with $t \le 0.6$ (`0.125L` through `0.600L`), computing the plain cover at the false radius $\sqrt{\pi}/2 \approx 0.886227$ produces a false cap $C_{\mathrm{bad}}(\sqrt{\pi}/2)$ that is **strictly exceeded** (by $> 10^{-3}$, up to $\sim 0.08$) by our valid multi-atom rational primal witness in $\mathcal{L}$.
3. **Node caps lowered by $10^{-6}$ (P4 §6):** On Row `0.850`, corrupting $\Psi_5$ caps downward by $10^{-6}$ produces a polynomial whose majorant check `verify_plain_majorant_against_caps` **rejects** against the true caps.
4. **Stein intercept $a_0$ lowered by $10^{-4}$ (`CERT_STAGE2B` §3):** Rejected by `verify_at_c` on Row `0.125L`.
5. **Stein variance parameter $c$ shifted outside box to $1.3\sigma_b^2$ (`CERT_STAGE2B` §3):** Rejected by `verify_at_c` on Row `0.125L`.
6. **Stein sextic term $a_6 = 0$ with $a_4 = -10^{-4} < 0$ (`CERT_STAGE2B` §3):** Rejected by the $s \ge 30$ ray verifier in `verify_at_c`.
7. **Literal printed 3-digit rooms trap (P4 §3):** Adding P4 §3's rounded printed rooms literally at $t = 0.847596$ pushes $\min_r [t^2 - 2\ell_r t + C_r + \mathrm{room}_{\mathrm{printed}}(r)] > 500/701$, confirming why allowances must be rounded downward from exact rational differences.
8. **Corruption controls 8–12 (`run_corruption_negative_controls` in `verify_law_caps.py`):** Mutating (8) `cpp_sha256`, (9) `plain_2b` `C_cert_hex` above `C_target` on `0.850`, (10) `stein_2b` `C_cert_hex` above `C_stein` on `0.125L`, (11) a primal witness atom to $r = 1 > \rho$ violating `(L4)`, or (12) a Claim 3 node $\hat F(\sigma_i)$ above target is **caught and rejected** in every case.

---

## 7. Deliverable Files and Exact Replay Commands

All deliverables live under `research/higher-degree/` with zero external dependencies and `< 300 KB` per file:
- [`sources/degree5-law-replay-2026-11-25-gemini-21d5/PROOF.md`](PROOF.md): this note.
- [`code/degree5-law-replay-gemini-21d5/certify_law_caps.cpp`](../../code/degree5-law-replay-gemini-21d5/certify_law_caps.cpp): self-contained C++17 outward-rounded interval certifier (embedded FIPS-180-4 SHA-256, zero `libm` transcendentals, 8-thread `std::thread` pool).
- [`code/degree5-law-replay-gemini-21d5/result.json`](../../code/degree5-law-replay-gemini-21d5/result.json): compact self-verifying dyadic hexfloat + exact rational certificate receipt (`60` covers, `55` rational primal witnesses, `39` Claim 3 nodes, exported binding plain & Stein boxes, sanity checks, and negative controls).
- [`code/degree5-law-replay-gemini-21d5/verify_law_caps.py`](../../code/degree5-law-replay-gemini-21d5/verify_law_caps.py): pure Python 3 stdlib verifier (`Fraction`, `Decimal`, `hashlib`, `json`, `math.isqrt`).

From the repository root:

```sh
# Fast pure-stdlib verification + 12 negative controls (< 2 s; also works under -O):
python3 -IB research/higher-degree/code/degree5-law-replay-gemini-21d5/verify_law_caps.py
python3 -IB -O research/higher-degree/code/degree5-law-replay-gemini-21d5/verify_law_caps.py --print-tables

# Full clean-room C++17 recompilation and bit-exact deterministic replay (~37 min on 8 threads):
python3 -IB research/higher-degree/code/degree5-law-replay-gemini-21d5/verify_law_caps.py --replay-cpp
```
