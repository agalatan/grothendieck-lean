# Grothendieck research assessment and first attack results

23 October 2026. Research snapshot originally assessed at `98f61ec`.
Working branch: `codex/research-audit-20261023`, in the isolated
`work/grothe-rankone` checkout. The current integration is rebased onto
GitHub master; see `docs/RESEARCH_AUDIT.md` for the maintained status.
Historical build counts and archived proof snippets below describe their
original snapshots, not a build of the rebased tree. The shared main checkout
was not used for this integration.

## Integration at master `6a869c8`

The newer [cubic-family certificate](../../../docs/CUBIC_FAMILY_CEILING_2026-10-23.md)
turns the earlier numerical warning into a rigorous one-sided method ceiling:
the dimension-uniform `P10-z P21` architecture has vector/scalar ratio
strictly below `1.4022581233` for every complex `z`. It does not determine the
optimal cubic ratio or bound the Grothendieck constant from above. More
restrictively, an actual finite Gaussian pair at `epsilon=149/200` has payoff
above `.71329>500/701`, limiting that unchanged witness's reciprocal method
to below `1.401955`. A `1.402` campaign must therefore retune epsilon or change
the witness; stronger valid response constraints cannot remove this pair.
The Gaussian realization/projection argument and directed Arb integrals are
external proofs. `ScalarCubicFamilyCeiling` and `DiffuseCubicObstruction`
formalize generic implications and arithmetic conditional on those inputs.

The local rank-one certificate below remains valid. The new joint-fibre
certificate bounds the selected-cost model at law 7234 and one exact contact
by `.713261364`, with joint deficit above `.000093136`; this is not uniform
over laws or contacts. New common-Stein cuts also exclude that old law, so its
earlier countermodel status concerns its recorded cut bank. Projection costs
must use the actual Gaussian-projected conditional fields. A free common
projector can collapse every retained field to the `q` line, and replacing
those projections by raw conditional fields is an invalid strengthening.
See the [joint-fibre scope](../../../docs/JOINT_FIBRE_EXPERIMENT_2026-10-23.md).
The historical findings below retain their original scopes; no endpoint changes.

## Assessment

The project has a substantial mathematical and formal foundation. The lower
proof is much further developed than a numerical moment optimization: the
Gaussian witness, finite-matrix transfer, row reduction, tensor identities and
finite cover are connected in Lean. The upper proof also retains an actual
verified kernel-head computation. The principal obstacle is now the cost of
describing the same bounded responses through all these reductions.

The next substantial lower improvement needs joint response compatibility.
More precision in the existing scalar relaxation cannot supply the missing
information. Higher-degree witnesses will also be needed to approach the
upper end of the interval. On the upper side, the meaningful search objective
is the full residual score, including signed cancellation and infinite tails;
the alternating boundary functional is only a screening bound after its
preprocessing domain has been maximized correctly.

This pass produced a small conditional upper refinement, a useful new
interpolation theorem for the rank-one lower attack, and stronger auditable
Gram-completion tools. It did not prove the all-dimensional lower target or
discharge the remaining external analytic hypotheses.

## 1. What the repository currently establishes

The existing sharp interval is

\[
 1.401695322458<K_G^{\mathbb C}<1.404598635371.
\]

Its two sides are conditional Lean implications, with different assumptions.

**Lower.** The witness is
\(T=P_{1,0}-(149/200)P_{2,1}\), with scalar cap
\(B_0=0.7134218\). The theorem
`Grothe.LowerAnalytic.lower_bound_of_nodeCaps` assumes `NodeCaps`: the
nineteen explicitly defined fibre potentials lie below their stored rational
caps at the required nodes. The witness, its vector value tending to one, the
finite-partition transfer, moment and contraction identities, and assembly of
the finite certificate are proved. The current cover has 8,756 boxes, 351
mixed node certificates, and 21 batches. The external source-potential caps
remain an assumption of the headline theorem.
Upstream has since added the separate `GrotheCaps` target and the
`CapsRest` route for rows 12–15. Its 60 heavy range checks are outside the
default target, and no verification stamp was recorded at the integration
base. Their source/theorem interfaces do not establish a completed full cap
verification by themselves. The scalar data and cover are unchanged.

