# Coupled-image continuation: a certified architecture obstruction and a concrete lower-side target

23 October 2026. Work performed only in the isolated worktree on
`codex/research-audit-20261023`; the shared main checkout was not used or
modified. This continues the earlier fresh-eyes assessment rather than
replacing its literature review and repository audit.
Integration note: this research is now rebased onto GitHub master. The
maintained dependency and Lean coverage summary is `docs/RESEARCH_AUDIT.md`.

**There is no new global Grothendieck endpoint.** The strongest completed
result is an exact obstruction for a substantial upper-rounding class.
On the lower side, we now have complete negative response images, a useful
analytic smoothing bound, and reproducible finite-model experiments. The
remaining difficulty is a uniform estimate over realizable tensors and
outer image pairs, not optimization of another scalar pseudo-law.

## Integration at master `6a869c8`

The new [genuine finite Gaussian construction](../../../docs/GENUINE_CUBIC_DIAGNOSIS_2026-10-23.md)
has payoff above `.71329>500/701` at `epsilon=149/200`, so this unchanged
witness's reciprocal method cannot reach `1.401955`, let alone `1.402`.
The [dimension-uniform cubic-family ratio](../../../docs/CUBIC_FAMILY_CEILING_2026-10-23.md)
is below `1.4022581233` for every complex multiplier. These are one-sided
architecture obstructions, not exact cubic optima or upper bounds on the
Grothendieck constant. Gaussian realization, projection closure and directed
Arb integrals are external proofs; the new Lean cubic modules formalize
conditional arithmetic and generic implications. The fixed-image calculations
below remain mechanism tests, not a route around that valid adversary.

Upstream's full-coordinate joint-fibre certificate gives a cap `.713261364`
and common-fibre-deficit plus selected-cost loss above `.000093136` at one
saved law/contact. It is not uniform over laws, contacts or actual tensors;
new common-Stein cuts also exclude old law 7234. More fields alone do not
solve this: a free common projector can simultaneously project every field
onto `q`, and raw conditional fields cannot replace their actual cubic
projections in a subtracted gate cost. Our complete `Qu`/`Pv` formulas use
actual projections and remain compatible with that warning. The exact
`U(m)` model also retains the same Gaussian `G` in `q_m` and the remote radius;
its finite bridge is stronger for that family than a marginal Gaussian
approximation. Our total-variation transfer still applies only to its stated
finite buffer and whole-buffer-independent coefficient tests, not to all
conditional projection fields. No global endpoint changes.

## 1. What has actually changed

For arbitrary finite or countable convex mixtures of

\[
C(t)=\Phi_{\rm phys}[p](t)K(t),
\]

where \(p\) is any **complex odd Wiener contraction**, \(K\) is any
**complex even Wiener contraction**, and \(\Phi_{\rm phys}[p]\) denotes the
physical complex Gaussian phase kernel, we prove

\[
D(C):=|c_1|-\sum_{j\ge1}|c_{2j+1}|
<0.711916311229984<0.711947.
\]

This pays every residual coefficient. It allows nonlinear scalar
preprocessing, two different bounded neutral response maps, separate
auxiliary preprocessors, and convex mixtures. It closes an important
qualification of the previous raw-score obstruction, although the new
theorem concerns a separable pure-phase subclass and does not subsume every
radially coupled response from the old theorem.

The incumbent conditional rounding score is approximately
\(0.711947153313209\), so this class cannot improve it. The conclusion is
about the stated rounding architecture; taking the reciprocal of its
ceiling does not produce a lower bound for the Grothendieck constant.

The repository's endpoint status is unchanged: lower
\(1.401695322458\) under `NodeCaps`, upper \(1.404598635371\) under
the concrete `fresh_upper_rounder`'s `compare`, `energy_close`, `hardy`
inputs (with an `L²` charge-one truncation), and the existing unconditional
formal upper \(1.40578\). The generic table-level `DirectHyps` interface
still exists; its structural fields are proved for the concrete rounder.
The earlier conditional upper assembly refinement and local rank-one
improvements retain their own premises. None of this continuation removes
those premises or completes the missing global lower cover.

