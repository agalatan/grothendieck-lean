<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_fresh_reductions/direct_wick_support/research_note.md (file dated 2026-11-05). Only this line was added. -->
# Fresh R26 analysis: directional size bias and a direct scalar support problem

Status: the reductions and the tail bound below are proved. The central uniform
inequalities remain unproved. Numerical searches are explicitly exploratory.
This note does NOT establish full R26 or general Conjecture K.

## 1. Directional size-biased Cauchy--Schwarz

Use the supplied R24 notation, with u=2|c|^2+E|P|^2, R under Gamma(2,1),
b=c(R-2)+P, V=|b|^2, and Ehat denoting this size-biased expectation.
Let

\[
 d=d_{u,R}(V),\quad E=\widehat{\mathbb E}d,\quad
 K=2u[-B''(u)]+u^2[-B''(u)]',\quad\alpha=uJ'(u)/2.
\]

Then the supplied exact identities are

\[
 \Delta=B(u)-F(q)=E+|c|^2K,\qquad
 \mathcal C=\alpha c+\widehat{\mathbb E}A,
 \quad A=b[g(RV)-g(Ru)].
\]

Since Ehat V=u, Z=V-u has zero mean. Realify A as a column a=(Re A,Im A).
Assuming the following integrals are finite, put

\[
 N=\widehat{\mathbb E}\frac{aa^T}{d},\quad
 v=\widehat{\mathbb E}\frac{aZ}{d},\quad
 e=\widehat{\mathbb E}\frac{Z^2}{d},\quad
 M=N-vv^T/e.
\]

When e=0 use the uncorrected N. Quotients on d=0 are assigned zero wherever
the original numerator is zero; continuous limits can instead be used as
upper bounds. The lemma below also follows by regularization when appropriate.
M is positive semidefinite: it is the weighted second-moment matrix of
w=a-(v/e)Z. Since Ehat Z=0, Ehat w=Ehat a.

Write a0=(Re(alpha c),Im(alpha c)). For every real unit column h,

\[
 |h^T\mathcal C_{\mathbb R}|\le |h^Ta_0|+
 \sqrt{E\,h^TMh}.
\]

This is ordinary weighted Cauchy--Schwarz applied after the real projection.
Consequently the exact sufficient condition

\[
 \boxed{
 \max_{|h|=1}\left(|h^Ta_0|+\sqrt{E\,h^TMh}\right)^2
 \le \kappa(E+|c|^2K)
 }
\]

implies C(q)^2<=kappa Delta. There is only one angular maximization left.
Alternatively, any s>0 satisfying the 2-by-2 matrix inequality

\[
 (1+s)a_0a_0^T+(1+s^{-1})E M
 \preceq\kappa(E+|c|^2K)I_2
\]

is sufficient. This formulation retains both the real direction carrying the
content and the actual division of the deficit into E and |c|^2K.

For comparison, using |A| before Cauchy--Schwarz and then combining the two
budgets gives the weaker sufficient bound alpha^2/K + tr(M)<=kappa.
That bound can fail simply because it maximizes over a deficit split which
is not realized by the given polynomial. At c=0, the alpha contribution must
be omitted altogether. Complex phases can also make tr(M) much larger than
the relevant directional entry.

The missing theorem is a uniform bound for the displayed directional expression
over the allowed shifted quadratic forms, retaining their joint law with R.
No such theorem is claimed here.

## 2. Third moments must be retained

A generic centered quadratic coefficient does not have symmetric law. For
P_lambda=lambda(|Y|^2-1), E P_lambda^3=2lambda^3. At the pure-P endpoint,

\[
 \mathcal C(XP_\lambda)=\tfrac12\mathbb E[P_\lambda J(P_\lambda^2)]
 =J'(0)\lambda^3+O(\lambda^5)
 =J'(0)p^{3/2}+O(p^{5/2}).
\]

The remainder follows from the bounded second derivative of J and the finite
fifth absolute moment of |Y|^2-1. Thus an expansion based only on p cannot
silently discard a p^{3/2} term. This example does not refute every possible
fixed-c expansion on the requested energy interval; it identifies a term that
must be computed or canceled before claiming a uniform O(p^2/u) remainder.
Also, c(R-2) and P are not interchangeable: R is simultaneously the radius of
the outside factor X and the argument in the size-biased kernels.

