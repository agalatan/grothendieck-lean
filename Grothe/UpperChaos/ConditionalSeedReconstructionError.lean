import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Ring

/-!
# A single common-scalar error budget

Certificate infrastructure for the actual row227 selected-vector check.

If an actual vector C has norm at most one and C = S U with S >= sLo > 0,
then a common approximation Shat and one vector approximation Uhat satisfy
  norm(C - Shat Uhat) <= eS / sLo + abs(Shat) eU.
The estimate has no factor counting modes. It applies in any normed real
space, including a finite complex Euclidean space viewed as a real space.
For the Gaussian application C is the actual finite coefficient vector,
S is the actual positive seed, and U is its common-scalar normalization.
The caller must prove those identifications and the two approximation bounds.

No numerical enclosure or saved transcript is assumed proved by this file.
The physical parameter transport and finite-to-actual 5e-15 allowance are
separate budgets; neither is included in eS or eU by definition.

Agent-ID: codex-aa04. Refs #293, #21.
-/

namespace Grothe.UpperChaos.ConditionalSeedReconstructionError

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The lower bound on the one shared seed bounds the entire normalized
vector, using the actual vector's unit norm budget. -/
theorem norm_normalized_le_inv_lower
    {C U : E} {S sLo : ℝ}
    (hCU : C = S • U) (hsLo : 0 < sLo) (hS : sLo ≤ S)
    (hC : ‖C‖ ≤ 1) :
    ‖U‖ ≤ 1 / sLo := by
  have hSpos : 0 < S := hsLo.trans_le hS
  apply (le_div_iff₀ hsLo).2
  calc
    ‖U‖ * sLo ≤ ‖U‖ * S :=
      mul_le_mul_of_nonneg_left hS (norm_nonneg U)
    _ = ‖C‖ := by
      rw [hCU, norm_smul, Real.norm_eq_abs, abs_of_pos hSpos, mul_comm]
    _ ≤ 1 := hC

/-- A common scalar perturbation is charged once against the vector norm.
Nonnegativity of eS follows from its stated absolute-error bound, and
nonnegativity of eU follows from its stated norm-error bound. -/
theorem norm_reconstruction_error_le
    {C U Uhat : E} {S Shat sLo eS eU : ℝ}
    (hCU : C = S • U) (hsLo : 0 < sLo) (hS : sLo ≤ S)
    (hC : ‖C‖ ≤ 1)
    (hScalarError : |S - Shat| ≤ eS)
    (hVectorError : ‖U - Uhat‖ ≤ eU) :
    ‖C - Shat • Uhat‖ ≤ eS / sLo + |Shat| * eU := by
  have hU : ‖U‖ ≤ 1 / sLo := norm_normalized_le_inv_lower hCU hsLo hS hC
  have heS : 0 ≤ eS := (abs_nonneg (S - Shat)).trans hScalarError
  have hsplit : C - Shat • Uhat = (S - Shat) • U + Shat • (U - Uhat) := by
    rw [hCU, sub_smul, smul_sub]
    abel
  calc
    ‖C - Shat • Uhat‖ = ‖(S - Shat) • U + Shat • (U - Uhat)‖ := by rw [hsplit]
    _ ≤ ‖(S - Shat) • U‖ + ‖Shat • (U - Uhat)‖ := norm_add_le _ _
    _ = |S - Shat| * ‖U‖ + |Shat| * ‖U - Uhat‖ := by
      simp only [norm_smul, Real.norm_eq_abs]
    _ ≤ eS * (1 / sLo) + |Shat| * eU :=
      add_le_add
        (mul_le_mul hScalarError hU (norm_nonneg U) heS)
        (mul_le_mul_of_nonneg_left hVectorError (abs_nonneg Shat))
    _ = eS / sLo + |Shat| * eU := by ring

/-- Direct squared-radius form for a coupled finite-vector certificate.
The displayed budget itself implies R >= 0, since it bounds a norm. -/
theorem reconstruction_error_sq_le_of_budget
    {C U Uhat : E} {S Shat sLo eS eU R : ℝ}
    (hCU : C = S • U) (hsLo : 0 < sLo) (hS : sLo ≤ S)
    (hC : ‖C‖ ≤ 1)
    (hScalarError : |S - Shat| ≤ eS)
    (hVectorError : ‖U - Uhat‖ ≤ eU)
    (hBudget : eS / sLo + |Shat| * eU ≤ R) :
    ‖C - Shat • Uhat‖ ^ 2 ≤ R ^ 2 := by
  have h := (norm_reconstruction_error_le hCU hsLo hS hC hScalarError hVectorError).trans
    hBudget
  exact (sq_le_sq₀ (norm_nonneg _) ((norm_nonneg _).trans h)).2 h

end Grothe.UpperChaos.ConditionalSeedReconstructionError

/-- info: 'Grothe.UpperChaos.ConditionalSeedReconstructionError.norm_reconstruction_error_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedReconstructionError.norm_reconstruction_error_le

/-- info: 'Grothe.UpperChaos.ConditionalSeedReconstructionError.reconstruction_error_sq_le_of_budget' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSeedReconstructionError.reconstruction_error_sq_le_of_budget
