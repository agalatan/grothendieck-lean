# From cubic ceilings to realizable, tail-priced response separation

23 October 2026. Continuation on `codex/quintic-projection-20261023`.
Repository history only; no other chats inspected. The main checkout and
`master` were untouched. Heavy experiments ran in this task's directory on
`ssh yo`. This report records a completed attack step, including its failures.

## 1. Diagnosis and proof status

The new conclusion is that **changing the witness helps against the old
adversaries, but neither a small phase family nor cancellation of two chaos
coordinates captures the remaining problem**. We derived the actual finite
fifth projection, certified its sign, built a genuine cancellation bank, and
tested a new oracle that prices a complete-tail constraint. No global
Grothendieck endpoint changes.

The repository's audited baseline remains:

* `1.401695322458 < K_G^C`: the default Lean target proves this under
  `NodeCaps`. The separate `GrotheCaps` target reduces the assumption to
  `CapsRest`: the remaining four rows' vertex caps and any excluded-node
  caps of the other rows. Its full heavy verification has no recorded stamp
  in the current tree.
* `K_G^C < 1.404598635371`: `Grothe.UpperChaos.fresh_upper_rounder`
  proves this for the concrete rounding, assuming an L² charge-one
  truncation `X` and the three numerical bounds `compare`, `energy_close`
  and `hardy`. The older table interface `Grothe.fresh_upper`, conditional
  on `DirectHyps E EX`, remains available.
* `K_G^C <= 1.405364`, the completed unconditional Lean upper theorem.

Those are distinct proof statuses. The current files and hypotheses take
precedence over older manuscript endpoints. Stronger archived upper numbers
have different external hypotheses and are not stronger unconditional Lean
theorems. The detailed endpoint audit, primary-source literature verification,
and analysis of both proof pipelines are in
[`REASSESSMENT_2026-10-23.md`](REASSESSMENT_2026-10-23.md). The present report
supersedes its numerical cubic-ceiling discussion and incorporates the
current formal proof boundary. No endpoint value changes.

Two quantitative facts determine the scale of the next work:

1. Actual finite responses already prove that the dimension-uniform
   `P10-z P21` witness architecture has vector/scalar ratio below
   **1.4022581233 for every complex z**. This is a method ceiling, not an
   upper bound on the constant. At least 80.6% of the audited interval lies
   above it. Cubic repricing and sharper certification cannot close that part.
2. The upper construction's slope is `.7119483545924`; its certified net
   score is `.711947153313208982`. Removing its entire residual allowance
   would improve the reciprocal by only about `2.37e-6`. A substantial upper
   improvement needs a better response family or signed coefficient balance.

Thus the lower obstruction is partly the witness itself; the upper
obstruction is chiefly the rounding geometry. The two share a feasible
correlation body, but this does not make their practical losses identical.

## 2. The actual fifth projection: what was missing from a naive lift

Let `Z`, `X in C^m`, and `Y in Sym^2(C^m)` be independent standard proper
complex Gaussians, `m>=2`, `d=m(m+1)/2`. Write `RX=||X||^2` and

\[
q_m={\sum_iX_i^2\bar Y_{ii}+\sqrt2\sum_{i<j}X_iX_j\bar Y_{ij}
       \over\sqrt{m(m+1)}},\qquad
G={\sqrt{m(m+1)}q_m\over RX}.
\]

Exactly, `RX~Gamma(m)`, `G~CN(0,1)`, `V~Gamma(d-1)` are independent,
and `RY=|G|^2+V`. Every bounded charge-one function `F(Z,G)` therefore
defines an actual finite Gaussian response. This is a deliberately chosen
inner family. It does not compress all responses or all cubic tensors.

The full `U(m)`-invariant `H_(3,2)` space has **13 dimensions**, and 10 at
`m=1`. In particular, one must retain remote radial sectors and the
dependence of `G` on `X,Y`. Assigning Gaussian degree one to `G` gives
the wrong actual projection. The representation count, explicit Wick bases,
and complete derivation are in
[`EXACT_QUINTIC_PROJECTION_2026-10-23.md`](EXACT_QUINTIC_PROJECTION_2026-10-23.md).

An exact conditional Mehler identity avoids a 13-by-13 Gram inversion.
For correlated original inputs with correlation `rho`, set
`a=<X,X'>/(||X||||X'||)`. Conditional on `X,X'`,

\[
E[\bar G G'\mid X,X']=\rho a^2.
\]

The square is the Veronese tensor overlap, not an independence
approximation. Expanding its exact angular moments gives, for
`F=phase(Z+c H21(Z)+bG)`, `H(Z,G)=F(Z,-G)`,

