<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/FULL_NEAR_GAUSSIAN_K.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- codex-c7e2-round2/FULL_NEAR_GAUSSIAN_K.md; Agent-ID: codex-c7e2. -->
# A dimension-uniform near-Gaussian theorem for full Conjecture K

15 November 2026. Baseline: `agalatan/grothendieck-lean` at
`6bb44599190397f806d2db89b25df4e6785b758e`.

This is an analytic partial theorem for the **whole cubic**, including every
visible sector and arbitrary sharing of remote coordinates. It is stronger
than a fixed-dimensional local theorem and stronger than a remote-only
statement. It does **not** prove Conjecture K outside a small fourth-excess
region. Its threshold is positive and dimension independent, but the final
threshold has not been evaluated numerically. The proof below uses explicit
finite tensor and Stein estimates; it does not rely on an unspecified
Edgeworth constant. No new Grothendieck endpoint or Lean formalization is
claimed.

## 1. Statement

Let P be a compact subset of `{(a,b): a>0, b>0}` and let M>0. For each
profile put

\[
L=Z(a+b|Z|^2),\qquad
\mathcal F(G)=\mathbb E|L+G|+\mathbb E|L-G|,
\qquad B(v)=2\mathbb E|L+\sqrt v W|,
\]

where W is an independent standard proper complex Gaussian. For a nonzero
finite-dimensional cubic G in H_(2,1), set

\[
U=\|G\|_2^2,\qquad
\Delta=\mathbb E|G|^4-2U^2,\qquad \chi(G)=\Delta/U^2.
\]

Let q be the remote projection of G, h=G-q, u=||q||_2^2,
V=||h||_2^2, and delta=E|q|^4-2u^2. Thus U=u+V.

**Theorem.** There are constants Delta_*>0, c_1>0, c_2>0 depending only
on P and M such that, in every finite dimension,

\[
\boxed{\quad
U\le M,\quad \Delta\le\Delta_*
\quad\Longrightarrow\quad
\mathcal F(G)\le B(U)-c_1\delta-c_2V.
\quad}\tag{1}
\]

In particular the full paired norm is dominated by the independent Gaussian
of the **same total variance**. The theorem does not require G to be remote,
does not require independent sector drivers, and does not impose a bound on
the number of Gaussian coordinates. The normalized condition
chi(G)<=Delta_*/M^2 is sufficient, but is not required by (1).

**Conjecture-K corollary, all amplitudes.** Fix p_0>0. There exists chi_*>0,
uniform over P and all prices p>=p_0, such that

\[
\boxed{\quad
\chi(G)\le\chi_*
\quad\Longrightarrow\quad
\Lambda_p(G):=\mathcal F(G)-p\|G\|_2^2
\le \sup_{v\ge0}\{B(v)-pv\}.
\quad}\tag{2}
\]

This covers the entire original profile box with one threshold: its
parameters satisfy a in [11/25,33/50], b in [3/25,4/25], and
p=1/epsilon>=25/19. The corner whose Gaussian optimizer is zero is included.
For every nonzero genuine finite cubic covered by (1), the comparison is
strict: either V>0 or q is nonzero and has positive fourth excess. The zero
cubic is handled directly.

## 2. Dimension-free projection bounds

The independent derivation in `review/PROJECTION_AND_COMPACTNESS.md` proves

\[
V\le\frac{\sqrt3}{2}\sqrt\Delta,
\qquad \delta\le\frac52\Delta.\tag{3}
\]

These follow from the real third-chaos identity

\[
\kappa_4(I_3(f))
=1296\|f\otimes_2f\|^2
 +1944\|\operatorname{Sym}(f\otimes_1f)\|^2,
\]

the rank-two visible influence, and positivity of the contraction Gram
operator under remote projection. Thus a small absolute fourth excess of
the whole cubic simultaneously forces a small visible energy and a small
remote fourth excess. No division by u is needed, so q=0 and the endpoint
u=0 cause no special difficulty.

## 3. Four analytic inputs

All constants below are uniform on P and the stated bounded variance
interval; none depends on dimension.

### 3.1 A strict remote deficit

`variational/EXPLICIT_SMOOTH_EDGEWORTH.md` proves the explicit real cubic
estimate

\[
\left|\mathbb Em(X)-\mathbb Em(N_{\mathbb EX^2})
-\frac{\kappa_4(X)}{24}\mathbb Em^{(4)}(N_{\mathbb EX^2})\right|
\le6\|m^{(6)}\|_\infty\kappa_4(X)^{3/2}.
\]

