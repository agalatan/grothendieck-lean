import Grothe.Haagerup.Phase
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! A zero-safe perturbation estimate for the actual phase convention.
The perturbed point may be zero; only the real reference radius is positive.
Agent-ID: codex-8c4d. -/

namespace Grothe.Haag

private theorem ph_mul_norm (z : ℂ) : ph z * (‖z‖ : ℂ) = z := by
  by_cases hz : z = 0
  · simp [hz, ph]
  · have hn : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast (norm_ne_zero_iff.mpr hz)
    exact div_mul_cancel₀ z hn

theorem norm_ph_real_add_sub_one (r : ℝ) (hr : 0 < r) (h : ℂ) :
    ‖ph ((r : ℂ) + h) - 1‖ ≤ 2 * ‖h‖ / r := by
  let z : ℂ := (r : ℂ) + h
  have hrnorm : ‖(r : ℂ)‖ = r := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos hr]
  have hu : ‖z‖ ≤ r + ‖h‖ := by
    simpa only [z, hrnorm] using norm_add_le (r : ℂ) h
  have hl : r ≤ ‖z‖ + ‖h‖ := by
    simpa only [z, add_sub_cancel_right, hrnorm] using norm_sub_le z h
  have hdist : |r - ‖z‖| ≤ ‖h‖ := by
    apply abs_le.mpr
    constructor <;> linarith
  have halgebra : (r : ℂ) * (ph z - 1) = ((r - ‖z‖ : ℝ) : ℂ) * ph z + h := by
    push_cast
    calc
      _ = ((r : ℂ) - (‖z‖ : ℂ)) * ph z + (ph z * (‖z‖ : ℂ) - (r : ℂ)) := by ring
      _ = _ := by rw [ph_mul_norm]; dsimp only [z]; ring
  change ‖ph z - 1‖ ≤ 2 * ‖h‖ / r
  apply (le_div_iff₀ hr).2
  calc
    ‖ph z - 1‖ * r = ‖(r : ℂ) * (ph z - 1)‖ := by rw [norm_mul, hrnorm, mul_comm]
    _ = ‖((r - ‖z‖ : ℝ) : ℂ) * ph z + h‖ := congrArg norm halgebra
    _ ≤ ‖((r - ‖z‖ : ℝ) : ℂ) * ph z‖ + ‖h‖ := norm_add_le _ _
    _ = |r - ‖z‖| * ‖ph z‖ + ‖h‖ := by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
    _ ≤ |r - ‖z‖| * 1 + ‖h‖ :=
      add_le_add_right (mul_le_mul_of_nonneg_left (norm_ph_le z) (abs_nonneg _)) _
    _ ≤ ‖h‖ + ‖h‖ := by rw [mul_one]; exact add_le_add_right hdist _
    _ = 2 * ‖h‖ := by ring

theorem norm_ph_real_scaled_add_sub_one (r : ℝ) (hr : 0 < r) (κ : ℝ) (w : ℂ) :
    ‖ph ((r : ℂ) + (κ : ℂ) * w) - 1‖ ≤ (2 * |κ| / r) * ‖w‖ := by
  calc
    _ ≤ 2 * ‖(κ : ℂ) * w‖ / r := norm_ph_real_add_sub_one r hr _
    _ = _ := by rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]; ring

open Lean Elab Command
run_cmd do
  for target in #[``norm_ph_real_add_sub_one, ``norm_ph_real_scaled_add_sub_one] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"

end Grothe.Haag
