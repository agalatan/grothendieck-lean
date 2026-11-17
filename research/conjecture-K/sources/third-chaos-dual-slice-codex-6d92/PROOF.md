# Bounds for the real third Wiener chaos

Agent-ID: codex-6d92. Tasks [#499](https://github.com/agalatan/grothendieck-lean/issues/499) and
[#458](https://github.com/agalatan/grothendieck-lean/issues/458).

Let $G$ be a standard Gaussian in $\mathbb R^n$ and let $F$ be a real third-chaos polynomial,
normalized by $\mathbb EF^2=1$. Write $C_{\rm tar}=\sqrt{17/25}$ and $c=\sqrt{2/\pi}$. The
dimension-free target $\mathbb E|F|\le C_{\rm tar}$ is equivalent to
$\operatorname{Var}|F|\ge8/25$. The stronger Gaussian bound is $\mathbb E|F|\le c$.
Normalized sums of independent third Hermites converge to the Gaussian in law and in
first absolute moment, so $c$ is a lower bound for the unrestricted supremum.
This is the real-chaos extremum relevant to the degree-three case of [Heilman, Jones and
Malavolta, Example 3.1](https://arxiv.org/html/2610.10477v1#S3).

Use the normalized symmetric tensor $T$ for which $F=I_3(T)/\sqrt6$ and $\|T\|_{\rm HS}=1$.
Here $I_j$ is Wick evaluation, with $\mathbb EI_j(B)^2=j!\|B\|_{\rm HS}^2$ for symmetric $B$.
Put

$$
a=\max_{\|v\|=1}|T(v,v,v)|,\qquad
M_{ij}=\sum_{k,l}T_{ikl}T_{jkl},\qquad
\lambda=\|M\|_{\rm op},\qquad r=\operatorname{rank}M,\qquad
\kappa=\mathbb EF^4-3.
$$

- **Gaussian bound.** It holds if $a\ge .711$, $r\le11$, or $\kappa\ge58.1377$.
- **Practical bound.** It holds if $a\ge .662$, $r\le15$, $\lambda\le.0049067$,
  $\operatorname{Var}(\|\nabla F\|^2/3)\le89/2250$, or $\kappa\ge53.0920$.
  The variance criterion includes $\kappa\le89/500$.
- **Unrestricted bound.** Every $F$ satisfies $\mathbb E|F|<17743/20000=0.88715$.

The proofs below reduce the estimates to exact finite sums or inequalities certified across
their full continuous domains. The unrestricted practical and Gaussian bounds remain open in
this record. All terminating decimals used as proof inputs denote exact rationals.

## 1. Conditioning on the orthogonal complement

Let $v$ attain $a$ with $T(v,v,v)=a$ and write $X=G\cdot v$ with $Y$ the orthogonal
Gaussian coordinates. Stationarity on the sphere gives $T(v,v,w)=0$ for all $w\perp v$.
Consequently, with $h_3(x)=(x^3-3x)/\sqrt6$, the Wick expansion is

$$
F=a h_3(X)+XQ(Y)+R(Y),\qquad
\mathbb E Q=0,\qquad \mathbb E Q^2+\mathbb E R^2=1-a^2,
$$

where $Q$ and $R$ are of orders two and three. The orthogonality for the last identity
is in the Hermite degree of $X$.

For real $q,b$ let $\Psi(q,b)=\mathbb E|h_3(X)+qX+b|$. For each row below
`certify_rank.py` verifies $\Psi(q,b)\le C+\ell q+a_0\mu(q^2+b^2)$ on $\mathbb R^2$.

| $a_0$ | $\ell$ | $\mu$ | $C$ | upper bound on $\mathbb E|F|$ for $a\ge a_0$ |
| ----: | -----: | ----: | ----: | ---: |
| .711 | −.140 | .595 | .70836 | .79786 |
| .662 | −.093 | .5754 | .75688 | .82430 |

Indeed, substitute $(Q/a,R/a)$ and average over $Y$. The resulting bound is
$a C+a_0\mu(1-a^2)/a$, a convex function of $a$ on $[a_0,1]$. Its endpoint
maximum is $\max(C,a_0C+\mu(1-a_0^2))$, strictly below the number in the last
column, which is strictly below the corresponding target.

Here is the scalar certificate. By Gaussian symmetry $\Psi(q,b)=\Psi(q,-b)$.
On $|q|\le13/4$, $0\le b\le13/4$ the function $\Psi$ is convex in $(q,b)$. For a
rectangle use convex interpolation from its corners, subtract its quadratic,
and pay at most $a_0\mu(h_q^2+h_b^2)$, with $h_q,h_b$ the two half-widths.
Subdivision proves the required cap. At a corner, a primitive of
$(h_3(x)+qx+b)\phi(x)$ is

$$
\left(\frac{1-x^2}{\sqrt6}-q\right)\phi(x)+b\Phi(x).
$$

The verifier bisects $[-8,8]$ and integrates by this primitive on intervals
of certified sign. On any remaining narrow interval it bounds the absolute
integral by its length times $\phi(0)$ times an interval bound on the absolute
polynomial. The two Gaussian tails have known signs, by the endpoint and
derivative checks at $\pm8$. Outside the parameter rectangle, the triangle
inequality gives $\Psi(q,b)\le(1+4e^{-3/2})/\sqrt{3\pi}+c|q|+b$.
After subtracting $\ell q+a_0\mu(q^2+b^2)$, use the two separate one-variable
quadratic maxima, restricting one variable to be at least $13/4$.
All integrals and inequalities in this certificate use outward rounding.

## 2. A rational comparison between $\lambda$ and $a$

For a unit $w$, $\|T(w,w,\cdot)\|\le a$. To verify this, take the unit $w'$ in
the direction of the orthogonal component of $T(w,w,\cdot)$, whenever that
component is nonzero. The degree-three trigonometric polynomial
$p(t)=T((\cos t\,w+\sin t\,w')^{\otimes3})$ has $|p|\le a$. If
$B^2=p(0)^2+p'(0)^2/9>a^2$, a suitable $B\cos(3t+\varphi)$ agrees in
value and derivative at zero. Its difference from $p$ alternates strict sign
at the six consecutive extrema and has a double zero at zero. This gives
at least seven zeros counting multiplicity on the circle, whereas a nonzero
trigonometric polynomial of degree three has at most six.

Let $e_1$ be a top unit eigenvector of $M$. Write $x=T_{111}$, let
$s$ be the norm of the component of $T(e_1,e_1,\cdot)$ orthogonal to $e_1$,
and choose $e_2$ in that direction. When $s=0$ any perpendicular $e_2$ works.
Set $b=T_{122}$, $d=T_{222}$. Counting the three slots of $T$ gives
$3\lambda-1=2x^2+3s^2-\|T|_{e_1^\perp}\|_{\rm HS}^2\le2x^2+3s^2-d^2$.
Here $T|_{e_1^\perp}$ restricts all three slots. In dimension one the
conclusion below follows from $a=\lambda=1$.

Put $p=8/9$, $q=1/9$. The preceding bound on $\|T(w,w,\cdot)\|$ gives
$x^2+s^2\le a^2$. Evaluating at $\sqrt p\,e_1\pm\sqrt q\,e_2$ and averaging
the squares of the first two coordinates gives

$$
D_{p,q}=(px+qb)^2+4pq\,s^2+(ps+qd)^2+4pq\,b^2\le a^2.
$$

Then $2366(x^2+s^2)+101574D_{p,q}-40095(2x^2+3s^2-d^2)$ is nonnegative.
Its blocks in $(x,b)$ and $(s,d)$, respectively, are

$$
\begin{pmatrix}2432&10032\\10032&41382\end{pmatrix},\qquad
\begin{pmatrix}2465&10032\\10032&41349\end{pmatrix}.
$$

The leading entries are positive and the determinants are $0$ and $1284261$.
This proves $3\lambda-1\le(20788/8019)a^2$. In particular, the bound in §1
holds whenever $\lambda\ge L(a_0)$, where
$L(a_0)=(1+(20788/8019)a_0^2)/3$. By §4, $\kappa\le90\operatorname{tr}(M^2)$.
If $\lambda<L(a_0)$, the eigenvalues, which sum to one, give
$\operatorname{tr}(M^2)<L(a_0)^2+(1-L(a_0))^2$. For $\lambda\le1/2$ use
$\operatorname{tr}(M^2)\le\lambda$. For $\lambda>1/2$ concentrate the sum of
the remaining eigenvalues into one square and use the strict increase of
$u^2+(1-u)^2$ for $u>1/2$. Direct rational comparisons of the resulting
cutoffs give the cumulant entries in the summary.

## 3. A Gaussian radius averaged along random planes

For fixed $n$, express $G=D\Theta$ with $D$ chi distributed and $\Theta$ uniform
on the sphere, independently. If $P(x)=T(x,x,x)$, Wick evaluation subtracts
$\Delta P/2$. Decompose $P=H_3+|x|^2H_1$ with homogeneous harmonic $H_i$
of degree $i$. Since $\Delta(|x|^2H_1)=2(n+2)H_1$, the normalized expansion is

$$
F(D\Theta)=w_g f_g(D)Y_1(\Theta)+w_h f_h(D)Y_3(\Theta),\qquad
f_g(D)=\frac{D^3-(n+2)D}{\sqrt{2n(n+2)}},\qquad
f_h(D)=\frac{D^3}{\sqrt{n(n+2)(n+4)}} .
$$

Here $Y_i$ have unit spherical second moment and $w_g^2+w_h^2=1$. This follows
from spherical orthogonality and the chi moments of orders two, four and six.
A zero component is represented by an amplitude of zero.

Choose a Haar orthonormal frame $(e,f)$. Restrict the angular functions to
the circle $\Theta_\theta=e\cos\theta+f\sin\theta$. Rotate within that plane to
write the linear component as $A_\theta=\sqrt2 v_0\cos\theta$ with $v_0\ge0$.
The harmonic component on the same circle has

$$
B_\theta=\sqrt2(v_1\cos\theta+v_2\sin\theta+v_3\cos3\theta+v_4\sin3\theta).
$$

Reflect the parameter $\theta$ if necessary to arrange $v_2\ge0$.
Both operations preserve the angular average. Set
$\Phi_n(A,B)=\mathbb E_D|Af_g(D)+Bf_h(D)|$ and
$\Psi_n(v)=\pi^{-1}\int_0^\pi\Phi_n(A_\theta,B_\theta)\,d\theta$.
The integrand is $\pi$-periodic and the frame average of $\Psi_n$ is
$\mathbb E|F|$. The exact moments of the circle coefficients are

$$
\mathbb E v_0^2=w_g^2,\qquad
\mathbb E(v_1^2+v_2^2)=(1-\tau_n)w_h^2,\qquad
\mathbb E(v_3^2+v_4^2)=\tau_n w_h^2,\qquad
\mathbb E v_0v_1=0,\qquad
\tau_n=\frac{n+2}{4(n-1)}.
$$

The coefficient split follows by averaging the angular autocorrelation of
$Y_3$ over the frame. This autocorrelation at lag $\varphi$ is the zonal
harmonic $((n+2)\cos^3\varphi-3\cos\varphi)/(n-1)$, normalized at $\varphi=0$.
Indeed, rotation averaging a harmonic cubic about a fixed unit axis produces
a harmonic linear combination of the axial coordinate cubed and the axial
coordinate times $|x|^2$. Harmonicity fixes their ratio and the mean square
of $Y_3$ fixes the normalization. The coefficient of $\cos(3\varphi)$ is
$\tau_n$. The mixed moment vanishes because $v_0v_1$ is the angular mean of
$A_\theta B_\theta$ and the frame mean of that product is the spherical inner
product of degrees one and three.

Use the quadratic
$Q(v)=\alpha v_0^2+\beta(v_1^2+v_2^2)+\gamma(v_3^2+v_4^2)+2\delta v_0v_1$.
The mixed term helps the envelope while dropping out of $\mathbb E Q$.
The script `certify_planes.py` proves $\Psi_n^2\le Q$ with the following inputs.

| $n$ | $10^4(\alpha,\beta,\gamma,\delta)$ | bound on $(\mathbb E|F|)^2$ |
| ---: | :--- | ---: |
| 11 | $(6344,6605,5802,-600)$ | $253761/400000$ |
| 14 | $(6695,6937,6151,-925)$ | $87037/130000$ |
| 15 | $(6793,7032,6246,-1017)$ | $38043/56000$ |

The last column is $\max(\alpha,(1-\tau_n)\beta+\tau_n\gamma)$, which bounds
$\mathbb E\Psi_n^2$ and thus also $(\mathbb E|F|)^2$. When $w$ belongs to the
kernel of $M$, all coefficients of $T(w,\cdot,\cdot)$ vanish, so $F$ depends
only on the image of $M$. A lower rank can be embedded in each listed
dimension with the same law.

### Coverage of the quadratic envelopes

Homogeneity and the two sign conventions reduce to the eight facets of
the box $[0,1]\times[-1,1]\times[0,1]\times[-1,1]^2$ on which
$\max_i|v_i|=1$. On any sub-box let $V$ be the random corner with
independent coordinates and mean $v$. The square of the norm $\Psi_n$ is
convex, so

$$
\Psi_n(v)^2-Q(v)
\le\max_{\rm corners}(\Psi_n^2-Q)+\sum_i Q_{ii}h_i^2,
$$

where $h_i$ are the half-widths. Independence cancels the mixed quadratic
term in $\mathbb E Q(V)-Q(v)$. The verifier bisects a nonaccepted box and
requires a strict negative upper bound on every leaf.

For the corners, put $c_g=1/\sqrt{2n(n+2)}$, $c_h=1/\sqrt{n(n+2)(n+4)}$,
$\xi=Ac_g+Bc_h$ and $\eta=(n+2)Ac_g$. Then $\Phi_n(A,B)=\mathbb E D|\xi D^2-\eta|$.
If $\xi$ and $\eta$ have opposite sign or one is zero, use the sum of the
two absolute moments. Otherwise let $z=\eta/(2\xi)>0$. With
$P(s,z)=\gamma(s,z)/\Gamma(s)$ the regularized lower incomplete gamma
function and $m_i=\mathbb ED^i$, the exact split at the root is

$$
\Phi_n(A,B)=|\xi|m_3(1-2P((n+3)/2,z))+|\eta|m_1(2P((n+1)/2,z)-1).
$$

The ratio table uses the coefficient of larger magnitude as a factor
and the quotient in $[-1,1]$ as the argument of a one-dimensional function.
The upper bound for each bin adds its radius times
$\mathbb E|f_g(D)|$ or $\mathbb E|f_h(D)|$, using the triangle inequality.
The same constants enclose the effect of rounding angular coefficient values.

For angular integration, interpolate $A_\theta,B_\theta$ by chords between
$m=2048$ uniform steps on $[0,\pi]$. On an interval of length $h=\pi/m$
the mean error of a chord is at most $h^2\sup|u''|/12$ for each coefficient
function $u$. Convexity of $\Phi_n$ and periodicity bound its chord integral
by the discrete endpoint mean. Add the chord error with the same radial
Lipschitz constants, using frequency squares $1$ and $9$ in the second
derivative bounds. Arb encloses the trig functions, radial integrals and
error constants. They are rounded outward to fixed-point integers at
scale $2^{26}$. All final box decisions are exact integer comparisons.

## 4. Second-order Stein bound for small $\lambda$

Use $U_{abcd}=\sum_iT_{iab}T_{icd}$, its full symmetrization $\widetilde U$,
$m=\|M\|_{\rm HS}^2$, $u=\|\widetilde U\|^2$, and
$\tau=\|\nabla F\|^2/3$. The eigenvalues of $M$ sum to one, so
$m\le\lambda$. The unsymmetrized contractions share their squared norm,
$\|U\|^2=m$, by flattening $T$ into one index versus two. In particular $u\le m$.
The [Wick product formula](https://arxiv.org/abs/1107.3252) gives

$$
\tau-1=2 I_2(M)+\tfrac12 I_4(\widetilde U),\qquad
(F^2)_2=3 I_2(M),\qquad (F^2)_4=\tfrac32 I_4(\widetilde U).
$$

Gaussian integration by parts gives
$\operatorname{Cov}(F^2,\tau)=\kappa/3$ by testing with $F^3$.
Thus $\kappa=36m+54u\le90m$ and $\operatorname{Var}\tau=8m+6u\le2\kappa/9$.

For $s\ge0$ let $B(s)=\int_0^\infty e^{-st-t^2/2}\,dt$ and define
$K(x)=1-|x|B(|x|)$, $b(s)=(1+s^2)B(s)-s$,
$\chi(x)=\operatorname{sgn}(x)b(|x|)$. Solving the normal Stein equation
for $|x|$ gives

$$
\frac{\mathbb E|F|}{c}-1=\mathbb E[(\tau-1)K(F)].
$$

For example the Stein solution on $x\ge0$ is $cB(x)-1$ with even derivative
$-cK(x)$. Let $L=\Delta-x\cdot\nabla$ and
$W=I_2(M)+I_4(\widetilde U)/8$, so $-LW=\tau-1$. Put
$D=\langle\nabla F,\nabla W\rangle$. A second integration by parts yields

$$
1-\frac{\mathbb E|F|}{c}=\mathbb E[\chi(F)D],\qquad
\mathbb E[FD]=\tfrac12\mathbb E[(F^2-1)(\tau-1)]=\kappa/6 .
$$

Here $K$ is Lipschitz with almost-everywhere derivative $-\chi$. The second
identity follows by testing $-LW$ with $F^2/2$. For the first, mollify $K$
and use dominated convergence, since the nonzero polynomial $F$ vanishes
on a Gaussian null set. This handles the cusp at zero.

For the variance estimate define the tensors

$$
\begin{aligned}
V_a&=\sum_{i,b}T_{iab}M_{ib},&
C_{abc}&=\sum_iT_{iab}M_{ic},\\
E_{abc}&=\sum_{i,d}T_{iad}\widetilde U_{idbc},&
J_{abcde}&=\sum_iT_{iab}\widetilde U_{icde}.
\end{aligned}
$$

From $\partial_i F=\sqrt{3/2}I_2(T_{i\cdot\cdot})$ and
$\partial_i W=2 I_1(M_{i\cdot})+I_3(\widetilde U_{i\cdot\cdot\cdot})/2$,
the kernels of $D$ in orders one, three and five are

$$
\tfrac72\sqrt6\,V,\qquad
\sqrt6\,\operatorname{sym}(C+\tfrac32 E),\qquad
\sqrt{3/8}\,\operatorname{sym}J.
$$

The twice-contracted term uses
$\sum_{i,b,c}T_{ibc}\widetilde U_{ibca}=V_a$, since all three pairings
in $\widetilde U$ coincide after summing against the symmetric tensor $T$.
The flattening of $T$ has squared operator norm $\lambda$.
It bounds $\|V\|^2,\|C\|^2$ by $\lambda m$ and $\|E\|^2,\|J\|^2$ by
$\lambda u$. Weighted Cauchy–Schwarz gives
$\|C+\tfrac32 E\|^2\le\tfrac52\|C\|^2+\tfrac{15}4\|E\|^2$.
Keeping the three chaos degrees orthogonal therefore yields

$$
\mathbb E D^2\le\lambda\left(\frac{327}{2}m+180u\right)
=\lambda\left(\frac{87}{2}m+\frac{10}{3}\kappa\right).
$$

The certificate `certify_stein.py` proves for $x\ge0$ that

$$
b(x)\ge .579-.2778x,\qquad
(b(x)-.2x)^2\le1.57085-2.591x+1.0687x^2.
$$

The integral $b(x)=\int_0^\infty t^2e^{-xt-t^2/2}dt$ follows by
integrating by parts twice. In particular $b$ is decreasing. On $[0,8]$
the checker encloses $b$ between its Arb endpoint values on each subinterval,
and bounds both polynomial differences throughout that subinterval.
On $[8,\infty)$, $0\le b(x)\le2/x^3$ and the quadratic comparisons reduce
to signs at $8$ and monotonicity.

Suppose $\mathbb E|F|\ge C_{\rm tar}$. Then
$\mathbb E[F\chi(F)]\ge a_*:=.579C_{\rm tar}-.2778>0$ and
$\mathbb E(\chi(F)-.2F)^2\le b_*^2:=1.57085-2.591C_{\rm tar}+1.0687$.
Apply the identity for $D$ to its residual $D-\kappa F/6$,
which is orthogonal to $F$. With $s=\kappa/\lambda$ and
$m\le\min(\kappa/36,\lambda)$ this gives

$$
\frac{\mathbb E|F|}{c}-1
\le \lambda\big(b_*\sqrt{V(s)}-a_*s/6\big),\qquad
V(s)=
\begin{cases}
(109/24)s-s^2/36,&0\le s\le36,\\
87/2+(10/3)s-s^2/36,&36\le s\le90.
\end{cases}
$$

The first expression in parentheses is concave and its derivative from
the left at $36$ is positive, as the script verifies. The second uses
$V(s)=287/2-(s-60)^2/36$. Cauchy–Schwarz bounds the latter expression
and hence both branches by $\sqrt{287/2}\sqrt{a_*^2+b_*^2}-10a_*$.
The script verifies that $c$ times one plus this bound times $0.0049067$
is strictly below $C_{\rm tar}$. This contradicts the assumed lower bound
whenever $\lambda\le0.0049067$.

The supplied sharp-regime condition $\lambda\le0.006478\,\kappa$ is
incompatible with $\lambda>0$ and $\kappa\le90\lambda$, since
$90(0.006478)<1$.

## 5. A small-cumulant bound by quadratic regression

This is the earlier codex-6d92 and audit_diagonal estimate, replayed here
as an alternative to the supplied $\kappa\le0.167$ window.
Write $g^2=\operatorname{Var}\tau$, $R(x)=K(x)-1/2+(x^2-1)/8$ and

$$
h(x)=(K(x)-1/2)^2+(x^2-1)K(x)/4 .
$$

The covariance identity in §4 gives
$\mathbb E|F|/c-1\le-\kappa/24+g\sqrt{\mathbb E R(F)^2}$.
Expansion gives $\mathbb E R(F)^2=\mathbb E h(F)+(\kappa+2)/64$.
The representation
$K(x)=\int_0^\infty e^{-v x^2}(1+2v)^{-3/2}dv$
follows from the integral for $B$ by integration by parts and
$t=|x|(\sqrt{1+2v}-1)$ for $x\ne0$.
With $Z$ standard Gaussian it gives
$\mathbb E K(Z)=1/2$, $\mathbb E K(Z)^2=1-\log 2$ and
$\mathbb E[(Z^2-1)K(Z)]=-1/4$ by Gaussian integration. For the second
moment, the two substitutions $s_i=(1+2v_i)^{-1/2}$ reduce the double
integral to $\int_0^1 s/(1+s)\,ds$. Thus $m_h=\mathbb E h(Z)=11/16-\log2$.

The even test $h$ has a Stein solution with even derivative

$$
f_h'(x)=h(x)-m_h-xe^{x^2/2}\int_x^\infty(h(t)-m_h)e^{-t^2/2}\,dt,\qquad x\ge0.
$$

The script `certify_regression.py` verifies $-1/8<f_h'<3/200$. Here $K$
decreases on $[0,\infty)$ and $x^2K(x)$ increases, by substituting $v x^2$
in the Laplace integral. The bounds $K(x)\le\min(1,x^{-2})$ and
$1-3x^{-2}\le x^2K(x)\le1$ give $0\le1/2-h(x)\le2/x^2$ by expanding $h$.
The elementary Mills bounds
$x^2/(1+x^2)\le x B(x)\le1$ now put $f_h'$ between
$-2/x^2$ and $2/x^2+(1/2-m_h)/(1+x^2)$ for $x\ge14$.
For the compact check integrate backwards from $20$ on cells of width
$10^{-4}$. The inequality for $1/2-h(x)$ bounds the initial tail.
On each cell the monotone endpoint hulls for $K$ and $x^2K$ enclose the
integrand in a ball $H$. If $J$ is the integral from the right endpoint
then $J+[0,10^{-4}]H$ bounds the partial integral at any point of the cell.
Substitution gives the derivative bounds on $[0,14]$.

Centering the derivative bound at $-11/200$ and applying the Stein identity
gives $\mathbb E h(F)-m_h\le(7/100)g$. Hence

$$
\frac{\mathbb E|F|}{c}-1
\le -\frac{\kappa}{24}+g\sqrt{\frac{23}{32}-\log 2+\frac{\kappa}{64}+\frac7{100}g}.
$$

Replace $g$ by its upper bound $\sqrt{2\kappa/9}$. On $[0,89/500]$ the
resulting expression increases in $\kappa$. In the variable
$g=\sqrt{2\kappa/9}$ its derivative is at least
$\sqrt{23/32-\log2}-3g/8>0$ on this interval.
The certificate checks the resulting upper bound at $\kappa=89/500$
against $C_{\rm tar}$. At fixed $g$, the displayed bound decreases in
$\kappa\ge 9g^2/2$ since the partial derivative is at most
$-1/24+\sqrt2/48<0$. The same proof thus works with the weaker hypothesis
$\operatorname{Var}\tau\le89/2250$.

## 6. Unrestricted bound from a finite circle

This is the earlier codex-6d92 and audit_pdfs bound. Let $f=\operatorname{sgn}F$
and let $w_j$ be the squared $L^2$ norm of its $j$th Hermite projection.
Cauchy–Schwarz gives $(\mathbb E|F|)^2\le w_3$. For independent standard
Gaussian vectors $U,V$, restrict $f$ to the circle $U\cos\theta+V\sin\theta$.
Almost surely the cubic on the circle has frequencies one and three and
at most six zeros, counting multiplicity. The event that it vanishes
identically or vanishes at any prescribed angle has probability zero.
Thus its signs $\sigma_i$ on $N=151$ successive equally spaced half-circle
samples have one or three transitions over the $N$ edges, using
$\sigma_{i+N}=-\sigma_i$.

The score

$$
\sum_{i=0}^{150}\sigma_i(11\sigma_{i+29}-10\sigma_{i+30}-\sigma_{i+66})
$$

is invariant under cyclic shifts with antiperiodic continuation and global
sign. Choose the last edge to be a transition. Then the signs are all plus
or plus except for one contiguous internal interval. The checker
`certify_circle.py` enumerates these 11176 cases and gives a maximum of 94.
For $A=\cos(29\pi/151)>B=\cos(30\pi/151)>C=\cos(66\pi/151)>0$, Mehler's
identity bounds $\sum_{j\ {\rm odd}}(11A^j-10B^j-C^j)w_j$ by $94/151$.
The coefficients are positive because each is $10(A^j-B^j)+(A^j-C^j)$.
Retain only $j=3$ to get

$$
(\mathbb E|F|)^2\le\frac{94/151}{11A^3-10B^3-C^3}
<\left(\frac{17743}{20000}\right)^2.
$$

The last comparison uses rational Taylor enclosures for the cosines and
Machin's formula for $\pi$. The resulting squared bound is about $0.78702828$.

## 7. Complex consequence and remaining scope

For $q\in\mathcal H_{2,1}$, each $\operatorname{Re}(e^{i\theta}q)$ belongs
to the real third chaos. If a real bound $C$ applies to all these phases,
phase averaging and Cauchy–Schwarz give

$$
\mathbb E|q|
=\frac{\pi}{2}\mathbb E_\theta\mathbb E|\operatorname{Re}(e^{i\theta}q)|
\le\frac{\pi C}{2}
\left(\mathbb E_\theta\mathbb E[\operatorname{Re}(e^{i\theta}q)^2]\right)^{1/2}
=\frac{\pi C}{2\sqrt2}\|q\|_2 .
$$

For $C=C_{\rm tar}$ the resulting constant is $\pi\sqrt{17/200}<0.916$,
which this packet proves for cubics on at most seven complex coordinates
by the real dimension bound. An unrestricted bound of $0.8247$ would give
a phase-averaged constant above $0.916$.

The numerical criteria here leave cubics of rank at least $16$, with
$a<.662$, $.0049067<\lambda<L(.662)$,
$\operatorname{Var}\tau>89/2250$, and $89/500<\kappa<53.0920$ to other
arguments. These conditions describe the remaining region of the present
criteria. The full target is tracked in [#458](https://github.com/agalatan/grothendieck-lean/issues/458).

## Replay and provenance

The orthogonal-complement majorant, Gaussian radial averaging, rational
tensor comparison, and second-order Stein idea came from the user's
Gemini handoff. The continuum checkers in §§1, 3 and 4 were written for
this packet. The averaged mixed term, chord integration bound and the
two-branch contraction estimate strengthen its dimension and influence
conclusions. Sections 5 and 6 preserve the earlier audited estimates.
The checkers establish the displayed numerical premises using Arb or
integer and rational arithmetic. The analytic reductions are given above.

Run the five checkers from the repository root with Python 3.12,
python-flint 0.9.0 and NumPy 2.3.5. The circle checker uses only the
standard library. Each script exits on a failed assertion.

```sh
cert_dir=research/conjecture-K/code/third-chaos-dual-slice-codex-6d92
for check in rank planes stein regression circle; do
  python3 -I "$cert_dir/certify_${check}.py" || exit 1
done
```
