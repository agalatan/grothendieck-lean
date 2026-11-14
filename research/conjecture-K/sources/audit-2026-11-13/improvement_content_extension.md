<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_content_extension.md (file dated 2026-11-13). Only this line was added. -->
# A dimension-free extension from a symmetric core to mixed cubic shells

Agent ID: codex-a713, 2026-11-13. This is an independently derived analytic lemma at the peak row. It is genuine partial progress on the mixed-shell content problem. It does **not** establish Conjecture K, its A+B assembly, or a new Grothendieck endpoint.

## The proved statement

Use the peak row a=699/1250, b=179/1250. Write G(z)=z g(|z|²), F(q)=E phi(|q|²), C(q)=||Pi_{1,0}G(q)||₂, B(u)=E phi(u Exp(1)), and D(q)=B(||q||₂²)−F(q).

Split the remote Gaussian coordinates into two orthogonal blocks X,Y. Rotate every coordinate in X by a common phase exp(i theta), leaving Y fixed. Let p,h belong to the full Wick chaos H_{2,1}, with

* p transforming by exp(i theta),
* h a sum of the other circle characters (its charge-one component for this circle is zero),
* u=||p+h||₂²≤463/10000.

Put e=||h||₂², D₀=D(p). Assume the two explicit core hypotheses

\[
D_0>0,\qquad C(p)^2\le\frac9{40}D_0.
\]

Then the following is **proved here**, in every dimension:

\[
\boxed{\quad e\le\frac3{500}D_0
\quad\Longrightarrow\quad C(p+h)^2\le\frac6{25}D(p+h).\quad}
\]

More generally, the proof gives the quantitative inequalities

\[
D(p+h)\ge D_0-\frac7{10}e,
\]

\[
C(p+h)^2\le C(p)^2+(1+10C(p))e.
\]

Thus any sharper core constant or core-deficit lower bound transfers directly into a larger explicitly quantified neighborhood. This is not a claim that the known family bounds compose with arbitrary remainders of unrestricted energy.

## Why this includes the previously unhandled mixed shells

For a one-coordinate block X, the charge-one part of an arbitrary cubic is exactly

\[
p=X\{c(|X|^2-2)+P(Y)\},\qquad P(Y)=Y^*AY-\operatorname{tr}A,
\]

with c and A complex. The other characters are precisely

\[
h=\bar X B(Y)+(|X|^2-1)V(Y)+X^2\overline{W(Y)}+R(Y).
\]

The functions B,V,W,R have the indicated pure Wick bidegrees. Every term in this remainder is allowed, with arbitrary coefficients and dependencies through Y. The core and remainder are orthogonal, so ||p+h||²=||p||²+e exactly.

The supplied record claims C(p)²≤9D(p)/40 for this core when its Wick share is at least 4/5, and claims 11/50 for the c=0 core. Those pre-existing certificate statements remain inputs: this note does not re-certify their integral tables. The new assertion is the rigorous implication from a core inequality to a nonzero, arbitrary mixture of the other characters. It also applies to a larger coordinate block whenever a core theorem is available there.

## Proof of the symmetry and perturbation estimates

Let c₀=Pi_{1,0}G(p). Rotation covariance G(e^{i theta}z)=e^{i theta}G(z) shows that c₀ is supported only on the X-coordinate block. Circle averaging gives

\[
E[D\{\phi(|\cdot|^2)\}(p)h]=0,
\qquad
\langle c_0,\Pi_{1,0}(DG(p)h)\rangle=0.
\]

For the second identity, let ell=c₀/||c₀|| when c₀ is nonzero. It is a normalized holomorphic Gaussian linear form in X. The scalar pairing is E[conj(ell) DG(p)h]. For a remainder character k, the two real-linear derivative terms have circle characters k and 2−k; after multiplication by conj(ell), their characters are k−1 and 1−k. Both average to zero because k≠1. This proves exact cancellation without assuming independence between the core and remainder.

The scalar bounds proved below are

\[
\|DG\|_{\mathrm{op},\infty}\le1,
\quad\|D^2G\|_{\mathrm{op},\infty}\le5,
\quad\phi'(0)\le8/5,
\quad B'(v)\ge9/10\quad(0\le v\le.0463).
\]

