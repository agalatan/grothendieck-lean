# A certified central obstruction for the largest fifth debits

Agent-ID: codex-a7c4. Put $e=.764$, $\nu=.0235$, $S_0=P-eQ+\nu(I-P-Q)$, and $S_{w,d}=(1-w)S_0+wP-dF$, with $F=P_{3,2}$. Let $C(w,d)$ be the supremum of the absolute payoff over all finite dimensions and unimodular physical responses. Two fixed tests in the graded cubic model prove the following.

* $C(0,.0235)\ge .7131156728>10000/14023$. In fact **every $d\ge .0232912$ at $w=0$** fails the $1.4023$ test, including debits with a positive fifth eigenvalue.
* There exist physical unimodular pairs with $.8392<t<.8394$ and $\Delta_5<-.00718$. A central fifth floor above $-.0071$ requires extra hypotheses or compensation in the original payoff.
* Combining the first step-function pair with $f=g=\operatorname{ph}Z$ gives **$1/C(w,d)\le1.40257113$ for every $0\le w\le1$, $d\ge0$**, at the displayed fixed $e,\nu$. The second test sharpens the ceiling to **1.40244213**. These ceilings concern the displayed witness family with fixed cubic and identity coefficients.

The [finite realization](FINITE_GRADED_LIFT.md) certifies a single physical unimodular pair in 300,001 coordinates with signed fifth energy below $-.007176$ and a payoff more than $10^{-7}$ above the target.

The [one-coordinate bound](ONE_COORDINATE.md) covers the opposite case in any dimension when just one response depends on a single complex linear coordinate.

## The pair and its moments

Let $Z,W$ be independent standard complex Gaussians with assigned bidegrees $(1,0),(2,1)$. Write $r=|Z|$, $s=|W|$, $\theta=\arg W-\arg Z$. Fix radial edges $r_i=5(13u_i+7u_i^2)/20$, $u_i=i/432$, and 216 equal intervals on $[0,\pi]$. On each box in $[0,5]^2\times[0,\pi]$, choose a complex disk value $v$ on the lattice $2^{-26}\mathbb Z[i]$. Extend to the negative angles by complex conjugation and set the function to zero if either radius exceeds five. Set $f=\operatorname{ph}(Z)v(r,s,\theta)$ and $g(Z,W)=f(Z,-W)$. Values at cell boundaries have no effect. The [verifier](code/graded_step_certificate.py) proposes values using six phase updates at the midpoints and checks every disk constraint. The integer values on cells are the actual response. No approximation theorem about the phase updates is required.

Order the degree-one, three and five Hermites as $Z,W,H_{21}(Z),H_{11}(Z)W,H_{20}(Z)\bar W,H_{32}(Z)$. These are all basis vectors of bidegrees $(1,0),(2,1),(3,2)$ in the graded model. Reflection makes the coefficients $m_0,\ldots,m_5$ of $f$ real, and $g$ multiplies them by $(+,-,+,-,-,+)$. With $I=\operatorname{Re}\langle f,g\rangle$, put
\[
 c_0=m_0^2,\quad c_1=m_2^2-m_1^2,\quad c_2=m_5^2-m_3^2-m_4^2.
\]
Then $t=|m_0|$, $\Delta_5=c_2$, and the exact real payoff is $A+w(c_0-A)-dc_2$, where $A=\nu I+(1-\nu)c_0-(e+\nu)c_1$.

The verifier integrates this *step function* over its actual cells. It integrates the radial monomials $2x^{j+1}e^{-x^2}$ using an interval evaluation of the Taylor polynomial of degree 134 in $x^2$ with the Lagrange remainder. The angular factors are the exact cell averages of $1$, $\cos\theta$ and $\sin\theta$, bounded by rational Taylor intervals and a Machin enclosure of $\pi$. The weighted sums use integer arithmetic. The code checks the range before its bounded NumPy integer contractions; Python integers handle the larger radial products. The calculation includes the errors of both signed radial weights and both angular weights.

Writing the resulting lower affine price as $A_-+C_-w+D_-d$, the verifier establishes $D_->0$. The visible phase supplies a second lower affine price with negative $d$ coefficient. A convex combination cancels $d$ and has nonnegative $w$ coefficient. Its value at zero is therefore a lower bound on $C(w,d)$ for the full parameter range. Taking its reciprocal gives the family ceiling above. The [lifting proof](GRADED_LIFT.md) realizes the payoff and strict moment comparisons in finite physical dimensions. It uses Mehler coefficients and independent rounding of the two inputs on fresh Gaussian coordinates.

## A second response limits the family across all nonnegative weights

On the same grid, replace the six generating integers by $(82766,20271,21330,-81,-42,-90)$. Its verified coefficients give
\[
 C(w,d)\ge .713040057+.005412598w+.000781685d,\qquad w,d\ge0.
\]
Thus both changes increase this particular pair’s payoff. Weight its affine lower bound and the visible phase’s lower bound so that the coefficient of $d$ cancels. Their $w$ coefficients are both positive. Using the full rational enclosures before display rounding gives $1/C(w,d)\le1.40244213$. This comparison requires no assumption about which phase pair maximizes the full payoff.

For the first pair, the verifier also bounds its unperturbed payoff above by $.712955$ and its payoff at $w=0,d=.02$ strictly below $10000/14023$. In this central example the original payoff therefore has enough slack at $.02$ to pay for the negative fifth energy. This identifies what is lost by imposing a fifth-energy floor independently of the original payoff.

~~~sh
VECLIB_MAXIMUM_THREADS=1 OPENBLAS_NUM_THREADS=1 python3 -BO experiments/quintic-signed/code/graded_step_certificate.py
~~~
