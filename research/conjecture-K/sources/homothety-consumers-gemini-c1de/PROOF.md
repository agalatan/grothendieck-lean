# Free-Homothety Peak Transfer, Exempt-Box-Free Retained Bounds, and End-to-End Consumer Closures (`KHOM`)

**Agent-ID:** `gemini-c1de`
**Date:** 28 November 2026
**Issue:** `#760` (Refs `#436`, `#177`)
**Ledger tag:** `KHOM`
**Evidence grade:** **`P + C, author only`** (Track A uses exclusively independently reviewed **`P + C`** / **Lean** inputs plus the reviewed **C** peak benchmark enclosure `3.14`; Track B additionally uses **`P + C, author only`** inputs `3.5a` and `3.3a`).

---

## 1. Summary of Main Results

Previously (`KAST`, `#731`), transferring the global peak all-sector theorem `7.5.13` (`KGAS`, **`P + C`**) to consumer witnesses $\varepsilon \neq \varepsilon_0 := \frac{1891}{2500}$ tied the visible profile homothety to $\lambda = \frac{\varepsilon}{\varepsilon_0}$ (`STATUS.md` `3.17`, `11.53`). That locked effective price $p_{\mathrm{eff}} = p_0 := \frac{2500}{1891}$ and left the quadratic envelope $t^2 - 2\lambda\ell_0 t + \frac{2\lambda^2\beta_0^2}{\varepsilon} + \lambda S_0$ tangent only near $t \approx \lambda t_0$, whereas shifting $(a, b)$ away from the peak ray incurred `8.6`'s triangle/support profile-transfer barrier ($7.05 \times 10^{-4} \gg 1.04 \times 10^{-4}$ on Row $M$ of `8.5`).

In this note we decouple the visible homothety parameter $\mu > 0$ from $\lambda = \frac{\varepsilon}{\varepsilon_0}$, varying $(\ell_\mu, \beta_\mu) = (\mu\ell_0, \mu\beta_0)$ freely along the peak ray $L_\mu = \mu L_0$. Along this ray, **profile-transfer loss vanishes identically** ($\delta_a = \delta_b = 0$) while the effective cubic price shifts to $p_{\mathrm{eff}} = \frac{\mu}{\varepsilon} = p_0 + \Delta p$:
- When $\mu > \lambda$ ($\Delta p > 0$, covering the entire upper central shoulder $t \in [0.846, \frac{\sqrt{\pi}}{2}]$), the price shift $-\Delta p(u_0 + V_0 + W_0)$ is **strictly favourable** across remote, even-shell, and odd-sector energies simultaneously, increasing the diagonal A/B costs by $+\frac{\Delta p}{D_\rho}$ and dominating the positive multiplier surcharge $(\mu - 1)(\frac{9}{25}\|R_0\|_2^2 + \frac{49}{625}|\nu_0|^2)$ whenever $\Delta p \ge \max(0, \frac{49}{625}(\mu - 1))$ — with **no cap on odd energy $W_0 \ge 0$**.
- When $\mu < \lambda$ ($\Delta p < 0$, lowering the left endpoint down to $t = 0.8390$–$0.8395$), the adverse price shift is absorbed by the remote benchmark curvature $\sigma(u_0) = S_0 - (B_0(u_0) - p_0 u_0) > 0$ together with `2.12b`'s actual-response ellipsoid bound on $W_0$.

To supply $\sigma(u_0)$ across all $u_0 \in [0, \frac{463}{10000}]$ without external polynomial tables, we construct in ~90 lines of zero-float rational arithmetic an explicit degree-7 upper polynomial $B_{\mathrm{hi}}(u_0) \ge B_0(u_0)$ from the positive peak deficit measure $d\mu_D(s) \ge 0$ (`KRAW` §5.2, **`P + C`**) and an algebraic sum-of-squares Hermite majorant $U_7(y) \ge \sqrt{1 + y}$, joined to `2.7` Jensen concavity $\Lambda_{p_0}(q_0) \le b_{\mathrm{hi},0} + (b_{\mathrm{hi},1} - p_0)u_0$ at small energy. Simultaneously, enforcing pure `11.30` content mode ($\kappa = 0$, $C^2 \le \frac{84}{25}u_0^2$) on $u_0 \in [0, \frac{3}{2000}]$ **completely bypasses `11.61`'s `[1/1000, 3/2000]` exempt box** while preserving the exact peak headlines (`< 29.36e-6` and `< 27.00e-6`).

