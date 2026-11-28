# The identity-tail witness: start here

The Lean lower bound K_G^ℂ > 1.4020238808 (`main_bounds`) uses [a first-chaos retuning of this identity-tail witness](FIRST_CHAOS_RETUNING.md). Its two active Stein rows share both the fourth excess and the residual scale of one circular cubic. Fourteen transported ordinates, a joint gate for rows 0.82 and 0.83 and the curvature of the central Schur complement give the [scalar cap](CURVED_SCHUR.md). It replaced the cubic witness
P₁,₀ − (149/200)P₂,₁, which gave 1.401700322371 with the same machinery (rows, node caps, law nodes). This folder
records how the new witness was found and certified:

    T = P₁,₀ − ε·P₂,₁ + ν·(Id − P₁,₀ − P₂,₁),      (ε, ν) = (191/250, 47/2000).

The third term is an "identity tail": it acts pointwise, so it needs no truncation. In the model this witness gives
K ≈ 1.40212 (ledger 3.1). **The integer certificate is complete** (ledger 5.1): an exact envelope over t ∈ [0, 0.9]
stays below the design target 5000/7009 (K > 1.4018) with a margin of 5.6·10⁻⁵; its exact maximum gives
1/B = 1.4019105…. The current proof uses the same node caps. The central rows share nineteen fourth-excess intervals and gain a quadratic discount from the Schur curvature. The ordinary rows 13 and 14 share the amplitude interval containing their crossover. The final amplitude cover has 38 cells. The original identity-tail endpoint is 25000000000000/17831387166289 (`SparseEnvelope.endpoint_eq` in `Grothe/Lower/Cert/SparseEnvelope.lean`). Ledger §6 records the node-cap port. The [physical residual-scale proof](PHYSICAL_RICE.md) gives the paper endpoint 100000000000000/71325509501647 with those same inputs.

It is research material: nothing here is imported by Lean or checked by CI. The Lean proof itself lives in `Grothe/`
(the witness, the rows, the envelope and the tail node caps; `docs/LEAN_DETAILS.md`), ported as ledger §6 describes.

| file | what it is |
|---|---|
| `README.md` | this file |
| [`STATUS.md`](STATUS.md) | **the ledger**: every statement with its scope, status, author and source |
| [`INVENTORY.md`](INVENTORY.md) | what is kept outside the repository, with paths |
| `sources/` | verbatim copies of the working notes: the feasibility study, the correction lemma with its referee report, the go/no-go note with the Lean plan, the report of stage 0 at its first hand-back, and the complete certificate (`stage0d-2026-11-17/`: the final statement and work log, the two independent checks, the exact row constants, the manifests and the design note of Lean stage 2) |
| `code/` | the reference implementation of the lemma's coefficient and its exact and numerical checks |

`STATUS.md` is the living record ([`../README.md`](../README.md)); the copies under `sources/` stay verbatim and keep
their dated claims.

## The route in brief

- **Why a tail.** Changing ε alone cannot pass 1.40185. A small positive tail lowers the plateau of the row values,
  but only if it is kept **pointwise** inside the fibre potential: |A| + |B| becomes
  Ψ_ν(A, B) = sup over unimodular (f, g) of Re(f̄A) + Re(ḡB) + ν̂·Re(f̄g).
- **What that costs.** The node caps bound the fibre potential by a pointwise majorant. The majorant of the previous
  certificate (Alon–Fürer eq. (4)) is built for |A| + |B|. For Ψ_ν it needs a rank-one correction
  with a new coefficient γ\*. That lemma is a Lean theorem (ledger §2), and without it the caps are unusable.
- **What has to be rebuilt.** The witness and its reduction chain, the fibre potential, the cap kernel, all rows, all
  cap modules and their registry, the law nodes and the refined cover. The node-cap run for the final row set is
  estimated at about 300 vCPU-hours on GitHub-hosted runners (ledger 4.1).
- **The plan.** Stage 0: a pure-integer certificate outside Lean, as a go/no-go gate; it is complete (ledger 5.1).
  Stage 1: generalise the Lean development in place, instantiated at the previous witness, so that nothing changes
  yet. Stage 2: one pull request with every change that invalidates the node caps (ledger 6.3). All three stages are
  done (#525).

**Reading order:** [`STATUS.md`](STATUS.md) §5, §6 and §7, then `sources/stage0d-2026-11-17/PROGRESS.md` (its §0: the
statement, the pieces and who checked what), `sources/stage0d-2026-11-17/LEAN_STAGE2_DESIGN.md` (the Lean plan of
record), `sources/stage0c-2026-11-16/STAGE0C.md` (the verdict and the numbers of the model) and
`sources/lemma-2026-11-15/PROOF.tex`. The work runs under issue #183.

## Notation

- P_{m,n}: the projection onto the complex Wick chaos of bidegree (m, n).
- Hat units: T = (1 − ν)·[P₁,₀ − ε̂P₂,₁ + ν̂·Id] with ε̂ = (ε + ν)/(1 − ν) = 25/31 and ν̂ = ν/(1 − ν) = 47/1953. A row value
  in original units is N = (1 − ν)·cap_hat + ν.
- Targets: 5000/7009 = 0.713368526 (K > 1.4018, the design target) and 500/701 = 0.713266762 (K > 1.402, not reached).
  The sharp envelope gives B = 0.7133120707647… (5.7); the shared gate lowers B̂ by a further 2.43·10⁻⁶ (5.8).
- Prices d₂, d₃ of a cell; e_i = d_i − ν̂, σ = e₂ + e₃, δ = e₃ − e₂, Δ = d₂d₃ − ν̂².
- Route M: the localised node caps of the previous certificate (its rows 12–15), as opposed to anchored caps.
