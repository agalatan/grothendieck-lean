# The original witness has slack on a populated negative-fifth slice

Let $T=27441/32768$ and $r=.290007$. For every finite-dimensional unimodular physical pair with visible norm $t\ge T$ and remote cubic norm $\tau\ge r$, the original identity-tail payoff satisfies $V_0<.713232$. At signed weight $w=.00003579$ and fifth debit $d=10^{-8}$ the same pair has payoff below $.713235$. The unrestricted [126-piece schedule](JOINT_STEIN_SHOULDER.md) reaches approximately $.71325110$ at its binding prices. Thus this rectangle has an explicit reserve even though its [complete fifth difference is negative](OCCUPIED_FIFTH_INTERVAL.md). Finite examples exist because $T^2+r^2<\pi/4$. At the same $w$, every fifth debit through $.00137$ still fits the published scalar budget on this rectangle. The estimates outside this rectangle continue to determine the global bound.

## Sharper price using the exact Gaussian support

The [buffered Rice comparison and sharpness proof](../../research/conjecture-K/sources/buffered-rice-codex-a7c4/PROOF.md) gives $\mathbb E|Z+\lambda q|\le\mu\sqrt{1+\lambda^2}$ for $0\le\lambda^2\le1/6$. At $\lambda=.3463$ its outward upper bound is $.937862468207$. Thus the support slack $D$ used below is at most $1462231/(8\cdot10^{12})$ on the whole rectangle. Use Young coefficient $956$ in the final inequality below. The same polynomial, its 8192 verified radial intervals and its unbounded final tail give **$V_0<.713146681$**. The argument below also forces the fourth excess below $.002$ for these same physical responses.

At the reverse-plane tilt $.3425$ the Gaussian upper bound is $.93676586012863$. Applying the existing reverse fifth planes with the retained $.002$ shape bound gives $\Delta>-.011921966$. The sharp energy disk implies $t^2\le\pi/4-r^2$ at $\tau\ge r$. Consequently the matched zero-fifth score at $w=.00003579$ is below $.713146257$. For **every** $0\le d\le.00879$ the signed score of the pair is below $.71325109802694$ throughout this occupied rectangle. The comparison uses the same signed scalar cap as the global 126-piece estimate. [Exact final arithmetic](code/sharp_occupied_reserve.py) · [Reverse fifth planes](OCCUPIED_FIFTH_INTERVAL.md).

## A common support test

Align the Gaussian $Z$ with the first projection of the half-sum $h$. Let $q$ be the unit remote cubic in the direction of the remote projection of the half-difference $k$. Set $\lambda=.3463$, $C=T+\lambda r$, $y=|q|$ and $m(a)=\mathbb E_Z|Z+a|$. Use $h_*,k_*$ for the half-sum and half-difference of the phases of $Z\pm\lambda q$. The measured deficit $D=\mathbb E m(\lambda y)-t-\lambda\tau$ is nonnegative. The [three-node Rice estimate](TENTH_RICE_SUPPORT.md) gives $\mathbb E m(\lambda y)\le U=.937862576$. The [fourth-excess cut](OCCUPIED_FIFTH_SIGN.md) gives $s=\mathbb E y^4-2<.002$ under these thresholds.

Write $P,Q$ for the first and cubic projections, $\alpha=1953/2000$, $\beta=63/80$, and $\nu=47/2000$. The original payoff is
$$
 V_0=\alpha (t^2-\|Pk\|^2)+\nu(1-2\|k\|^2)-\beta(\|Qh\|^2-\|Qk\|^2).
$$
All the estimates below concern this same pair and its same remote cubic.

1. For the half-sum test $u=Z(|Z|^2-2)/\sqrt2$, take $v=-.264$. The visible conditional coefficient of $h_*$ is $c_{21}(\lambda y)$ in the [normalized Hermite expansion](FULL_FIFTH_PLANES.md). The planar density $|u|^2 d\gamma_Z$ is bounded by $.35/\pi$. In fact $x(x-2)^2e^{-x}/2$ attains its positive maxima at $(5\pm\sqrt{17})/2$, where the claimed bound follows by rational Taylor estimates for $e^x$. For every shift, layer cake thus bounds $\mathbb E_Z |u|^2/|Z+a|$ by $2\sqrt{.35}<1.184$. Weighted Cauchy–Schwarz on the two phases gives $|\operatorname{Re}\langle u,h-h_*\rangle|\le\sqrt{2(1.184)D}$. Hence
$$
 \|Qh\|^2\ge \mathbb E(2v c_{21}(\lambda y)-v^2)-2|v|\sqrt{2(1.184)D}.
$$

2. Split $Qk$ into its purely remote component and its orthogonal complement. The former has squared norm $\tau^2$ by definition. In $k_*$ the remaining even visible indices in $H_{2,1}$ are $11$ and $20$. Their conditional coefficients agree up to the conjugate phase and the factor $1/\sqrt2$. Their complementary remote chaoses are first-chaos spaces, so one may subtract the remote cubic $bq$ or $b\bar q$, with the same phase, taking $b=-.135$. Write $J(y)=\tfrac32(c_{11}(\lambda y)-by)^2$. Conditional projection contraction bounds the squared norm of the nonremote cubic of $k_*$ by $\mathbb E J$. The [shifted inverse-radius estimate](SHIFTED_FIFTH_STABILITY.md), with antiholomorphic degree one, bounds $\|Q(k-k_*)\|^2\le4\sqrt2D$. For $\epsilon=.06$, Young's inequality gives
$$
 \|Qk\|^2\le\tau^2+(1+\epsilon)\mathbb E J+(1+1/\epsilon)4\sqrt2D.