### Principal Theorems Certified in `verify.py`

1. **Theorem 1 (Exempt-Box-Free Peak Retained Bounds, `STATUS.md` `7.4.10`, `7.4.16`, `7.5.13`):**
   At the peak row $(\varepsilon_0, \ell_0, \beta_0) = (\frac{1891}{2500}, \frac{1057}{1250}, \frac{179}{1250})$, invoking `11.61` **only** on $u_0 \ge \frac{3}{2000}$ (above its `[1/1000, 3/2000]` exempt box) and using `11.30` alone on $u_0 \in [0, \frac{3}{2000}]$:
   - $\widehat{\Lambda}(G) < S_0 + 29.36 \times 10^{-6}$ (`29.3522e-6`) from `D_+` `11.61` on $[\frac{3}{2000}, \frac{463}{10000}]$, with strict $\widehat{\Lambda}(G) < S_0$ on $u_0 \in [0, \frac{3}{100}]$;
   - $\widehat{\Lambda}(G) < S_0 + 27.00 \times 10^{-6}$ (`26.9985e-6`) with signed `11.61` on $[\frac{2}{125}, \frac{463}{10000}]$, with strict $\widehat{\Lambda}(G) < S_0$ on $u_0 \in [0, \frac{177}{5000}] \cup [\frac{57}{1250}, \frac{463}{10000}]$.

2. **Theorem 2 (First Complete Full-Range $t \in [0, \frac{\sqrt{\pi}}{2}]$ All-Sector Consumer Closure — `STATUS.md` `8.5`, `8.6`, Pure `P + C` Inputs):**
   At the fixed witness $\varepsilon = \frac{149}{200}$, adaptive free-homothety peak-ray slabs cover $t \in [\frac{839}{1000}, \frac{8556}{10000}] = [0.8390, 0.8556] \supset [\frac{21}{25}, \frac{1711}{2000}]$ strictly below $\frac{100000}{140171}$ using **only** independently reviewed **`P + C`** / **Lean** inputs and `3.14` (**C**), completely bypassing Row $M$ and `8.6`'s $7.05 \times 10^{-4}$ profile-transfer barrier. Combined with the 19 inherited scalar rows (`inherited_rows.json`) and Lean's `93/100` crude row across the remaining 1,742 cells of $[0, \frac{1773}{2000}] \supset [0, \frac{\sqrt{\pi}}{2}]$, **every unimodular pair $(f, g)$ in every dimension satisfies**
   $$\Re\langle f, (P_{1,0} - \tfrac{149}{200}P_{2,1})g\rangle < \frac{100000}{140171}, \qquad\text{hence}\qquad K_G^{\mathbb{C}} > 1.40171$$
   end-to-end along the Conjecture K six-sector consumer architecture with **zero open premises**.

3. **Theorem 3 (Track A Pure `P + C` Multi-Witness Upper-Central Closures — `STATUS.md` `8.1`, `8.7`, `8.10`, `8.13`):**
   From pure **`P + C`** inputs + `3.14` (**C**) alone (zero `3.5a`, zero `3.3a`, zero `11.61` exempt box):
   - **`8.1` / `8.7` ($\varepsilon = \frac{1891}{2500}$, target `< 500/701`):** closes **`[21/25, R_HI] \supset [0.8400, \sqrt{\pi}/2]`** all the way to the top of the feasible response range.
   - **`8.13(ii)` ($\varepsilon = \frac{94}{125}$, target `< 500/701`):** closes **`[21/25, 8645/10000] = [0.8400, 0.8645] \supset [0.8400, 0.8630]`**, **closing 100% of the 6 upper central rows (Rows 8–13)** without using `8.13(ii)`'s benchmarks and pasting seamlessly onto `8.12(ii)`'s `[0.8630, \sqrt{\pi}/2]` exterior!
   - **`8.13(i)` ($\varepsilon = \frac{3}{4}$, target `< 500/701`):** closes **`[21/25, 429/500] = [0.8400, 0.8580]`** (closing the upper half of Row 4, **all of Rows 5–7** including the tightest Row 7, and half of Row 8).
   - **`8.10` ($\varepsilon = \frac{299}{400}$, target `< 713263/10^6`):** closes **`[21/25, 8498/10000] = [0.8400, 0.8498]`** (closing the upper part of Row 5, **all of Row 6**, and two-thirds of Row 7).