Its proof uses Gaussian integration by parts, the exact iterated Gamma
expansion, and a six-tensor contraction bound proved by a finite matching
argument. The finite coefficient enumeration is checked with exact integer
arithmetic. There is no unspecified asymptotic constant or sixth-moment cap.

Apply it to X=Re q and m(x)=pi E|Re L+x|. Circularity gives
kappa_4(X)=3delta/8 and the Gaussian heat equation gives
E m^(4)(N_(u/2))=16B''(u). Therefore

\[
\left|\mathcal F(q)-B(u)-\frac\delta4B''(u)\right|
\le C_R\delta^{3/2},\qquad
C_R=6(3/8)^{3/2}\|m^{(6)}\|_\infty.\tag{5}
\]

The same note supplies the elementary explicit bound

\[
\|m^{(6)}\|_\infty\le2\sqrt\pi\left[
\frac{76}{a^5}+\frac{1560b}{a^6}+\frac{14400b^2}{a^7}
+\frac{68040b^3}{a^8}+\frac{136080b^4}{a^9}\right].
\]

It follows by differentiating the conditional one-dimensional pushforward
x maps to x(a+b(x^2+y^2)); it is uniform on P and involves no inverse u.

The established Gaussian-mixture representation L=√R W_0 in law gives

\[
-B''(u)=\frac{\sqrt\pi}{4}\mathbb E(R+u)^{-3/2}
\ge\frac{\sqrt\pi}{4(\mathbb E|L|^2+M)^{3/2}},
\quad 0\le u\le M.
\]

Since E|L|^2=a^2+4ab+6b^2, take
d=sqrt(pi)/[32(max_P(a^2+4ab+6b^2)+M)^(3/2)]>0. The leading negative
term in (5) is at most -2d delta. Choose a uniform upper bound C_R on P
and set delta_R=[d/(C_R+1)]^2. Whenever delta<=delta_R,

\[
B(u)-\mathcal F(q)\ge d\delta.\tag{6}
\]

Thus (6) is an absolute-small-excess statement, valid uniformly at all
u in [0,M], including q=0. The stronger unbuffered-radius theorem from
round one is not needed for this proof.

### 3.2 A superlinear bound on the two first-variation contents

`remote/RAW_CONTENT_BOUND.md` proves

\[
\|c_A(q)\|_2^2\le K_A\delta^{3/2},\qquad
\|c_B(q)\|_2^2\le K_B\delta^{3/2}.\tag{7}
\]

The proof is a real cubic Ornstein--Uhlenbeck resolvent identity followed
by the exact circular phase average. Both weighted visible pushforward
densities are uniformly Schwartz, which supplies finite third-derivative
bounds. No numerical derivative estimate or unproved raw tensor bound is
used.

Visible parity makes the first variation vanish on Q,P,nu sectors. Hence,
with C=K_A+K_B, the whole first variation obeys

\[
|\ell_q(h)|\le2\sqrt C\,\delta^{3/4}\sqrt V.\tag{8}
\]

### 3.3 Uniform positive visible quadratic cost at the matched price

The [round-one Gaussian-core theorem](round1/all-sector/GAUSSIAN_LOCAL_STABILITY.md) proves strict positivity of every
visible quadratic cost at price B'(u), for every positive a,b and every
u>=0. Taking the minimum of these continuous matrices over P×[0,M]
gives a constant kappa>0.

`global/UNIFORM_NEAR_GAUSSIAN_COST.md` gives an absolute fourth-excess
cutoff delta_H>0, chosen with strict slack in its underlying estimate,
such that every remote q with 0<=u<=M and delta<=delta_H satisfies

\[
B'(u)V-
\frac12\mathbb E\{K(L+q)[h,h]+K(L-q)[h,h]\}
\ge\frac\kappa2V,\tag{9}
\]

where K(x)=D^2|x| and h is any visible cubic. The estimate is homogeneous
in h; no amplitude restriction on h is used in (9).

The uniformity is important. Vanishing remote fourth excess makes all
mixed contractions with normalized first/second-chaos coefficient fields
vanish. Their joint Stein identity implies that the limiting remote
Gaussian is independent of the whole finite coefficient vector, even
when that vector is not Gaussian. The singular Hessians are uniformly
integrable because L+q has planar density at most 1/(pi a^2), while cubic
hypercontractivity controls the coefficient moments. If u tends to zero,
q tends to zero in L2 and the same argument converges to the strictly
positive zero-buffer matrix. This handles compact variance intervals
including zero and compact positive profile sets.

