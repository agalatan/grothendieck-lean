import Grothe.Lower.TransferL2

/-!
# The transfer from the Gaussian witness to finite matrices (H5, stage 3)

`TransferInputsL2 B` collects the facts about the Gaussian witness that the transfer needs: for
every `δ > 0` there are a finite measure space `(Ω, μ)` (a finite-dimensional Gaussian space), a
bounded operator `T` on `L²(μ)` (the witness `P₁,₀ − ε P₂,₁`) with the scalar cap
`‖⟪f, T g⟫‖ ≤ B` over a.e. unimodular `f, g` (the `L^∞ → L¹` norm bound), and families
`u, v : ι → L²(μ)` with `∑ₗ |uₗ|² ≤ 1`, `∑ₗ |vₗ|² ≤ 1` a.e. (the map `z ↦ z/‖z‖`, in dimension
large enough) whose value `‖∑ₗ ⟪uₗ, T vₗ⟫‖` is at least `1 − δ`.

`transfer_lower : TransferInputsL2 B → IsGrothendieckBound K → 1 / B ≤ K` follows from
`norm_pairVal_le`: finite partitions, phase choices on cells, `L²` approximation by ball-valued
simple functions, and passage to the limit.

`TransferInputsL2` does not name the operator: it asks for *some* `T` on some `L²` space.  Its
instance is the Gaussian witness `T = P₁,₀ − ε P₂,₁` of `Grothe/LowerAnalytic/Witness.lean`:
`transferInputs_of_witnessCap : (∀ n ≥ N, WitnessCap n B) → TransferInputsL2 B` proves it from
the scalar caps `WitnessCap n B` (`‖⟪f, T g⟫‖ ≤ B` for a.e. unimodular `f, g` on `L²(γ_n)`), the
value `‖∑ₗ ⟪uₗ, T uₗ⟫‖ ≥ 1 − (1+ε)/(n+1)` on `u(z) = z/‖z‖` being proved there
(`norm_pairVal_witness`). The scalar-profile identities and Gaussian reduction interface
`ReductionHyp` are developed in `WitnessCap.lean`; a checked finite cover supplies the cap.
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

end Grothe.Lower
