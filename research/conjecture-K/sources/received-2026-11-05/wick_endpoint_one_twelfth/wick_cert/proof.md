<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_endpoint_one_twelfth/wick_cert/proof.md (file dated 2026-11-05). Only this line was added. -->
# Certified deterministic-shift kernels and a larger Wick-endpoint neighborhood

Research continuation, 5 November 2026. This note does not prove Conjecture K or the full mixed-family envelope. Its scope is the deterministic kernel machinery, local envelope boxes, and the endpoint theorem stated below. The scalar checks completed successfully at all three rows: 200 accepted variance intervals at the peak row, 189 at the flank row, and 134 at the upper row (523 total).

## 1. Notation

L=Z(a+b|Z|²), with standard complex Gaussians. The three exact rows are
(a,b)=(699/1250,179/1250), (14/25,1467/10000), (573/1000,19/125).

Write phi(s)=2E|L+sqrt(s)| (including phi(0)), B(v)=E phi(vR) for R~Exp(1), and F_A(z)=z g(|z|²). Thus the Phi of the earlier integrated-envelope note is phi-phi(0).

Let t(s) be the inverse of s=t(a+bt)², and define

psi(s)=exp(-t(s)), h(s)=exp(-t(s))/(a+bt(s))²,
D(t)=(a+bt)(a+3bt), and R_* = 4a³/(27b).

The established Bernstein argument proves psi and h completely monotone; phi' and -g are completely monotone as well. The inverse branch t is analytic on C minus (-infinity,-R_*].

## 2. Smooth Abel formulas

Define three Abel transforms, initially for v>=0:

A(v)=integral_0^infinity exp(-t(x²+v))/D(t(x²+v)) dx,
H(v)=integral_0^infinity h(x²+v) dx,
V(v)=integral_0^infinity psi(x²+v) dx.

A=-V'. All three functions are completely monotone. Let t0=t(v), d0=D(t0), e0=2ab+3b²t0, and

Q_v(y)=d0+e0 y²+b²y⁴.

The substitution t(x²+v)=t0+y² gives x=y sqrt(Q_v(y)) and

dx/dy=D(t0+y²)/sqrt(Q_v(y)).

Therefore

A(v)=exp(-t0) integral_0^infinity exp(-y²)/sqrt(Q_v(y)) dy,

H(v)=exp(-t0) integral_0^infinity exp(-y²)
 (a+3b(t0+y²))/[(a+b(t0+y²))sqrt(Q_v(y))] dy,

V(v)=exp(-t0) integral_0^infinity exp(-y²)
 D(t0+y²)/sqrt(Q_v(y)) dy.

These are smooth positive integrals with Gaussian tails. No elliptic-integral singularity or numerical differentiation occurs.

The deterministic-shift kernels are

-g(s)=(2/pi) integral_0^(pi/2) sin²(theta) H(s sin²(theta)) dtheta,

phi'(s)=(4/pi) integral_0^(pi/2) cos²(theta) A(s sin²(theta)) dtheta,

phi(s)=(4/pi) integral_0^(pi/2)
 [V(s sin²(theta))+2s cos²(theta)A(s sin²(theta))] dtheta.

Proof of the first two identities: use the established positive measure representations

phi'(s)=sqrt(pi)/2 integral sqrt(lambda) 1F1(1/2;2;-lambda s) nu(dlambda),

-g(s)=sqrt(pi)/4 integral lambda^(-1/2) 1F1(3/2;2;-lambda s) mu(dlambda),

where psi is the Laplace transform of nu and h that of mu. Euler's beta integral and integral_0^infinity exp(-lambda x²)dx=sqrt(pi)/(2sqrt(lambda)) give the displayed Abel identities. Integrating phi' in s and integrating by parts in theta gives the last identity. The boundary term at theta=0 vanishes, since V(0)-V(s sin²(theta))=O(theta²); phi(0)=2V(0).

## 3. Rigorous angular quadrature and Gaussian tails

At v=-R_*/2,

t0=a(sqrt(3)-2)/(3b), d0=2a²/3, e0=sqrt(3)ab.

At the three rows, -t0<2/5, exp(-t0)<3/2, sqrt(d0)>11/25. Using a<=3/5, b<=4/25, sqrt(pi)/2<8/9 and the Gaussian moments in the Abel formulas gives A(-R_*/2)<10, H(-R_*/2)<10, V(-R_*/2)<10. In fact these estimates give A<100/33, H<100/11 and V<2.

Complete monotonicity plus analyticity to the left of zero implies the Laplace representations have finite exponential moments at -R_*/2. Hence |A(v)|, |H(v)|, |V(v)|<10 whenever Re(v)>=-R_*/2. This follows alternatively by expanding their nonnegative moment series at zero and monotone convergence before complex extension.