**Upper.** `Grothe.fresh_upper` concludes the exact bound

\[
 K_G^{\mathbb C}\le
 \frac{500000000000000000}{355973576656604491}.
\]

The generic table theorem assumes `DirectHyps E EX`. Upstream now also
provides `Grothe.UpperChaos.fresh_upper_rounder` for the concrete `GT`:
validity, summability, parity and disk-valuedness are proved. For a
charge-one truncation `X` in `L²`, the remaining numerical hypotheses are
`compare`, `energy_close` and `hardy`. The phase cover proves `phiT² ≤ 3`;
it does not prove the stronger estimates needed in the external comparison.
The finite head through degree 501 is
computed by the verified checker from 21,168 exact dyadic entries. The old
comparison allowance is \(1.065637497\times10^{-6}\), about 88.71% of the
total residual allowance. This percentage measures the certificate budget,
not the fraction of the entire gap to the conjectured value that it can remove.

**Unconditional formal result.** `Grothe.haagerup_bound` proves
\(K_G^{\mathbb C}\le1.40578\) with no additional analytic hypothesis.
Formalizing the remaining node caps and three upper numerical inputs is
valuable closure work, but does not
by itself improve their numerical endpoints.

These conclusions were checked against the actual theorem interfaces and the
then-current theorem interfaces, rather than older manuscript headlines.
The upper summary above has been updated against the new actual interfaces.
The older structural-hypothesis wording noted in the original assessment has
also been corrected in the integrated `docs/LEAN_DETAILS.md`; the maintained
integration summary is `docs/RESEARCH_AUDIT.md`.
At the original assessment, a whole-library build passed: **9,052 jobs**, with a linter
warning in the concurrently updated `ResponseGram` module. The final axiom
audit passed for **204 theorems**, using exactly the three existing pinned
native facts. The isolated upper implication uses the existing head-check
native fact; the six new semiconvex arithmetic lemmas use only standard axioms.
Those historical counts do not certify the current branch. The current
integration's checks are recorded in `docs/RESEARCH_AUDIT.md`.

## 2. Why the lower bound has become difficult

For \(h=(f+g)/2\), \(k=(f-g)/2\), the exact objective is

\[
 J=\|Ph\|_2^2-\varepsilon\|Qh\|_2^2
       -\|Pk\|_2^2+\varepsilon\|Qk\|_2^2,
 \qquad P=P_{1,0},\ Q=P_{2,1}.
\]

The same pair obeys \(|h\pm k|\le1\); for phase responses,
\(|h|^2+|k|^2=1\) and \(\operatorname{Re}(\bar h k)=0\).
These are joint constraints. Marginal moment laws, independent projection
budgets and separately maximized rows can admit data that no pair realizes.

The current reduction loses information at several different steps:

1. The fibre supremum forgets which section of the response generated its
   value, although it retains the two-disc geometry inside that supremum.
2. A mixture of separate row suprema lets different rows choose different
   maximizing sections. Averaging the original matrices and couplings before
   the supremum can recover part of this loss.
3. Completion of the h-side and pinned gate squares leaves nonnegative
   remainders whose actual values are subsequently discarded. Their old
   mixture savings cannot be counted again.
4. A scalar law satisfying moments and finitely many Stein cuts need not be
   the law of a cubic with the same projection fields and bounded responses.

The existing exact binding audit is strong evidence that these distinctions
matter. I replayed all four supplied atomic witnesses with the independent
rational verifier. They satisfy 671 finite cut inequalities, and have scores
approximately 0.713412812508, 0.713414640743, 0.713406413946 and
0.713352277645. All exceed \(500/701\).