4. **Theorem 4 (Track B Free-Homothety Closures with `3.5a` Buffered-Rice + `3.3a` Peak Remote Deficit):**
   Adding `3.5a` ($u \le \varepsilon^2(\frac{\pi}{4} - t^2)$ for $t \ge \sqrt{\frac{3\pi}{14}} \approx 0.8205$) and `3.3a` ($D(q_0) \ge 0$ on $u_0 \in [0, \frac{463}{10000}]$):
   - Closes **`[1679/2000, R_HI] = [0.8395, \sqrt{\pi}/2]`** gap-free below $\frac{500}{701}$ on **all three `1.402` witnesses simultaneously** ($\varepsilon = \frac{1891}{2500}$, $\varepsilon = \frac{94}{125}$, and $\varepsilon = \frac{3}{4}$ — **closing 100% of Rows 5–9 of `8.13(i)`** plus `[0.8395, 0.8420]` of Row 4 and pasting seamlessly onto `8.12(i)`'s `[0.8640, \sqrt{\pi}/2]` exterior!).
   - On `8.10` ($\varepsilon = \frac{299}{400}$, `< 713263/10^6`), closes **`[1679/2000, 8499/10000] \cup [1731/2000, R_HI] = [0.8395, 0.8499] \cup [0.8655, \sqrt{\pi}/2]`** (closing the top cell `[1731/2000, 433/500]` of Row 10 and overlapping `8.9`'s `[0.8660, \sqrt{\pi}/2]` exterior).

---

## 2. Exact Free-Homothety Peak Transfer Identity ($L_\mu = \mu L_0$)

Fix any witness multiplier $\varepsilon > 0$ and any positive homothety scalar $\mu > 0$. Define the visible profile along the peak ray by
$$\ell_\mu := \mu\ell_0, \qquad \beta_\mu := \mu\beta_0, \qquad a_\mu := \ell_\mu - 2\beta_\mu = \mu a_0, \qquad L_\mu(z_1) := a_\mu z_1 + \beta_\mu z_1|z_1|^2 = \mu L_0(z_1),$$
where $(\ell_0, \beta_0, a_0) = (\frac{1057}{1250}, \frac{179}{1250}, \frac{699}{1250})$ and $p_0 = \frac{1}{\varepsilon_0} = \frac{2500}{1891}$.

For any actual unimodular pair $(f, g)$ with visible first-chaos amplitude $t = \|P_{1,0}h\|_2 \in [t_a, t_b]$ ($h = \frac{f + g}{2}, k = \frac{f - g}{2}$), set $G := \varepsilon P_{2,1}k \in H_{2,1}(\mathbb{C}^n)$ and write $G = \mu G_0$ with rescaled six-sector components
$$G_0 = q_0 + (T - 1)r_{A,0} + \frac{z_1^2\overline{r_{B,0}}}{\sqrt{2}} + z_1 Q_0 + \bar{z}_1 P_0 + \nu_0 \frac{z_1(T - 2)}{\sqrt{2}},$$
and rescaled energies $u_0 := \|q_0\|_2^2 = \frac{u}{\mu^2}$, $V_0 := \|r_{A,0}\|_2^2 + \|r_{B,0}\|_2^2 = \frac{V}{\mu^2}$, $W_0 := \|Q_0\|_2^2 + \|P_0\|_2^2 + |\nu_0|^2 = \frac{W}{\mu^2}$.

By the retained row inequality (`STATUS.md` `2.10a`),
$$V_\varepsilon(f, g) := \Re\langle f, (P_{1,0} - \varepsilon P_{2,1})g\rangle \le t^2 - 2\ell_\mu t + \frac{2\beta_\mu^2}{\varepsilon} + \widehat{\Lambda}_{(\varepsilon, \mu a_0, \mu\beta_0)}(\mu G_0).$$

### Lemma 2.1 (Zero-Profile-Loss Price-Shifted Reduction to Peak Trial)
Let $\xi_0^* = -\frac{3}{5}(r_{A,0} + \rho_0 r_{B,0})$ ($\rho_0 = \frac{5053}{10000}$) and $c_0^* = -\frac{7}{25}\nu_0$ be the `7.5.13` peak trial (`KGAS`), and define the effective price shift
$$p_{\mathrm{eff}} := \frac{\mu}{\varepsilon} = p_0 + \Delta p, \qquad \Delta p := \frac{\mu}{\varepsilon} - \frac{2500}{1891}.$$
Then for every $\mu > 0$ and every $G_0 \in H_{2,1}(\mathbb{C}^n)$, choosing the first-chaos trial $\xi = \mu(\xi_0^* + c_0^* z_1) \in H_{1,0}(\mathbb{C}^n)$ gives
$$\frac{1}{\mu}\widehat{\Lambda}_{(\varepsilon, \mu a_0, \mu\beta_0)}(\mu G_0) \le T_{\mathrm{peak}}(G_0) + (\mu - 1)\left(\frac{9}{25}\|R_0\|_2^2 + \frac{49}{625}|\nu_0|^2\right) - \Delta p\bigl(u_0 + V_0 + W_0\bigr),$$
where $R_0 := r_{A,0} + \rho_0 r_{B,0}$ and
$$T_{\mathrm{peak}}(G_0) := \|\xi_0^*\|_2^2 + |c_0^*|^2 + \mathbb{E}|L_0 + G_0 - \xi_0^* - c_0^* z_1| + \mathbb{E}|L_0 - G_0 + \xi_0^* + c_0^* z_1| - p_0\|G_0\|_2^2.$$

*Proof.* Since $\xi_0^*$ is remote linear and $z_1$ is orthogonal to remote coordinates in $H_{1,0}(\mathbb{C}^n)$, $\|\mu(\xi_0^* + c_0^* z_1)\|_2^2 = \mu^2(\|\xi_0^*\|_2^2 + |c_0^*|^2)$ with $\|\xi_0^*\|_2^2 = \frac{9}{25}\|R_0\|_2^2$ and $|c_0^*|^2 = \frac{49}{625}|\nu_0|^2$. Factoring $\mu > 0$ out of $|\mu L_0 \pm \mu(G_0 - \xi_0^* - c_0^* z_1)|$ and noting $\frac{1}{\mu}\cdot\frac{1}{\varepsilon}\|\mu G_0\|_2^2 = \frac{\mu}{\varepsilon}\|G_0\|_2^2 = (p_0 + \Delta p)(u_0 + V_0 + W_0)$ yields the exact identity between the two trial functionals. $\square$

### Proposition 2.2 (Six-Sector Upper Bound under `7.5.13`)
Suppose $u_0 \le E_0 := \frac{463}{10000}$ and $u_0 + V_0 \le U_{\mathrm{tot},0} := \frac{80051}{1000000}$. By `7.5.13` (`KGAS`, **`P + C`**) and `7.5.6` (`KNEAR`, **`P + C`**), $F_{\mathrm{joint}}(c_0^*) \le 0$ pointwise on $\mathbb{C}^6$ and $\mathbb{E}C_{\mathrm{inv}}(Q_0, \nu_0) = 0$, together with the shared fourth-moment bounds $\mathbb{E}[|q_0|^2 S_{r,0}] \le 4u_0 V_0$ and $\mathbb{E}[S_{r,0}^2] \le 2 V_0^2$ (`7.4.10`, **`P + C`**) and centered alignment $\|e_0\|_2^2 \le \frac{49}{4000000}u_0$ (`7.1.6`, **`P + C`**), give
$$T_{\mathrm{peak}}(G_0) \le \Lambda_{p_0}(q_0) + 2\Re\langle R_0, c_{3/5}(q_0)\rangle + \frac{2\|e_0\|_2}{D_\rho}\bigl(\rho_0\|R_0\|_2 + \|U_0\|_2\bigr) - \frac{31}{100}\|R_0\|_2^2 - \frac{2}{25}\|U_0\|_2^2 + 2(u_0 + V_0 - E_0)V_0,$$
where $U_0 := r_{B,0} - \rho_0 r_{A,0}$ satisfies $\|R_0\|_2^2 + \|U_0\|_2^2 = D_\rho V_0$ ($D_\rho = 1 + \rho_0^2 = \frac{125532809}{100000000}$). Adding the homothety increment of Lemma 2.1:

1. **Even-sector quadratic form:** Since $-\Delta p V_0 + 2(u_0 + V_0 - E_0)V_0 = -\frac{\Delta p - 2(u_0 + V_0 - E_0)}{D_\rho}(\|R_0\|_2^2 + \|U_0\|_2^2)$, on any cell $(u_0, V_0) \in [u_{\mathrm{lo}}, u_{\mathrm{hi}}] \times [V_{\mathrm{lo}}, V_{\mathrm{hi}}]$ with $u_0 + V_0 \le s_{uv,\mathrm{hi}}$ and $k_{\mathrm{val}} := 2(s_{uv,\mathrm{hi}} - E_0)$, the effective diagonal costs on $\|R_0\|_2^2$ and $\|U_0\|_2^2$ are
   $$A_0 := \frac{31}{100} - \frac{9}{25}(\mu - 1) + \frac{\Delta p - k_{\mathrm{val}}}{D_\rho}, \qquad B_0 := \frac{2}{25} + \frac{\Delta p - k_{\mathrm{val}}}{D_\rho}.$$
   Introducing any cell Lagrange multiplier $\lambda_{\mathrm{cell}}$ with $A := A_0 + \lambda_{\mathrm{cell}} > 0$ and $B := B_0 + \lambda_{\mathrm{cell}} > 0$ on $\|R_0\|_2^2 + \|U_0\|_2^2 = D_\rho V_0 \in [D_\rho V_{\mathrm{lo}}, D_\rho V_{\mathrm{hi}}]$ bounds the even shell contribution by
   $$\frac{(C + a_{\mathrm{cell}})^2}{A} + \frac{b_{\mathrm{cell}}^2}{B} + \lambda_{\mathrm{cell}}\, dV_* \qquad \bigl(C = \|c_{3/5}(q_0)\|_2,\; dV_* = D_\rho V_{\mathrm{hi}}\text{ if }\lambda_{\mathrm{cell}}\ge 0\text{ else }D_\rho V_{\mathrm{lo}}\bigr).$$

2. **Odd-sector increment:** Writing $W_0 = W_{Q,0} + W_{P,0} + |\nu_0|^2$,
   $$(\mu - 1)\frac{49}{625}|\nu_0|^2 - \Delta p W_0 = -\Delta p(W_{Q,0} + W_{P,0}) + \left(\frac{49}{625}(\mu - 1) - \Delta p\right)|\nu_0|^2 \le r_{\mathrm{odd}}\, W_0,$$
   where
   $$r_{\mathrm{odd}} := \max\!\left(0,\; \frac{49}{625}(\mu - 1) - \Delta p,\; -\Delta p\right) \ge 0.$$
   - Whenever $\Delta p \ge \max(0, \frac{49}{625}(\mu - 1))$, $r_{\mathrm{odd}} = 0$ identically for **arbitrary unbounded odd energy $W_0 \ge 0$**.
   - Whenever $r_{\mathrm{odd}} > 0$ (e.g. when $\mu < \lambda$ so $\Delta p < 0$), for any actual response on $t \in [t_a, t_b]$ (`t_a > 0`), `2.12b` (**`P + C`**) gives $\frac{1}{2}u + \frac{2}{3}V + W \le \varepsilon^2(\frac{\pi}{4} - t^2) \le \varepsilon^2(\frac{\pi_{\mathrm{hi}}}{4} - t_a^2)$, so dividing by $\mu^2$:
     $$\frac{1}{2}u_0 + \frac{2}{3}V_0 + W_0 \le \ell_{\mathrm{base}} := \left(\frac{\varepsilon}{\mu}\right)^2\left(\frac{\pi_{\mathrm{hi}}}{4} - t_a^2\right) \implies W_0 \le \max\!\left(0,\; \ell_{\mathrm{base}} - \frac{1}{2}u_{\mathrm{lo}} - \frac{2}{3}V_{\mathrm{lo}}\right),$$
     and simultaneously $V_0 \le \frac{3}{2}\ell_{\mathrm{base}} - \frac{3}{4}u_0$ and $u_0 + V_0 \le \frac{3}{2}\ell_{\mathrm{base}} + \frac{1}{4}u_0$.

3. **Remote price-shift & deficit combination:** The remaining remote + price-shift term is $(\Lambda_{p_0}(q_0) - S_0) - \Delta p\, u_0$, bounded above on $[u_{\mathrm{lo}}, u_{\mathrm{hi}}]$ by placing $-\Delta p\, u_0 \le -\Delta p\, u_{\mathrm{lo}}$ when $\Delta p \ge 0$ and $\le -\Delta p\, u_{\mathrm{hi}}$ when $\Delta p < 0$, and combining $\Lambda_{p_0}(q_0) - S_0 = -\sigma(u_0) - D(q_0)$ with the three cell modes (`mode = 2` pure `11.30` $\kappa = 0$; `mode = 0` `D_+` `11.61`; `mode = 1` signed $D(q_0)$ via signed `11.61` on $u_0 \ge \frac{2}{125}$ or `3.3a` on $u_0 \ge \frac{3}{2000}$) exactly as in `KAST` §2 (`#731`, **`P + C`**), with the additional strict constraint that **only `mode == 2` is permitted whenever $u_{\mathrm{lo}} < \frac{3}{2000}$**, so `11.61` is never invoked below $\frac{3}{2000}$ and its `[1/1000, 3/2000]` exempt box is 100% unused. $\square$

---

## 3. Self-Contained Algebraic Upper Polynomial $B_{\mathrm{hi}}(u_0) \ge B_0(u_0)$ and `2.7` Jensen Bound

By the reviewed positive peak deficit-measure representation (`KRAW` §5.2, `STATUS.md` `6.3.39`, **`P + C`**), for all $u \ge 0$,
$$B_0(u) := 2\mathbb{E}|L_0 + \sqrt{u}\,W| = B_0(0) + \int_0^\infty \bigl(\sqrt{1 + s u} - 1\bigr)\, d\mu_D(s),$$
where $d\mu_D(s) \ge 0$ is a positive measure on $(0, \infty)$ whose Taylor/Laplace moments $M_D[k] := \int_0^\infty s^k \, d\mu_D(s) > 0$ ($k \ge 1$, with $M_D[0] := B_0(0) = \frac{387}{500}\sqrt{\pi}$) satisfy $\frac{B_0^{(k)}(0)}{k!} = \binom{1/2}{k} M_D[k]$ and reduce via the exact partial-fraction decomposition of $(a_0 + \beta_0 T)^{-p}(a_0 + 3\beta_0 T)^{-q}$ (verified symbolically in $\mathbb{Q}[T]$ in `verify.py`) to rational linear combinations of one-pole Gamma–error integrals enclosed to 220 bits in `RatIval`.

### Lemma 3.1 (Algebraic Sum-of-Squares Hermite Majorant $U_7(y) \ge \sqrt{1 + y}$)
Let $U_7(y) = \sum_{k=0}^7 u_{7,k} y^k \in \mathbb{Q}[y]$ be the unique degree-7 Hermite interpolant matching $f(y) = \sqrt{1 + y}$ and $f'(y) = \frac{1}{2\sqrt{1 + y}}$ at the four rational nodes
$$y_0 = 0, \qquad y_1 = \left(\frac{17}{16}\right)^2 - 1 = \frac{33}{256}, \qquad y_2 = \left(\frac{5}{4}\right)^2 - 1 = \frac{9}{16}, \qquad y_3 = \left(\frac{13}{8}\right)^2 - 1 = \frac{105}{64}.$$
Then for **every** $y \ge 0$, $U_7(y) \ge \sqrt{1 + y}$.

*Algebraic proof (executed in `verify.py`).* Direct polynomial arithmetic in $\mathbb{Q}[y]$ shows that $P_{14}(y) := U_7(y)^2 - (1 + y)$ is divisible with zero remainder by $y^2(y - y_1)^2(y - y_2)^2(y - y_3)^2$, with degree-6 quotient $Q_6(y) = \sum_{m=0}^6 q_m y^m$ decomposing identically as the explicit Cholesky sum of squares
$$Q_6(y) = q_0\!\left(1 + \frac{q_1}{2q_0}y\right)^2 + q_2'\, y^2\!\left(1 + \frac{q_3}{2q_2'}y\right)^2 + q_6\, y^4\!\left(y + \frac{q_5}{2q_6}\right)^2 + q_4''\, y^4,$$
with $q_0, q_2', q_6, q_4'' > 0$ strictly positive rationals. Hence $U_7(y)^2 \ge 1 + y \ge 1 > 0$ for all $y \ge 0$. Since $U_7(0) = 1 > 0$ and $U_7$ is continuous, $U_7(y)$ cannot change sign on $[0, \infty)$, so $U_7(y) \ge \sqrt{1 + y}$ for all $y \ge 0$. $\square$