\[
s_{5,m}=v^2-\kappa^2(A^2+B^2)-A_4q^2+B_2n^2
               +h_N^2/d-C_2\ell^2+D_0z_{N,2}^2,
\]

where the eight moments are against orthonormal *local* Hermites,
`v=<H32(Z),F>`, `A=<(RZ-1)G,F>`, `B=<Z^2 barG/sqrt2,F>`, and

\[
\kappa^2={m\over m+1},\quad A_4={m\over(m+1)(m+2)},\quad
B_2={4(m-1)\over(m+1)(m+2)},
\]
\[
C_2={12m\over(m+1)(m+2)(m+3)},\qquad
D_0={24\over m(m+1)(m+2)(m+3)}.
\]

The companion moments are specified in the proof. Bessel's inequality
retains them rather than setting them to zero. For **arbitrary** bounded
charge-one `F,H` in this inner family the resulting bilinear bridge is

\[
|J_m-J_\infty|\le { |\epsilon|\over m+1}+{4|\gamma|\over m},
\quad T=P10-\epsilon P21+\gamma P32.                 \tag{1}
\]

This is an exact finite-dimensional statement on paper; it uses neither a
CLT nor a uniform phase-tail estimate. At `m=10^12` the discrepancy is a
few trillionths. It cannot explain the much larger gaps below.

For the old cubic-zero adversary bank, the two rational balanced profiles
have certified actual finite fifth coefficients in

\[
-.004045<s_{5,m}<-.004042.
\]

The first limiting value is `-.0040430863489843264`. Three independent
one-dimensional Arb integrals, explicit full Gaussian tails, and the exact
finite error prove the sign. Therefore **positive gamma decreases the old
bank's payoffs**. This establishes a genuine escape direction from its
cubic obstruction. It does not cap the new witness norm: other responses
can become active.

## 3. A realizable cancellation bank, and a failed small-family model

A two-parameter phase-family exchange suggested
`epsilon=.852989597093`, `gamma=.291083975761`. We froze the responses
before certifying them. Take `phase(Z)` and the two mirror pairs with

\[
(c,b)=(1126037/12500000,16260103/50000000),
\]
\[
(c,b)=(900639/10000000,32555119/100000000).
\]

At `m=10^12`, their actual columns admit strictly positive **exact**
probability weights cancelling both `s3` and `s5`. Those weights are
integral-defined real numbers, not rounded decimal weights. If
`x_i=s3_i`, `y_i=s5_i`, set

\[
\alpha_i=y_i-3x_i/8\quad(i=1,2),\quad
X=\alpha_2x_1-\alpha_1x_2,\quad
D=x_0(\alpha_2-\alpha_1)-X.
\]

The weights are `(-X/D, x0*alpha2/D, -x0*alpha1/D)`. Directed intervals
prove `alpha1<0<alpha2`, `x1,x2<0`, `D>0`; algebra proves the exact
cancellations. Their mixed linear coefficient satisfies

\[
p_Q>.7123725189.                                    \tag{2}
\]

Thus the scalar norm of every `P10-epsilon P21+gamma P32` is above this
floor, for arbitrary complex multipliers. In the unit spectral region
`|epsilon|,|gamma|<=1`, the vector spectral benchmark gives method ceiling
`1/.7123725189 = 1.40375993384...`. Outside that region a vector/scalar
ratio ceiling needs additional controls. This new certificate is **weaker**
than the repository's already audited degree-five ceiling `1.4036705`.
Its value is the explicit shared response bank and tail comparison, not a
new best barrier.

More importantly, the two-parameter response family misses useful
adversaries. We expanded phase numerators to the six local features

\[
Z,\ H21(Z),\ G,\ H32(Z),\ (RZ-1)G,\ Z^2\bar G/\sqrt2.
\]

At the simple rational witness `(epsilon,gamma)=(.853,.2911)`, an explicit
frozen rational pair in `tools/quintic_frozen.json` gives independent
scrambled Sobol estimates

\[
.7124496743,\quad .7124496763,\quad .7124497831.
\]

The restricted active profiles give approximately `.7123725` to
`.7123730` on the same fresh samples. This is about `7.7e-5` of missing
response-family support, vastly larger than (1). These are **numerical**
values, not directed enclosures. Their role is a sharp falsifier to certify
next, not a claimed exact norm separation.

The expanded exchange also exposed sampling bias: a discovery-bank value
near `.7124369683` was accompanied by nonlinear holdouts near `.712428`.
The analytic `phase(Z)` value itself equals
`pi/4-epsilon*pi/32+gamma*3pi/256` and must remain in every bank maximum.
Neither the discovery LP nor a near-zero empirical mixed coefficient is
an exact cap or an exact cancellation. The production oracle now records
that analytic baseline explicitly.

