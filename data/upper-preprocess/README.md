# Current polynomial preprocessing certificate

The frozen contour-tail assembly in `certificate.json`, under the documented
Gaussian inputs, proves

**K_G^C < 1.404598583128.**

The exact reciprocal score is `355973589896954491/500000000000000000`.
This is a global upper certificate, not a bound on a selected response region.
The lower certificate is unaffected. The current Lean theorem further reserves
the known linear coefficient's weighted square from the same Hardy budget. It
uses tail `19055527/625000000000000` and total residual
`562146517109/500000000000000000`, giving
**K_G^C < 1.404598570779**, with exact reciprocal score
`355973593026532891/500000000000000000`. This is a derived assembly in
`Grothe/Upper/PolynomialBridge.lean`; the frozen contour result and its
unrefined assembly fields remain unchanged for reproducibility.

## Mathematical assembly and trust boundary

Keep the concrete disk-valued, charge-one rounding `G_T` and the truncation `X`
defined in the Lean development. Write their energy tables as `E` and `EX`.
Use the exact odd tensor-power preprocessors
`p(t) = t P(t²)` and `q(t) = t Q(t²)` from `certificate.json`.
Both coefficient l1 norms are at most one; `Q(0)=0`. The degrees are 41 and 15.
The latter zero makes the existing head locality criterion `n+3m <= 501` valid.
Neither the raw rounding nor any of the 21,168 stored energy entries changes.

For `H(t) = sum E[n,m] p(t)^n q(t)^m`, the certificate gives a coefficient-l1
residual about `c t`, with `c = 7119483103461/10000000000000`:

| contribution | exact allowance | status |
|---|---:|---|
| rounding/truncation energy comparison | `1065637497/1000000000000000` | inherited external Gaussian input |
| finite head through degree 501 | `28153/1000000000000` | freshly checked in Arb and Lean |
| stored energy-table accuracy | `6847009/500000000000000000` | inherited external Gaussian input |
| infinite tail after degree 501 | `36748/1000000000000` | fresh contour arithmetic, same analytic Schur input |

Their sum is `delta = 565276095509/500000000000000000`.
The already formalized transfer theorem gives
`K_G^C <= 1/(c-delta) < 1.404598583128`.
No additional head-comparison hypothesis is introduced.

The native Lean checker proves the complete finite-head statement over exact
dyadic energy data and rational polynomial coefficients. The Lean development
separately proves the polynomial l1 constraints, locality, transfer and
rational endpoint assembly.
The refined concrete theorem `Grothe.UpperChaos.fresh_upper_rounder` still explicitly
assumes `compare`, `energy_close` and `hardy`, for a charge-one L2 truncation `X`.
Thus this is not a new unconditional Lean endpoint. The unconditional theorem
`Grothe.haagerup_bound` remains separate.

For `hardy`, the enclosed Gaussian Schur lemma bounds the holomorphic kernel on
the circle of radius `4149/4000`. The directed verifier checks its positive
definiteness gates and determinant bound on **65,594 arcs**, with exact interval
coverage. The mean-square upper bound is below `1.70148 < 7/4`. The exact
Cauchy–Schwarz calculation then gives the stated tail allowance. The Schur
lemma and holomorphic continuation remain paper analysis; only the numerical
gates, contour partition and tail arithmetic are recomputed by the verifier.

## Reproduction

Run the commands from the repository root, with Python's standard library and
`python-flint` installed. The optimizer additionally needs NumPy and SciPy; it
is not part of the proof.

```sh
mkdir -p handoff/upper-preprocess-replay
python3 tools/gen_upper_data.py data/upper-preprocess/certificate.json handoff/upper-preprocess-replay/Data.lean
cmp Grothe/Upper/Data.lean handoff/upper-preprocess-replay/Data.lean
python3 -I tools/verify_upper_preprocess.py data/upper-preprocess/certificate.json data/upper-preprocess/proposal.json data/upper-preprocess/hardy_result.json --check --out handoff/upper-preprocess-replay/head.json
python3 -I tools/verify_upper_hardy.py data/upper-preprocess data/upper-preprocess/proposal.json handoff/upper-preprocess-replay
lake build Grothe.Upper.PolynomialBridge Grothe.UpperChaos.PhiBound
```

The first directed command recomputes the head and checks the frozen contour
result's input hashes and exact ledger. The second command freshly recomputes
every contour arc; the frozen summary alone is not a fresh contour replay.
Its output includes elapsed time, so a fresh result is not expected to have the
same file hash as `hardy_result.json`; the exact arc partition and rational
mean-square bound are reproducible. The generator resolves its defaults from
its own location and also works from an unrelated current directory.

`certificate.json` contains all inputs needed to regenerate the committed
Lean data byte for byte. `proposal.json` stores the rational optimizer output
used by both directed checks. `hardy_result.json` records every accepted arc,
exact bound, source hash and verifier hash. The `inputs/` directory pins the
Schur proof and smoothing parameters. A sequential LP produced the proposal;
neither LP optimality nor floating point output is a certificate premise.

The dominant remaining allowance is the inherited comparison (94.26% of the
unrefined residual, 94.78% after the linear-budget deduction). Further gains from a new response must account for its full signed
kernel and shared tail; a better slope or a truncated mixture score alone
does not establish an endpoint.

## Combined Lean validation

All 15 affected upper modules passed fresh warning-as-error checks, including
the head and phase-cover native facts. The actual 40-declaration upper/lower
report uses 16 of 83 registered native facts. The completed 10,521-box lower
proofs were reused only after exact source, dependency and artifact guards;
the 140-source heavy cap stamp stays unchanged. Raw logs, generated-data
hashes and exact combined arithmetic are retained in `verification/`.
The full default build and complete axiom inventory are separate branch CI.