Their conclusion is narrow: the **fixed tables, profiles and finite cut bank**
cannot certify below those feasible primal values at those parameter points.
They are not actual Gaussian cubic responses, counterexamples to Conjecture K,
or lower bounds on every reoptimized certificate. They also do not transfer
automatically from \(\varepsilon=149/200\) to \(1891/2500\).

The newest shared-tree response lift now retains a common residual Gram
\(0\preceq K\preceq V\), gives an image-based near-maximizer interface,
and supplies an exact local two-disc support checker. Its tested completion
family still admits the benchmark configurations. The recorded common-row
savings are only about \(3\times10^{-7}\) to \(2.4\times10^{-6}\) on the four
audited laws. That is a useful negative result: finer clipping or more of the
same features is not currently justified as the main direction.

The remaining target is compatibility of the **two actual polynomial images**
\(Tf,Tg\) and their remote first-chaos coefficient maps. Arbitrary polynomials
or arbitrary Gram completions are still an outer relaxation. The exact local
support problem being finite does not make the global image-state cover finite
or inexpensive.

## 3. The scale of the desired improvement

At the current cap, reducing B by \(\Delta B\) improves its reciprocal by
approximately \(1.965\Delta B\). The rank-one attack's predicted gain of
\(8\)--\(9\times10^{-6}\) in B is therefore useful, but small relative to
the 0.002903312913 interval width.

For the proposed new witness parameter \(\varepsilon=1891/2500\), the design
target is

\[
 N(P-\varepsilon Q)\le0.713260
   <\frac{500}{701}=0.7132667617689\ldots.
\]

That would prove a lower bound above 1.402. It requires a complete certificate
at that parameter, including the flanks. The old \(149/200\) certificate and
its measured gains cannot simply be relabeled.

The previously numerical cubic warning now has the rigorous one-sided
interpretation described in the integration note: the dimension-uniform
linear-minus-cubic architecture cannot pass `1.4022581233`, for any complex
multiplier. This leaves at least 80.6% of the audited interval beyond that
architecture; it does not prove that the ceiling is attainable. At the old
`149/200` multiplier, the stronger fixed-witness obstruction applies.

The stronger chirp obstructions in the manuscript have paper proofs and exact
supporting computations: degree at most five cannot give a lower bound above
1.4036705, and degree at most seven cannot exceed 1.4044895. There is an
important distinction: **degree seven may still certify 1.404**, whereas
approaching \(1/\gamma^\dagger\approx1.404575934\) requires degree at least
nine within this Hermite witness architecture.

Higher degree cannot be handled by independent copies of each residual. A
single remote cubic driver also generates its degree-five companions through
the visible coordinate. The existing numerical experiments show a large loss
when these are treated independently. A credible extension must preserve this
shared driver, the common phase field and the negative projection costs.

## 4. Corrections to the requested attack analysis

I read the requested `attack-20261022/attack_analysis.tex` in full. Its
description of the actual transfer and much of its numerical failure analysis
is useful. Several conclusions are stronger than the evidence permits.

**The boundary-value ceiling regressed.** The valid inequality is

\[
 D(c)=c_0-\sum_{k\ge1}|c_k|
 \le\left|\sum_{k\ge0}(-1)^k c_k\right|.
\]

The inference that preprocessing cannot increase the raw endpoint value is
false. The manuscript already corrects it in `ch1-problem.tex` and
`ch17-crossbound.tex`. The attack note nevertheless asserts a universal
\(\max W(b_1,b_2)=W(1,1)\).

A particularly simple same-map, charge-one, conjugation-symmetric example is
\(f(z,w)=\operatorname{phase}(z)e^{-|w|^2}\). Its alternating functional has
the form

\[
 W(b_1,b_2)=\frac{A_{\rm phase}(b_1)}{4+b_2^2}.
\]

Consequently \(W(1,0)=\gamma^\dagger/4\) exceeds
\(W(1,1)=\gamma^\dagger/5\), and suppressing that channel is admissible.
This does not refute a properly maximized numerical ceiling for the particular
master rounder. It refutes using its raw boundary value as a general theorem.
The safe ceiling maximizes over the full allowed scalar, diagonal or matrix
covariance domain. Relative Hermite phases are needed for matrix preprocessing;
the diagonal energy table alone does not determine them.

