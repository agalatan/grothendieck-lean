<!-- Verbatim from the delivery conjecture_k_content_law_blocks_codex_a786.zip (COORDINATE_OBSTRUCTION.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# What a finite-dimensional reduction must retain [P]

This is an elementary quantitative observation prompted by the Gaussian
polynomial limit papers in `LITERATURE.md`. It is supplementary to the
content-law theorem, not a counterexample to the content-law conjecture.

Let

\[
 q_m=\frac X{\sqrt m}\sum_{j=1}^m(|Y_j|^2-1),\qquad E|q_m|^2=1.
\]

Let E be a k-dimensional complex subspace of the original Gaussian linear
space span(X,Y_1,...,Y_m), and let F_E be the sigma field of its Gaussian
coordinates. Write c=||Proj_E X||². Then

\[
 \boxed{\quad\|E[q_m\mid F_E]\|_2^2
       =\frac c m\{k-1+2(1-c)^2\}.\quad}
 \tag{1}
\]

This formula is interpreted as zero when c=0. In particular

\[
 \sup_{\dim E=k}\|E[q_m\mid F_E]\|_2^2
 =\begin{cases}
       8/(27m),&k=1,\\
       (k-1)/m,&2\le k\le m+1.
   \end{cases}
 \tag{2}
\]

**Proof.** The polynomial is invariant under U(m) rotations of Y. If 0<c<1,
choose coordinates so that E is spanned by
v=sqrt(c)X+sqrt(1-c)Y_1 and Y_2,...,Y_k. The projection of X onto E is
sqrt(c)v; that of Y_1 is sqrt(1-c)v; the remaining Y directions project
either to themselves or zero. Conditional expectation of a Wick monomial
onto Gaussian coordinates replaces its linear arguments by their orthogonal
projections. This follows, for example, by expanding the Gaussian exponential
generating function and integrating the independent complementary variables.
Consequently

\[
 E[q_m\mid F_E]=\frac{\sqrt c}{\sqrt m}
 \left\{(1-c)v(|v|^2-2)+v\sum_{j=2}^k(|Y_j|^2-1)\right\}.
\]

The displayed summands are mutually orthogonal, with squared norms 2 and 1
respectively. This proves (1). The endpoint cases c=0,1 follow directly.
For k=1, the maximum of 2c(1-c)² on [0,1] is 8/27, since

\[
 \frac8{27}-2c(1-c)^2
     =2(c-1/3)^2(4/3-c)\ge0.
\]

For k>=2,

\[
 (k-1)-c\{k-1+2(1-c)^2\}
       =(1-c)\{k-1-2c(1-c)\}\ge0.
\]

Equality is attained by retaining X and k-1 of the Y coordinates. This
proves (2). The k=0 case is simply zero. This is a complete written proof;
the univariate maximum identity is additionally checked in exact arithmetic.

**Precise implication.** No bounded number of original linear Gaussian
coordinates captures a fixed positive fraction of the L² energy of q_m as
m tends to infinity. This holds even though X is a heavy coordinate:
E|partial_X q_m|²=1. The residual variance does not disappear after retaining X.

Moreover, by the elementary real CLT,

\[
 (X,q_m)\ \Longrightarrow\ (X,XG),\qquad G\sim N(0,1)
\]

with X and G independent. The conditional mean of XG given X is zero, but

\[
 E[|XG|^2\mid X]=|X|^2,\qquad E[(XG)^2\mid X]=X^2.
\]

Thus it cannot, as a joint law with X, be replaced by a function of X plus
an independent proper Gaussian: conditional means would force that function
to vanish, whereas the conditional variance would have to be constant and
the conditional pseudo-variance zero. Exact finite-m witnesses are

\[
 E[(|X|^2-1)|q_m|^2]=1,\qquad E[\overline X^2 q_m^2]=2.
\]

**What is not ruled out.** This is an obstruction to conditioning onto a
bounded original-coordinate subspace in L², and to the particular joint
Gaussian replacement just described. It does not rule out approximation in
distribution on newly introduced Gaussian coordinates. Indeed the limit XG
has just two primitive factors, of original chaos weights 1 and 2. Nor does
it rule out extracting X while retaining its quadratic coefficient as an
additional random object. That is exactly the kind of object the main
content-law theorem retains.

The content of the limiting XG is zero in the original X direction for every
admissible profile, by symmetry G -> -G. The finite q_m usually has nonzero
content, and the quantitative bound in `PROOFS.md` controls its approach to
zero while chi(q_m)=4+12/m stays bounded away from zero.
