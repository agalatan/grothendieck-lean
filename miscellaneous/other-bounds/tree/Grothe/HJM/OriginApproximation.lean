import Grothe.Haagerup.Phase

/-!
# Phase approximation from an algebraic residual

Agent-ID: codex-aa04.

A nonnegative real inverse-modulus approximant turns a squared-modulus
residual into a pointwise phase error. This needs no derivatives and includes
`z = 0`, using the existing convention `ph 0 = 0`. The approximant is not
asserted to be disk-valued; these lemmas bound its distance from the actual
response. Rational polynomial certificates can provide the residual bounds.
-/

namespace Grothe.HJM.Origin

open Grothe.Haag

/-- Away from zero, radial rescaling changes only the modulus of the phase. -/
theorem phase_error_eq_abs (z : ℂ) (w : ℝ) (hz : z ≠ 0) :
    ‖(w : ℂ) * z - ph z‖ = |w * ‖z‖ - 1| := by
  have hn : (‖z‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr hz)
  have hidentity : (w : ℂ) * z - ph z =
      ((w * ‖z‖ - 1 : ℝ) : ℂ) * ph z := by
    unfold ph
    push_cast
    field_simp [hn]
  have hphase : ‖ph z‖ = 1 := by
    rw [ph, norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg z),
      div_self (norm_ne_zero_iff.mpr hz)]
  rw [hidentity, norm_mul, Complex.norm_real, Real.norm_eq_abs, hphase, mul_one]

/-- Difference of squares, retaining the useful positive denominator factor. -/
theorem phase_error_mul_le_residual (z : ℂ) (w : ℝ) (hw : 0 ≤ w) :
    (1 + w * ‖z‖) * ‖(w : ℂ) * z - ph z‖ ≤ |w ^ 2 * ‖z‖ ^ 2 - 1| := by
  by_cases hz : z = 0
  · norm_num [hz, ph]
  rw [phase_error_eq_abs z w hz]
  have hx : 0 ≤ w * ‖z‖ := mul_nonneg hw (norm_nonneg z)
  rw [show w ^ 2 * ‖z‖ ^ 2 - 1 = (w * ‖z‖ - 1) * (w * ‖z‖ + 1) by ring,
    abs_mul, abs_of_nonneg (by linarith : 0 ≤ w * ‖z‖ + 1)]
  exact le_of_eq (by ring)

/-- A complete algebraic phase-error bound, including the zero numerator. -/
theorem phase_error_le_residual (z : ℂ) (w : ℝ) (hw : 0 ≤ w) :
    ‖(w : ℂ) * z - ph z‖ ≤ |w ^ 2 * ‖z‖ ^ 2 - 1| := by
  have hx : 0 ≤ w * ‖z‖ := mul_nonneg hw (norm_nonneg z)
  calc
    ‖(w : ℂ) * z - ph z‖ = 1 * ‖(w : ℂ) * z - ph z‖ := by ring
    _ ≤ (1 + w * ‖z‖) * ‖(w : ℂ) * z - ph z‖ :=
      mul_le_mul_of_nonneg_right (by linarith) (norm_nonneg _)
    _ ≤ |w ^ 2 * ‖z‖ ^ 2 - 1| := phase_error_mul_le_residual z w hw

/-- Apply a proved scalar residual ceiling to the actual phase error. -/
theorem phase_error_le_of_residual (z : ℂ) (w ε : ℝ) (hw : 0 ≤ w)
    (hres : |w ^ 2 * ‖z‖ ^ 2 - 1| ≤ ε) :
    ‖(w : ℂ) * z - ph z‖ ≤ ε :=
  (phase_error_le_residual z w hw).trans hres

/-- Two polynomial inequalities suffice; `normSq` is polynomial in real coordinates. -/
theorem phase_error_le_of_normSq_bounds (z : ℂ) (w ε : ℝ) (hw : 0 ≤ w)
    (hlo : 1 - ε ≤ w ^ 2 * Complex.normSq z)
    (hhi : w ^ 2 * Complex.normSq z ≤ 1 + ε) :
    ‖(w : ℂ) * z - ph z‖ ≤ ε := by
  rw [Complex.normSq_eq_norm_sq] at hlo hhi
  apply phase_error_le_of_residual z w ε hw
  exact abs_le.mpr ⟨by linarith, by linarith⟩