**One-coordinate optimality remains unproved.** Sixty starts and a converged
grid are evidence about that discretization and objective. They do not prove
a global variational inequality. Moreover the tested quadratic problem
\(\langle f,\Gamma f\rangle\) does not automatically bound all bilinear
one-coordinate pairs \(\operatorname{Re}\langle f,\Gamma g\rangle\).

**The vortex family is an opportunity, not an exhaustive necessity.** Its
observed alternating gain is overwhelmed by the full-score sign loss. This
supports optimizing a master-like family for D. It does not prove that every
improvement must use a vortex of size 0.02–0.03, or that all possible remaining
room is bounded by the observed \(3\)--\(5\times10^{-6}\) increase in W.

**The lower rank-one gain remains exploratory.** Its algebra is promising, but
the modified source-potential caps, scale interpolation and complete box cover
were not present in the old endpoint. A floating whole-cover prediction is not
a certified endpoint. The interpolation obstruction is addressed in the next
section; the other obligations remain.

**Do not extrapolate a model's closure.** The degree-seven pool experiment
already fell below a proved obstruction because it omitted nonlinear driver
directions. Agreement between two restricted optimizers cannot repair that
omission. A pool value needs both a global oracle error and a signed omitted
coefficient-tail bound before it narrows the reciprocal interval.

Two smaller explanatory corrections also belong in the overview. The complex
identity \(|a+b|+|a-b|=2\max(|a|,|b|)\) is false: take a=1, b=i.
It is valid after real projection; phase averaging gives the correct factor
of \(\pi\) for jointly circular pairs. Also the tensor-norm formulation uses
\(\pi/\gamma_2\) on finite \(\ell_\infty\) tensors, or dually
\(\gamma_2^*/\varepsilon\) on \(\ell_1\) tensors. It is not a universal
\(\pi/\varepsilon\) comparison on \(\ell_\infty\otimes\ell_\infty\).

## 5. New lower result: a quadratic chord for the rank-one test

The old attack identifies nonconvexity of the new scale potential as a
certificate-design obstacle. There is an explicit semiconvex correction.

Freeze one source row or a specified common-row mixture and an admissible
rank-one test vector w. In the physical residual variable r put

\[
 F(r,f)=\Psi(\delta r;-vf)+df^2+2crf,
 \qquad v=Ew,\quad d=w^{\mathsf T}Ew>0.
\]

Here c is the coefficient from the common pinned completion, not a separately
averaged row coefficient. The shifted potential is jointly convex in its
affine scale and shift. Completing the square gives

\[
 F(r,f)+\frac{c^2}{d}r^2
 =\Psi(\delta r;-vf)+d\left(f+\frac cd r\right)^2.
\]

The right side is jointly convex. Partial minimization over a fixed convex
domain of profile values therefore shows that the optimized potential
\(g(r)=\inf_f F(r,f)\) has \(g(r)+(c^2/d)r^2\) convex.

More usefully, optimal profiles are unnecessary. Choose any certified radial
tests at scale endpoints a and b, and interpolate their test values at the
same \(\sqrt U\). For \(a\le\tau\le b\), joint convexity and
\(\mathbb EU=1\) give

\[
 \mathbb EF(\tau\sqrt U,f_\tau(\sqrt U))
 \le\operatorname{chord}_{a,b}
       \bigl(\mathbb EF(a\sqrt U,f_a),
             \mathbb EF(b\sqrt U,f_b)\bigr)
       +\frac{c^2}{d}(\tau-a)(b-\tau).
\]

This is a valid certificate for every admissible law. It does not assert
semiconvexity for an arbitrary frozen piecewise-linear profile.
The \(\delta\) factors cancel when using the physical \(\tau\) variable.

