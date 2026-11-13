import Grothe.UpperQuad.QuadEllipseDiskSound

/-!
# Sharper disk geometry for the twisted ellipse majorants

The imaginary part of a square root on a disk centered at a positive real `x` is bounded by
`R²/(4x)`. The conditional shift bound retains the exact square-root factor supplied by the
angle defect, giving `Ahi * KP² / (2 * (1 + sqrt (1-KP²)))`.

Both results concern elementary complex geometry. They do not identify a majorant with the
twisted integrand or supply its analytic continuation.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open Complex Grothe.UpperQuad.QuadRem

/-- The exact disk identity for a complex square and a real center. -/
lemma norm_sq_sub_real_of_square (ζ : ℂ) (x : ℝ) :
    ‖ζ ^ 2 - (x : ℂ)‖ ^ 2 = (‖ζ‖ ^ 2 - x) ^ 2 + 4 * x * ζ.im ^ 2 := by
  rw [← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq]
  simp only [Complex.normSq_apply, pow_two,
    Complex.sub_re, Complex.sub_im, Complex.ofReal_re, Complex.ofReal_im,
    Complex.mul_re, Complex.mul_im]
  ring

/-- The sharp imaginary-square bound on a disk with positive real center.
The disk may cross the imaginary axis; only its center must be positive. -/
theorem sqrt_im_sq_le_disk {x R : ℝ} {z ζ : ℂ} (hx : 0 < x)
    (hζ : ζ ^ 2 = z) (hz : ‖z - (x : ℂ)‖ ≤ R) : ζ.im ^ 2 ≤ R ^ 2 / (4 * x) := by
  have hs : ‖z - (x : ℂ)‖ ^ 2 ≤ R ^ 2 :=
    pow_le_pow_left₀ (norm_nonneg _) hz 2
  have he := norm_sq_sub_real_of_square ζ x
  rw [hζ] at he
  apply (le_div_iff₀ (by positivity : (0 : ℝ) < 4 * x)).2
  nlinarith [sq_nonneg (‖ζ‖ ^ 2 - x)]

/-- Rationalizing the loss in the cosine bound avoids discarding its denominator. -/
lemma one_sub_sqrt_eq_sq_div {k : ℝ} (hk0 : 0 ≤ k) (hk1 : k < 1) :
    1 - Real.sqrt (1 - k ^ 2) = k ^ 2 / (1 + Real.sqrt (1 - k ^ 2)) := by
  have hsq : Real.sqrt (1 - k ^ 2) ^ 2 = 1 - k ^ 2 :=
    Real.sq_sqrt (by nlinarith)
  apply (eq_div_iff (by positivity : 1 + Real.sqrt (1 - k ^ 2) ≠ 0)).2
  nlinarith

/-- A lower bound on the real part of `A²` gives the rationalized imaginary-square bound. -/
theorem im_sq_le_sharp_of_re_sq {A : ℂ} {k Ahi : ℝ}
    (hk0 : 0 ≤ k) (hk1 : k < 1)
    (hre : Real.sqrt (1 - k ^ 2) * ‖A‖ ^ 2 ≤ (A ^ 2).re)
    (hA : ‖A‖ ^ 2 ≤ Ahi) :
    A.im ^ 2 ≤ Ahi * k ^ 2 / (2 * (1 + Real.sqrt (1 - k ^ 2))) := by
  have him : A.im ^ 2 ≤ ‖A‖ ^ 2 * (1 - Real.sqrt (1 - k ^ 2)) / 2 := by
    rw [im_sq_eq]
    nlinarith
  calc A.im ^ 2 ≤ ‖A‖ ^ 2 * (1 - Real.sqrt (1 - k ^ 2)) / 2 := him
    _ = ‖A‖ ^ 2 * k ^ 2 / (2 * (1 + Real.sqrt (1 - k ^ 2))) := by
      rw [one_sub_sqrt_eq_sq_div hk0 hk1]
      have hs : 1 + Real.sqrt (1 - k ^ 2) ≠ 0 := by positivity
      field_simp [hs]
    _ ≤ Ahi * k ^ 2 / (2 * (1 + Real.sqrt (1 - k ^ 2))) :=
      div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_right hA (sq_nonneg k))
        (by positivity)

/-- The same bound in the theta form returned by the existing angle theorem. -/
theorem im_sq_le_sharp_of_theta {A : ℂ} {k Ahi : ℝ}
    (hk0 : 0 ≤ k) (hk1 : k < 1) (hre : 0 < (A ^ 2).re)
    (hθ : ‖A‖ ^ 2 / (A ^ 2).re ≤ 1 / Real.sqrt (1 - k ^ 2))
    (hA : ‖A‖ ^ 2 ≤ Ahi) :
    A.im ^ 2 ≤ Ahi * k ^ 2 / (2 * (1 + Real.sqrt (1 - k ^ 2))) := by
  have hs : 0 < Real.sqrt (1 - k ^ 2) := Real.sqrt_pos.mpr (by nlinarith)
  exact im_sq_le_sharp_of_re_sq hk0 hk1
    (by simpa only [one_mul, mul_one, mul_comm] using (div_le_div_iff₀ hre hs).1 hθ) hA

/-- A checked upper defect `KP` and upper squared norm `Ahi` give the sharper disk bound.
The hypotheses fit the witnesses produced by `EllCheck.defectI_sound` and `a2hiI_sound`. -/
theorem diskPoint_shift_im_sq_le_sharp {ε x R KP Ahi : ℝ} {z ζ : ℂ}
    (hd : DiskPoint ε x R z ζ) (hxR : R < x) (hK0 : 0 ≤ KP) (hK1 : KP < 1)
    (hkp : DiskPoint.kp ε x R ≤ KP) (hA : ‖ζ / wC ε z‖ ^ 2 ≤ Ahi) :
    (ζ / wC ε z).im ^ 2 ≤ Ahi * KP ^ 2 / (2 * (1 + Real.sqrt (1 - KP ^ 2))) := by
  obtain ⟨_, hre, hθ⟩ := hd.shift_angle hxR (lt_of_le_of_lt hkp hK1)
  have hkp0 := EllCheck.diskPoint_kp_nonneg hd hxR
  have hsq : DiskPoint.kp ε x R ^ 2 ≤ KP ^ 2 := pow_le_pow_left₀ hkp0 hkp 2
  have hs : 0 < Real.sqrt (1 - KP ^ 2) := Real.sqrt_pos.mpr (by nlinarith)
  have hθ' : ‖ζ / wC ε z‖ ^ 2 / ((ζ / wC ε z) ^ 2).re ≤
      1 / Real.sqrt (1 - KP ^ 2) :=
    hθ.trans (one_div_le_one_div_of_le hs (Real.sqrt_le_sqrt (by linarith)))
  exact im_sq_le_sharp_of_theta hK0 hK1 hre hθ' hA

end Grothe.UpperQuad.TwistEllCheck
