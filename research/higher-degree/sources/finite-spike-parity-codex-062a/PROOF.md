# Finite one-spike symmetry and compact amplitude domains

For the Stage 0 [one-spike model](../../code/degree5-gate/pipeline/gate/spike2.py), the full two-branch absolute-value objective has a parity symmetry for every spike coupling and scale. At quadratic order the 17 attackers split into blocks of eight and nine. Both retained defenders join the block of eight. At arbitrary amplitude the attacker supremum and defender infimum can be restricted to explicit compact ellipsoids, including on the five witness rows in the [Stage 0 report](../degree5-stage0-2026-11-28/REPORT.md). The interior finite-amplitude gains and the numerical gate in #922 remain open.

## The underlying expectation

Let $z,y,W$ be independent standard complex Gaussians and $e_{ab}$ the normalized complex Hermites. Fix real row coefficients, $0\le c\le1$ and $\sigma\ge0$. Put
\[
 q=\sigma(c e_{21}(y)+\sqrt{1-c^2}\,W),\quad
 L=z(\ell+\beta(|z|^2-2))+\nu_5 e_{32}(z),\quad
 M=q(1-b_A e_{11}(z))-b_B\bar q\, e_{20}(z),\quad A_\pm=L\pm M.
\]
These fields give the two branches before the radial rotation of the [retained-defender proof](../stage0-retained-gram-gemini-4c4c/PROOF.md). Each attacker is $\phi_j=e_{ab}(z)e_{pq}(y)$ with $(p,q)$ the remaining bidegree in $(3,2)$ on side $h$ or $(2,1)$ on side $k$. In this notation the index $q$ of a Hermite is an integer. Write $s_j=1$ on $h$ and $s_j=-1$ on $k$. The two cubic defenders are $\psi_1=z e_{11}(y)$ and $\psi_2=\bar z e_{20}(y)$, both on $h$. With complex coefficients $a,d$, set
\[
 \Phi(a,d)=\mathbb E\!\left[
 |A_++\textstyle\sum_j a_j\phi_j+\sum_i d_i\psi_i|
 +|A_-+\textstyle\sum_j s_j a_j\phi_j+\sum_i d_i\psi_i|\right].
\]
This is the exact expectation underlying the expansion. The stored `gain` routine optimizes a quadratic Taylor model.

## One angular integration and the two parity blocks

Simultaneously rotating $(z,y,W)$ by a unit scalar multiplies every field inside the two moduli by that scalar. This follows from $e_{ab}(\xi z)=\xi^{a-b}e_{ab}(z)$ and total charge one, including the term $\bar q e_{20}$. Conditioning on $|y|$ one may therefore set $y=|y|$ while rotating $z,W$ with it. The other variables retain their independent circular laws. Fixing the phase of $W$ instead gives the gauge in `spike2.py`. The relative angle between $y$ and $W$ remains when both contribute. For example, at $c=1/\sqrt2$, $|y|=1$, $|W|=1/\sqrt2$, it gives $|q|=0$ for equal phases and $|q|=\sigma$ for opposite phases. These changes of variables preserve the exact branch averages and hence their differences $D$, $V_{\rm sl}$ and the Gaussian envelope $S_5$.

Complex conjugation sends every field to its conjugate. Thus $\Phi(\bar a,\bar d)=\Phi(a,d)$. At the origin the gradient in imaginary coordinates vanishes and the real-imaginary Hessian entries vanish whenever these derivatives exist. Equivalently the integrable coefficients $\gamma,P,Q$ of `spike2.py` are real by conjugation of their defining integrands.

At fixed $y,W$, $A_\pm(-z)=-A_\mp(z)$. Reflection exchanges the moduli and multiplies each coefficient by $\tau_j=-s_j(-1)^{a+b}$. Both defenders have $\tau=+1$. The partition below includes the two shifts with constant remote polynomial.

| $\tau$ | Quintic $h$ attackers | Cubic $k$ attackers | Cubic $h$ defenders |
|---|---|---|---|
| $+1$ | `p01, p10, p12, p21, p30, p32` | `rA, rB` | `dh10, dh01` |
| $-1$ | `p00, p02, p11, p20, p22, p31` | `rz, rzb, nu3` | |

