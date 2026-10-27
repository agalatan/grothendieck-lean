import Grothe.UpperChaos.ConditionalGaussianBase
import LeanCert.Validity.IntegrationDyadic
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.NormNum

/-!
# Kernel-checked conditional Gaussian slice

The fused dyadic checker bounds a unit-parameter slice with 16 cells,
including an explicit check of reciprocal domains. No production error
bound or new Grothendieck endpoint is asserted.

Original pilot: codex-cf82. Explicit checker and Gaussian binding: codex-8c4d.
Restoration and axiom audit: codex-aa04.
-/

open MeasureTheory
open LeanCert.Core LeanCert.Engine LeanCert.Validity.IntegrationDyadic

namespace Grothe.UpperChaos.LeanCertPilot

noncomputable def unitBaseSlice (u : ℝ) : ℝ :=
  2 * Real.exp (-(u ^ 2 / (1 + u ^ 2))) / (1 + u ^ 2) ^ 2

private def sliceVar : Expr := .var 0
private def sliceSq : Expr := .pow sliceVar 2
private def sliceDen : Expr := .add (.const 1) sliceSq
private def sliceExpr : Expr :=
  .mul (.const 2) (.mul (.exp (.neg (.div sliceSq sliceDen))) (.inv (.pow sliceDen 2)))
private def unitInterval : IntervalRat := ⟨0, 1, by norm_num⟩

private theorem eval_sliceExpr (u : ℝ) :
    Expr.eval (fun _ => u) sliceExpr = unitBaseSlice u := by
  simp [sliceExpr, sliceVar, sliceSq, sliceDen, Expr.eval, Expr.pow, Expr.div,
    unitBaseSlice, div_eq_mul_inv, pow_two, mul_assoc]

private theorem slice_integrable : IntervalIntegrable unitBaseSlice volume 0 1 := by
  have hsq : Continuous (fun u : ℝ => u ^ 2) := continuous_id.pow 2
  have hden : Continuous (fun u : ℝ => 1 + u ^ 2) := continuous_const.add hsq
  have hden0 : ∀ u : ℝ, 1 + u ^ 2 ≠ 0 := by intro u; positivity
  have hratio : Continuous (fun u : ℝ => u ^ 2 / (1 + u ^ 2)) := hsq.div hden hden0
  have hnum : Continuous (fun u : ℝ => 2 * Real.exp (-(u ^ 2 / (1 + u ^ 2)))) :=
    continuous_const.mul hratio.neg.rexp
  have hden2 : Continuous (fun u : ℝ => (1 + u ^ 2) ^ 2) := hden.pow 2
  have hden20 : ∀ u : ℝ, (1 + u ^ 2) ^ 2 ≠ 0 := by intro u; positivity
  exact (hnum.div hden2 hden20).intervalIntegrable 0 1

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem slice_check : checkIntegralBoundsDyadicFull sliceExpr unitInterval 16 1 (5/4) {} = true := by
  decide +kernel

theorem unitBaseSlice_integral_enclosure :
    (1 : ℝ) ≤ (∫ u in (0 : ℝ)..1, unitBaseSlice u) ∧
      (∫ u in (0 : ℝ)..1, unitBaseSlice u) ≤ (5 / 4 : ℝ) := by
  have hint : IntervalIntegrable (fun x => Expr.eval (fun _ => x) sliceExpr) volume
      unitInterval.lo unitInterval.hi := by
    have hfun : (fun x => Expr.eval (fun _ => x) sliceExpr) = unitBaseSlice :=
      funext eval_sliceExpr
    rw [hfun]
    simpa [unitInterval] using slice_integrable
  have h := integral_bounds_of_check_dyadic sliceExpr unitInterval 16 (by norm_num) 1 (5/4)
    {} (by decide) slice_check hint
  have hfun : (fun x => Expr.eval (fun _ => x) sliceExpr) = unitBaseSlice :=
    funext eval_sliceExpr
  simpa [unitInterval, hfun] using h

end Grothe.UpperChaos.LeanCertPilot

namespace Grothe.UpperChaos.LeanCertPilot

/-- The unit slice is the transformed norm of the actual conditional base
    integral. The auxiliary substitution is `t = u²`, with Jacobian `2u`. -/
theorem unitBaseSlice_eq_conditional_base (u : ℝ) (hu : 0 < u) :
    unitBaseSlice u =
      2 * u * ‖∫ w, Grothe.Haag.phaseLaplaceKernel ((1 : ℂ) + w) (u ^ 2)
        ∂Grothe.LowerAnalytic.gaussC‖ := by
  have ht : 0 < u ^ 2 := sq_pos_of_pos hu
  have hrpow : (u ^ 2) ^ (-(1 / 2 : ℝ)) = u⁻¹ := by
    rw [Real.rpow_neg ht.le, ← Real.sqrt_eq_rpow, Real.sqrt_sq_eq_abs, abs_of_pos hu]
  have h := norm_integral_affine_phaseLaplace_base 1 1 (u ^ 2) (1 : ℂ) (by norm_num) ht
  norm_num at h
  rw [h, hrpow]
  unfold unitBaseSlice
  field_simp

end Grothe.UpperChaos.LeanCertPilot