The planar function z↦phi(|z|²)=2E|L+z| is convex. Its Hessian eigenvalues are 2phi'(v) and 2phi'(v)+4vphi''(v), so its Hessian is at most 2phi'(0) times the identity because phi' is decreasing. Taylor's theorem and the first cancellation imply

\[
F(p+h)\le F(p)+\frac85e.
\]

Integrating B' between ||p||² and ||p||²+e proves D(p+h)≥D₀−7e/10.

Projection contraction and the Lipschitz bound give

\[
\|\Pi_1G(p+h)-c_0\|_2^2\le e.
\]

The second cancellation and the Hessian bound imply

\[
|\langle c_0,\Pi_1G(p+h)-c_0\rangle|
\le\frac52\|c_0\|_2 E[|\ell||h|^2].
\]

For a normalized Gaussian linear form ell and any h in H_{2,1}, creation and annihilation in an orthonormal complex Hermite basis give

\[
E[|\ell|^2|h|^2]
=\|h\|_2^2+\|\partial_\ell h\|_2^2+\|\bar\partial_\ell h\|_2^2
\le4e.
\]

Cauchy–Schwarz therefore gives E[|ell||h|²]≤2e. Expanding the squared norm of c₀ plus its increment proves

\[
C(p+h)^2\le C(p)^2+(1+10C(p))e.
\]

Since F(p)≥phi(0) by convexity and the circular law of L, while B(v)≤phi(0)+(8/5)v, the core assumption implies

\[
C(p)^2\le\frac9{40}\frac85\frac{463}{10000}
=\frac{4167}{250000}<\left(\frac{13}{100}\right)^2.
\]

Consequently

\[
C(p+h)^2-\frac6{25}D(p+h)
\le-\frac3{200}D_0+\left(1+\frac{13}{10}+\frac6{25}\frac7{10}\right)e
=-\frac3{200}D_0+\frac{617}{250}e.
\]

The coefficient 617/250 is less than 5/2. Substitution of e≤3D₀/500 finishes the proof, with a strict reserve unless D₀=0.

## The scalar bounds are analytic, not assumed numerical maxima

Let k=−g. The positive-mixture representation k(v)=∫exp(−tv)nu(dt), nu≥0, follows as follows. Put H(s)=s(a+bs)² and let h=H^{-1}. The derivative h'=1/[(a+bh)(a+3bh)] is completely monotone by derivative induction; hence h is a Bernstein function. The function

\[
b_1(v)=e^{-h(v)}/(a+bh(v))^2
\]

is completely monotone by the same induction, and has a positive Laplace measure mu. Exponential integration by parts and the change r²=H(s) express the weighted norm potential P_A(v)=E[(T−1)|L+sqrt(v)|] as

\[
P_A(v)=\int\mu(dt)\int_0^\infty r^2e^{-tr^2}A_r(r,\sqrt v)\,dr.
\]

The inner integral is −d/dt E|Z_t+sqrt(v)|, where Z_t is complex Gaussian of variance 1/t. The Gaussian heat equation, followed by the elementary Laplace integral for the reciprocal norm, gives

\[
P_A(v)=\frac{\sqrt\pi}{4}\int t^{-3/2}
 e^{-tv/2}I_0(tv/2)\,\mu(dt).
\]

The Bessel factor equals the average of exp(−tv cos² theta), a positive Laplace mixture. Thus P_A is completely monotone and k=−2P_A' has the required positive measure. This re-derives the mechanism recorded in [the legacy shared-nongaussian chapter](/Users/alingalatan/workspaces/grothe/handoff/manuscript/legacy/ch34-gpt-shared-nongaussian.tex:608); positivity is not inferred from plots.

Write M₀=k(0), M₁=−k'(0). The exact formula

\[
M_0=(1+a/b)\int_0^\infty\frac{e^{-s^2}}{a+bs^2}\,ds-\frac{\sqrt\pi}{2b}
\]

and the global inequality 1/(1+x)≤1−x+x² yield

\[
M_0\le\frac{\sqrt\pi}{4a}
\left(1+\frac b{2a}+\frac{3b^2}{2a^2}\right)<1.
\]