The new exact checker reconstructs nine archived row/mixture choices from
current source profiles. All fifteen principal minors of every rank-one L10
matrix are nonnegative over exact rationals. It also proves
\(c^2/d\le207/1000\) for those nine choices. Thus a scale interval of width
\(1/500\) incurs at most

\[
 \frac{207}{1000}\frac{(1/500)^2}{4}
 =\frac{207}{10^9}=2.07\times10^{-7}.
\]

The old gate expression remains quadratic: replace
\(-D\tau^2\) by \(-(D+A)\tau^2+A(a+b)\tau-Aab\), where A=c²/d.
The same idea applies to source-radius interpolation by convexifying the
nodal caps with Ar² and then subtracting Ar². Each source and scale allowance
must be accounted for in its actual use.

This removes a specific obstacle to certifying the predicted rank-one gain.
It does not evaluate the shifted Gaussian potentials, prove their endpoint
caps, or rebuild the full cover. The nine tested common rows also do not
automatically cover every independently mixed choice in the master certificate.

Proof, exact ledger, source hashes and isolated Lean arithmetic lemmas are in
the bundle under `lower/SEMICONVEX_CHORD.md`, `semiconvex-ledger.json` and
`SemiconvexChord.lean`.

## 6. New upper result: a smaller comparison allowance

An archived joint-prefix certificate contains a stronger comparison estimate
for the **same** phase and frozen polynomial truncation. The new replay binds
the phase coefficients, rounder parameters, current preprocessors and all
21,168 stored Lean energy entries to the local source data. It checks twenty
rational square-root gates, fourteen Hilbert–Schmidt unions and three
completion-of-squares duals; forty-eight coordinate caps are rebound to their
local source JSONs.

For the actual polynomial rounder \(T=F_0P_3(\varphi)\), the exponential
Taylor remainder is absent. Reassembling its three truncation errors with the
joint-prefix prices gives the comparison cap

\[
 \sum_{n,m}|E[n,m]-E_X[n,m]|
 \le\frac{1017321032757}{10^{18}}
 =1.017321032757\times10^{-6}.
\]

Keeping the existing slope, native-checked head, energy error and Hardy tail
then gives the conditional implication

\[
 K_G^{\mathbb C}\le
 \frac{40000000000000000}{28477888065186929}
 =1.4045985400475813\ldots
 <1.404598540048.
\]

The gain over the current exact conditional endpoint is approximately
\(9.53234\times10^{-8}\). It is a real improvement of the finite budget
assembly, with the same rounder; it does not resolve the structural gap.

The provenance limit matters. The original moment JSON, two original
power-one rectangular-HS inputs, and coefficient-centre source JSON are absent
from the local archive, including the 95 ZIP indices searched. Their
enclosures survive in the archived certificates. The three rational moment
upper bounds are therefore explicitly retained as inherited input premises,
along with the Gaussian/HS analysis. This pass independently checks their
finite consequences; it does not regenerate those missing source integrations.

`ImprovedComparison.lean` states the new endpoint under `DirectHyps` and the
explicit stronger comparison premise. It retains the existing verified head
instead of replacing that computation with a `head_close` assumption. No
existing headline theorem or README has been changed by this audit.

## 7. Gram completion: a stronger extraction and an honest negative test

For the common feature tuple \((fA_i,gB_j)\), complex-linearity of P yields
the full **Hermitian** interval \(0\preceq K\preceq V\), not merely its real
part. If a two-by-two residual Gram has diagonal a,b and off-diagonal v,

\[
 |2\operatorname{Re}K_{12}-\operatorname{Re}v|
 \le\sqrt{ab-(\operatorname{Im}v)^2}.
\]

This is sharper than the real-only radius \(\sqrt{ab}\), and is sharp for
abstract Hilbert Gram data. An exact rational fixture is accepted by the full
real completion SDP but excluded by this Hermitian interval. This is a
mathematical strengthening, not an actual binding Gaussian counterexample.