For s>0 set delta=asinh(sqrt(R_*/(2s))). On |Im theta|<=delta,

Re(s sin²(theta))>=-R_*/2,
|sin(theta)|², |cos(theta)|² <= cosh²(delta)=1+R_*/(2s).

For a pi-periodic analytic function bounded by M in this strip, its N-node equally spaced trapezoid average differs from its exact average by at most 2M/(exp(2Ndelta)-1). Proof: shift the Fourier coefficient contour to the strip boundaries; the k-th coefficient is bounded by M exp(-2|k|delta), and sum the aliasing modes k=mN.

The code uses a common bound

M=10+20s cosh²(delta)+10cosh²(delta),

and adds the conservative error 4M/(exp(2Ndelta)-1) to each of phi and g. The actual integer N is arbitrary for validity: choosing it from floating estimates affects efficiency only; the error is reevaluated with Arb.

At the real angular nodes, the y integral is truncated at 8 and integrated by Arb on [0,1], [1,2], [2,4], [4,8], with analytic square-root checks. For E=exp(-64), put J0=E/16, J2=4E+J0/2, J4=256E+3J2/2. These bound the tails of 1,y²,y⁴ against exp(-y²). With tmax=t(s), the potential tail is at most

(2/a){[D(tmax)+2s]J0+(4ab+6b²tmax)J2+3b²J4},

and the g tail is at most 3E/(32a). These are added separately from the angular quadrature error.

The inverse t is evaluated from

t(s)=4a/(3b) sinh²((1/3)asinh(sqrt(27bs/(4a³)))).

Near zero the code uses 24 Lagrange-inversion coefficients:

t(s)=sum_(n>=1) (-1)^(n-1)/n * binom(3n-2,n-1) b^(n-1)s^n/a^(3n-1).

For |s|<R_*/8 the omitted tail is bounded by

(3|s|/(2a²)) (|s|/R_*)^24 /(1-|s|/R_*).

The coefficient bound follows from binom(3k+1,k)<=(3/2)(27/4)^k. Thus the removable branch at zero is handled explicitly.

## 4. Rigorous interpolation between kernel nodes

Each row has 353 nodes through s>4096, near the shifted geometric grid
s_j=((33/32)^j-1)/12, rounded to exact multiples of 2^-24. Values are stored with outward dyadic endpoints of denominator 2^42. The table generator recomputes every value with the preceding quadrature and tails.

All rows have R_*>1/6. Set d=1/12. Then -g(-d)<5 and phi'(-d)<10. For eight interpolation nodes s_i, t=min(s,s_0), the degree-seven Lagrange interpolation errors satisfy

|g(s)-P_g(s)| <= 5 product_i |s-s_i|/(t+d)^8,

|phi(s)-P_phi(s)| <= (10/8) product_i |s-s_i|/(t+d)^7.

Indeed complete monotonicity and exp(x)>=x^n/n! give the required derivative bounds; apply the usual real interpolation remainder. Arb evaluates the polynomial using all node-value intervals.

For interval input s, the checker evaluates at its midpoint and adds global Lipschitz allowances. They are phi'(0)<5/3 and g'(0)<10/3. The latter follows from

g'(0)=(3/8) integral_0^infinity exp(-y²)(a+by²+2b)/(a+by²)^4 dy
 <=(3sqrt(pi)/16)(a^-3+2ba^-4)<10/3.

