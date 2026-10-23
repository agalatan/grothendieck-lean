# Endpoint refinement and source recovery — 23 October 2026

The endpoint refinements retain the existing analytic hypotheses:

- Lower: `1.401695390488 < K`, conditional on `NodeCaps`, by the complete
  9,057-box rational cover and the existing all-dimensional transfer.
- Upper: `K <= 500000000000000000/355973579786182891 < 1.404598623023`,
  conditional on the same three concrete-rounder numerical hypotheses and
  the same charge-one L2 truncation conditions.

These are small improvements (about `6.8030e-8` and `1.2349e-8` respectively),
not a determination of the third decimal. No node potential, Gaussian source
integral, energy table, witness, or rounding is changed by these endpoints.
The separate heavy `GrotheCaps` target has not been rebuilt or newly verified;
its 140-file source digest is unchanged.

## Endpoint proof and replay status

The six changed upper modules and their needed downstream dependencies passed
Lean 4.34.1 with warnings treated as errors. The central targeted axiom audit
passes; the tail arithmetic adds no native fact. See `UPPER.md`,
`UPPER_BUILD.json`, and `UPPER_AXIOMS.txt`.

The complete combined tree passed the fresh GitHub Lean build and axiom
audit at commit `7afdc136e2f1cd23ff60dcb0b426bd83f34c06bb`:
[run 39901871873](https://github.com/agalatan/grothendieck-lean/actions/runs/39901871873).
All four native box checks, the partition check, final lower endpoint,
updated upper endpoint and default import graph passed. The axiom report
checks 345 theorems and uses 22 of the 82 allowed native facts. The forbidden
code check also passed. `FULL_CI.log` and `FULL_AXIOMS.txt` preserve the raw
build and extracted report; the central checker independently reaccepts
that report locally. `LOWER.md` records construction and premise boundaries.

The droplet independently completed all nine lower modules, including the
four native box chunks, partition and final endpoint. No running Lean
process remained when full CI succeeded. `LOWER_BUILD.json` distinguishes
that targeted droplet run from the complete fresh-source CI verification.

The independently replayed lower patch changes 43 parents into 344 children,
retains the other 8,713 domains, and matches every original canonical box
string before export. The native proof uses the existing eight row/batch
facts plus five new cover facts. It does not require the old cover facts.

From the repository root:

```sh
python3 -I tools/needle_cover_refine.py --verify handoff/research-third-decimal/needle-20261023/minimal-cover-ledger.json
python3 -I tools/needle_cover_lean.py --check
python3 scripts/check_axioms.py --hardy-budget < handoff/research-third-decimal/needle-20261023/UPPER_AXIOMS.txt
python3 scripts/check_axioms.py < handoff/research-third-decimal/needle-20261023/FULL_AXIOMS.txt
python3 -I tools/research_replay.py --full
```

The historical replay suite verifies 13 saved exact consequences, including
seven scalar countermodels. It does not regenerate missing Gaussian inputs
of the older reassessment comparison scripts. Immutable historical reports
retain their original source hashes and old endpoint arithmetic.

## Source recovery and next experiments

`MOMENTS.md` derives a finite exact formula for the second, fourth, and sixth
moments of the actual damped phase. The new FLINT replay recovers all three
as exact rationals from `Grothe/Upper/Data.lean`, equal to the retained old
comparison inputs. This restores numerical source provenance, without
formalizing that integration identity in Lean or supplying the remaining
Hermite-tail and coefficient enclosures. It changes no endpoint premise.

`RETUNING.md` separates tiny exact parameter transports from a substantial
witness retuning. The fixed current witness has a genuine response barrier
before `1.402`; more cover optimization cannot remove that response.

The `cap194-projection.json` experiment is an exact negative result: projecting
neighboring scale/defect recipes onto that broad cap box makes its bound
worse. It is not included in the endpoint cover.

The saved rank-one bank can be repriced at the remaining low-defect blockers,
but its shifted-response analytic majorants and extraction bridge are not
consequences of `NodeCaps` alone. A subsequent test found that two new nearby
scale nodes also certify against the original, unshifted source. Their
whole-half-line checks and the existing Lean `checkBatch` pass. They lower
box 4302 to `0.7133695405035759` under the original `NodeCaps`, without a
semiconvex interpolation cost. This local result is independently audited in
`UNSHIFTED_AUDIT.md`; `UNSHIFTED_NEXT.md` describes the next whole-cover campaign.
The current endpoint cover is unchanged by this experiment. The Lean probe
is an evaluation of the checker, not a new reflected theorem.