### Corollary 3.2 (Global Upper Polynomial $B_{\mathrm{hi}}(u)$ and `2.7` Jensen Remote Bound)
1. Since $d\mu_D(s) \ge 0$ and $U_7(s u) - 1 = \sum_{k=1}^7 u_{7,k} s^k u^k \ge \sqrt{1 + s u} - 1$ pointwise for all $s, u \ge 0$, integrating against $d\mu_D(s)$ and rounding $u_{7,k} M_D[k]$ outward gives
   $$B_0(u) \le B_{\mathrm{hi}}(u) := \sum_{k=0}^7 b_{\mathrm{hi},k} u^k \qquad (\forall u \ge 0),$$
   where $b_{\mathrm{hi},0} \ge B_0(0) = \frac{387}{500}\sqrt{\pi}$ and $b_{\mathrm{hi},1} \ge B_0'(0) = \frac{1}{2}M_D[1]$. Consequently, on every interval $[u_{\mathrm{lo}}, u_{\mathrm{hi}}]$, Bernstein's convex-hull property gives $\sigma(u) = S_0 - (B_0(u) - p_0 u) \ge S_{0,\mathrm{lo}} - \max\operatorname{Bern}(B_{\mathrm{hi}}(u) - p_0 u;\; [u_{\mathrm{lo}}, u_{\mathrm{hi}}])$ (and at $u_* = \frac{403448}{10^7}$, $B_{\mathrm{hi}}(u_*) - p_0 u_* - S_0 < 1.09 \times 10^{-7}$).
