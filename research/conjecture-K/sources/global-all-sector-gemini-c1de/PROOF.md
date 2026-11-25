# Global All-Sector Pointwise Closure $F_{\mathrm{joint}}(c^*) \le 0$ on $\mathbb{C}^6$ at the Peak Row

Agent-ID: `gemini-c1de`. Refs [#436](https://github.com/agalatan/grothendieck-lean/issues/436), [#177](https://github.com/agalatan/grothendieck-lean/issues/177).

## 1. Main Theorem and Unconditional Six-Sector Peak-Row Corollary

At the peak row of Conjecture K (`STATUS.md` rows `7.4.10`, `7.5.3`, `7.5.6`), the exact rational parameters are
\[
  a = \frac{699}{1250}, \qquad b = \frac{179}{1250}, \qquad p = \frac{2500}{1891}, \qquad
  \rho_0 = \frac{5053}{10000}, \qquad c_1 = \frac{3}{5}\rho_0 = \frac{15159}{50000}, \qquad d = \frac{2}{5}.
\]
For $z_1 \sim \mathcal{N}_{\mathbb{C}}(0, 1)$ with $T = |z_1|^2 \sim \mathrm{Exp}(1)$, $z_1 = \sqrt{T}\,\zeta$, $L(z_1) = (a + bT)z_1$, and $f_\nu(T) = (T - 2)/\sqrt{2}$, let $(q, A, B, Q, P, \nu) \in \mathbb{C}^6$ be arbitrary complex parameters (representing a fixed realization of the remote fields $(q, r_A, r_B, Q, P)$ and deterministic $\nu$), and define
\[
  K(z_1; A, B) = \Bigl(T - \frac{2}{5}\Bigr) A + c_1 B + \frac{z_1^2 \bar{B}}{\sqrt{2}}, \qquad
  O(z_1; Q, P, \nu) = \bigl(Q + \nu f_\nu(T)\bigr) z_1 + P \bar{z}_1.
\]
Choose the **global $U(1)$-invariant visible shift** $c^* = \alpha_\nu \nu$ with $\alpha_\nu = -7/25$, and the **global $U(1)$-invariant zero-mean compensating form**
\[
  C_{\mathrm{inv}}(Q, \nu) = 2\gamma \Re(Q\bar{\nu}), \qquad
  \gamma = k_{\mathrm{comp}} - p\alpha_\nu = -\frac{11}{20} + \frac{700}{1891} = -\frac{6801}{37820}.
\]
Because $\mathbb{E}[Q] = 0$ and $\nu$ is deterministic, $\mathbb{E}[C_{\mathrm{inv}}(Q, \nu)] = 0$ holds identically under **arbitrary remote sharing and arbitrary ambient dimension**. Setting $Q' = Q - c^* = Q - \alpha_\nu \nu$ so that $O'(z_1) := O(z_1) - c^* z_1 = (Q' + \nu f_\nu(T))z_1 + P\bar{z}_1$, define the centered joint pointwise functional
\[
  F_{\mathrm{joint}}(c^*)(q, A, B, Q, P, \nu)
  := R_{\mathrm{joint}}(q, A, B; O') - B_P(q, A, B) - B_{\mathrm{odd}}(Q', P, \nu),
\]
where:
- $R_{\mathrm{joint}}(q, A, B; O') = \mathbb{E}_{z_1}\bigl[|L + q + K + O'| + |L + q + K - O'| - 2|L + q| - 2\Re(K\overline{\operatorname{ph}(L + q)})\bigr]$;
- $B_P(q, A, B) = \bigl(p - \frac{463}{5000}\bigr) S_r - \frac{67}{100}|R|^2 - \frac{2}{25}|U|^2 + \bigl(\frac{1}{2}|q|^2 + S_r\bigr) S_r$ is the quartic even target of `(P)` (`7.4.10`, `7.4.16`), with $S_r = |A|^2 + |B|^2$, $R = A + \rho_0 B$, $U = B - \rho_0 A$;
- $B_{\mathrm{odd}}(Q', P, \nu) := p(|Q|^2 + |P|^2 + |\nu|^2) + C_{\mathrm{inv}}(Q, \nu) - |c^*|^2$ expands algebraically in $(Q', P, \nu)$ (using $Q = Q' + \alpha_\nu \nu$) as
\[
  B_{\mathrm{odd}}(Q', P, \nu)
  = p|Q'|^2 + p|P|^2 + 2 k_{\mathrm{comp}} \Re(Q'\bar{\nu}) + d_\nu |\nu|^2,
\]
with exact rational constants
\[
  k_{\mathrm{comp}} = p\alpha_\nu + \gamma = -\frac{11}{20}, \qquad
  d_\nu = p + (p - 1)\alpha_\nu^2 + 2\gamma\alpha_\nu
        = p + 2 k_{\mathrm{comp}} \alpha_\nu - (p + 1)\alpha_\nu^2
        = \frac{3422717}{2363750} \approx 1.44800296.
\]
In real coordinates $u_{\mathrm{odd}} = (\Re Q', \Re P, \Re\nu, \Im Q', \Im P, \Im\nu)^T \in \mathbb{R}^6$, $B_{\mathrm{odd}}$ is block-diagonal $B_{\mathrm{odd}} = \operatorname{diag}(B_3, B_3)$ with
\[
  B_3 = \begin{pmatrix} p & 0 & -11/20 \\ 0 & p & 0 \\ -11/20 & 0 & 3422717/2363750 \end{pmatrix},
  \qquad \lambda_{\min}(B_3) \approx 0.831434 > \frac{50}{61} \approx 0.819672.
\]
(Verified in exact rational arithmetic in `verify.py`: $p - 50/61 > 0$, $d_\nu - 50/61 > 0$, and $(p - 50/61)(d_\nu - 50/61) > (11/20)^2$.)

### Exact $U(1)$ Rotation and Complex Conjugation Gauge Reduction

For any $\theta \in \mathbb{R}$, the law of $z_1$ is invariant under $z_1 \mapsto e^{i\theta} z_1$. Simultaneously transforming
\[
  (q, A, B, Q, P, \nu) \longmapsto \bigl(e^{i\theta} q,\, e^{i\theta} A,\, e^{i\theta} B,\, Q,\, e^{2i\theta} P,\, \nu\bigr)
\]
transforms $L(z_1) \mapsto e^{i\theta} L(z_1)$, $z_1^2 \bar{B} \mapsto e^{i\theta} z_1^2 \bar{B}$, $(Q + \nu f_\nu(T)) z_1 \mapsto e^{i\theta} (Q + \nu f_\nu(T)) z_1$, and $P\bar{z}_1 \mapsto e^{i\theta} P\bar{z}_1$, multiplying $L + q + K \pm O'$ by the common phase $e^{i\theta}$. Every norm $|L + q + K \pm O'|$, $|L + q|$, inner product $\Re(K\overline{\operatorname{ph}(L + q)})$, even target $B_P$, shift $c^* = \alpha_\nu \nu$, and compensating form $C_{\mathrm{inv}}(Q, \nu) = 2\gamma\Re(Q\bar{\nu})$ is therefore **strictly invariant**.
Similarly, complex conjugation $z_1 \mapsto \bar{z}_1$ with $(q, A, B, Q, P, \nu) \mapsto (\bar{q}, \bar{A}, \bar{B}, \bar{Q}, \bar{P}, \bar{\nu})$ leaves every term strictly invariant.
Therefore, without loss of generality, we may assume throughout that
\[
  q = w \in [0, \infty) \qquad\text{and}\qquad \Im A \ge 0.
\]
Write $v = (\Re A, \Re B, \Im A, \Im B) \in \mathbb{R}^4$ (with $v_2 = \Im A \ge 0$) and $S_r = \|v\|_2^2 = |A|^2 + |B|^2$.

> **Theorem A (Global All-Sector Pointwise Closure on $\mathbb{C}^6$).**
> At the peak row, with $c^* = -\frac{7}{25}\nu$ and $C_{\mathrm{inv}}(Q, \nu) = -\frac{6801}{18910}\Re(Q\bar{\nu})$,
> \[
>   F_{\mathrm{joint}}(c^*)(q, A, B, Q, P, \nu) \le 0
>   \qquad \text{for every } (q, A, B, Q, P, \nu) \in \mathbb{C}^6,
> \]
> with no $|\nu|^2 \le 1/50$ cap and no restriction on phases, amplitudes, or sharing.

> **Corollary B (Unconditional Six-Sector Bound at the Peak Row).**
> Combining Theorem A ($\mathbb{E}[F_{\mathrm{joint}}(c^*)] \le 0$) with the independently verified bridge of `STATUS.md` rows `7.5.6`, `7.5.3`, `3.3`, and `3.14` ($\sigma(u) - D_-(q) > -0.36\cdot 10^{-6}$), every admissible six-sector tuple $G$ at the peak row satisfying $u \le 0.0463$ and $u + V \le 0.080051$ (arbitrary dimension, arbitrary remote sharing, and arbitrary odd energy $W \ge 0$) obeys
> \[
>   \widehat{\Lambda}(G) < S + \frac{4936}{10^8} = S + 49.36\cdot 10^{-6} < S + 99\cdot 10^{-6}.
> \]
> *Scope / what remains open:* Theorem A and Corollary B apply at the peak row on the capped domain of `7.4.10`/`7.5.3` ($u \le 0.0463$, $u + V \le 0.080051$). Raw Conjecture K outside this domain (`6.3.18`) and the multi-row consumer across non-peak row profiles (`§8`) remain open.

---

## 2. Theorem 1: Sharp Anisotropic Capped 2-Sign Inequality and Exact Calculus

For any $X \in \mathbb{C}$, $O' \in \mathbb{C}$, and any $q > 0$, write $r = |X|$ and $\mu = \sqrt{r^2 + q} > 0$.

> **Theorem 1 (Sharp Anisotropic Capped 2-Sign Inequality).**
> For every $X, O' \in \mathbb{C}$ and every $q > 0$,
> \[
>   |X + O'| + |X - O'| - 2|X| \;\le\; \psi(|X|, q) + (O')^T A(X, q)\, O',
> \]
> where (identifying $\mathbb{C} \cong \mathbb{R}^2$)
> \[
>   \psi(r, q) := \frac{q^2}{\mu(\mu + r)^2} = 2\mu - 2r - \frac{q}{\mu},
>   \qquad
>   A(X, q) := \frac{1}{\mu} I_2 - \frac{X X^T}{\mu(\mu^2 + r^2)}.
> \]

*Proof.* Write $O' = u \hat{X} + v i\hat{X}$ in an orthonormal frame aligned with $X$ (arbitrary if $X = 0$), and put
\[
  S := \frac{|X + O'| + |X - O'|}{2} \ge r, \qquad
  \lambda := \frac{\mu^2}{\mu^2 + r^2} = 1 - \frac{r^2}{\mu^2 + r^2}.
\]
Notice that $2r + \psi(r, q) = 2\mu - q/\mu = (\mu^2 + r^2)/\mu$, so the desired inequality is equivalent to
\[
  \frac{\mu^2 + r^2}{\mu} + \frac{\lambda u^2 + v^2}{\mu} \;\ge\; 2S.
\]
If $S = r$, then $|X + O'| + |X - O'| - 2|X| = 0 \le \psi + (\lambda u^2 + v^2)/\mu$ trivially.
If $S > r$, then $(u, v)$ lies on the confocal ellipse with foci $(\pm r, 0)$ and semi-major axis $S$:
\[
  \frac{u^2}{S^2} + \frac{v^2}{S^2 - r^2} = 1 \quad\Longrightarrow\quad
  0 \le u^2 \le S^2, \qquad v^2 = (S^2 - r^2)\Bigl(1 - \frac{u^2}{S^2}\Bigr).
\]
Substituting $v^2$ gives the exact identity
\[
  \lambda u^2 + v^2 = (S^2 - r^2) + r^2 u^2\Bigl(\frac{1}{S^2} - \frac{1}{\mu^2 + r^2}\Bigr).
\]
- **Case 1 ($r < S \le \sqrt{\mu^2 + r^2}$):** Here $1/S^2 - 1/(\mu^2 + r^2) \ge 0$. Dropping the nonnegative $u^2$ term gives
  \[
    \frac{\mu^2 + r^2}{\mu} + \frac{\lambda u^2 + v^2}{\mu} - 2S
    \;\ge\; \frac{\mu^2 + S^2}{\mu} - 2S
    = \frac{(S - \mu)^2}{\mu} \ge 0.
  \]
- **Case 2 ($S > \sqrt{\mu^2 + r^2}$):** Here $1/S^2 - 1/(\mu^2 + r^2) < 0$. Using $u^2 \le S^2$ gives $\lambda u^2 + v^2 \ge \frac{\mu^2 S^2}{\mu^2 + r^2}$, whence
  \[
    \frac{\mu^2 + r^2}{\mu} + \frac{\lambda u^2 + v^2}{\mu} - 2S
    \;\ge\; \frac{\mu^2 + r^2}{\mu} + \frac{\mu S^2}{\mu^2 + r^2} - 2S
    = \frac{\bigl(\mu S - (\mu^2 + r^2)\bigr)^2}{\mu(\mu^2 + r^2)} \ge 0. \qquad \square
  \]

### Exact Calculus of $\psi(r, q)$ and Bernstein Lemmas L1 & L2

1. **Exact $\psi(r, q)$ derivatives** (verified symbolically in `verify.py` as exact polynomial identities modulo $\mu^2 = r^2 + q$):
   \[
     \frac{\partial \psi}{\partial q} = \frac{q}{2\mu^3} > 0, \qquad
     -\frac{\partial \psi}{\partial r} = \frac{q^2(2\mu + r)}{\mu^3(\mu + r)^2} > 0, \qquad
     \frac{\partial^2 \psi}{\partial r^2} = \frac{3 q^2}{\mu^5} > 0.
   \]
   As a function on $\mathbb{R}^2$, $\psi(|X|, q)$ has radial second derivative $3 q^2 / \mu^5$, negative tangential curvature $\psi'(r)/r < 0$ for $r > 0$, and a negative directional derivative jump $-4|h|$ across $X = 0$. Hence for every $X_0 \ne 0$ and every $X \in \mathbb{R}^2$ along whose segment $|X_t| \ge r_{\min}$,
   \[
     \psi(|X|, q) \;\le\; \psi(|X_0|, q) + \nabla_X \psi(X_0, q)\cdot(X - X_0) + \frac{3 q^2}{2 \mu_{\min}^5} |X - X_0|^2,
     \qquad \mu_{\min} = \sqrt{r_{\min}^2 + q}.
   \]
2. **Lemma L1 (Exact First-Derivative Operator Norm, $C_1 = 1$).**
   For all $X \in \mathbb{R}^2$, $q > 0$, and unit $h \in \mathbb{R}^2$, $\|D_X A(X, q)[h]\|_{\mathrm{op}} \le 1/\mu^2$.
   *Proof:* By $O(2)$-equivariance put $X = (r, 0)$, $h = (c, s)$, $x = r^2/\mu^2 \in [0, 1]$, $y = c^2 \in [0, 1]$. Then $M_1 = \mu^2 D_X A[h]$ has $|M_{00}| \le 1$, $1 + \det M_1 \ge 0$, and $(1 + \det M_1)^2 - (\operatorname{tr} M_1)^2 \ge 0$, each certified by exact nonnegative 2D Bernstein coefficients in `verify.py` (degrees `(6, 0)`, `(2, 1)`, `(6, 2)`). $\square$
3. **Lemma L2 (Exact Second-Derivative Loewner Upper Bound, $C_2 = 2$).**
   For all $X \in \mathbb{R}^2$, $q > 0$, and unit $h \in \mathbb{R}^2$, $\mu^3 D_X^2 A(X, q)[h, h] \preceq 2 I_2$.
   *Proof:* Clearing $(1+x)^3$ in $H = 2 I_2 - \mu^3 D_X^2 A[h, h]$ yields exact polynomials $H_{00}, H_{11}, \det H$ on $(x, y) \in [0, 1]^2$, each certified $\ge 0$ by exact nonnegative 2D Bernstein coefficients in `verify.py` (degrees `(6, 2)`, `(6, 2)`, `(8, 4)`). $\square$
4. **Constant-Pivot Rule ($\mu_0 = 61/50$).**
   Since $A(X, q) \preceq \frac{1}{\sqrt{q}} I_2$ and $\psi(r, q) \le \sqrt{q}$, choosing constant $q = (61/50)^2$ gives $\psi \le 61/50$ and $\mathbb{E}[G_{\mathrm{iso}}(z_1)/\mu_0] = \frac{50}{61} I_6 \prec B_{\mathrm{odd}}$ for **every** $(w, A, B) \in \mathbb{R} \times \mathbb{C}^2$.

---

## 3. Part 1: Shift Exterior ($w \ge 11/8$) and Amplitude Exterior ($S_r \ge 25/16$)

### Shift Exterior $w \ge 11/8$ (Even + Odd $L = 1$ Decoupled Potential)
Setting $L = 1$ in the sharp joint secant inequality (`7.5.12` Theorem 1) decouples the even and odd sectors completely:
\[
  R_{\mathrm{joint}}(w, v; O')
  \;\le\; \mathbb{E}_{z_1}\!\left[\frac{|K(z_1; v)|^2}{|L(z_1) + w|}\right]
        + \mathbb{E}_{z_1}\!\left[\frac{|O'(z_1)|^2}{|L(z_1) + w|}\right]
  = v^T P_{\mathrm{even}}(w) v + u_{\mathrm{odd}}^T O_{\mathrm{iso}}(w) u_{\mathrm{odd}}.
\]
- **On $w \in [11/8, 8]$ (272 dyadic slabs: 80 on $[11/8, 2]$, 64 on $[2, 4]$, 128 on $[4, 8]$):** Smooth shifted-polar `Jet2` midpoint integration on $r \in [0, 30]$ plus MVT $w$-variation and exact $r \ge 30$ tails ($T > 25$) encloses $P_{\mathrm{re}}, P_{\mathrm{im}}$ and $O_{\mathrm{iso}}$ (block-diagonal $\operatorname{diag}(O_3, O_3)$ by conjugation symmetry). `verify.py` checks exact rational Sylvester PSD of $Q_0 + \frac{w_l^2}{2} I_2 - P_{\mathrm{re/im}}$ and $B_3 - O_3$ on every slab.
- **On $w \ge 8$ (exact zero-float analytic proof in `verify.py`):**
  - *Even sector:* identical to `7.4.16` ($\mathbb{E}[|K|^2/|L+w|] \le \frac{3}{2} S_r < \frac{97}{3} S_r \le (Q_0 + 32 I_2)[v]$).
  - *Odd sector:* Split into $|L| \le 4$ (where $|L+w| \ge 4$, so $\mathbb{E}[G_{\mathrm{iso}}/|L+w|\,\mathbf{1}_{|L|\le 4}] \preceq \frac{1}{4}\mathbb{E}[G_{\mathrm{iso}}] = \frac{1}{4} I_6$) and $|L| > 4$ (where $H(6) < 16 \implies T > 6$, and $G_{\mathrm{iso}}(z_1) \preceq \frac{1}{2} T^3 I_6$ since $\frac{1}{2}T^3 - T(1 + \frac{(T-2)^2}{2}) = T(2T - 3) > 0$ for $T \ge 2$). Mass $m_0 = \frac{1}{2}\Gamma(4, 6) = 183 e^{-6}$ and peak density $M_0 = \frac{108 e^{-6}}{(a+6b)(a+18b)}$ satisfy $4 M_0 m_0 \approx 0.10917 < 1/9$ in exact rational arithmetic, so 2D Hardy–Littlewood radial rearrangement yields $\le 2\sqrt{M_0 m_0} I_6 < \frac{1}{3} I_6$. Total: $O_{\mathrm{iso}}(w) \preceq (\frac{1}{4} + \frac{1}{3}) I_6 = \frac{7}{12} I_6 \prec \frac{50}{61} I_6 \prec B_{\mathrm{odd}}$.

### Amplitude Exterior $S_r \ge 25/16$ on $w \in [0, 11/8]$
- **On $w \in [0, 11/8]$ (240 dyadic slabs):** Part 1 certifies $P_{\mathrm{re/im}}(w) \preceq Q_0 + (\frac{w_l^2}{2} + \frac{3}{4}) I_2$, so $\operatorname{Rem}(w, v) \le B_P(w, v) - (S_r - \frac{3}{4}) S_r$.
- For every $S_r \ge 25/16$, the remaining even slack satisfies $(S_r - \frac{3}{4}) S_r \ge \frac{325}{256} > \frac{61}{50}$, which strictly absorbs the constant-pivot odd cap $\psi \le 61/50$ with $M_{\mathrm{odd}} \preceq \frac{50}{61} I_6 \prec B_{\mathrm{odd}}$, giving $F_{\mathrm{joint}}(c^*) < 0$ everywhere on $S_r \ge 25/16$!

---

## 4. Part 2: Hybrid Local-Pullback + Outer Perturbation Origin Strip ($\|v\|_2 \le s_{\mathrm{odd}}(w)$)

On every one of 152 fine dyadic slabs $[w_l, w_h] \subset [0, 11/8]$ ($\Delta w = 1/128$ on $[0, 1]$, $\Delta w = 1/64$ on $[1, 11/8]$), Part 2 certifies that for ALL $w \in [w_l, w_h]$ and ALL $\|v\|_2 \le s_{\mathrm{odd}}(w)$ (with $s_{\mathrm{odd}}$ stepping from $1/8$ on $[0, 1/16]$ down to $3/64$ on $[9/16, 11/8]$), the unregularized ($q = 0$, $C_0 = 0$) anisotropic odd matrix satisfies
\[
  M_{\mathrm{odd}}(w, v; 0) := \mathbb{E}_{z_1}\!\bigl[E(z_1)^T A(L(z_1) + w + K(z_1; v), 0)\, E(z_1)\bigr] \;\prec\; B_{\mathrm{odd}}.
\]
Consequently, on $\|v\|_2 \le s_{\mathrm{odd}}(w)$, $F_{\mathrm{joint}}(c^*) \le \operatorname{Rem}(w, v) - B_P(w, v) \le 0$: for Part 3 boxes wholly inside $\|v\|_2 \le s_{\mathrm{odd}}(w)$ this follows directly from the independently verified global `(P)` theorem (`STATUS.md` row `7.4.16`, `P + C`), while for straddling Part 3 boxes any corner with $\|c^{(m)}\|_2 \le s_{\mathrm{odd}}(w)$ is certified directly with $C_0 = 0$ and WCS even slack $\Delta_P = B_P - U_{\mathrm{WCS}}$.
- **Inner domain $\Omega = \{|L(z) + w| \le \delta\}$:** On $|z| \le r_{\Omega,\max}$ (where $H(r_{\Omega,\max}^2) = (w_h + \delta)^2$), checking $\sqrt{6}\, r_{\Omega,\max} s_{\mathrm{odd}} < a$ guarantees global injectivity of $z \mapsto L(z) + K(z; v)$, pulling the singular $1/|L + w + K|$ integral back to smooth shifted-polar coordinates $\tilde{z} = L^{-1}(L(z) + K(z))$ with exact Jacobian minorant $f_1 f_2 > 0$, exponential factor $\exp(T_{\tilde{z}} - T_z)$, and Young/Cauchy–Schwarz decoupling with parameter $\varepsilon_{\mathrm{CS}} > 0$ for $\Delta E = E(z) - E(\tilde{z})$.
- **Outer domain $r \in [\delta, 24]$:** With $\eta(z) = M_K(T) s_{\mathrm{odd}} / r < 1$, Lemma L1 integrated along the segment from $L + w$ to $L + w + K$ yields $A(L + w + K, 0) - A(L + w, 0) \preceq \frac{1}{r}\frac{\eta}{1-\eta} I_2$, enclosed by outward-rounded interval Riemann sums.
- **Tail $r \ge 24$:** Forces $T > 25$, where $|L + w| \ge b T^{3/2}$ and $M_K(T) \le \frac{5}{4} T$ give $\eta < 2 s_{\mathrm{odd}} < 1/2$ and tail matrix $\preceq \frac{1}{1 - 2s_{\mathrm{odd}}}\frac{8828}{24} e^{-25} I_6 < 10^{-8} I_6$.
- Every slab's resulting interval $3\times 3$ matrices $M_{\mathrm{re}}, M_{\mathrm{im}}$ are verified strictly below $B_3$ across all 8 extreme off-diagonal sign corners by exact rational Sylvester determinants in `verify.py`.

---

## 5. Part 3: Master 5D Convexity–Semiconvexity Point-Corner Theorem & 4D Bulk Cover

To cover the remaining compact bulk $w \in [0, 11/8]$, $s_{\mathrm{odd}}(w) \le \|v\|_2 \le 5/4$ (with $v_2 = \Im A \ge 0$), we eliminate box-Lipschitz bloat in the odd engine completely via an exact 5D convexity reduction:

> **Theorem 2 (5D Convexity–Semiconvexity Point-Corner & Flat-Quartic Reduction).**
> Fix ANY $(Q, P, \nu) \in \mathbb{C}^3$. Define $H(w, v) := \mathbb{E}_{z_1}[|L + w + K(v) + O'| + |L + w + K(v) - O'|]$.
> 1. **Joint convexity:** Because $(w, v) \mapsto L + w + K(v) \pm O'$ is real-affine for every $z_1$, $H(w, v)$ is **jointly convex** in $(w, v) \in \mathbb{R} \times \mathbb{R}^4$.
> 2. **Uniform $O(1)$ shift semiconvexity:** All remaining terms of $F_{\mathrm{joint}}(c^*)$, namely $-N(w) - 2 A_r C_A(w) - 2 B_r C_B(w) - B_P(w, v) - B_{\mathrm{odd}}(Q', P, \nu)$, are **independent of $(Q, P, \nu)$** (up to the constant $-B_{\mathrm{odd}}$). On $[w_l, w_h]$ with $|A_r| \le a_h[0]$, $|B_r| \le a_h[1]$, $S_r \le S_{\max}$,
>    \[
>      \frac{\partial^2}{\partial w^2}\Bigl(-N(w) - 2 A_r C_A(w) - 2 B_r C_B(w) - \frac{w^2}{2} S_r\Bigr)
>      \;\ge\; -\bigl(n_{\mathrm{up}} + 2 a_h[0] a_{2,\mathrm{up}} + 2 a_h[1] b_{2,\mathrm{up}} + S_{\max}\bigr) =: -M_w,
>    \]
>    giving uniform 1D shift-interpolation error $w_{\mathrm{err}} = \frac{(w_h - w_l)^2}{8} M_w$, valid for ALL $(Q, P, \nu)$.
> 3. **Exact 4D flat-quartic multilinear corner reduction:** On any axis-aligned box $B = \prod_{j=0}^3 [c_j - h_j, c_j + h_j]$ with $S_{\min} = \min_{v \in B} \|v\|_2^2$, for EVERY $t \in [0, 1]$ we have $S(v)^2 \ge t S(v)^2 + (1 - t) S_{\min}^2$. Since $v_0 v_1$ and $v_2 v_3$ are multilinear (exact zero error under product corner weights $\lambda_m = \prod_{j=0}^3 \theta_{j, m_j}$), the concavity defect of $-Q_{w_e}(v) - t S(v)^2$ on $B$ is at most $q_{\mathrm{sum}}(w_e) + t\cdot\mathrm{quart\_err}$, where
>    \[
>      q_{\mathrm{sum}}(w_e) = \sum_{j=0}^3 \bigl(q_{0, j} + \tfrac{1}{2} w_e^2\bigr) h_j^2, \qquad
>      \mathrm{quart\_err} = 2 S_{\max} \sum_{j=0}^3 h_j^2 + 4 \sum_{j=0}^3 a_h[j]^2 h_j^2.
>    \]
>    Taking $\sup_{Q, P, \nu}$ yields, for EVERY $t_l, t_h \in [0, 1]$:
>    \[
>      \sup_{(w, v) \in [w_l, w_h] \times B}\;\sup_{Q, P, \nu} F_{\mathrm{joint}}(c^*)
>      \;\le\; \max_{e \in \{l, h\}} \Bigl(\max_{m \in \{0..15\}} \bigl[f_{\mathrm{ub}}(w_e, c^{(m)}) + (1 - t_e)(S(c^{(m)})^2 - S_{\min}^2)\bigr]
>                                       + q_{\mathrm{sum}}(w_e) + t_e\,\mathrm{quart\_err}\Bigr) + w_{\mathrm{err}}.
>    \]

Part 3 partitions $[0, 11/8]$ into **96 dyadic slabs** ($\Delta w = 1/64$ on $[0, 7/16]$ and $[3/4, 1]$, $\Delta w = 1/128$ across the fold valley $[7/16, 3/4]$, and $\Delta w = 1/32$ on $[1, 11/8]$), each an exact union of Part 2 slabs with $s_{\mathrm{odd}}^{\mathrm{P3}} \le \min_{\mathrm{P2}} s_{\mathrm{odd}}^{\mathrm{P2}}$ verified in exact rational arithmetic by `verify.py`. Deterministic LPT chunking (27 fixed contiguous chunks, fold slabs `[28..64)` first) shares endpoint WCS grids and corner caches across consecutive slabs within each chunk while guaranteeing bit-for-bit reproducibility.

At every cached corner point $(w_e, c^{(m)})$ (zero box radius $r_w = r_v = 0$), `certify_all_sector.cpp` certifies:
- an upper bound $\operatorname{Rem}(w_e, c^{(m)}) \le U_{\mathrm{WCS}}(w_e, c^{(m)})$ via a 3-tier Weighted Cauchy–Schwarz Cell Gram Matrix hierarchy (`10×8`, `22×14`, lazy `44×24`, matching `7.4.16`), giving even slack $\Delta_P = B_P(w_e, c^{(m)}) - U_{\mathrm{WCS}}(w_e, c^{(m)})$;
- an explicit nonnegative radial polynomial $q(T) = \sigma^2 + T(c_0 + 2 c_1 f_\nu(T) + c_2 f_\nu(T)^2)$ ($c_1^2 \le c_0 c_2$) proposed either along the 1D growing profile $s\cdot(0.15 + T + 0.10\,T f_\nu(T)^2)$ or by an untrusted double-precision Euler–Lagrange dual ascent heuristic, and then rigorously verified via 2nd-order cell-integrated polar enclosures (`Imom`/`Jmom`/`Kmom`, `ang0`/`ang1`/`ang2`, exact `wt_T1`/`wt_T2`/`wt_p2` 2nd-order $\psi$ integration, exact $T \ge 28$ Gamma tails) across a demand-driven 4-level polar grid hierarchy (`g0 = 15×24`, `g1 = 27×40`, `g2 = 46×56`, `g3 = 72×88`) with precomputed adaptive `mdepth = 1, 2` subcell splitting near zeros of $X(T, \phi)$. Every accepted corner certifies BOTH $B_{\mathrm{odd}} - M_{\mathrm{odd}}^{\mathrm{ub}} \succ 0$ (strict 6×6 outward-rounded Cholesky pivot $> 0$) AND $f_{\mathrm{ub}}(w_e, c^{(m)}) = C_0^{\mathrm{hi}} - \Delta_P < 0$.

---

## 6. Certification Summary, Replay, and Negative Controls

The full 8-thread certification (`verify.py --replay-cpp --update-result`) compiled `certify_all_sector.cpp` with `clang++ -O2 -ffp-contract=off -frounding-math -std=c++17 -pthread -Wall -Wextra -Werror` and completed with **zero open boxes** (`10,326` CPU-s):

| Part | Coverage | Slabs / Leaves | Certified Margin / Pivot |
|---|---|---:|---|
| Exact foundations (`verify.py`) | $B_{\mathrm{odd}} \succ \frac{50}{61}I_6$, Lemmas L1/L2 (2D Bernstein), $\psi$ calculus, $w \ge 8$ even+odd analytic exteriors | zero-float exact $\mathbb{Q}$ | $O_{\mathrm{iso}}(w) \preceq \frac{7}{12}I_6 \prec \frac{50}{61}I_6$; $4 M_0 m_0 \approx 0.1092 < \frac{1}{9}$ |
| Part 1 (Amplitude exterior) | $w \in [0, 11/8]$, $S_r \ge 25/16$ | 240 dyadic slabs | $\min\mathrm{even\_margin} = 1.7000\cdot 10^{-3} > 0$ |
| Part 1 (Shift exterior) | $w \in [11/8, 8]$, all $S_r, \omega \ge 0$ | 272 dyadic slabs | $\min\mathrm{even\_m} = 2.4830\cdot 10^{-2}$, $\min\mathrm{odd\_m} = 6.9868\cdot 10^{-1}$ |
| Part 2 (Hybrid origin strip) | $w \in [0, 11/8]$, $\|v\|_2 \le s_{\mathrm{odd}}(w)$ | 152 dyadic slabs | $\min\mathrm{piv} = 3.7027\cdot 10^{-2}$, exact $\min\det_3 = 8.4277\cdot 10^{-3} > 0$ |
| Part 3 (4D all-sector bulk) | $w \in [0, 11/8]$, $s_{\mathrm{odd}}(w) \le \|v\|_2 \le 5/4$, $\Im A \ge 0$ | 96 dyadic slabs, **782,450** 4D boxes (`0` open) | $\max\mathrm{margin} = -1.1933\cdot 10^{-9} < 0$ (`[0.375, 0.390625]`), $\min\mathrm{odd\_piv} = 2.2091\cdot 10^{-6} > 0$ (`[0.171875, 0.1875]`) |

Part 3 leaf breakdown across all 96 slabs (`782,450` total): `14,518` amplitude-exterior (`S_min >= 25/16`), `9,342` origin-strip (`S_max <= s_odd^2`), `0` constant-pivot shortcut, `16,701` `g0`, `148,908` `g1`, `592,981` `g2+`.

### Replay and Negative Controls
- **Exact rational audit (`< 1 s`):** `python3 -I research/conjecture-K/code/global-all-sector-gemini-c1de/verify.py`
- **19 negative/corruption controls (`~3 s`):** `python3 -I research/conjecture-K/code/global-all-sector-gemini-c1de/test_controls.py` — **19/19 PASS** (Part 1–3 discontinuities, Sylvester PSD failures, handoff gap `s_odd_p3 > s_odd_p2`, non-negative margin / non-positive pivot, box-count tampering, bad `cpp_sha256`, `python3 -O`, live C++ false-target control `CONTROL_ALL_SECTOR dp=0.00224987 false_diff=-0.00775013 origin_piv=0.115920`, and compile-time `-DNDEBUG` rejection).
- **Full bit-for-bit C++17 replay:** `python3 -I research/conjecture-K/code/global-all-sector-gemini-c1de/verify.py --replay-cpp`

### File Digests (`code/global-all-sector-gemini-c1de/`)
- `certify_all_sector.cpp` (`144,483` bytes): `acd3a10ca5a1c33ccb35a62c926800735c1240abcf81c91a80b974c351dc045a`
- `verify.py` (`24,242` bytes): `4036dee32d282afda8f89eb9d6488a6dacb9b0d080ad679eb37b4e10a7e2119b`
- `result.json` (`461,437` bytes): `169701514d1e18149e0ae1b35412c92c3e4f5a7ffd23a2862037414a134cae27`
- `test_controls.py` (`8,245` bytes): `53648495dae751f32368f1d4f3de956e50897238138127a7d61ed0bf85e77c37`
- `README.md` (`2,773` bytes): `ebb5f22597066c84458a0b1cd4e7997d2e2206cd59198a5075485556eb582ef7`
