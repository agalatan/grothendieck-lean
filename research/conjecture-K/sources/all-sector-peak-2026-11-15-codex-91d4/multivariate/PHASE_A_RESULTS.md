<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/multivariate/PHASE_A_RESULTS.md, 2026-11-15 12:45; Agent-ID: codex-91d4. -->
# Fixed-trial multivariate Phase A

Agent-ID: **codex-91d4**. 15 November 2026. All reported integrals and
optimizations are **N**, not certified bounds. No compact (P) boxes are covered
here. The analytic identities used for the finite-triple distribution and
the zero-safe majorant are distinguished from their numerical evaluation.

The sampled genuine families support continuing with the averaged sufficient
budget. They do not prove it. Both the direct fixed trial and the proposed
unrounded majorant were evaluated; the former alone was not used as evidence
for the latter. No old handoff was modified.

## Exactly what is evaluated

Let `V=||r_A||²+||r_B||²`, `R=r_A+.5053r_B`, `U=r_B−.5053r_A`,
`h=(T−1)r_A+Z²conj(r_B)/sqrt(2)+.6R`, and `X=L+q+h`.
The remote trial is **fixed** at `−.6R`. Only one global complex visible
coefficient c is optimized. All cap tests use the orthonormal coefficient
energies, with the same total and weighted ellipsoid as the parent task.

```
Jodd(c)=|c|²+E[|X+H|+|X−H|−2|X|]−pW,  H=O−cZ,
linearAB=2Re E[h conj(ph(L+q))],
M=linearAB−.31||R||²−.08||U||²+2V(u+V−.0463)+Jodd−D−sigma,
R_alloc=Jodd−.01||U||²−sigma+max(−D,0).
```

`M` is the requested conditional-(P) sufficient majorant. `actual` is the
direct fixed-trial objective minus S. `P_gap=M−actual` is recorded; it is
independent of the odd perturbation at each core. The canonical pairing from
STATUS §2.10a is retained, with explicit visible antithetic samples. The
engine also records c=0, so the cost of optimizing c is visible.

For the proposed pointwise bound, the additional records are

```
Psi=2|H|²/(sqrt(|X|²+|H|²)+|X|)
    −(Re(X conj(H)))²/(|X|²+|H|²)^(3/2),
Jpsi=|c|²+E Psi−pW,
Mpsi=M−Jodd+Jpsi,       R_alloc_psi=R_alloc−Jodd+Jpsi.
```

The expression is zero when X=H=0. It is a genuine majorant, not a restatement
of the exact norm difference. It is evaluated at the exact-norm optimizing c
and at c=0; no optimality claim for the Psi choice of c is made.

## Bounded families and results

The first complete pass uses 88 cores and 21 odd choices per core: zero, two
joint real Hessian directions, Q/P/nu directions, each at four amplitudes.
The core bank contains two- and three-coordinate full Wick cubics, larger
diagonal diffuse cubics, shared/disjoint shell fields, random complex tensors,
the four genuine near-P embeddings, and 32/128 independent triple blocks.
High-dimensional odd bases are selected subspaces, not exhaustive searches.
All near-P coefficients are global cap-feasible embeddings; the conditioned
point is not treated as a global energy vector.

`budget_full_final.json` records the 88-core pass at seed 960, `2^13` samples,
8.15 seconds before the additional Psi diagnostics. Every one of its 1760
nonzero sampled Jodd values is negative. Its smallest negative sampled margin
is approximately `−4.60635e−7`, at 32 shared triple blocks and
`r_A=.15Y, r_B=.085Y`. That is sampling evidence, not a uniform margin.
Each tested core's greatest M occurs at O=0 in this near-peak bank.
The final fresh replay also evaluates Psi on the entire coarse bank: all 1760
nonzero sampled Jpsi values are negative, with greatest value `−4.53407e−7`.
Its largest Psi-minus-true gap is about `.00175965` at full odd energy; the
corresponding Jpsi remains negative. This is still a finite sample result.

Eight cores with the greatest nonzero Jodd are independently refined at
seed 961, `2^17`. `budget_psi_refined.json` records this with Psi, in 9.01 s.
The largest sampled nonzero Jpsi is `−8.62078e−7`, at 128 disjoint triple
blocks, `r_A=.15Y, r_B=.085Y`, `W=8.50053753249e−6`.
Here `||U||²=.000084732025`, so using the **exact** triple-family Dminus=0
gives `R_alloc_psi≈−1.70939806e−6`. The greatest Psi-minus-true gap in these
selected cases is `1.45247e−7`. The pointwise central-minus-Psi maximum is
`4.46e−15`, consistent with roundoff in the exact inequality.

Ordinary high-dimensional Sobol estimates of D can be wrong by `1e−3` and
can make the recorded raw `M`, `actual`, or `R_alloc` positive. They are
preserved as diagnostics, **not accepted as violations or proof evidence**.
Origin and q-energy controls are also reported but are not error bounds.
For triple blocks the fields `Dminus_exact=0` and
`R_alloc_psi_with_exact_Dminus` separate the analytic sign from these noisy
estimates. General-family D values remain N.
For example, the 32-coordinate diagonal-Hermite AB-zero core has a raw
baseline residual `+.000155884` and origin-corrected `+.000111936` on the
coarse grid. These estimates are too noisy to use: the inherited remote
theorem gives its true baseline at most `S+3.6e−7`. Consequently an AB-zero
majorant can alternatively use the exact remote-cap term `3.6e−7+Jpsi`;
Jpsi itself would still need reliable integration. No claim that every
ordinary sampled absolute residual is negative is made here.

