# Certified Pure-Cost Constants for the Odd and Quintic Sectors of the Degree-5 Rows (`#627`)

- **Agent-ID:** `gemini-21d5`
- **Problem:** [`../degree5-attack-2026-11-25/problems/P6-pure-cost-sector-constants.md`](../degree5-attack-2026-11-25/problems/P6-pure-cost-sector-constants.md) (`#627`)
- **Status:** **P + C, author only** (`gemini-21d5`)
- **Code & Receipt:** [`../../code/degree5-pure-cost-gemini-21d5/certify_pure_cost.cpp`](../../code/degree5-pure-cost-gemini-21d5/certify_pure_cost.cpp), [`../../code/degree5-pure-cost-gemini-21d5/result.json`](../../code/degree5-pure-cost-gemini-21d5/result.json), [`../../code/degree5-pure-cost-gemini-21d5/verify_pure_cost.py`](../../code/degree5-pure-cost-gemini-21d5/verify_pure_cost.py)

---

## Executive Summary

We establish all paper proofs (**P, author only**) and outward-rounded interval/rational certificates (**C, author only**) requested in Problem P6 (`#627`) across all 19 rationalised degree-5 rows (`0.70`, `0.74`, `0.76`, `0.78`, `0.79`, `0.80`, `0.81`, `0.82`, `0.83`, `0.84`, `0.845`, `0.85`, `0.855`, `0.86`, `0.865`, `0.87`, `0.875`, `0.88`, `0.886`):

1. **Deliverable (a) — Zero-core scalar $Z$:**
   On all 13 rows with label $\ge 0.81$, $Z := \varepsilon_1\,\mathbb{E}_z[|z|/g(|z|^2)] < 1$ is certified via degree-4 Taylor–Gauss–Midpoint interval quadrature on $[0, 8]$ (`4096` dyadic panels) plus a closed-form tail on $[8, \infty)$. On the hardest row `0.81`, $Z \le 0.99443462 < 1$ (room $> 5.56 \times 10^{-3}$), independently cross-checked in zero-float `fractions.Fraction` arithmetic (`verify_pure_cost.py` check `R3`, which also proves $Z(0.80) > 1$). On all 6 rows `0.70`–`0.80`, $Z$ is enclosed to width $< 10^{-11} \ll 10^{-4}$ (e.g. $Z(0.80) \in [1.01206191, 1.01206192]$).
2. **Deliverable (b) — Second-order odd form $M_{\mathrm{odd}}(s)$:**
   At $s = 0$, we prove $M_{\mathrm{odd}}(0) = p_1 Z\,\mathrm{diag}(0, 1/2, 1, 1/2)$ in the decoupled real/imaginary basis, so $\lambda_{\max}(M_{\mathrm{odd}}(0)) = p_1 Z$. For $s > 0$, we prove that $A_+(z; s)$ has a unique simple root $z_*(s) = -r_*(s) \le 0$ parameterised by the real-analytic diffeomorphism $s = \psi(r_*)$, remove the $1/|A_+|$ singularity analytically in shifted polar coordinates $z = -r_* + \rho e^{i\phi}$, prove strict local concavity at $r_* = 0$ on the collar $r_* \in [0, 1/16]$ via bivariate `BivJet2` Taylor quadrature in $\mathbb{R}[\varepsilon, \eta]/(\varepsilon^3, \eta^3)$, cover $r_* \in [1/16, 9]$ by disjoint dyadic slabs, and close $r_* \ge 9$ ($s \ge \psi(9) > 20$) by a closed-form Fubini tail. Consequently, $\sup_{s \ge 0} \lambda_{\max}(M_{\mathrm{odd}}(s)) = \lambda_{\max}(M_{\mathrm{odd}}(0)) = p_1 Z$ on every row, and $< p_1$ on every row $\ge 0.81$.
