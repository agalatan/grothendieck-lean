import Grothe.UpperChaos.TaylorPhase

/-!
# Polynomial repair of a disk response's modulus

The first seven binomial coefficients of `(1-q)⁻¹ᐟ²` give a polynomial radial
map which stays in the disk.  Its exact squared-modulus defect has positive
coefficients and starts at degree seven in `q`.  Applied to `P3`, this is a
degree-39 polynomial phase factor.  These statements certify admissibility;
they do not assert an improvement of the Grothendieck bound.
-/

noncomputable section

namespace Grothe.UpperChaos.RadialRepair

open Complex
open scoped ComplexConjugate

/-- The degree-six truncation of `(1-q)⁻¹ᐟ²`. -/
def S6 (q : ℝ) : ℝ :=
  1 + q / 2 + 3 * q ^ 2 / 8 + 5 * q ^ 3 / 16 + 35 * q ^ 4 / 128 +
    63 * q ^ 5 / 256 + 231 * q ^ 6 / 1024

/-- The nonnegative complementary polynomial, with its order-seven zero exposed. -/
def C6 (q : ℝ) : ℝ :=
  q ^ 7 * (429 / 1024 + 3003 * q / 16384 + 1001 * q ^ 2 / 8192 +
    3003 * q ^ 3 / 32768 + 9555 * q ^ 4 / 131072 +
    63063 * q ^ 5 / 1048576 + 53361 * q ^ 6 / 1048576)

/-- Exact positive-complement identity; no numerical positivity test is used. -/
theorem complement_identity (q : ℝ) : (1 - q) * S6 q ^ 2 = 1 - C6 q := by
  unfold S6 C6
  ring

lemma one_le_S6 {q : ℝ} (hq : 0 ≤ q) : 1 ≤ S6 q := by
  have h : 0 ≤ q / 2 + 3 * q ^ 2 / 8 + 5 * q ^ 3 / 16 + 35 * q ^ 4 / 128 +
      63 * q ^ 5 / 256 + 231 * q ^ 6 / 1024 := by positivity
  unfold S6
  linarith

lemma C6_nonneg {q : ℝ} (hq : 0 ≤ q) : 0 ≤ C6 q := by
  unfold C6
  positivity

/-- A polynomial radial map, with `q` the original squared-modulus defect. -/
noncomputable def repair (z : ℂ) : ℂ := z * (S6 (1 - normSq z) : ℂ)

theorem normSq_repair (z : ℂ) :
    normSq (repair z) = 1 - C6 (1 - normSq z) := by
  rw [repair, normSq_mul, normSq_ofReal]
  have h := complement_identity (1 - normSq z)
  simpa [pow_two] using h

/-- The repair remains disk-valued. -/
theorem norm_repair_le_one {z : ℂ} (hz : ‖z‖ ≤ 1) : ‖repair z‖ ≤ 1 := by
  have hq : 0 ≤ 1 - normSq z := by
    rw [normSq_eq_norm_sq]
    nlinarith [norm_nonneg z]
  have hsq : normSq (repair z) ≤ 1 := by
    rw [normSq_repair]
    linarith [C6_nonneg hq]
  rw [← sq_le_one_iff₀ (norm_nonneg _), ← normSq_eq_norm_sq]
  exact hsq

