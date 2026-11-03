import Grothe.UpperChaos.TaylorPhase
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Error propagation through the actual cubic phase factor.
The second base model need not be disk-valued. Agent-ID: codex-8c4d. -/

open Complex
namespace Grothe.UpperChaos.PhasePolynomialStability
noncomputable section

theorem norm_P3_sub_le {x y : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    ‖P3 x - P3 y‖ ≤ (5 / 2 : ℝ) * |x - y| := by
  have hadd : |x + y| ≤ 2 := (abs_add_le x y).trans (by linarith)
  have hx2 : |x ^ 2| ≤ 1 := by
    simpa only [abs_pow, one_pow] using pow_le_pow_left₀ (abs_nonneg x) hx 2
  have hy2 : |y ^ 2| ≤ 1 := by
    simpa only [abs_pow, one_pow] using pow_le_pow_left₀ (abs_nonneg y) hy 2
  have hxy : |x * y| ≤ 1 := by
    rw [abs_mul]
    simpa only [one_mul] using mul_le_mul hx hy (abs_nonneg y) zero_le_one
  have hquadratic : |x ^ 2 + x * y + y ^ 2| ≤ 3 := by
    calc
      _ ≤ |x ^ 2 + x * y| + |y ^ 2| := abs_add_le _ _
      _ ≤ (|x ^ 2| + |x * y|) + |y ^ 2| :=
        add_le_add (abs_add_le _ _) le_rfl
      _ ≤ 3 := by linarith
  have hfactor : P3 x - P3 y = (((x - y : ℝ) : ℂ)) *
      (I - (((x + y) / 2 : ℝ) : ℂ) -
        I * (((x ^ 2 + x * y + y ^ 2) / 6 : ℝ) : ℂ)) := by
    unfold P3
    push_cast
    ring
  have hnorm : ‖I - (((x + y) / 2 : ℝ) : ℂ) -
      I * (((x ^ 2 + x * y + y ^ 2) / 6 : ℝ) : ℂ)‖ ≤ (5 / 2 : ℝ) := by
    calc
      _ ≤ ‖I - (((x + y) / 2 : ℝ) : ℂ)‖ +
          ‖I * (((x ^ 2 + x * y + y ^ 2) / 6 : ℝ) : ℂ)‖ := norm_sub_le _ _
      _ ≤ (‖(I : ℂ)‖ + ‖(((x + y) / 2 : ℝ) : ℂ)‖) +
          ‖I * (((x ^ 2 + x * y + y ^ 2) / 6 : ℝ) : ℂ)‖ :=
        add_le_add (norm_sub_le _ _) le_rfl
      _ = 1 + |x + y| / 2 + |x ^ 2 + x * y + y ^ 2| / 6 := by
        simp only [norm_I, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_div]
        norm_num
      _ ≤ 5 / 2 := by linarith
  rw [hfactor, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  calc
    _ ≤ |x - y| * (5 / 2 : ℝ) := mul_le_mul_of_nonneg_left hnorm (abs_nonneg _)
    _ = _ := by ring

/-- The error in the base is charged once, without bounding the base model. -/
theorem norm_base_mul_P3_sub {f g : ℂ} {x y : ℝ}
    (hf : ‖f‖ ≤ 1) (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    ‖f * P3 x - g * P3 y‖ ≤ ‖f - g‖ + (5 / 2 : ℝ) * |x - y| := by
  have heq : f * P3 x - g * P3 y =
      f * (P3 x - P3 y) + (f - g) * P3 y := by ring
  rw [heq]
  calc
    _ ≤ ‖f * (P3 x - P3 y)‖ + ‖(f - g) * P3 y‖ := norm_add_le _ _
    _ = ‖f‖ * ‖P3 x - P3 y‖ + ‖f - g‖ * ‖P3 y‖ := by rw [norm_mul, norm_mul]
    _ ≤ 1 * ((5 / 2 : ℝ) * |x - y|) + ‖f - g‖ * 1 :=
      add_le_add
        (mul_le_mul hf (norm_P3_sub_le hx hy) (norm_nonneg _) zero_le_one)
        (mul_le_mul_of_nonneg_left (norm_P3_le_one_of_abs hy) (norm_nonneg _))
    _ = _ := by ring

end
open Lean Elab Command
run_cmd do
  for target in #[``norm_P3_sub_le, ``norm_base_mul_P3_sub] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.PhasePolynomialStability
