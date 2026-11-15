# Amplitude-adaptive compact (P) cover

Agent-ID: codex-a7c4. Refs #431.

This checker widens the normalized-remainder tube by tensor interpolation
in shift and coefficients, with wider boxes away from the tight amplitude.
It does not claim a full compact cover or a new Grothendieck lower endpoint.
The source quadrature is the unchanged, independently reviewed
`../normalized-remainder-codex-a7c4/normalized_integral.cpp`.
The new interpolation proof is in
`../../sources/adaptive-cover-codex-a7c4/PROOF.md`.

The key new estimate is a distributional lower curvature bound
`R_ww >= -480 S`, uniform in amplitude and valid at perturbed norm zeros.
`shift_curvature.cpp` certifies the density and mass bounds used by its
potential argument. The exact runner adds the coefficient and amplitude
interpolation reserves, rounded upward, before checking each source integral.
Complex conjugation accounts for the opposite imaginary-A corners.

The region has A=tau(1+i x), B=tau(y+i z), with
`|x|,|z|,|y-37/64| <= r` and `|w-3/5| <= delta/2`:

| amplitude tau | r | delta |
|---|---|---|
| [0,1/8] | 1/8 | 1/64 |
| [1/8,1/4] | 1/16 | 1/128 |
| [1/4,1/2] | 1/32 | 1/128 |
| [1/2,5/8] | 1/16 | 1/64 |
| [5/8,7/8] | 1/8 | 1/32 |

The existing S_physical>=3/4 exterior handles tau>=7/8. Thus the smallest
box (r=1/32, delta=1/128) is amplitude-complete. Compared with the earlier
tube, each of its three direction widths is 128 times larger and its shift
width is 16 times larger. These are coordinate-width comparisons, not a
fraction of the unresolved global domain.

Run from the repository root (requires clang++ and Python standard library):

```sh
python3 research/conjecture-K/code/adaptive-cover-codex-a7c4/verify.py --smoke
python3 research/conjecture-K/code/adaptive-cover-codex-a7c4/verify.py --output handoff/adaptive-receipt.json
python3 research/conjecture-K/code/adaptive-cover-codex-a7c4/verify.py --combine handoff/adaptive-receipt.json --output handoff/adaptive-result.json
```

For sharding, set SHARD and NSHARDS; combine all resulting receipts. No saved
receipt is an input to a fresh source check. The aggregator regenerates the
65-cell amplitude chain and requires all 560 distinct corner jobs. It rejects
missing/duplicate corners, stale source hashes, changed job descriptions and
non-strict numerical comparisons. Shard outputs never claim a complete tube.

Every fresh run also checks the uniform shift constant, inherited density
and tail certificates, rejection of disabled assertions and fast math, and
an impossible reserve. Temporary binaries live in owned `handoff/` directories
and are removed when the run exits. No Lean modules are built or changed.

Outward arithmetic does not promise bit-for-bit numerical receipts across
platforms: final bits and adaptive cell counts can differ. The source hashes,
exact job descriptions, complete coverage and strict inequalities identify
the claim. A receipt is a record of a run, not a substitute for fresh execution
or a Lean certificate.

The complete replay passed on [cloud run 43712939581](https://github.com/agalatan/grothendieck-lean/actions/runs/43712939581)
(two shards: 366 s and 244 s). `result.json` is the exact combined receipt;
all 560 jobs and all 65 amplitude cells are present. The interval shift
calculation gives density cap <95.799 and mass <132.314, below 100 and 140.
The largest source check used 82,376 cells, below its 300,000 cap. Separate
negative controls also reject partial coverage, changed rational jobs,
negative indices, duplicate/missing corners, stale hashes and zero margin.
The strengthened result is **P+C**: claude-b9ee independently re-derived the proof
and replayed all 560 jobs and the exact aggregation ([review #443](https://github.com/agalatan/grothendieck-lean/pull/443#issuecomment-6894473978)).
