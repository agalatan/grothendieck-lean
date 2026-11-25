# Global All-Amplitude Closure of the Raw Conjecture K Joint A/B Bounds (`7.4`, `7.4.5`, `7.4.17`)

**Agent-ID:** `gemini-4c4c` · **Task:** Closes `#706`, Refs `#177` · **Status:** **P + C, author only**

Code and exact certificate: [`../../code/raw-joint-ab-gemini-4c4c/`](../../code/raw-joint-ab-gemini-4c4c/) (`certify_raw_joint_ab.cpp`, `result.json`, `verify.py`, `test_controls.py`).

---

## 1. Main Theorem and Immediate Corollaries

Let $z_1 \sim \mathcal{CN}(0, 1)$ have density $\pi^{-1} e^{-|z_1|^2}$ on $\mathbb{C}$, write $T = |z_1|^2 \sim \mathrm{Exp}(1)$, and fix any of the three standard Conjecture K profile rows (`STATUS.md` §0):

| Row | $a = \ell - 2b$ | $b = \beta$ | $\varepsilon$ | $p = 1/\varepsilon$ | $\kappa_{\mathrm{diag}}$ | Sharp zero-core obstruction (`7.4.9`) |
|---|---|---|---|---|---|---|
| `peak` | $\frac{699}{1250} = 0.5592$ | $\frac{179}{1250} = 0.1432$ | $\frac{1891}{2500} = 0.7564$ | $\frac{2500}{1891} \approx 1.3220518$ | $\frac{7}{25} = 0.28$ | $0.29836465\dots$ |
| `flank` | $\frac{14}{25} = 0.56$ | $\frac{1467}{10000} = 0.1467$ | $\frac{149}{200} = 0.745$ | $\frac{200}{149} \approx 1.3422819$ | $\frac{3}{10} = 0.30$ | $0.32315284\dots$ |
| `upper` | $\frac{573}{1000} = 0.573$ | $\frac{19}{125} = 0.152$ | $\frac{1891}{2500} = 0.7564$ | $\frac{2500}{1891} \approx 1.3220518$ | $\frac{31}{100} = 0.31$ | $0.32771589\dots$ |

Put $L(z_1) = z_1(a + b T)$, $\operatorname{ph}(w) = w/|w|$ for $w \ne 0$ and $\operatorname{ph}(0) = 0$. For $(x, \alpha, \beta) \in \mathbb{C}^3$, define the raw joint A/B shell and its visible remainder (`STATUS.md` §7.4):
$$h(z_1; \alpha, \beta) = (T - 1)\alpha + \frac{z_1^2}{\sqrt{2}}\bar{\beta}, \qquad S_0 = |\alpha|^2 + |\beta|^2,$$
$$r_x(\alpha, \beta) = 2\,\mathbb{E}_{z_1}\Bigl[|L + x + h| - |L + x| - \operatorname{Re}\bigl(h\,\overline{\operatorname{ph}(L + x)}\bigr)\Bigr],$$
and the signed and robust target forms of `STATUS.md` §7.4:
$$Q_s(\alpha, \beta) = \left(p - \frac{6}{25}\right)|\alpha|^2 + \left(p - \frac{13}{50}\right)|\beta|^2 - \frac{59}{250}\operatorname{Re}(\alpha\bar{\beta}),$$
$$Q_r(\alpha, \beta) = \left(p - \frac{6}{25}\right)|\alpha|^2 + \left(p - \frac{13}{50}\right)|\beta|^2 + \frac{59}{250}|\alpha\beta| \ge Q_s(\alpha, \beta).$$

> [!IMPORTANT]
> **Theorem 1.1 (Global Raw Joint A/B Bounds on $\mathbb{C}^3$).**
> At each of the three rows (`peak`, `flank`, `upper`), for **every** $(x, \alpha, \beta) \in \mathbb{C}^3$ (with strict inequality whenever $(\alpha, \beta) \ne (0, 0)$):
> 1. **Target S (Signed and Robust `7.4` / `7.4.5` with Uniform Reserve $\frac{1}{100}$):**
>    $$r_x(\alpha, \beta) \le Q_{s,+}(\alpha, \beta) := Q_s(\alpha, \beta) - \frac{1}{100}(|\alpha|^2 + |\beta|^2) = \left(p - \frac{1}{4}\right)|\alpha|^2 + \left(p - \frac{27}{100}\right)|\beta|^2 - \frac{59}{250}\operatorname{Re}(\alpha\bar{\beta}).$$
>    In particular, on the compact box $0 \le x \le \frac{29}{10}$, $|\alpha|, |\beta| \le \frac{2}{5}$ of `STATUS.md` `7.4.5` — and in fact on all of $\mathbb{C}^3$ — both the signed and robust inequalities hold with reserve $\eta = \frac{1}{100} = 10^{-2} \gg \frac{807}{10^7} > \frac{753}{10^7}$.
> 2. **Target D (Global Common Diagonal Cost Below `7.4.9`):**
>    $$r_x(\alpha, \beta) \le Q_{\mathrm{diag}}(\alpha, \beta) := (p - \kappa_{\mathrm{diag}})(|\alpha|^2 + |\beta|^2),$$
>    where $\kappa_{\mathrm{diag}} = \frac{7}{25} = 0.28$ (`peak`), $\frac{3}{10} = 0.30$ (`flank`), and $\frac{31}{100} = 0.31$ (`upper`).

Why does the raw joint remainder satisfy pure quadratic costs globally at **every** amplitude, whereas the tilted remainder `(P)` at $s = 3/5$ (`7.4.10`) required a quartic correction $(|w|^2/2 + S_r)S_r$? Because at zero tilt ($s = 0$), the A-shell profile $T - 1$ vanishes identically on the circle $T = 1$ (`|L| = a + b \approx 0.702`), whereas $T - 2/5 = +0.6$ does not: at finite amplitudes along $x \approx a + b$, the raw shell never creates a concentrated cusp against the mode of $T \sim \mathrm{Exp}(1)$, and the pointwise cost actually *increases* with amplitude away from the zero-core quadratic limit `7.4.9`.

### Immediate Corollaries