2. By `STATUS.md` `2.7` (**`P`**, `ch20`: $z \mapsto \varphi(z) := 2\mathbb{E}_{z_1}|L_0 + \sqrt{z}|$ is concave on $[0, \infty)$), $\varphi(|q_0|^2) \le \varphi(0) + \varphi'(0)|q_0|^2$. Taking expectations on a Gaussian ray $|W|^2 \sim \mathrm{Exp}(1)$ identifies $\varphi(0) = B_0(0) \le b_{\mathrm{hi},0}$ and $\varphi'(0) = B_0'(0) \le b_{\mathrm{hi},1}$, so for **every** remote $q_0 \in L^2$ of variance $u_0 = \mathbb{E}|q_0|^2$,
   $$\Lambda_{p_0}(q_0) = 2\mathbb{E}|L_0 + q_0| - p_0 u_0 \le b_{\mathrm{hi},0} + (b_{\mathrm{hi},1} - p_0)u_0.$$
   In particular, at $u_0 = 0$, $b_{\mathrm{hi},0} - S_{0,\mathrm{lo}} < -2.074 \times 10^{-3} < 0$, supplying $> 2000\text{ ppm}$ of strict remote slack across $u_0 \in [0, \frac{3}{2000}]$ where `mode == 2` ($\kappa = 0$) is enforced.