The gradient vanishes on the minus block, and mixed Hessian entries between the two blocks vanish wherever the expansion is defined. Removing the shifts `p32` and `nu3` leaves seven plus and eight minus attackers. At $c=0$, independence of $y$ and centering of each defender's remote Hermite also give zero defender gradient wherever the first variation exists. Parity alone allows nonzero minus-block maximizing amplitudes for the full objective. For instance the even function $|1+x|+|1-x|-x^2/3$ on the real line is $2$ at zero and $3$ at $x=3$.

## Compact domains for the exact saddle

Set $w_j=\eta>0$ on $h$, $w_j=\varepsilon_1>0$ on $k$, $C=\operatorname{diag}(1/w_j)$, and $u=\nu_5 e_{\mathrm{p32}}$ in coefficient space. The amplitude-dependent objective, up to a constant, is
\[
 J(a,d)=\Phi(a,d)-(a+u)^*C(a+u)+\|d\|^2/\varepsilon_1.
\]
The shift accounts for the linear cost of changing the stored $\nu_5$. For restricted collections keep just their coordinates of $u$.

For fixed $d$, each norm changes by at most the modulus of the corresponding increment field. Each collection of attacker Hermite products has unit norms and distinct multi-indices, hence $\mathbb E|\sum h_j\phi_j|^2=\mathbb E|\sum s_j h_j\phi_j|^2=\|h\|^2$. Cauchy–Schwarz gives $|\Phi(a+h,d)-\Phi(a,d)|\le2\|h\|$. The same argument applied to the two orthonormal defenders gives Lipschitz constant two in $d$, uniformly in $a$.

Consequently
\[
 \sup_{a}\inf_{d}J(a,d)=
 \max_{\|C(a+u)\|\le1}\ \min_{\|d\|\le\varepsilon_1} J(a,d).
\]
Indeed, for fixed $a$ the positive quadratic cost dominates linear growth and a minimizing $d$ exists. If $\|d\|>\varepsilon_1$, moving a distance $t$ toward zero saves $2t\|d\|/\varepsilon_1-t^2/\varepsilon_1>2t$ for small $t>0$. Every minimizer therefore lies in the stated ball. The infimum of $\Phi(a,d)+\|d\|^2/\varepsilon_1$ remains two-Lipschitz in $a$ by the uniform bound. Subtracting the attacker cost now gives a continuous objective tending to $-\infty$. Whenever $\|C(a+u)\|>1$, taking a step of length $t$ opposite $C(a+u)$ saves $2t\|C(a+u)\|-O(t^2)>2t$. Every maximizer lies in the ellipsoid. In particular, on a quintic-only attack without the constant shift this is simply $\|a\|\le\eta$. For all 17 modes the two squared contributions are $\|a_h+\nu_5 e_{\mathrm{p32}}\|^2/\eta^2$ and $\|a_k\|^2/\varepsilon_1^2$. This argument applies to all finite $c,\sigma$ above, including at zeros of the base fields, and uses no inverse-modulus quadrature.

## Order of elimination in the quadratic model

In real coordinates write the quadratic part and linear terms as
\[
 Q(x,y)=g^\top x+h^\top y-x^\top A x+2x^\top K y+y^\top B y.
\]
For symmetric $A,B$ both positive definite, completing the squares in either order gives the same unique saddle. Its equations are $2Ax=g+2Ky$, $2By=-h-2K^\top x$. Eliminating $y$ gives the positive matrix $A+KB^{-1}K^\top$, while eliminating $x$ gives $B+K^\top A^{-1}K$. These conditions must be checked on the retained blocks at each application. Positive defender curvature and positive curvature after eliminating defenders alone do not suffice for reversing the order: $Q=x^2+4xy+y^2$ gives $\sup_x\inf_y Q=0$ and $\inf_y\sup_x Q=+\infty$.

**Replay.** The [exact checks](../../code/finite-spike-parity-codex-062a/verify.py) read the sector definitions from the model, verify the charges and both shift assignments, compare the two Schur eliminations, and exercise the radius and parity controls. Run `python3 -IB -O research/higher-degree/code/finite-spike-parity-codex-062a/verify.py` from the repository root.

Agent-ID: codex-062a. Paper and exact replay, author only.
