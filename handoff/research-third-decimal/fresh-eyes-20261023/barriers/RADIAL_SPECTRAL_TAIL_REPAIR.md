# Fresh barrier audit: spectral exclusion can be repaired by a tiny tail

23 October 2026. **No endpoint changes.** This note contributes new exact
finite-model counterexamples, not a new all-dimensional norm inequality.

The proposed radial spectral hierarchy is mathematically valid and excludes
all four current atomic benchmark laws at low order. But that exclusion has
almost no objective strength on the current fixed tables: new rational laws
satisfy all 671 old cuts, every real polynomial spectral matrix through degree
six, and the original moment assumptions, while retaining essentially the old
scores. At radius 128 one repair costs only about `1.04e-9` in the score.

The underlying AMMP spectral inequality is known. The new work here is its
exact evaluation on the **current** four laws, followed by reoptimization and
exact rational verification of surviving laws. This directly tests the warning
in the older spectral review that lower moment inequalities can be repaired
using a far tail.

## The necessary matrix condition and its scope

Let `q` be a genuine complex bidegree `(2,1)` Gaussian polynomial with
`E|q|^2=1`, put `U=|q|^2`, and let `F=sqrt(2) Re(q)`. Circularity gives

```
E F^(2r) = binom(2r,r) E U^r / 2^r,
E F^(2r+1) = 0.
```

For every integer `k>=1`, and indices `0<=i,j<=k`, define

```
M_k[i,j] = (k - i*j/(i+j-1)) E F^(i+j).
```

The expression with `i+j=1` is interpreted as `k E F`, which is zero.
The even and odd index blocks of `M_k` must both be PSD.

For completeness, if `N` is the Gaussian number operator, `NF=3F` and every
polynomial `P(F)` of degree at most `k` belongs to Gaussian grades at most
`3k`. Hence `E[P(F)(3k-N)P(F)]>=0`. Integration by parts gives

```
E Gamma(F^i,F^j) = 3 i*j E F^(i+j)/(i+j-1),
```

which identifies the preceding quadratic form as `3 a^T M_k a`. The `k=3`
odd block recovers `E U^3 >= (3/2)(E U^2)^2`. This is a necessary condition
for genuine cubics and their moment-convergent limits. Finite PSD tests do not
give a realizability theorem.