$$

3. The actual $L^2$ cost of the half-difference is also needed. Since $|k_*|\le1$, the shifted inverse-radius integral for its dual test is at most $\sqrt\pi$, uniformly in the shift. Indeed a disk of given radius has maximum Gaussian mass when centered at zero, by disk intersection or rearrangement. Layer cake reduces the bound to $\mathbb E |Z|^{-1}=\sqrt\pi$. Applying the same weighted inequality to $k-k_*$ and testing against $k_*$ gives
$$
 \|k\|^2\ge\|k_*\|^2-2\sqrt{2\sqrt\pi D}.
$$

For both scalar pairings, the two applications of Cauchy–Schwarz use $\mathbb E|Z\pm\lambda q|\cdot|f_\pm-\operatorname{ph}(Z\pm\lambda q)|^2\le2D_\pm$ and $(D_++D_-)/2=D$.

## A radial lower bound for the half-difference norm

Put $x=a^2$ and condition on $u=|Z|^2$. The half-difference norm of the exposed phases is half of one minus their real correlation. Average over the angle using $s=\min(u,x)/\max(u,x)$. The inverse product of the two phase denominators gives the convergent angular binomial series
$$
 \operatorname{sgn}(u-x)(1-s)\sum_{j\ge0}
 \left[\binom{2j}{j}/4^j\right]^2s^{2j}
$$
for the real correlation. For $u<x$, keeping the first term gives a lower squared norm $1-s/2$. For $u>x$, every coefficient after the first is at most $1/4$; summing that geometric series gives the lower bound $s/2-s^2/[8(1+s)]$. Pointwise in $u$ these lower bounds increase with $x$, including the upward jump when $x$ crosses $u$. The equality case has zero measure.

Integrate against the exponential density of $u$. For $x>0$ the resulting monotone lower bound on the conditional squared norm is
$$
 K_0(x)=1-\frac1{2x}+e^{-x}\left[\frac{1-x}{2x}
              +\frac{x}{8}\{3R(x)+R(2x)\}\right],
 \qquad R(x)=\int_0^\infty\frac{e^{-z}}{x+z}\,dz .
$$
At zero use $K_0(0)=0$. For a rational lower evaluation of $R(x)$, the inequality
$R(x)\ge2\mathbb E p(X)-\mathbb E[(x+X)p(X)^2]$ follows by completing a square with $X$ exponential. Optimize over polynomials of degree below 30. In the orthonormal Laguerre basis, multiplication by $X$ has diagonal $2j+1$ and adjacent entries $-(j+1)$, by the three-term Laguerre recurrence. The optimum is the upper-left entry of the inverse of this tridiagonal matrix shifted by $x$. Thirty scalar Schur complements compute it with exact rational operations. Positive definiteness follows directly from $\mathbb E[(x+X)p(X)^2]>0$ for nonzero $p$.

## Uniform payoff estimate

The coefficient of $\sqrt D$ from steps 1 and 3 is at most
$A=4\nu(1.883)+2\beta |v|(1.540)$. Price it by $A\sqrt D\le750D+A^2/3000$. The total coefficient of $D$ is then at most $\Gamma=750+\beta(1+1/\epsilon)(5.657)$. Set $c=136.5$. On the entire positive half-line the [rational replay](code/occupied_identity_debit.py) verifies
$$
 p(y)\ge \beta[(1+\epsilon)J(y)-2v c_{21}(\lambda y)+v^2]
               -2\nu K_0((\lambda y)^2)+c\,[m(\lambda y)-C],
$$
where $p(y)=-7.123598+7.266247 y^2-.107593 y^4+.00179345y^6$. On each of 8192 intervals in $[0,8]$ the verifier uses the conditional norm lower bound from the left endpoint. The smooth terms use outward Hermite ordinates and an upper bound for the second derivative of polynomial minus profile to control their loss between endpoints. Convexity of $m$ gives the required sign for its derivative contribution. For $y\ge8$, Bessel bounds the normalized Hermite coefficients by one and the triangle inequality gives $m(\lambda y)\le\mu+\lambda y$. All translated polynomial coefficients in $y-8$ are then nonnegative.

Use $\mathbb E y^2=1$, $\mathbb E y^4\ge2$ and the [circular sixth estimate](SIXTH_RICE_SUPPORT.md) at $s=.002$. For any $t\ge T$, $\tau\ge r$ in the physical range $0\le t,\tau\le1$, the correction $\alpha(t^2-T^2)+\beta(\tau^2-r^2)$ is at most $\Gamma[(t-T)+\lambda(\tau-r)]$ because $\Gamma>2\alpha$ and $\Gamma\lambda>2\beta$. Combining all the inequalities gives
$$
 V_0\le \alpha T^2+\nu+\beta r^2+\mathbb E p(y)
           +A^2/3000+(\Gamma-c)(U-C)<.713232 .
$$
For the signed payoff use $(1-w)V_0+w(t^2-\|Pk\|^2)-d\Delta$, $t^2\le\pi/4$ and $\Delta\ge-1$. The exact replay checks the resulting $.713235$ bound, the original price, and the strict finite-occupation criterion. The stronger [reverse fifth estimate](OCCUPIED_FIFTH_INTERVAL.md) gives $\Delta>-.012307$ on this same rectangle. Substituting the unrounded original price into $(1-w)V_0+w\pi/4+.012307d$ stays below $71325109802694/10^{14}$ for every $0\le d\le.00137$. This larger debit comparison is local to the rectangle.

Agent-ID: codex-a7c4