## 4. What cross-bound duality actually buys

For an actual pair define its complete charge-one spectrum

\[
r_j=\langle P_{j+1,j}F,P_{j+1,j}H\rangle,\quad
p=r_0,\quad s_3=r_1,\quad s_5=r_2.
\]

For real spectra, obtainable by equal mixing with the conjugation-reflected
pair, Parseval and Cauchy--Schwarz give

\[
\sum_j|r_j|\le1,\qquad \sum_jr_j=C_1=\Re E[\bar F H]. \tag{3}
\]

Let `R` be the convex body of realizable spectra or its relevant closure.
A spectral lower witness samples its support function
`sup_(r in R)|sum a_j r_j|`. The direct upper construction instead seeks
large

\[
D(r)=p-\sum_{j\ge1}|r_j|
    =\inf_{|u_j|\le1}\{p-\sum_{j\ge1}u_jr_j\}.       \tag{4}
\]

For a finite bank and a finite list of residual coordinates, optimizing
mixture weights and these dual prices is exactly LP duality. This yields
an operational exchange rule: an optimal price asks the response oracle
for a new realizable column; the column joins the upper mixture bank.
An outer relaxation can supply a price but cannot supply a realizable
column without lifting it. Infinite-dimensional duality additionally
requires the appropriate closure/topology; a finite LP is sufficient for
the experiments here. No equality with the unrestricted Grothendieck
constant is being inferred from our inner family.

One necessary test, valid without knowing the separate tail coefficients,
is

\[
D\le p-|s_3|-|s_5|-|C_1-p-s_3-s_5|.                 \tag{5}
\]

It is only a necessary test: a small *signed* residual can conceal large
oppositely signed individual coefficients. This is exactly where joint
realizability helps but does not finish the upper proof.

We can now make the obstruction quantitative for two actual banks.
Call the old exact cubic-zero bank `B`, and the new cubic/fifth-zero bank
`Q`. Independent Arb exponential-quantile endpoint grids prove

\[
p_B<.71314,\ s_{3,B}=0,\ s_{5,B}<-.004042,\ C_{1,B}>.70;
\]
\[
p_Q<.71238,\ s_{3,Q}=s_{5,Q}=0,\ C_{1,Q}>.72.
\]

The sharper new endpoint bound is `C1_Q>.720885896745`; its direct score
is below `.703860572741`. The old endpoint upper certificate
`C1_B<=.705287031876` proves its remaining signed tail is negative;
the new bank's remaining tail is positive. Thus the sign flip is real.

Nevertheless **every mixture beta B+(1-beta)Q fails direct conversion**.
For `theta=49/250`, (3)--(4) imply the universal linear majorant

\[
D\le L_\theta=(1+\theta)p+(\theta-1)s_3
                         +(1+\theta)s_5-\theta C_1. \tag{6}
\]

The coarse certified constants above give, for `0<=beta<=1`,

\[
L_\theta\le .71088648-.000005272\,\beta
             \le .71088648<.711947153313208982.        \tag{7}
\]

This is a certificate, not an empirical LP. Its rational implication is
also proved in Lean. Opposite total tails do not suffice: cancelling them
costs too much linear coefficient or leaves a fifth penalty. It rejects
these two complete banks, not every component, preprocessing, or rounding
transfer.

## 5. A novel implementable response oracle: retain the phase itself

Equation (6) identifies a concrete operator to optimize:

\[
S_\theta=(1+\theta)P10+(\theta-1)P21
                         +(1+\theta)P32-\theta I.    \tag{8}
\]

Its actual spectral weights are `1,-1,+1,-theta,-theta,...`. The
identity term is a **tail price**, and changes the best response from a
polynomial phase to a phase that remembers the other phase. In the
six-feature limiting model, one alternating step is

\[
F_{k+1}=\operatorname{phase}\{\sum_i d_i
                  \langle\phi_i,H_k\rangle\phi_i-\theta H_k\},
\]

followed by the corresponding update of `H`, where
`d=(1+theta,theta-1,theta-1,1+theta,1+theta,1+theta)`.
This produces finite recursive phase circuits beyond the polynomial
numerator family. We define `phase(0)=0`, so every circuit remains bounded
and charge-one even on a possible zero set. Frozen coefficients are
evaluated on holdouts without refitting. Conjugation symmetrization makes
the reported real spectra realizable.

The low-grade bridge (1) applies to every frozen circuit. For (8) its
error is at most

\[
{201/250\over m+1}+{(299/250)4\over m}.
\]