## 2. Why the new upper certificate works

Use the shared finite linear functional

\[
L(C)=c_1+\lambda_3c_3+\lambda_5c_5+\lambda_7c_7,
\quad
(\lambda_3,\lambda_5,\lambda_7)
=10^{-9}(-606121006,-272015495,-762296131).
\]

Because \(|\lambda_j|\le1\), the reverse triangle inequality gives
\(D(C)\le|L(C)|\). A shared absolute price bound, rather than a separate
residual bound for each component, is what makes mixtures controllable.

Write \(p=at+bt^3+ct^5+dt^7+\cdots\). Only these four coefficients enter
\(L(\phi\circ p)\). After removing the factor \(\pi/4\), the phase series
begins \(t+t^3/8+3t^5/64+25t^7/1024\). The resulting polynomial is linear
in \(c,d\). On \(|a|+|b|+|c|+|d|\le1\), its maximum therefore reduces to
16 signed two-variable patches. Exact rational Bernstein subdivision proves
the normalized price is at most \(0.90644\): **67 accepted rectangles,
maximum depth 9**. Odd symmetry proves the absolute bound.

For \(K=k_0+E\), the remainder \(E\) starts in degree two. Only the phase
head through degree five can enter \(L(\phi(p)E)\). Its Wiener norm is at
most \((\pi/4)(75/64)\), while

\[
\frac{75}{64}\max|\lambda_j|=0.893315778515625<0.90644.
\]

Thus \(|L(\phi(p)K)|\le(\pi/4)0.90644\). Triangle inequality passes this
to every convex mixture. The exact checker also encloses \(\pi\) using
Machin's identity and rational alternating sums; the displayed decimal
ceiling is rounded upward.

The proof and independent checker are in
`preprocess/MIXTURE_PREPROCESSOR_OBSTRUCTION.md` and
`tools/coupled_preprocess_mixture_certificate.py`. The checker independently
reconstructs the truncated composition, prices every patch, and fails if
subdivision depth is exhausted. It imports no discovery optimizer.

The polynomial argument just described first handles real \(p\). A second
exact argument extends it to arbitrary complex coefficients, using the
**physical** composition
\(\Phi_{\rm phys}[p]=(\pi/4)p\sum a_k(p p^\sharp)^k\), where
\(p^\sharp\) is coefficientwise conjugation. This is not holomorphic
substitution into \(\phi\) when \(p\) is complex. Rotate the first
coefficient to \(a\ge0\), write \(b=x+iy\), and put \(r=|b|\). After
eliminating the next two coefficients by a norm bound, the price modulus is
maximized at real \(b=-r\). The exact squared comparison factors as
\((r+x)G\), and the proof gives

\[
G\ge a\frac{34254220103996142329}{64000000000000000000}\ge0.
\]

This reduces the complex price to an already certified real patch. The
companion `COMPLEX_PREPROCESSOR_EXTENSION.md` and
`coupled_preprocess_complex_certificate.py` derive the physical coefficients
and verify the factorization symbolically over rational polynomials. A
separate checker and audit independently reproduce that reduction. The
neutral-multiplier and mixture arguments then apply unchanged.

The physical Gaussian corollary needs the **entire charged pair** independent
of the **entire auxiliary pair**, including cross-side covariances. Neutral
auxiliaries must actually have charge zero; sign-evenness alone is
insufficient. Hermite orthogonality and Cauchy–Schwarz then give
\(\|K\|_W\le\|S\|_2\|T\|_2\le1\) for two different bounded neutral maps.
Radial dependence on the charged coordinate, charged–auxiliary cross
covariances, and replacing pure phase by a more general charged response
remain outside this product theorem.