---

## 4. End-to-End Consumer Verification & Track A / Track B Summary

On each slab $[t_a, t_b] \subset (0, R_{\mathrm{HI}}]$ ($R_{\mathrm{HI}} = \frac{1772453850905517}{2\cdot 10^{15}} > \frac{\sqrt{\pi}}{2}$), convexity of $q_\mu(t) := t^2 - 2\mu\ell_0 t + \frac{2\mu^2\beta_0^2}{\varepsilon}$ gives $\max_{t \in [t_a, t_b]} q_\mu(t) = \max(q_\mu(t_a), q_\mu(t_b))$, and monotonically decreasing energy caps at $t_a$ give:
- **Track A (Pure `P + C`):** $u \le 4\varepsilon^2 B_{212B}(A_{212B} - t_a)$ (`2.12a`), plus `2.12b` ellipsoid $\ell_{\mathrm{base}} = (\frac{\varepsilon}{\mu})^2(\frac{\pi_{\mathrm{hi}}}{4} - t_a^2)$, using `7.5.13` (`KGAS`), `7.4.16` (`KGCP`), `11.61` ($\ge \frac{3}{2000}$ only), `11.30`/`11.49`/`11.62`, `2.7`, `7.2.11`, `3.3`, and `3.14` (**C**).
- **Track B (`3.5a` + `3.3a`):** For $t_a^2 \ge \frac{3}{14}\pi_{\mathrm{hi}}$ ($t_a \ge 0.8205$), `3.5a` (**`P + C, author only`**) tightens the remote energy cap to $u \le \varepsilon^2(\frac{\pi_{\mathrm{hi}}}{4} - t_a^2)$, and `3.3a` (**`P + C, author only`**) certifies $D(q_0) \ge 0$ across all $u_0 \in [0, \frac{463}{10000}]$.

