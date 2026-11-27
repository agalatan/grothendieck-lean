# Sharpened Retained Six-Sector Peak Bounds, Scaled Profile Transfer, and Central Consumer Slabs (`KAST`, Issue `#728`)

**Author:** `gemini-c1de`
**Date:** 2026-11-26
**Status:** **`P + C, author only`** (unreviewed; separates consequences of reviewed **`P + C`** / **`C`** inputs from corollaries conditional on `7.5.13`)
**Refs:** `#728`, `#436`, `#177` (`research/conjecture-K/STATUS.md` rows `7.4.10`, `7.4.16`, `7.5.3`, `7.5.13`, `8.1`, `8.7`, `8.10`, `8.13`, `11.47`, `11.53`)

---

## 1. Executive Summary & Dependency Separation

Previously, the retained joint `A + B` bridge `7.4.10` / `7.4.16` (**`P + C`**) and the global six-sector theorem `7.5.13` (`KGAS`, **`P + C, author only`**) used the scalar allocation `49.36e-6` (`4936/10^8`) of `7.4.10`, which combined the older tilted A-content slope $\frac{3}{10} D_+(q) + 6\cdot 10^{-6}$ (`11.50`), discarded the Gaussian benchmark buffer $\sigma(u) = S_0 - (B(u) - p_0 u) \ge 0$ (`2.7c`, `7.2.11`), and reused the positive-deficit S-lemma multiplier on $D(q) < 0$ (where $D_+(q) = 0$ already forces $\|c_{3/5}(q)\|_2 \le \sqrt{6\cdot 10^{-6}} < 0.00245$). Likewise, the `(P_Psi)` cession of `7.5.3` stood at `48.39e-6 < 49e-6` (giving `< 99e-6`), and the scaled profile-rectangle transfer `11.53` covered only the tilted `A`-core `q + (T - 1)r` without `B` or the three $z_1$-odd sectors.

In this note and the accompanying **100% zero-float, zero-`assert`** stdlib `Fraction` verifier [`verify.py`](../../code/all-sector-transfer-gemini-c1de/verify.py), we prove and certify four self-contained upgrades (`all_sector_transfer_cert.json` `= 267,846 B < 300 KB`):

