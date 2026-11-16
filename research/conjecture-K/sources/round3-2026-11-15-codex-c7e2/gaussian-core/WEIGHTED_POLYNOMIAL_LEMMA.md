<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/gaussian-core/WEIGHTED_POLYNOMIAL_LEMMA.md, 15 November 2026; relayed by the user from codex-c7e2. -->
<!-- codex-c7e2-round3/gaussian-core/WEIGHTED_POLYNOMIAL_LEMMA.md; Agent-ID: codex-c7e2. -->
# An explicit inverse-radius bound preserving shared lower-chaos fields

**Status: proved analytically; scalar bounds certified by exact arithmetic.**

Let Y consist of m independent standard complex Gaussian coordinates,
S=||Y||², m≥2, and let P be any real or complex polynomial of total real
degree at most three. Its coefficients may depend measurably on independent
additional variables. Then

\[
E[S^{-3/2}|P|^2]\le \frac{\Gamma(m-3/2)}{\Gamma(m)}
\lambda_m E|P|^2,
\qquad
\lambda_m=1+\frac{3}{8m}
+\sqrt{\frac{9}{64m^2}+\frac{9}{4m}}.
\tag{1}
\]

To prove (1), use the ordinary spherical-harmonic decomposition in R^(2m).
Degree at most three has angular degrees k=0,1,2,3. Angular orthogonality
is unchanged by a radial weight. The radial measure in the k-th component
is proportional to the Gamma(m+k,1) measure.

For k=0, in the orthonormal radial basis 1,(S−m)/√m, division by
E S^(−3/2) gives the weighted Gram matrix

\[
\begin{pmatrix}1&-3/(2\sqrt m)\\
-3/(2\sqrt m)&1+3/(4m)\end{pmatrix}.
\]

Its largest eigenvalue is λ_m. For k=1, the two-dimensional radial matrix
is (m−3/2)/m times the same matrix with m replaced by m+1. Since λ_m
decreases with m, its largest eigenvalue is at most λ_m. The remaining
k=2,3 components are one-dimensional, with eigenvalue
(m−3/2)_k/(m)_k<1. This proves (1), including vector-valued coefficients
by summing the scalar inequalities. Conditional application proves the
claim with independent additional variables.

Now let U be a second independent m-dimensional complex Gaussian block,
and set

\[
R=\frac{u}{m^2}\|Y\|^2\|U\|^2,\qquad
C_m=m^3\left(\frac{\Gamma(m-3/2)}{\Gamma(m)}\right)^2.
\]

Successive applications of (1), first to Y and then to U, give

\[
\boxed{E[R^{-3/2}|P|^2]
\le u^{-3/2} C_m\lambda_m^2 E|P|^2.}\tag{2}
\]

This holds when P depends on both blocks in any way compatible with its
degree bound; independence between P and R is not assumed.

For m=16, exact arithmetic using π<22/7 gives

\[
C_{16}<\frac{32}{25},\qquad \lambda_{16}<\frac75,
\qquad C_{16}\lambda_{16}^2<\frac{1568}{625}.
\tag{3}
\]

The closed rational expression multiplying π is

\[
C_m=\pi m^3\left(
\frac{(2m-4)!}{4^{m-2}(m-2)!(m-1)!}\right)^2.
\]

These inequalities are checked by `check_weighted_polynomial.mjs`.
This lemma concerns polynomial integration and is not itself the odd-sector
theorem. Its use in that theorem must also check the conditional Gaussian
representation, parity, and the degree of every product to which (2) is
applied.