## Exact finite-triple mixture reduction

For genuine `q=sqrt(u/m)Σ X_jY_jconj(Z_j)`, conditional integration of one
Gaussian factor yields the exact random-variance law `q|Vq~CN(0,Vq)` with
`Vq=(u/m)Σ|X_j|²|Z_j|²`, `E Vq=u`. This retains the finite cubic law;
it is not a deterministic-variance Gaussian substitute. The shell/odd active
factor is either X1 or a disjoint coordinate.

Conditional circularity and visible parity give **linearAB=0 exactly**,
also when Vq shares the active factor: the conditional phase means at L and
−L cancel, while h is even. Concavity of B gives **Dminus=0 exactly**.
The random baseline is evaluated numerically as `E[B(Vq)−pVq]−S` to remove
the leading variance noise. The 65-point benchmark interpolation is numerical,
with interleaved numerical checks; it is not an outward enclosure.

`mixture_final.json` covers all 12 triple-block cores at seed 962, `2^16`,
zero plus their two leading nonzero odd choices, in 6.46 s. Its largest M
and direct actual residual are `−4.29430889e−5`, at 128 disjoint blocks,
A=B=O=0. Among nonzero choices the largest M/actual is `−9.31400903e−5`
at the same AB-zero core. The largest nonzero allocation residual is
`−1.66360286e−6`, at 32 disjoint blocks, A=.15Y and B=.085Y.

At 128 blocks, A=.13Y, B=.075Y, M is approximately `−.0080422` and actual
approximately `−.01621`. At A=.15Y, B=.085Y, M is approximately `−.010178`
and actual approximately `−.02117`. Thus there is ample separation between
the sufficient majorant and the direct trial in these sampled shell cases.

The Rice reduction does not directly evaluate Psi. Its output explicitly
marks Jpsi unevaluated. `PSI_GAUSSIAN_FORMULA.md` derives an exact additional
one-dimensional Laplace integral for conditional E Psi, keeping Vq random.
The algebra was independently checked by the content-budget subagent;
the integral has not been numerically or rigorously evaluated here.

## Shared-bath stress tests of the old low-energy witnesses

Two former low-u witnesses are retained as explicit coefficients:

```
q_old=.0114Y(|Y|²−2), A=.133Y, B=.105sqrt(2)Y,
O=−i[.063Z(|Y|²−1)+.0053conj(Z)Y²+.0014Z(T−2)];

q_old=(439/20440)Y(|Y|²−2), A=(179/3500)Y,
B=(439sqrt(2)/3500)Y,
O=i[.037Z(|Y|²−1)+.007conj(Z)Y²].
```

Add either `dY(|X|²−1)` (shared bath, d phases +1, −1, i) or the disjoint
normalized cubic `d X(|X|²−2)/sqrt(2)`. These are genuine orthogonal cubics
of energy |d|². Their amplitudes bring u through `.01,.02,.03,.0403448`;
the original low-u cases are included. A common scale at most one is applied
to A, B and the original odd coefficients to obey both caps, while q_old
and the target remote energy are preserved. Odd amplitudes `.25,.5,1` of
these scaled witnesses are tested, plus zero. There are 34 cores.

`bath_results.json` is seed 965, `2^15`, 2.11 s. The independent refinement
is seed 966, `2^17`; `bath_psi_refined.json` includes Psi, in 14.12 s.
Positive old odd increments survive at low u, but their energy slack pays
for them: the refined original common-trial example has Jodd about
`.000454123` and Jpsi about `.000461856`, with sigma about `.002045787`.
At u=.01 a disjoint bath also gives a positive Jodd, still below its slack.

The largest refined nonzero `R_alloc` is `−4.04077801e−5`;
the largest `R_alloc_psi` is `−3.88178794e−5`, and its c=0 version is
`−3.87475651e−5`. They occur for the old common-trial witness with a
disjoint filler at u=.0403448, scaled odd quarter-amplitude:

```
W=.000141903299893721,  ||U||²=.00372350740682624,
D≈.0100202282,  Jodd≈−3.17270598e−6.
```

The largest sampled Mpsi among these baths is about `−.00809412`.
The largest Psi-minus-true gap is `6.12906e−5`; it does not exhaust the
slack at that point. These tests probe coexistence of old local obstructions
and high global energy; they are not a compactness or uniform-sharing proof.

## Small-ball diagnostics and replay

Each ordinary core records `Pr(|X|<epsilon)` for five scales, a joint small
ball with `Gamma=|partial_z X|²+|partial_bar_z X|²<.01`, and the inverse-norm
contribution below three scales. These suggest where an averaged proof must
resolve nearly singular conditional geometry. Rare inverse-norm samples can
be severely biased; a positive sampled inverse bound is not a failure of
the exact paired norm. The accompanying formula note gives a precise
weighted-small-ball criterion and a zero-safe scale decomposition.

From this directory, run:

```sh
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I replay.py --output-dir fresh-replay
```

The directory must be new. The driver regenerates the 88-core full pass,
the eight selected refinements, all 12 mixture cases and all 34 refined baths,
including Psi wherever directly sampled. It checks case counts and records
commands, source hashes and timings. No saved result or old handoff is a runtime
input. The runtime source dependencies are local Python files and the new
`../analytic/benchmark_numeric.py`; NumPy and SciPy are required. Source-copy
provenance and environment versions are in `SOURCE_HASHES.json`.
The complete author replay at `replay-codex-91d4/RECEIPT.json` passed in
**43.38 seconds**, one thread per sequential stage.