The phase covariance and inverse-series background are classical; see
[Haagerup's original paper](https://www.isibang.ac.in/~soumyashant/misc/collected-works-of-haagerup/1980s/1987_A_new_upper_bound_for_the_complex_Grothendieck_constant.pdf)
and [Friedland–Lim–Zhang, Sections 2–4](https://arxiv.org/html/1711.10595v2).
The finite functional and multiplier argument above are derived in this
checkpoint; no historical priority claim is made.

A companion inverse argument proves phase-only optimal-score equivalence for
the stated **self-response reciprocal-affine neutral filters**
`[1+A_j(1-R_j)]^-1` and their Gaussian Wiener limits, with separate real
channel preprocessors. Its degree-seven inverse prefix gives the slightly
stronger unmixed ceiling \(D<0.711900642946\). The upstream opposite-chirp
closure uses different response maps and need not have this filter form;
only its pure-phase-base instances are covered by our broader
\(D<0.711916311229984\) product-class ceiling. Applying that closure to an
arbitrary realizable charged base remains outside both claims. The inverse
equivalence alone does not exclude cancellation across mixtures, which is
why the shared functional matters.

## 3. The lower attack must retain actual response images

Put \(T=P-\varepsilon Q\), with \(P\) the first-chaos projection and
\(Q\) the charge-one cubic projection, and take \(\varepsilon=149/200\).
For \(u=(f+g)/2,v=(f-g)/2\), the two disk constraints are
\(|u+v|,|u-v|\le1\). The paired objective is

\[
J=\|Pu\|^2+\varepsilon\|Qv\|^2
-\varepsilon\|Qu\|^2-\|Pv\|^2.
\]

For positive images \(p,q\), define

\[
\Phi_{p,q}(a,b)=\varepsilon\|a\|^2+\|b\|^2+
\mathbb E|p-\varepsilon a+\varepsilon q-b|
+\mathbb E|p-\varepsilon a-\varepsilon q+b|.
\]

The exact norm is
\(M=\sup_{p,q}\{\inf_{a,b}\Phi_{p,q}(a,b)-\|p\|^2-
\varepsilon\|q\|^2\}\). At an exposed phase pair, the closure residual

\[
R=\varepsilon\|a-Qu\|^2+\|b-Pv\|^2
\]

is an **upper bound** on the fixed inner dual error. It is not a
guaranteed decrement. Nor is a cap at one fixed outer pair a global upper
bound on \(M\). These direction checks prevent two tempting but invalid
ways to promote numerical progress to an endpoint.

This canonical dual and quadratic-majorizer descent already appear in the
repository's `attack-20261022/NOTES.md`, lines 79–117. We reconstructed and
audited them; we do not claim to have invented that framework. The more
concrete continuation is the complete finite-amplitude negative image.
For a remote cubic \(q(X)\), with \(Z\) independent and
\(f,g=\operatorname{phase}(L(Z)\pm s q(X))\), set

\[
A=\mathbb E_Z[\overline Z u],\quad
B=\mathbb E_Z[Z u],\quad C=\mathbb E_Z[v].
\]

Then exactly

\[
Qu=hH_{21}(Z)+Z\Pi_{11}A+\overline Z\Pi_{20}B,
\qquad Pv=\Pi_{10}C.
\]

These are orthogonal sectors of the same actual response. A scalar radial
law does not currently carry these projection fields. They must not be
replaced by unrelated marginal completions. Explicit beta-integral profiles
and global Taylor bounds are available for **linear** \(L=\ell Z\); their
constants have not been transferred to the actual radial-cubic visible
polynomial.

## 4. A useful analytic buffer bound

The globally valid quadratic majorizer has a smoothing allowance involving

\[
g_\eta(r)=\frac{(\sqrt{r^2+\eta^2}-r)^2}{2\sqrt{r^2+\eta^2}}.
\]

Its plane integral is exactly \(\pi\eta^3/3\). If each actual image is
conditionally \(m+\sigma W\), with \(W\) a proper standard complex
Gaussian, density domination gives
\(G_\eta\le2\eta^3/(3\sigma^2)\). Also
\(\mathbb E_W|m+\sigma W|^{-1}\le\sqrt\pi/\sigma\), uniformly in the
conditional mean. For update directions independent of \(W\), the curvature
is bounded by the diagonal weights

\[
\varepsilon+K\varepsilon^2,\quad1+K,
\qquad K=\sqrt\pi/\sigma.
\]

This replaces integration of a potentially singular full curvature matrix
by certification of a small closure gradient. The resulting correction is
quadratic in that gradient minus the explicit cubic smoothing allowance.
For these genuinely independent Gaussian buffers the unregularized
inverse-modulus expectation is finite, so one may also take \(\eta=0\)
and remove the allowance entirely. This needs the same independence of the
chosen update directions.
We also derive finite-cubic buffer analogues using
\(R_m=(2m)^{-1/2}\sum X_j^2\overline{Y_j}\) and exact Gamma inverse moments.

The scope matters: arbitrary updates need not preserve conditional proper
Gaussianity, and directions depending on the buffer need weighted moment
bounds. The paper spells out these restrictions. These constants are not
being asserted uniformly for all cubic images.

There is also a quantitative finite-cubic transfer. Conditional on its
holomorphic buffer coordinates, \(R_m\) is Gaussian with variance \(V_m\),
where \(\mathbb EV_m=1\) and \(\operatorname{Var}V_m=5/m\).
Cancellation of the first-order density error gives

\[
\|\operatorname{Law}(R_m)-\operatorname{CN}(0,1)\|_{L^1}
\le\delta_m:=\min\{2,2\sqrt{5/m},35/m\}.
\]

For a unit-\(L^2\) coefficient test independent of the entire buffer, the
coefficient error is at most \(\delta_m\). Thus a **certified** fixed-trial
diffuse coefficient \(a_{C,\infty}\le-\ell_0\) would give the explicit
actual finite-cubic dual correction

\[
\frac{\varepsilon^2[\ell_0-\delta_m]_+^2}
{\varepsilon+\varepsilon^2K_m},
\qquad
K_m=\frac{\sqrt{2\pi}\,m}{\sigma(m-1)}.
\]

The proof uses a fixed visible trial and a signed update, not an assumption
that its finite-cubic optimum equals the diffuse optimum. For scale, a
future directed bound \(\ell_0\ge0.006\), at the fixture variance below,
would yield about \(1.87\times10^{-6}\) with \(m=100000\). This is an
illustration of the conditional transfer, not a claimed certified numerical
correction. The density bound and its exact rational moment checks are in
`pair/REMOTE_HARD_FIELD.md` and the pair checker.

## 5. What the droplet experiments establish

The code solves the convex negative-image problem in a closed graded model:
ordinary \(Z,X\), an independent grade-three Gaussian limit \(W\), and every
charge-one mode of original degree one and three allowed by parity. This
includes all three negative cubic coordinates and the negative first-chaos
coordinate, not just the visible \(H_{21}(Z)\).

The first refined run uses \(2^{19}\) fit samples and a separate
\(2^{21}\) evaluation net. Relative to optimizing only the visible negative
cubic coefficient, the extra negative-image minimization lowers the
independently evaluated fixed dual by approximately:

- Gaussian control: \(-1.5\times10^{-9}\), consistent with zero.
- Remote mixture with \(\kappa=0.325\): \(3.58\times10^{-5}\).
- Remote mixture with \(\kappa=0.5\): \(1.43\times10^{-4}\).
- Visible-coupled and mixed examples: \(7.39\times10^{-4}\) to
  \(1.19\times10^{-3}\).

These differences show the missing fields have practical strength on actual
fixed non-Gaussian examples. They do **not** show a uniform bound on the hard
relaxation. Positive-image defects are often much larger in the visibly
coupled cases, so those gains cannot simply be subtracted from the existing
global cap.

For normalized
\(\kappa H_{21}(X)+\sqrt{1-\kappa^2}W\), the fourth excess is exactly
\(42\kappa^4\). Thus \(\kappa=0.325\) corresponds to square-root defect
\(0.684528236\), just outside the earlier hard interval
\([0.651,0.666]\). A separately calibrated case targets square-root defect
\(0.66\); it should not be conflated with the first test.
Matching that defect coordinate does not realize a binding relaxed radial
law, and does not show that this particular tensor family is globally hard.

An independent refined run with midpoint Sobol cells reproduces the
\(\kappa=0.325\) correction at \(3.63\times10^{-5}\), and gives
\(3.42\times10^{-5}\) at square-root defect \(0.66\). The Gaussian control
again changes by only about \(10^{-9}\). A preceding seed-three run hit an
exact zero in the digital net and produced nonfinite inverse-normal values;
it was rejected. The sampler now uses 52-bit cell midpoints, checks every
normal sample for finiteness and refuses nonfinite JSON. Earlier saved
seed-one/two data were also checked for nonfinite values.

All numerical integrals here are discovery. Held-out nets, optimizer closure
and exact algebraic identities do not supply Gaussian integration errors.
The analytic diagonal-buffer step also still uses a sampled gradient.
The independent grade-three Gaussian is a graded limit; a finite-cubic
coefficient transfer is now available once a directed sign interval is
certified. A uniform tensor argument and outer cover remain necessary for a
global lower certificate.

Conditioning out \(W\) analytically reduces the hard-defect family to two
exponential radii and one relative angle. At orders \((32,32,64)\),
\((64,64,128)\) and \((128,128,256)\), the fully optimized extra fixed-dual
correction is respectively approximately \(3.3564991\), \(3.3563513\) and
\(3.3563457\), in units of \(10^{-5}\). The missing quadratic coefficient
stabilizes near \(-0.00639397\). The analytic unregularized diagonal step
predicts \(4.1689\times10^{-6}\) using the numerical gradient; direct
quadrature of that step gives \(7.8122\times10^{-6}\). These deterministic
values clarify the QMC sampling error; none supplies a directed enclosure.
Large-argument scaled Bessel evaluation needed a floating asymptotic
fallback after a high-order optimizer trial was safely rejected as
nonfinite. The final source and data record that evaluation rule.

## 6. Adapted attack order

1. **Lower:** certify a nonzero coupled closure gradient at a calibrated
   hard-defect fixture using the actual radial-cubic \(L\), conditional
   Gaussian integration and the analytic diagonal buffer bound. This is a
   small, concrete integration problem before any global claim.
2. Establish a relation between the complete projection fields and their
   curvature cost over a useful family of actual remote tensors. It must
   vanish correctly at the Gaussian contact. A fourth moment alone is
   unlikely to provide all the needed joint information.
3. Extend to a uniform outer-image cover or a proved tensor reduction.
   Finite fixed-image improvements and finite-jump tests cannot replace it.
4. **Upper:** prioritize coupled radial/charged responses and cross-channel
   covariance mechanisms outside the proved product class. More independent
   neutral filters within the certified class cannot help.

The finite-jump companion provides zero-safe coefficient-closure tests for
near maximizers without assuming attainment. Its exact four-point example
shows a positive finite jump despite a nonnegative local phase Hessian. It
is a diagnostic example, not a Gaussian witness. Its value is to identify
the consistency information a future uniform cover must retain.

The archive contains proof notes, exact checkers, discovery data, independent
audits and replay instructions. The integration adds Lean core majorizer
and semiconvex coverage, with its exact scope listed in
`docs/RESEARCH_AUDIT.md`; no endpoint declaration changes. The progress is a
certified exclusion and a narrower, testable
lower-side obligation, not an improved decimal bound.
