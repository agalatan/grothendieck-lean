import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-! Elementary bijection for the positive half-line and the unit interval.
No integral substitution or Gaussian coefficient identity is asserted. -/
namespace Grothe.UpperChaos.MobiusGeometry
noncomputable section

def forward (t : ℝ) : ℝ := t / (1 + t)
def inverse (v : ℝ) : ℝ := v / (1 - v)

theorem forward_mem (t : ℝ) (ht : 0 ≤ t) : 0 ≤ forward t ∧ forward t < 1 := by
  have hp : 0 < 1 + t := by linarith
  constructor
  · exact div_nonneg ht hp.le
  · unfold forward
    apply (div_lt_one hp).2
    linarith

theorem inverse_nonneg (v : ℝ) (hv : 0 ≤ v) (hv1 : v < 1) : 0 ≤ inverse v := by
  unfold inverse
  exact div_nonneg hv (by linarith)

theorem inverse_forward (t : ℝ) (ht : 0 ≤ t) : inverse (forward t) = t := by
  have hp : (1 + t) ≠ 0 := by linarith
  have hq : 1 - t / (1 + t) ≠ 0 := by
    have ht1 := (forward_mem t ht).2
    exact ne_of_gt (sub_pos.mpr ht1)
  unfold inverse forward
  field_simp; ring

theorem forward_inverse (v : ℝ) (hv : 0 ≤ v) (hv1 : v < 1) : forward (inverse v) = v := by
  have hp : 1 - v ≠ 0 := ne_of_gt (sub_pos.mpr hv1)
  have hq : 1 + v / (1 - v) ≠ 0 := by
    have : 0 ≤ v / (1 - v) := div_nonneg hv (sub_nonneg.mpr hv1.le)
    linarith
  unfold forward inverse
  field_simp; ring

theorem forward_deriv (t : ℝ) (ht : 0 ≤ t) :
    HasDerivAt forward (1 / (1 + t) ^ 2) t := by
  change HasDerivAt (fun u : ℝ => u / (1 + u)) (1 / (1 + t) ^ 2) t
  have hp : (1 + t) ≠ 0 := by linarith
  have hi : HasDerivAt (fun u : ℝ => u) 1 t := hasDerivAt_id t
  have hc : HasDerivAt (fun _ : ℝ => (1 : ℝ)) 0 t := hasDerivAt_const t 1
  have hd : HasDerivAt (fun u : ℝ => 1 + u) 1 t := by
    simpa only [zero_add] using hc.fun_add hi
  have h := hi.fun_div hd hp
  simpa only [forward, one_mul, mul_one, add_sub_cancel_right] using h

theorem inverse_deriv (v : ℝ) (hv1 : v < 1) :
    HasDerivAt inverse (1 / (1 - v) ^ 2) v := by
  change HasDerivAt (fun u : ℝ => u / (1 - u)) (1 / (1 - v) ^ 2) v
  have hp : (1 - v) ≠ 0 := ne_of_gt (sub_pos.mpr hv1)
  have hi : HasDerivAt (fun u : ℝ => u) 1 v := hasDerivAt_id v
  have hc : HasDerivAt (fun _ : ℝ => (1 : ℝ)) 0 v := hasDerivAt_const v 1
  have hd : HasDerivAt (fun u : ℝ => 1 - u) (-1) v := by
    simpa only [zero_sub] using hc.fun_sub hi
  have h := hi.fun_div hd hp
  simpa only [inverse, one_mul, mul_neg, mul_one, sub_neg_eq_add, sub_add_cancel] using h

end
end Grothe.UpperChaos.MobiusGeometry
#print axioms Grothe.UpperChaos.MobiusGeometry.inverse_forward
#print axioms Grothe.UpperChaos.MobiusGeometry.forward_inverse
#print axioms Grothe.UpperChaos.MobiusGeometry.forward_deriv
#print axioms Grothe.UpperChaos.MobiusGeometry.inverse_deriv