### A. Retained `A + B` & `(P_Psi)` Cession Results Without Assuming `7.5.13`
Using global `(P)` (`7.4.16`, **`P + C`**), centered peak alignment (`7.1.6`, **`P + C`**), energy-dependent tilted A-content caps (`11.30`, `11.49`, `11.62`, **`P + C`**), the remote cap `3.3` (**`P + C`**), the Gaussian benchmark enclosure `3.14` (**`C`**), the remote/Gaussian energy slacks (`2.7c`, `7.2.11`, **`P + C`**), and the `7/25` content-deficit theorem `11.61` (**`P + C`**, noting that `11.61` includes one low-energy exempt box `[1/1000, 3/2000]` whose tensor-free `(2/25)δ` re-certification is **`C, author only`**):
1. **Peak Retained `A + B` Sharpening (`7.4.10`, `7.4.16`) & Strict Exact Retained $K$ Sub-Bands (`11.47`):**
   For every ambient dimension $n \ge 1$, every genuine remote cubic $q \in \mathcal{H}_{2,1}$, and arbitrary holomorphic `A/B` drivers $(r_A, r_B)$ (arbitrary sharing and phases) with $u = \|q\|_2^2 \le 0.0463$ and $u + V \le 0.080051$ ($V = \|r_A\|_2^2 + \|r_B\|_2^2$):
   - **From the headline `D_+` inequality of `11.61` alone (`\|c_{3/5}\|_2^2 <= (7/25) D_+(q) + 6e-6`):**
     $$\widehat{\Lambda}(q + A + B) < S_0 + 29.36\times 10^{-6}$$
     (certified `< 29.3522e-6`, a `40.5%` reduction from `49.36e-6`), and **strict exact retained $K$** ($\widehat{\Lambda}(q + A + B) < S_0$) holds across all $u \in [0, \frac{3}{100}] = [0, 0.03]$ (extending `11.47`'s $u \le 0.021$ `A`-only bound to `A + B`).
   - **With the signed `11.61` bound (`\|c_{3/5}\|_2^2 <= (7/25) D(q) + 6e-6` on $u \in [\frac{2}{125}, 0.0463]$, `STATUS.md` `11.61` & `KAB` `REVIEW_claude-b9ee.md` §4, keeping `D_+` on $[0, \frac{2}{125}]$ where the 3 exempt boxes lie):**
     $$\widehat{\Lambda}(q + A + B) < S_0 + 27.00\times 10^{-6}$$
     (certified `< 26.9985e-6 < 27/10^6`, meeting `#728`'s strict `< 27e-6` target — a `45.3%` reduction from `49.36e-6`), with **strict exact retained $K$** ($\widehat{\Lambda}(q + A + B) < S_0$) across $u \in [0, 0.0354] \cup [0.0456, 0.0463]$.
2. **Sharpened `(P_Psi)` `0.01 ||U||_2^2` Cession (`7.5.3`):**
   Under `(P_Psi)` (`7.5.3`), the odd increment is allowed to spend $0.01\|U\|_2^2 + \sigma(u) - D_-(q) + 50\cdot 10^{-6}$ ($U = r_B - 0.5053 r_A$). Combining this with $\Lambda(q) - S_0 = -\sigma(u) - D(q)$ yields $\Lambda(q) - S_0 + \sigma(u) - D_-(q) = -D_+(q)$, which **already spends $\sigma(u)$ and remote slack** — leaving $J_{AB} + 0.01\|U\|_2^2 - D_+(q)$ as the exact even cession quantity to certify (`sig_lo = 0, r_rem = 0`). Evaluating our 2D cover in pure-`D_+` cession mode (`cession_dplus`, using headline `D_+` `11.61` alone) certifies
   $$J_{AB} + 0.01\|U\|_2^2 - D_+(q) < 29.71\times 10^{-6}$$
   (certified `< 29.7042e-6` vs `48.39e-6 < 49e-6` in `7.5.3`; accompanied in `verify.py` by `codex-a7c4`'s scalar control `u = 0.0463, D = 0, C = 0.002449, ||e|| = 0.00075, R = 0.00888, U = 0.00855` giving `29.53958e-6`), lowering `7.5.3`'s conditional all-sector ceiling under `(P_Psi)` alone from `< S_0 + 99\cdot 10^{-6}` to **`< S_0 + 79.71\times 10^{-6}`**.
3. **Joint `A + B` Upgrade of the Scaled Profile Rectangle (`11.53`):**
   Across the entire `11.53` profile rectangle $\varepsilon \in [\frac{37}{50}, \frac{19}{25}]$, $\lambda = \varepsilon / \varepsilon_0 \in [\frac{1850}{1891}, \frac{1900}{1891}]$, $0 \le \frac{a}{\lambda} - 0.5592 \le \frac{1}{2500}$, $0 \le \frac{b}{\lambda} - 0.1432 \le \frac{1}{800}$, for $u \le \lambda^2 \cdot 0.0463$ and $u + V \le \lambda^2 \cdot 0.080051$:
   $$\widehat{\Lambda}_{\varepsilon, a, b}(q + A + B) < S(\varepsilon, a, b) + 1.078\times 10^{-4} \quad (D_+\text{ }11.61), \qquad < S(\varepsilon, a, b) + 1.070\times 10^{-4} \quad (\text{signed }11.61),$$
   and strictly **`< S(\varepsilon, a, b) + 10^{-4}`** on the sub-rectangle $0 \le \frac{b}{\lambda} - 0.1432 \le \frac{1}{970}$ (signed `11.61`; $\le \frac{1}{1000}$ for `D_+`). (On Row 8's profile in `8.13(ii)`, this gives `< S_8 + 6.35\times 10^{-5}` / `< S_8 + 6.11\times 10^{-5}` for `q + A + B` alone; closing an actual-response consumer requires all six sectors below.)

### B. All-Sector Corollaries Conditional on `7.5.13` (`KGAS`, `P + C, author only`)
Since `7.5.13` certifies $F_{\mathrm{joint}}(c^*) \le 0$ pointwise on all of $\mathbb{C}^6$ at the peak row with the $U(1)$-invariant trial $\xi = -\frac{3}{5}(r_A + 0.5053 r_B) - \frac{7}{25}\nu z_1$ (and zero `0.01 \|U\|_2^2` cession):
1. **Peak Six-Sector Sharpening (`7.5.13`):**
   Every admissible six-sector cubic $G \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ at the peak row with $u \le 0.0463$, $u + V \le 0.080051$, and **arbitrary odd energy $W \ge 0$** satisfies
   $$\widehat{\Lambda}(G) < S_0 + 29.36\times 10^{-6} \;\; (D_+\text{ }11.61), \qquad \widehat{\Lambda}(G) < S_0 + 27.00\times 10^{-6} \;\; (\text{signed }11.61),$$
   and **strict exact six-sector retained $K$** ($\widehat{\Lambda}(G) < S_0$) holds on $u \in [0, 0.03]$ (`D_+`) and $u \in [0, 0.0354] \cup [0.0456, 0.0463]$ (signed `11.61`).
2. **Six-Sector Scaled Profile Rectangle (`11.53`):**
   - For **$\varepsilon \in [\frac{37}{50}, \frac{1891}{2500}]$ ($\lambda \le 1$)**: under $u \le \lambda^2 \cdot 0.0463$ and $u + V \le \lambda^2 \cdot 0.080051$, $(\lambda - 1)\|\xi\|_2^2 \le 0$ holds unconditionally for **arbitrary odd energy $W \ge 0$** (with no cap on $|\nu|^2$), giving $\widehat{\Lambda}_{\varepsilon, a, b}(G) < S(\varepsilon, a, b) + 1.072\times 10^{-4}$ (`D_+`, certified `< 107.09e-6`) and $< S + 1.048\times 10^{-4}$ (signed, certified `< 104.74e-6`; $< S + 10^{-4}$ for $\delta_b \le \frac{1}{950}$).
   - For **$\varepsilon \in (\frac{1891}{2500}, \frac{19}{25}]$ ($1 < \lambda \le \frac{1900}{1891}$)**: under $u \le \lambda^2 \cdot 0.0463$ and the total-energy cap $\|G\|_2^2 \le \lambda^2 \cdot 0.080051$ (so $|\nu|^2 / \lambda^2 \le 0.080051 - u_0 - V_0$), adding the positive visible-trial term $(\lambda - 1)\frac{49}{625}|\nu_0|^2$ per cell gives $\widehat{\Lambda}_{\varepsilon, a, b}(G) < S(\varepsilon, a, b) + 1.220\times 10^{-4}$ (`D_+`) and $< S + 1.214\times 10^{-4}$ (signed).
3. **Direct Six-Sector Closure of Row 8 (`[0.840, 0.847]`) of `8.13(ii)` (`\varepsilon = 94/125`) & Subdivided Central Consumer Slabs (`8.1`, `8.7`, `8.13(ii)`, `8.13(i)`, `8.10`):**
   - Conditionally on `7.5.13` and `8.13(ii)`'s benchmark (`EXT94125`, **`P + C, author only`**), on **Row 8 (`[21/25, 847/1000]`) of `8.13(ii)`** ($\varepsilon = \frac{94}{125}$, $\lambda_8 = \frac{1880}{1891} < 1$), total six-sector transfer error is **`< 6.35\times 10^{-5}` (`D_+`) and `< 6.11\times 10^{-5}` (signed)** — strictly below `10^{-4}` and Row 8's allowance $\eta_{\max,8} \approx 1.0554\times 10^{-4}$.
   - Conditionally on `7.5.13` (without needing `8.13`'s row benchmarks, since the scaled peak row uses `3.14`'s $S_0$), **subdivided $t$-slabs of the exact scaled peak row $(\lambda\ell_0, \lambda\beta_0)$** — where $S(\lambda\varepsilon_0, \lambda\ell_0, \lambda\beta_0) = \lambda S_0$ scales homogeneously with **zero profile-transfer loss** and `2.12b` supplies the actual-response ellipsoid $\frac{3}{4} u_0 + V_0 \le \frac{3}{2}\varepsilon_0^2(\frac{\pi}{4} - t^2)$ — close wide central $t$-intervals across all four cubic consumer witnesses (`8.1`/`8.7`, `8.13(ii)`, `8.13(i)`, `8.10`; see §4).

---

## 2. Exact Weighted Scaling Identity and Unified 2D `(u, V)` Reduction (`P`)

### 2.1 Weighted Scaling of $\widehat{\Lambda}$ Across All Six Sectors (`3.17`)

Let $\varepsilon_0 = \frac{1891}{2500}$, $p_0 = \frac{1}{\varepsilon_0} = \frac{2500}{1891}$, $a_0 = \frac{699}{1250}$, $b_0 = \frac{179}{1250}$, and $L_0 = z_1(a_0 + b_0 T)$ ($T = |z_1|^2$). For any scale $\lambda = \varepsilon / \varepsilon_0 > 0$, write $G = \lambda G_0$ where
$$G_0 = q_0 + (T - 1) r_{A,0} + \frac{z_1^2}{\sqrt{2}}\overline{r_{B,0}} + z_1 Q_0 + \bar{z}_1 P_0 + \nu_0 \frac{z_1(T - 2)}{\sqrt{2}}$$
has normalized energies $u_0 = \|q_0\|_2^2 = u/\lambda^2$, $V_0 = \|r_{A,0}\|_2^2 + \|r_{B,0}\|_2^2 = V/\lambda^2$, and $W_0 = \|Q_0\|_2^2 + \|P_0\|_2^2 + |\nu_0|^2 = W/\lambda^2$. Substituting $\xi = \lambda \xi_0$ ($\xi_0 \in \mathcal{H}_{1,0}$) into `2.10a` (`3.17`) gives
$$\widehat{\Lambda}_{\lambda\varepsilon_0, \lambda a_0, \lambda b_0}(\lambda G_0) = \lambda \min_{\xi_0 \in \mathcal{H}_{1,0}}\Bigl\{\lambda \|\xi_0\|_2^2 + \mathbb{E}|L_0 + G_0 - \xi_0| + \mathbb{E}|L_0 - G_0 + \xi_0| - p_0 \|G_0\|_2^2\Bigr\}.$$
Evaluating at the `7.4.10` / `7.5.13` trial $\xi_0^* := -\frac{3}{5} R_0 - \frac{7}{25}\nu_0 z_1$, where $R_0 = r_{A,0} + \rho_0 r_{B,0}$ ($\rho_0 = \frac{5053}{10000}$, $D_\rho = 1 + \rho_0^2 = \frac{125532809}{100000000}$) and $U_0 = r_{B,0} - \rho_0 r_{A,0}$ are orthogonal to $z_1$ on remote coordinates so $\|\xi_0^*\|_2^2 = \frac{9}{25}\|R_0\|_2^2 + \frac{49}{625}|\nu_0|^2$, yields
$$\frac{1}{\lambda}\widehat{\Lambda}_{\lambda\varepsilon_0, \lambda a_0, \lambda b_0}(\lambda G_0) \le T_{\xi_0^*}(G_0) + (\lambda - 1)\left(\frac{9}{25}\|R_0\|_2^2 + \frac{49}{625}|\nu_0|^2\right),$$
where $T_{\xi_0^*}(G_0)$ is the unscaled peak trial functional (`7.5.6` / `7.5.13`). Observe the crucial dichotomy in $\lambda$:
- **Case $\lambda \le 1$ ($\varepsilon \le \frac{1891}{2500}$):** Since $\lambda - 1 \le 0$, $(\lambda - 1)\|\xi_0^*\|_2^2 \le 0$ holds unconditionally for **every** $R_0$ and **every** $\nu_0 \in \mathbb{C}$ (arbitrary $W \ge 0$, with no cap on $|\nu_0|^2$).
- **Case $\lambda > 1$ ($\varepsilon \in (\frac{1891}{2500}, \frac{19}{25}]$, $\lambda - 1 \le x_{\mathrm{hi}} := \frac{9}{1891}$):**
  - On the **even core** ($O_0 = 0 \implies \nu_0 = 0$), $(\lambda - 1)\|\xi_0^*\|_2^2 \le \frac{9}{25} x_{\mathrm{hi}} \|R_0\|_2^2$ with no odd term.
  - Across **all six sectors** under $\|G_0\|_2^2 = u_0 + V_0 + W_0 \le U_{\mathrm{tot}}$, $|\nu_0|^2 \le W_0 \le U_{\mathrm{tot}} - u_0 - V_0$, so $(\lambda - 1)\frac{49}{625}|\nu_0|^2 \le \frac{49}{625} x_{\mathrm{hi}}(U_{\mathrm{tot}} - u_0 - V_0)$ must be added per `(u_0, V_0)` cell (enforced in `verify.py` and tested in `Control 9` of `test_controls.py`).

### 2.2 S-Lemma Reduction on `(R, U)`, Negative-Deficit Multiplier, and Pure-`D_+` `(P_Psi)` Cession

Fix $x_{\mathrm{pen}} = \max(0, \lambda - 1)$ and optional cession $y_{\mathrm{cess}} \in \{0, \frac{1}{100}\}$. By `7.4.10` / `7.4.16` (for `O_0 = 0`, **`P + C`**) or `7.5.6` / `7.5.13` (for general `O_0`, **`P + C, author only`**, since $\mathbb{E} F_{\mathrm{joint}}(c^*) \le 0$), together with the shared fourth-moment inequalities $\mathbb{E}[|q_0|^2 S_r] \le 4 u_0 V_0$ and $\mathbb{E}[S_r^2] \le 2 V_0^2$ (`KPROG` `JOINT_TARGET.md` §3, giving $2 u_0 V_0 + 2 V_0^2 - \frac{463}{5000} V_0 = 2(u_0 + V_0 - 0.0463) V_0$) and $\|R_0\|_2^2 + \|U_0\|_2^2 = D_\rho V_0$:
$$T_{\xi_0^*}(G_0) + (\lambda - 1)\|\xi_0^*\|_2^2 + y_{\mathrm{cess}}\|U_0\|_2^2 \le \Lambda(q_0) + \nu_{\mathrm{add}} + J_{AB}(q_0, R_0, U_0),$$
where $\nu_{\mathrm{add}} = \nu_{\mathrm{pen}}\max(0, U_{\mathrm{tot}} - u_0 - V_0)$, $k_{\mathrm{uv}} = 2(\sup_{\text{cell}}(u_0 + V_0) - 0.0463)$,
$$A_0 := \frac{31}{100} - \frac{9}{25} x_{\mathrm{pen}} - \frac{k_{\mathrm{uv}}}{D_\rho}, \qquad B_0 := \frac{2}{25} - y_{\mathrm{cess}} - \frac{k_{\mathrm{uv}}}{D_\rho},$$
and by `7.1.6` (**`P + C`**), writing $C := \|c_{3/5}(q_0)\|_2$ and $e := c_B(q_0) - \rho_0 c_A(q_0)$ ($\|e\|_2 \le \frac{7}{2000}\sqrt{u_0}$), the aligned linear forms $c_R = c_{3/5}(q_0) + \frac{\rho_0}{D_\rho} e$ and $c_U = \frac{1}{D_\rho} e$ satisfy $\|c_R\|_2 \le C + \frac{\rho_0}{D_\rho} E_{\mathrm{cell}}$ and $\|c_U\|_2 \le \frac{1}{D_\rho} E_{\mathrm{cell}}$ ($E_{\mathrm{cell}} \ge \frac{7}{2000}\sqrt{u_{\mathrm{hi}}}$).

For **any** S-lemma multiplier $\mu \in \mathbb{R}$ such that $A := A_0 + \mu > 0$ and $B := B_0 + \mu > 0$, completing the squares in $\|R_0\|_2$ and $\|U_0\|_2$ gives
$$J_{AB}(q_0, R_0, U_0) \le \frac{(C + a_{\mathrm{cell}})^2}{A} + \frac{b_{\mathrm{cell}}^2}{B} + \mu D_\rho V_{\mathrm{ext}}(\mu),$$
where $a_{\mathrm{cell}} = \frac{\rho_0}{D_\rho} E_{\mathrm{cell}}$, $b_{\mathrm{cell}} = \frac{1}{D_\rho} E_{\mathrm{cell}}$, and $V_{\mathrm{ext}}(\mu) = V_{\mathrm{hi}}$ if $\mu \ge 0$, $V_{\mathrm{lo}}$ if $\mu < 0$. Crucially, $\mu$ is allowed to be **negative** ($\mu \in (-\min(A_0, B_0), 0)$) when $C$ is small and $V_{\mathrm{lo}} > 0$.

Now distinguish the two assembly targets:
1. **Peak / Scaled-Profile Target ($y_{\mathrm{cess}} = 0$, bounding $\Lambda(q_0) - S_0 + \nu_{\mathrm{add}} + J_{AB}$):**
   Here $\Lambda(q_0) - S_0 = -\sigma(u_0) - D(q_0)$, where $\sigma(u_0) \ge \sigma_{\mathrm{lo}} \ge 0$ (`2.7c`, `7.2.11`) and $\Lambda(q_0) - S_0 \le r_{\mathrm{rem}}$ (`3.3`, `3.14`, `7.2.11`, with $r_{\mathrm{rem}} \le -10^{-4}$ on $u_0 \le 0.03$ by `KGAP` `ENERGY_SLACK.md` §3):
   - **Pure `D_+` Mode (`use_signed_1161 = False`, using ONLY `C^2 <= (7/25) D_+(q_0) + 6e-6` of `11.61`):**
     - *Branch $D(q_0) < 0$:* $D_+(q_0) = 0 \implies C \le \sqrt{6\cdot 10^{-6}} \le C_{\mathrm{neg,hi}} < 0.00245$; an independent multiplier $\mu_{\mathrm{neg}}$ bounds $r_{\mathrm{rem}} + \text{gain}(\mu_{\mathrm{neg}})$.
     - *Branch $D(q_0) \ge 0$:* $\Lambda(q_0) - S_0 \le r_{\mathrm{pos}} := \min(r_{\mathrm{rem}}, -\sigma_{\mathrm{lo}})$. On $C \le \min(C_{\max}, C_{\mathrm{neg,hi}})$ we drop $-D(q_0) \le 0$; on $C \in [C_{\mathrm{neg,lo}}, C_{\max}]$, $D(q_0) \ge \max\bigl(0, \frac{25}{7}(C^2 - 6\cdot 10^{-6})\bigr) \ge 0$ (so $-\kappa_1 D(q_0) \le -\kappa_1 \frac{25}{7}(C^2 - 6\cdot 10^{-6})$ for $\kappa_1 \in [0, 1]$), giving $(1 - \kappa_1) r_{\mathrm{pos}} - \kappa_1 \sigma_{\mathrm{lo}} + \frac{25\kappa_1}{7}\cdot 6\cdot 10^{-6} - \frac{25\kappa_1}{7} C^2 + \text{gain}(\mu_{\mathrm{pos}})$ for any $\kappa_1 \in [0, 1]$.
   - **Signed `11.61` Mode (`use_signed_1161 = True` on $u_0 \ge \frac{2}{125} = 0.016$):**
     On $u_0 \in [\frac{2}{125}, 0.0463]$, all 126 spectral Stein boxes of `11.61` are non-exempt (`STATUS.md` `11.61`, `KAB` `REVIEW_claude-b9ee.md` §4) and certify $C^2 \le \frac{7}{25} D(q_0) + 6\cdot 10^{-6}$ regardless of the sign of $D(q_0)$ (while on $u_0 < \frac{2}{125}$ pure `D_+` mode is strictly enforced; `Control 8` of `test_controls.py`). For any $\kappa \in [0, 1]$:
     $$\Lambda(q_0) - S_0 + \text{gain} \le (1 - \kappa) r_{\mathrm{rem}} - \kappa \sigma_{\mathrm{lo}} + \kappa\frac{6\cdot 10^{-6}}{7/25} + \max_{C \in [0, C_{\max}]}\!\left[\left(\frac{1}{A} - \frac{\kappa}{7/25}\right) C^2 + \frac{2 a_{\mathrm{cell}}}{A} C + \frac{a_{\mathrm{cell}}^2}{A} + \frac{b_{\mathrm{cell}}^2}{B} + \mu D_\rho V_{\mathrm{ext}}(\mu)\right].$$
2. **`(P_Psi)` Cession Target ($y_{\mathrm{cess}} = \frac{1}{100}$, `pure_dplus_cession = True`, bounding $J_{AB} + 0.01\|U_0\|_2^2 - D_+(q_0)$):**
   Because `(P_Psi)` (`7.5.3`) already consumes $\sigma(u_0) - D_-(q_0)$ in the odd increment ($\Lambda(q_0) - S_0 + \sigma(u_0) - D_-(q_0) = -D_+(q_0)$), `verify.py` enforces `sig_lo = 0, r_rem = 0, use_signed_1161 = False` (`Control 18` of `test_controls.py`), bounding $-D_+(q_0) \le 0$ (with equality when $D(q_0) \le 0$) on $C \le C_{\mathrm{neg,hi}}$ and $-D_+(q_0) \le -\kappa_1 \frac{25}{7}(C^2 - 6\cdot 10^{-6})$ ($\kappa_1 \in [0, 1]$) on $C \in [C_{\mathrm{neg,lo}}, C_{\max}]$. This certifies $J_{AB} + 0.01\|U_0\|_2^2 - D_+(q_0) < 29.7042\times 10^{-6} < 29.71\times 10^{-6}$.

---

## 3. One-Sided Profile Transfer (`11.53`) Across `A + B` and All Six Sectors (`P`)

Let $\varepsilon = \lambda\varepsilon_0 \in [\frac{37}{50}, \frac{19}{25}]$ ($\lambda \in [\frac{1850}{1891}, \frac{1900}{1891}]$), and let $(a, b) = \lambda(a_0 + \delta_a, b_0 + \delta_b)$ with $\delta_a \ge 0$, $\delta_b \ge 0$. For any $G = \lambda G_0$ and any $\xi = \lambda \xi_0$, writing $L_{\delta} = z_1((a_0 + \delta_a) + (b_0 + \delta_b) T) = L_0 + z_1(\delta_a + \delta_b T)$, the triangle inequality gives
$$\mathbb{E}|L_\delta + G_0 - \xi_0| + \mathbb{E}|L_\delta - G_0 + \xi_0| \le \mathbb{E}|L_0 + G_0 - \xi_0| + \mathbb{E}|L_0 - G_0 + \xi_0| + 2\mathbb{E}\bigl[|z_1|(\delta_a + \delta_b |z_1|^2)\bigr]$$
with $2\mathbb{E}|z_1| = \sqrt{\pi}$ and $2\mathbb{E}|z_1|^3 = \frac{3}{2}\sqrt{\pi}$. Meanwhile, by `3.14` / `11.53` (`A15S` `REMOTE.md` §4), at the Gaussian reference point $v_* = 0.0403448$, $S(\lambda\varepsilon_0, \lambda(a_0 + \delta_a), \lambda(b_0 + \delta_b)) = \lambda S(\varepsilon_0, a_0 + \delta_a, b_0 + \delta_b) \ge \lambda\bigl(J_{0,\mathrm{supp}}^{\mathrm{lo}} + g_a \delta_a + g_b \delta_b\bigr)$ since the Gaussian expectation is convex/monotone-increasing in $(a, b)$ with certified partial derivatives $\ge (g_a, g_b)$ at $(a_0, b_0, v_*)$. Combining the two inequalities yields
$$\widehat{\Lambda}_{\varepsilon, a, b}(G) - S(\varepsilon, a, b) \le \lambda\Bigl(\eta_{\mathrm{cov}} + (S_0^{\mathrm{hi}} - J_{0,\mathrm{supp}}^{\mathrm{lo}}) + c_a \delta_a + c_b \delta_b\Bigr),$$
where $c_a = \sqrt{\pi}_{\mathrm{hi}} - g_a > 0$, $c_b = \frac{3}{2}\sqrt{\pi}_{\mathrm{hi}} - g_b > 0$, and $\eta_{\mathrm{cov}}$ is the certified 2D cover bound (`scale_even_*` for `A + B`, `peak_*` for $\lambda \le 1$ six-sector, or `scale_all6_*` for $\lambda > 1$ six-sector).

---

## 4. Direct Closure of Row 8 of `8.13(ii)` and Subdivided Central Consumer Slabs (`P + C, author only`)

### 4.1 Direct Closure of Row 8 (`[0.840, 0.847]`) of `8.13(ii)` (`\varepsilon = 94/125`)
Row 8 of `8.13(ii)` (`central_94_125_certificate.json`, `EXT94125`, **`P + C, author only`**) sits on $t \in [\frac{21}{25}, \frac{847}{1000}] = [0.840, 0.847]$ at $\varepsilon_8 = \frac{94}{125}$ ($\lambda_8 = \frac{1880}{1891} < 1$) with $(\ell_8, \beta_8) = (\frac{4209371}{5000000}, \frac{1428641}{10000000})$, $S_8^{\mathrm{upper}} = \frac{854753}{625000}$, and exact allowance $\eta_{\max,8} = \frac{2781778376899}{26357600000000000} \approx 105.54\times 10^{-6} > 10^{-4}$. Since $\delta_{a,8} = \frac{a_8}{\lambda_8} - \frac{699}{1250} \in (0, \frac{1}{2500})$, $\delta_{b,8} = \frac{\beta_8}{\lambda_8} - \frac{179}{1250} \in (0, \frac{1}{800})$, $u_0 < 0.04627 < 0.0463$, $u_0 + V_0 + W_0 < 0.080051$, and **$\lambda_8 < 1$** (so `x_pen = 0, nu_pen = 0` for arbitrary $W \ge 0$), §3 gives conditionally on `7.5.13` (and as a profile bound on `q + A + B` via `7.4.16`):
- **With `D_+` `11.61` only:** $\widehat{\Lambda}_8(G) - S_8 < 63.5\times 10^{-6}$ (`63.38e-6`) $< 10^{-4} < \eta_{\max,8}$.
- **With signed `11.61`:** $\widehat{\Lambda}_8(G) - S_8 < 61.1\times 10^{-6}$ (`61.04e-6`) $< 10^{-4} < \eta_{\max,8}$.

Thus, conditionally on `7.5.13` and `8.13(ii)`'s Row 8 benchmark, Row 8 of `8.13(ii)` closes **directly** across all six sectors with $> 42\times 10^{-6}$ reserve below $\eta_{\max,8}$.

### 4.2 Zero-Profile-Loss Subdivided Central Consumer Slabs via the Scaled Peak Row
At any witness $\varepsilon = \lambda\varepsilon_0$ with $0 < \lambda \le 1$, evaluating the gate-free row (`2.1`, `2.10a`) at the **exact scaled peak row** $(\ell_s, \beta_s) := (\lambda\ell_0, \lambda\beta_0)$ eliminates **all** profile-transfer loss ($c_a \delta_a + c_b \delta_b = 0$ and $S(\lambda\varepsilon_0, \lambda\ell_0, \lambda\beta_0) = \lambda S_0 \le \lambda S_0^{\mathrm{hi}}$ from `3.14`). Moreover, on each response sub-slab $t \in [t_a, t_b]$ ($0 < t_a < t_b < \frac{\sqrt{\pi}}{2}$):
1. **Monotone $t$-dependent remote energy cap (`2.12a`):** $u_0 = \frac{u}{\lambda^2} \le u_{0,\mathrm{cap}}(t_a) := 4\varepsilon_0^2 B_{212B}(A_{212B} - t_a)$.
2. **Actual-response simultaneous ellipsoid (`2.12b`):** Multiplying $\frac{1}{2} E_q + \frac{2}{3} E_A + \frac{4}{3} E_B + E_Q + E_P + \frac{8}{7} E_\nu \le \varepsilon^2(\frac{\pi}{4} - t^2)$ by $\frac{3}{2\lambda^2}$ gives
   $$\frac{3}{4} u_0 + V_0 \le e_{34}(t_a) := \frac{3}{2}\varepsilon_0^2\!\left(\frac{\pi_{\mathrm{hi}}}{4} - t_a^2\right), \qquad u_0 + V_0 \le e_{34}(t_a) + \frac{1}{4} u_{0,\mathrm{cap}}(t_a),$$
   which shrinks both $u_{0,\max}$ and $V_0$ as $t_a$ increases.
3. **Endpoint row convexity:** Since $t \mapsto q_s(t) := t^2 - 2\ell_s t + \frac{2\beta_s^2}{\varepsilon}$ is convex, $\max_{t \in [t_a, t_b]} q_s(t) = \max(q_s(t_a), q_s(t_b))$, so verifying $\max(q_s(t_a), q_s(t_b)) + \lambda(S_0^{\mathrm{hi}} + \eta_{\mathrm{slab}}) < \tau_{\mathrm{cap}}$ on contiguous slabs $[t_m, t_{m+1}]$ certifies $V_\varepsilon(f, g) < \tau_{\mathrm{cap}}$ for every actual unimodular pair with $t \in [t_{\mathrm{first}}, t_{\mathrm{last}}]$ conditionally on `7.5.13`.

All promised $t$-interval endpoints are hardcoded and verified from scratch in zero-float `Fraction` arithmetic by `verify.py` (`Control 15` tests rejection of truncated slabs); the slab counts in the table below describe the subdivision stored in `all_sector_transfer_cert.json`:

| Consumer Witness | $\varepsilon$ | $\lambda = \varepsilon / \varepsilon_0$ | Target Cap $\tau_{\mathrm{cap}}$ | Certified $t$-Interval | Slabs | Consumer Impact (conditional on `7.5.13`) |
|---|---|---|---:|---|---:|---|
| `8.1` (`D_+` `11.61` only) | `1891/2500` | `1` | `500/701` | `[21/25, 21399/25000]` (`[0.84000, 0.85596]`) | `6` | Widens `8.1` (`[0.84, 0.851]`) by `+45%` |
| `8.1` / `8.7` (signed `11.61`) | `1891/2500` | `1` | `500/701` | **`[21/25, 8661/10000]` (`[0.8400, 0.8661]`)** | `6` | **100% closes upper shoulder gap `[0.851, 0.863]` of `8.7` at $\varepsilon = 1891/2500$** |
| `8.13(ii)` (signed `11.61`) | `94/125` | `1880/1891` | `500/701` | **`[21/25, 8547/10000]` (`[0.8400, 0.8547]`)** | `11` | **Closes Rows 8, 9, 10 (`[0.840, 0.854]`) + `[0.854, 0.8547]` of Row 11** |
| `8.13(i)` (signed `11.61`) | `3/4` | `1875/1891` | `500/701` | **`[21/25, 5323/6250]` (`[0.84000, 0.85168]`)** | `10` | **Closes Rows 4, 5, 6 (`[0.840, 0.8515]`) + `[0.8515, 0.85168]` of Row 7** |
| `8.10` (signed `11.61`) | `299/400` | `7475/7564` | `713263/10^6` | **`[21/25, 21237/25000]` (`[0.84000, 0.84948]`)** | `9` | **Covers `[0.840, 0.84948]` across Rows 5–7 of `8.10` despite `43e-6` Row 7 ceiling** |
