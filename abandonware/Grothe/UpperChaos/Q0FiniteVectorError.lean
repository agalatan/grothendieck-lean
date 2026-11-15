import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.InnerProductSpace.Orthonormal
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Finite vector error bounds for actual conditional Gaussian coefficients.
Bessel controls a projected remainder, and the square-sum triangle inequality
combines coupled error budgets without a mode-count factor.
Agent-ID: codex-aa04. -/

open Finset
open scoped InnerProductSpace

namespace Grothe.UpperChaos.Q0FiniteVectorError
noncomputable section

section SquareSum
variable {ι : Type*} {V : ι → Type*} [∀ i, NormedAddCommGroup (V i)]

/-- Square-sum triangle inequality for a finite family of components. -/
theorem sum_norm_sub_sq_le (S : Finset ι) (f c : ∀ i, V i) (R T : ℝ)
    (hR : 0 ≤ R) (hT : 0 ≤ T)
    (hf : ∑ i ∈ S, ‖f i‖ ^ 2 ≤ R ^ 2)
    (hc : ∑ i ∈ S, ‖c i‖ ^ 2 ≤ T ^ 2) :
    ∑ i ∈ S, ‖f i - c i‖ ^ 2 ≤ (R + T) ^ 2 := by
  have hf' : √(∑ i ∈ S, ‖f i‖ ^ 2) ≤ R := (Real.sqrt_le_left hR).2 hf
  have hc' : √(∑ i ∈ S, ‖c i‖ ^ 2) ≤ T := (Real.sqrt_le_left hT).2 hc
  have hcross : ∑ i ∈ S, ‖f i‖ * ‖c i‖ ≤ R * T :=
    (Real.sum_mul_le_sqrt_mul_sqrt S (fun i => ‖f i‖) (fun i => ‖c i‖)).trans
      (mul_le_mul hf' hc' (Real.sqrt_nonneg _) hR)
  have hpoint : ∑ i ∈ S, ‖f i - c i‖ ^ 2 ≤
      ∑ i ∈ S, (‖f i‖ + ‖c i‖) ^ 2 := by
    apply sum_le_sum
    intro i hi
    exact pow_le_pow_left₀ (norm_nonneg _) (norm_sub_le _ _) 2
  have hexpand : (∑ i ∈ S, (‖f i‖ + ‖c i‖) ^ 2) =
      (∑ i ∈ S, ‖f i‖ ^ 2) + 2 * (∑ i ∈ S, ‖f i‖ * ‖c i‖) +
        ∑ i ∈ S, ‖c i‖ ^ 2 := by
    calc
      _ = ∑ i ∈ S, (‖f i‖ ^ 2 + 2 * (‖f i‖ * ‖c i‖) + ‖c i‖ ^ 2) := by
        apply sum_congr rfl; intro i hi; ring
      _ = _ := by rw [sum_add_distrib, sum_add_distrib, mul_sum]
  rw [hexpand] at hpoint
  nlinarith

end SquareSum

/-- Bessel controls any finite family of coefficients of one Hilbert-space
remainder, once those coefficients are identified with its inner products. -/
theorem finite_orthonormal_sample_error {ι E : Type*} [SeminormedAddCommGroup E]
    [InnerProductSpace ℂ E] (v : ι → E) (hv : Orthonormal ℂ v)
    (x : E) (s : Finset ι) (d : ι → ℂ) (e : ℝ)
    (he : 0 ≤ e) (hx : ‖x‖ ≤ e)
    (hid : ∀ j ∈ s, d j = ⟪v j, x⟫_ℂ) :
    ∑ j ∈ s, ‖d j‖ ^ 2 ≤ e ^ 2 := by
  calc
    _ = ∑ j ∈ s, ‖⟪v j, x⟫_ℂ‖ ^ 2 := by
      apply sum_congr rfl
      intro j hj
      rw [hid j hj]
    _ ≤ ‖x‖ ^ 2 := hv.sum_inner_products_le x
    _ ≤ e ^ 2 := sq_le_sq₀ (norm_nonneg _) he |>.2 hx

end
end Grothe.UpperChaos.Q0FiniteVectorError

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0FiniteVectorError.sum_norm_sub_sq_le,
      ``Grothe.UpperChaos.Q0FiniteVectorError.finite_orthonormal_sample_error] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