/-- Direct interface for a rational interval or Bernstein residual certificate. -/
theorem phase_error_le_of_rational_bounds (z : ℂ) (w : ℝ) (ε : ℚ) (hw : 0 ≤ w)
    (hlo : ((1 - ε : ℚ) : ℝ) ≤ w ^ 2 * Complex.normSq z)
    (hhi : w ^ 2 * Complex.normSq z ≤ ((1 + ε : ℚ) : ℝ)) :
    ‖(w : ℂ) * z - ph z‖ ≤ (ε : ℝ) := by
  apply phase_error_le_of_normSq_bounds z w ε hw
  · simpa only [Rat.cast_sub, Rat.cast_one] using hlo
  · simpa only [Rat.cast_add, Rat.cast_one] using hhi

/-- A rationally certified lower modulus improves the error by `1 + a`. -/
theorem phase_error_le_div_of_lower (z : ℂ) (w ε a : ℝ) (hw : 0 ≤ w) (ha : 0 ≤ a)
    (hlower : a ^ 2 ≤ w ^ 2 * ‖z‖ ^ 2)
    (hres : |w ^ 2 * ‖z‖ ^ 2 - 1| ≤ ε) :
    ‖(w : ℂ) * z - ph z‖ ≤ ε / (1 + a) := by
  have hx : 0 ≤ w * ‖z‖ := mul_nonneg hw (norm_nonneg z)
  have hax : a ≤ w * ‖z‖ := (sq_le_sq₀ ha hx).mp (by nlinarith [hlower])
  apply (le_div_iff₀ (by linarith : 0 < 1 + a)).mpr
  calc
    ‖(w : ℂ) * z - ph z‖ * (1 + a) ≤
        (1 + w * ‖z‖) * ‖(w : ℂ) * z - ph z‖ := by
      nlinarith [norm_nonneg ((w : ℂ) * z - ph z)]
    _ ≤ |w ^ 2 * ‖z‖ ^ 2 - 1| := phase_error_mul_le_residual z w hw
    _ ≤ ε := hres

/-- Choose `a² ≤ 1 - ε` to get the sharper bound without evaluating a square root. -/
theorem phase_error_le_div_of_residual (z : ℂ) (w ε a : ℝ) (hw : 0 ≤ w)
    (ha : 0 ≤ a) (haε : a ^ 2 ≤ 1 - ε)
    (hres : |w ^ 2 * ‖z‖ ^ 2 - 1| ≤ ε) :
    ‖(w : ℂ) * z - ph z‖ ≤ ε / (1 + a) := by
  apply phase_error_le_div_of_lower z w ε a hw ha _ hres
  have h := (abs_le.mp hres).1
  linarith

/-- The squared form directly supplies a spatial `L²` error budget. -/
theorem phase_error_sq_le (z : ℂ) (w ε : ℝ) (hw : 0 ≤ w)
    (hres : |w ^ 2 * ‖z‖ ^ 2 - 1| ≤ ε) :
    ‖(w : ℂ) * z - ph z‖ ^ 2 ≤ ε ^ 2 := by
  have h := phase_error_le_of_residual z w ε hw hres
  have hε : 0 ≤ ε := (abs_nonneg _).trans hres
  exact (sq_le_sq₀ (norm_nonneg _) hε).mpr h

/-- A bounded common driver preserves the phase approximation error. -/
theorem phase_error_mul_left_le (u z : ℂ) (w ε : ℝ) (hu : ‖u‖ ≤ 1)
    (hw : 0 ≤ w) (hres : |w ^ 2 * ‖z‖ ^ 2 - 1| ≤ ε) :
    ‖u * ((w : ℂ) * z) - u * ph z‖ ≤ ε := by
  calc
    ‖u * ((w : ℂ) * z) - u * ph z‖ = ‖u‖ * ‖(w : ℂ) * z - ph z‖ := by
      rw [← mul_sub, norm_mul]
    _ ≤ 1 * ‖(w : ℂ) * z - ph z‖ :=
      mul_le_mul_of_nonneg_right hu (norm_nonneg _)
    _ = ‖(w : ℂ) * z - ph z‖ := one_mul _
    _ ≤ ε := phase_error_le_of_residual z w ε hw hres

end Grothe.HJM.Origin