**Corollary 1.2 (Unconditional Closure of `7.4` and `7.4.5`, and Global $L^2$ Upgrades of `6.2.1`, `6.2.2`, `7.1.1`).**
Let $(q, r_A, r_B)$ be **any** square-integrable random variables in $L^2$ of the remote coordinates (arbitrary dimension, arbitrary mutual dependence/sharing, arbitrary non-Gaussian distributions, and arbitrary energies — no $\|r_A\|_2^2, \|r_B\|_2^2 \le 0.0113$ cap and no $q \in H_{2,1}$ or $r_A, r_B \in H_{1,0}$ restriction). Put $H_{\mathrm{AB}} = (T - 1)r_A + (z_1^2/\sqrt{2})\bar{r}_B$, $F_A(y) = \mathbb{E}_{z_1}[(T - 1)\operatorname{ph}(L + y)] = y g(|y|^2)$, and $F_B(y) = \mathbb{E}_{z_1}[(z_1^2/\sqrt{2})\overline{\operatorname{ph}(L + y)}] = y g_B(|y|^2)$, with the standard inner product $\langle f, g\rangle = \mathbb{E}[\bar{f} g]$. Because $q + H_{\mathrm{AB}}$ is even in $z_1$ while $L$ is odd in $z_1$ ($z_1 \mapsto -z_1$ flips $L$ and fixes $q$ and $H_{\mathrm{AB}}$, so $|L - (q + H_{\mathrm{AB}})|$ has the same law as $|L + q + H_{\mathrm{AB}}|$), $\Lambda(q + H_{\mathrm{AB}}) - \Lambda(q)$ equals
$$2\,\mathbb{E}\operatorname{Re}\bigl(\bar{r}_A F_A(q) + \bar{r}_B F_B(q)\bigr) + \mathbb{E}\bigl[r_q(r_A, r_B) - p(|r_A|^2 + |r_B|^2)\bigr],$$
since $\mathbb{E}_{z_1}[H_{\mathrm{AB}}\,\overline{\operatorname{ph}(L + q)}] = r_A\,\overline{F_A(q)} + \bar{r}_B F_B(q)$ and $\operatorname{Re}(r_A\,\overline{F_A(q)}) = \operatorname{Re}(\bar{r}_A F_A(q))$. Taking expectations of Theorem 1.1 pointwise over the remote coordinates yields at all three rows (`peak`, `flank`, `upper`):
1. **Signed and Robust `7.4` with reserve $\frac{1}{100}$:**
   $$\mathbb{E}\,R(L + q, H_{\mathrm{AB}}) \le \left(p - \frac{1}{4}\right)\|r_A\|_2^2 + \left(p - \frac{27}{100}\right)\|r_B\|_2^2 - \frac{59}{250}\operatorname{Re}\mathbb{E}[r_A\bar{r}_B] \le \left(p - \frac{1}{4}\right)\|r_A\|_2^2 + \left(p - \frac{27}{100}\right)\|r_B\|_2^2 + \frac{59}{250}\|r_A\|_2\|r_B\|_2.$$
2. **Global Common Diagonal Cost:**
   $$\Lambda(q + H_{\mathrm{AB}}) \le \Lambda(q) + 2\operatorname{Re}\langle r_A, F_A(q)\rangle + 2\operatorname{Re}\langle r_B, F_B(q)\rangle - \kappa_{\mathrm{diag}}\bigl(\|r_A\|_2^2 + \|r_B\|_2^2\bigr).$$
3. **Pure A-shell and pure B-shell global costs (`6.2.1`, `6.2.2`, `7.1.1`):** Setting $r_B = 0$ removes both the $\|U\|_2^2 \le 0.0113$ cap and the Gaussianity hypothesis from `6.2.1` and eliminates the $\eta > 0$ slack of `6.2.2`, giving $\Lambda(q + (T - 1)r_A) \le \Lambda(q) + 2\operatorname{Re}\langle r_A, F_A(q)\rangle - \kappa_{\mathrm{diag}}\|r_A\|_2^2$ ($\kappa_{\mathrm{diag}} = 0.28, 0.30, 0.31 > 0.24$) at all amplitudes for arbitrary $r_A \in L^2$. Setting $r_A = 0$ raises $\kappa_B$ in `7.1.1` from $(0.26, 0.29, 0.30)$ to $(0.28, 0.30, 0.31)$.

**Corollary 1.3 (All-Amplitude First-Chaos Quadratic Gain and Peak Content Assembly `7.4.2`).**
Suppose now that $r_A, r_B \in H_{1,0}$ lie in the remote first chaos (complex Gaussian linear forms, as in $G \in H_{2,1}$, with **no** variance/amplitude cap on $\|r_A\|_2, \|r_B\|_2$), while $q \in L^2$ is any remote variable. Orthogonal projection onto $H_{1,0}$ gives $\langle r_A, F_A(q)\rangle = \langle r_A, c_A(q)\rangle$ and $\langle r_B, F_B(q)\rangle = \langle r_B, c_B(q)\rangle$ with $c_A(q) = \Pi_{1,0}[F_A(q)]$ and $c_B(q) = \Pi_{1,0}[F_B(q)]$. Applying `7.4.1` (`STATUS.md`) to Corollary 1.2 gives across **all** first-chaos driver amplitudes:
$$\Lambda(q + H_{\mathrm{AB}}) \le \Lambda(q) + \frac{\|c_A(q)\|^2 + \|c_B(q)\|^2}{\kappa_{\mathrm{diag}}},$$
and, from Target S ($k_A' = \frac{1}{4}$, $k_B' = \frac{27}{100}$, $m = +\frac{59}{500}$, Schur complement $D_S := k_B' - m^2/k_A' = \frac{27}{100} - 4\cdot\frac{3481}{250000} = \frac{6697}{31250} > 0$),
$$\Lambda(q + H_{\mathrm{AB}}) \le \Lambda(q) + 4\|c_A(q)\|^2 + \frac{31250}{6697}\left\|c_B(q) - \frac{59}{125}c_A(q)\right\|^2.$$
At the `peak` row, let $q \in H_{2,1}$ be any remote cubic with $u = \|q\|_2^2 \le \frac{463}{10000}$, so $\Pi_{1,0}q = 0$ and the centered alignment `7.1.6` gives $\|c_B(q) - \rho c_A(q)\| \le e_0\sqrt{u}$ with $\rho = \frac{5053}{10000}$ and $e_0 = \frac{7}{2000}$. Put $C = \|c_A(q)\|$ and $D(q) = B(u) - 2\mathbb{E}|L + q|$:
1. **Strong deficit premise $C^2 \le \gamma D(q)$ under Target D ($\kappa_{\mathrm{diag}} = \frac{7}{25} = 0.28$):** Since $\frac{7/25}{1 + \rho^2} = \frac{28000000}{125532809} \approx 0.223049 > \frac{11}{50} = 0.22$, taking $\gamma = \frac{11}{50}$ gives a strictly negative quadratic coefficient $A_D = \frac{1 + \rho^2}{7/25} - \frac{50}{11} < 0$. Maximizing $A_D C^2 + \frac{2\rho e_0}{7/25} C\sqrt{u} + \frac{e_0^2}{7/25}u$ over $C \ge 0$ and $u \le \frac{463}{10000}$ in exact rational arithmetic (`verify.py`) yields:
   $$\Lambda(q + H_{\mathrm{AB}}) \le B(u) - p u + \frac{9723}{306225616} < S + 3.18\cdot 10^{-5} < S + 10^{-4}.$$
   This raises the sufficient content constant for diagonal joint A/B closure in `7.4.2` from `0.15` to **`11/50 = 0.22`** (consuming `6.3.3` and `6.3.13` directly across all first-chaos driver amplitudes; at $\gamma = \frac{3}{20} = 0.15$ the excess is $\frac{42133}{14672125840} < 2.88\cdot 10^{-6}$).