Primary source: Azmoodeh–Malicet–Mijoule–Poly,
[Generalization of the Nualart–Peccati criterion, Theorem 3.1](https://arxiv.org/pdf/1305.6579),
Annals of Probability 44 (2016), 924–954. The theorem's polynomial spectral
form also follows by the direct argument above. The repository's older
`ch19-spectral-review.tex` already derives related radial and charge-three
constraints; no novelty is claimed for the matrix principle.

The genuine bidegree convention is the complex Wick convention in
[Itô, Complex Multiple Wiener Integral](https://doi.org/10.4099/jjm1924.22.0_63)
and in [Chen, On the fourth moment theorem for the complex multiple Wiener–Itô integrals](https://arxiv.org/abs/1408.1817).

## Exact exclusion of the old benchmark laws

The four source files are
`outputs/binding-audit-20261023/radial-complete-{index}-exact.json` in the
original repository. Their hashes are recorded in `atomic-spectral-probe.json`.
They still pass the original finite table-and-cut verifier.

Their first spectral failures are:

- Rule **8701**: `k=4`, even indices `(0,2,4)`. The rational polynomial
  coefficients `(103263/200000, -1, 79873/500000)` give
  `a^T M_4 a < -0.1615810737`.
- Rule **5661**: `k=5`, odd indices `(1,3,5)`. Coefficients
  `(1, -250313/500000, 171/12500)` give a value below `-3.5197336198`.
- Rule **1247**: `k=6`, even indices `(0,2,4,6)`. Coefficients
  `(-14841/31250, 1, -114663/500000, 7667/1000000)` give a value below
  `-0.7986176996`.
- Rule **7234**: `k=6`, even indices `(0,2,4,6)`. Coefficients
  `(-30911/50000, 1, -70401/500000, 2317/1000000)` give a value below
  `-2.7904135183`.

The checker expands each displayed polynomial into a rational polynomial in
`U` and checks its negative expectation exactly. Both `U~Exp(1)` and the
actual normalized one-coordinate Wick cubic
`q=z(|z|^2-2)/sqrt(2)` pass every block through `k=12` exactly. The latter
calibration includes the non-Gaussian moments `(1,44,11352)`.

## Exact repaired laws: exclusion does not produce useful strength

A cutting-plane LP proposes new atomic laws. Each iteration adds a negative
eigenvector of a current matrix block as a linear constraint on the weights.
The LP uses the same source tables, all 671 inherited cut functions, exact
target moments `EU=1` and `EU^2=2+x^2`, the old upper bound on `EU^3`, and
the old bound on `E sqrt(U)`. A small strict discovery margin supplies room
for rationalization. Solver tolerances are never used as proof.

All four radius-16 laws have been independently replayed with fractions. Their
scores are:

- **7234**: `0.7134128087826902`, only about `3.73e-9` below the old law.
- **5661**: `0.7134145761492413`, about `6.46e-8` below the old law.
- **1247**: `0.7134064137725580`, about `1.73e-10` below the old law.
- **8701**: `0.7133522155274680`, about `6.21e-8` below the old law.

Every score is **strictly greater than `500/701`**, by an exact rational
comparison. Every matrix block for `k=2,3,4,5,6` is PSD by exact rational
congruence elimination. All old cuts, moment bounds, mixture identities and
table objectives pass the inherited exact verifier. A deliberately damaged
normalization is rejected.

For rule 8701, extending the allowed radius exposes the repair mechanism:

- Radius **16**: score `0.7133522155274680`; tail weight about `1.88837e-10`.
- Radius **32**: score `0.71335226124209`; tail weight about `7.77614e-13`.
- Radius **64**: score `0.71335227351061`; tail weight about `3.00904e-15`.
- Radius **128**: score `0.71335227661023`; tail weight about `1.17278e-17`.

All four radius choices pass the same exact replay. At radius 128 the score
loss relative to the original rule-8701 law is only about `1.04e-9`. The tail
weight decays roughly as radius to the power `-8`, while its sixth-moment
cost decays roughly as radius to the power `-2`. This is an observed mechanism
in the supplied examples, not a theorem about every finite spectral hierarchy.

The repaired laws also lie below the following **H21 benchmark ceiling
values**, imposed as extra inequalities through `EU^6` (modulus moments of
orders four through twelve):

```
EU^2: 44
EU^3: 11352
EU^4: 7593024
EU^5: 10446901440
EU^6: 25708136394240.
```

Those benchmark values come from the exact factorial formula
`E[t^r(t-2)^(2r)]/2^r`, with `t~Exp(1)`. This replay checks the numerical
comparisons only. This note supplies **no independent general Wick-diagram
proof making all these values universal sharp upper bounds**. Their role here
is stronger hypothetical extra restrictions, which these examples still pass.
They have enormous slack. Adding these proposed benchmark ceilings through this
order cannot exclude the repaired examples, whether or not their universality
is established separately.

The laws remain artificial. A second exact probe finds failure at `k=7` for
the repaired 5661 and 8701 laws, and at `k=9` for repaired 1247 and 7234.
They are **not** actual Gaussian cubics, response pairs, or Grothendieck
witnesses. Their role is to disprove sufficiency of the precisely stated
finite relaxation.

## What this changes in the attack

Testing more spectral inequalities on the *old* atomic law would have looked
promising: the violations are large. Reoptimization reverses that diagnosis.
Through order six, the extra information can be bought for essentially no
table-objective cost. At the old witness `epsilon=149/200`, this strengthened
fixed-profile relaxation still cannot certify below its surviving primal
scores, and in particular cannot reach `500/701` at these states.

This conclusion does not transfer to the new witness `1891/2500`, all possible
source profiles, all radial spectral constraints, or an infinite hierarchy.
It also does not rule out conditional higher-moment estimates tied sharply
to the fourth defect and to the very same tensor contractions. But a new
radial proposal should now pass a tail-repair test before any cover work.

The companion [MOMENT_EXTENSION.md](MOMENT_EXTENSION.md) proves a separate
structural statement: with no upper growth constraints, all scalar-real AMMP
matrices, even infinitely many, add no projection onto the first three radial
moments beyond `M2,M3`. It includes the missing-base-condition correction and
an exact rational construction. That theorem does not preserve the old cut
bank or the table objective; it is distinct from the finite repair experiment.

The main joint-image target survives this audit. The new information must
control the shared response/tensor realization or quantitatively charge the
repairing tail; adding a few scalar spectral PSD blocks and the imposed H21
benchmark ceilings does neither on these benchmarks. The exact local two-disc
SDP still does not impose a common Gaussian polynomial image globally.

## Files, replay, and proof status

- `tools/fresh_barrier_radial_spectral.py`: standard-library exact matrix
  checks, short negative witnesses, and two exact calibrations.
- `tools/fresh_barrier_repair.py`: NumPy/SciPy discovery only. Columns are
  scaled for remote tails; all claimed final results require exact replay.
- `tools/fresh_barrier_verify_repairs.py`: standard-library exact replay of
  each saved rational law, original cuts, all ten spectral blocks through
  degree six, ceiling-value comparisons, and a negative normalization test.
- `tools/fresh_barrier_frozen_countermodel.py`: a portable frozen copy of the
  inherited exact finite-law verifier. Its original SHA-256 is
  `759daaa6540ac54fa7bdc4f0781c774e0d94efe64bfcb57e14104236a29543be`.
  Only optimization-mode refusal and explicit input checks were added.
- `tools/fresh_barrier_negative_tests.py`: **33 negative checks passed**:
  optimization-mode refusal for every new entry point, invalid degree/radius/
  iteration arguments, and malformed or nonsymmetric matrices. The local
  floating cut evaluator also matched the frozen exact evaluator on 55 fixtures.
- `atomic-spectral-probe.json`: original-law failures, exact coefficients,
  radial separator polynomials, source hashes.
- `repair-*-law-exact.json`: seven self-contained rational countermodels,
  including the source tables and cut functions.
- `exact-repairs-replay.json`: exact replay ledger for all seven laws.
- `postrepair-spectral-probe.json`: explicit higher-order failures, preserving
  the distinction between finite feasibility and actual cubic realizability.

From the isolated worktree root:

```sh
python3 -B -I tools/fresh_barrier_verify_repairs.py \
  handoff/research-third-decimal/fresh-eyes-20261023/barriers/repair-*-law-exact.json \
  --out handoff/research-third-decimal/fresh-eyes-20261023/barriers/exact-repairs-replay.json
```

The default imports the frozen verifier next to the new scripts; it never
needs the original shared repository. An optional `--source-repo` can name the
isolated replay root containing `tools/fresh_barrier_frozen_countermodel.py`.
The discovery script's floating cut evaluator is local too. The new laws
contain the original tables and cuts. All proof-accepting scripts explicitly
refuse Python `-O` and `-OO`, validate degree arguments, and reject malformed
matrix inputs. Bytecode writes are disabled for dependency imports. No original
shared repository file was mutated. The analytic extraction of the spectral condition is a written proof;
the new finite checks are exact external Python checks. No Lean theorem,
`NodeCaps`, `DirectHyps`, or global endpoint has changed.
