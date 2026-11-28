/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.CellOverlapCore
import HaagerupKernel.SmoothedStages

/-!
# The energies of the smoothed map: from the outer sum to one term of the energy

Step (5) of Appendix A.4 (the energies of the smoothed map) of the article. The outer sum `𝒯` of step (4) is known
through an integer dot product with an error bound at scale `2⁻⁸⁰⁰`, for the real and for the imaginary part.
`energyBox` divides by `2⁵¹²` with outward rounding (scale `2⁻²⁸⁸`), squares and adds (scale `2⁻⁵⁷⁶`), multiplies by
the product of binomial coefficients and divides by `(k + 1) * 2⁴⁴⁸`; `energyBox_sound` states that the result is an
interval at scale `2⁻¹²⁸` which contains the term `binom * ‖𝒯‖² / (k + 1)` of the energy formula (A.5).
-/

set_option warningAsError true
set_option exponentiation.threshold 2048

namespace Haagerup
open Finset HaagerupKernel HaagerupKernel.Cell

private lemma shrinkDot {x : ℝ} {dot err : ℤ}
    (h : |x * (2 : ℝ)^800 - (dot : ℝ)| ≤ (err : ℝ)) :
    let iv := ivDivPosL (dot - err, dot + err) sh512
    (iv.1 : ℝ) ≤ x * 2^288 ∧ x * 2^288 ≤ (iv.2 : ℝ) := by
  have hp : (0 : ℤ) < sh512 := by norm_num [sh512]
  have hs : x * 2^288 * (sh512 : ℝ) = x * 2^800 := by norm_num [sh512]; ring
  obtain ⟨hl, hu⟩ := abs_le.mp h
  exact ⟨ediv_le_of_mul hp (by rw [hs, Int.cast_sub]; linarith),
    le_neg_ediv_neg_of_mul hp (by rw [hs, Int.cast_add]; linarith)⟩

/-- The interval of step (5) of Appendix A.4 for one term of the energy formula (A.5). The integers `r ± e` and
`i ± f` enclose the real and the imaginary part of a complex number `z` at scale `2⁻⁸⁰⁰`; the result is an interval at
scale `2⁻¹²⁸` for `binom * ‖z‖² / (k + 1)` (`energyBox_sound`). -/
def energyBox (k binom : Nat) (r e i f : Int) : Ival :=
  let cr := ivDivPosL (r-e,r+e) sh512
  let ci := ivDivPosL (i-f,i+f) sh512
  let sr := sqIntIval cr.1 cr.2
  let si := sqIntIval ci.1 ci.2
  let v := ivDivPosL ((sr.1 + si.1) * Int.ofNat binom,(sr.2 + si.2) * Int.ofNat binom)
    (Int.ofNat (k+1)*sh448)
  ⟨v.1,v.2⟩

/-- If `|Re z * 2⁸⁰⁰ - r| ≤ e` and `|Im z * 2⁸⁰⁰ - i| ≤ f`, then `energyBox k b r e i f` contains
`b * ‖z‖² / (k + 1)`. -/
theorem energyBox_sound {z : ℂ} (k b : ℕ) {r e i f : ℤ}
    (hr : |z.re * (2:ℝ)^800 - (r:ℝ)| ≤ (e:ℝ))
    (hi : |z.im * (2:ℝ)^800 - (i:ℝ)| ≤ (f:ℝ)) :
    mem ((b : ℝ) * ‖z‖^2 / (k+1 : ℝ)) (energyBox k b r e i f) := by
  obtain ⟨rl,ru⟩ := shrinkDot hr
  obtain ⟨il,iu⟩ := shrinkDot hi
  have sr := sqIntIval_sound rl ru
  have si := sqIntIval_sound il iu
  have hn : (z.re * 2^288)^2 + (z.im * 2^288)^2 = ‖z‖^2 * 2^576 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]
    ring
  have hlo := add_le_add sr.1 si.1
  have hhi := add_le_add sr.2 si.2
  rw [hn] at hlo hhi
  have hb : (0 : ℝ) ≤ b := Nat.cast_nonneg b
  have h1 := mul_le_mul_of_nonneg_right hlo hb
  have h2 := mul_le_mul_of_nonneg_right hhi hb
  have hp : (0 : ℤ) < Int.ofNat (k+1) * sh448 := by
    unfold sh448; simp only [Int.ofNat_eq_natCast]; positivity
  have hs : ((b:ℝ) * ‖z‖^2 / (k+1 : ℝ)) * D * ((Int.ofNat (k+1) * sh448 : ℤ) : ℝ) =
      (‖z‖^2 * 2^576) * b := by
    have hk : (k+1 : ℝ) ≠ 0 := by positivity
    unfold D K sh448
    push_cast [Int.ofNat_eq_natCast]
    field_simp
    ring
  constructor
  · apply ediv_le_of_mul hp
    rw [hs, Int.cast_mul, Int.cast_add, Int.ofNat_eq_natCast, Int.cast_natCast]
    exact h1
  · apply le_neg_ediv_neg_of_mul hp
    rw [hs, Int.cast_mul, Int.cast_add, Int.ofNat_eq_natCast, Int.cast_natCast]
    exact h2

end Haagerup