2. **Strong and additive-slack deficit premises $C^2 \le \frac{6}{25}D(q) + \eta_c$ ($\eta_c \ge 0$) under Target S:** Since $\rho - \frac{59}{125} = \frac{333}{10000}$ and $A_S = 4 + \frac{31250}{6697}(\frac{333}{10000})^2 - \frac{25}{6} = -\frac{280609}{1737600} < 0$, substituting $-D(q) \le -\frac{25}{6}C^2 + \frac{25}{6}\eta_c$ and maximizing over $C \ge 0$, $u \le \frac{463}{10000}$ gives:
   $$\Lambda(q + H_{\mathrm{AB}}) \le B(u) - p u + \frac{25}{6}\eta_c + \frac{3241}{1186575200} \le S + \frac{25}{6}\eta_c + \frac{3241}{1186575200}.$$
   - For exact zero-slack $\eta_c = 0$ (`6.3.4`, `6.3.5`, `6.3.6`, `6.3.9`, `6.3.14`–`6.3.16b`, `6.3.41`, and the zero-slack domain of `6.3.43(c)`), this gives $\Lambda(q + H_{\mathrm{AB}}) < S + 2.74\cdot 10^{-6}$ (improving `7.4.2`'s `1.9372e-5` bound with no driver-energy cap).
   - For the signed bounded-kurtosis cover $\chi \le \frac{841}{10000}$ of `6.3.43(c)` ($\eta_c = 10^{-6}$), carrying $\frac{25}{6}\eta_c$ explicitly gives $\Lambda(q + H_{\mathrm{AB}}) < S + 6.90\cdot 10^{-6} < S + 10^{-4}$.
3. **Weak allowance premise $C^2 \le \frac{6}{25}\bigl(S + 10^{-4} - \Lambda(q)\bigr)$ under Target S (`6.3.40` and the equal-block conclusion of `6.3.42`):** Set $T_{\mathrm{allow}} := S + 10^{-4} - \Lambda(q)$. By the peak remote cap `3.3` (`STATUS.md`), $\Lambda(q) < S + \frac{9}{25000000}$, so $T_{\mathrm{allow}} > 10^{-4} - \frac{9}{25000000} = \frac{2491}{25000000} > 0$, hence for $u \le \frac{463}{10000}$:
   $$\frac{u}{T_{\mathrm{allow}}} < \frac{463/10000}{2491/25000000} = \frac{1157500}{2491} < \frac{290521}{625} = \left(\frac{539}{25}\right)^2, \qquad \frac{C}{\sqrt{T_{\mathrm{allow}}}} \le \sqrt{\frac{6}{25}} < \frac{49}{100}.$$
   Dividing the Target S gain bound by $T_{\mathrm{allow}}$ gives (`verify.py`):
   $$\frac{\Lambda(q + H_{\mathrm{AB}}) - \Lambda(q)}{T_{\mathrm{allow}}} < 4\cdot\frac{6}{25} + \frac{31250}{6697}\left(\frac{333}{10000}\cdot\frac{49}{100} + \frac{7}{2000}\cdot\frac{539}{25}\right)^2 = \frac{214154857729}{214304000000} < 1,$$
   so $\Lambda(q + H_{\mathrm{AB}}) < \Lambda(q) + T_{\mathrm{allow}} = S + 10^{-4}$ across the weak-form regions of `6.3.40` and `6.3.42` as well.

---

## 2. Exact Gauge Reduction and Smooth Shifted Polar Coordinates

**Lemma 2.1 ($U(1)$ Rotation and Conjugation Gauge).**
Both $Q_{s,+}(\alpha, \beta)$ and $Q_{\mathrm{diag}}(\alpha, \beta)$ are invariant under simultaneous phase rotation $(\alpha, \beta) \mapsto (e^{i\phi}\alpha, e^{i\phi}\beta)$ and complex conjugation $(\alpha, \beta) \mapsto (\bar{\alpha}, \bar{\beta})$. Moreover, for every $\phi \in \mathbb{R}$, writing $z_1 = e^{i\phi} z_1'$ ($z_1' \sim \mathcal{CN}(0, 1)$, $T' = T$):
$$L(z_1) + e^{i\phi} w + h(z_1; e^{i\phi}\alpha, e^{i\phi}\beta) = e^{i\phi}\Bigl(L(z_1') + w + (T' - 1)\alpha + \frac{(z_1')^2}{\sqrt{2}}e^{i\phi}\cdot e^{-i\phi}\bar{\beta}\Bigr) = e^{i\phi}\bigl(L(z_1') + w + h(z_1'; \alpha, \beta)\bigr),$$
and similarly $\overline{L(\bar{z}_1) + w + h(\bar{z}_1; \bar{\alpha}, \bar{\beta})} = L(z_1) + \bar{w} + h(z_1; \alpha, \beta)$. Since $\operatorname{ph}(e^{i\phi} u) = e^{i\phi}\operatorname{ph}(u)$ and $\operatorname{ph}(\bar{u}) = \overline{\operatorname{ph}(u)}$, we have for all $(x, \alpha, \beta) \in \mathbb{C}^3$:
$$r_{e^{i\phi} w}(e^{i\phi}\alpha, e^{i\phi}\beta) = r_w(\alpha, \beta), \qquad r_{\bar{w}}(\bar{\alpha}, \bar{\beta}) = r_w(\alpha, \beta).$$
Choosing $\phi = -\arg(x)$ reduces $x \in \mathbb{C}$ to $w = |x| \in [0, \infty)$, and then conjugating if $\operatorname{Im}\alpha < 0$ (which fixes $w \ge 0$) reduces to:
$$w \in [0, \infty), \qquad v := (\operatorname{Re}\alpha, \operatorname{Re}\beta, \operatorname{Im}\alpha, \operatorname{Im}\beta) \in \mathbb{R}^2 \times [0, \infty) \times \mathbb{R}, \qquad S_0 = \|v\|_2^2.$$

**Lemma 2.2 (Smooth Shifted Polar Pushforward).**
Write $H(T) = T(a + b T)^2$ for $T \ge 0$. Since $a, b > 0$, $H'(T) = (a + b T)(a + 3 b T) \ge a^2 > 0$, so $H : [0, \infty) \to [0, \infty)$ is a $C^\infty$ diffeomorphism onto $[0, \infty)$. Under $y = L(z_1) = y_1 + i y_2$, $|y|^2 = H(T)$ and $dy_1\,dy_2 = (a + b T)(a + 3 b T)\,d(\operatorname{Re} z_1)\,d(\operatorname{Im} z_1)$, so the pushforward law of $L(z_1)$ has globally $C^\infty$ radial density $\pi^{-1} f(H^{-1}(|y|^2))$ on $\mathbb{R}^2$, where
$$f(T) = \frac{e^{-T}}{(a + b T)(a + 3 b T)}.$$
Setting $L(z_1) + w = r e^{i\theta}$ ($r \ge 0$, $\theta \in (-\pi, \pi)$), we have $y = r e^{i\theta} - w$, $|y|^2 = (r - w)^2 + 2 r w (1 - \cos\theta)$, $T = H^{-1}(|y|^2)$, $z_1 = y / (a + b T) = Z_r + i Z_i$, and the exact probability measure
$$d\gamma(r, \theta) = 2 r f(T)\,\frac{dr\,d\theta}{2\pi},$$
which is $C^\infty$ in $(r, \theta, w)$ everywhere on $[0, \infty) \times [-\pi, \pi] \times [0, \infty)$ (cancelling $1/r$ in $\frac{|h|^2}{|L+w|}\,d\gamma = 2 f(T)|h|^2\,\frac{dr\,d\theta}{2\pi}$ identically!). With $z_1^2/\sqrt{2} = z_{2,r} + i z_{2,i}$ and $v = (\alpha_r, \beta_r, \alpha_i, \beta_i)$:
$$\operatorname{Re} h = (T - 1)\alpha_r + z_{2,r}\beta_r + z_{2,i}\beta_i, \qquad \operatorname{Im} h = (T - 1)\alpha_i + z_{2,i}\beta_r - z_{2,r}\beta_i.$$
Under $\theta \mapsto -\theta$ (with $w \in \mathbb{R}$), $T$ and $z_{2,r}$ are even while $z_{2,i}$ and $\sin\theta$ are odd, so replacing $\theta$ by $-\theta$ acts on $v$ by flipping the odd coordinates $(\alpha_i, \beta_i) \mapsto (-\alpha_i, -\beta_i)$.

---

## 3. Zero-Float Exact Rational Shift and Amplitude Exteriors

Both exterior regions are proved in pure `Fraction` arithmetic in `verify.py` (`verify_exteriors_and_helpers()`), with zero floating-point operations:

**Proposition 3.1 (Shift Exterior $w \ge \frac{29}{10}$, All Amplitudes).**
For every row (`peak`, `flank`, `upper`), every $w \ge \frac{29}{10}$, and every $(\alpha, \beta) \in \mathbb{C}^2$:
$$r_w(\alpha, \beta) \le \mathbb{E}_{z_1}\frac{|h|^2}{|L + w|} < \frac{187}{200}S_0 < \min\bigl(Q_{\mathrm{diag}}(\alpha, \beta),\, Q_{s,+}(\alpha, \beta)\bigr).$$
*Proof.* Using $|z + u| - |z| - \operatorname{Re}(u\overline{\operatorname{ph}(z)}) \le \frac{|u|^2}{2|z|}$, we have $r_w(\alpha, \beta) \le \mathbb{E}_{z_1}[|h|^2/|L + w|]$. For every $(\alpha, \beta) \in \mathbb{C}^2$ and $|z_1|^2 = T$, Cauchy–Schwarz in $\mathbb{C}^2$ gives
$$|h|^2 = \left|(T - 1)\alpha + \frac{z_1^2}{\sqrt{2}}\bar{\beta}\right|^2 \le \bigl((T - 1)^2 + \tfrac{1}{2}T^2\bigr)\bigl(|\alpha|^2 + |\beta|^2\bigr) = \left(\frac{3}{2}T^2 - 2T + 1\right)S_0,$$
with exact antiderivative $\frac{d}{dT}\bigl[e^{-T}(\frac{3}{2}T^2 + T + 2)\bigr] = -e^{-T}(\frac{3}{2}T^2 - 2T + 1)$. For fixed $T$ with $R = \sqrt{H(T)}$ and $w \ge \frac{29}{10}$, whenever $z = H(T)/w^2 < 1$:
$$\frac{1}{2\pi}\int_{-\pi}^{\pi} \frac{d\psi}{\sqrt{R^2 + w^2 + 2 R w \cos\psi}} = \frac{1}{w}\sum_{k=0}^{\infty} \left(\frac{\binom{2k}{k}}{4^k}\right)^2 z^k.$$
Splitting at $T_{\mathrm{split}} = \frac{97}{20} = 4.85$ (where $H(97/20)/(29/10)^2 < 1$ at all three rows):
- On $[0, 97/20]$, partitioning into $200$ equal intervals $[T_j, T_{j+1}]$ and using monotonicity of $z(T)$ together with the 24-term hypergeometric sum plus geometric tail $\binom{48}{24}^2 16^{-24} z^{24}/(1 - z)$ bounds $\mathbb{E}[\mathbf{1}_{T \le 97/20}|h|^2/|L + w|]$ in exact rational arithmetic (`inner`).
- On $T \ge 97/20$, $\frac{3}{2}T^2 - 2T + 1$ divided by $H'(T)$ times $e^{-T}$ is decreasing for $T \ge 3$ (its pushforward planar density on $L(z_1)$ is bounded by $\pi^{-1} d_{\mathrm{tail}}$ with $d_{\mathrm{tail}} = e^{-T_{\mathrm{split}}}(\frac{3}{2}T_{\mathrm{split}}^2 - 2T_{\mathrm{split}} + 1)/H'(T_{\mathrm{split}})$), so the planar bathtub/rearrangement inequality $\int_{\mathbb{R}^2} |y + w|^{-1}\rho(y)\,dy \le 2\sqrt{\pi \|\rho\|_\infty \|\rho\|_1}$ bounds $\mathbb{E}[\mathbf{1}_{T > 97/20}|h|^2/|L + w|] \le 2\sqrt{M(T_{\mathrm{split}}) d_{\mathrm{tail}}}\,S_0$ (`outer`).
In `verify.py`, `inner + outer < 187/200 = 0.935` is verified at all three rows in exact `Fraction` arithmetic, and Sylvester's criterion verifies both $(p - \kappa_{\mathrm{diag}}) - \frac{187}{200} > \frac{1}{10} > 0$ and $\det(Q_{s,+} - \frac{187}{200}I_2) > 0$. $\square$

**Proposition 3.2 (Amplitude Exterior $\|v\|_\infty \ge 4$, All Shifts $w \in \mathbb{C}$).**
For every $w \in \mathbb{C}$ and every $v = (\alpha_r, \beta_r, \alpha_i, \beta_i) \in \mathbb{R}^4$ with $\|v\|_\infty \ge 4$:
$$r_w(\alpha, \beta) < \frac{94}{25}\sqrt{S_0} \le \frac{47}{50}S_0 < \min\bigl(Q_{\mathrm{diag}}(\alpha, \beta),\, Q_{s,+}(\alpha, \beta)\bigr).$$
*Proof.* By Lemma 2.1 we may take $w \in [0, \infty)$. In $L^2(z_1)$, $e_A(z_1) = T - 1$ and $e_B(z_1) = z_1^2/\sqrt{2}$ are orthonormal ($\mathbb{E}[(T-1)^2] = 1$, $\frac{1}{2}\mathbb{E}[T^2] = 1$, and distinct angular frequencies $0$ and $+2$), so $\mathbb{E}_{z_1}|h|^2 = |\alpha|^2 + |\beta|^2 = S_0$. First, $|L + w + h| - |L + w| \le |h|$ and Cauchy–Schwarz give $2\,\mathbb{E}_{z_1}[|L + w + h| - |L + w|] \le 2\,\mathbb{E}_{z_1}|h| \le 2\sqrt{\mathbb{E}_{z_1}|h|^2} = 2\sqrt{S_0}$. Second, put $\phi(z_1) = \operatorname{ph}(L(z_1) + w)$ ($|\phi| \le 1$), $c_1 = \mathbb{E}_{z_1}[(T - 1)\overline{\phi(z_1)}]$, and $c_2 = \mathbb{E}_{z_1}[(z_1^2/\sqrt{2})\overline{\phi(z_1)}]$. Immediately $|c_1| \le \mathbb{E}|T - 1| = \frac{2}{e}$. For $c_2$, write $z_1 = \sqrt{T} e^{i\theta}$ and $R = \sqrt{H(T)} = \sqrt{T}(a + b T)$. If $w = 0$, $\overline{\phi(\sqrt{T}e^{i\theta})} = e^{-i\theta}$ and $c_2 = 0$. If $w > 0$, fix any $T > 0$ with $R \ne w$ (eliminating the single measure-zero radius $T = H^{-1}(w^2)$): on $S^1$, $\psi(\theta) := \overline{\operatorname{ph}(w + R e^{i\theta})} = e^{-i\alpha(\theta)}$ is $C^\infty$ and $2\pi$-periodic with $|\psi'(\theta)| = |\alpha'(\theta)|$, where $\alpha'(\theta) = \frac{R(R + w\cos\theta)}{w^2 + R^2 + 2 R w \cos\theta}$. When $R > w$, $\alpha'(\theta) > 0$ everywhere and $\int_0^{2\pi} |\psi'(\theta)|\,d\theta = \alpha(2\pi) - \alpha(0) = 2\pi$; when $0 < R < w$, $\alpha(\theta)$ increases monotonically from $-\arcsin(R/w)$ to $+\arcsin(R/w)$ on one arc between $\cos\theta = -R/w$ and decreases monotonically back on the complementary arc, so $\int_0^{2\pi} |\psi'(\theta)|\,d\theta = 4\arcsin(R/w) < 2\pi$. Integrating by parts on $S^1$ therefore yields for every $T \ne H^{-1}(w^2)$:
$$\left|\frac{1}{2\pi}\int_0^{2\pi} e^{2 i \theta}\psi(\theta)\,d\theta\right| = \left|-\frac{1}{4\pi i}\int_0^{2\pi} e^{2 i \theta}\psi'(\theta)\,d\theta\right| \le \frac{1}{4\pi}\int_0^{2\pi} |\psi'(\theta)|\,d\theta \le \frac{1}{2}.$$
Multiplying by $\frac{T}{\sqrt{2}}e^{-T}$ and integrating over $T > 0$ gives $|c_2| \le \frac{\mathbb{E}[T]}{2\sqrt{2}} = \frac{1}{2\sqrt{2}}$, so $|c_2|^2 \le \frac{1}{8}$. Using $e > \sum_{k=0}^6 \frac{1}{k!} = \frac{1957}{720}$, `verify.py` checks $|c_1|^2 + |c_2|^2 < \frac{4}{(1957/720)^2} + \frac{1}{8} = \frac{20418649}{30638792} < (\frac{22}{25})^2 = \frac{484}{625}$. Hence $-2\operatorname{Re}\mathbb{E}_{z_1}[h\overline{\phi}] = -2\operatorname{Re}(\alpha c_1 + \bar{\beta} c_2) \le 2\sqrt{|c_1|^2 + |c_2|^2}\sqrt{S_0} < \frac{44}{25}\sqrt{S_0}$, giving $r_w(\alpha, \beta) < \frac{94}{25}\sqrt{S_0}$. For $\|v\|_\infty \ge 4$, $\sqrt{S_0} = \|v\|_2 \ge \|v\|_\infty \ge 4$, so $r_w(\alpha, \beta) < \frac{47}{50}S_0 = 0.94\,S_0$, and Sylvester's criterion in `verify.py` verifies $(p - \kappa_{\mathrm{diag}}) - \frac{47}{50} > \frac{7}{100}$ and $\det(Q_{s,+} - \frac{47}{50}I_2) > 0$ at all three rows. $\square$

---

## 4. Part 1: Continuous Rational-Secant Origin Matrix on $w \in [0, 3]$

By Propositions 3.1 and 3.2, it suffices to certify $w \in [0, 3]$ (overlapping $[\frac{29}{10}, \infty)$ on $[\frac{29}{10}, 3]$) and $\|v\|_\infty \le 4$.

**Lemma 4.1 (Rational Secant Envelope and Block Diagonalization).**
1. Let $M(T) := 1 + \frac{5}{4}T$. Then $M(T)^2 - \bigl((T - 1)^2 + \frac{1}{2}T^2\bigr) = \frac{9}{2}T + \frac{1}{16}T^2 \ge 0$ for all $T \ge 0$, so $|h(z_1; \alpha, \beta)| \le M(T)\sqrt{S_0}$.
2. By the independently reviewed `KJSEC` Theorem 2(a) (`STATUS.md` §0, **P + C**): for any $r > 0$, $\eta \in [0, 1)$, and $h e^{-i\theta} = u_\parallel + i u_\perp$ with $|h| \le \eta r$:
   $$2\Bigl(\sqrt{(r + u_\parallel)^2 + u_\perp^2} - (r + u_\parallel)\Bigr) \le \frac{1}{r}\Bigl(w_P(\eta)|h|^2 + w_H(\eta) u_\perp^2\Bigr),$$
   where $w_P(\eta) = \frac{\eta^2}{1 - \eta + \eta^2} \ge 0$ and $w_H(\eta) = \frac{1 - \eta^2}{1 - \eta + \eta^2} \ge 0$ ($1 - \eta + \eta^2 \ge \frac{3}{4}$). At $\eta = 1$ ($w_P(1) = 1$, $w_H(1) = 0$), the inequality holds globally for **every** $r > 0$ and **every** $h \in \mathbb{C}$ (including cells where $|h| > r$, such as the innermost ring $a_r = 0$): setting $t := (2 r u_\parallel + |h|^2)/r^2 = ((r + u_\parallel)^2 + u_\perp^2)/r^2 - 1 \ge -1$, concavity $\sqrt{1 + t} \le 1 + \frac{1}{2}t$ gives $2(r\sqrt{1 + t} - r - u_\parallel) \le \frac{|h|^2}{r}$.
3. Integrating over $\theta \in (-\pi, \pi)$ for $w \in \mathbb{R}$, parity under $\theta \mapsto -\theta$ annihilates all cross terms between $(\alpha_r, \beta_r)$ and $(\alpha_i, \beta_i)$, splitting the quadratic majorant into two $2\times 2$ symmetric blocks $K_{\mathrm{re}}(w, s_0)$ and $K_{\mathrm{im}}(w, s_0)$ on $[0, 25] \times [0, \pi]$ plus the $r \ge 25$ tail:
   - For $w \le 3$ and $r \ge 25$, $|y| \ge r - w \ge 22 > \sqrt{H(25)}$ at all three rows, so $T > 25$. On $T \ge 25$, $|h|^2 \le (\frac{3}{2}T^2 - 2T + 1)S_0 \le 2 T^2 S_0$, hence
     $$\int_{r \ge 25}\int_{-\pi}^{\pi} \frac{|h|^2}{r}\,d\gamma \le \frac{S_0}{25}\int_{25}^{\infty} 2 T^2 e^{-T}\,dT = \frac{1354}{25}e^{-25}S_0 < 10^{-9}S_0.$$
   - On each cell $[a_r, b_r] \times [a_\theta, b_\theta] \subset [0, 25] \times [0, \pi]$ and shift slab $[w_l, w_h] \subset [0, 3]$ with amplitude cap $\|v\|_2 \le s_0$, we fix the constant cell weights $w_{P,\mathrm{hi}}, w_{H,\mathrm{hi}}$ evaluated at $\eta_{\mathrm{hi}} = \min\bigl(1, \sup_{[a_r,b_r]\times[a_\theta,b_\theta]\times[w_l,w_h]} \frac{s_0 M(T)}{a_r}\bigr)$ ($\eta_{\mathrm{hi}} = 1$ on the innermost ring $a_r = 0$, and on any cell where the supremum reaches $1$). With fixed cell weights, each truncated sum $I_{ij}(w)$ is $C^\infty$ in $w \in [w_l, w_h]$; we enclose $I_{ij}(w_m)$ at the slab midpoint $w_m = \frac{1}{2}(w_l + w_h)$ by 2D midpoint quadrature with exact `Jet2` second-derivative remainder $\frac{\Delta r^2}{24}\partial_r^2 + \frac{\Delta\theta^2}{24}\partial_\theta^2$, and enclose $I_{ij}(w) - I_{ij}(w_m)$ via Leibniz's rule and the Mean Value Theorem $(w - w_m) I'_{ij}(\xi)$ ($\xi \in [w_l, w_h]$), summing $\mathrm{area}\cdot \partial_w g_{ij}(r_{\mathrm{box}}, \theta_{\mathrm{box}}, [w_l, w_h])$ across all cells so the odd $\cos\theta$ cancellation near $w = 0$ is preserved.

For every slab $[w_l, w_h]$ in the 88-slab origin partition of $[0, 3]$ (paired with the 144-slab Part 3 partition in §6), `verify.py` verifies in exact `Fraction` arithmetic that $Q_{s,+} - K_{\mathrm{re}} \succ 0$, $Q_{s,+} - K_{\mathrm{im}} \succ 0$, $Q_{\mathrm{diag}} - K_{\mathrm{re}} \succ 0$, and $Q_{\mathrm{diag}} - K_{\mathrm{im}} \succ 0$ via Sylvester's criterion.

---

## 5. Part 2: Self-Contained Global Shift Curvature $C_{\mathrm{curv}} = 680$ and Base Curvature

To interpolate across each shift slab $w \in [w_l, w_h]$ of width $\Delta w = w_h - w_l$ in Part 3, we bound $-\partial_w^2 r_w(v)$ from above in two ways and take their minimum on every 3D shell box:

**Lemma 5.1 (Global Shift Curvature $-\partial_w^2 r_w(v) \le 680 S_0$).**
Following `KGCP` Lemma 5.1 (`7.4.16`, independently reviewed by `codex-a7c4`), write $r_w(v) = 2\int_{\mathbb{R}^2}(|y + w + h(y)| - |y + w| - \operatorname{Re}(h(y)\overline{\operatorname{ph}(y+w)}))\rho_L(y)\,dy$ with $\rho_L(y) = \pi^{-1} f(H^{-1}(|y|^2))$, change variable to $z = y + w$, and retain the nonnegative distributional Hessian of $z \mapsto 2|z + h|$ while differentiating $h(z - w)\rho_L(z - w)$ twice with respect to $w$. Using the linear envelope $|h(y)| \le M(T)\sqrt{S_0}$ ($M(T) = 1 + \frac{5}{4}T$) in place of $M_{\mathrm{tilt}}(T)$ together with $\|Dh(y)\|_{\mathrm{op}} \le q\frac{\sqrt{2T}}{a_0}\sqrt{S_0}$ and $\|D^2 h(y)\| \le \frac{q}{a_0^2}(1 + \frac{6 b T}{a_0})\sqrt{S_0}$ ($q = \frac{5}{2} > \sqrt{6}$) bounds the planar density of the second-variation potential by $\pi^{-1}\bar{B}(T)e^{-T}/D(T)\cdot S_0$ ($D(T) = H'(T)$) and its total planar integral by $\int_0^\infty \bar{B}(T)e^{-T}\,dT \cdot S_0$, where
$$\bar{B}(T) = \frac{2 M q}{a_0^2}\left(1 + \frac{6 b T}{a_0}\right) + \frac{8 m q T M}{D} + \frac{1}{2}\left[\left(m^2 + \frac{b^2}{a_0^2} + \frac{9 b^2}{c_0^2}\right)\frac{4 T}{c_0^2} + \frac{2 m}{D}\right]M^2,$$
with $a_0 = a + b T$, $c_0 = a + 3 b T$, $D = a_0 c_0$, $q = \frac{5}{2} > \sqrt{6}$, and $m = 1 + \frac{b}{a_0} + \frac{3b}{c_0}$. By the planar bathtub inequality $\int |y + w|^{-1}\psi(y)\,dy \le 2\sqrt{\pi\|\psi\|_\infty\|\psi\|_1}$, we obtain $-\partial_w^2 r_w(v) \le \sqrt{16\,\mathrm{cap}_{\max}\,\mathrm{mass}_{\mathrm{sum}}}\,S_0$. Enclosing $[0, 36]$ on $36\times 256 = 9216$ intervals in `certify_global_shift_curvature_680` and bounding $T \ge 36$ analytically ($\bar{B}(T) < T/b^2$, checked in exact `Fraction` arithmetic in `verify.py`) yields $16\,\mathrm{cap}_{\max}\,\mathrm{mass}_{\mathrm{sum}} < 680^2$ at all three rows.

**Lemma 5.2 (Per-Slab Unperturbed Base Curvature).**
Alternatively (`7.4.14`, `KGCP` §5.2), since $w \mapsto 2\,\mathbb{E}_{z_1}|L + w + h|$ is convex in $w$,
$$-\partial_w^2 r_w(v) \le \partial_w^2\bigl(2\,\mathbb{E}_{z_1}|L + w|\bigr) + 2|\alpha_r|\cdot|\partial_w^2 C_A(w)| + 2|\beta_r|\cdot|\partial_w^2 C_B(w)|,$$
where $\partial_w^2(2\,\mathbb{E}_{z_1}|L + w|) = 2\,\mathbb{E}_{z_1}[\sin^2\theta / |L + w|] = \int_0^\infty\int_0^\pi 4 f(T)\sin^2\theta\,\frac{dr\,d\theta}{\pi}$ (`n_up`), $C_A(w) = \mathbb{E}_{z_1}[(T-1)\cos\theta]$, and $C_B(w) = \mathbb{E}_{z_1}[(z_{2,r}\cos\theta + z_{2,i}\sin\theta)]$ (note $\operatorname{Im} h$ is odd in $\theta$ so its linear expectation vanishes for all real $w$). Differentiating $C_A(w), C_B(w)$ twice via `Jet2` in $w \in [w_l, w_h]$ on $[0, 25]\times[0, \pi]$ plus the exact $T \ge 25$ tail (`coeff25 < 2` verified in `verify.py`) gives per-slab bounds `n_up, a2_up, b2_up`. Since neither $Q_{s,+}(v)$ nor $Q_{\mathrm{diag}}(v)$ depends on $w$, for any $\eta \in (0, 1)$ and $g(w) := r_w(v) - (1 - \eta)Q(v)$ on $[w_l, w_h]$:
$$g(w) \le \max\bigl(g(w_l), g(w_h)\bigr) + \frac{(w_h - w_l)^2}{8}\min\Bigl(680\,S_{\max},\; n_{\mathrm{up}} + 2|\alpha_r|_{\max} a_{2,\mathrm{up}} + 2|\beta_r|_{\max} b_{2,\mathrm{up}}\Bigr).$$

---

## 6. Part 3: Weighted Cauchy–Schwarz Cell Gram Matrix (`U_WCS`) and 3D Ray-Convexity Shells

**Lemma 6.1 (Weighted Cauchy–Schwarz Cell Gram Bound `U_WCS`).**
Partition $[0, 25] \times [0, \pi]$ into cells $\{Q_k\}$ (paired with their conjugates $\overline{Q_k} \subset [0, 25]\times[-\pi, 0]$). On each cell $Q$ (either $Q_k$ or $\overline{Q_k}$), put
$$A_Q = \int_Q r\,d\gamma > 0, \qquad B_Q(v) = \int_Q \operatorname{Re}(h e^{-i\theta})\,d\gamma = b_Q^T v, \qquad C_Q(v) = \int_Q \frac{|h|^2}{r}\,d\gamma = v^T M_Q v \ge 0.$$
By Cauchy–Schwarz weighted by $\sqrt{r}$ on $(Q, d\gamma)$:
$$\int_Q |L + w + h|\,d\gamma = \int_Q \sqrt{r}\,\frac{|L + w + h|}{\sqrt{r}}\,d\gamma \le \sqrt{A_Q\bigl(A_Q + 2 B_Q(v) + C_Q(v)\bigr)},$$
hence
$$2\int_Q \bigl(|L + w + h| - |L + w| - \operatorname{Re}(h e^{-i\theta})\bigr)\,d\gamma \le \Phi\bigl(A_Q, B_Q(v), C_Q(v)\bigr) := 2\Bigl(\sqrt{A_Q(A_Q + 2 B_Q(v) + C_Q(v))} - A_Q - B_Q(v)\Bigr).$$
By `KGCP` Lemma 3.2 (**P + C**), on the domain $A > 0$, $C \ge 0$, $A + 2 B + C \ge 0$:
1. $\partial_A \Phi \ge 0$ and $\partial_C \Phi \ge 0$, so replacing $A_Q$ by an outward upper bound $A_{Q,\mathrm{hi}} \ge A_Q$ and $C_Q(v)$ by an outward upper bound $C_{Q,\mathrm{hi}} \ge C_Q(v)$ can only **increase** $\Phi$ (and preserves $A_{\mathrm{hi}} + 2 B + C_{\mathrm{hi}} \ge A + 2 B + C \ge 0$).
2. On $B \in [B_{\mathrm{lo}}, B_{\mathrm{hi}}]$, $\Phi(A_{\mathrm{hi}}, B, C_{\mathrm{hi}})$ is unimodal with global maximum $C_{\mathrm{hi}}$ at $B = -\frac{1}{2}C_{\mathrm{hi}}$, so its exact maximum over $[B_{\mathrm{lo}}, B_{\mathrm{hi}}]$ is $C_{\mathrm{hi}}$ if $-\frac{1}{2}C_{\mathrm{hi}} \in [B_{\mathrm{lo}}, B_{\mathrm{hi}}]$ and $\Phi(A_{\mathrm{hi}}, B_{\mathrm{end}}, C_{\mathrm{hi}})$ at the closer endpoint otherwise (evaluated via the cancellation-free rationalized formula $\frac{2(A_{\mathrm{hi}}C_{\mathrm{hi}} - B_{\mathrm{end}}^2)}{\sqrt{A_{\mathrm{hi}}(A_{\mathrm{hi}} + 2 B_{\mathrm{end}} + C_{\mathrm{hi}})} + A_{\mathrm{hi}} + B_{\mathrm{end}}}$ whenever $A_{\mathrm{hi}} + B_{\mathrm{end}} > 0$).
3. Clustering the radial grid as $4 t^{2.7}$ near $r = 0$ eliminates the $O(r_1)$ innermost-cell Cauchy–Schwarz gap, capturing the zero-core eigenvalue within $0.006$ at `nr = 68, nt = 32`.

**Lemma 6.2 (Global 3D Ray-Convexity Cube Shells from $r_0(w)$ to $r_M = 4$).**
Because **both** $Q_{s,+}(v)$ and $Q_{\mathrm{diag}}(v)$ are purely homogeneous degree-2 positive-definite quadratic forms ($Q(t v) = t^2 Q(v) > 0$ for $v \ne 0$), while $t \mapsto r_w(t v)$ is convex on $[0, \infty)$ with $r_w(0) = 0$:
Suppose on a fixed $w$-slab $[w_l, w_h]$ we have a finite geometric sequence of cube radii $r_0 < r_1 < \dots < r_K = 4$ with $r_{m+1}/r_m \le \rho_{\max}$ and a reserve fraction $\eta \in (0, 1)$ satisfying
$$\left(\frac{\rho_{\max} - 1}{\rho_{\max} + 1}\right)^2 \le \eta,$$
and suppose on every 3D cube boundary $\partial([-r_m, r_m]^4)$ ($m = 0, \dots, K$, reduced by $\alpha_i \ge 0$ to 7 three-dimensional faces) we certify:
$$r_w(v) \le (1 - \eta) Q(v) \qquad \forall w \in [w_l, w_h],\; \forall v \in \partial([-r_m, r_m]^4).$$
Then for **every** $v \in \mathbb{R}^4$ with $r_0 \le \|v\|_\infty \le 4$, letting $m \in \{0, \dots, K-1\}$ satisfy $r_m \le \|v\|_\infty \le r_{m+1}$, write $v = t u_0$ with $u_0 = (r_m/\|v\|_\infty)v \in \partial([-r_m, r_m]^4)$, $u_1 = (r_{m+1}/r_m)u_0 \in \partial([-r_{m+1}, r_{m+1}]^4)$, $\rho = r_{m+1}/r_m \in (1, \rho_{\max}]$, and $t = \|v\|_\infty / r_m \in [1, \rho]$. By convexity along the ray $s \mapsto r_w(s u_0)$ between $s = 1$ and $s = \rho$:
$$r_w(t u_0) \le \frac{\rho - t}{\rho - 1}r_w(u_0) + \frac{t - 1}{\rho - 1}r_w(\rho u_0) \le (1 - \eta)Q(u_0)\left[\frac{\rho - t}{\rho - 1} + \frac{t - 1}{\rho - 1}\rho^2\right] = (1 - \eta)\bigl((1 + \rho)t - \rho\bigr)Q(u_0).$$
Dividing by $t^2$,
$$\max_{t \in [1, \rho]} \frac{(1 + \rho)t - \rho}{t^2} = \frac{(1 + \rho)^2}{4\rho} \qquad \left(\text{attained at } t = \frac{2\rho}{1 + \rho} \in (1, \rho)\right),$$
and $(1 - \eta)\frac{(1 + \rho)^2}{4\rho} \le 1 \iff 1 - \eta \le \frac{4\rho}{(1 + \rho)^2} = 1 - \left(\frac{\rho - 1}{\rho + 1}\right)^2 \iff \left(\frac{\rho - 1}{\rho + 1}\right)^2 \le \eta$.
Hence $r_w(v) = r_w(t u_0) \le (1 - \eta)\frac{(1 + \rho)^2}{4\rho} t^2 Q(u_0) \le Q(t u_0) = Q(v)$ strictly (since $r_w < (1-\eta)Q$ strictly on every shell). Applying this argument on contiguous amplitude stages $[r_{\mathrm{start}, s}, r_{\mathrm{end}, s}]$ ($s = 0, \dots, S-1$, with $r_{\mathrm{start}, 0} = r_0(w)$, $r_{\mathrm{start}, s+1} = r_{\mathrm{end}, s}$, $r_{\mathrm{end}, S-1} = 4$) with stage-specific $(\eta_s, \rho_{\max, s})$ covers all $r_0(w) \le \|v\|_\infty \le 4$.
Finally, every slab satisfies the inner handoff $2 r_0(w) \le s_0(w)$, so $\|v\|_\infty \le r_0(w) \implies \|v\|_2 \le 2\|v\|_\infty \le 2 r_0(w) \le s_0(w)$, which is covered by Part 1. $\square$

**Lemma 6.3 (Exact Product-Measure Multilinear Cancellation on Rectangular Boxes).**
Let $B = \{c + \sum_{k=1}^3 u_k h_{j_k} e_{j_k} : u \in [-1, 1]^3\}$ be a 3D axis-aligned sub-box on a face of $\partial([-r_m, r_m]^4)$ with corners $v^{(m)}$ ($m \in \{0, 1\}^3$), let $r_w$ be convex, and let $Q(v) = v^T A_Q v$ be **any** quadratic form with $A_{Q,jj} \ge 0$ (arbitrary off-diagonal entries $A_{Q,ij}$, including $Q_{s,+}$). For any $v \in B$ corresponding to $u \in [-1, 1]^3$, let $\Sigma_1, \Sigma_2, \Sigma_3 \in \{\pm 1\}$ be mutually independent random signs with $\mathbb{E}[\Sigma_k] = u_k$, so $V := c + \sum_{k=1}^3 \Sigma_k h_{j_k} e_{j_k}$ is supported on the 8 corners of $B$ with $\mathbb{E}[V] = v$. Because $\mathbb{E}[\Sigma_k \Sigma_\ell] = u_k u_\ell$ for $k \ne \ell$, all off-diagonal bilinear terms cancel identically in $\mathbb{E}[Q(V)] - Q(\mathbb{E}[V]) = \sum_{k=1}^3 A_{Q, j_k j_k} h_{j_k}^2 (1 - u_k^2)$, and Jensen's inequality for $r_w$ yields:
$$r_w(v) - (1 - \eta)Q(v) \le \mathbb{E}\bigl[r_w(V) - (1 - \eta)Q(V)\bigr] + (1 - \eta)\bigl(\mathbb{E}[Q(V)] - Q(\mathbb{E}[V])\bigr)$$
$$\le \max_{m \in \{0,1\}^3}\bigl(r_w(v^{(m)}) - (1 - \eta)Q(v^{(m)})\bigr) + (1 - \eta)\sum_{k=1}^3 A_{Q, j_k j_k} h_{j_k}^2. \qquad \square$$

---

## 7. Verification and Reproducibility

1. **Outward-Rounded C++17 Certifier (`certify_raw_joint_ab.cpp`):**
   - Compiled with `-O2 -ffp-contract=off -frounding-math -std=c++17 -pthread -Wall -Wextra -Werror` (with `#ifdef NDEBUG #error` guard).
   - Every worker thread enforces `FE_UPWARD` rounding; interval primitives use inline assembly barriers (`fp_b`), outward-stepped `sqrt_iv`, degree-16 range-reduced `expneg_iv`, and degree-19/18 `sin`/`cos` enclosures (zero `libm` transcendentals).
   - Startup self-tests check `FE_UPWARD` active rounding, `Jet2` second derivatives against finite differences, $2\mathbb{E}|L| \approx 1.371879$, and the zero-core eigenvector sign flip between $\kappa = 0.28$ (`< 0`) and $\kappa_{\mathrm{false}} = 0.31 > 0.298365$ (`> 0`).
2. **Zero-Float Exact Rational Verifier (`verify.py`) and 21 Controls (`test_controls.py`):**
   - Pure Python 3 standard library (`python3 -I`, rejecting `-O`, zero `float` calls in acceptance).
   - Pins SHA-256 of `certify_raw_joint_ab.cpp`, proves Propositions 3.1, 3.2, and Corollary 1.3 from scratch in `Fraction` arithmetic, audits every slab of Parts 1–3 across `peak`, `flank`, and `upper`, and replays the C++17 build bit-for-bit under `--replay-cpp`.
   - `test_controls.py` passes 21 adversarial corruption and compiler/hotspot controls.
