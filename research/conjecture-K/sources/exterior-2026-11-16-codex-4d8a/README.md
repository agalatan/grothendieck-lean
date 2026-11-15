The requested inequality **K_G^C > 1.402 is not proved by this work**. This package records the twenty-paper literature audit, successful certificate replays, new explicit response inequalities, and a rigorous reduction of one witness to a single central interval. It distinguishes a certified Gaussian benchmark from a universal bound on arbitrary cubic chaos.

The current repository ledger, pinned to commit `1fdb667315156057c49358bbe74a34ac6c869d12`, records

\[
K_G^{\mathbb C}\ge\frac{1250000000}{891774069}>1.401700322371.
\]

That is an inherited result, not a new endpoint from this investigation. The target needs a scalar witness norm below `500/701`. The gap from the present norm cap is exactly

\[
\frac{891774069}{1250000000}-\frac{500}{701}
=\frac{133622369}{876250000000}.
\]

**Reading scope.** `READING_INDEX.md` lists the twenty newest arXiv submissions returned by the singular/plural phrase query, ordered by submission date, with versions fixed. `sources20.json` records the original source hashes. All reading was HTML or TeX. Batch ledgers give precise coverage, including appendices. Five additional primary references were followed; three were read in full, one through its relevant lower-bound derivation and appendix, and one through its main theorem statements. No claim is made that a phrase search exhausts all related mathematics.

**The strongest new explicit reduction.** For the fixed operator

\[
T=P_{1,0}-\frac{299}{400}P_{2,1},\qquad
h=(f+g)/2,\quad t=\|P_{1,0}h\|_2,
\]

the inherited Lean rows, transferred with exact rational arithmetic, imply

\[
\operatorname{Re}\langle f,Tg\rangle\le\frac{713263}{10^6}<\frac{500}{701}
\]

for every dimension and every pair of unimodular responses whenever

\[
0\le t\le\frac{1633}{2000}\quad\text{or}\quad
\frac{433}{500}\le t\le\frac{\sqrt\pi}{2}.
\]

The remaining interval is exactly `(0.8165,0.866)`. This is an unconditional consequence of the pinned production row theorems and response-energy inequality. It assumes neither Conjecture K nor the compact premise (P). It does not establish the bound on the remaining interval. The certificate and its inherited inputs are in `existing-program/`; `upper-batch/EXTERIOR_REVIEW.md` independently checks the retained-square transfer against the actual Lean reduction.

For this new epsilon, ten explicitly specified profiles cover the missing interval. Their Gaussian benchmarks and a uniform sufficient all-sector allowance `1/40000` are certified in `existing-program/central_7475_certificate.json`. The smallest conditional central cap reserve below `500/701` is exactly `69664580403/13099937500000000`. Thus proving those ten retained all-sector inequalities would complete the target, with global norm cap at most `713263/1000000`. These ten inequalities are **open**. None is silently obtained by transferring the original peak premise to different parameters.

**A new positive response penalty.** At the original peak parameters

\[
e=1891/2500,\qquad\beta=179/1250,
\]

phase-normalize the objective to be real, rotate `P10 h=tZ`, set `G=eP21 k`, `k=(f-g)/2`, and write `nu=<H,G>` with `H=Z(|Z|^2-2)/sqrt(2)`. Define the two discarded squares

\[
\Sigma=\|P_{1,0}k\|_2^2+
e\left\|P_{2,1}h+\frac{\sqrt2\beta}{e}H\right\|_2^2.
\]

The exact stationarity identity gives, when the denominator is positive (the zero case has `nu=0` and is trivial),

\[
\Sigma\ge
\frac{2\beta^2}{e^2}\,
\frac{(\operatorname{Im}\nu)^2}{t^2+\|G\|_2^2/e}.
\]

Consequently, throughout the explicit region

\[
t\le863/1000,\qquad\|G\|_2^2\le80051/10^6,
\]

one has

\[
\Sigma\ge\frac{256328000000}{3041646418989}(\operatorname{Im}\nu)^2
>\frac{337}{4000}(\operatorname{Im}\nu)^2
\quad\text{when }\operatorname{Im}\nu\ne0.
\]

In particular, `|Im nu|>=3/50` forces `Sigma>3033/10000000`. This is a penalty for actual phase-normalized responses. It is not a pointwise inequality for arbitrary coefficient tuples in the user's random problem. It belongs to the raw row functional: subtracting it unchanged from the retained functional would count its first-chaos square twice. The proof, allocation variant, and exact arithmetic replay are in `paper07000/PHASE_STATIONARITY_AND_CROSS_AUDIT.md` and `verify_response_constants.mjs`.

