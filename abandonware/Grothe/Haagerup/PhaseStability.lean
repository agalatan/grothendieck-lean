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
      add_le_add (mul_le_mul_of_nonneg_left (norm_ph_le z) (abs_nonneg _)) le_rfl
    _ ≤ ‖h‖ + ‖h‖ := by rw [mul_one]; exact add_le_add hdist le_rfl
    _ = 2 * ‖h‖ := by ring

theorem norm_ph_real_scaled_add_sub_one (r : ℝ) (hr : 0 < r) (κ : ℝ) (w : ℂ) :
    ‖ph ((r : ℂ) + (κ : ℂ) * w) - 1‖ ≤ (2 * |κ| / r) * ‖w‖ := by
  calc
    _ ≤ 2 * ‖(κ : ℂ) * w‖ / r := norm_ph_real_add_sub_one r hr _
    _ = _ := by rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]; ring

/-- The first-order norm remainder is quadratic, even if the perturbed
point vanishes. No differentiation or exclusion of a moving pole is used. -/
theorem norm_real_add_remainder (r : ℝ) (hr : 0 < r) (h : ℂ) :
    0 ≤ ‖(r : ℂ) + h‖ - r - h.re ∧
      ‖(r : ℂ) + h‖ - r - h.re ≤ ‖h‖ ^ 2 / (2 * r) := by
  have hx : r + h.re ≤ ‖(r : ℂ) + h‖ := by
    simpa only [Complex.add_re, Complex.ofReal_re] using
      Complex.re_le_norm ((r : ℂ) + h)
  have hsq : ‖(r : ℂ) + h‖ ^ 2 = r ^ 2 + 2 * r * h.re + ‖h‖ ^ 2 := by
    simp only [Complex.sq_norm, Complex.normSq_apply, Complex.add_re,
      Complex.ofReal_re, Complex.add_im, Complex.ofReal_im, zero_add]
    ring
  refine ⟨by linarith, ?_⟩
  apply (le_div_iff₀ (by positivity : (0 : ℝ) < 2 * r)).2
  nlinarith [sq_nonneg (‖(r : ℂ) + h‖ - r)]

/-- A zero-safe first-order approximation of the phase. This estimate uses
only a positive real reference radius; h and r+h may be arbitrary. -/
theorem norm_ph_real_add_sub_linear (r : ℝ) (hr : 0 < r) (h : ℂ) :
    ‖ph ((r : ℂ) + h) - 1 - (h - (h.re : ℂ)) / (r : ℂ)‖ ≤
      (5 / 2 : ℝ) * ‖h‖ ^ 2 / r ^ 2 := by
  let z : ℂ := (r : ℂ) + h
  have hrnorm : ‖(r : ℂ)‖ = r := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos hr]
  have hr0 : (r : ℂ) ≠ 0 := by exact_mod_cast hr.ne'
  have hcancel : (r : ℂ) * ((h - (h.re : ℂ)) / (r : ℂ)) = h - (h.re : ℂ) := by
    field_simp [hr0]
  have hcore : (r : ℂ) * (ph z - 1) = ((r - ‖z‖ : ℝ) : ℂ) * ph z + h := by
    push_cast
    calc
      _ = ((r : ℂ) - (‖z‖ : ℂ)) * ph z + (ph z * (‖z‖ : ℂ) - (r : ℂ)) := by ring
      _ = _ := by rw [ph_mul_norm]; dsimp only [z]; ring
  have heq :
      (r : ℂ) * (ph z - 1 - (h - (h.re : ℂ)) / (r : ℂ)) =
        (h.re : ℂ) * (1 - ph z) + ((r + h.re - ‖z‖ : ℝ) : ℂ) * ph z := by
    rw [mul_sub, hcancel, hcore]
    push_cast
    ring
  have hremainder : |r + h.re - ‖z‖| ≤ ‖h‖ ^ 2 / (2 * r) := by
    obtain ⟨hn, hb⟩ := norm_real_add_remainder r hr h
    have ht : r + h.re - ‖z‖ ≤ 0 := by dsimp only [z]; linarith
    rw [abs_of_nonpos ht]
    dsimp only [z]
    linarith
  have hphase : ‖1 - ph z‖ ≤ 2 * ‖h‖ / r := by
    rw [norm_sub_rev]
    exact norm_ph_real_add_sub_one r hr h
  have hnum :
      ‖(r : ℂ) * (ph z - 1 - (h - (h.re : ℂ)) / (r : ℂ))‖ ≤
        ‖h‖ * (2 * ‖h‖ / r) + ‖h‖ ^ 2 / (2 * r) := by
    rw [heq]
    calc
      _ ≤ ‖(h.re : ℂ) * (1 - ph z)‖ +
          ‖((r + h.re - ‖z‖ : ℝ) : ℂ) * ph z‖ := norm_add_le _ _
      _ = |h.re| * ‖1 - ph z‖ + |r + h.re - ‖z‖| * ‖ph z‖ := by
        simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs]
      _ ≤ ‖h‖ * (2 * ‖h‖ / r) + (‖h‖ ^ 2 / (2 * r)) * 1 :=
        add_le_add
          (mul_le_mul (Complex.abs_re_le_norm h) hphase (norm_nonneg _) (norm_nonneg _))
          (mul_le_mul hremainder (norm_ph_le z) (norm_nonneg _) (by positivity))
      _ = _ := by rw [mul_one]
  change ‖ph z - 1 - (h - (h.re : ℂ)) / (r : ℂ)‖ ≤ _
  apply (le_div_iff₀ (sq_pos_of_pos hr)).2
  calc
    _ = ‖(r : ℂ) * (ph z - 1 - (h - (h.re : ℂ)) / (r : ℂ))‖ * r := by
      rw [norm_mul, hrnorm]
      ring
    _ ≤ (‖h‖ * (2 * ‖h‖ / r) + ‖h‖ ^ 2 / (2 * r)) * r :=
      mul_le_mul_of_nonneg_right hnum hr.le
    _ = (5 / 2 : ℝ) * ‖h‖ ^ 2 := by
      field_simp [hr.ne']
      ring

open Lean Elab Command
run_cmd do
  for target in #[``norm_ph_real_add_sub_one, ``norm_ph_real_scaled_add_sub_one,
      ``norm_real_add_remainder, ``norm_ph_real_add_sub_linear] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"

end Grothe.Haag
