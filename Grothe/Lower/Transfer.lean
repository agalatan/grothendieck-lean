import Grothe.Lower.TransferLimit
import Grothe.Lower.Endpoint

/-!
# The transfer from the Gaussian witness to finite matrices (H5, stage 3)

**What is proved.**  `TransferInputs B` collects the facts about the Gaussian witness that the
transfer needs, in the abstract setting of `Grothe.Lower.TransferLimit`: for every `δ > 0`
there are a complex inner product space `H` (the role of `L²` of a finite-dimensional Gaussian
space), a bounded operator `T` (the witness `P₁,₀ − ε P₂,₁`), an admissible class `U` (the a.e.
unimodular functions) with the scalar cap `ScalarCap T U B` (the `L^∞ → L¹` norm bound), and an
approximable vector pair `(u, v)` (the unit-vector-valued map `z ↦ z/‖z‖`, in dimension large
enough) whose value `‖∑ₗ ⟪uₗ, T vₗ⟫‖` is at least `1 − δ`.

* `transfer_lower : TransferInputs B → IsGrothendieckBound K → 1 / B ≤ K`.
* `lower_bound_of_transfer : TransferInputs Bcap → IsGrothendieckBound K → Llow < K`, composing
  with `lower_endpoint`.

**What remains hypothetical.**  `TransferInputs Bcap` itself: its measure-theoretic form is
`TransferInputsL2` in `Grothe.Lower.TransferL2` (which proves the approximability of bounded
measurable vector functions by cell-constant ones, so that only the scalar cap and the Gaussian
value of the witness remain), and that form is not derived here from the certificate
(`lower_bound_data` bounds the scalar profile values of the Gaussian reduction, whose link to the
`L^∞ → L¹` norm of the operator is the Gaussian reduction hypothesis).
-/

namespace Grothe.Lower

/-- The inputs of the transfer: for every `δ > 0`, a space, an operator with the scalar cap `B`
over an admissible class, and an approximable vector pair of value at least `1 − δ`. -/
structure TransferInputs (B : ℝ) : Prop where
  pos : 0 < B
  witness : ∀ δ : ℝ, 0 < δ →
    ∃ (H : Type) (_ : NormedAddCommGroup H) (_ : InnerProductSpace ℂ H) (T : H →L[ℂ] H)
      (U : Set H) (ι : Type) (_ : Fintype ι) (u v : ι → H),
      ScalarCap T U B ∧ Approximable U u v ∧ 1 - δ ≤ ‖pairVal T u v‖

/-- **The lower transfer (H5).**  `IsGrothendieckBound K → 1 / B ≤ K` from the transfer
inputs. -/
theorem transfer_lower {B K : ℝ} (hT : TransferInputs B) (hK : IsGrothendieckBound K) :
    1 / B ≤ K := by
  have h : 1 ≤ K * B := by
    apply le_of_forall_sub_le
    intro δ hδ
    obtain ⟨H, _, _, T, U, ι, _, u, v, hcap, happ, hval⟩ := hT.witness δ hδ
    exact hval.trans (pairVal_le_of_approx hK hcap happ)
  rw [div_le_iff₀ hT.pos]
  exact h

/-- The strict lower endpoint from the transfer inputs at the certified cap `Bcap`. -/
theorem lower_bound_of_transfer {K : ℝ} (hT : TransferInputs (Bcap : ℝ))
    (hK : IsGrothendieckBound K) : (Llow : ℝ) < K :=
  lower_endpoint K (transfer_lower hT hK)

end Grothe.Lower
