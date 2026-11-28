import Mathlib.Analysis.Complex.Norm
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

set_option warningAsError true

/-! The angular price for the conjugate pair of fresh Gaussian blocks. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic

private theorem positive_double_weight {W A : ℝ} (hW : 0 < W) (hA : 0 ≤ A) :
    0 < 4*W*(W+A) := mul_pos (mul_pos (by norm_num) hW) (add_pos_of_pos_of_nonneg hW hA)

/-- The diagonal entry of the inverse of the paired angular price. This holds
for all complex coefficients, including opposite phases and a vanishing debit. -/
theorem remote_angular_component {W A : ℝ} (hW : 0 < W) (hA : 0 ≤ A) (u v : ℂ) :
    ‖u‖^2 ≤ ((1/W+1/(W+A))/2)*(W*(‖u‖^2+‖v‖^2)+(A/2)*‖u+v‖^2) := by
  have hWA := add_pos_of_pos_of_nonneg hW hA
  have hid : 4*W*(W+A) * (((1/W+1/(W+A))/2)*(W*(‖u‖^2+‖v‖^2)+(A/2)*‖u+v‖^2)-‖u‖^2) =
      ‖(A:ℂ)*u+((2*W+A:ℝ):ℂ)*v‖^2 := by
    simp only [Complex.sq_norm,Complex.normSq_apply,Complex.add_re,Complex.add_im,Complex.mul_re,
      Complex.mul_im,Complex.ofReal_re,Complex.ofReal_im]
    field_simp [hW.ne',hWA.ne']
    ring
  apply sub_nonneg.mp
  exact nonneg_of_mul_nonneg_right (hid.symm ▸ sq_nonneg _) (positive_double_weight hW hA)

/-- Upper bound for both weighted radial tests, using the same angular price. -/
theorem remote_angular_pair {W A : ℝ} (hW : 0 < W) (hA : 0 ≤ A) (u v : ℂ) :
    max (‖u‖^2) (‖v‖^2) ≤
      ((1/W+1/(W+A))/2)*(W*(‖u‖^2+‖v‖^2)+(A/2)*‖u+v‖^2) := by
  exact max_le (remote_angular_component hW hA u v) (by
    simpa only [add_comm v u,add_comm (‖v‖^2) (‖u‖^2)] using remote_angular_component hW hA v u)

end Grothe.LowerAnalytic
