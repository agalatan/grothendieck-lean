# Joint responses, original-noise replicas, and a priced full-tail screen

Worktree: `/Users/alingalatan/workspaces/grothe-codex-joint-image`.
Branch: `codex/joint-response-delivery-20261023`.
Baseline: `98f61ec`; the earlier attack was preserved at `313f2af`.
The main checkout was left unchanged because its pending files have mixed ownership.
Claude alone integrates master. Neither endpoint is changed by this work.

The written proof is
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/symmetric-response-replicas-20261023.tex`.
It is a standalone compilable article. The scope distinctions below are essential.

## What the new reduction proves

The genuine symmetric-square cubic used in the frozen-table obstruction is

\[
 q_m=\frac{\sum_iX_i^2\bar Y_{ii}+\sqrt2\sum_{i<j}X_iX_j\bar Y_{ij}}
 {\sqrt{m(m+1)}},\qquad d=m(m+1)/2.
\]

The tensor family itself was already known. The new application retains its
joint response fields and its **original** Gaussian noise law.

For the action `X -> U X`, `Y -> Sym²(U)Y`, the entire invariant first/cubic
image consists of five orthonormal modes:

\[
 Z,\quad Z(|Z|^2-2)/\sqrt2,\quad ZA_X,\quad ZA_Y,\quad q_m,
\]

where `A_X=(norm(X)^2-m)/sqrt(m)` and
`A_Y=(norm(Y)^2-d)/sqrt(d)`. This gives an exact two-sided best-response map
**within that symmetry class**. The proof does not average arbitrary maximizers
into invariant responses and does not reduce the unrestricted operator norm
to five modes.

The complete one-point tuple is represented using six real uniforms by

\[
 q_m=RG/\sqrt{m(m+1)},\quad A_X=(R-m)/\sqrt m,
 \quad A_Y=(|G|^2+V-d)/\sqrt d,
\]

with independent proper `Z,G`, `R~Gamma(m,1)`, and `V~Gamma(d-1,1)`.
In particular the two quadratic projection costs cannot be discarded, and
`A_Y` cannot be sampled independently of `q_m`.

More substantially, the full two-replica tuple under original Gaussian noise
has an exact representation using **twenty real uniforms, independent of m**.
Two 2-by-2 Wishart states and two common projected Y-coordinate pairs retain
both quadratic drivers and the cubic's original covariance. This determines
the actual physical kernel of every pair of these phase responses, including
all higher chaos levels. It is not a Gaussian-buffer assumption.

The invariant classification and the Gaussian conditioning are paper proofs.
The exact one-point verifier checks all 25 Gram entries and the shared
quadratic correlations through the eighth moment, and rejects two incorrect
independence/grade surrogates.

## A marginal Gaussian limit can have the wrong noise grade

The original cubic has `E[q_m conj(q_m')] = rho^3`. Keeping the correct radius
noise but independently giving the scalar G first-chaos correlation produces
instead `(m*rho+rho^3)/(m+1)`. The exact gap is

\[
 \frac{m\rho(1-\rho^2)}{m+1}>0\quad(0<\rho<1).
\]

For `m=128`, `rho=1/2`, that erroneous model gives `171/344` instead of `1/8`:
the gap is `16/43`. It approaches an order-one error as m grows, even though
the one-point cubic law approaches a proper Gaussian. A one-point law is
therefore insufficient to transport a lower adversary into an upper rounding.
The covariance formulas are direct Gaussian calculations; the gap algebra
and strictness are Lean theorems.

This complements the distributional-limit viewpoint of
[Herry–Malicet–Poly](https://arxiv.org/abs/2412.06749); the noise-grade conclusion
here follows from our explicit replica calculation, not from an inference
that a Gaussian limit is first chaos.

## A small noise-price certificate screens the entire omitted tail

Write `c_k=Re <P_{k+1,k}f,P_{k+1,k}g>`, using conjugate-reflected
symmetrization if real coefficients are required. Put

\[
 R_i=K(\rho_i)-c_0\rho_i-c_1\rho_i^3,\qquad
 T=\sum_{k\ge2}|c_k|.
\]

The physical kernel gives `|R_i| <= rho_i^5 T`. Therefore, for
`|s| <= 1` and `sum |a_i| rho_i^5 <= 1`,

\[
 D(c)=c_0-|c_1|-T\le c_0-sc_1-\sum_i a_iR_i.
\]

The right side is affine in response columns. A common price bounds **every
mixture of a fixed pool** by its largest priced column. This is a necessary
upper screen on a pool's full achievable score, never a lower bound on that
score. Passing the screen proves no rounding construction.

The prices also give an admissible witness at every chaos index:
`lambda_0=1`, `lambda_1=-s`, and
`lambda_k=-sum a_i rho_i^(2k+1)` for `k>=2`. All-index admissibility is proved
in Lean; a finite scan is unnecessary. This makes the feedback step concrete:
attack that witness for a missing response, then return its full kernel to the
pool. The witness's global norm remains unknown.

This higher-degree noise-channel witness does **not** inherit the cubic
operator's five-mode image closure. The subsequent search within five-mode
phase functions is a restricted adversary search; a true best-response oracle
for the new operator must retain its nonpolynomial noise images.

If all `c0,c1,K(rho_i)` are enclosed within errors `e0,e1,ei`, add

\[
 e_0+|s|e_1+\sum_i|a_i|(e_i+\rho_i e_0+\rho_i^3e_1)
\]

to the priced midpoint for each column. This is the exact remaining numerical
obligation; variation between random scrambles is not an enclosure.

## Discovery results and their limits

All costly searches ran in this task's own directory on `ssh yo`:
`/home/agalatan/grothe-cx/codex/joint-image-compatibility-20261023`.

Ten original cubic-witness response fits used `m=4,16,128` and selected
epsilons `0.745,0.7564,0.77,0.8`. Both shared quadratic modes and complex
coefficients were retained. The six initial fits additionally underwent
two-sided alternating updates. The float searches fixed the nonzero visible
linear coefficient to one and bounded the other real/imaginary parameters in
`[-3,3]`. No global norm cap or parameter-space optimum was inferred.

Representative independent two-branch payoff estimates are `0.71325684` at
`m=128, epsilon=0.745`, and `0.71306025` at `m=128, epsilon=0.7564`.
These are **floating discovery estimates**, not certified lower adversaries
or improved Grothendieck bounds. The largest holdout basis-Gram discrepancy
was about `0.003305`; this is a calibration warning, not an integral error bar.
The original-noise cross-Gram controls were checked at `rho=0,0.5,0.9,1` for
`m=4,128`; their maximum discrepancy was about `0.002787`.

The full-kernel pool screen used eight columns (`m=16,128`, four epsilons)
plus the analytic Gaussian-phase baseline. Its midpoint relaxation is about
`0.711590572`, below the incumbent reciprocal score
`355973694404074991/500000000000000000 = 0.711947388808149982`.
Adding the Gaussian-phase baseline did not change the screen. This diagnoses
the tested finite pool; it is not a statement about all invariant responses.

The price was rationalized with an exact all-index budget. The standard-library
replay proves the midpoint algebra and rejects an invalid price and an
understated midpoint bound. To turn the numerical diagnosis into a rigorous
pool exclusion would require enclosing every input `c0,c1,K(rho_i)` within
`0.00003385889598`. Such enclosures have **not** been established here.

The price-induced witness was then attacked, and two resulting response columns
were sent back through the original-noise kernel screen. Training reported
`0.715877` and `0.719016`; independent kernel evaluations reduced the means to
about `0.713213` and `0.717358`. The kernel-scramble spreads are about `0.000557`
and `0.000629`, respectively. Optimizer termination was not a stationarity
certificate (the recorded gradients can be large near phase zeros). These
payoffs concern the **new noise-price witness**, not the incumbent cubic.

This apparent adversary has a simpler rigorous explanation. The explicit pairs
`phase(Z+q_m/sqrt(3))`, `phase(Z-q_m/sqrt(3))` have the limiting physical kernel

\[
 H((3\rho-\rho^3)/4),\qquad
 c_0=3\pi/16,\quad c_1=-101\pi/2048.
\]

The full joint Gaussian limit follows from the common replica coordinates;
it retains third-chaos noise correlation `rho^3`. The low coefficients converge
as well: the uniform Parseval absolute-coefficient bound controls the real-axis
remainders in their extraction. Thus the finite priced payoffs converge, without
assuming a new admissible Gaussian buffer.

The standard-library verifier encloses the limiting priced payoff at
`0.7169925532763968... > 7169/10000`, with enclosure width below `10^-25`.
It uses Machin's identity with alternating rational remainders for pi and the
positive Haagerup series with an explicit geometric tail at arguments at most
`1/2`. Consequently the global norm of this **particular price-induced witness**
is greater than `0.7169`, already on limits of genuine finite cubic responses.
Sufficiently large finite m give the same strict obstruction. This is a written
analytic proof plus exact computational replay; the Gaussian limit and phase
application are not Lean formalized. It is not a counterexample to Conjecture K
and says nothing adverse about the incumbent cubic cap.

The analytic baseline is a classical cubic preprocessor of Gaussian phase
rounding. Its rediscovery is a reason to improve the oracle, not to claim a new
rounding principle. Future prices must be tested against this parametric
baseline before expensive optimization. The expanded pool now retains this
baseline and the independently evaluated adversary columns.

For upper-pool use, the limiting column has a closure qualification. Smooth
both finite responses by original Gaussian noise of parameter `sqrt(eta)`.
Their mixed coefficients gain `eta^(2k+1)`, so the uniform absolute-mass bound
and coefficient convergence at each fixed index imply l1 convergence for fixed
`eta<1`. Letting eta tend to one afterwards gives the limiting column in the l1
closure of actual bounded-response columns. No uniform unsmoothed phase-tail
claim is made, and this argument certifies no quantitative finite dimension.

With those additions, the twelve-column necessary screen rises to approximately
`0.712036018`, above the incumbent full score. It no longer excludes the expanded
pool. This is **an upper relaxation value**, not an achieved score: the omitted
signed coefficients have not been recovered, and no full-tail construction or
error enclosure establishes an improvement. The finite prices and all input
column definitions are preserved for the next iteration.

The incumbent is retained separately through its existing kernel enclosure:
under the documented `DirectHyps`, slope `7119483103461/10^13` and absolute
coefficient residual `460768975009/(5*10^17)`. Every admissible price evaluates
it within that residual of the slope. It must not be replaced by an exactly
linear fictitious response column. A priced bound on a candidate pool also
bounds its mixtures with the incumbent by the maximum of that bound and
`slope+residual`. This keeps the current construction in the same error ledger.

## Formalization and integration

`/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/LowerAnalytic/ReplicaState.lean`
contains seven replica/gap theorems.
`/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Upper/KernelScreen.lean`
contains four all-index/tail/price theorems. Both are imported by the library
root and all eleven are required by the axiom-audit configuration.

Both affected targets compile. The separate report
`/Users/alingalatan/workspaces/grothe-codex-joint-image/scratch/AxiomsReplica.lean`
reports only `propext`, `Classical.choice`, and `Quot.sound` for every new
theorem. No new axiom or numerical native fact was added.

At commit `f4b9db4` the global audit was configured for 232 entries. A new full-library build and
232-entry audit were **not** run in this worktree; the earlier 221-entry
full-library check belongs to the pre-migration checkpoint documented in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/WORKTREE_HANDOFF_2026-10-23.md`.
The manuscript section compiles. These results add no hypothesis to either
existing endpoint.

The continuation in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/CUBIC_PHASE_SEPARATOR_2026-10-23.md`
adds common signed-tail prices and an architecture separator, extending the
configured audit to 247 entries before integration. The GitHub-master rebase
brings the combined report to 372 entries and preserves master's stronger
concrete upper-rounding theorem. This preceding report retains its historical
eleven-theorem validation scope; all added modules are rechecked during integration.

## Reproducible files

The small discovery records, exact replay logs, and new-module axiom report are
tracked under
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/symmetric-response-20261023/`.
Its `REPLAY.md` separates the inexpensive exact checks from the droplet-only
discovery commands, and its `SHA256SUMS` pins the proof and checker sources as
well as the saved records. The old common-Stein proof package remains at
`/Users/alingalatan/workspaces/grothe-codex-joint-image/deliveries/grothendieck-common-stein-reassessment-20261023.zip`.