/-- The radial displacement is exactly the increase of modulus. -/
theorem norm_repair_sub {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖repair z - z‖ = ‖repair z‖ - ‖z‖ := by
  have hq : 0 ≤ 1 - normSq z := by
    rw [normSq_eq_norm_sq]
    nlinarith [norm_nonneg z]
  have hs := one_le_S6 hq
  have heq : repair z - z = z * ((S6 (1 - normSq z) - 1 : ℝ) : ℂ) := by
    simp only [repair, ofReal_sub, ofReal_one]
    ring
  rw [heq, norm_mul, norm_real, Real.norm_eq_abs, abs_of_nonneg (by linarith)]
  rw [repair, norm_mul, norm_real, Real.norm_eq_abs, abs_of_nonneg (by linarith)]
  ring

theorem norm_repair_sub_le {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖repair z - z‖ ≤ 1 - ‖z‖ := by
  rw [norm_repair_sub hz]
  linarith [norm_repair_le_one hz]

/-- The squared-modulus defect of the cubic Taylor phase factor. -/
def phaseDefect (x : ℝ) : ℝ := x ^ 4 * (3 - x ^ 2) / 36

/-- A pointwise moment ceiling for every nondecreasing radial repair. -/
theorem radial_gap_sq_le {x : ℝ} (hx : x ^ 2 ≤ 1) :
    (1 - ‖P3 x‖) ^ 2 ≤ x ^ 6 / 1225 := by
  have hn : ‖P3 x‖ ^ 2 = 1 - phaseDefect x := by
    rw [← normSq_eq_norm_sq, normSq_P3]
    rfl
  have hprod : (1 - ‖P3 x‖) ^ 2 * (1 + ‖P3 x‖) ^ 2 = phaseDefect x ^ 2 := by
    rw [← mul_pow]
    congr 1
    nlinarith
  have hq : phaseDefect x ≤ 1 / 18 := by
    have hx4 : x ^ 4 ≤ x ^ 2 := by
      nlinarith [mul_nonneg (sq_nonneg x) (sub_nonneg.mpr hx)]
    have hs : 0 ≤ (1 - x ^ 2) * (2 + 2 * x ^ 2 - x ^ 4) :=
      mul_nonneg (by linarith) (by nlinarith [sq_nonneg x])
    have hid : 1 / 18 - phaseDefect x = (1 - x ^ 2) * (2 + 2 * x ^ 2 - x ^ 4) / 36 := by
      unfold phaseDefect
      ring
    nlinarith
  have hle := norm_P3_le_one (hx.trans (by norm_num))
  have hr : 17 / 18 ≤ ‖P3 x‖ := by
    nlinarith [mul_nonneg (norm_nonneg (P3 x)) (sub_nonneg.mpr hle)]
  have hden : (1225 : ℝ) / 324 ≤ (1 + ‖P3 x‖) ^ 2 := by nlinarith
  have hmul := mul_le_mul_of_nonneg_left hden (sq_nonneg (1 - ‖P3 x‖))
  have hs : 0 ≤ x ^ 6 * ((1 - x ^ 2) ^ 2 * (4 - x ^ 2)) := by
    exact mul_nonneg (by positivity) (mul_nonneg (sq_nonneg _) (by linarith))
  have hid : x ^ 6 - 324 * phaseDefect x ^ 2 =
      x ^ 6 * ((1 - x ^ 2) ^ 2 * (4 - x ^ 2)) / 4 := by
    unfold phaseDefect
    ring
  nlinarith [hmul, hprod, hs, hid]

/-- The degree-39 phase factor obtained without introducing a square root. -/
noncomputable def phaseRepair (x : ℝ) : ℂ := P3 x * (S6 (phaseDefect x) : ℂ)

theorem phaseRepair_eq_repair (x : ℝ) : phaseRepair x = repair (P3 x) := by
  simp [phaseRepair, repair, normSq_P3, phaseDefect]

/-- Admissibility of the repaired phase factor on the original cubic disk interval. -/
theorem norm_phaseRepair_le_one {x : ℝ} (hx : x ^ 2 ≤ 3) : ‖phaseRepair x‖ ≤ 1 := by
  rw [phaseRepair_eq_repair]
  exact norm_repair_le_one (norm_P3_le_one hx)

/-- The entire radial-polynomial change obeys the sixth phase-moment ceiling. -/
theorem phaseRepair_change_sq_le {x : ℝ} (hx : x ^ 2 ≤ 1) :
    ‖phaseRepair x - P3 x‖ ^ 2 ≤ x ^ 6 / 1225 := by
  have hd := norm_repair_sub_le (norm_P3_le_one (hx.trans (by norm_num)))
  rw [← phaseRepair_eq_repair] at hd
  have hg := radial_gap_sq_le hx
  nlinarith [norm_nonneg (phaseRepair x - P3 x)]

end Grothe.UpperChaos.RadialRepair