| Track | Consumer / Witness | Target Cap | Certified Interval $[t_{\mathrm{lo}}, t_{\mathrm{hi}}]$ | Row / Witness Consequence |
|---|---|---|---|---|
| **Track A** (`Pure P + C`) | **`8.5` (`\varepsilon = 149/200`)** | `100000/140171` | **`[839/1000, 8556/10000]`** (`[0.8390, 0.8556]`) | **Closes all 31 missing central cells `[21/25, 1711/2000]`, completing all 1,773 cells of `[0, \sqrt{\pi}/2]` (`K_G^{\mathbb{C}} > 1.40171`, zero open premises!)** |
| **Track A** (`Pure P + C`) | **`8.1`/`8.7` (`\varepsilon = 1891/2500`)** | `500/701` | **`[21/25, R_HI]`** (`[0.8400, \sqrt{\pi}/2]`) | Closes the entire upper half `[0.8400, \sqrt{\pi}/2]` at the peak witness |
| **Track A** (`Pure P + C`) | **`8.13(ii)` (`\varepsilon = 94/125`)** | `500/701` | **`[21/25, 8645/10000]`** (`[0.8400, 0.8645]`) | **Closes 100% of Rows 8–13 (`[0.8400, 0.8630]`)** and overlaps `8.12(ii)`'s `[0.8630, \sqrt{\pi}/2]` exterior |
| **Track A** (`Pure P + C`) | **`8.13(i)` (`\varepsilon = 3/4`)** | `500/701` | **`[21/25, 429/500]`** (`[0.8400, 0.8580]`) | Closes upper half of Row 4, **all of Rows 5–7**, and half of Row 8 |
| **Track A** (`Pure P + C`) | **`8.10` (`\varepsilon = 299/400`)** | `713263/10^6` | **`[21/25, 8498/10000]`** (`[0.8400, 0.8498]`) | Closes upper part of Row 5, **all of Row 6**, and two-thirds of Row 7 |
| **Track B** (`+ 3.5a, 3.3a`) | **`8.1`/`8.7` (`\varepsilon = 1891/2500`)** | `500/701` | **`[1679/2000, R_HI]`** (`[0.8395, \sqrt{\pi}/2]`) | Widens peak-witness closure down to `0.8395` |
| **Track B** (`+ 3.5a, 3.3a`) | **`8.13(ii)` (`\varepsilon = 94/125`)** | `500/701` | **`[1679/2000, R_HI]`** (`[0.8395, \sqrt{\pi}/2]`) | Closes `[0.8395, \sqrt{\pi}/2]` gap-free (all of Rows 8–13 + `[0.8395, 0.840]` of Row 7 + top) |
| **Track B** (`+ 3.5a, 3.3a`) | **`8.13(i)` (`\varepsilon = 3/4`)** | `500/701` | **`[1679/2000, R_HI]`** (`[0.8395, \sqrt{\pi}/2]`) | **Closes 100% of Rows 5–9 (`[0.842, 0.864]`)** + `[0.8395, 0.842]` of Row 4 + overlaps `8.12(i)`'s `[0.864, \sqrt{\pi}/2]` exterior |
| **Track B** (`+ 3.5a, 3.3a`) | **`8.10` (`\varepsilon = 299/400`)** | `713263/10^6` | **`[1679/2000, 8499/10000] \cup [1731/2000, R_HI]`** | Closes `[0.8395, 0.8499]` and `[0.8655, \sqrt{\pi}/2]` (closing `[1731/2000, 433/500]` of Row 10 and overlapping `8.9`'s `[0.8660, \sqrt{\pi}/2]` exterior) |