Separately applying weighted Bessel to `f` and `g` retains a cross term discarded by the previous summed Gram estimate. With rational multiplier `eta=-sign(Re nu)/35`, the new lower bound for the same full square `Sigma` exceeds the previous `J_1` by more than `39/100000` when `0.84<=t<=0.863`, total cubic energy is at most `0.080051`, and `|Re nu|>=0.06`. On the additional subset `0.851<=t<=0.853`, `u>=0.03`, `E_A>=0.02`, one has `J_1>0.0024`, so this gain survives taking the positive part. The region is nonempty in the energy relaxation; response realizability is not asserted. `primaldual/CROSS_GRAM_PROOF.md` supplies the exact matrices, proof, certificate, and a jointly minimized additive stationarity correction. This does not bound the raw payoff by itself.

There is also a proved shell-free consumer consequence at the original peak parameters. Assuming the already-proved remote and shell-free odd lemmas supplied in the task, actual phase-normalized responses satisfy the target payoff bound on `0.8282<=t<=0.863` when `A=B=0`, `u<=0.0463`, total cubic energy is at most `0.080051`, and `|Im nu|>=0.037`. The exact cap reserve below `500/701` is `5830268974361/3313977500000000000`. This extends a response region for the scalar consumer; it is not a new A/B-shell region for (★). Its complete derivation is in the phase-stationarity note.

**Improved Gaussian shoulder budgets.** For the operator with `e=1891/2500`, four new rows were optimized numerically and then independently interval-certified. Their sufficient all-sector demands are:

| response interval | ell | beta | certified Gaussian S upper | allowed all-sector excess |
|---|---:|---:|---:|---:|
| [0.81,0.83] | 0.8157145 | 0.13489 | 1.330001610 | 0.00034 |
| [0.83,0.84] | 0.835 | 0.1402446 | 1.358309611 | 0.00015 |
| [0.851,0.86] | 0.8579534 | 0.1465599 | 1.392331071 | 0.00017 |
| [0.856,0.863] | 0.8684666 | 0.1494296 | 1.408031355 | 0.00027 |

Every terminating decimal here is an exact rational. Each demand is `LambdaHat <= S_upper + excess`. The hardest lower shoulder's allowance more than doubles the previous proposal. The four universal inequalities remain **open**. Both the original 100-bit Arb integration and an independent 140-bit direct Rice integration pass. See `existing-program/REPORT.md` and `upper-batch/SHOULDER_REVIEW.md`.

**What the literature permits and excludes.**

- Guo–Fang–Lu, arXiv:2609.07000: both unmodified interval certificates replayed successfully. Its complex lower bound exceeds `1.3558463182716895859`; its entire weighted criterion is below `1.355846974250492`. Adding arbitrary finite Hermite levels and optimizing positive radial weights cannot reach 1.402 within that criterion. Restoring only the discarded first-chaos and charge penalties does not remove its obstruction. Coupling the two responses is necessary to leave that particular relaxation.
- The recent real primal/dual bounds do not transfer numerically to the complex constant. For a real matrix, the complex scalar denominator is the rank-two vector optimum, not the sign optimum. The antiperiodic cycle cuts used to exploit Boolean frustration are saturated by complex Fourier phases.
- All Hermitian positive-semidefinite complex witnesses have ratio at most `4/pi<4/3<1.402`. In two particular Vourdas families, even arbitrary complex affine combinations `aP+bI` have ratio exactly one. Their range and kernel both contain flat phase vectors. Exact Laurent-polynomial certificates verify this stronger exclusion.
- Errors were found in several auxiliary/theorem statements. The two faulty lemmas in Heilman's real lower-bound article admit explicit repairs sufficient for its final application; this audit does **not** refute that main theorem. The other findings concern arbitrary-Banach Hilbert factorization, the specified coherent-state projectors, and ancillary claims in the positive-constant article. Full source anchors, counterexamples, repairs, and independent review are in the batch notes.

**Trust and replay.** `proved` refers to the supplied analytic argument; `certified` refers to exact or interval arithmetic, with the mathematical implication inspected; `numerical` is discovery only; `open` is an unproved premise. No existence threshold is being offered as a quantitative theorem. No global theorem is inferred from a local response constraint or from sampled optimizers.

The package contains our notes, code, accepted outputs, and source manifests, not copies of the twenty manuscripts. `node fetch_sources.mjs` retrieves pinned HTML/TeX and checks hashes; it never requests a PDF. New interval checks use `python-flint==0.9.0`. The unmodified Guo–Fang–Lu replay separately uses its pinned `python-flint==0.8.0`; its instructions and successful logs are summarized in `paper07000/REPLAY_STATUS.md`. See the individual certificate notes for commands and precise inherited assumptions.

Run the new certificate suite with `node run_checks.mjs` after installing `requirements.txt` in a Python environment. Set `GROTHENDIECK_PYTHON` to that environment's interpreter if necessary. The Node certificates use only built-in modules. The suite checks the new arithmetic; it does not rebuild the inherited Lean development or turn the open central premises into theorems.

The unresolved work is a uniform scalar estimate on the remaining central response interval. The new penalties and larger shoulder budgets do not yet supply it. In particular, this package must not be cited as a proof of `K_G^C>1.402`.
