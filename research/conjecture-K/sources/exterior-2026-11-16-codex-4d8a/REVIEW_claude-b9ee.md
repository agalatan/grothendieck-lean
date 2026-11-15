# Audit of codex-4d8a's package `grothendieck_1402_audit_codex_4d8a.zip` (claude-b9ee, 16 November 2026)

The package is a copy of the user's download, kept here. Scripts were read before running; Python ran from a separate directory.

## 1. Exterior theorem at ε = 299/400 — checked

The claim: V ≤ 713263/10⁶ < 500/701 for all responses with t ≤ 0.8165 or t ≥ 0.866.

**The algebra.** I checked the transfer against the Lean statements.
- `RowHolds` (`Grothe/LowerAnalytic/Rows.lean`) is exactly V ≤ t² − 2ℓt + C − ε‖Qh + (β/ε)v‖², with the square retained.
- Its row constant is C = 2β²/ε + cap + capPad (`Row.env`, `Grothe/Lower/Boxes.lean`).
- There is one common v with ‖v‖² = 2 (`norm_vL_sq`, used in `Grothe/LowerAnalytic/Reduction.lean`).
- From these, the identities (4)–(6) of `EXTERIOR_PROOF.md` follow; I re-derived them.

**The replay.** I ran `certify_exterior_7475.py --repo` against master 1fdb667. The row hashes and rational headers match, and the cells are identical to the package's.

**An independent re-implementation** (`my_exterior_check.py`). It reads the 19 rows directly from `Grothe/Lower/RowData*.lean` and uses its own rational π bound. It confirms:
- 1,674 accepted cells;
- the only gap is [1633/2000, 433/500];
- the largest accepted cap is 0.71326287540, below 0.713263.

**Its inputs.**
- In Lean: the 19 rows, ρ, the range of t, and the crude row.
- Not in Lean: the response-energy inequality (3), which is **P+C** in the K ledger. It is needed in 165 of the 1,674 cells; the other 1,509 cells use Lean inputs only.
- So the theorem is **P+C**.

## 2. Ten central rows — benchmarks and arithmetic checked; the premises (C_i) are open

**Benchmarks.** My independent float computation (`my_benchmark_check.py`, Rice mean plus Gauss–Legendre) reproduces all ten S_i. Each lies 0.8–8·10⁻¹⁰ below its certified upper value.

**The conditional consumer.** I checked it exactly. The minimum reserve is 69664580403/13099937500000000 ≈ 5.3·10⁻⁶, at row 8, as the package states.

**The allowances are far from uniform.** Each row's maximal allowance is its reserve plus 2.5·10⁻⁵:

| rows | maximal allowance |
|---|---|
| 1–5 | 1.1·10⁻³, 8.0·10⁻⁴, 5.5·10⁻⁴, 3.5·10⁻⁴, 2.0·10⁻⁴ |
| 6–10 | 9.5·10⁻⁵, 4.3·10⁻⁵, **3.0·10⁻⁵**, 4.4·10⁻⁵, 9.9·10⁻⁵ |

So the binding core is t ∈ [0.8465, 0.8615] (rows 7–9), with allowances of 3–4.4·10⁻⁵.

**Comparison with the ledger.** The ledger's best all-sector bound for Λ̂ at the peak profile is S + 9.9·10⁻⁵, and even that is conditional on (P) and the averaged odd premise (7.5.3). Rows 7–9 need a sector assembly about three times sharper, at new profiles (ε = 0.7475).

## 3. Not re-derived here

- The phase-alignment penalty Σ ≥ (337/4000)(Im ν)².
- The weighted-Bessel cross-Gram gain.
- The shoulder rows at ε = 0.7564.
- The literature batches.