### 3.4 A uniform finite-amplitude Taylor remainder

`variational/TAYLOR_REMOTE_BASE.md` gives

\[
\mathcal F(q+h)
\le\mathcal F(q)+\ell_q(h)
 +\frac12\mathbb E\{K(L+q)[h,h]+K(L-q)[h,h]\}
 +T_0 V^{5/4},\tag{10}
\]

with T_0=430(min_P a)^(-3/2). It holds for every remote q and arbitrary
shared sector drivers. The pointwise remainder is bounded by
|h|^(5/2)/|L+q|^(3/2); the visible change of variables and degree-two
coefficient hypercontractivity give the stated uniform integral bound.

## 4. Matching total variance

The scalar tangent error is quadratic in V, uniformly down to u=0.
Indeed the visible density at zero and its radial derivative give

\[
\mathbb E R^{-1}=a^{-2},\qquad
\mathbb E R^{-2}=a^{-4}(1+4b/a).
\]

Thus Cauchy--Schwarz implies

\[
\sup_{v\ge0}|B''(v)|
\le\frac{\sqrt\pi}{4a^3}\sqrt{1+4b/a}.
\]

Let J be a uniform upper bound on the right side over P. Then

\[
0\le B(u)+B'(u)V-B(u+V)\le\frac J2 V^2.\tag{11}
\]

Combining (6), (8)--(11) yields the key estimate

\[
\boxed{\quad
\mathcal F(G)-B(U)
\le-d\delta-\frac\kappa2V
 +2\sqrt C\,\delta^{3/4}\sqrt V
 +T_0V^{5/4}+\frac J2V^2.
\quad}\tag{12}
\]

It is essential to match U=u+V. Using the fixed price p directly in (9)
would be incorrect when p<B'(u).

Choose V_0>0 so small that

\[
T_0V_0^{1/4}+(J/2)V_0\le\kappa/8,
\]

and set delta_0=[d kappa/(16(C+1))]^2. Young's inequality gives

\[
2\sqrt C\delta^{3/4}\sqrt V
\le\frac\kappa8V+\frac{8C}{\kappa}\delta^{3/2}.
\]

Consequently, for V<=V_0 and delta<=delta_0,

\[
\mathcal F(G)-B(U)\le-\frac d2\delta-\frac\kappa4V.\tag{13}
\]

By (3), all hypotheses hold if Delta<=Delta_*, where any positive
Delta_* no larger than

\[
\min\left\{
\left(\frac{2V_0}{\sqrt3}\right)^2,\
\frac{2\delta_0}{5},\ \frac{2\delta_R}{5},\ \frac{2\delta_H}{5}
\right\}\tag{14}
\]

is sufficient. This proves (1), with c_1=d/2 and c_2=kappa/4.

## 5. Removing the energy restriction for Conjecture K

Apply (1) with M=p_0^(-2), and set chi_*=Delta_*/M^2. On a fixed unit
L2 direction H, the triangle
inequality gives |F(sH)-F(tH)|<=2|s-t|. If s>=t>=1/p, therefore,

\[
\Lambda_p(sH)-\Lambda_p(tH)
\le(s-t)[2-p(s+t)]\le0.
\]

For any nonzero G=sH, replace s by min(s,1/p). This preserves chi(G),
does not decrease Lambda_p, and makes its energy at most M=p_0^(-2).
Its absolute excess is then chi(G)U^2<=chi_*M^2=Delta_*.
The bounded-energy theorem and the definition of the Gaussian supremum
now prove (2) at every amplitude.

## 6. What this settles and what it does not

The argument excludes an entire dimension-independent neighborhood of the
Gaussian law for the **full** conjecture. In particular a hypothetical
sequence of counterexamples in growing dimensions cannot have normalized
fourth excess tending to zero. The retained functional is also bounded
there because it is no larger than the raw functional.

The explicit remote and decoupling estimates make every ingredient
quantitative in principle, but the Gaussian visible-cost minimum and its
kernel derivative bounds have not been numerically assembled into a final
cutoff. This theorem does not cover general cubics outside the stated
region, and does not reduce the remaining problem to
one or two Gaussian coordinates. Weighted Gaussian-product limits remain
possible outside the excluded cone. No global K or improved lower bound
is inferred from this theorem alone.
