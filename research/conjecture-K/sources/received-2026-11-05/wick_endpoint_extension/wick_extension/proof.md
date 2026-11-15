<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_endpoint_extension/wick_extension/proof.md (file dated 2026-11-05). Only this line was added. -->
# A uniform neighborhood of the Wick endpoint in R26

## Theorem

Use the peak, flank or upper profile in the supplied conjecture-K bundle.
Let X be standard complex Gaussian, Y an independent Gaussian vector, and P=P(Y)
ANY complex random variable satisfying E P=0 and E|P|^2=p<infinity. Set

\[
 q=X[c(|X|^2-2)+P],\quad u_0=2|c|^2,\quad u=u_0+p.
\]

If 0.03<=u<=0.0463 and p<=u/16 (equivalently p<=u_0/15), then

\[
 \boxed{C(q)^2\le\frac{49}{211}[B(u)-F(q)]<0.24[B(u)-F(q)].}
\]

Here C(q)=||Pi_{1,0} F_A(q)||, with the full remote first-chaos projection.
The weak first inequality is the theorem; the strict numerical comparison of
constants is not intended to assert a strict inequality when the deficit is zero.
This covers arbitrary complex centered quadratic P, with no matrix restriction,
when the Wick component carries at least 15/16 of the energy. It also covers
nonquadratic P; for the original chaos problem take P to be a centered quadratic.
It does not prove R26 when p>u/16.

Using the inherited shell-cost estimate kappa=6/25, the theorem gives

\[
 \Lambda(q+(T-1)U)\le B(u)-u/\varepsilon
 -\frac{41}{1266}[B(u)-F(q)]\le S
\]

for all remote holomorphic linear U with E|U|^2<=0.0113 wherever that supplied
cost estimate holds. In the intended application q is cubic. Sharing between
U and either X or Y is permitted.

## Definitions and scalar kernel bounds

Write f(z)=F_A(z)=z g(|z|^2), and

\[
 \phi(s)=2\mathbb E_Z|L+\sqrt s|,\quad
 B(v)=\mathbb E_R\phi(vR),\quad R\sim\operatorname{Exp}(1).
\]

Both phi' and -g are completely monotone. The inherited scalar kernel formulas
prove this as follows. The Gaussian scale mixture representation of L makes
phi' a positive mixture of 1F1(1/2;2;-lambda s). Also the representation

\[
 J(v)=-\frac{\sqrt\pi}{2}\int
 \lambda^{-1/2}(1+\lambda v)^{-3/2}\,\mu(d\lambda)
\]

and J(v)=2 E_R[R g(vR)] give

\[
 -g(s)=\frac{\sqrt\pi}{4}\int\lambda^{-1/2}
 {}_1F_1(3/2;2;-\lambda s)\,\mu(d\lambda).
\]

The latter identity follows by taking the Gamma(2,1) average and uniqueness
of the Laplace transform. Euler's beta integral proves complete monotonicity
of each hypergeometric kernel. Define A(v)=-B''(v), H(v)=J'(v). Then

\[
 -g(0)=-J(0)/2<17/20,\quad g'(0)=H(0)/4<9/4,
 \quad A(0)<7/2.
\]

The enclosed check_constants.py verifies these bounds at the three rows using
the inherited outward kernel enclosures and an Arb enclosure for J(0).

## 1. A global Hessian bound for the content map

Write -g(s)=int exp(-ts) nu(dt), where nu is positive. Thus
int nu=-g(0) and int t nu=g'(0). Regard f as a map R^2 -> R^2. For any unit
real direction h, direct differentiation gives

\[
 |D^2[z e^{-t|z|^2}][h,h]|
 \le (6t|z|+4t^2|z|^3)e^{-t|z|^2}.
\]

Maximizing the two terms separately,

\[
 (6tr+4t^2r^3)e^{-tr^2}
 \le\left(\frac6{\sqrt{2e}}+
 4\left(\frac3{2e}\right)^{3/2}\right)\sqrt t
 <\frac{69}{16}\sqrt t.
\]

For the rational last bound use e>8/3 and sqrt(3)<7/4. Cauchy--Schwarz in nu
now gives

\[
 \sup_{z,|h|=1}|D^2f(z)[h,h]|^2
 \le(69/16)^2(-g(0))g'(0)
 <(69/16)^2(17/20)(9/4)<36.                 \tag{1}
\]

