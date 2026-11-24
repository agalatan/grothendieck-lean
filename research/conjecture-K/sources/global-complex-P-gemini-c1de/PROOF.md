# Global 4D Complex Premise (P) on $\mathbb{C}^3$ via Weighted Cauchy–Schwarz Cell Gram Matrices and 3D Ray-Convexity Shells

**Author:** `gemini-c1de` (Refs `#431`)  
**Status:** **P + C**, independently re-derived and replayed by codex-a7c4. [Full review of #604](https://github.com/agalatan/grothendieck-lean/pull/604#issuecomment-7144799609)
**Target:** `STATUS.md` `7.4.10` (Open Problem #1 of Conjecture K, `STATUS.md` §15 Part A.1)  
**Code & Certificate:** [`code/global-complex-P-gemini-c1de/`](../../code/global-complex-P-gemini-c1de/)

---

## 0. Main Theorem and Immediate Unconditional Corollary

Fix the peak row constants of `STATUS.md` (§0, line 60):
$$
a = \frac{699}{1250}, \qquad b = \frac{179}{1250}, \qquad p = \frac{2500}{1891}, \qquad \rho_0 = \frac{5053}{10000}, \qquad c_1 = \frac{3}{5}\rho_0 = \frac{15159}{50000}, \qquad d = \frac{2}{5}.
$$
Let $z_1 \sim \mathcal{N}_{\mathbb{C}}(0,1)$ (so $T = |z_1|^2 \sim \mathrm{Exp}(1)$ and $\arg z_1$ is uniform on $[0, 2\pi)$), and set $L = z_1(a + bT)$. For any $(w, A, B) \in \mathbb{C}^3$, define
$$
h(z_1; A, B) := \left(T - \frac{2}{5}\right) A + c_1 B + \frac{z_1^2}{\sqrt{2}}\,\overline{B},
$$
$$
S_r := |A|^2 + |B|^2, \qquad R := A + \rho_0 B, \qquad U := B - \rho_0 A,
$$
$$
\mathrm{Rem}(w, A, B) := 2\,\mathbb{E}_{z_1}\!\left[\,|L + w + h| - |L + w| - \mathrm{Re}\!\left(h\,\overline{\mathrm{ph}(L + w)}\right)\right],
$$
where $\mathrm{ph}(z) := z/|z|$ for $z \neq 0$ (zero-measure at $z = 0$), and
$$
Q_0(A, B) := \left(p - \frac{463}{5000}\right) S_r - \frac{67}{100}|R|^2 - \frac{2}{25}|U|^2,
\qquad
Q_w(A, B) := Q_0(A, B) + \frac{|w|^2}{2} S_r,
\qquad
B_P(w, A, B) := Q_w(A, B) + S_r^2.
$$

### Theorem 1 (Global 4D Complex Premise `(P)`) — `P + C`
For **every** triple $(w, A, B) \in \mathbb{C}^3$,
$$
\mathrm{Rem}(w, A, B) \le B_P(w, A, B) = \left(p - \frac{463}{5000}\right) S_r - \frac{67}{100}|R|^2 - \frac{2}{25}|U|^2 + \left(\frac{|w|^2}{2} + S_r\right) S_r,
$$
with strict inequality whenever $(A, B) \neq (0, 0)$.

### Corollary 2 (Unconditional Retained Joint $A+B$ Bound on the Peak Domain) — `P + C` (via Theorem 1 + independently reviewed `7.4.10`)
Combining Theorem 1 with the independently re-derived and replayed conditional bridge of `STATUS.md` `7.4.10` (`P + C`, `codex-a7c4` / `claude-b9ee`, rev. `#428`), for **every** genuine remote cubic $q$ and **every** pair of holomorphic $A/B$ drivers $(r_A, r_B)$ (with arbitrary dimension and arbitrary sharing/dependence) satisfying $u = \|q\|^2 \le 0.0463$ and $u + V = \|q\|^2 + \|r_A\|^2 + \|r_B\|^2 \le 0.080051$,
$$
\widehat{\Lambda}(q + A + B) < S + \frac{4936}{10^8}.
$$

### Corollary 3 (Unconditional Six-Sector Cones via `7.5.3` + `7.5.12(iv)`) — `P + C`
As observed by `codex-a7c4` during the review of `#604`, combining Theorem 1 with the independently reviewed conditional six-sector assembly of `STATUS.md` `7.5.3` and the two exact affine bounds of `7.5.12(iv)` against the $49.64\cdot 10^{-6} = \frac{1241}{25000000}$ budget of $(P_\Psi)$ immediately makes the former conditional odd-dominance region unconditional on the admissible domain of `7.5.3` ($u \le 0.0463$, $u + V \le 0.080051$): whenever
$$
W \ge \min\!\left\{550\,V - \frac{1241}{125000},\; \frac{20575}{138}\,V - \frac{1241}{690000}\right\}
$$
(in particular for the full cone $W \ge 150\,V$, since $\frac{20575}{138} < 150$), we have $\widehat{\Lambda}(G) < S + 99\cdot 10^{-6}$ across all six sectors. The general moderate-$V$ odd-sector premise $(P_\Psi)$ remains open.

**Scope and what remains open.** Theorem 1 closes Open Problem #1 (`#431`, `STATUS.md` §15 Part A.1) in full complex generality without any phase restriction, proportionality hypothesis, or driver-amplitude restriction. It does **not** by itself prove full Conjecture K or the full six-sector peak bound: the remaining open problems are (i) odd sectors over general $A/B$ cores at moderate shell energy $V > 11/100000$ (`STATUS.md` `7.5.3`, `7.5.6`, `7.5.12`), (ii) the multi-row consumer outside the peak tube and its Lean formalization (`STATUS.md` §8), and (iii) for raw Conjecture K without the retained trial, the raw $A$-content inequality at intermediate kurtosis (`STATUS.md` `6.3.18`).

---

## 1. Exact Gauge Reduction and Smooth Shifted-Polar Coordinates

### 1.1 Reduction to $w \ge 0$ and $\mathrm{Im}\,A \ge 0$
For any $\phi \in \mathbb{R}$, replacing $z_1$ by $e^{i\phi} z_1$ leaves the law of $z_1$ invariant and maps $T \mapsto T$, $L \mapsto e^{i\phi} L$, and $z_1^2 \mapsto e^{2i\phi} z_1^2$. Hence replacing $(w, A, B)$ by $(e^{-i\phi} w, e^{-i\phi} A, e^{-i\phi} B)$ scales $L + w$ and $h(z_1; A, B)$ by the common phase $e^{-i\phi}$ (since $z_1^2 \overline{e^{-i\phi} B} = e^{i\phi} z_1^2 \overline{B}$ transforms under $z_1 \mapsto e^{i\phi} z_1$ to $e^{-i\phi} (e^{i\phi} z_1)^2 \overline{B}$ — explicitly, with $z_1' = e^{i\phi} z_1$, $L(z_1') + w = e^{i\phi}(L(z_1) + e^{-i\phi} w)$ and
$$
h(z_1'; A, B) = (T - d)A + c_1 B + \frac{e^{2i\phi} z_1^2}{\sqrt{2}}\overline{B} = e^{i\phi}\!\left((T - d)(e^{-i\phi} A) + c_1(e^{-i\phi} B) + \frac{z_1^2}{\sqrt{2}}\,\overline{e^{-i\phi} B}\right) = e^{i\phi} h(z_1; e^{-i\phi} A, e^{-i\phi} B)\big).
$$
Thus $\mathrm{Rem}(w, A, B)$ and $B_P(w, A, B)$ are invariant under simultaneous phase rotation of $(w, A, B)$, reducing to $w \in [0, \infty)$.

For $w \in [0, \infty)$, complex conjugation $z_1 \mapsto \bar{z}_1$ preserves the law of $z_1$ and satisfies $L(\bar{z}_1) + w = \overline{L(z_1) + w}$ and $h(\bar{z}_1; \bar{A}, \bar{B}) = \overline{h(z_1; A, B)}$. Hence $\mathrm{Rem}(w, \bar{A}, \bar{B}) = \mathrm{Rem}(w, A, B)$ and $B_P(w, \bar{A}, \bar{B}) = B_P(w, A, B)$. We may therefore restrict to
$$
w \ge 0, \qquad v = (A_r, B_r, A_i, B_i) \in \mathbb{R}^4 \quad \text{with } A_i \ge 0,
$$
where $A = A_r + i A_i$ and $B = B_r + i B_i$.

### 1.2 Smooth Shifted-Polar Coordinates ($C^\infty$ Everywhere)
The map $z_1 \mapsto y = L(z_1) = z_1(a + b|z_1|^2)$ is a radial diffeomorphism $\mathbb{C} \to \mathbb{C}$ satisfying $|y|^2 = H(T) := T(a + bT)^2$. Since $H(0) = 0$ and
$$
H'(T) = (a + bT)(a + 3bT) \ge a^2 > 0 \quad \text{for all } T \ge 0,
$$
the inverse $T = H^{-1}(|y|^2)$ is $C^\infty$ in $|y|^2 \in [0, \infty)$, and the pushforward of the standard complex Gaussian measure $d\mu(z_1) = e^{-T}\,dT\,\frac{d\arg z_1}{2\pi}$ onto the $y$-plane has 2D Lebesgue density
$$
\frac{d\mu}{d\mathrm{Re}\,y\,d\mathrm{Im}\,y} = \frac{e^{-T}}{\pi H'(T)} = \frac{f(T)}{\pi}, \qquad f(T) := \frac{e^{-T}}{(a + bT)(a + 3bT)}.
$$
Switching to **shifted polar coordinates** centered at $-w$:
$$
L + w = r e^{i\theta}, \qquad r \in [0, \infty), \quad \theta \in [0, 2\pi),
$$
we have $y = r e^{i\theta} - w$, so
$$
|y|^2 = (r - w)^2 + 2 r w (1 - \cos\theta) \ge 0
$$
(a dependency-free nonnegative identity for interval arithmetic), $z_1 = \frac{y}{a + bT}$, $z_2 := \frac{z_1^2}{\sqrt{2}} = z_{2r} + i z_{2i}$, and the measure becomes
$$
d\mu = \frac{f(T)}{\pi}\, r\,dr\,d\theta = 2 r f(T)\,dr\,\frac{d\theta}{2\pi}.
$$
Crucially, because $y \mapsto |y|^2$ and $T = H^{-1}(|y|^2)$ are $C^\infty$ on $\mathbb{C}$ (including at $y = 0$, i.e. $r = w, \theta = 0$, and at $r = 0$), every integrand $2 r^k f(T)\,\psi$ ($k \ge 0$) is **$C^\infty$ on $[0, \infty) \times [0, \pi]$ with zero singularities** — the $1/r$ factor in potential/Hessian kernels cancels identically against $r\,dr$!

In real coordinates $v = (A_r, B_r, A_i, B_i) \in \mathbb{R}^4$, we write $h = \psi_{\mathrm{re}}^\top v + i\,\psi_{\mathrm{im}}^\top v$, where
$$
\psi_{\mathrm{re}} = (T - d,\; c_1 + z_{2r},\; 0,\; z_{2i})^\top,
\qquad
\psi_{\mathrm{im}} = (0,\; z_{2i},\; T - d,\; c_1 - z_{2r})^\top.
$$
By conjugation symmetry $\theta \leftrightarrow -\theta$ (which maps $y \mapsto \bar{y}$, $z_{2r} \mapsto z_{2r}$, $z_{2i} \mapsto -z_{2i}$), integrating over $\theta \in [0, 2\pi)$ is equivalent to integrating over $\theta \in [0, \pi]$ with measure $2 r f(T)\,dr\,\frac{d\theta}{2\pi}$ and summing over the two sign vectors $v_+ = (A_r, B_r, A_i, B_i)$ and $v_- = (A_r, B_r, -A_i, -B_i)$.

---

## 2. Weighted Cauchy–Schwarz Cell Gram Matrix (`U_WCS`)

The central obstacle to global 4D certification of `(P)` is that direct 0th-order polar interval quadrature has $O(1/N)$ error, while unweighted Cauchy–Schwarz per cell loses an $O(1)$ variance gap and fails near $v = 0$. Weighting Cauchy–Schwarz by $\sqrt{|L+w|}$ removes **both** the $O(1)$ and $O(\|v\|)$ gaps simultaneously.

### Lemma 2.1 (Weighted Cauchy–Schwarz Cell Upper Bound)
Let $\{Q_k\}$ be any measurable partition of $\{r \le R_{\mathrm{cut}},\,\theta \in [0, 2\pi)\}$. For each cell $Q_k$, define
$$
A_k := \int_{Q_k} |L + w|\,d\mu = \int_{Q_k} 2 r^2 f(T)\,dr\,\frac{d\theta}{2\pi} > 0,
$$
$$
b_k := \int_{Q_k} (\cos\theta\,\psi_{\mathrm{re}} + \sin\theta\,\psi_{\mathrm{im}})\,d\mu \cdot \text{(with } d\mu = 2 r f\,dr\,\tfrac{d\theta}{2\pi}\text{)} = \int_{Q_k} 2 r f(T)\,(\cos\theta\,\psi_{\mathrm{re}} + \sin\theta\,\psi_{\mathrm{im}})\,dr\,\frac{d\theta}{2\pi} \in \mathbb{R}^4,
$$
$$
M_k := \int_{Q_k} \frac{\psi_{\mathrm{re}}\psi_{\mathrm{re}}^\top + \psi_{\mathrm{im}}\psi_{\mathrm{im}}^\top}{|L + w|}\,d\mu = \int_{Q_k} 2 f(T)\,(\psi_{\mathrm{re}}\psi_{\mathrm{re}}^\top + \psi_{\mathrm{im}}\psi_{\mathrm{im}}^\top)\,dr\,\frac{d\theta}{2\pi} \in \mathbb{R}^{4 \times 4}.
$$
Put $B_k(v) := b_k^\top v$, $C_k(v) := v^\top M_k v \ge 0$, and
$$
\Phi(A, B, C) := 2\!\left(\sqrt{A(A + 2B + C)} - A - B\right).
$$
Then for **every** $v \in \mathbb{R}^4$,
$$
\mathrm{Rem}(w, v) \le U_{\mathrm{WCS}}(w, v) := \sum_k \Phi\!\left(A_k, B_k(v), C_k(v)\right) + \mathrm{Rem}_{\mathrm{tail}}(w, v),
$$
where $\mathrm{Rem}_{\mathrm{tail}}(w, v) := 2\int_{|L+w| > R_{\mathrm{cut}}} (|L+w+h| - |L+w| - \mathrm{Re}(\overline{\mathrm{ph}(L+w)}\,h))\,d\mu$.

**Proof.** On any cell $Q_k$, write $|L + w + h| = \sqrt{|L+w|} \cdot \frac{|L+w+h|}{\sqrt{|L+w|}}$ and apply Cauchy–Schwarz with respect to $d\mu$:
$$
\int_{Q_k} |L + w + h|\,d\mu \le \left(\int_{Q_k} |L+w|\,d\mu\right)^{1/2} \left(\int_{Q_k} \frac{|L+w+h|^2}{|L+w|}\,d\mu\right)^{1/2}.
$$
Expanding $|L + w + h|^2 = |L+w|^2 + 2|L+w|\,\mathrm{Re}(\overline{\mathrm{ph}(L+w)}\,h) + |h|^2$ and dividing by $|L+w|$ gives
$$
\int_{Q_k} \frac{|L+w+h|^2}{|L+w|}\,d\mu = A_k + 2 B_k(v) + C_k(v) \ge 0.
$$
Subtracting $A_k = \int_{Q_k} |L+w|\,d\mu$ and $B_k(v) = \int_{Q_k} \mathrm{Re}(\overline{\mathrm{ph}(L+w)}\,h)\,d\mu$, multiplying by $2$, and summing over $k$ yields the claim. $\square$

**Remark (Finite-Partition Quadratic Expansion).** As $v \to 0$, expanding $\Phi(A_k, B_k, C_k)$ on a fixed finite partition $\{Q_k\}$ gives
$$
\sum_k \Phi(A_k, B_k(v), C_k(v)) = \sum_k v^\top\!\left(M_k - \frac{b_k b_k^\top}{A_k}\right) v + O(\|v\|^3),
$$
with zero $O(1)$ and zero $O(\|v\|)$ gap relative to $\mathrm{Rem}(w, v)$.

On an innermost cell $Q=[0,\delta]\times I$ with $|I|>0$, set $z_*=L^{-1}(-w)$, $c_w=f(H^{-1}(|w|^2))/\pi$ and $a(\theta)=\mathrm{Re}(e^{-i\theta}h(z_*))$ for fixed drivers. Smoothness in §1.2 gives $d\mu=(c_w r+O(r^2))\,dr\,d\theta$ uniformly in $\theta$. At $w=0$ the density remainder is $O(r^3)$. Hence
$$
 A_Q=\frac{c_w|I|}{3}\delta^3+O(\delta^4),\qquad
 B_Q=\frac{c_w}{2}\delta^2\int_I a+O(\delta^3).
$$
The exact radial projection integrated over this cell is $c_w\delta\int_I a^2+O(\delta^2)$, by integrating $\mathrm{Re}(e^{-i\theta}h)^2/r$ against $d\mu$. When $\int_I a^2>0$, the limiting fraction recovered by $B_Q^2/A_Q$ is
$$
 \frac34\,\frac{(\int_I a)^2}{|I|\int_I a^2}.
$$
Thus $3/4$ is the radial factor. Angular averaging can lower the recovered fraction, including to zero on a sector with $\int_I a=0$. The absolute loss is $O(\delta)$ for fixed drivers. The graded mesh has $\delta=3.5/n_1^{3/2}$. The certificate uses Lemma 2.1 and outward enclosures for each cell.
Evaluating $U_{\mathrm{WCS}}(w, v)$ requires only $O(1)$ arithmetic per cell once the grid at $w$ is precomputed.

### Lemma 2.2 (Exact Monotonicity of $\Phi$ for Outward Interval Arithmetic)
On the domain $A > 0$, $C \ge 0$, $A + 2B + C > 0$:
1. $\displaystyle \frac{\partial \Phi}{\partial A} = \frac{2A + 2B + C - 2\sqrt{A(A+2B+C)}}{\sqrt{A(A+2B+C)}} = \frac{\left(\sqrt{A+2B+C} - \sqrt{A}\right)^2}{\sqrt{A(A+2B+C)}} \ge 0$ (nondecreasing in $A$).
2. $\displaystyle \frac{\partial \Phi}{\partial C} = \frac{A}{\sqrt{A(A+2B+C)}} > 0$ (strictly increasing in $C$).
3. $\displaystyle \frac{\partial \Phi}{\partial B} = 2\!\left(\frac{A}{\sqrt{A(A+2B+C)}} - 1\right)$ is strictly positive for $B < -C/2$, zero at $B = -C/2$ (where $\Phi(A, -C/2, C) = C$), and strictly negative for $B > -C/2$.
4. Whenever $A + B > 0$, the exact rationalized identity
$$
\Phi(A, B, C) = \frac{2(A C - B^2)}{\sqrt{A(A + 2B + C)} + A + B}
$$
eliminates subtractive cancellation near $v = 0$.

Hence, given outward enclosures $A \le A_{\mathrm{hi}}$, $B \in [B_l, B_h]$, and $C \le C_{\mathrm{hi}}$ (with $C_{\mathrm{hi}} \ge 0$), an exact upper bound is obtained at $(A_{\mathrm{hi}}, B^*, C_{\mathrm{hi}})$ where $B^* = -C_{\mathrm{hi}}/2$ (giving $\Phi = C_{\mathrm{hi}}$) if $-C_{\mathrm{hi}}/2 \in [B_l, B_h]$, $B^* = B_h$ if $B_h < -C_{\mathrm{hi}}/2$, and $B^* = B_l$ if $B_l > -C_{\mathrm{hi}}/2$. $\square$

### Lemma 2.3 (2D `Jet2` Midpoint Quadrature and $r \ge R_{\mathrm{cut}}$ Tail)
1. **Quadrature.** For any $C^2$ function $F$ on a sub-rectangle $[a_r, b_r] \times [a_\theta, b_\theta]$ with midpoint $(r_m, \theta_m)$ and side lengths $\Delta r, \Delta\theta$, applying the 1D midpoint formula sequentially in $r$ and $\theta$ gives
$$
\int_{a_r}^{b_r}\!\int_{a_\theta}^{b_\theta} F(r,\theta)\,dr\,d\theta \in \Delta r\,\Delta\theta\!\left(F(r_m, \theta_m) + \frac{\Delta r^2}{24}\,F_{rr}\!\left([a_r, b_r] \times [a_\theta, b_\theta]\right) + \frac{\Delta\theta^2}{24}\,F_{\theta\theta}\!\left(r_m \times [a_\theta, b_\theta]\right)\right).
$$
Both second derivatives are enclosed automatically via 1-variable second-order Taylor arithmetic (`Jet2`), with outward-rounded, libm-independent Taylor enclosures for $e^{-T}$, $\sin\theta$, $\cos\theta$, and bracketed inversion $T = H^{-1}(|y|^2)$.
2. **Outer radial tail.** Whenever $R_{\mathrm{cut}} - w_{\max} \ge 22$ (used with $R_{\mathrm{cut}} = 24$ for $w \le 2$ and $R_{\mathrm{cut}} = 30$ for $w \le 8$), every point with $r = |L+w| \ge R_{\mathrm{cut}}$ satisfies $|L| \ge 22$, hence $T > 25$ since
$$
H(25) = 25\!\left(\frac{699}{1250} + 25\cdot\frac{179}{1250}\right)^2 < 22^2 = 484.
$$
By Cauchy–Schwarz, $|h|^2 \le [(T - \frac{2}{5})^2 + (c_1 + T/\sqrt{2})^2] S_r$. For all $T \ge 25$, $\frac{1}{2}T^2 + (\frac{4}{5} - \sqrt{2}\,c_1)T - (\frac{4}{25} + c_1^2) > 0$, so $|h|^2 \le 2 T^2 S_r$. Using the one-line unconditional potential bound
$$
2\!\left(|Z + h| - |Z| - \mathrm{Re}\!\left(\frac{\bar{Z}}{|Z|} h\right)\right) = \frac{|h|^2 - (|Z + h| - |Z|)^2}{|Z|} \le \frac{|h|^2}{|Z|},
$$
we obtain
$$
\mathrm{Rem}_{\mathrm{tail}}(w, v) \le \frac{S_r}{R_{\mathrm{cut}}} \int_{25}^\infty 2 T^2 e^{-T}\,dT = \frac{1354\,e^{-25}}{R_{\mathrm{cut}}}\,S_r < 10^{-9}\,S_r
$$
(verified in exact rational arithmetic in `verify.py`). $\square$

---

## 3. Part 1: Unconditional Potential Exteriors ($S_r \ge 3/4$ and $w \ge 11/8$)

Applying the unconditional potential bound $\mathrm{Rem}(w, v) \le \mathbb{E}[|h|^2 / |L+w|]$ yields a pure quadratic form that decouples by conjugation symmetry $\theta \leftrightarrow -\theta$ into two $2 \times 2$ real symmetric blocks:
$$
\mathrm{Rem}(w, v) \le (A_r, B_r)\,P_{\mathrm{re}}(w)\,(A_r, B_r)^\top + (A_i, B_i)\,P_{\mathrm{im}}(w)\,(A_i, B_i)^\top.
$$
Note that $Q_0(A, B)$ also decouples into identical $2 \times 2$ blocks $Q_0$ on $(A_r, B_r)$ and $(A_i, B_i)$, with exact rational entries:
$$
Q_{0, AA} = p - \frac{463}{5000} - \frac{67}{100} - \frac{2}{25}\rho_0^2, \qquad
Q_{0, BB} = p - \frac{463}{5000} - \frac{67}{100}\rho_0^2 - \frac{2}{25}, \qquad
Q_{0, AB} = \left(\frac{2}{25} - \frac{67}{100}\right)\rho_0.
$$
Exact rational Sylvester minors in `verify.py` certify $Q_0 > \frac{1}{3} I_2$.

### 3.1 Exact Rational Analytic Shift Exterior for All $w \ge 8$
For any $w \ge 8$, split $\mathbb{C}$ into Region 1 ($|L| \le 4$) and Region 2 ($|L| > 4$):
- **Region 1 ($|L| \le 4$):** $|L + w| \ge w - |L| \ge 4$, and $|h|^2 \le [(T - \frac{2}{5})^2 + 2 c_1^2 + T^2] S_r$. Since $\mathbb{E}[T] = 1$ and $\mathbb{E}[T^2] = 2$,
$$
\mathbb{E}\!\left[\frac{|h|^2}{|L+w|}\mathbf{1}_{|L|\le 4}\right] \le \frac{S_r}{4}\,\mathbb{E}\!\left[\left(T - \frac{2}{5}\right)^2 + 2c_1^2 + T^2\right] = \frac{1}{4}\!\left(\frac{84}{25} + 2c_1^2\right) S_r < \frac{9}{10}\,S_r.
$$
- **Region 2 ($|L| > 4$):** $H(6) = 6(a + 6b)^2 < 16 = 4^2$, so $T > 6$. On $T \ge 6$, $2 c_1^2 < 36 \le T^2$ and $(T - \frac{2}{5})^2 \le T^2$, so $|h|^2 \le 3 T^2 S_r$. The measure $d\nu(y) = 3 T^2 \mathbf{1}_{T > 6}\,d\mu(y)$ has total mass
$$
m_0 = \int_6^\infty 3 T^2 e^{-T}\,dT = 3(36 + 12 + 2)e^{-6} = 150\,e^{-6}
$$
and 2D planar density $g(y) = \frac{3 T^2 e^{-T}}{\pi (a + bT)(a + 3bT)}$. Since $T^2 e^{-T}$ is strictly decreasing on $[6, \infty)$ (derivative $T(2-T)e^{-T} < 0$) and $(a+bT)(a+3bT)$ is strictly increasing, $g(y) \le M_0 / \pi$ everywhere on $T > 6$, where
$$
M_0 := \frac{108\,e^{-6}}{(a + 6b)(a + 18b)}.
$$
By the 2D symmetric rearrangement (bathtub) inequality for $1/|y + w|$, maximizing $\int \frac{g(y)}{|y+w|}\,dA(y)$ subject to $0 \le g \le M_0/\pi$ and $\int g\,dA = m_0$ puts mass $m_0$ uniformly on the disk of radius $R = \sqrt{m_0 / M_0}$ centered at $-w$, yielding
$$
\mathbb{E}\!\left[\frac{|h|^2}{|L+w|}\mathbf{1}_{|L|>4}\right] \le S_r \int_0^R \frac{1}{r}\cdot\frac{M_0}{\pi}\cdot 2\pi r\,dr = 2\sqrt{M_0 m_0}\,S_r.
$$
Using the exact rational Taylor upper bound $e^{-6} < (\sum_{k=0}^{40} 6^k/k!)^{-1}$, `verify.py` verifies $4 M_0 m_0 < \frac{1}{9}$, hence $2\sqrt{M_0 m_0} < \frac{1}{3}$.

Combining both regions: for every $w \ge 8$ and every $(A, B) \in \mathbb{C}^2$,
$$
\mathrm{Rem}(w, A, B) < \left(\frac{9}{10} + \frac{1}{3}\right) S_r < \frac{3}{2}\,S_r < \left(\frac{1}{3} + \frac{8^2}{2}\right) S_r < Q_w(A, B) \le B_P(w, A, B). \qquad \square
$$

### 3.2 Certified Potential Slabs on $[0, 8]$
On $w \in [0, 8]$, `certify_global_P.cpp` partitions $[0, 11/8]$ into $240$ dyadic slabs (width $1/128$ on $[0, 3/8]$ and $[7/8, 11/8]$, $1/256$ on $[3/8, 7/8]$) and $[11/8, 8]$ into $208$ dyadic slabs (width $1/128$ on $[11/8, 2]$, $1/32$ on $[2, 4]$, $1/16$ on $[4, 8]$; total $448$ slabs). On each slab $[w_l, w_h]$ with midpoint $w_m$ and width $\Delta w$, outward enclosures of $P_{\mathrm{re}}(w)$ and $P_{\mathrm{im}}(w)$ are computed via the Mean Value Theorem:
$$
P(w) \in P(w_m) + \left[-\frac{\Delta w}{2},\, \frac{\Delta w}{2}\right] \frac{\partial P}{\partial w}\!\left([w_l, w_h]\right) + [0, \tau_{\mathrm{tail}}]\,I_2,
$$
and exported as exact IEEE-754 hexfloats. `verify.py` checks exact contiguous coverage and exact rational Sylvester positivity of:
- $Q_0 + \left(\frac{w_l^2}{2} + \frac{3}{4}\right) I_2 - P_{\mathrm{re/im}}([w_l, w_h]) > 0$ on all $240$ slabs of $[0, 11/8]$, closing the **amplitude exterior $S_r \ge 3/4$** for all $w \in [0, 11/8]$;
- $Q_0 + \frac{w_l^2}{2} I_2 - P_{\mathrm{re/im}}([w_l, w_h]) > 0$ on all $208$ slabs of $[11/8, 8]$, closing the **shift exterior $w \ge 11/8$** for all $(A, B) \in \mathbb{C}^2$ when joined with §3.1.

---

## 4. Part 2: 3-Line Switched Origin Profile on $[0, 11/8]$

### Lemma 4.1 (3-Line Switched Kernel Inequality)
For any $Z = r e^{i\theta} \neq 0$ and $h \in \mathbb{C}$, write $h e^{-i\theta} = u + i v$ ($u, v \in \mathbb{R}$). If $|h| \le \eta r$ with $\eta \in [0, 1/2]$, then $r + u \ge (1 - \eta) r > 0$ and
$$
2(|Z + h| - |Z| - \mathrm{Re}(h \overline{\mathrm{ph}(Z)})) = 2\!\left(\sqrt{(r + u)^2 + v^2} - (r + u)\right) = \frac{2 v^2}{\sqrt{(r + u)^2 + v^2} + (r + u)} \le \frac{v^2}{(1 - \eta) r}.
$$
Unconditionally (for all $h \in \mathbb{C}$), the left-hand side is at most $|h|^2 / r$. $\square$

For a given shift slab $[w_l, w_h]$ and amplitude cap $s_0 > 0$, on every $(r, \theta)$ quadrature sub-box where $r_{\min} > 0$ and $\eta_{\max} := s_0 M_{\max} / r_{\min} \le 1/2$ (with $M(T) = \sqrt{(T - d)^2 + (c_1 + T/\sqrt{2})^2}$), we use the switched Hessian block $\frac{1}{1 - \eta_{\max}} H_{\mathrm{re/im}}$; on all remaining sub-boxes (including $r_{\min} = 0$), we use the unconditional potential block $P_{\mathrm{re/im}}$. Summing over $[0, 24] \times [0, \pi]$ (with MVT in $w$ and the $r \ge 24$ tail) gives block-diagonal $2 \times 2$ enclosures $K_{\mathrm{re/im}}([w_l, w_h]; s_0)$ such that
$$
\mathrm{Rem}(w, v) \le v_{\mathrm{re}}^\top K_{\mathrm{re}} v_{\mathrm{re}} + v_{\mathrm{im}}^\top K_{\mathrm{im}} v_{\mathrm{im}} \qquad \forall\, w \in [w_l, w_h],\; \|v\|_2 \le s_0.
$$
Over $200$ dyadic slabs covering $[0, 11/8]$, `verify.py` verifies exact rational Sylvester positivity of $Q_0 + \frac{w_l^2}{2} I_2 - K_{\mathrm{re/im}} > 0$, establishing `(P)` for $\|v\|_2 \le s_0(w)$ with exact dyadic caps:
$$
s_0(w) = \begin{cases}
1/512 & w \in [0, 1/16], \\
1/256 & w \in [1/16, 3/16], \\
1/128 & w \in [3/16, 1/4], \\
1/64  & w \in [1/4, 5/16], \\
1/32  & w \in [5/16, 1], \\
3/64  & w \in [1, 9/8], \\
1/16  & w \in [9/8, 5/4], \\
1/4   & w \in [5/4, 11/8].
\end{cases}
$$

---

## 5. Part 3: Self-Contained Global and Per-Slab Shift Curvature

### 5.1 Global Shift Curvature $\partial_{ww}\mathrm{Rem}(w, v) \ge -480 S_r$
Following `STATUS.md` `7.4.13` — see [`sources/adaptive-cover-codex-a7c4/PROOF.md`](../adaptive-cover-codex-a7c4/PROOF.md) §1 for the distributional second derivative of the normalized remainder at zeros, which supplies the $O(S_r)$ lower bound (whereas convexity of the first norm alone gives only the $O(1) + O(\sqrt{S_r})$ base-curvature bound of §5.2 below) — re-certifying the scalar constants self-containedly inside `certify_global_P.cpp` and `verify.py` via the planar layer-cake rearrangement bound yields
$$
\partial_{ww}\mathrm{Rem}(w, v) \ge -4\sqrt{\mathrm{cap}\cdot\mathrm{mass}}\,S_r,
$$
where $\mathrm{cap} = \sup_{T \ge 0} \frac{e^{-T}\overline{B}(T)}{H'(T)}$, $\mathrm{mass} = \int_0^\infty e^{-T}\overline{B}(T)\,dT$, and
$$
\overline{B}(T) := \frac{2 M q}{a_0^2}\!\left(1 + \frac{6 b T}{a_0}\right) + \frac{8 m q T M}{a_0 c_0} + \frac{1}{2}\!\left(\left(m^2 + \frac{b^2}{a_0^2} + \frac{9b^2}{c_0^2}\right)\frac{4T}{c_0^2} + \frac{2 m}{a_0 c_0}\right) M^2,
$$
with $a_0 = a + bT$, $c_0 = a + 3bT$, $m = 1 + b/a_0 + 3b/c_0$, $q = 5/2 > \sqrt{6}$, and linear envelope $M(T) = \frac{503}{1000} + \frac{613}{500} T \ge \sqrt{(T-d)^2 + (c_1 + T/\sqrt{2})^2}$ (checked coefficientwise by exact rational squares in `verify.py`). Interval summation over $36 \times 256 = 9216$ bins of $[0, 36]$ plus the exact rational $T \ge 36$ tail ($\overline{B}(T) \le T/b^2$, verified via `coeff36 < 1`) certifies $\mathrm{cap} < 100$, $\mathrm{mass} < 140$, and $16\,\mathrm{cap}\cdot\mathrm{mass} < 480^2$, so
$$
-\partial_{ww}\!\left(\mathrm{Rem}(w, v) - B_P(w, v)\right) \le (480 + 1) S_r = 481\,S_r \qquad \forall\, w \ge 0,\; v \in \mathbb{R}^4.
$$

### 5.2 Per-Slab Base Shift Curvature for Part 5
At larger amplitudes in Part 5, convexity of $w \mapsto 2\mathbb{E}|L+w+h|$ gives the sharper bound
$$
-\partial_{ww}\mathrm{Rem}(w, v) \le N''(w) + 2|A_r|\,|C_A''(w)| + 2|B_r|\,|C_B''(w)|,
$$
where $N''(w) = \int_0^\infty\!\int_0^\pi 4 f(T) \sin^2\theta\,dr\,\frac{d\theta}{\pi}$, $C_A(w) = \int_0^\infty\!\int_0^\pi 2 r \cos\theta\,f(T)(T-d)\,dr\,\frac{d\theta}{\pi}$, and $C_B(w) = \int_0^\infty\!\int_0^\pi 2 r f(T)((c_1 + z_{2r})\cos\theta + z_{2i}\sin\theta)\,dr\,\frac{d\theta}{\pi}$ (the $A_i, B_i$ linear terms vanish identically by conjugation symmetry). Differentiating under the integral on $r \in [0, 24]$ via 1-variable `Jet2` in $w$, and bounding the $r \ge 24$ ($T > 25$) tail analytically:
- $N''_{\mathrm{tail}} = 2\mathbb{E}[(\sin^2\theta / r)\mathbf{1}_{r \ge 24}] \le \frac{1}{12} e^{-25}$;
- For $\psi \in \{T - d,\; c_1 + z_1^2/\sqrt{2}\}$, $|T_w| \le \frac{2\sqrt{T}}{c_0}$, $|T_{ww}| \le \frac{2}{a_0 c_0}$, $|Z_w| \le \frac{5}{3 a_0}$, $|Z||Z_{ww}| \le \frac{26}{9 a_0^2}$, so $|\partial_{ww}\psi| \le \frac{17\sqrt{2}}{3 a_0^2} < \frac{9}{a_0^2}$, $|\partial_w \psi| \le \frac{5\sqrt{2}\sqrt{T}}{3 a_0} < \frac{q\sqrt{T}}{a_0}$, and on $T \ge 25$, $|\partial_{ww}(f\psi)| / f \le \frac{2}{b^2}$ (verified via exact rational `coeff25 < 2` in `verify.py`), giving $|C_{A,\mathrm{tail}}''|, |C_{B,\mathrm{tail}}''| \le \frac{2}{b^2} e^{-25}$.

Thus on any slab $[w_l, w_h]$ of width $\Delta w$, linear $w$-interpolation of $F(w, v) = \mathrm{Rem}(w, v) - B_P(w, v)$ satisfies
$$
F(w, v) \le \max\!\left(F(w_l, v),\, F(w_h, v)\right) + \frac{\Delta w^2}{8}\min\!\left(481 S_r,\; n_{\mathrm{up}} + 2|A_r|\,a_{2,\mathrm{up}} + 2|B_r|\,b_{2,\mathrm{up}} + S_r\right).
$$

---

## 6. Part 4: 3D Ray-Convexity Cube Shells on $w \in [0, 5/16]$

Near $w = 0$, the origin cap is $s_0(0) = 1/512$, and covering the 4D annulus $1/512 \le \|v\|_2 \le 1/8$ directly in 4D would require enormous subdivision because the margin scales as $O(\|v\|^2)$. Instead, exact 1D ray convexity reduces the entire 4D annulus to a short geometric sequence of **3D cube boundary shells**!

### Lemma 6.1 (3D Ray-Convexity Shell Lemma)
Fix $w \ge 0$, $\eta \in (0, 1)$, and $\rho > 1$ satisfying the exact discriminant condition
$$
\left(\frac{\rho - 1}{\rho + 1}\right)^2 \le \eta.
$$
Suppose $0 < r_0 < r_1 < \dots < r_M$ satisfy $r_{m+1} \le \rho\,r_m$ for every $0 \le m < M$, and suppose that on every shell boundary $\partial([-r_m, r_m]^4)$ ($m = 0, \dots, M$),
$$
\mathrm{Rem}(w, v) \le (1 - \eta)\,Q_w(v).
$$
Then for **every** $v \in [-r_M, r_M]^4 \setminus (-r_0, r_0)^4$,
$$
\mathrm{Rem}(w, v) \le Q_w(v) < B_P(w, v).
$$

**Proof.** Write $v = t D$ with $t = \|v\|_\infty \in [r_0, r_M]$ and $\|D\|_\infty = 1$, and pick $m$ with $t \in [r_m, r_{m+1}]$. Put $f(s) := \mathrm{Rem}(w, s D)$ and $q := Q_w(D) > 0$. Since $s \mapsto f(s)$ is convex on $[0, \infty)$ and satisfies $f(r_m) \le (1-\eta) q r_m^2$ and $f(r_{m+1}) \le (1-\eta) q r_{m+1}^2$, linear interpolation along the ray gives
$$
f(t) \le (1 - \eta) q \left((r_m + r_{m+1}) t - r_m r_{m+1}\right).
$$
Now consider the quadratic polynomial $P(t) := t^2 - (1 - \eta)(r_m + r_{m+1}) t + (1 - \eta) r_m r_{m+1}$. Its discriminant is
$$
\Delta = (1 - \eta)^2 (r_m + r_{m+1})^2 - 4(1 - \eta) r_m r_{m+1} = (1 - \eta)\!\left[(r_{m+1} - r_m)^2 - \eta (r_m + r_{m+1})^2\right] \le 0
$$
because $r_{m+1}/r_m \le \rho$ implies $\left(\frac{r_{m+1} - r_m}{r_{m+1} + r_m}\right)^2 \le \left(\frac{\rho - 1}{\rho + 1}\right)^2 \le \eta$. Thus $P(t) \ge 0$ for all $t \in \mathbb{R}$, i.e., $f(t) \le q t^2 = Q_w(t D) < Q_w(t D) + \|t D\|_2^4 = B_P(w, v)$. $\square$

### 6.1 Exact 3D Face Certification and Geometric Handoffs
For each dyadic radius $r_m = k/4096$, the half-boundary $\partial([-r_m, r_m]^4) \cap \{A_i \ge 0\}$ consists of **7 exact 3D faces**: $A_r = \pm r_m$, $B_r = \pm r_m$, $A_i = +r_m$, and $B_i = \pm r_m$ (with $A_i \in [0, r_m]$ on the six faces where $A_i$ is free). On any 3D sub-box $B = \prod_{j \neq \mathrm{fx}} [c_j - h_j, c_j + h_j]$ with exact binary64 corners $\{v^{(c)}\}_{c=1}^8$:
- $\mathrm{Rem}(w, v)$ is convex in $v$, so $\mathrm{Rem}(w, v) \le \mathbb{E}_X[\mathrm{Rem}(w, X)]$ for the product-Bernoulli corner distribution $X$ with $\mathbb{E}[X] = v$.
- Because the coordinates $X_j$ are independent, off-diagonal covariances vanish identically and $\mathrm{Var}(X_j) \le h_j^2$, giving the exact identity
$$
\mathbb{E}_X\!\left[(1 - \eta) Q_w(X)\right] - (1 - \eta) Q_w(v) = \sum_{j \neq \mathrm{fx}} (1 - \eta) Q_{w, jj}\,\mathrm{Var}(X_j) \le \sum_{j \neq \mathrm{fx}} (1 - \eta) Q_{w, jj}\,h_j^2 =: e_{\mathrm{3D}}(w, B).
$$
- Combining with the global $w$-interpolation error $w_{\mathrm{err}} = \frac{\Delta w^2}{8}\cdot 481\,S_{\max}(B)$ (note $\partial_{ww}[(1-\eta)Q_w(v)] = (1-\eta) S_r \le S_r$), a 3D box $B$ is certified on $[w_l, w_h]$ whenever
$$
\max_{w' \in \{w_l, w_h\}} \left(\max_{c=1,\dots,8} \left(U_{\mathrm{WCS}}(w', v^{(c)}) - (1 - \eta) Q_{w'}(v^{(c)})\right) + e_{\mathrm{3D}}(w', B)\right) + w_{\mathrm{err}} < 0.
$$

**Exact Geometric Handoffs (verified in `verify.py`):**
- **Inner handoff to Part 2:** Every $v$ with $\|v\|_\infty \le r_0$ satisfies $\|v\|_2 \le 2 r_0 \le s_0(w)$, covered by Part 2 (`r_0 = 4/4096` on $[0, 1/16]$, `8/4096` on $[1/16, 3/16]$, `16/4096` on $[3/16, 1/4]$, `32/4096` on $[1/4, 5/16]$).
- **Outer handoff to Part 5:** Every band finishes at $r_M = 512/4096 = 1/8$. Every $v$ with $\|v\|_2 \le 1/8$ satisfies $\|v\|_\infty \le \|v\|_2 \le 1/8 = r_M$, so Part 2 $\cup$ Part 4 covers the entire Euclidean ball $\|v\|_2 \le 1/8$ on $[0, 5/16]$!

---

## 7. Part 5: 4D Adaptive WCS Bulk Cover on $w \in [0, 11/8]$

On each of the $54$ dyadic slabs covering $[0, 11/8]$ (width $1/64$ on $[0, 5/16]$ with $s_{\mathrm{bulk}} = 1/8$, and width $1/32$ on $[5/16, 11/8]$ with $s_{\mathrm{bulk}} = s_0(w)$ from Part 2), we cover the half-cube $[-7/8, 7/8]^3 \times [0, 7/8]$ (which contains the entire ball $\|v\|_2 \le \sqrt{3/4} \approx 0.86603 < 0.875$ with $A_i \ge 0$) by adaptive 4D dyadic bisection:
- **Outer pruning:** If $S_{\min}(B) \ge 3/4$, every $v \in B$ is covered by Part 1.
- **Inner pruning:** If $S_{\max}(B) \le s_{\mathrm{bulk}}^2$, every $v \in B$ is covered by Part 2 $\cup$ Part 4 (on $[0, 5/16]$) or Part 2 (on $[5/16, 11/8]$).
- **Exact 4D multilinear concavity error:** Applying the 1D multilinear error bound $\mathbb{E}_{X_j}[g(X_j)] - g(v_j) \le \frac{1}{2} h_j^2 \sup \partial_{jj} g$ sequentially over $j = 0, 1, 2, 3$:
  - For $Q_w(v)$: $\partial_{jj} Q_w = 2 Q_{w, jj}$, contributing $\sum_{j=0}^3 Q_{w, jj} h_j^2$.
  - For $S(v)^2 = (\sum_j v_j^2)^2$: $\partial_{jj}(S^2) = 4 S + 8 v_j^2 \le 4 S_{\max} + 8 a_j^2$ (where $a_j = |c_j| + h_j$), contributing $2 S_{\max} \sum_j h_j^2 + 4 \sum_j a_j^2 h_j^2$.
  Hence
  $$
  e_{\mathrm{4D}}(w, B) := \sum_{j=0}^3 Q_{w, jj}\,h_j^2 + 2 S_{\max} \sum_{j=0}^3 h_j^2 + 4 \sum_{j=0}^3 a_j^2 h_j^2
  $$
  satisfies $\mathbb{E}_X[B_P(w, X)] - B_P(w, v) \le e_{\mathrm{4D}}(w, B)$ for all $v \in B$.
- **Exact $w$-interpolation error:** Using §5.1–§5.2,
  $$
  w_{\mathrm{err}}(B) := \frac{\Delta w^2}{8}\min\!\left(481 S_{\max},\; n_{\mathrm{up}} + 2 a_0 a_{2,\mathrm{up}} + 2 a_1 b_{2,\mathrm{up}} + S_{\max}\right).
  $$
- A 4D box $B$ closes whenever all $16$ exact binary64 corners at both $w_l$ and $w_h$ satisfy $U_{\mathrm{WCS}}(w', v^{(c)}) - B_P(w', v^{(c)}) + e_{\mathrm{4D}}(w', B) + w_{\mathrm{err}}(B) < 0$ on one of the escalating WCS grids (`16×8`, `24×12`, `40×16`, `64×16`).

---

## 8. Computational Rigor, Certified Results, and Replay

### 8.1 Floating-Point and Arithmetic Discipline
- Compiled strictly with `clang++ -O2 -ffp-contract=off -frounding-math -std=c++17 -pthread -Wall -Wextra -Werror`; compiling with `-DNDEBUG` is rejected at compile time via `#ifdef NDEBUG #error ...`.
- The main thread and every worker thread unconditionally call `set_fe_upward()` (invoking `std::fesetround(FE_UPWARD)` and `std::fegetround() == FE_UPWARD` outside `assert`, calling `std::abort()` on any failure — necessary on ARM64/macOS where FPCR is per-thread), and every numerical routine unconditionally checks `require_fe_upward()`.
- Every interval arithmetic primitive enforces an inline compiler barrier (`asm volatile("" : "+w"(x))` on AArch64, `"+x"` on x86-64, `volatile` fallback) preventing compile-time constant folding.
- Every transcendental function ($e^{-T}$, $\sin\theta$, $\cos\theta$) is computed via libm-independent outward-rounded Taylor series with explicit remainder bounds; `sqrt` uses IEEE-754 `std::sqrt` with strict `FE_UPWARD` + `nextafter` guard.
- Startup self-tests verify `FE_UPWARD` rounding direction (including runtime `(-a)*b` vs `-(a*b)` under `-frounding-math`), `sqrt`, `expneg`, `sin`/`cos` identities, 18 `Jet2` finite-difference checks (including near $r = 0$ and $y = 0$), exact benchmark $2\mathbb{E}|L| = 387\sqrt{\pi}/500$, and agreement of the fast single-pass `eval_wcs_ub` with a naive `I`-interval reference evaluator on mixed-sign test vectors.
- All numeric outputs in `result.json` are serialized as exact `std::hexfloat` strings and parsed in `verify.py` via `Fraction(float.fromhex(...))` for zero-float exact rational verification. Note that `result.json` stores exact interval matrices for Parts 1–3 and summary box counts/margins/handoffs for Parts 4–5; certifying the Part 4/5 spatial covers requires executing the C++ search (`--replay-cpp`).

### 8.2 Certified Run Summary (`result.json`)
Full from-scratch replay (`python3 -I research/conjecture-K/code/global-complex-P-gemini-c1de/verify.py --replay-cpp`) completes in ~6.5 min on Apple Silicon (8 threads), verifies exact agreement against the committed `result.json`, and passes all 19 negative/corruption controls (`test_controls.py`):

| Part | Region & Method | Slabs / Boxes | Certified Margin / Bound | Open |
|---|---|---:|---|---:|
| Foundations | Peak $Q_0 > \frac{1}{3}I_2$, $M(T)$, $r \ge 24/30$ tail, $w \ge 8$ analytic exterior | Exact rational | `tail_24_ub` $= 7.851 \times 10^{-10} < 10^{-9}$; `w8_pot_ub` $= 1.2193 < \frac{3}{2} \ll \frac{97}{3}$ | 0 |
| Part 1 (Amp) | $S_r \ge 3/4$, $w \in [0, 11/8]$, MVT potential slabs + rational Sylvester PSD | 240 slabs | $\min \lambda_{\min}(Q_0 + (\frac{w_l^2}{2} + \frac{3}{4})I_2 - P) = +0.00148353$ | 0 |
| Part 1 (Shift) | $w \in [11/8, 8]$, MVT potential slabs + rational Sylvester PSD | 208 slabs | $\min \lambda_{\min}(Q_0 + \frac{w_l^2}{2}I_2 - P) = +0.01272739$ | 0 |
| Part 2 | 3-line switched origin profile on $[0, 11/8]$ ($s_0 \in [\frac{1}{512}, \frac{1}{4}]$) | 200 slabs | $\min \lambda_{\min}(Q_0 + \frac{w_l^2}{2}I_2 - K) = +0.00258301$ | 0 |
| Part 3 | Self-contained shift curvature $\partial_{ww}\mathrm{Rem} \ge -480 S_r$ | 9,216 bins + $T \ge 36$ tail | `cap` $= 95.7982 < 100$, `mass` $= 132.3134 < 140$, $16\,\mathrm{cap}\cdot\mathrm{mass} < 480^2$ | 0 |
| Part 4 | 3D ray-convexity cube shells on $[0, 5/16]$ ($s_0(w)$ to $\|v\|_\infty = 1/8$) | 56 slabs / 904,850 3D boxes | Worst closed box margin $-3.25003 \times 10^{-13} < 0$ (`-0x1.6debcfb3ccp-42`) | 0 |
| Part 5 | 4D adaptive WCS bulk cover on $[0, 11/8]$ ($s_{\mathrm{bulk}}$ to $\sqrt{3/4}$) | 54 slabs / 271,520 4D boxes | Worst closed box margin $-2.82126 \times 10^{-9} < 0$ (`-0x1.83c050066p-29`) | 0 |
| Controls | `test_controls.py` (Parts 1–5 tampering, `cpp_sha256`, `-O`, `-DNDEBUG`, live C++ hotspot) | 19 controls | All 19 rejected/verified as expected (`CONTROL_HOTSPOT diff = -0.00252963`) | — |

### 8.3 Replay and Negative Controls
From the repository root:
1. **Audit saved certificate + exact rational foundations/matrices/handoffs (< 2 s, pure Python 3 stdlib, `-I`):**
   ```bash
   python3 -I research/conjecture-K/code/global-complex-P-gemini-c1de/verify.py
   ```
2. **Run all 19 negative/corruption controls (including live C++ hotspot control, `-DNDEBUG` rejection, and `-O` rejection):**
   ```bash
   python3 -I research/conjecture-K/code/global-complex-P-gemini-c1de/test_controls.py
   ```
3. **Full C++17 outward-rounded replay from scratch (recompiles, runs hotspot control, audits temporary output, and compares exact-for-exact against the committed `result.json` without overwriting it; pass `--update-result` to regenerate `result.json`):**
   ```bash
   python3 -I research/conjecture-K/code/global-complex-P-gemini-c1de/verify.py --replay-cpp
   ```