These constants also imply |(J/2)'|<=20/3. The benchmark satisfies |B'|<5/3, |B''|<7, and |B'''(u)|<=21/(2u) for u>0 by its positive mixture formula. These bound the variation of benchmark evaluations across parameter intervals.

## 5. Certified integration over the Wick radius

For real parameter intervals c,x,y, let b(r)=c(r-2)+x+iy and s(r)=r[(c(r-2)+x)²+y²]. The potential and content integrands are exp(-r)phi(s(r)) and r exp(-r)b(r)g(s(r)).

Each real r segment [m-h,m+h] is enclosed in the complex disk |r-m|<=2h. Expanding the cubic s(r) gives the exact enclosure

|s(r)-s(m)| <= |s'(m)|2h+|s''(m)/2|(2h)²+c²(2h)³.

The segment is subdivided until this is <s(m)_lower+d/2. Hence Re s(r)>-d/2 on the disk. The analytic bounds

|g(s)|<=5, |phi(s)|<=2+10|s|

then give explicit suprema M for each radial integrand. A 24-node Gauss-Legendre rule has error at most 8h M 2^-48. To see this, truncate the analytic Taylor series at degree 47 on the disk of radius 2h, bound its remainder on the real interval by 2M 2^-48, and use positivity and total mass 2h of both the integral and the Gauss rule.

The Gauss nodes are enclosed by verified sign-changing intervals for the degree-24 Legendre polynomial, refined by bisection. Disjointness and degree certify exactly one root per interval. The weights use the exact formula 2/[(1-x²)P'_24(x)²]. Floating roots are merely initial bracket guesses.

The radius integral is truncated at 32. For c<=.153 and |z|<=4, the code adds

exp(-32){2+2[.153(32²+64+2)+4.306*33]}

to the potential error and (3/4)*33 exp(-32) to each content component. These follow from phi(s)<=phi(0)+2sqrt(s), phi(0)<2, |F_A|<=2/e<3/4 and elementary exponential tail moments. No empirical quadrature error estimate is used.

## 6. Scalar Wick certificate and endpoint consequence

`check_wick_slice.py` adaptively covers 27/1000<=v<=463/10000. On each closed variance interval it proves BOTH

C(sqrt(v/2)X(R-2))² <= (9/100) Delta_0(v),

Delta_0(v)>=5v²,

where Delta_0(v)=B(v)-F(sqrt(v/2)X(R-2)). Every interval decision uses the rigorous table interpolation, benchmark integration, radial Gauss error and tails above. The JSON files record the accepted interval partition. This is an Arb-supported scalar certificate, not a Lean proof.

Use the already proved global perturbation estimates from the supplied Wick endpoint note:

C(q)<=C(q0)+4p,
Delta(q)>=Delta_0-(7/2)up,

for q=X[c(R-2)+P], q0=cX(R-2), EP=0, p=E|P|², u0=2|c|², u=u0+p. These estimates require only centeredness, independence of P and X, and finite variance.

For completeness, their proof is short. With f(z)=z g(|z|²), the positive exponential-mixture representation of -g implies

sup_(z,|h|=1)|D²f(z)[h,h]|² <= (69/16)²[-g(0)]g'(0)<36.

The numerical inputs -g(0)<17/20, g'(0)=J'(0)/4<9/4 and -B''(0)<7/2 are independently regenerated by check_constants.py. Conditional Taylor expansion in XP has zero expected linear term, so the content change is at most 3p E R^(3/2)=9sqrt(pi)p/4<4p. Conditional concavity gives F(q)-F(q0)<=p phi'(0), while B(u)-B(u0)>=p B'(u). Complete monotonicity gives phi'(0)-B'(u)<=u[-B''(0)]<(7/2)u. This proves both perturbation estimates. The full remote projection has only its X coefficient, by circular averaging in X.


If 0.03<=u<=0.0463 and p<=u/12, then t=p/u0<=1/11 and u0>=11u/12>=.0275. The new scalar certificates therefore apply. Since sqrt(Delta_0)>=sqrt(5)u0>(11/5)u0,

C(q)<=sqrt(Delta_0)[3/10+(20/11)t]
 <=(563/1210)sqrt(Delta_0).

Also

Delta(q)>=Delta_0[1-(7/10)t(1+t)]
 >=(563/605)Delta_0.

Consequently

C(q)² <= (563/2420) Delta(q) < (6/25)Delta(q).

Thus the Wick endpoint neighborhood grows from p<=u/16 to p<=u/12, at all three rows, for arbitrary centered P with finite variance. This does not cover the whole middle region. The shell-cost consequence is Lambda(q+(T-1)U)<=B(u)-u/epsilon-(89/2904)Delta(q)<=S, wherever the inherited 6/25 shell-cost theorem applies. Indeed 1-(563/2420)/(6/25)=89/2904.

## 7. Local four-parameter checks and remaining work

`check_boxes.py` certifies the fixed 0.22 pointwise envelope on two small four-parameter boxes per row near the previously observed difficult corners. The actual intervals are in the script and JSON output. These boxes are genuine continuum checks, but DO NOT cover the entire compact domain and DO NOT independently yield a mixed-family theorem for unrestricted P.

The next global step needs an efficient cover or a higher-order parameter model on the remaining compact domain. This bundle supplies rigorous scalar kernels and radial evaluations for that purpose. The small-Wick directional bridge, mixed shells, and several self-interacting drivers remain open.

## 8. Coordination audit

The updated monograph and attached proof/reply files were read. Retrieved chat context was incomplete; a full transcript of all four other chats was not available. The radial-moment obstruction and corrected K(0.0463) checker were replayed successfully. The Gaussian-factor theorem covers its stated factorized class, not every possible cubic lacking the single cX(R-2) term. In particular the mixed shells remain outside that theorem; a driver-by-driver general reduction still needs proof.
