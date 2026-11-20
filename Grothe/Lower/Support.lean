import Grothe.Lower.Stein
import Grothe.Lower.SpecRows
import Grothe.Lower.Envelope

/-!
# From the Gaussian reduction of the rows to the norm cap

The Gaussian reduction of the witness (in hat units, weight `ε`) for a fixed admissible pair produces
*one* residual `p = Q_w c₁` in the cubic chaos of the remote coordinates, with scale `τ = ‖p‖₂`
and normalized law `U = |p|²/τ²`, and *one* gate variable `X = Q_w(c₁, c_A, conj c_B)` whose
first coordinate is `p`; every row `r` then satisfies, with its own potential `Ψ_r` (node caps up
to `capPad`, convex, `smax`-Lipschitz) and its retained gate square,

  `V ≤ t² − 2ℓt + 2β²/ε + E Ψ_r(δ_r τ √U) − δ_r τ² − E[X*N_r X + 2 Re(conj p (g_r·X))]
       − ε ‖Qh + (β/ε) v‖²`

(`SharedReduction`, one law and one gate variable for all rows).  Completing the square over
`(X₂, X₃)` and the certified row cap give the scalar inequality of every row (`rowOf_of_shared`),
which the envelope (`env_bound`) mixes into the cap of `V`.
-/

open MeasureTheory

namespace Grothe.Lower

open LowerAnalytic

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The data of one row in the shared reduction with the potential `Ψ`: the node caps of the row
(up to `capPad`), integrability at the common scale, the integrable gate expression of the common
gate variable, and the row inequality with the retained gate square. -/
def RowSharedWith {Ω : Type*} [MeasurableSpace Ω] (r : Row) (Ψ : ℝ → ℝ) (μ : Measure Ω) (U : Ω → ℝ)
    (X1 X2 X3 : Ω → ℂ) (τ V t : ℝ) (Qh v : E) : Prop :=
  CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax ∧
    Integrable (fun ω => Ψ (r.delta * τ * √(U ω))) μ ∧
    Integrable (fun ω => r.gate (X1 ω) (X2 ω) (X3 ω)) μ ∧
    V ≤ t ^ 2 - 2 * r.ell * t + 2 * r.beta ^ 2 / ε + ∫ ω, Ψ (r.delta * τ * √(U ω)) ∂μ
      - r.delta * τ ^ 2 - ∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
      - ε * ‖Qh + ((r.beta : ℝ) / ε) • v‖ ^ 2

/-- The data of one row in the shared reduction, for some potential (`RowSharedWith`). -/
def RowShared {Ω : Type*} [MeasurableSpace Ω] (r : Row) (μ : Measure Ω) (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ)
    (τ V t : ℝ) (Qh v : E) : Prop :=
  ∃ Ψ : ℝ → ℝ, RowSharedWith r Ψ μ U X1 X2 X3 τ V t Qh v

/-- **The simultaneous Gaussian reduction of the rows**: one probability space with one normalized
law `U` (moment bounds and the inputs of the Stein cuts, `GramInputs`), one scale `0 ≤ τ ≤ ρ` and one gate
variable `X = (X₁, X₂, X₃)` with `|X₁|² = τ² U` (its first coordinate is the residual), such that
every row satisfies its inequality with its own potential and the retained gate square
(`RowShared`). -/
def SharedReduction (rows : List Row) (V t : ℝ) (Qh v : E) : Prop :=
  ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
    (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ) (τ x : ℝ),
    Moments μ U x ∧ GramInputs μ U ∧ 0 ≤ τ ∧ τ ≤ ρ ∧ (∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) ∧
    ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v

/-- **A certified row holds in the shared reduction**: completing the gate square with its first
coordinate fixed costs `gatePrice · τ² ≥ (κδ² − δ) τ²`, and the certified row bound at
`σ = δτ ≤ δρ` gives `V ≤ t² − 2ℓt + 2β²/ε + cap + capPad − ε‖Qh + (β/ε)v‖²`. -/
theorem rowOf_of_shared (r : Row) (hr : RowFacts r) {Ω : Type} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ} {X1 X2 X3 : Ω → ℂ} {τ x : ℝ}
    (hM : Moments μ U x) (hS : SteinCut μ U) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) {V t : ℝ} {Qh v : E}
    (h : RowShared r μ U X1 X2 X3 τ V t Qh v) : RowOf r.env V t Qh v := by
  obtain ⟨Ψ, hΨ, hf, hg, hV⟩ := h
  obtain ⟨hδ, hok, hκ, hb⟩ := hr
  have hδR : (0 : ℝ) ≤ r.delta := by exact_mod_cast hδ.le
  have hG : (gatePrice r.N r.g1 r.g2 r.g3 : ℝ) * τ ^ 2 ≤ ∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ :=
    gate_integral_ge r.N r.g1 r.g2 r.g3 hok X1 X2 X3 τ hX hM hg
  have hκR : (r.kappa : ℝ) * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3 := by
    exact_mod_cast hκ
  have hbd := hb Ω μ U x (fun s => Ψ s - capPad) (r.delta * τ) hM hS hΨ (mul_nonneg hδR hτ0)
    (mul_le_mul_of_nonneg_left hτ1 hδR) (hf.sub (integrable_const _))
  rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul] at hbd
  have hsq := mul_nonneg (sub_nonneg.2 hκR) (sq_nonneg τ)
  unfold RowOf RowHolds Row.env
  push_cast
  nlinarith [hV, hG, hsq, hbd]

end Grothe.Lower
