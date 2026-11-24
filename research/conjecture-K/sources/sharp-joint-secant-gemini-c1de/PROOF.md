# Sharp global joint secant inequalities for the odd sectors over A/B cores

Agent-ID: gemini-c1de. Refs #436. **P + C.** Independently checked and replayed by codex-a7c4. [independent review of the corrected #594](https://github.com/agalatan/grothendieck-lean/pull/594#issuecomment-7142979900)

This note establishes two elementary pointwise inequalities — a sharp global
joint secant inequality (Theorem 1) and a paired bulk even/odd majorant
(Theorem 2) — together with a pointwise visible-shift and zero-mean compensating
identity (§3), and combines them with an outward-rounded C++ interval certifier
and an exact rational verifier to extend the proved regions of the centred joint
defect $F_{\mathrm{joint}}$ (`STATUS.md` 7.5.6) and the averaged odd premise
$(P_\Psi)$ (`STATUS.md` 7.5.3) at the peak row of Conjecture K:

1. **Shift exterior (`Part A`).** For every $|q| \ge 11/8 = 1.375$, every shell
   energy $S_r \ge 0$, and every odd amplitude $\omega \ge 0$ — with **no**
   $|\nu|^2 \le 1/50$ cap — both the original centred joint defect $F_{\mathrm{joint}}$
   ($c = 0$, `7.5.6`) and the visibly shifted defect $F_{\mathrm{joint}}(c^*)$ are
   pointwise nonpositive ($F_{\mathrm{joint}} \le 0$ and $F_{\mathrm{joint}}(c^*) \le 0$).
   This shrinks the shift exterior $|q| \ge 10$ of `7.5.6` by $7.27\times$.
