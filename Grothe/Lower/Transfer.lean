import Grothe.Lower.TransferL2
import Grothe.Lower.Endpoint

/-!
# The transfer from the Gaussian witness to finite matrices (H5, stage 3)

`TransferInputsL2 B` collects the facts about the Gaussian witness that the transfer needs: for
every `δ > 0` there are a finite measure space `(Ω, μ)` (a finite-dimensional Gaussian space), a
bounded operator `T` on `L²(μ)` (the witness `P₁,₀ − ε P₂,₁`) with the scalar cap
`‖⟪f, T g⟫‖ ≤ B` over a.e. unimodular `f, g` (the `L^∞ → L¹` norm bound), and families
`u, v : ι → L²(μ)` with `∑ₗ |uₗ|² ≤ 1`, `∑ₗ |vₗ|² ≤ 1` a.e. (the map `z ↦ z/‖z‖`, in dimension
large enough) whose value `‖∑ₗ ⟪uₗ, T vₗ⟫‖` is at least `1 − δ`.

* `transfer_lower : TransferInputsL2 B → IsGrothendieckBound K → 1 / B ≤ K` (from
  `norm_pairVal_le`: finite partitions, phase choices on cells, `L²` approximation by ball-valued
  simple functions, passage to the limit);
* `lower_bound_of_transferL2 : TransferInputsL2 Bcap → IsGrothendieckBound K → Llow < K`,
  composing with `lower_endpoint`.

**What remains hypothetical** is exactly `TransferInputsL2 Bcap` for the Gaussian witness:
(i) the scalar cap `‖⟪f, T g⟫‖ ≤ Bcap` for a.e. unimodular `f, g` (the conclusion of the
certificate `lower_bound_data` through the Gaussian reduction hypothesis), and (ii) the value
`∑ₗ ⟪uₗ, T uₗ⟫ ≥ 1 − δ` of the witness on `u(z) = z/‖z‖` in dimension large enough.  Nothing
else is assumed.
-/

namespace Grothe.Lower

open MeasureTheory

/-- The inputs of the transfer: for every `δ > 0`, a finite measure space, a bounded operator
`T` on `L²(μ)` with the scalar cap `B` over the a.e. unimodular functions, and families
`u, v : ι → L²(μ)` in the unit ball of `L^∞(μ; ℓ²_ι)` with `1 − δ ≤ ‖∑ₗ ⟪uₗ, T vₗ⟫‖`. -/
def TransferInputsL2 (B : ℝ) : Prop :=
  ∀ δ : ℝ, 0 < δ →
    ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsFiniteMeasure μ)
      (T : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ) (ι : Type) (_ : Fintype ι) (u v : ι → Lp ℂ 2 μ),
      ScalarCap μ T B ∧ (∀ᵐ ω ∂μ, ∑ ℓ, ‖u ℓ ω‖ ^ 2 ≤ 1) ∧ (∀ᵐ ω ∂μ, ∑ ℓ, ‖v ℓ ω‖ ^ 2 ≤ 1) ∧
      1 - δ ≤ ‖pairVal T u v‖

/-- **The lower transfer (H5).**  `IsGrothendieckBound K → 1 / B ≤ K` from the transfer
inputs. -/
theorem transfer_lower {B K : ℝ} (hT : TransferInputsL2 B) (hK : IsGrothendieckBound K) :
    1 / B ≤ K := by
  have h : 1 ≤ K * B := le_of_forall_sub_le fun δ hδ => by
    obtain ⟨Ω, _, μ, _, T, ι, _, u, v, hcap, hu, hv, hval⟩ := hT δ hδ
    exact hval.trans (norm_pairVal_le μ hK hcap hu hv)
  have hB : 0 < B := pos_of_mul_pos_right (a := K) (by linarith) (by linarith [hK.one_le])
  rw [div_le_iff₀ hB]
  exact h

/-- The strict lower endpoint from the transfer inputs at the certified cap `Bcap`. -/
theorem lower_bound_of_transferL2 {K : ℝ} (hT : TransferInputsL2 (Bcap : ℝ))
    (hK : IsGrothendieckBound K) : (Llow : ℝ) < K :=
  lower_endpoint K (transfer_lower hT hK)

end Grothe.Lower