The empirical result is negative. On four base response benchmarks and three
enriched benchmarks, the real and Hermitian optimal minimum eigenvalues agree
within about \(9\times10^{-11}\); all tested states remain completable. These
are low-resolution discovery calculations, with independent fit and evaluation
grids, not numerical enclosures. Imaginary moments alone do not repair this
tested feature family's loss of remote coefficient information.

I also implemented a standard-library exact dual checker for arbitrary real
matrix completions. With H(K)=H0+epsilon offdiag(K), choose rational PSD Y,R
with trY=1 and R-Z PSD, where Z=epsilon offdiag(Y). Then

\[
 \operatorname{tr}(YH_0)+\operatorname{tr}(RV)=-\eta<0
 \quad\Longrightarrow\quad
 \lambda_{\min}(H(K))\le-\eta\quad\text{for every completion}.
\]

The checker includes singular PSD matrices, explicit operator-error allowances,
and deliberate-corruption rejection. Its exact four-feature fixture passes
all four coordinate-pair scalar screens but has joint optimum -839/2000.
A combined-direction scalar test can also detect that fixture; it is not
claimed to evade every rank-one direction. These tools make future SDP
separators auditable without trusting solver eigenvalues. They still require
certified moments and a global state cover before proving a norm cap.

## 8. Literature and supplied references