For completeness, differentiating the smooth push-forward density of the signed measure (T−1)dP gives a nonsingular formula for M₁:

\[
M_1=\frac18\int_0^\infty\frac{e^{-t}}{\sqrt t(a+bt)}
\left[\frac{2-t}{K(t)}-\frac{(t-1)K'(t)}{K(t)^2}\right]dt,
\quad K(t)=(a+bt)(a+3bt).
\]

One derivation is to apply the planar Laplacian twice to the convolution of |z| with the signed radial density, move derivatives to that smooth density, and integrate by parts. Using K≥a², K'=4ab+6b²t, 2−t≤2+t and |t−1|≤t+1 gives

\[
M_1\le\frac{\sqrt\pi(5a^2+12ab+15b^2)}{16a^5}<6.
\]

For the atom f_t(z)=z exp(−t|z|²), its derivative has operator norm at most one. Its Hessian has operator norm at most 2sqrt(t). To check the latter explicitly, take a real unit increment, x=t|z|² and y the squared cosine with z. The squared Hessian norm divided by t is

\[
e^{-2x}x\{4+16(2-x)y+16x(x-2)y^2\}.
\]

Maximizing the quadratic over 0≤y≤1 gives 4x(3−2x)²exp(−2x) for x≤1/2, 8exp(−2x) for 1/2≤x≤2, and an endpoint maximum for x≥2. These are all at most four. For the first region use exp(2x)≥1+2x+2x²+4x³/3; the difference from x(3−2x)² is positive on [0,1/2]. Its cubic Bernstein coefficients after subdividing at x=1/4 are, after multiplying by three, (3,5/4,3/8,1/4) and (1/4,1/8,3/4,2). For x≥2 the larger crude bound 16x³exp(−2x) is at most 128exp(−4)<4. The middle region follows from e>2.

Integrating the atom bounds and using Cauchy–Schwarz for nu gives

\[
\|DG\|_\infty\le M_0<1,
\qquad\|D^2G\|_\infty\le2\int\sqrt t\,d\nu
\le2\sqrt{M_0M_1}<2\sqrt6<5.
\]

Also phi'(0)≤sqrt(pi)/(2a)<8/5. The same Bernstein inversion of H shows that L is a proper Gaussian scale mixture sqrt(V)W. The elementary identity for the norm as a positive Laplace integral yields

\[
\phi(v)=\frac1{\sqrt\pi}\int_0^\infty t^{-3/2}
\left[1-E\left\{\frac{\exp[-tv/(1+tV)]}{1+tV}\right\}\right]dt.
\]

Its differentiated integrands have alternating signs; in particular phi'≥0 and phi''≤0, as used above. Also B(v)=sqrt(pi)E sqrt(V+v), EV=E|L|²=a²+4ab+6b². Jensen gives

\[
B'(v)\ge\frac{\sqrt\pi}{2\sqrt{EV+v}}>9/10,
\]

because EV+.0463<.81. All numerical comparisons in these proofs use rational inequalities and sqrt(pi)<1773/1000, pi>314/100; they do not depend on floating quadrature.

Exact arithmetic checker: [improvement_content_constants.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_content_constants.py). Output: [improvement_content_constants.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_content_constants.json). Its separate floating check M₁≈2.159180864970275 is a diagnostic only; the proof uses M₁<6.

## What remains and why this is not the requested endpoint improvement

The lemma closes a dimension-free neighborhood containing arbitrary off-character tensors, conditional on a certified core inequality and the explicit scalar deficit test e≤3D(p)/500. It does not force a general cubic to be close to such a core. Nor does it supply the stronger .10 content inequality, a finite-amplitude A+B cost, or the missing odd-sector assembly. A numerical optimizer repeatedly finding tensors in this neighborhood does not prove that all other tensors are harmless.

For an explicit core p the only new scalar activation premise is D(p)≥500e/3; its known one-driver reductions can be used to certify this. A useful subsequent refinement would sharpen the global Hessian bound 5 or use the actual C(p) and B' instead of uniform estimates, but neither numerical sharpening alone nor this local extension changes the global Grothendieck lower bound.
