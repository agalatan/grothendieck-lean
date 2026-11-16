# The identity-tail witness: start here

The proved lower bound K_G^ℂ > 1.401700322371 comes from the cubic witness P₁,₀ − (149/200)P₂,₁. This folder records
a route to a larger **Lean** lower bound with the same machinery (rows, node caps, law nodes, cover) and a slightly
different witness:

    T = P₁,₀ − ε·P₂,₁ + ν·(Id − P₁,₀ − P₂,₁),      (ε, ν) = (191/250, 47/2000).

The third term is an "identity tail": it acts pointwise, so it needs no truncation. In the model this witness gives
K ≈ 1.40212, with a margin of 1.6·10⁻⁴ to the target **1.4018** and 6·10⁻⁵ to 1.402. The integer certificate (ledger
§5) confirms the plateau of rows below the 1.4018 target, with a margin of 6 to 8·10⁻⁵; the rows at small t are not
certified yet, and 1.402 is not reached with its tables.

It is research material: nothing here is imported by Lean or checked by CI. The one exception is noted where it
occurs: the lemma of §2 of the ledger is the Lean theorem `anchored_pair_nu` in
`Grothe/LowerAnalytic/CapMajorant.lean`.

| file | what it is |
|---|---|
| `README.md` | this file |
| [`STATUS.md`](STATUS.md) | **the ledger**: every statement with its scope, status, author and source |
| [`INVENTORY.md`](INVENTORY.md) | what is kept outside the repository, with paths |
| `sources/` | verbatim copies of the working notes: the feasibility study, the correction lemma with its referee report, the go/no-go note with the Lean plan, and the report of stage 0 at its first hand-back |
| `code/` | the reference implementation of the lemma's coefficient and its exact and numerical checks |

`STATUS.md` is the living record ([`../README.md`](../README.md)); the copies under `sources/` stay verbatim and keep
their dated claims.

## The route in brief

- **Why a tail.** Changing ε alone cannot pass 1.40185. A small positive tail lowers the plateau of the row values,
  but only if it is kept **pointwise** inside the fibre potential: |A| + |B| becomes
  Ψ_ν(A, B) = sup over unimodular (f, g) of Re(f̄A) + Re(ḡB) + ν̂·Re(f̄g).
- **What that costs.** The node caps bound the fibre potential by a pointwise majorant. Today's majorant (Alon–Fürer
  eq. (4), `anchored_pair`) is built for |A| + |B|. For Ψ_ν it needs a rank-one correction with a new coefficient γ*.
  That lemma is proved (ledger §2), and without it the caps are unusable.
- **What has to be rebuilt.** The witness and its reduction chain, the fibre potential, the cap kernel, all rows, all
  cap modules and their registry, the law nodes and the refined cover. The node-cap rebuild for the final tables
  of stage 0 is estimated at 490 vCPU-hours of CI (ledger 4.1).
- **The plan.** Stage 0: a pure-integer certificate outside Lean, as a go/no-go gate. Stage 1: generalise the Lean
  development in place, instantiated at today's witness, so that nothing changes yet. Stage 2: one pull request
  with every change that invalidates the node caps.

**Reading order:** [`STATUS.md`](STATUS.md) §1–§3, then `sources/stage0c-2026-11-16/STAGE0C.md` (the verdict, the numbers
and §7, the Lean plan), then `sources/lemma-2026-11-15/PROOF.tex`. The work runs under issue #183.

## Notation

- P_{m,n}: the projection onto the complex Wick chaos of bidegree (m, n).
- Hat units: T = (1 − ν)·[P₁,₀ − ε̂P₂,₁ + ν̂·Id] with ε̂ = (ε + ν)/(1 − ν) = 25/31 and ν̂ = ν/(1 − ν) = 47/1953. A row value
  in original units is N = (1 − ν)·cap_hat + ν.
- Targets: 5000/7009 = 0.713368526 (K > 1.4018) and 500/701 = 0.713266762 (K > 1.402).
- Prices d₂, d₃ of a cell; e_i = d_i − ν̂, σ = e₂ + e₃, δ = e₃ − e₂, Δ = d₂d₃ − ν̂².
- Route M: the localised node caps of the present certificate (rows 12–15), as opposed to anchored caps.