## 3. A different direct support problem

This approach targets the aligned shell U=dX, not arbitrary remote U.
Let T,R be independent unit exponentials. Let Z,X be independent standard
complex Gaussians with T=|Z|^2 and R=|X|^2, and L=Z(a+bT).
For deterministic complex z,c,d define

\[
 \mathscr F(z,c,d)=2\mathbb E
 |L+X[z+c(R-2)+d(T-1)]|.
\]

Let nu=1/epsilon and v_* be the positive Gaussian maximizing variance,
so B'(v_*)=nu and S=B(v_*)-nu v_*. Set

\[
 \alpha_*=2v_*B''(v_*),\qquad j_*=J(v_*).
\]

Consider the UNPROVED supporting inequality

\[
 \boxed{
 \mathscr F(z,c,d)-\nu(|z|^2+2|c|^2+|d|^2)
 \le S+\Re[\bar z(\alpha_*c+j_*d)]. }
 \tag{DS}
\]

The correction is fixed by first variation at c=d=0, |z|^2=v_*.
Indeed the c variation of F is 2Re(bar z c)v_*B''(v_*), and the d variation is
Re(bar z d)J(v_*). Equality holds at the Gaussian contact circle.

If (DS) holds uniformly in z, then substituting z=P(Y) and averaging cancels
the correction whenever E P=0. The exact energy is
2|c|^2+E|P|^2+|d|^2, by Gaussian orthogonality. Therefore (DS) would prove K for
q=X[c(R-2)+P(Y)] with the aligned A shell dX, using only the mean and variance
of P. A version with additive eta would prove K_eta on this aligned family.
It would NOT by itself establish the R26 content inequality or handle an
additional U component in the Y coordinates.

## 4. A proved tail reduction for (DS)

For the three rows, 5/4<nu<7/5 and |j_*|<17/10. The latter follows from the
supplied completely monotone J representation and its bound at zero. Also

\[
 |\alpha_*|=2v_*[-B''(v_*)]\le B'(v_*)=\nu.
\]

The Gaussian-mixture formulas for B' and -B'' prove the middle inequality
term by term. Assume |c|<=4/25 and |d|<=11/100; these bounds include the R26
energy range and the remaining shell range. Write x=|z|. Triangle inequality,
E|X|=sqrt(pi)/2, E[|X||R-2|]<=sqrt(2), and E|T-1|=2/e imply

\[
 \mathscr F(z,c,d)\le B(0)+\sqrt\pi x
 +2\sqrt2|c|+(2\sqrt\pi/e)|d|.
\]

Since S>=B(0), sqrt(pi)<9/5, sqrt(2)<3/2, and e>8/3, the excess in (DS) is at most

\[
 -\frac54x^2+\frac{2211}{1000}x+\frac{1257}{2000}.
\]

At x=9/4 this equals -5799/8000, and it is decreasing for x>=9/4. Hence (DS)
is rigorously true throughout |z|>=9/4. Only a compact domain remains.
Common phase rotation allows z to be taken real and nonnegative, leaving five
real variables (z,Re c,Im c,Re d,Im d).

## 5. Numerical evidence, not a certificate

explore.py performs 16 unconstrained Nelder--Mead searches at each of the three
rows, evaluating the two radial integrals with 100-point Gauss--Laguerre rules
and the phase integral through the complete elliptic integral. It then
reevaluates the best point and the known exact Gaussian contact with 160, 240,
and 300 radial nodes. These are 48 starts, not a global search or proof.

Every run finished close to the Gaussian contact. Apparent excesses were of
order 10^-6 or less, comparable to quadrature errors at the exact contact;
refinement changed their signs. Thus they do not establish a counterexample,
and they do not prove (DS). The exact contact is a useful error diagnostic.
All outputs, including errors at that contact, are in exploration.json.

## 6. What remains

Two explicit candidates remain for rigorous work:
(1) certify the directional size-biased matrix inequality uniformly over the
joint Gamma/quadratic-form law; this would close the actual R26 content target;
(2) certify (DS) on its compact five-real-variable domain; this would close the
aligned shared-A family only. Neither finite-amplitude assertion is proved in
this note. The previous certified Gaussian-factor and Wick-endpoint theorems
remain unchanged.