Therefore the second-order Taylor remainder has norm at most 3|h|^2.
The positive measure representation justifies differentiation; the displayed
bound is integrable since int sqrt(t) nu <= sqrt(int nu int t nu).

## 2. Content stability under an arbitrary centered coefficient

Let q_0=cX(R-2). Conditional on X, the linear Taylor term in XP has expectation
zero. By (1),

\[
 |\mathbb E_P[f(q_0+XP)-f(q_0)]|\le3Rp.
\]

All Y-direction first-chaos coefficients vanish by rotation of X. Hence the
full projection norm is the absolute value of the X coefficient, and

\[
 C(q)\le C(q_0)+3p\mathbb ER^{3/2}
 =C(q_0)+\frac{9\sqrt\pi}{4}p<C(q_0)+4p.       \tag{2}
\]

This uses only the second moment of P, not any higher moment or a Gaussian law.

## 3. Same-norm deficit stability

Let Delta_0=B(u_0)-F(q_0), Delta=B(u)-F(q).
Concavity of phi and independence give, conditional on R,

\[
 \mathbb E_P\phi(R|c(R-2)+P|^2)
 \le\phi(R[|c(R-2)|^2+p])
 \le\phi(R|c(R-2)|^2)+Rp\phi'(R|c(R-2)|^2).
\]

Thus F(q)-F(q_0)<=p phi'(0). Since B is concave,
B(u)-B(u_0)>=p B'(u). Complete monotonicity of phi' implies

\[
 \phi'(0)-B'(u)
 =\mathbb E R[\phi'(0)-\phi'(uR)]
 \le(-\phi''(0))u\mathbb ER^2=A(0)u<\tfrac72u.
\]

Consequently,

\[
 \boxed{\Delta\ge\Delta_0-\tfrac72up.}          \tag{3}
\]

## 4. Pure Wick inputs, checked against the same-norm benchmark

The enclosed verify_wick.mjs adapts the supplied exact dyadic template checker.
It proves simultaneously, for every v in [0.0279,0.0463] at all three rows,

\[
 C(\sqrt{v/2}X(R-2))^2\le\tfrac{11}{100}\Delta_0,
 \qquad\Delta_0\ge4v^2.                       \tag{4}
\]

The modification is substantive: the benchmark is the Gaussian potential at
the lower endpoint of the SAME variance interval, not a fixed Gaussian witness
with an epsilon penalty. Thus (4) really concerns B(v)-F(q_0), not S-Lambda(q_0).

For each coefficient interval [cl/D,cu/D], the checker obtains slack/D as a
lower bound for Delta_0 and amax/D as an upper bound for C(q_0). It checks

\[
 100\,\mathrm{amax}^2\le11D\,\mathrm{slack},\qquad
 D^3\mathrm{slack}\ge16\,\mathrm{cu}^4
\]

with BigInt. Since v<=2(cu/D)^2, the second inequality proves Delta_0>=4v^2.
It checks 141 coefficient intervals at each row. The reported content ratio
upper bounds are 0.105, 0.104, 0.101 for peak, flank, upper respectively.
The theorem deliberately uses 0.11. Angular/radial enclosures and tail
allowances are inherited from the supplied template checker. No floating
quadrature is used to certify (4).

## 5. Closing the perturbation estimate

If p<=u/16, then p/u_0<=1/15 and up/u_0^2<=16/225. Also
u_0>=15u/16>=0.028125, so (4) applies. In particular Delta_0>0.
By (2), (4), sqrt(11/100)<1/3, and sqrt(Delta_0)>=2u_0,

\[
 C(q)\le\sqrt{\Delta_0}
 \left(\frac13+\frac{2p}{u_0}\right)
 \le\frac7{15}\sqrt{\Delta_0}.
\]

By (3) and (4),

\[
 \Delta\ge\Delta_0\left(1-\frac{7up}{8u_0^2}\right)
 \ge\frac{211}{225}\Delta_0.
\]

Combining these proves C(q)^2 <= (49/211) Delta. Finally,
49/211 < 6/25 and 1-(49/211)/(6/25)=41/1266.

## Replay and limitations

Run `node verify_wick.mjs --content-only` and `python check_constants.py`.
The Node checker regenerates its elementary dyadic tables. The short Python
check requires python-flint and reuses the supplied scalar kernel tables.
This is a paper argument with computational scalar inputs, not a Lean proof.
It certifies only the stated 15/16-energy Wick neighborhood; the rest of R26
and the general six-shell mixture remain open.