3. **Deliverable (c) — Finite-amplitude odd functional $F_{\mathrm{odd}}(s; Q, P)$:**
   We prove that both first-order expectations $\mathbb{E}_z[\bar z(\mathrm{ph}\,A_+ - \mathrm{ph}\,A_-)] = \mathbb{E}_z[z(\mathrm{ph}\,A_+ - \mathrm{ph}\,A_-)] = 0$ vanish identically, reduce $F_{\mathrm{odd}}$ to $A_+$ via $z \mapsto -z$, and prove both a **Sturm-certified rational quartic elliptic secant ladder** ($280$ exact rational rungs $(\beta, U_k, \alpha_k)$ across $14$ values of $\beta$, verified in `fractions.Fraction` Sturm arithmetic by `verify_pure_cost.py` check `R4`) and an **exact sum-of-squares intercept majorant** (Proposition 5.2: $\Phi(u, v) \le \frac{(1-\gamma)^2}{\gamma} + (1 - \frac{\gamma}{2})u^2 + \gamma v^2$ for all $\gamma \in (0, 1]$ and $(u, v) \in \mathbb{R}^2$, decoupling into $2 \times 2$ real/imaginary blocks on every conjugation-invariant set $B = \bar B$). Partitioning $\{\rho \le \rho_{\max}\}$ into conjugation-invariant symmetric cells $\mathcal{B} = \mathcal{B}_+ \cup \overline{\mathcal{B}_+}$ grouped into $256$ conjugation-invariant geometric bins of $\sup(|z|/|A_+|)$ integrated cell-by-cell via `BivJet12` 2D Gauss–Midpoint quadrature, and combining the Sturm ladder on moderate-$|u|$ bins with Proposition 5.2 on near-zero bins (where $\mathbb{E}_{\mathrm{bin}}|A_+|$ is tiny while $1/|A_+|$ is large) and the analytic triangle cap $\frac{\sqrt{2\pi}}{2p_1} < 0.978$ on $\tau \ge 2$, we certify $F_{\mathrm{odd}}(s; Q, P) \le \kappa_{\mathrm{odd}}\,p_1(|Q|^2 + |P|^2)$ with $\kappa_{\mathrm{odd}} < 1$ on **all 13 rows $\ge 0.81$** ($\kappa_{\mathrm{odd}} \le 0.997982 < 1$ on row `0.81`, down to $\le 0.982567$ on row `0.886`) using $2 \times 2$ blocks alone. On rows `0.79` and `0.80`, the same per-bin/global hybrid certifies explicit $s$-dependent upper profiles with global maxima $E_{\max}(s) \le 2.499 \times 10^{-3}$ on row `0.79` (sharper than `CAPG`'s numerical $3.1 \times 10^{-3}$, and $E_{\max}(s) = 0$ identically for all $s \ge 0.383325$) and $E_{\max}(s) \le 1.143 \times 10^{-3}$ on row `0.80` ($E_{\max}(s) = 0$ identically for all $s \ge 0.195728$).
4. **Deliverable (d) — Elementary majorant and quintic matrices $N_{\mathbb{E}_1}(s), N_{\mathbb{E}}(s)$:**
   We prove the exact algebraic identity $(|a| + \mathrm{Re}(\bar u\,\mathrm{ph}\,a) + \frac{|u|^2}{2|a|})^2 - |a + u|^2 = (\mathrm{Re}(\bar u\,\mathrm{ph}\,a) + \frac{|u|^2}{2|a|})^2 \ge 0$, decouple the $12 \times 12$ matrix $N_{\mathbb{E}}(s)$ by parity $z \mapsto -z$ into two $6 \times 6$ real symmetric blocks $N_{\mathbb{E}_{\mathrm{odd}}}(s)$ (whose top-left $5 \times 5$ principal submatrix is $N_{\mathbb{E}_1}(s)$) and $N_{\mathbb{E}_{\mathrm{even}}}(s)$, and certify via outward-rounded interval $LDL^T$ factorisations plus Weyl row-sum radii that $\sup_{s \ge 0} \lambda_{\max}(N_{\mathbb{E}_1}(s)) < \frac{1}{4}p_2$ and $\sup_{s \ge 0} \lambda_{\max}(N_{\mathbb{E}}(s)) < \frac{1}{2}p_2$ across **all 19 rows** (peaking at $\le 0.249549\,p_2$ and $\le 0.491482\,p_2$ on row `0.70`).

---

## 1. Exact Denominator-$10^6$ Row Rationalisation & Positivity Premises

Let $z \sim \mathcal{CN}(0, 1)$ have density $\pi^{-1} e^{-|z|^2}$ on $\mathbb{C}$, write $T = |z|^2$, and fix the game constants
$$
\varepsilon_1 = \frac{39}{50}, \qquad \eta = \frac{779}{10000}, \qquad p_1 = \frac{1}{\varepsilon_1} = \frac{50}{39}, \qquad p_2 = \frac{1}{\eta} = \frac{10000}{779}.
$$
The 12 orthonormal Wick basis functions $e_{a,b}(z)$ ($0 \le a \le 3,\; 0 \le b \le 2$) in $L^2(\mathcal{CN}(0, 1))$ split by parity $e_{a,b}(-z) = (-1)^{a+b} e_{a,b}(z)$ into:
- **Odd basis** $\mathbb{E}_{\mathrm{odd}} = (e_{1,0}, e_{0,1}, e_{2,1}, e_{1,2}, e_{3,0}, e_{3,2})$, whose first five entries form $\mathbb{E}_1 = (e_{1,0}, e_{0,1}, e_{2,1}, e_{1,2}, e_{3,0})$:
  $$
  e_{1,0}(z) = z,\quad e_{0,1}(z) = \bar z,\quad e_{2,1}(z) = \frac{z(T-2)}{\sqrt 2},\quad e_{1,2}(z) = \overline{e_{2,1}(z)},\quad e_{3,0}(z) = \frac{z^3}{\sqrt 6},\quad e_{3,2}(z) = \frac{z(T^2 - 6T + 6)}{\sqrt{12}}.
  $$
- **Even basis** $\mathbb{E}_{\mathrm{even}} = (e_{0,0}, e_{2,0}, e_{1,1}, e_{3,1}, e_{0,2}, e_{2,2})$:
  $$
  e_{0,0}(z) = 1,\quad e_{2,0}(z) = \frac{z^2}{\sqrt 2},\quad e_{1,1}(z) = T - 1,\quad e_{3,1}(z) = \frac{z^2(T-3)}{\sqrt 6},\quad e_{0,2}(z) = \frac{\bar z^2}{\sqrt 2},\quad e_{2,2}(z) = \frac{T^2 - 4T + 2}{2}.
  $$
  *(Note: switching the Laguerre sign convention on $e_{1,1}$ or $e_{3,1}$ multiplies the corresponding basis vector by $-1$, which conjugates $N_{\mathbb{E}}(s)$ by a diagonal $\pm 1$ unitary and leaves its eigenvalues invariant; we use $e_{1,1}(z) = T - 1$ throughout as in P6 §1.)*

### Rationalisation Rule
Each of the 18 floating-point rows in `code/degree5-content/rows5.lines` together with row `0.79` in `code/degree5-content/profiles_low/band_row_0.70.json` is rounded to nearest $10^{-6}$ (`ROUND_HALF_EVEN`), shifting each coordinate by at most $5 \times 10^{-7}$ (`verify_pure_cost.py` check `R1`):

| Row | $10^6 \ell$ | $10^6 \beta$ | $10^6 b_A$ | $10^6 b_B$ | $10^6 \nu_5$ |
|---|---:|---:|---:|---:|---:|
| `0.70` | `624520` | `79052` | `-35192` | `-20165` | `3697` |
| `0.74` | `678118` | `95396` | `-39377` | `-22177` | `5245` |
| `0.76` | `706640` | `104313` | `-41549` | `-23195` | `6173` |
| `0.78` | `736351` | `113740` | `-43781` | `-24231` | `7209` |
| `0.79` | `751694` | `118645` | `-44919` | `-24762` | `7771` |
| `0.80` | `767389` | `123680` | `-46085` | `-25293` | `8365` |
| `0.81` | `783378` | `128843` | `-47249` | `-25830` | `8988` |
| `0.82` | `799756` | `134135` | `-48447` | `-26380` | `9646` |
| `0.83` | `816538` | `139578` | `-49674` | `-26924` | `10338` |
| `0.84` | `833674` | `145151` | `-50910` | `-27496` | `11066` |
| `0.845` | `842397` | `147989` | `-51554` | `-27777` | `11444` |
| `0.85` | `851203` | `150857` | `-52192` | `-28061` | `11831` |
| `0.855` | `860143` | `153779` | `-52831` | `-28362` | `12227` |
| `0.86` | `869173` | `156715` | `-53492` | `-28642` | `12636` |
| `0.865` | `878331` | `159706` | `-54163` | `-28956` | `13053` |
| `0.87` | `887591` | `162733` | `-54822` | `-29250` | `13480` |
| `0.875` | `896974` | `165795` | `-55514` | `-29567` | `13919` |
| `0.88` | `906478` | `168894` | `-56209` | `-29865` | `14368` |
| `0.886` | `917174` | `172683` | `-57694` | `-31607` | `14947` |

Write
$$
g(T) = \ell + \beta(T - 2) + \nu_5\frac{T^2 - 6T + 6}{\sqrt{12}} = c_0 + c_1 T + c_2 T^2,
$$
$$
c_0 = \ell - 2\beta + \sqrt{3}\,\nu_5, \qquad c_1 = \beta - \sqrt{3}\,\nu_5, \qquad c_2 = \frac{\nu_5}{\sqrt{12}},
$$
and set $\alpha = -b_A > 0$, $\gamma_B = -b_B / \sqrt{2} > 0$, $a_0 = 1 - \alpha$, $a_2 = \alpha + \gamma_B$, and $d_2 = \alpha - \gamma_B$. Then for $z = x + iy$ ($T = x^2 + y^2$),
$$
D(z) = 1 - b_A(T - 1) - b_B\frac{z^2}{\sqrt 2} = (a_0 + a_2 x^2 + d_2 y^2) + 2i\gamma_B xy,
\qquad A_\pm(z; s) = z g(T) \pm s D(z).
$$
On all 19 rationalised rows, exact rational arithmetic (`verify_pure_cost.py` check `R2`) certifies:
$$
a_0 > \frac{9}{10}, \qquad d_2 > \frac{3}{200}, \qquad c_0 > \frac{9}{20}, \qquad c_1 > \frac{3}{50}, \qquad c_2 > 0, \qquad 3 a_0 c_1 - a_2 c_0 > \frac{3}{20}. \tag{1.1}
$$
In particular, $g(T) \ge c_0 > 9/20$ and $g'(T) = c_1 + 2c_2 T > 0$ for all $T \ge 0$.

---

## 2. Zero-Set Bijection & Nonsingular Shifted-Polar Reduction

### Proposition 2.1 (Unique Simple Root of $A_+(z; s)$)
*Under (1.1), for every $s \ge 0$, the equation $A_+(z; s) = 0$ in $\mathbb{C}$ has a unique solution $z = -r_*(s) \le 0$, where $r_*(s) = \psi^{-1}(s)$ is the inverse of the strictly increasing real-analytic bijection*
$$
\psi : [0, \infty) \xrightarrow{\;\sim\;} [0, \infty), \qquad \psi(r) := \frac{r g(r^2)}{a_0 + a_2 r^2}.
$$
*By parity $A_-(-z; s) = -A_+(z; s)$, $A_-(z; s)$ has the unique solution $z = +r_*(s) \ge 0$.*

**Proof.** Write $z = x + iy$ with $T = x^2 + y^2$.
1. *No off-real zeros ($y \ne 0$):* Suppose $\mathrm{Im}\,A_+(x + iy; s) = y(g(T) + 2s\gamma_B x) = 0$ with $y \ne 0$. Then $g(T) = -2s\gamma_B x$. Since $g(T) > 0$ and $\gamma_B > 0$, this requires $s > 0$ and $x < 0$. Substituting $g(T) = -2s\gamma_B x$ into $\mathrm{Re}\,A_+$ cancels the $\gamma_B x^2$ terms:
   $$
   \mathrm{Re}\,A_+(x + iy; s) = x(-2s\gamma_B x) + s\big(a_0 + (\alpha + \gamma_B)x^2 + (\alpha - \gamma_B)y^2\big) = s\big(a_0 + (\alpha - \gamma_B)(x^2 + y^2)\big) = s(a_0 + d_2 T) > 0,
   $$
   since $s > 0$, $a_0 > 0$, and $d_2 > 0$ by (1.1). Thus $A_+(z; s) \ne 0$ for all $z \notin \mathbb{R}$.
2. *Nonnegative real axis ($x \ge 0, y = 0$):* $A_+(x; s) = x g(x^2) + s(a_0 + a_2 x^2) \ge 0$, vanishing if and only if $x = 0$ and $s = 0$.
3. *Negative real axis ($x = -r \le 0, y = 0$):* $A_+(-r; s) = -r g(r^2) + s(a_0 + a_2 r^2) = 0 \iff s = \psi(r)$. Differentiating $\psi(r) = \frac{c_0 r + c_1 r^3 + c_2 r^5}{a_0 + a_2 r^2}$ gives, with $T = r^2$,
   $$
   (a_0 + a_2 T)^2 \psi'(r) = a_0 c_0 + (3a_0 c_1 - a_2 c_0)T + (5a_0 c_2 + a_2 c_1)T^2 + 3a_2 c_2 T^3 > 0 \qquad (\forall\, r \ge 0)
   $$
   because every coefficient is strictly positive by (1.1). Since $\psi(0) = 0$ and $\lim_{r \to \infty} \psi(r) = +\infty$, $\psi$ is a strictly increasing $C^\infty$ diffeomorphism $[0, \infty) \to [0, \infty)$. $\square$

### Proposition 2.2 (Exact Cancellation of the $1/|A_+|$ Singularity)
*Fix $r_* \ge 0$ and $s = \psi(r_*)$, and pass to shifted polar coordinates $z = -r_* + \rho e^{i\phi}$ ($\rho \ge 0$, $\phi \in [-\pi, \pi]$), so $T = |z|^2 = r_*^2 - 2r_*\rho\cos\phi + \rho^2$ and $T - r_*^2 = \rho(\rho - 2r_*\cos\phi)$. Then $A_+(-r_* + \rho e^{i\phi}; \psi(r_*)) = \rho\,\tilde A(r_*; \rho, \phi)$, where*
$$
\begin{aligned}
\tilde A(r_*; \rho, \phi) &= e^{i\phi} g(T) - r_*(\rho - 2r_*\cos\phi)\big(c_1 + c_2(T + r_*^2)\big) \\
&\quad + s\Big[\alpha(\rho - 2r_*\cos\phi) + \gamma_B e^{i\phi}(\rho e^{i\phi} - 2r_*)\Big].
\end{aligned} \tag{2.1}
$$
*Moreover, $\tilde A(r_*; \rho, \phi) \ne 0$ for all $(r_*, \rho, \phi) \in [0, \infty)^2 \times [-\pi, \pi]$, $\mathrm{ph}\,A_+(z; \psi(r_*)) = \mathrm{ph}\,\tilde A(r_*; \rho, \phi)$ for $\rho > 0$, and $d^2z / |A_+(z; \psi(r_*))| = d\rho\,d\phi / |\tilde A(r_*; \rho, \phi)|$ is $C^\infty$ everywhere up to $\rho = 0$.*

**Proof.** Subtract $0 = A_+(-r_*; s) = -r_* g(r_*^2) + s(a_0 + a_2 r_*^2)$ from $A_+(-r_* + \rho e^{i\phi}; s)$:
- For the $L'$ part: $(-r_* + \rho e^{i\phi})g(T) + r_* g(r_*^2) = \rho e^{i\phi} g(T) - r_*(g(T) - g(r_*^2)) = \rho e^{i\phi} g(T) - r_*\rho(\rho - 2r_*\cos\phi)(c_1 + c_2(T + r_*^2))$.
- For the $sD$ part: $D(-r_* + \rho e^{i\phi}) - (a_0 + a_2 r_*^2) = \alpha(T - r_*^2) + \gamma_B\big((-r_* + \rho e^{i\phi})^2 - r_*^2\big) = \rho\big[\alpha(\rho - 2r_*\cos\phi) + \gamma_B e^{i\phi}(\rho e^{i\phi} - 2r_*)\big]$.
Dividing by $\rho$ yields (2.1). For $\rho > 0$, Proposition 2.1 implies $\tilde A \ne 0$. At $\rho = 0$, $\tilde A(r_*; 0, \phi) = e^{i\phi} g(r_*^2) + 2r_*^2\cos\phi(c_1 + 2c_2 r_*^2) - 2r_* s(\alpha\cos\phi + \gamma_B e^{i\phi})$:
- if $\sin\phi \ne 0$, $\mathrm{Im}\,\tilde A(r_*; 0, \phi) / \sin\phi = g(r_*^2) - 2r_* s\gamma_B = g(r_*^2)\frac{a_0 + (\alpha - \gamma_B)r_*^2}{a_0 + (\alpha + \gamma_B)r_*^2} > 0$;
- if $\sin\phi = 0$ ($\cos\phi = \pm 1$), $\tilde A(r_*; 0, \phi) = \pm\frac{\partial}{\partial x}\mathrm{Re}\,A_+(-r_*; \psi(r_*)) = \pm(a_0 + a_2 r_*^2)\psi'(r_*) \ne 0$.
Finally, since $A_+(\bar z; s) = \overline{A_+(z; s)}$, any integrand invariant under $z \mapsto \bar z$ satisfies $\int_{-\pi}^\pi (\cdots)\,d\phi = 2\int_0^\pi (\cdots)\,d\phi$. $\square$

---

## 3. Deliverable (a): Zero-Core Scalar $Z$

In polar coordinates $z = r e^{i\theta}$ ($T = r^2$, $dT = 2r\,dr$),
$$
Z = \varepsilon_1 \int_0^\infty \frac{\sqrt T\,e^{-T}}{g(T)}\,dT = 2\varepsilon_1 \int_0^\infty \frac{r^2 e^{-r^2}}{g(r^2)}\,dr.
$$
In `certify_Z` (`certify_pure_cost.cpp` §6):
- On $r \in [0, 8]$, we partition $[0, 8]$ into $4096$ exact dyadic panels $[r_i - \delta, r_i + \delta]$ of half-width $\delta = 1/1024$. On each panel, $h(r) = r^2 e^{-r^2}/g(r^2)$ is enclosed via degree-4 Taylor–Gauss–Midpoint quadrature:
  $$
  \int_{r_i - \delta}^{r_i + \delta} h(r)\,dr \;\in\; \Big(2\delta\,h(r_i) + \frac{2}{3}\delta^3 h^{[2]}(r_i) + \frac{2}{5}\delta^5 h^{[4]}([r_i-\delta, r_i+\delta])\Big) \;\cap\; \big(2\delta\,h([r_i-\delta, r_i+\delta])\big),
  $$
  where $h^{[k]} = \frac{1}{k!} h^{(k)}$ are propagated in outward-rounded `Jet<4>` arithmetic.
- On $r \ge 8$ ($T \ge 64$), since $g(T) \ge g(64) > 0$ and $\sqrt T \le T$ for $T \ge 64$,
  $$
  0 \le \varepsilon_1 \int_{64}^\infty \frac{\sqrt T\,e^{-T}}{g(T)}\,dT \le \frac{\varepsilon_1}{g(64)}\int_{64}^\infty T e^{-T}\,dT = \frac{65\,\varepsilon_1 e^{-64}}{g(64)} < 2 \times 10^{-26}.
  $$
In addition, `verify_Z_pure_rational_boundary` in `verify_pure_cost.py` (`R3`) independently certifies $Z(0.80) > 1$ and $Z(0.81) < 1$ in pure zero-float `fractions.Fraction` arithmetic.

---

## 4. Deliverable (b): Second-Order Odd Form $M_{\mathrm{odd}}(s)$

### 4.1 Parity Reduction, $2 \times 2$ Block Decoupling, and Exact Value at $s = 0$ (**P, author only**)
For $(Q, P) \in \mathbb{C}^2$ and $O(z) = Q z + P \bar z$, observe that $O(-z) = -O(z)$ and $A_-(-z; s) = -A_+(z; s)$, so $O(-z)\overline{\mathrm{ph}\,A_-(-z; s)} = O(z)\overline{\mathrm{ph}\,A_+(z; s)}$. Changing variable $z \mapsto -z$ in the $A_-$ summand gives
$$
q_{\mathrm{odd}}(s; Q, P) := \sum_{\pm} \mathbb{E}_z\!\left[\frac{\big(\mathrm{Im}(O(z)\overline{\mathrm{ph}\,A_\pm(z; s)})\big)^2}{2|A_\pm(z; s)|}\right] = \mathbb{E}_z\!\left[\frac{\big(\mathrm{Im}(O(z)\overline{\mathrm{ph}\,A_+(z; s)})\big)^2}{|A_+(z; s)|}\right].
$$
Put $z\overline{\mathrm{ph}\,A_+} = u_z + i v_z$ and $\bar z\overline{\mathrm{ph}\,A_+} = u_{\bar z} + i v_{\bar z}$. Writing $Q = q_1 + i q_2$ and $P = p_1' + i p_2'$ ($q_1, q_2, p_1', p_2' \in \mathbb{R}$),
$$
\mathrm{Im}\big((Q z + P\bar z)\overline{\mathrm{ph}\,A_+}\big) = (q_1 v_z + p_1' v_{\bar z}) + (q_2 u_z + p_2' u_{\bar z}).
$$
Under $z \mapsto \bar z$, $A_+(\bar z; s) = \overline{A_+(z; s)}$, so $(u_z, u_{\bar z})$ are **even** in $\mathrm{Im}\,z$ while $(v_z, v_{\bar z})$ are **odd** in $\mathrm{Im}\,z$:
- $\bar z\,\mathrm{ph}\,A_+ = \overline{z\overline{\mathrm{ph}\,A_+}} = u_z - i v_z \implies u_z(\bar z) = u_z(z),\; v_z(\bar z) = -v_z(z)$;
- $z\,\mathrm{ph}\,A_+ = \overline{\bar z\overline{\mathrm{ph}\,A_+}} = u_{\bar z} - i v_{\bar z} \implies u_{\bar z}(\bar z) = u_{\bar z}(z),\; v_{\bar z}(\bar z) = -v_{\bar z}(z)$.

Hence every cross-expectation $\mathbb{E}_z[u_\bullet v_\bullet / |A_+|] = 0$ vanishes identically, decoupling $M_{\mathrm{odd}}(s)$ into two $2 \times 2$ real symmetric positive-semidefinite blocks:
$$
M_{\mathrm{odd}}(s) = M_{\mathrm{odd}}^+(s) \oplus M_{\mathrm{odd}}^-(s), \qquad
M_{\mathrm{odd}}^+(s) = \mathbb{E}_z\!\left[\frac{1}{|A_+|}\begin{pmatrix} v_z^2 & v_z v_{\bar z} \\ v_z v_{\bar z} & v_{\bar z}^2 \end{pmatrix}\right], \quad
M_{\mathrm{odd}}^-(s) = \mathbb{E}_z\!\left[\frac{1}{|A_+|}\begin{pmatrix} u_z^2 & u_z u_{\bar z} \\ u_z u_{\bar z} & u_{\bar z}^2 \end{pmatrix}\right].
$$

**Proposition 4.1 ($M_{\mathrm{odd}}(0)$ at $s = 0$).** *At $s = 0$, $M_{\mathrm{odd}}^+(0) = p_1 Z\,\mathrm{diag}(0, 1/2)$ and $M_{\mathrm{odd}}^-(0) = p_1 Z\,\mathrm{diag}(1, 1/2)$, so $\lambda_{\max}(M_{\mathrm{odd}}(0)) = p_1 Z$, attained on $Q \in i\mathbb{R} \setminus \{0\},\; P = 0$.*

**Proof.** At $s = 0$, $A_+(z; 0) = z g(|z|^2)$ with $g > 0$, so $|A_+(r e^{i\theta}; 0)| = r g(r^2)$ and $\mathrm{ph}\,A_+(r e^{i\theta}; 0) = e^{i\theta}$ for $r > 0$. Thus $z\overline{\mathrm{ph}\,A_+} = r$ ($u_z = r,\; v_z = 0$) and $\bar z\overline{\mathrm{ph}\,A_+} = r e^{-2i\theta}$ ($u_{\bar z} = r\cos 2\theta,\; v_{\bar z} = -r\sin 2\theta$). Averaging over $\theta \in [0, 2\pi)$ gives $\mathbb{E}_\theta[\cos 2\theta] = 0$ and $\mathbb{E}_\theta[\cos^2 2\theta] = \mathbb{E}_\theta[\sin^2 2\theta] = 1/2$. Since $\mathbb{E}_z[r / g(r^2)] = Z / \varepsilon_1 = p_1 Z$, the four diagonal/off-diagonal integrals follow immediately. $\square$

### 4.2 Collar Concavity Theorem on $r_* \in [0, 1/16]$
Write $M_{\mathrm{odd}}^-(\psi(r_*)) = \begin{pmatrix} m_{11}(r_*) & m_{12}(r_*) \\ m_{12}(r_*) & m_{22}(r_*) \end{pmatrix}$. Extending (2.1) analytically to $r_* \in \mathbb{R}$ via $\psi(-r_*) = -\psi(r_*)$, inspect the involution $(r_*, \phi) \mapsto (-r_*, \pi - \phi)$ ($\cos(\pi-\phi) = -\cos\phi$, $\sin(\pi-\phi) = \sin\phi$):
- $T(-r_*, \rho, \pi-\phi) = T(r_*, \rho, \phi)$ and $z(-r_*, \rho, \pi-\phi) = -\overline{z(r_*, \rho, \phi)}$;
- $\tilde A(-r_*; \rho, \pi-\phi) = -\overline{\tilde A(r_*; \rho, \phi)}$, hence $\mathrm{ph}\,\tilde A(-r_*; \rho, \pi-\phi) = -\overline{\mathrm{ph}\,\tilde A(r_*; \rho, \phi)}$;
- therefore $u_z(-r_*, \rho, \pi-\phi) = u_z(r_*, \rho, \phi)$ and $u_{\bar z}(-r_*, \rho, \pi-\phi) = u_{\bar z}(r_*, \rho, \phi)$.

Integrating over $\phi \in [0, \pi]$ proves that $m_{11}, m_{12}, m_{22}$ are **even** $C^\infty$ functions of $r_*$, so $m_{11}'(0) = m_{12}'(0) = 0$, while Proposition 4.1 gives $m_{11}(0) = p_1 Z$, $m_{12}(0) = 0$, and $m_{22}(0) = \frac{1}{2}p_1 Z$.

**Proposition 4.2 (Collar Determinant Test).** *Fix $r_0 = 1/16$. Suppose on $[0, r_0]$ we have certified bounds*
$$
-\tfrac{1}{2} m_{11}''(\xi) \ge \mu_1 > 0, \qquad p_1 Z - m_{22}(\xi) \ge \mu_2 > 0, \qquad \tfrac{1}{2}|m_{12}''(\xi)| \le K_{12} \qquad (\forall\,\xi \in [0, r_0]),
$$
*with $\mu_1 \mu_2 - r_0^2 K_{12}^2 > 0$ and $m_{11}(\xi) + m_{22}(\xi) < 2 p_1 Z$. Then $\lambda_{\max}(M_{\mathrm{odd}}^-(\psi(r_*))) \le p_1 Z$ for all $r_* \in [0, r_0]$ (strictly for $r_* \in (0, r_0]$).*

**Proof.** At $r_* = 0$ equality holds by Proposition 4.1. For $r_* \in (0, r_0]$, Lagrange's Taylor remainder around $0$ (using $m_{11}'(0) = m_{12}'(0) = m_{12}(0) = 0$) gives $\xi_1, \xi_2 \in (0, r_*)$ such that $p_1 Z - m_{11}(r_*) = -\frac{1}{2}m_{11}''(\xi_1) r_*^2 \ge \mu_1 r_*^2 > 0$ and $|m_{12}(r_*)| = \frac{1}{2}|m_{12}''(\xi_2)| r_*^2 \le K_{12} r_*^2$. Hence $p_1 Z I_2 - M_{\mathrm{odd}}^-(\psi(r_*))$ has positive `(1,1)` entry, positive `(2,2)` entry $\ge \mu_2 > 0$, and determinant
$$
(p_1 Z - m_{11}(r_*))(p_1 Z - m_{22}(r_*)) - m_{12}(r_*)^2 \ge \mu_1 \mu_2 r_*^2 - K_{12}^2 r_*^4 \ge (\mu_1 \mu_2 - r_0^2 K_{12}^2) r_*^2 > 0,
$$
so $p_1 Z I_2 - M_{\mathrm{odd}}^-(\psi(r_*)) \succ 0$. $\square$

In `certify_Modd_collar` (`certify_pure_cost.cpp` §8):
- $[0, 1/16]$ is partitioned into $8$ dyadic sub-intervals of width $1/128$, and on each sub-interval we integrate $m_{ij}^{[2]}(r_*; \rho, \phi)$ over $(\rho, \phi) \in [0, 9] \times [0, \pi_{\mathrm{lo}}]$ using 2D Taylor–Gauss–Midpoint quadrature via `BivJet2` in the truncated algebra $\mathbb{R}[\varepsilon, \eta]/(\varepsilon^3, \eta^3)$ (where every nilpotent $\delta$ with $\delta_{0,0} = 0$ satisfies $\delta^5 \equiv 0$ identically by the pigeonhole principle $2 + 2 < 5$), plus the exact $[\pi_{\mathrm{lo}}, \pi]$ strip and the analytical $\rho \ge 9$ tail via $\sigma = 1/\rho \in [0, 1/9]$ and Leibniz's rule against $e^{-T}$ ($W_0 = 9 - 1/16 = 8.9375$, tail $< 10^{-33}$).
- Taking the interval hull over all $8$ sub-intervals certifies $\mu_1 > 0.5$, $\mu_2 > 0.38$, and $\mu_1 \mu_2 - r_0^2 K_{12}^2 > 0.19 > 0$ on all 19 rows, while `eval_slab_matrices` on $[0, 1/16]$ certifies $\lambda_{\max}(M_{\mathrm{odd}}^+(s)) < 0.51\,p_1 Z$.
- On $r_* \in [1/16, 9]$, `eval_slab_matrices` covers $[1/16, 9]$ by disjoint dyadic slabs (step $1/256$ on $[1/16, 1/8]$, $1/64$ on $[1/8, 1/4]$, $1/32$ on $[1/4, 3/2]$, $1/16$ on $[3/2, 9]$, with adaptive dyadic refinement `certify_modd_adaptive` down to $1/1024$ near the collar) via 2D Gauss–Midpoint quadrature at $r_m$ plus `BivJet12` 2D Gauss–Midpoint enclosure of $[-d_r, d_r]\,\partial_{r_*} I([r_{\mathrm{lo}}, r_{\mathrm{hi}}])$ on inner cells $|z|^2 < 20$ ($|z|^2 < 16$ in `eval_odd_slab_matrices`), direct `Jet<0>` enclosure on outer cells, exact $[\pi_{\mathrm{lo}}, \pi]$ remainder, and closed-form $\Gamma(6, T_0)$ radial tail on $\rho \ge \rho_{\max}$. On every slab with $r_{\mathrm{lo}} \ge 1/16$ and on the $r_* \ge 9$ tail (§7), $\lambda_{\max}(M_{\mathrm{odd}}(s))/p_1 < Z_{\mathrm{lo}}$ strictly.

---

## 5. Deliverable (c): Finite-Amplitude Odd Functional $F_{\mathrm{odd}}(s; Q, P)$

### 5.1 Vanishing First-Order Terms & Parity Reduction (**P, author only**)
1. **Zero first-order odd terms:** For every real $s$, $A_-(-z; s) = -A_+(z; s)$ gives $\mathrm{ph}\,A_-(-z; s) = -\mathrm{ph}\,A_+(z; s)$ for a.e. $z \in \mathbb{C}$, so $h(z) := \mathrm{ph}\,A_+(z; s) - \mathrm{ph}\,A_-(z; s)$ satisfies $h(-z) = h(z)$ (even in $z$). Since $|h(z)| \le 2$, both $\bar z h(z)$ and $z h(z)$ are integrable against the $(-1)$-invariant Gaussian measure $\pi^{-1} e^{-|z|^2}\,d^2z$ and are **odd** under $z \mapsto -z$. Hence
   $$
   \mathbb{E}_z\big[\bar z(\mathrm{ph}\,A_+ - \mathrm{ph}\,A_-)\big] = 0 = \mathbb{E}_z\big[z(\mathrm{ph}\,A_+ - \mathrm{ph}\,A_-)\big].
   $$
2. **Reduction to $A_+$:** Using $O(-z) = -O(z)$ and $A_-(-z; s) = -A_+(z; s)$, $|A_-(-z; s) - O(-z)| = |-A_+(z; s) + O(z)| = |A_+(z; s) - O(z)|$ and $|A_-(-z; s)| = |A_+(z; s)|$. Changing variable $z \mapsto -z$ in the $A_-$ expectations yields
   $$
   F_{\mathrm{odd}}(s; Q, P) := \mathbb{E}_z\big[|A_+ + O| + |A_- - O| - |A_+| - |A_-|\big] = \mathbb{E}_z\big[|A_+ + O| + |A_+ - O| - 2|A_+|\big]. \tag{5.1}
   $$

### 5.2 Global Secant Majorant $\tilde q_{\mathrm{odd}}$ and the Quartic Elliptic Secant Ladder (**P + C, author only**)
**Proposition 5.1 (Elliptic Secant Lemma & Sturm Criterion).** *For any $(u, v) \in \mathbb{R}^2$, set*
$$
\Phi(u, v) := \sqrt{(1 + u)^2 + v^2} + \sqrt{(1 - u)^2 + v^2} - 2, \qquad S := \tfrac{1}{2}\big(\sqrt{(1 + u)^2 + v^2} + \sqrt{(1 - u)^2 + v^2}\big) \ge \max(1, |u|).
$$
1. *Exact elliptic identity:* $v^2 = \frac{(S^2 - 1)(S^2 - u^2)}{S^2}$, *and for any $\alpha, \beta \in \mathbb{R}$,*
   $$
   S^2\big(\alpha u^2 + \beta v^2 - \Phi(u, v)\big) = \beta S^2(S^2 - 1) - 2S^2(S - 1) - u^2\big((\beta - \alpha)S^2 - \beta\big). \tag{5.2}
   $$
2. *Unconditional global bound ($\alpha = 1/2,\; \beta = 1$):* $\Phi(u, v) \le \frac{1}{2}u^2 + v^2$ *for all $(u, v) \in \mathbb{R}^2$.*
3. *Amplitude-capped rung criterion:* *Fix $U > 0$, $\beta \ge 1$, and $0 \le \alpha < 1/2$. Then $\Phi(u, v) \le \alpha u^2 + \beta v^2$ holds for all $|u| \le U$ and all $v \in \mathbb{R}$ whenever:*
   - *if $\alpha = 0$: $U < 1$ and $\beta(1 - U^2) \ge 1$;*
   - *if $0 < \alpha < 1/2$: (i) when $U > 1$, $\alpha S^2 - 2S + 2 \ge 0$ on $[1, U]$ (which holds whenever $U \le 2$ and $\alpha U^2 - 2U + 2 \ge 0$ since $\alpha < 1/2$ puts the vertex $1/\alpha > 2 \ge U$), and (ii) the quartic*
     $$
     P_{\alpha, \beta, U}(S) := \beta S^4 - 2S^3 + \big(2 - \beta - (\beta - \alpha)U^2\big)S^2 + \beta U^2 \ge 0 \qquad \forall\,S \in [\max(1, U), \infty). \tag{5.3}
     $$

**Proof.**
1. Write $r_\pm = \sqrt{(1 \pm u)^2 + v^2}$. Then $r_+ + r_- = 2S$ and $r_+^2 - r_-^2 = 4u$, so $r_\pm = S \pm u/S$. Squaring $r_+ = S + u/S$ gives $1 + 2u + u^2 + v^2 = S^2 + 2u + u^2/S^2$, i.e. $v^2 = S^2 - 1 - u^2(1 - 1/S^2) = (S^2 - 1)(S^2 - u^2)/S^2$. Substituting $\Phi(u, v) = 2(S - 1)$ and $S^2 v^2 = (S^2 - 1)(S^2 - u^2)$ gives (5.2).
2. At $(\alpha, \beta) = (1/2, 1)$, (5.2) reads $S^2(S - 1)^2 - u^2(\frac{1}{2}S^2 - 1)$. If $1 \le S \le \sqrt 2$, then $\frac{1}{2}S^2 - 1 \le 0$ and $-u^2(\frac{1}{2}S^2 - 1) \ge 0$, leaving $S^2(S - 1)^2 \ge 0$. If $S > \sqrt 2$, then $\frac{1}{2}S^2 - 1 > 0$ and $u^2 \le S^2$, so the RHS is at least $S^2(S - 1)^2 - S^2(\frac{1}{2}S^2 - 1) = \frac{1}{2}S^2(S - 2)^2 \ge 0$.
3. Fix $|u| \le U$ and $v \in \mathbb{R}$, so $S \ge \max(1, |u|)$ and $u^2 \le \min(S^2, U^2)$.
   - If $\alpha = 0$ and $\beta(1 - U^2) \ge 1$, then $(\beta - 0)S^2 - \beta = \beta(S^2 - 1) \ge 0$, so replacing $u^2 \le U^2$ in (5.2) and noting that $S \ge 1 \implies S^2 - U^2 = (1 - U^2)S^2 + U^2(S^2 - 1) \ge (1 - U^2)S^2$ gives
     $$
     \begin{aligned}
     \beta S^2(S^2 - 1) - 2S^2(S - 1) - \beta U^2(S^2 - 1)
     &= (S - 1)\big[\beta(S + 1)(S^2 - U^2) - 2S^2\big] \\
     &\ge (S - 1)\big[\beta(1 - U^2)S^2(S + 1) - 2S^2\big] \\
     &\ge (S - 1)\big[S^2(S + 1) - 2S^2\big] = S^2(S - 1)^2 \ge 0,
     \end{aligned}
     $$
     since $\beta \ge 1$, $\beta(1 - U^2) \ge 1$, and $S \ge 1$.
   - Suppose $0 < \alpha < 1/2$. Notice that the coefficient $(\beta - \alpha)S^2 - \beta$ in (5.2):
     - If $(\beta - \alpha)S^2 - \beta \le 0$, dropping $-u^2((\beta - \alpha)S^2 - \beta) \ge 0$ leaves $S^2(S - 1)[\beta(S + 1) - 2] \ge 0$ since $\beta \ge 1$ and $S \ge 1$.
     - If $(\beta - \alpha)S^2 - \beta > 0$ and $1 \le S < U$ (only possible when $U > 1$), replacing $u^2 \le S^2$ in (5.2) gives $S^2[\alpha S^2 - 2S + 2] \ge 0$ by (i).
     - If $(\beta - \alpha)S^2 - \beta > 0$ and $S \ge \max(1, U)$, replacing $u^2 \le U^2$ in (5.2) gives precisely $P_{\alpha, \beta, U}(S) \ge 0$ by (ii). $\square$

Applying Proposition 5.1(2) to $Y = A_+(z; s) \ne 0$ and $O(z) = Qz + P\bar z$ with $O\overline{\mathrm{ph}\,A_+} = u_O + i v_O$ gives $F_{\mathrm{odd}}(s; Q, P) \le \mathbb{E}_z[(u_O^2/2 + v_O^2)/|A_+|] =: \tilde q_{\mathrm{odd}}(s; Q, P)$ for all $(Q, P) \in \mathbb{C}^2$, whose matrix $\tilde M_{\mathrm{odd}}(s) = \tilde M_{\mathrm{odd}}^+(s) \oplus \tilde M_{\mathrm{odd}}^-(s)$ already certifies $\kappa_{\mathrm{odd}} < 1$ unconditionally on rows `0.88`–`0.886` and outside a compact band of $s$ on rows `0.81`–`0.875`.

On the active slabs of rows `0.81`–`0.875` (and on rows `0.79`–`0.80` for $E_{\max}(s)$), put $\tau = \sqrt{|Q|^2 + |P|^2} > 0$. By Cauchy–Schwarz $|O(z)| \le \sqrt{2}\,\tau\,|z|$:
- **Large amplitude $\tau \ge 2$:** $|A_+ + O| + |A_+ - O| - 2|A_+| \le 2|O| \le 2\sqrt{2}\,\tau\,|z|$, so $\mathbb{E}_z[\cdots] \le 2\sqrt{2}\,\tau\,\mathbb{E}_z|z| = \sqrt{2\pi}\,\tau \le \frac{\sqrt{2\pi}}{2 p_1}\,p_1 \tau^2 < 0.978\,p_1 \tau^2$.
- **Per-cell `BivJet12` conjugation-invariant geometric binning & Sturm + Proposition 5.2 hybrid (`certify_slab_odd_hybrid`, `certify_pure_cost.cpp` §9):** Each upper-half-plane shifted-polar cell $\mathcal{B}_+ = \{-r_* + \rho e^{i\phi} : \rho \in [\rho_0, \rho_1],\, \phi \in [\phi_{\mathrm{lo}}, \phi_{\mathrm{hi}}]\} \subset \{z : \mathrm{Im}\,z \ge 0\}$ is identified with its reflected conjugate half-cell $\overline{\mathcal{B}_+} = \{-r_* + \rho e^{-i\phi} : \rho \in [\rho_0, \rho_1],\, \phi \in [\phi_{\mathrm{lo}}, \phi_{\mathrm{hi}}]\}$ to form the **conjugation-invariant symmetric cell** $\mathcal{B} := \mathcal{B}_+ \cup \overline{\mathcal{B}_+}$ ($\overline{\mathcal{B}} = \mathcal{B}$, overlapping only on $\mathbb{R}$, which has Lebesgue measure zero). Because $|\bar z| = |z|$ and $|A_+(\bar z; s)| = |A_+(z; s)|$, $\sup_{\mathcal{B}}(|z|/|A_+|) = \sup_{\mathcal{B}_+}(|z|/|A_+|)$, and grouping symmetric cells by this ratio partitions $\{|z + r_*| \le \rho_{\max}\}$ into $256$ **conjugation-invariant bins** $B_b = \overline{B_b}$ (computing $\sup_{\mathcal{B}_+}(|z|/|A_+|)$, $\mathbb{E}_{B_b}[|A_+|] = 2\mathbb{E}_{\mathcal{B}_+}[|A_+|]$, and $\mathbb{E}_{B_b}[2\sqrt{2}|z|] = 2\mathbb{E}_{\mathcal{B}_+}[2\sqrt{2}|z|]$ via $2 \times 2$ sub-cells), while the $2 \times 2$ symmetric-cell integrals $U_{\mathcal{B}} = M_{\mathrm{odd}}^-(\mathcal{B}) = 2 M_{\mathrm{odd}}^-(\mathcal{B}_+)$ and $V_{\mathcal{B}} = M_{\mathrm{odd}}^+(\mathcal{B}) = 2 M_{\mathrm{odd}}^+(\mathcal{B}_+)$ are enclosed via per-cell `BivJet12` 2D Gauss–Midpoint quadrature (decomposing $g(x, y) - g(0, 0) = [g(x, 0) - g(0, 0)] + [g(x, y) - g(x, 0)]$ on each cell separately). Across $140$ geometric $\tau$-slabs $[\tau_0, \tau_1]$ covering $(0, 2]$ ($320$ slabs when certifying $E_{\max}$) and each of the $14$ Sturm-verified ladders $\beta \in \{10002/10000, 10005/10000, 1001/1000, 1002/1000, 1004/1000, 1007/1000, 101/100, 51/50, 21/20, 11/10, 23/20, 6/5, 5/4, 13/10\}$ ($20$ rungs $\alpha_k = k/40$ each; all $280$ rungs verified by exact `Fraction` Sturm chains on $P_{\alpha, \beta, U}(S_0 + x)$ in `verify_pure_cost.py` check `R4`), on each conjugation-invariant bin $B_b$ (with $U_{B_b} := M_{\mathrm{odd}}^-(B_b)$ and $V_{B_b} := M_{\mathrm{odd}}^+(B_b)$) we independently select whichever of:
  1. the Sturm rung $(\alpha_b, \beta)$ for $\bar U_b := \sqrt{2}\tau_1 \sup_{B_b}(|z|/|A_+|) \le 1.634$ (Proposition 5.1(3)) or the $(\frac{1}{2}, 1)$ fallback (Proposition 5.1(2)), contributing the decoupled $4 \times 4$ matrix $(\alpha_b U_{B_b} + \beta V_{B_b}) \oplus (\alpha_b V_{B_b} + \beta U_{B_b})$,
  2. the linear triangle cap $\big(2\sqrt{2}\mathbb{E}_{B_b}[|z|]/\tau_0\big) I_4$ when $\tau_0 > 0$, or
  3. the conjugation-invariant sum-of-squares majorant $\frac{(1-\gamma_b)^2}{\gamma_b \tau_0^2}\mathbb{E}_{B_b}[|A_+|] I_4 + \big((1 - \frac{\gamma_b}{2})U_{B_b} + \gamma_b V_{B_b}\big) \oplus \big((1 - \frac{\gamma_b}{2})V_{B_b} + \gamma_b U_{B_b}\big)$ (Proposition 5.2) for rational $\gamma_b \in (0, 1]$
  has the smallest $2 \times 2$ spectral cost (exploiting that near $z = -r_*$, $|A_+| = O(\rho)$ makes $\mathbb{E}_{B_b}[|A_+|]$ tiny while $\gamma_b < 1$ reduces $V_{B_b}$), alongside global Proposition 5.2 on $B = \mathbb{C}$ over dyadic $\gamma = m/1024$. This certifies $\kappa_{\mathrm{odd}} < 1$ on all 13 rows `0.81`–`0.886`.

### 5.3 Exact Sum-of-Squares Intercept Majorant & $E_{\max}(s)$ on Rows `0.79` and `0.80` (**P + C, author only**)
For rows `0.79` and `0.80`, $E_{\max}(s) := \sup_{(Q, P) \in \mathbb{C}^2} [F_{\mathrm{odd}}(s; Q, P) - p_1(|Q|^2 + |P|^2)] \ge 0$.

**Proposition 5.2 (Exact Sum-of-Squares Intercept Majorant on Conjugation-Invariant Sets).** *For every $\gamma \in (0, 1]$ and every $(u, v) \in \mathbb{R}^2$,*
$$
\Phi(u, v) := \sqrt{(1 + u)^2 + v^2} + \sqrt{(1 - u)^2 + v^2} - 2 \;\le\; \frac{(1 - \gamma)^2}{\gamma} + \left(1 - \frac{\gamma}{2}\right)u^2 + \gamma v^2. \tag{5.4}
$$
*Consequently, on any **conjugation-invariant** measurable subset $B \subseteq \mathbb{C}$ ($\bar B = B$, i.e. $\mathbf{1}_B(\bar z) = \mathbf{1}_B(z)$ a.e.), for every $\gamma \in (0, 1]$, every $s \ge 0$, and every $(Q, P) = (q_1 + i q_2, p_1' + i p_2') \in \mathbb{C}^2$ ($q_1, q_2, p_1', p_2' \in \mathbb{R}$),*
$$
\mathbb{E}_z\big[\mathbf{1}_B\big(|A_+ + O| + |A_+ - O| - 2|A_+|\big)\big] \;\le\; \frac{(1 - \gamma)^2}{\gamma}\,\mathbb{E}_z[\mathbf{1}_B |A_+(z; s)|] + (q_1, p_1', q_2, p_2')\,M_{\mathrm{odd}}^{(\gamma)}(s; B)\,(q_1, p_1', q_2, p_2')^T, \tag{5.5}
$$
*where $M_{\mathrm{odd}}^{(\gamma)}(s; B)$ is the **block-diagonal** $4 \times 4$ real symmetric matrix*
$$
M_{\mathrm{odd}}^{(\gamma)}(s; B) := \Big(\big(1 - \tfrac{\gamma}{2}\big)U_B + \gamma V_B\Big) \;\oplus\; \Big(\big(1 - \tfrac{\gamma}{2}\big)V_B + \gamma U_B\Big), \qquad U_B := M_{\mathrm{odd}}^-(s; B), \quad V_B := M_{\mathrm{odd}}^+(s; B).
$$
*(On a non-conjugation-invariant set $B \ne \bar B$, multiplying (5.4) by $\mathbf{1}_B|A_+|$ still gives a valid upper bound with the full coupled $4 \times 4$ real Gram matrix of $(1 - \frac{\gamma}{2})u_O^2 + \gamma v_O^2$, whereas block-diagonality between $(q_1, p_1')$ and $(q_2, p_2')$ requires $\bar B = B$.) Globally ($B = \mathbb{C} = \overline{\mathbb{C}}$), $\mathbb{E}_z|A_+(z; s)|$ is enclosed both by the direct shifted-polar symmetric-cell sum plus the conjugation-invariant $\rho \ge \rho_{\max}$ tail ($|D(z)| \le a_0 + a_2 T$ and $\sqrt T \le T$ on $T \ge T_0 \ge 56.25$) and by $\frac{\sqrt{\pi}}{2}(c_0 + \frac{3}{2}c_1 + \frac{15}{4}c_2) + s\sqrt{1 + b_A^2 + b_B^2}$.*

**Proof.** With $S = \frac{1}{2}\big(\sqrt{(1+u)^2+v^2} + \sqrt{(1-u)^2+v^2}\big) \ge \max(1, |u|)$, Proposition 5.1(1) gives $\Phi(u, v) = 2(S - 1)$ and $S^2 v^2 = (S^2 - 1)(S^2 - u^2)$, whence
$$
S^2\left[\frac{(1 - \gamma)^2}{\gamma} + \left(1 - \frac{\gamma}{2}\right)u^2 + \gamma v^2 - \Phi(u, v)\right] = \frac{S^2(\gamma S - 1)^2}{\gamma} + u^2\left[\left(1 - \frac{3\gamma}{2}\right)S^2 + \gamma\right].
$$
If $(1 - \frac{3\gamma}{2})S^2 + \gamma \ge 0$, both terms on the right are $\ge 0$. If $(1 - \frac{3\gamma}{2})S^2 + \gamma < 0$, then since $u^2 \le S^2$, replacing $u^2$ by $S^2$ bounds the right-hand side below by the explicit sum of squares
$$
\frac{S^2}{2\gamma^2(2 - \gamma)}\Big[\big(\gamma(2 - \gamma)S - 2\gamma\big)^2 + 2\gamma(1 - \gamma)(\gamma^2 - \gamma + 2)\Big] \ge 0,
$$
since $\gamma \in (0, 1]$ and $\gamma^2 - \gamma + 2 = (\gamma - \frac{1}{2})^2 + \frac{7}{4} > 0$. Next, write $z\overline{\mathrm{ph}\,A_+} = u_z + i v_z$ and $\bar z\overline{\mathrm{ph}\,A_+} = u_{\bar z} + i v_{\bar z}$ as in §4.1, so $O(z)\overline{\mathrm{ph}\,A_+} = u_O + i v_O$ has
$$
u_O = (q_1 u_z + p_1' u_{\bar z}) - (q_2 v_z + p_2' v_{\bar z}), \qquad v_O = (q_1 v_z + p_1' v_{\bar z}) + (q_2 u_z + p_2' u_{\bar z}).
$$
Under $z \mapsto \bar z$, $(u_z, u_{\bar z})$ are even while $(v_z, v_{\bar z})$ are odd, and $|A_+(\bar z; s)| = |A_+(z; s)|$. Whenever $\bar B = B$, $\mathbf{1}_B(\bar z) = \mathbf{1}_B(z)$ is also even, so every cross-expectation $\mathbb{E}_z[\mathbf{1}_B u_\bullet v_\bullet / |A_+|] = 0$ vanishes by $z \mapsto \bar z$ symmetry (the identical decoupling holds for $\alpha u_O^2 + \beta v_O^2$ in Proposition 5.1 on $\bar B = B$). Multiplying (5.4) at $(u, v) = (u_O, v_O)/|A_+|$ by $\mathbf{1}_B(z)|A_+(z; s)|$ and taking $\mathbb{E}_z$ therefore yields the block-diagonal bound (5.5); the two global $\mathbb{E}_z|A_+|$ enclosures follow from $|D(z)| = |a_0 + \alpha T + \gamma_B z^2| \le a_0 + a_2 T$ on $T \ge T_0 \ge 1$ and $\mathbb{E}_z[|z|g(|z|^2)] + s(\mathbb{E}_z|D|^2)^{1/2}$. $\square$

In `eval_emax_slab_single` and `append_emax_adaptive` (`certify_pure_cost.cpp` §9):
- Every dyadic slab $[r_{\mathrm{lo}}, r_{\mathrm{hi}}]$ on which `certify_kappa_odd_adaptive` certifies $\sup_{(Q,P) \ne 0} F_{\mathrm{odd}}/(p_1\tau^2) \le 1$ has $E_{\max}(s) = 0$ identically; this holds for all $s \ge \psi(41/64) \ge 0.383325$ on row `0.79` and all $s \ge \psi(21/64) \ge 0.195728$ on row `0.80`.
- Below that cutoff (step $1/64$ with adaptive refinement down to $1/256$), on each of the $320$ $\tau$-slabs $[\tau_0, \tau_1] \subset [0, 2]$, every global or per-bin majorant of the form $F_{\mathrm{odd}}(s; Q, P) \le C_{\mathrm{tot}} + L_{\mathrm{hi}} \tau^2$ bounds $F_{\mathrm{odd}} - p_1 \tau^2 \le \max_{[\tau_0, \tau_1]} \big(C_{\mathrm{tot}} + (L_{\mathrm{hi}} - p_1)\tau^2\big)$ in outward-rounded interval arithmetic, alongside the $1/65536$-bisected zero-slope root $\lambda_{\max}(M_{\mathrm{odd}}^{(\gamma)}(s)) \le p_1$ (while $\tau \ge 2$ has ratio $< 0.978 < 1$, hence excess $\le 0$).

---

## 6. Deliverable (d): Elementary Majorant & Quintic Matrices $N_{\mathbb{E}_1}(s), N_{\mathbb{E}}(s)$

### 6.1 One-Line Pointwise & Expectation Majorant (**P, author only**)
For every $a \in \mathbb{C} \setminus \{0\}$ and $u \in \mathbb{C}$, let $\alpha = \mathrm{Re}(\bar u\,\mathrm{ph}\,a)$ and $\beta = \mathrm{Im}(\bar u\,\mathrm{ph}\,a)$, so $|u|^2 = \alpha^2 + \beta^2$ and $|a + u|^2 = (|a| + \alpha)^2 + \beta^2 = |a|^2 + 2|a|\alpha + |u|^2$. Then $|a| + \alpha + \frac{|u|^2}{2|a|} = \frac{1}{2|a|}\big((|a| + \alpha)^2 + |a|^2 + \beta^2\big) > 0$, and squaring gives the exact identity
$$
\Big(|a| + \mathrm{Re}(\bar u\,\mathrm{ph}\,a) + \frac{|u|^2}{2|a|}\Big)^2 - |a + u|^2 = \Big(\mathrm{Re}(\bar u\,\mathrm{ph}\,a) + \frac{|u|^2}{2|a|}\Big)^2 \ge 0,
$$
whence $|a + u| \le |a| + \mathrm{Re}(\bar u\,\mathrm{ph}\,a) + \frac{|u|^2}{2|a|}$. Applying this to $a = A_\pm(z; s)$ (a.e. nonzero since the zero set of $A_\pm$ is a single point by Proposition 2.1) and $u = K(z) = \sum_{j=1}^{|\mathbb{F}|} x_j \mathbb{F}_j(z)$ ($x \in \mathbb{C}^{|\mathbb{F}|}$) and taking $\mathbb{E}_z$ gives
$$
\mathbb{E}_z\big[|A_+ + K| + |A_- + K|\big] \le \mathbb{E}_z\big[|A_+| + |A_-|\big] + \mathrm{Re}\sum_{j=1}^{|\mathbb{F}|} \bar x_j\,\mathbb{E}_z\big[\overline{\mathbb{F}_j}(\mathrm{ph}\,A_+ + \mathrm{ph}\,A_-)\big] + x^* N_{\mathbb{F}}(s) x,
$$
where $N_{\mathbb{F}}(s) := \sum_{\pm} \mathbb{E}_z[\mathbb{F}(z)\mathbb{F}(z)^* / (2|A_\pm(z; s)|)]$.

### 6.2 Parity Block Decoupling & Interval $LDL^T$ Certification
Let $\sigma_j \in \{\pm 1\}$ be the parity $\mathbb{F}_j(-z) = \sigma_j \mathbb{F}_j(z)$. Since $|A_-(-z; s)| = |A_+(z; s)|$, changing variable $z \mapsto -z$ in the $A_-$ term gives
$$
\big(N_{\mathbb{F}}(s)\big)_{j,k} = \frac{1 + \sigma_j \sigma_k}{2}\,\mathbb{E}_z\!\left[\frac{\mathbb{F}_j(z)\overline{\mathbb{F}_k(z)}}{|A_+(z; s)|}\right].
$$
1. Whenever $\sigma_j \ne \sigma_k$ (one odd, one even), $1 + \sigma_j \sigma_k = 0$, so $N_{\mathbb{E}}(s)$ is **exactly block-diagonal** between $\mathbb{E}_{\mathrm{odd}}$ ($6 \times 6$) and $\mathbb{E}_{\mathrm{even}}$ ($6 \times 6$), and $\lambda_{\max}(N_{\mathbb{E}}(s)) = \max\big(\lambda_{\max}(N_{\mathbb{E}_{\mathrm{odd}}}(s)),\; \lambda_{\max}(N_{\mathbb{E}_{\mathrm{even}}}(s))\big)$, while $N_{\mathbb{E}_1}(s)$ is the top-left $5 \times 5$ principal submatrix of $N_{\mathbb{E}_{\mathrm{odd}}}(s)$.
2. Since every $\mathbb{F}_j(\bar z) = \overline{\mathbb{F}_j(z)}$ and $|A_+(\bar z; s)| = |A_+(z; s)|$, conjugation $z \mapsto \bar z$ kills the imaginary part of every entry: both $N_{\mathbb{E}_{\mathrm{odd}}}(s)$ and $N_{\mathbb{E}_{\mathrm{even}}}(s)$ are **real symmetric** matrices with $(N)_{j,k} = \mathbb{E}_z[\mathrm{Re}(\mathbb{F}_j \overline{\mathbb{F}_k}) / |A_+|]$ within each parity block.
3. For each symmetric interval matrix $M = [M_0 - R, M_0 + R]$, `sym_interval_lam_max_bounds` certifies $\mu I - M_0 \succ 0$ by outward-rounded interval $LDL^T$ factorisation ($D_i > 0$ for all $i \implies$ all leading principal minors of $\mu I - M_0$ are positive by Sylvester's criterion) and adds the $\ell_\infty$ Weyl radius $\|R\|_\infty = \max_i \sum_j R_{ij} \ge \|\tilde M - M_0\|_2$, certifying $\lambda_{\max}(\tilde M) < \mu + \|R\|_\infty$ for every symmetric $\tilde M \in M$.

---

## 7. Closed-Form Large-$s$ Analytical Tail ($s \ge \psi(9)$)

For $s \ge s_{\max} := \psi(9) > 20$, we bound $\mathrm{tr}\,N_{\mathbb{F}}(s) = \mathbb{E}_z[\sum_j |\mathbb{F}_j(z)|^2 / |A_+(z; s)|]$ (and likewise $\mathbb{E}_z[2|z|^2 / |A_+|]$ for $M_{\mathrm{odd}}$ and $\tilde M_{\mathrm{odd}}$) by splitting $\mathbb{C}$ at $R_1 = 5$ ($T_1 = 25$):

1. **Inner disk $|z| = r \le 5$:** Since $|D(z)| \ge \mathrm{Re}\,D(z) \ge a_0 + d_2 r^2$ and $\tilde\psi(r) := \frac{r g(r^2)}{a_0 + d_2 r^2}$ has $\tilde\psi'(r) > 0$ (as $3a_0 c_1 - d_2 c_0 > 3a_0 c_1 - a_2 c_0 > 0$), for all $|z| \le 5$ and $s \ge s_{\max}$:
   $$
   |A_+(z; s)| \ge s|D(z)| - |L'(z)| \ge (a_0 + d_2 r^2)\big(s_{\max} - \tilde\psi(5)\big) \ge a_0\big(s_{\max} - \tilde\psi(5)\big) =: M_{\mathrm{in}} > 13.7.
   $$
   By $L^2(\mathcal{CN}(0, 1))$ orthonormality $\mathbb{E}_z|\mathbb{F}_j(z)|^2 = 1$, the inner-disk trace contribution is at most $|\mathbb{F}| / M_{\mathrm{in}}$.

2. **Outer region $|z| = r > 5$ ($T = x^2 + y^2 > 25$):** Define the negative-axis cone
   $$
   \mathcal{C}_s := \big\{ z = x + iy : T > 25,\; x \le -3|y|,\; r g(T) \ge \tfrac{3}{4} s(a_0 + a_2 T) \big\}.
   $$
   - **Outside $\mathcal{C}_s$:**
     - If $|y| > \frac{1}{3}|x|$, then $T < 10 y^2$, and the identity $\mathrm{Im}(\bar z A_+(z; s)) = -s y(a_0 + d_2 T)$ gives $|A_+(z; s)| \ge \frac{|\mathrm{Im}(\bar z A_+)|}{r} > \frac{s_{\max} a_0}{\sqrt{10}}$.
     - If $x \ge 3|y| \ge 0$, $\mathrm{Re}\,A_+(z; s) = x g(T) + s(a_0 + a_2 x^2 + d_2 y^2) \ge s_{\max} a_0 > \frac{s_{\max} a_0}{\sqrt{10}}$.
     - If $x \le -3|y|$ and $r g(T) < \frac{3}{4} s(a_0 + a_2 T)$, then $y^2 \le \frac{1}{10}T$ and $2\gamma_B < a_2$ give $\mathrm{Re}\,D(z) = a_0 + a_2 T - 2\gamma_B y^2 \ge \frac{9}{10}(a_0 + a_2 T)$, so $|A_+| \ge s|D| - r g(T) \ge \frac{3}{20} s(a_0 + 25 a_2) > \frac{1}{4} s_{\max} a_0$ (since $75 a_2 > 3.6 > 2 a_0$ on every row).
     Hence $|A_+(z; s)| \ge L_{\mathrm{out}} := \min\!\big(\frac{1}{4}s_{\max} a_0,\; \frac{s_{\max} a_0}{\sqrt{10}}\big) > 6$ everywhere on $\{T > 25\} \setminus \mathcal{C}_s$.
   - **Inside $\mathcal{C}_s$:** For every fixed $y \in \mathbb{R}$, as $x < 0$ decreases toward $-\infty$, $T = x^2 + y^2$, $r = \sqrt T$, and $\psi(r) = \frac{r g(T)}{a_0 + a_2 T}$ all strictly increase. Hence the horizontal slice $\mathcal{C}_{s, y} := \{x \in \mathbb{R} : x + iy \in \mathcal{C}_s\}$ has closure $I_y := (-\infty, x_{\mathrm{hi}}(y)]$, where
     $$
     x_{\mathrm{hi}}(y) := -\max\!\Big(\sqrt{\max(25 - y^2,\, 0)},\; 3|y|,\; \sqrt{\max\!\big(\psi^{-1}(\tfrac{3}{4}s)^2 - y^2,\, 0\big)}\Big) < 0.
     $$
     Everywhere on the closed half-line $I_y$, we have $T \ge 25$, $x \le -3|y|$ ($x^2 \ge \frac{9}{10}T$), and $r g(T) \ge \frac{3}{4}s(a_0 + a_2 T)$, so $s \le \frac{4 r g(T)}{3(a_0 + a_2 T)} < \frac{4 g(T)}{3 a_2 r}$, whence:
     $$
     \frac{|\mathrm{Im}\,A_+(x + iy; s)|}{|y|} = g(T) - 2s\gamma_B|x| \ge g(T)\Big(1 - \frac{8\gamma_B}{3a_2}\Big) \ge g(25)\Big(1 - \frac{8\gamma_B}{3a_2}\Big) =: \kappa_y > 0.68 \qquad (y \ne 0),
     $$
     $$
     \frac{\partial}{\partial x}\mathrm{Re}\,A_+(x + iy; s) = g(T) + 2x^2 g'(T) - 2s a_2 |x| \ge -\tfrac{5}{3}c_0 + \tfrac{2}{15}c_1 T + \tfrac{29}{15}c_2 T^2 \ge -\tfrac{5}{3}c_0 + \tfrac{2}{15}c_1(25) + \tfrac{29}{15}c_2(625) =: \kappa_x > 0.74.
     $$
     Set $f_y(x) := \mathrm{Re}\,A_+(x + iy; s)$ on $I_y = (-\infty, x_{\mathrm{hi}}(y)]$. Since $\lim_{x \to -\infty} f_y(x) = -\infty$ and $f_y'(x) \ge \kappa_x > 0$ on $I_y$, define the continuous (hence Borel-measurable) center $x_0(y) := \sup\{x \le x_{\mathrm{hi}}(y) : f_y(x) \le 0\} \in (-\infty, x_{\mathrm{hi}}(y)]$:
     - if $f_y(x_{\mathrm{hi}}(y)) \ge 0$, then $x_0(y) \in I_y$ is the unique root $f_y(x_0(y)) = 0$ on $I_y$, and $|f_y(x)| = \big|\int_{x_0(y)}^x f_y'(t)\,dt\big| \ge \kappa_x |x - x_0(y)|$ for all $x \in I_y$;
     - if $f_y(x_{\mathrm{hi}}(y)) < 0$ (which happens for fixed $s$ and large $|y|$ since $x_{\mathrm{hi}}(y) = -3|y|$ makes the leading quintic $-c_2 |x|^5$ dominate), then $x_0(y) = x_{\mathrm{hi}}(y)$, and for every $x \in I_y$ we have $x \le x_0(y)$ and $f_y(x) = f_y(x_0(y)) - \int_x^{x_0(y)} f_y'(t)\,dt \le -\int_x^{x_0(y)} \kappa_x\,dt = -\kappa_x(x_0(y) - x) \le 0$, so again $|f_y(x)| = -f_y(x) \ge \kappa_x |x - x_0(y)|$.
     In both cases, $|A_+(x + iy; s)| \ge \sqrt{\kappa_x^2(x - x_0(y))^2 + \kappa_y^2 y^2}$ for all $x + iy \in \mathcal{C}_s$.
   - **Exact three-piece Fubini integral:** Factoring $e^{-T} = e^{-T/2} \cdot e^{-T/4} \cdot e^{-T/4}$ on $T > 25$ gives $e^{-T/2} < e^{-12.5}$, while $\frac{d}{dT}(T^k e^{-T/4}) \le 0$ for $T \ge 20 \ge 4k$ ($k \le 5$) attains $\sup_{T \ge 25} P_{\mathrm{tr}}(T) e^{-T/4} = P_{\mathrm{tr}}(25) e^{-6.25}$. For the remaining $\iint_{\mathbb{R}^2} \frac{e^{-(x^2+y^2)/4}}{\sqrt{\kappa_x^2(x-x_0(y))^2 + \kappa_y^2 y^2}}\,dx\,dy$, for every fixed $y \in \mathbb{R} \setminus \{0\}$ and any center $x_0(y) \in \mathbb{R}$, splitting $\mathbb{R}_x$ at $|x - x_0(y)| \le \min(1, |y|)$ (using $e^{-x^2/4} \le 1$ and $\sqrt{\cdots} \ge \kappa_y |y|$), $\min(1, |y|) < |x - x_0(y)| \le 1$ (when $|y| < 1$, using $e^{-(x^2+y^2)/4} \le 1$ and $\sqrt{\cdots} \ge \kappa_x |x - x_0(y)|$), and $|x - x_0(y)| > 1$ (using $\sqrt{\cdots} > \kappa_x$) gives uniformly in $x_0(y)$:
     $$
     \iint_{\mathbb{R}^2} \frac{e^{-(x^2+y^2)/4}}{\sqrt{\kappa_x^2(x-x_0(y))^2 + \kappa_y^2 y^2}}\,dx\,dy \le \frac{4\sqrt\pi}{\kappa_y} + \frac{4 + 4\pi}{\kappa_x},
     $$
     using $\int_{\mathbb{R}} e^{-u^2/4}\,du = 2\sqrt\pi$ and $\int_0^1 \ln(1/y)\,dy = 1$. Combining with $\iint_{\mathbb{R}^2} \frac{e^{-(x^2+y^2)/4}}{L_{\mathrm{out}}}\,dx\,dy = \frac{4\pi}{L_{\mathrm{out}}}$ closes $s \ge \psi(9)$ with $< 0.12$ on all ratios.

---

## 8. Certified 19-Row Summary Table & Negative Controls

*(Outward-rounded Decimal bounds from `verify_pure_cost.py`: `ROUND_FLOOR` on lower bounds, `ROUND_CEILING` on upper bounds.)*

| Row | $Z$ enclosure | $\sup_{r_* \ge 1/16} \frac{\lambda_{\max}(M_{\mathrm{odd}})}{p_1}$ | $\sup_{s \ge 0} \frac{\lambda_{\max}(M_{\mathrm{odd}})}{p_1}$ | $\sup_{s \ge 0} \frac{\lambda_{\max}(\tilde M_{\mathrm{odd}})}{p_1}$ | $\kappa_{\mathrm{odd}}$ | $\sup_{s \ge 0} \frac{\lambda_{\max}(N_{\mathbb{E}_1})}{p_2}$ | $\sup_{s \ge 0} \frac{\lambda_{\max}(N_{\mathbb{E}})}{p_2}$ |
|---|---|---|---|---|---|---|---|
| `0.70` | `[1.20624165, 1.20624166]` | `<= 1.206031` | `<= 1.206242` | `[1.281683, 1.364233]` | — | `[0.236879, 0.249549]` | `[0.478398, 0.491482]` |
| `0.74` | `[1.12441883, 1.12441884]` | `<= 1.124397` | `<= 1.124419` | `[1.188956, 1.270603]` | — | `[0.221697, 0.233539]` | `[0.454265, 0.466531]` |
| `0.76` | `[1.08566212, 1.08566213]` | `<= 1.085437` | `<= 1.085663` | `[1.145476, 1.226367]` | — | `[0.214475, 0.225930]` | `[0.442609, 0.454489]` |
| `0.78` | `[1.04828367, 1.04828368]` | `<= 1.048150` | `<= 1.048284` | `[1.103663, 1.183790]` | — | `[0.207491, 0.218625]` | `[0.431215, 0.442722]` |
| `0.79` | `[1.03004173, 1.03004174]` | `<= 1.029951` | `<= 1.030042` | `[1.083318, 1.163053]` | *see $E_{\max}(s)$* | `[0.204077, 0.215052]` | `[0.425581, 0.436906]` |
| `0.80` | `[1.01206191, 1.01206192]` | `<= 1.012013` | `<= 1.012062` | `[1.063311, 1.142643]` | *see $E_{\max}(s)$* | `[0.200706, 0.211525]` | `[0.419972, 0.431118]` |
| `0.81` | `[0.99443461, 0.99443462]` | `<= 0.994426` | `<= 0.994435` | `[1.043722, 1.122649]` | `<= 0.997982` | `[0.197397, 0.208063]` | `[0.414436, 0.425406]` |
| `0.82` | `[0.97701851, 0.97701852]` | `<= 0.976774` | `<= 0.977019` | `[1.024432, 1.102940]` | `<= 0.996257` | `[0.194125, 0.204637]` | `[0.408899, 0.419694]` |
| `0.83` | `[0.95982985, 0.95982986]` | `<= 0.959628` | `<= 0.959830` | `[1.005428, 1.083505]` | `<= 0.995691` | `[0.190890, 0.201251]` | `[0.403385, 0.414008]` |
| `0.84` | `[0.94291749, 0.94291750]` | `<= 0.942756` | `<= 0.942918` | `[0.986785, 1.064491]` | `<= 0.994157` | `[0.187706, 0.197917]` | `[0.397904, 0.408358]` |
| `0.845` | `[0.93453958, 0.93453959]` | `<= 0.934398` | `<= 0.934540` | `[0.977570, 1.055084]` | `<= 0.995647` | `[0.186127, 0.196264]` | `[0.395165, 0.405535]` |
| `0.85` | `[0.92623673, 0.92623674]` | `<= 0.926115` | `<= 0.926237` | `[0.968448, 1.045766]` | `<= 0.995458` | `[0.184561, 0.194624]` | `[0.392437, 0.402723]` |
| `0.855` | `[0.91797162, 0.91797163]` | `<= 0.917869` | `<= 0.917972` | `[0.959377, 1.036499]` | `<= 0.994586` | `[0.183002, 0.192992]` | `[0.389715, 0.399918]` |
| `0.86` | `[0.90975427, 0.90975428]` | `<= 0.909670` | `<= 0.909755` | `[0.950380, 1.027291]` | `<= 0.995329` | `[0.181450, 0.191366]` | `[0.386977, 0.397097]` |
| `0.865` | `[0.90158703, 0.90158704]` | `<= 0.901521` | `<= 0.901588` | `[0.941462, 1.018161]` | `<= 0.995408` | `[0.179910, 0.189753]` | `[0.384253, 0.394290]` |
| `0.87` | `[0.89348091, 0.89348092]` | `<= 0.893433` | `<= 0.893481` | `[0.932637, 1.009085]` | `<= 0.993876` | `[0.178378, 0.188147]` | `[0.381535, 0.391491]` |
| `0.875` | `[0.88540976, 0.88540977]` | `<= 0.885380` | `<= 0.885410` | `[0.923883, 1.000079]` | `<= 0.994017` | `[0.176854, 0.186551]` | `[0.378809, 0.388683]` |
| `0.88` | `[0.87738096, 0.87738097]` | `<= 0.877368` | `<= 0.877381` | `[0.915176, 0.991112]` | `<= 0.991112` | `[0.175336, 0.184960]` | `[0.376080, 0.385873]` |
| `0.886` | `[0.86879684, 0.86879685]` | `<= 0.868558` | `<= 0.868797` | `[0.906568, 0.982567]` | `<= 0.982567` | `[0.173884, 0.183441]` | `[0.373327, 0.383034]` |

### Certified $E_{\max}(s)$ Upper Profiles on Rows `0.79` and `0.80`

| Row | Slabs in `result.json` | First slab $[0, s_1]$ | $\sup_{s \ge 0} E_{\max}(s)$ | Exact zero cutoff ($E_{\max}(s) = 0$) |
|---|---:|---|---|---|
| `0.79` | `70` | $E_{\max}(s) \le 1.213 \times 10^{-3}$ on $[0, 0.008637]$ | `<= 2.499e-3` | $\forall\,s \ge 0.383325$ ($r_* \ge 41/64$) |
| `0.80` | `30` | $E_{\max}(s) \le 4.470 \times 10^{-4}$ on $[0, 0.008756]$ | `<= 1.143e-3` | $\forall\,s \ge 0.195728$ ($r_* \ge 21/64$) |

### Adversarial Negative & Corruption Controls (`verify_pure_cost.py`)
1. **`NC1` (P6 §5):** Claiming $Z < 1$ on row `0.80` is rejected both by the C++ interval lower bound ($Z_{\mathrm{lo}}(0.80) \ge 1.01206191 > 1$) and by the independent zero-float `Fraction` bracket (`R3`).
2. **`NC2` (P6 §5):** Replacing $\frac{1}{4}p_2$ by $\frac{1}{5}p_2$ in $\sup_{s \ge 0} \lambda_{\max}(N_{\mathbb{E}_1}(s))$ on row `0.70` is rejected by the certified Rayleigh lower bound $\ge 0.236879\,p_2 > 0.20\,p_2$.
3. **`NC3` (P6 §5):** Replacing $p_1 Z$ by $0.9\,p_1 Z$ in Deliverable (b) is rejected on every row $\ge 0.81$ since $\lambda_{\max}(M_{\mathrm{odd}}(0)) = p_1 Z > 0.9\,p_1 Z$.
4. **`NC4`–`NC10`:** Receipt corruption controls (tampered `cpp_sha256`, $Z_{\mathrm{hi}}(0.81) = 1$, $M_{\mathrm{odd}}$ body $\ge Z_{\mathrm{lo}}$, collar $\mu_1 \mu_2 - r_0^2 K_{12}^2 = 0$, $\kappa_{\mathrm{odd}}(0.81) = 1$, $N_{\mathbb{E}}/p_2(0.70) = 1/2$, and nonzero terminal $E_{\max}$ slab on `0.80`) are all caught and rejected.
5. **`NC11`:** Over-stepping the rational elliptic secant rung $U_k$ by $+0.020$ at $(\beta, \alpha) = (21/20, 5/40)$ is caught and rejected by the exact `Fraction` Sturm-chain verifier.

### Replay Commands
- Fast exact rational & receipt audit (< 2 s, Python 3 stdlib only, compatible with `-O`):
  ```bash
  python3 -IB research/higher-degree/code/degree5-pure-cost-gemini-21d5/verify_pure_cost.py
  python3 -IB -O research/higher-degree/code/degree5-pure-cost-gemini-21d5/verify_pure_cost.py
  ```
- Full C++17 8-thread recompilation & bit-exact certificate regeneration (~21 min wall on 8 threads):
  ```bash
  python3 -IB research/higher-degree/code/degree5-pure-cost-gemini-21d5/verify_pure_cost.py --replay-cpp
  ```