The public complex baseline was checked against Heilman–Jones–Malavolta,
*Sharper bounds for the complex Grothendieck constant*, which proves
\(1.4<K_G^{\mathbb C}<1.404898554746\), and Guo–Fang–Lu's earlier lower
bound. The repository's sharper values are its own conditional constructions.
[HJM](https://arxiv.org/abs/2609.25462),
[Guo–Fang–Lu](https://arxiv.org/abs/2609.07000).

The October primal/dual paper is about the **real** constant. Its exchange
method, graded limit viewpoint and separation of heuristic discovery from
certification are directly useful. Its real numerical endpoints and Boolean
arguments are not complex theorems. The manuscript supplies its own complex
charge-one duality argument. A new October Fourier-rounding paper likewise
treats the real constant; its cancellation-aware full-circle tail method is
worth testing when mixed signed tails become the dominant obstruction.
[Primal/Dual Method](https://arxiv.org/html/2610.10477v1),
[Certified Fourier rounding](https://arxiv.org/abs/2610.24417).

Jones's Gaussian regularity lemma supplies multivariate **graded**
compactification and joint approximation. Its general size bound is
nonconstructive. The paper explicitly does not verify the suggested
Ackermann-type quantitative rates. It does not justify replacing a shared
neutral real grade-two driver by an independent proper complex Gaussian, or
certifying a phase functional from marginal convergence alone.
[Theorems 3.8–3.9](https://arxiv.org/html/2610.16180v1).

Herry–Malicet–Poly explains why polynomial limit laws have a structured
Gaussian representation. It is a structural tool, not the missing uniform
response-cost inequality at this precision.
[Limit distributions for polynomials](https://arxiv.org/abs/2412.06749).

The supplied Pisier survey and Haagerup paper were read for the tensor-norm,
complex rounding and inverse-series framework. `Absolutely_Summing_Operators.pdf`
contains front matter and contents, rather than the full book. The Gaussian
Hilbert Spaces ZIP contains page images; the reference pass extracted the scans
and read/OCRed selected relevant contents and chaos material. It did not read
the entire book. The detailed literature note records pages, scope and source
limitations rather than treating absent book chapters as evidence.

One correction from the Haagerup attachment is especially relevant to the
attack note: the inverse-phase coefficient sign theorem is proved in the
paper, not merely checked to finite order. Its first coefficient is 4/pi;
the displayed inverse beginning with 1 uses the normalized phase kernel.

A useful written derivation from this pass makes a scalar-preprocessing limit
precise. For an absolutely summable charge-one radial kernel
\(\rho(z)=\sum c_kz|z|^{2k}\), its universal Hilbert factorization cost is
exactly \(\sum|c_k|\). The proof uses normalized complex spherical harmonic
expansions, finite-sample nuclear norms, the high-dimensional Jacobi limit and
an explicit signed-tail argument. Thus changing only the feature realization
of the same universal scalar kernel cannot improve its coefficient budget.
Finite dimension and matrix-dependent preprocessing remain different problems.
No novelty or new Grothendieck endpoint is claimed for this derivation.
[Complex-sphere background](https://arxiv.org/abs/1701.07214).

## 9. Revised work order

**Finish the inexpensive upper refinement.** Recover or regenerate the missing
moment and HS source enclosures, rerun the exact comparison assembly, and
integrate the stronger premise while retaining the existing native head.
The small endpoint gain should be presented with its inherited-input ledger.

**Certify the rank-one lower improvement at the current epsilon.** Freeze the
source profiles and rational w vectors. Generate directed endpoint caps for
the shifted potentials, use the quadratic chord allowance, rebuild the law
certificates and entire cover, and check the flanks and old cap-only boxes.
Optimize rows 15/16 only after the whole-cover bottleneck is measured. The
remaining task is substantial, but the interpolation lemma makes it more
concrete than another generic moment search.

**Use the failed matrix gate to select the next structural constraint.** Save
the surviving K matrices. Require a proposed feature or image-compatibility
condition to exclude or price those completions on a response near the
binding payoff. Retaining the actual remote first-chaos coefficient map,
finite-amplitude perturbations, and exact two-sided image compatibility are
better candidates than refining the already-inactive scalar reciprocal or
clipping tests. A global near-maximizer argument must retain its uniform error
and pass to a maximizing sequence; an attained all-dimensional maximum is not
available for free.

**Keep higher-degree discovery in parallel.** Use one response library for both
sides, retaining shared graded drivers, nonlinear driver modes and full signed
coefficient sequences. Calibrate each engine against the known degree-five and
degree-seven adversaries before trusting its optimum. A real response may
enter the upper pool; an atomic relaxation law may not. Every promising pool
must carry separate global-oracle and signed-tail error budgets.

**Keep formal closure separate.** Continue proving `NodeCaps` and the upper
analytic inputs. This protects the theorem's trust boundary. It should neither
be described as a numerical gain nor be allowed to replace the missing joint
geometry argument in the research plan.

The spherical transfer remains a sound global interface with useful exact
tail identities. Its enormous harmonic rank, finite-sphere outer loss and
non-Hilbert–Schmidt inverse rule out the proposed naive enumeration and
square-integrable-kernel shortcut. They do not rule out every invariant or
signed operator certificate. A symmetry-reduced norm inequality would need a
new concrete construction before this becomes the main numerical route.

## 10. Scope, files and replay

The baseline inventory contains **820 Markdown/TeX files, 683 distinct
contents, approximately 8.14 MB of distinct text**, excluding dependencies,
nested worktrees and this new reassessment. The requested attack analysis,
current repository docs, theorem interfaces and selected proof dependencies
were read closely. The team systematically inventoried and inspected the
broader archive, with exact duplicates recorded. This is **not** a claim to
have line-read or independently verified every one of the 683 distinct files.
The source-level coverage manifests make that limit explicit.

New additions are isolated under
`handoff/research-third-decimal/reassessment-20261023/` and the six new
`tools/reassessment_*.py` scripts. They do not overwrite the existing attack
plan, generated data, README, or other researchers' files. Because `handoff/`
is ignored by repository policy, the accompanying ZIP preserves the new notes,
Lean snippets, ledgers, source manifests and scripts together.

Core exact replays:

```sh
python3 -I tools/reassessment_semiconvex_lower.py
python3 -I tools/reassessment_comparison_upper.py
python3 -I tools/reassessment_completion_dual.py
python3 -I tools/reassessment_alternating_upper.py
python3 -I handoff/research-third-decimal/reassessment-20261023/lower/verify_complex_fixture.py
```

The new isolated Lean files deliberately distinguish paper analytic inputs
from arithmetic and finite assembly. Their compiler and axiom logs are included
in the bundle. The numerical complex-completion diagnostic is explicitly
exploratory and is not part of the exact certificate chain.
