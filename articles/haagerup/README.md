# Disproving Haagerup's Conjecture on the Complex Grothendieck Constant (`K_G^ℂ < 1 / γ†`)

This directory contains a **self-standing, isolated Lean 4 formalization** intended as a presentation-oriented companion package for the accompanying `.tex` article. It depends **only on Mathlib** (`v4.34.1`) and is completely detached from the main `Grothe` package and build pipeline.

## Main Result

In [`Haagerup/Statement.lean`](Haagerup/Statement.lean) and [`Haagerup.lean`](Haagerup.lean), we define:

* `scalarOpt A = sup_{|εᵢ| = |δⱼ| = 1} ‖∑ᵢⱼ Aᵢⱼ conj(εᵢ) δⱼ‖`
* `vectorOpt A = sup_{‖xᵢ‖ = ‖yⱼ‖ = 1} ‖∑ᵢⱼ Aᵢⱼ ⟪xᵢ, yⱼ⟫‖`
* `IsBound K := ∀ m n (A : Fin m → Fin n → ℂ), vectorOpt A ≤ K * scalarOpt A`
* `complexGrothendieckConstant := sInf {K | IsBound K}`
* `gammaDagger := ∫ t in (0 : ℝ)..(Real.pi / 2), Real.cos t ^ 2 / √(1 + Real.sin t ^ 2)` (`γ† = 0.7119586597782638…`, so `1 / γ† = 1.4045759346637420…`)

and prove without `sorry` or custom axioms:

```lean
theorem isBound_cert :
    Statement.IsBound (140457588 / 100000000 : ℝ)

theorem upper_below_haagerup :
    Statement.UpperBelow (1 / Statement.gammaDagger)

theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Statement.gammaDagger
```

establishing `K_G^ℂ ≤ 1.40457588 < 1 / γ†`.

## Mathematical & Proof Architecture

The proof uses a compact **6-channel** radial Fourier inversion certificate (`K = 251` head terms + Hardy circle-mean tail bounds) built from two `64 × 64 × 36` polar cell maps (`T_cell` and `f_tig`) together with Haagerup's 1D phase rounding map `z ↦ z / ‖z‖`:

| Layer | Modules | Role |
|---|---|---|
| **Statement & `γ†` Bound** | `Haagerup/Statement.lean`, `Haagerup/GammaDagger.lean` | Standalone definitions of `K_G^ℂ` and `γ†`; algebraic rational enclosure `1.40457588 < 1 / γ†` via a degree-14 binomial polynomial on `[0, 1]`. |
| **Precompiled Computational Kernel** (`Init` only) | `HaagerupKernel/Basic.lean`, `Table.lean`, `Hardy.lean`, `CellKernel.lean` | Fixed-point interval arithmetic (`D = 2¹²⁸`), polynomial head convolution `bivarT`, adaptive Gaussian circle-mean verifier `circleMeanOK`, Fejér–Riesz SOS checker `sosAllOK`, and 1024-bit square-root-free Laguerre/Hermite overlap evaluators. |
| **Gaussian Chaos & Rounding Realisation** | `Haagerup/Transfer.lean`, `GaussianCore.lean`, `ChaosRealise.lean` | Multi-channel convex transfer `convex_transfer_ival`, 2D complex Hermite completeness, Hilbert-space tensor realisation `rounding_diskKernel`, rotated Ornstein–Uhlenbeck smoothing `smoothMap`, and exact binomial overlap `integral_H2_smoothMap`. |
| **Schur Positivity & Hardy Tail Bounds** | `Haagerup/SchurGaussian.lean`, `SchurHardy.lean` | Schur product theorem for Hermitian positive semidefinite matrices, holomorphic extension of `4 × 4` Gaussian expectations on disks `|t| < R`, and master Hardy budget theorems `hardy_smoothed_channel` and `hardy_unsmoothed_channel`. |
| **Cell Maps & Polar Overlaps** | `Haagerup/CellMap.lean`, `CellHermite.lean`, `CellOverlap.lean` | Unit-disk norm bound `‖cellFn u‖ ≤ 1` from `sosAllOK`, polar Hermite–Laguerre overlap identity `integral_H2_cellFn_charge_one` (`2π · π⁻¹ · (1/2) = 1`), square-root-free `smoothed_energy_eq`, and soundness of `tigMuCheck` and `smoothedRowsCheck`. |
| **Certificate Data & Final Assembly** | `Haagerup/Data/*.lean`, `Haagerup/CertCheck.lean`, `Haagerup.lean`, `Axioms.lean` | `64 × 64 × 36` cell + Fejér–Riesz SOS witnesses (`TCellData`, `TigerData`), precomputed overlap tables (`OverlapData`), 6-channel verification (`CertCheck`), top-level theorems (`Haagerup`), and `#guard_msgs` axiom check (`Axioms`). |

## Building & Auditing Locally

From inside `articles/haagerup/`:

```bash
# 1. Fetch prebuilt Mathlib cache (first run only)
lake exe cache get

# 2. Build with warnings-as-errors
LEAN_NUM_THREADS=2 lake build Haagerup --wfail --log-level=warning

# 3. Verify zero sorry / custom axioms / unsafe escapes
! grep -rn --include='*.lean' -E '\bsorry\b|^[[:space:]]*(private[[:space:]]+)?axiom[[:space:]]|implemented_by|@\[extern|\bunsafe\b|debug\.skipKernelTC|Task\.spawn' Haagerup HaagerupKernel Haagerup.lean HaagerupKernel.lean

# 4. Run kernel axiom audit
lake env lean Axioms.lean
```

## Isolated CI Workflow

CI for this companion package lives in [`.github/workflows/article-haagerup.yml`](../../.github/workflows/article-haagerup.yml) and triggers **only** when files under `articles/haagerup/**` (or that workflow file itself) are modified.