The identity endpoint transfers exactly. This avoids proposing a false
moment-only tail description or a fast uniform phase-tail estimate.

`tools/tail_priced_phase_oracle.py` implements this algorithm and records
each step. Six starts, 30 alternating steps and three independent `2^18`
holdouts produced a best priced value about **.718768**, well above the
two-bank separation price. It is a feasible numerical value for (8), not
an upper rounding score. The individual circuits' necessary scores (5)
are only about `.6389`, so promoting the best priced circuit directly
would be a serious mistake.

Adding the three frozen circuits to the previous nine-column bank raises
the numerical optimum of (5) from **.71036222** to **.71160976**. This
demonstrates useful separation but still fails the incumbent `.71194715`.
Even this optimized value is an *upper diagnostic* on a necessary score,
not a realizable full Wiener score. All input columns, frozen circuits,
raw and control-variate estimates, and LP outputs are shipped.

## 6. Ranked directions, with decisive falsifiers

1. **Adaptive tail-priced realizable separation.** This has the best
   tractable cross-bound payoff: solve the mixture LP, use its new dual
   prices in an identity-feedback best response, freeze, and add the column.
   The decisive construction is a realizable bank with linear coefficient
   exceeding the incumbent after paying the *entire* absolute tail. First
   falsifier: maximize (5) over its columns. Our first expansion fails
   this test at `.711610`, despite improving it by `.001248`. If the test
   eventually passes, the next obligation is an interval-certified full
   kernel/tail bound; moment cancellation alone is insufficient. A fixed
   price cannot stand in for this adaptive dual iteration.
2. **Move beyond low-degree witnesses with actual response projection.**
   Degree five cannot reach the current upper region; the repository's
   degree-seven barrier also lies below it. Degree at least nine, or a
   different witness formulation, is needed within that architecture.
   The decisive lemma is a uniform scalar norm cap retaining all coupled
   response sectors. The first calculation is the actual seventh/ninth
   projection of the current active circuits, followed by realizable
   cancellation/separation. A high linear-floor mixture cancelling all
   retained nonlinear directions would falsify that witness architecture
   before another expensive global cover is built.
3. **Certify the expanded-family counterexample before proving a new cap.**
   Convert the explicit rational pair at `(.853,.2911)` to directed
   integrals and prove a payoff above `.71244`, retaining (1). This would
   rigorously falsify the attractive restricted phase minimax model.
   A directed value below that threshold would instead expose the numerical
   experiment as unreliable. This is a limited milestone, not a way to
   evade the degree-five ceiling.

Near-extremizer structure remains useful only if proved for actual coupled
responses. The diffuse construction already has a genuine rank-one remote
cubic, so additional valid constraints cannot eliminate it. The new
six-feature examples likewise avoid the known small-coordinate obstruction
by restricting an explicit inner family; they make no universal reduction.
The literature's real sign/local-model separation algorithms motivate the
exchange mechanism, but their numerical constants and binary correlation
models do not transfer to complex phases. The verified primary-source
audit in the earlier reassessment states those hypotheses explicitly.

The preferred conjectured value remains a hypothesis. Neither our lower
ceilings nor the upper residual bookkeeping establishes it. The actionable
connection is the shared realizable spectrum and its dual prices, with a
separate analytic obligation for every claimed global cap or full tail.

## 7. What is checkable now

* **Paper proofs:** the 13-mode invariant count, exact conditional Mehler
  projection, finite bridge, phase-circuit realizability, and Parseval price.
* **Directed external certificates:** negative finite fifth coefficients,
  positive exact cancellation weights and norm floor, endpoint lower grids,
  and the all-two-bank-mixtures rejection. Full unbounded tails/boundary
  masses are included.
* **Completed Lean:** ten generic results in
  `Grothe/LowerAnalytic/QuinticTransferAudit.lean`, covering diagonal error,
  interval transfer, signed descent, Cramer algebra and (7). They compile
  with only `propext`, `Classical.choice`, `Quot.sound`. They do not
  formalize the Gaussian, representation, Bessel or AGM arguments.
* **Numerical only:** exchange, expanded-family holdouts, phase-feedback
  search, and finite-bank LP diagnostics. No sampling error enclosure,
  global norm cap, or new endpoint is asserted.

The main verifiers have 19 deliberately false/invalid input rejection
controls, plus a false target rejected by the mixture-score checker.
The source and replay hashes appear in the package manifest. The generic
Lean results are included in the default build and axiom audit; their
Gaussian and integral interpretations remain paper arguments.

Replay commands and the frozen endpoint sources are in
`research/quintic_projection_20261023/README.md`. Heavy searches and grids
belong on the droplet in an owned task directory.