2. **Global unconditional cone and shell exterior (`Part B`).** For all
   $w, A, B, Q, P, \nu$ (with no $(P)$ assumption and no $|\nu|^2 \le 1/50$ cap),
   $F_{\mathrm{joint}}(c^*) \le c_V S_r - S_r^2 - c_W \omega'$ with exact certified
   constants at $L = 13/4$ and $L = 5$, yielding:
   - an unconditional large-shell exterior $S_r \ge 3.053$ (no $|\nu|^2 \le 1/50$
     cap);
   - an unconditional odd-dominance cone $W \ge 179\,V$ ($2.09\times$ wider
     than `7.5.8`'s $W \ge 375\,V$, and without assuming $(P)$);
   - an unconditional linear closure $\mathbb{E}[F_{\mathrm{joint}}(c^*)] \le 50\cdot 10^{-6}$
     for $V \le 1/61060 \approx 1.6377\cdot 10^{-5}$ ($44.5\times$ larger than
     `7.5.10`'s $3.67\cdot 10^{-7}$).
3. **Multiscale unconditional closure (`Part C`).** Switching cellwise between
   Theorem 2 (on bulk cells where $\eta_K < \eta_{\mathrm{cut}}$) and Theorem 1
   (near the zero of $Y = L + w$) across an 18-level staircase in $S_r$, combined
   with an exact rational upper bound on the two-driver Gaussian tail expectation
   $\max_{\lambda_1 + \lambda_2 = V}\mathbb{E}[S_r\mathbf{1}\{S_r > K\}]$, proves
   $\mathbb{E}[F_{\mathrm{joint}}(c^*)] \le 49711749/10^{12} \approx 4.971175\cdot 10^{-5} < 50\cdot 10^{-6}$
   for all $0 \le V \le 11/100000 = 1.1\cdot 10^{-4}$ (and
   $\le 38098983/10^{12} \approx 3.8099\cdot 10^{-5}$ for $V \le 10^{-4}$)
   — hence $\widehat{\Lambda}(G) < S + 99.36\cdot 10^{-6} < S + 10^{-4}$ for all
   six sectors with arbitrary sharing at the peak row, **without assuming $(P)$**
   and with no $|\nu|^2 \le 1/50$ cap ($299\times$ larger than `7.5.10`'s
   unconditional $3.67\cdot 10^{-7}$ and $9.73\times$ larger than `7.5.8`'s
   conditional $1.13\cdot 10^{-5}$).
4. **Sharpened recentred $(P_\Psi)$ cone (`Part D`).** Applying Theorem 1 to
   the recentred split $X = (L + w) + H$ of `7.5.8` yields $W \ge 150\,V$
   ($2.50\times$ stronger than `7.5.8`'s $W \ge 375\,V$) and linear small-shell
   closure $V \le 1241/68750000 \approx 1.8051\cdot 10^{-5}$ under $(P)$ (against the $49.64\cdot 10^{-6}$ budget of $(P_\Psi)$).

The global $(P)$ proof makes Part D unconditional on the peak energy domain.
The moderate-shell odd-sector estimate outside the proved regions and the multi-row
consumer remain open. [Global proof, Corollary 3](../global-complex-P-gemini-c1de/PROOF.md)

---

## 1. Theorem 1: Sharp Global Joint Secant Inequality

**Theorem 1.** *For every $L \ge 1$ and all $Y, K, O \in \mathbb{C}$ with
$Y \ne 0$, write $K e^{-i\arg Y} = u_K + i v_K$ and
$O e^{-i\arg Y} = u_O + i v_O$ ($u_K, v_K, u_O, v_O \in \mathbb{R}$). Then*
$$|Y + K + O| + |Y + K - O| - 2|Y| - 2\operatorname{Re}\big(K\,\overline{\operatorname{ph}(Y)}\big)
  \;\le\; \frac{1}{|Y|}\left(L u_K^2 + v_K^2 + \frac{L}{2L - 1} u_O^2 + v_O^2\right).$$

*Remark.* Theorem 1 strictly strengthens the translated-base inequality of
`STATUS.md` 7.5.8 in two simultaneous ways: (i) the transverse even coefficient
on $v_K^2$ drops from $L$ to $1$ (matching the infinitesimal second derivative
at $K = O = 0$); and (ii) it bounds the **entire** centred joint remainder
$R_{\mathrm{joint}}$ directly rather than only the odd increment over $Y + K$,
so the even remainder $2(|Y+K| - |Y| - \operatorname{Re}(K\overline{\operatorname{ph}(Y)}))$
is absorbed at zero extra cost. Every coefficient is sharp (for $v_K, v_O$ in the infinitesimal limit, and for
both real coefficients $L$ and $\frac{L}{2L - 1}$ simultaneously at $Y = 1$,
$K = -1/L$, $O = 2 - 1/L$, where both sides equal $2$ for every $L \ge 1$).

*Proof.* Dividing by $|Y| > 0$ and rotating so $Y = 1$, write
$K = X_K + i Y_K$, $O = X_O + i Y_O$, and set
$$a := 1 + X_K + X_O, \quad b := 1 + X_K - X_O, \quad c := Y_K + Y_O, \quad d := Y_K - Y_O.$$
Then $Y_K^2 + Y_O^2 = \frac{1}{2}(c^2 + d^2)$ and $2 + 2 X_K = a + b$.

**Step 1 (Exact elimination of transverse parts).** For any $r, s \in \mathbb{R}$,
we claim
$$\sqrt{r^2 + s^2} - \frac{s^2}{2} \;\le\; \psi(r) := \begin{cases}
  \frac{1 + r^2}{2}, & |r| \le 1, \\
  |r|, & |r| > 1.
\end{cases}$$
Indeed, setting $u = \sqrt{r^2 + s^2} \ge |r|$, we have
$s^2 = u^2 - r^2$ and
$$u - \frac{u^2 - r^2}{2} = \frac{1 + r^2}{2} - \frac{(u - 1)^2}{2} \le \frac{1 + r^2}{2}.$$
If $|r| > 1$, then $u \ge |r| > 1$ implies
$u - |r| = \frac{s^2}{u + |r|} \le \frac{s^2}{2|r|} < \frac{s^2}{2}$, hence
$u - s^2/2 \le |r|$. Applying this bound to $(a, c)$ and $(b, d)$ gives
$$\sqrt{a^2 + c^2} + \sqrt{b^2 + d^2} - (Y_K^2 + Y_O^2) - 2 - 2 X_K
  \;\le\; \psi(a) + \psi(b) - (a + b).$$

**Step 2 (Exact 1D reduction in $(a, b)$).** Set $t := 1/L \in (0, 1]$, so
$L = 1/t$ and $\frac{L}{2L - 1} = \frac{1}{2 - t}$. Using
$X_K = \frac{a + b - 2}{2}$ and $X_O = \frac{a - b}{2}$, the algebraic identity
$$\frac{A^2}{t} + \frac{B^2}{2 - t}
  \;=\; \frac{1}{2}(A + B)^2 + \frac{\big((2 - t)A - t B\big)^2}{2t(2 - t)}$$
applied to $A = X_K$, $B = X_O$ yields
$$R(a, b) := L X_K^2 + \frac{L}{2L - 1} X_O^2
  \;=\; \frac{(a - 1)^2}{2} + \frac{\big((1 - t)(a - 1) + (b - 1)\big)^2}{2t(2 - t)}$$
and, by symmetry in $X_O \mapsto -X_O$, also
$$R(a, b) = \frac{(b - 1)^2}{2} + \frac{\big((1 - t)(b - 1) + (a - 1)\big)^2}{2t(2 - t)}.$$
Moreover, using $X_K^2 + X_O^2 = \frac{(a - 1)^2 + (b - 1)^2}{2}$ and
$X_K^2 - X_O^2 = (1 - a)(1 - b)$, we have
$$R(a, b) - \frac{(a - 1)^2 + (b - 1)^2}{2}
  \;=\; (L - 1)\left(X_K^2 - \frac{X_O^2}{2L - 1}\right)
  \;\ge\; (L - 1)(X_K^2 - X_O^2) \;=\; (L - 1)(1 - a)(1 - b),$$
because $L \ge 1 \implies 2L - 1 \ge 1$. Hence whenever **both $a \le 1$ and
$b \le 1$**, $R(a, b) \ge \frac{(a - 1)^2 + (b - 1)^2}{2}$ (we thank
`codex-a7c4` for spotting a faulty global lower bound in an earlier draft and
pointing out this exact $(1 - a)(1 - b) \ge 0$ identity).
We verify $\psi(a) + \psi(b) - (a + b) \le R(a, b)$ in all six cases (by symmetry
assuming $a \ge b$):

1. **$a > 1,\; b > 1$:** $\psi(a) + \psi(b) - (a + b) = 0 \le R(a, b)$.
2. **$a > 1,\; |b| \le 1$:** $\psi(a) + \psi(b) - (a + b) = \frac{(b - 1)^2}{2} \le R(a, b)$ (by the completed square in $b - 1$).
3. **$|a| \le 1,\; |b| \le 1$:** both $a, b \le 1$, so $\psi(a) + \psi(b) - (a + b) = \frac{(a - 1)^2 + (b - 1)^2}{2} \le R(a, b)$.
4. **$a > 1,\; b < -1$:** $\psi(a) + \psi(b) - (a + b) = -2b$. Set
   $p = a - 1 > 0$, $q = -1 - b > 0$ (so $b - 1 = -(q + 2)$). By the completed square in $b - 1$,
   $$R(a, b) - (-2b) = \frac{(q + 2)^2}{2} - 2(q + 1) + \frac{\big(p - (1 - t)(q + 2)\big)^2}{2t(2 - t)}
     = \frac{q^2}{2} + \frac{\big(p - (1 - t)(q + 2)\big)^2}{2t(2 - t)} \ge 0.$$
5. **$|a| \le 1,\; b < -1$:** both $a, b \le 1$, and $\psi(a) + \psi(b) - (a + b) = \frac{(a - 1)^2}{2} - 2b$.
   Since $b < -1$, $-(2b) = 2|b| < \frac{(b - 1)^2}{2}$ (as
   $(b - 1)^2 + 4b = (b + 1)^2 > 0$), so
   $\frac{(a - 1)^2}{2} - 2b < \frac{(a - 1)^2 + (b - 1)^2}{2} \le R(a, b)$.
6. **$a < -1,\; b < -1$:** both $a, b \le 1$, and $\psi(a) + \psi(b) - (a + b) = -2(a + b) < \frac{(a - 1)^2 + (b - 1)^2}{2} \le R(a, b)$
   because $(r - 1)^2 + 4r = (r + 1)^2 > 0$ for both $r = a$ and $r = b$. $\square$

---

## 2. Theorem 2: Paired Bulk Even and Perturbed-Ellipse Odd Majorants

On cells away from the zero of $Y = L + w$ where the even perturbation
$K / |Y|$ has modulus bounded by $\eta < 1$, we decouple the even and odd
parts directly by writing
$$|Y + K + O| + |Y + K - O| - 2|Y| - 2\operatorname{Re}(K\overline{\operatorname{ph}(Y)})
  = 2\big(|Y + K| - |Y| - \operatorname{Re}(K\overline{\operatorname{ph}(Y)})\big)
    + \big(|Y + K + O| + |Y + K - O| - 2|Y + K|\big),$$
and bound the two terms separately without losing the alignment of $Y$.

**Theorem 2(a) (Rational Bulk Even Majorant).** *For every
$\eta \in (0, 1]$, every $X \ge -\eta$, and every $Y \in \mathbb{R}$,*
$$2\Big(\sqrt{(1 + X)^2 + Y^2} - (1 + X)\Big)
  \;\le\; \frac{\eta^2}{1 - \eta + \eta^2} X^2 + \frac{1}{1 - \eta + \eta^2} Y^2.$$

*Proof.* Set $\alpha = \frac{\eta^2}{1 - \eta + \eta^2}$,
$\gamma = \frac{1}{1 - \eta + \eta^2}$, and
$s := \sqrt{(1 + X)^2 + Y^2} - (1 + X) \ge 0$ (since $1 + X \ge 1 - \eta \ge 0$).
Then $Y^2 = s^2 + 2(1 + X)s$, so
$$\alpha X^2 + \gamma Y^2 - 2s
  \;=\; \gamma s^2 + 2\big(\gamma(1 + X) - 1\big) s + \alpha X^2.$$
If $X \ge 0$, then $\gamma(1 + X) - 1 \ge \gamma - 1 = \frac{\eta(1 - \eta)}{1 - \eta + \eta^2} \ge 0$,
so all three terms are nonnegative. If $-\eta \le X < 0$, write $u = -X \in (0, \eta]$;
the quadratic in $s$ has discriminant
$$\frac{\Delta}{4} = \big(\gamma(1 - u) - 1\big)^2 - \alpha\gamma u^2
  = \big(\gamma(1 - u) - 1 - \sqrt{\alpha\gamma}\, u\big)\big(\gamma(1 - u) - 1 + \sqrt{\alpha\gamma}\, u\big).$$
Since $\sqrt{\alpha\gamma} = \eta\gamma$, the second factor is
$$\gamma\big(1 - (1 - \eta)u\big) - 1 \;\ge\; \gamma\big(1 - (1 - \eta)\eta\big) - 1 = 0,$$
while the first factor is
$$\gamma\big(1 - (1 + \eta)u\big) - 1.$$
When $1 - \gamma(1 - u) \le 0$ the linear coefficient in $s$ is already
nonnegative; when $1 - \gamma(1 - u) > 0$, we need only
$1 - \gamma(1 - u) \le \sqrt{\alpha\gamma}\,u = \eta\gamma u$, i.e.
$1 \le \gamma(1 - (1 - \eta)u)$, which was just verified. Thus
$\alpha X^2 + \gamma Y^2 - 2s \ge 0$ for all $X \ge -\eta$ and all $Y \in \mathbb{R}$. $\square$

**Theorem 2(b) (Perturbed Ellipse Bound for Arbitrary $O$).** *For every
$\eta \in [0, 1)$, every $M = 1 + x + i y \in \mathbb{C}$ with
$x^2 + y^2 \le \eta^2$, and every $O = u + i v \in \mathbb{C}$,*
$$|M + O| + |M - O| - 2|M|
  \;\le\; \frac{1 + \eta}{2(1 - \eta)} u^2 + \frac{1}{1 - \eta} v^2.$$

*Proof.* By the standard anisotropic secant inequality
$|M + O| + |M - O| - 2|M| \le \frac{|O|^2}{|M|} - \frac{(\operatorname{Re}(\bar{M}O))^2}{2|M|^3}$
(`STATUS.md` 7.2.10), writing $r = |M| \in [1 - \eta, 1 + \eta]$ and
$M = (1 + x) + i y$ ($x^2 + y^2 \le \eta^2$), we have
$$\frac{|O|^2}{r} - \frac{((1 + x)u + y v)^2}{2 r^3}
  \;=\; \left(\frac{1}{r} - \frac{(1 + x)^2}{2 r^3}\right) u^2
      - \frac{(1 + x)y}{r^3} u v
      + \left(\frac{1}{r} - \frac{y^2}{2 r^3}\right) v^2.$$
Thus it suffices to prove positive semidefiniteness of the $2 \times 2$ difference
matrix $\begin{pmatrix} A & C \\ C & B \end{pmatrix}$ with
$$A = \frac{1 + \eta}{2(1 - \eta)} - \frac{1}{r} + \frac{r^2 - y^2}{2 r^3}
    = \frac{1 + \eta}{2(1 - \eta)} - \frac{1}{2r} - \frac{y^2}{2 r^3},$$
$$B = \frac{1}{1 - \eta} - \frac{1}{r} + \frac{y^2}{2 r^3}, \qquad
  C = \frac{(1 + x) y}{2 r^3},$$
using $(1 + x)^2 = r^2 - y^2$. Immediately $B \ge \frac{1}{1 - \eta} - \frac{1}{r} \ge 0$
since $r \ge 1 - \eta$. For the determinant, note that $C^2 = \frac{(r^2 - y^2)y^2}{4 r^6}$,
so the $y^4$ terms cancel identically in $A B - C^2$:
$$4 r^3 (1 - \eta)^2 (A B - C^2)
  \;=\; 2r\Big((1 + \eta) r^2 - (1 - \eta)(2 + \eta) r + (1 - \eta)^2\Big) - (1 - \eta)^2 y^2.$$
For fixed $r \in [1 - \eta, 1 + \eta]$, the identity
$s := x^2 + y^2 = r^2 - 1 - 2x$ implies
$x = \frac{r^2 - 1 - s}{2}$ and
$$y^2 = s - \left(\frac{r^2 - 1 - s}{2}\right)^2.$$
Differentiating with respect to $s$ at fixed $r$ gives
$\frac{\partial (y^2)}{\partial s} = 1 + \frac{r^2 - 1 - s}{2} = 1 + x \ge 1 - \eta > 0$,
so $y^2$ is maximized on $x^2 + y^2 \le \eta^2$ at the boundary $s = \eta^2$:
$$y^2 \;\le\; y_{\max}^2(r) := \eta^2 - \left(\frac{r^2 - 1 - \eta^2}{2}\right)^2.$$
Substituting $r = (1 - \eta) + t$ with $t \in [0, 2\eta]$, exact polynomial
expansion (verified symbolically in `verify.py:check_theorem_2b_polynomial`)
gives the identity
$$2r\Big((1 + \eta) r^2 - (1 - \eta)(2 + \eta) r + (1 - \eta)^2\Big) - (1 - \eta)^2 y_{\max}^2(r)$$
$$=\; 2\eta^2(1 - \eta)^2 t
    + (1 - \eta)(3 + 4\eta^2 - \eta^3) t^2
    + (3 - \eta)(1 + \eta^2) t^3
    + \frac{1}{4}(1 - \eta)^2 t^4 \;\ge\; 0$$
for every $\eta \in [0, 1)$ and $t \ge 0$. Since $B > 0$ (or $r = 1 - \eta \implies y = 0, A = \frac{\eta}{1-\eta} \ge 0, B = C = 0$),
the matrix is positive semidefinite throughout $x^2 + y^2 \le \eta^2$. $\square$

---

## 3. Visible Shift $c^*$ and Phase-Invariant Zero-Mean Compensating Form

At the peak row (`STATUS.md` 7.4.10, 7.5.3, 7.5.6), the exact rational constants are
$$a = \frac{699}{1250}, \quad b = \frac{179}{1250}, \quad \rho = \frac{5053}{10000}, \quad
  c = \frac{3}{5}\rho = \frac{15159}{50000}, \quad d = \frac{2}{5}, \quad
  p = \frac{2500}{1891}, \quad p_c = p - \frac{463}{5000}.$$
For the fixed remote trial $\xi_0 = -\frac{3}{5}(r_A + \rho r_B)$ and a single
global complex visible shift $c^* \in \mathbb{C}$, orthogonality of $\xi_0$
(remote) and $c^* z_1$ (visible, $\mathbb{E}|z_1|^2 = 1$) gives
$\|\xi_0 + c^* z_1\|^2 = \|\xi_0\|^2 + |c^*|^2$. Setting
$O' := O - c^* z_1 = z_1 Q' + \bar{z}_1 P + \nu z_1 (T - 2)/\sqrt{2}$ with
$Q' := Q - c^*$ (so $Q = Q' + c^*$), visible parity (`MONOGRAPH.md` §1.7) and
the exact accounting of `7.5.6` yield, **without assuming $(P)$**,
$$T_{(\xi_0, c^*)}(G) - S \;<\; 49\cdot 10^{-6} - \frac{1}{100}\|U\|^2 - \sigma(u) + D_-(q) + \mathbb{E}[F_{\mathrm{joint}}(c^*)],$$
where
$$F_{\mathrm{joint}}(c^*) := R_{\mathrm{joint}}(Y, K, O') + |c^*|^2 - B_P - p\omega - C(Q, \nu),$$
$\omega = |Q|^2 + |P|^2 + |\nu|^2$, and $C(Q, \nu)$ is a fixed real bilinear
form in $(Q, \nu)$ alone (with **no** $P$–$\nu$ term, $c_3 = c_4 = 0$):
$$C(Q, \nu) := 2(c_1 Q_r \nu_r + c_2 Q_i \nu_i).$$
**Phase invariance under arbitrary sharing.** When rotating a complex remote
shift $q = |q| e^{i\phi}$ to the real axis via $z_1 = e^{i\phi}\zeta$ and
factoring out the common output phase $e^{i\phi}$ from $|L + q + K \pm O'|$,
the odd coefficients transform as
$$(Q',\; P,\; \nu) \;\longmapsto\; (Q',\; e^{-2i\phi} P,\; \nu).$$
Both $Q'$ and $\nu$ are strictly invariant under this sample-dependent gauge
rotation (whereas $e^{-2i\phi} P$ is not, and need not have zero expectation
when $P$ shares remote coordinates with $q$; we thank `codex-a7c4` for catching
this in review and supplying the phase-invariant constants below). Because
$c_3 = c_4 = 0$, $C(Q, \nu)$ is unchanged in the rotated real-$w$ frame, and
since $\mathbb{E}[Q] = 0$ ($Q \in H_{1,1}$) and $\nu \in \mathbb{C}$ is
deterministic, $\mathbb{E}[C(Q, \nu)] = 0$ holds unconditionally under
arbitrary sharing, with **no** conditional centring assumption
$\mathbb{E}[Q \mid q, A, B] = 0$.

Choose the global rational visible shift
$$c^* := \alpha_r \nu_r + i \alpha_i \nu_i, \qquad \alpha_r = -\frac{31}{100}, \qquad \alpha_i = -\frac{7}{25},$$
and choose
$$k_1 = -\frac{73}{100}, \quad k_2 = -\frac{33}{50}, \quad c_3 = c_4 = 0, \qquad
  c_1 := k_1 - p\alpha_r, \quad c_2 := k_2 - p\alpha_i.$$
Substituting $Q_r = Q'_r + \alpha_r \nu_r$ and $Q_i = Q'_i + \alpha_i \nu_i$
gives the **exact pointwise quadratic identity** (verified in `verify.py:check_algebra_and_matrices`):
$$p(|Q|^2 + |P|^2 + |\nu|^2) - |c^*|^2 + C(Q, \nu)
  \;=\; v_{\mathrm{re}}^\top B_{\mathrm{re}} v_{\mathrm{re}}
      + v_{\mathrm{im}}^\top B_{\mathrm{im}} v_{\mathrm{im}},$$
where $v_{\mathrm{re}} = (Q'_r, \tilde{P}_r, \nu_r)^\top$,
$v_{\mathrm{im}} = (Q'_i, \tilde{P}_i, \nu_i)^\top$ (with $\tilde{P} = e^{-2i\phi} P$,
$|\tilde{P}| = |P|$), and
$$B_{\mathrm{re}} = \begin{pmatrix} p & 0 & k_1 \\ 0 & p & 0 \\ k_1 & 0 & d_{\nu,r} \end{pmatrix}, \qquad
  B_{\mathrm{im}} = \begin{pmatrix} p & 0 & k_2 \\ 0 & p & 0 \\ k_2 & 0 & d_{\nu,i} \end{pmatrix},$$
with boosted diagonal $\nu$-entries
$$d_{\nu,r} = p + 2 k_1 \alpha_r - (p + 1)\alpha_r^2 \approx p + 0.2295, \qquad
  d_{\nu,i} = p + 2 k_2 \alpha_i - (p + 1)\alpha_i^2 \approx p + 0.1875.$$
Exact rational Sylvester minors (`verify.py`) certify
$$B_{\mathrm{re}} \succ \frac{3}{5} I_3, \qquad B_{\mathrm{im}} \succ \frac{3}{5} I_3, \qquad
  B_{7.5.6} \succ \frac{3}{5} I_3 \quad (\text{for } |h_{7.5.6}| \le 62/100),$$
and $Q_0 = \begin{pmatrix} Q_{A0} & Q_{AB0} \\ Q_{AB0} & Q_{B0} \end{pmatrix} \succ 0$,
where $B_P = v_K^\top \big(Q_0 + \frac{w^2}{2} I\big) v_K + S_r^2$ in the real
basis $(\tilde{A}_r, \tilde{B}_r)$ and $(\tilde{A}_i, \tilde{B}_i)$. Moreover,
$\mathbb{E}[\|v_{\mathrm{re}}\|^2 + \|v_{\mathrm{im}}\|^2] = \mathbb{E}[|Q'|^2 + |P|^2 + |\nu|^2] = W + |c^*|^2 \ge W$,
so any bound $-c_W (\|v_{\mathrm{re}}\|^2 + \|v_{\mathrm{im}}\|^2)$ with $c_W > 0$
implies $-c_W W$ upon taking expectations.

---

## 4. Visible Polar Coordinates, Factored Densities, and Interval Certification

By rotation invariance in $z_1$ and conjugation invariance $z_1 \mapsto \bar{z}_1$,
we may assume $w = |q| \ge 0$ is real and fold the visible plane into the upper
half-plane $\theta \in [0, \pi]$ in polar coordinates centred at the zero of
$Y = L + w$:
$$L + w = r e^{i\theta}, \qquad L = (r\cos\theta - w) + i r\sin\theta =: x + i y, \qquad s := x^2 + y^2 = |L|^2 = T(a + bT)^2.$$
Because $z_1 \mapsto L(z_1) = z_1(a + b|z_1|^2)$ is a radial diffeomorphism with
Jacobian $D(T) := \frac{ds}{dT} = (a + bT)(a + 3bT)$, the Gaussian measure
$d\gamma(z_1) = \pi^{-1} e^{-T} d(\text{area } z_1)$ pushes forward in
$(r, \theta) \in (0, \infty) \times [0, \pi]$ (after folding $\theta \leftrightarrow -\theta$) to
$$\mathbb{E}_{z_1}\left[\frac{f(r, \theta)}{|L + w|}\right]
  \;=\; \int_0^\infty \int_0^\pi f(r, \theta)\,\frac{2}{\pi}\,\frac{e^{-T}}{D(T)}\,d\theta\,dr,$$
where the singular $1/r$ factor cancels the polar Jacobian $r\,dr\,d\theta$
identically, making every integrand $C^\infty$ on $[0, \infty) \times [0, \pi]$!

By reflection $y \mapsto -y$, all cross terms between real components
$(A_r, B_r), (Q'_r, P_r, \nu_r)$ and imaginary components
$(A_i, B_i), (Q'_i, P_i, \nu_i)$ vanish identically. Furthermore, in the odd
block, rotating $O' \mapsto i O'$ swaps $(u_O, v_O) \mapsto (-v_O, u_O)$, yielding
the exact block symmetry $M^{(O,u)}_{\mathrm{im}} = M^{(O,v)}_{\mathrm{re}}$
and $M^{(O,v)}_{\mathrm{im}} = M^{(O,u)}_{\mathrm{re}}$.

The C++ certifier `certify_joint_secant.cpp` is compiled with `-ffp-contract=off`
(disabling fused multiply-add contraction) and uses strictly outward-rounded
IEEE-754 interval arithmetic (`std::nextafter` in verified `FE_TONEAREST` mode;
every transcendental enclosure verified arithmetically without trusting `libm`).
All numeric outputs are printed in exact IEEE-754 hexadecimal floating-point
format (`std::hexfloat`) and parsed bit-for-bit into exact dyadic `Fraction`
objects in `verify.py` (`float.fromhex`), eliminating decimal rounding between
C++ and Python. Every Part C threshold uses the outward-rounded upper bound
`rat(sm, 1000).h >= sm / 1000` so the claimed rational $K = (sm/1000)^2$ is
strictly enclosed.
- **Factored 1D densities:** Every matrix integrand is factored into closed-form
  1D densities $f(s)$ of $s = x^2 + y^2$ (with exact derivatives $f'(s), f''(s)$
  from $T \mapsto s = T(a + bT)^2$) multiplied by low-degree polynomials in
  $(r, \cos\theta, \sin\theta, w)$. Built-in startup self-tests verify all 36
  second-derivative entries against central finite differences.
- **2D midpoint rule + linear $w$-interpolation:** On each $(r, \theta)$ cell
  and each $w$-slab $[w_l, w_h]$ of an exact dyadic IEEE-754 230-slab partition
  of $[0, 8]$ (width $1/64$ on $[0, 3/8] \cup [11/16, 11/8]$, $1/128$ on
  $[3/8, 11/16]$, $1/32$ on $[11/8, 19/8]$, $1/16$ on $[19/8, 8]$ — every
  endpoint exact in binary64), Fubini bounds the 2D midpoint
  quadrature error by
  $\mathrm{area}\cdot\big(\frac{\Delta r^2}{24}\sup|F_{rr}| + \frac{\Delta\theta^2}{24}\sup|F_{\theta\theta}|\big)$,
  and linear interpolation in $w$ adds
  $\mathrm{area}\cdot\frac{\Delta w^2}{8}\sup|F_{ww}|$ plus the exact concavity
  correction $\frac{\Delta w^2}{8} I$ for $-Q_K(w) = -Q_0 - \frac{w^2}{2}I$.
  Entrywise error matrices are converted to spectral-norm enclosures by
  Gershgorin's theorem, and eigenvalue upper bounds are certified by interval
  Sylvester/Schur positive-definiteness (`pd2`, `pd3`).
- **Radial tail $r \ge R_{\max}$:** With $R_{\max} - w_h \ge 20$ ($R_{\max} = 25$
  on $[0, 11/8]$ and $R_{\max} = 29$ on $[11/8, 8]$), $|L| \ge 20 \implies T > 24$
  (verified by $\phi(24) < 400$). On $T \ge 24$:
  - $|K_{\mathrm{row}}|^2 = (T - 2/5)^2 + (c + T/\sqrt{2})^2 < \frac{3}{2} T^2$
    and $|H_{\mathrm{row}}|^2 = (T - 11/20)^2 + T^2/2 < \frac{3}{2} T^2$ (both
    verified exactly in `verify.py`), giving operator norm tail
    $\le \max(\alpha_K, \gamma_K)\cdot\frac{1}{20}\int_{24}^\infty \frac{3}{2} T^2 e^{-T}\,dT
    = \max(\alpha_K, \gamma_K)\cdot\frac{939}{20} e^{-24}$.
  - $|O_{\mathrm{row}}|^2 = 2T + T(T-2)^2/2 \le \frac{1}{2} T^3$, giving
    operator norm tail $\le \max(\alpha_O, \gamma_O)\cdot\frac{7851}{20} e^{-24}$.

---

## 5. Exact Rational Exterior for $w \ge 8$

For every $w \ge 8$ and every $L \in [1, 5]$ (`verify.py:check_large_w_tail`),
splitting the visible plane into $\{|L| \le w/2\}$, $\{|L| > w/2,\; r \ge 2\}$,
and $\{r < 2\}$ (where $\phi(6) < 16 \implies T > 6$ on $\{|L| > w/2\}$ and
$\phi(19/2) < 36 \implies T > 19/2$ on $\{r < 2\}$) gives exact rational upper
bounds on the operator norms:
- **O-block:** $\le \frac{1}{4} + \frac{111}{2} e^{-6} + \frac{2 (19/2)^3 e^{-19/2}}{D(19/2)} < 0.4020 < \frac{3}{5} < \lambda_{\min}(B_{\mathrm{re}}, B_{\mathrm{im}}, B_{7.5.6})$.
- **K-block:** Using $|K_{\mathrm{row}}|^2 \le \frac{3}{2} T^2 + \frac{13}{50}$
  ($4/25 + c^2 < 13/50$ and $\sqrt{2} c < 4/5$),
  $L \cdot \big(\frac{163}{200} + \frac{3763}{100} e^{-6} + \frac{8(19/2)^2 e^{-19/2}}{D(19/2)}\big) < 4.572 < 32 \le \frac{w^2}{2} + \lambda_{\min}(Q_0)$
  for all $1 \le L \le 5$.
- **Recentered H-block:** Using the exact expectation
  $\mathbb{E}[|H_{\mathrm{row}}|^2] = 3 - \frac{11}{10} + \frac{121}{400} = \frac{881}{400}$
  and $|H_{\mathrm{row}}|^2 < \frac{3}{2} T^2$ on $T \ge 6$,
  $L \cdot \big(\frac{881}{1600} + \frac{75}{2} e^{-6} + \frac{6(19/2)^2 e^{-19/2}}{D(19/2)}\big)$
  ($\approx 2.106$ at $L = 13/4$, $\approx 3.241$ at $L = 5$) lies strictly below
  the certified $[0, 8]$ maxima ($687/250 = 2.748$ and $514/125 = 4.112$).

---

## 6. Exact Rational Two-Driver Gaussian Tail Expectation and Staircase Assembly

For any two jointly proper complex Gaussian linear drivers $(r_A, r_B)$ with
$\mathbb{E}[S_r] = \mathbb{E}[|r_A|^2 + |r_B|^2] = V$, diagonalizing their
$2 \times 2$ Hermitian covariance matrix writes
$$S_r \;\stackrel{d}{=}\; \lambda_1 E_1 + \lambda_2 E_2, \qquad
  E_1, E_2 \stackrel{\text{i.i.d.}}{\sim} \mathrm{Exp}(1), \qquad
  \lambda_1 \ge \lambda_2 \ge 0, \qquad \lambda_1 + \lambda_2 = V.$$
For any threshold $K > 0$, define $\Phi_K(\lambda_1, \lambda_2) := \mathbb{E}[S_r \mathbf{1}\{S_r > K\}]$.
Putting $r = \lambda_1 / V \in [1/2, 1]$ and $x = K / V > 0$, exact integration
of the hypoexponential density gives
$$\frac{\Phi_K(rV, (1-r)V)}{V} \;=\; \frac{g(r) - g(1 - r)}{2r - 1}, \qquad
  g(t) := t(t + x) e^{-x/t} \quad (t > 0),\quad g(0) = 0.$$
Direct differentiation gives
$$g'(t) = \left(2t + 2x + \frac{x^2}{t}\right) e^{-x/t} > 0, \qquad
  g''(t) = \left(2 + \frac{2x}{t} + \frac{x^2}{t^2} + \frac{x^3}{t^3}\right) e^{-x/t} > 0,$$
$$g'''(t) = \frac{x^3}{t^4}\left(\frac{x}{t} - 2\right) e^{-x/t}.$$
- **Case $x \ge 2$:** $g'''(t) > 0$ for all $t \in (0, 1)$, so $g'$ is strictly
  convex and the symmetric average $\frac{1}{2r-1}\int_{1-r}^r g'(t)\,dt$ is
  strictly increasing in $r \in [1/2, 1]$. Hence its exact maximum is attained
  at $r = 1$: $\Phi_K \le (K + V) e^{-K/V}$.
- **Case $0 < x < 2$:** Without assuming monotonicity in $r$, `verify.py:exact_phi_K_max`
  certifies an exact rational upper bound over $r \in [1/2, 1]$ on $N = 120$
  subintervals: on $[1/2, 1/2 + 1/(2N)]$ the mean value theorem and $g'' > 0$
  give $\frac{g(r) - g(1-r)}{2r - 1} \le g'(1/2 + 1/(2N))$; on each remaining
  subinterval $[r_{\mathrm{lo}}, r_{\mathrm{hi}}]$, $g'' > 0$ gives
  $g(r) - g(1-r) \le [g(r_{\mathrm{lo}}) - g(1 - r_{\mathrm{lo}})] + [g'(r_{\mathrm{hi}}) + g'(1 - r_{\mathrm{lo}})](r - r_{\mathrm{lo}})$,
  whose ratio to $h = 2r - 1$ is monotone in $h > 0$ and hence bounded by the
  maximum of its two exact rational endpoints.

Given certified thresholds $0 < K_1 < \dots < K_m$ with monotone upper slopes
$0 \le c_1 \le c_2 \le \dots \le c_m \le c_{\mathrm{top}}$ such that
$F_{\mathrm{joint}}(c^*) \le c_j S_r$ whenever $S_r \le K_j$ (for all $w \ge 0$,
by Part A on $w \ge 11/8$ and Part C on $w \in [0, 11/8]$) and
$F_{\mathrm{joint}}(c^*) \le c_{\mathrm{top}} S_r$ globally (by Part B), we
have pointwise for every $S_r \ge 0$:
$$F_{\mathrm{joint}}(c^*) \;\le\; \Psi_{\mathrm{st}}(S_r)
  := c_1 S_r + \sum_{j=1}^m (c_{j+1} - c_j)\, S_r \mathbf{1}\{S_r > K_j\} \qquad (c_{m+1} := c_{\mathrm{top}}).$$
Because every jump $c_{j+1} - c_j \ge 0$ and $c_1 \ge 0$, $\Psi_{\mathrm{st}}(s)$
is **pointwise nondecreasing** in $s \ge 0$. Scaling $S_r \mapsto \theta S_r$
($\theta \in [0, 1]$) therefore shows that $\sup_{\lambda_1 + \lambda_2 = V} \mathbb{E}[\Psi_{\mathrm{st}}(S_r)]$
is nondecreasing in $V$, so certifying the exact rational inequality
$$c_1 V_{\max} + \sum_{j=1}^m (c_{j+1} - c_j)\,\Phi_{K_j}^{\mathrm{up}}(V_{\max}) \;<\; 50\cdot 10^{-6}$$
proves $\mathbb{E}[F_{\mathrm{joint}}(c^*)] < 50\cdot 10^{-6}$ simultaneously
for **all** $0 \le V \le V_{\max}$.

---

## 7. Certified Results and Exact Replay

All four parts are certified by `code/sharp-joint-secant-gemini-c1de/certify_joint_secant.cpp`
(compiled with `-ffp-contract=off`, outward-rounded IEEE-754 intervals, 230 exact
dyadic binary64 $w$-slabs on $[0, 8]$, exact `std::hexfloat` output, full replay
~4.5 min on Apple Silicon) and audited in exact rational arithmetic by
`code/sharp-joint-secant-gemini-c1de/verify.py` (Python 3 standard library only,
`python3 -I`, < 2 s on `result.json`):

| Part | Region / Regime | Certified Bound (`P + C`) | Comparison with Prior Ledger |
|---|---|---|---|
| **A** | Shift exterior $|q| \ge 11/8 = 1.375$, all $S_r \ge 0$, all $\omega \ge 0$ (no $\|\nu\|^2 \le 1/50$ cap) | $h_{7.5.6} \in [-0.61038, -0.60578]$; $\max\lambda_K \le -0.02118$, $\max\lambda_O(c=0) \le -0.04135$, $\max\lambda_O(c^*) \le -0.00626$; hence $F_{\mathrm{joint}} \le 0$ and $F_{\mathrm{joint}}(c^*) \le 0$ pointwise | Shrinks `7.5.6`'s $|q| \ge 10$ by $7.27\times$ |
| **B1** | Global $L = 13/4$, all $w, A, B, Q, P, \nu$ (no $(P)$, no $\|\nu\|^2 \le 1/50$) | $F_{\mathrm{joint}}(c^*) \le \frac{3053}{1000} S_r - S_r^2 - \frac{1}{200}\omega'$; gives $F_{\mathrm{joint}}(c^*) \le 0$ for $S_r \ge 3.053$, and linear closure for $V \le \frac{1}{61060} \approx 1.6377\cdot 10^{-5}$ | $44.5\times$ larger linear closure than `7.5.10` ($3.67\cdot 10^{-7}$); removes $\|\nu\|^2 \le 1/50$ from large-$S_r$ exterior |
| **B2** | Global $L = 5$, all $w, A, B, Q, P, \nu$ (no $(P)$) | $F_{\mathrm{joint}}(c^*) \le \frac{4929}{1000} S_r - S_r^2 - \frac{69}{2500}\omega'$; ratio $\frac{4929/1000}{69/2500} = 178.587\ldots < 179$, closing **unconditional** cone $W \ge 179\,V$ | $2.09\times$ wider than `7.5.8`'s $W \ge 375\,V$, and does **not** assume $(P)$ |
| **C** | 18-level multiscale staircase on $w \in [0, 11/8]$ + Part A on $w \ge 11/8$ + Part B1 top $c_{\mathrm{top}} = 3053/1000$ | $\mathbb{E}[F_{\mathrm{joint}}(c^*)] \le \frac{49711749}{10^{12}} \approx 4.971175\cdot 10^{-5} < 50\cdot 10^{-6}$ for **all** $0 \le V \le \frac{11}{100000} = 1.1\cdot 10^{-4}$ (and $\le \frac{38098983}{10^{12}} \approx 3.8099\cdot 10^{-5}$ for $V \le 10^{-4}$), giving $\widehat{\Lambda}(G) < S + 99.36\cdot 10^{-6} < S + 10^{-4}$ unconditionally on the domain of `7.5.6` | **$299\times$** larger than `7.5.10`'s unconditional $3.67\cdot 10^{-7}$ and **$9.73\times$** larger than `7.5.8`'s conditional $1.13\cdot 10^{-5}$ |
| **D** | Recentred $(P_\Psi)$ split of `7.5.8` at $L = 13/4$ and $L = 5$ | $\mathbb{E} D(X, O - c^* z_1) + |c^*|^2 - pW \le \frac{11}{4} V - \frac{1}{200} W$ (linear $V \le \frac{1241}{68750000} \approx 1.8051\cdot 10^{-5}$ against the $49.64\cdot 10^{-6}$ budget of $(P_\Psi)$) and $\le \frac{823}{200} V - \frac{69}{2500} W$ (ratio $149.094\ldots < 150$, cone $W \ge 150\,V$) | $2.50\times$ wider cone than `7.5.8`'s $W \ge 375\,V$ |

### Staircase levels (`Part C`, exact rational upper slopes $c_j$)

$K_j = s_j^2 \cdot 10^{-6}$ for $s_j \in \{6, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 24, 26, 30, 36\}$
(each certified at outward-rounded threshold `rat(s_j, 1000).h`), with certified
`max_evO < 0` on every level and slopes rising from
$c_1 = 63/10000 = 0.0063$ ($K_1 = 36\cdot 10^{-6}$) through
$c_3 = 1649/100000 = 0.01649$ ($K_3 = 100\cdot 10^{-6}$),
$c_5 = 2171/100000 = 0.02171$ ($K_5 = 144\cdot 10^{-6}$),
$c_6 = 4557/100000 = 0.04557$ ($K_6 = 169\cdot 10^{-6}$),
up to $c_{18} = 246549/100000 = 2.46549$ ($K_{18} = 1296\cdot 10^{-6}$) and
$c_{\mathrm{top}} = 3053/1000 = 3.053$.

### Replay commands

From the repository root:

```sh
python3 -I research/conjecture-K/code/sharp-joint-secant-gemini-c1de/verify.py
python3 -I research/conjecture-K/code/sharp-joint-secant-gemini-c1de/test_controls.py
```

Full C++ recompilation and interval replay (regenerating `result.json`):

```sh
python3 -I research/conjecture-K/code/sharp-joint-secant-gemini-c1de/verify.py --replay-cpp
```

