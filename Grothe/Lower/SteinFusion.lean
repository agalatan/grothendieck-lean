import Grothe.Lower.Stein
import Mathlib.Analysis.InnerProductSpace.Projection.Basic

/-!
# Merge Stein tests before eliminating their common fluctuation variables

All tests use the SAME radial Stein kernel. The quadratic-over-linear
perspective gives an explicit saving when tests are merged before completing
squares. This is stronger than merely imposing every old completed cut.

The universal expectation theorem remains `spec_of_inputs`; the new merged
test is another admissible input to that existing theorem. Concrete rational
atomic-law exclusions are replayed by the accompanying standard-library tool,
not asserted here as native-decide facts or new Grothendieck endpoints.
-/

namespace Grothe.Lower.SteinFusion

noncomputable section

theorem perspective_variance (a b x y : ℝ) (ha : 0 < a) (hb : 0 < b) :
    x^2/a + y^2/b - (x+y)^2/(a+b) =
      (b*x-a*y)^2/(a*b*(a+b)) := by
  have hab : a+b ≠ 0 := ne_of_gt (add_pos ha hb)
  field_simp [ne_of_gt ha, ne_of_gt hb, hab]
  ring

theorem perspective_fusion_le (a b x y : ℝ) (ha : 0 < a) (hb : 0 < b) :
    (x+y)^2/(a+b) ≤ x^2/a + y^2/b := by
  have h := perspective_variance a b x y ha hb
  have hp : 0 < a*b*(a+b) := mul_pos (mul_pos ha hb) (add_pos ha hb)
  have hn := div_nonneg (sq_nonneg (b*x-a*y)) hp.le
  linarith

/-- Unit-price tests have an exactly computable conditional-variance saving.
No assumption on the signs of the two old cut values is needed. -/
theorem unit_fusion_identity (w f1 f2 g1 g2 a1 a2 : ℝ) :
    w*(f1^2+2*g1^2+a1) + (1-w)*(f2^2+2*g2^2+a2) -
      ((w*f1+(1-w)*f2)^2+2*(w*g1+(1-w)*g2)^2+w*a1+(1-w)*a2) =
      w*(1-w)*((f1-f2)^2+2*(g1-g2)^2) := by
  ring

/-- Exact specialization to the existing spectral-cut cell formula. Mesh
refinement makes both tests affine on the same cell. The value at zero is
included with the original convention `d(0)=0`. -/
theorem specCellG_unit_fusion (w A1 B1 e1 be1 A2 B2 e2 be2 u : ℝ) :
    w*specCellG A1 B1 e1 1 (1/2) (-1/6) be1 0 u +
      (1-w)*specCellG A2 B2 e2 1 (1/2) (-1/6) be2 0 u -
      specCellG (w*A1+(1-w)*A2) (w*B1+(1-w)*B2) (w*e1+(1-w)*e2)
        1 (1/2) (-1/6) (w*be1+(1-w)*be2) 0 u =
    w*(1-w)/4 *
      (((A1+B1*u+be1)-(A2+B2*u+be2))^2 +
        2*((if u=0 then 0 else A1+B1*u-(e1+A1*u+B1/2*u^2)/u) -
           (if u=0 then 0 else A2+B2*u-(e2+A2*u+B2/2*u^2)/u))^2) := by
  unfold specCellG
  by_cases hu : u=0
  · simp only [hu, ite_true]
    ring
  · simp only [hu, ↓reduceIte]
    ring

theorem unit_fusion_le (w f1 f2 g1 g2 a1 a2 : ℝ) (hw0 : 0 ≤ w) (hw1 : w ≤ 1) :
    (w*f1+(1-w)*f2)^2+2*(w*g1+(1-w)*g2)^2+w*a1+(1-w)*a2 ≤
      w*(f1^2+2*g1^2+a1) + (1-w)*(f2^2+2*g2^2+a2) := by
  have h := unit_fusion_identity w f1 f2 g1 g2 a1 a2
  have hn : 0 ≤ w*(1-w)*((f1-f2)^2+2*(g1-g2)^2) :=
    mul_nonneg (mul_nonneg hw0 (sub_nonneg.mpr hw1)) (by positivity)
  linarith

/-- A whole family of Stein moments can use ONE projected kernel. Every
retained pairing is preserved simultaneously and both variance costs decrease.
The finite-feature Schur formulation is the Gram version of this statement. -/
theorem common_kernel_projection {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] (V W : Submodule ℝ H)
    [V.HasOrthogonalProjection] [W.HasOrthogonalProjection] (x r : H) :
    ∃ x' r' : H, x' ∈ V ∧ r' ∈ W ∧ ‖x'‖ ≤ ‖x‖ ∧ ‖r'‖ ≤ ‖r‖ ∧
      (∀ v ∈ V, inner ℝ v x' = inner ℝ v x) ∧
      (∀ v ∈ W, inner ℝ v r' = inner ℝ v r) := by
  refine ⟨V.starProjection x, W.starProjection r, V.starProjection_apply_mem x,
    W.starProjection_apply_mem r, V.norm_starProjection_apply_le x,
    W.norm_starProjection_apply_le r, ?_, ?_⟩
  · intro v hv
    have h := V.inner_starProjection_left_eq_right v x
    simpa only [V.starProjection_eq_self_iff.mpr hv] using h.symm
  · intro v hv
    have h := W.inner_starProjection_left_eq_right v r
    simpa only [W.starProjection_eq_self_iff.mpr hv] using h.symm

end

end Grothe.Lower.SteinFusion
