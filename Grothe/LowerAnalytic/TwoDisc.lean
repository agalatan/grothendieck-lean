import Grothe.LowerAnalytic.ResponseGram

/-!
# Factored certificates for the local two-complex-disc support

A rational LDL factorization is an exact sum-of-squares certificate for the
three-variable homogeneous slack. The theorem below removes its positivity
hypothesis from `ResponseGram.two_disc_price_bound`. No SDP optimizer is trusted.
-/

namespace Grothe.LowerAnalytic.TwoDisc

open ResponseGram

noncomputable section

def coeffA (d0 d1 l1 : ℝ) (c01 : ℂ) : ℝ := l1 - (d0 * ‖c01‖ ^ 2 + d1)
def coeffB (d0 d1 d2 l2 : ℝ) (c02 c12 : ℂ) : ℝ :=
  l2 - (d0 * ‖c02‖ ^ 2 + d1 * ‖c12‖ ^ 2 + d2)
def coeffP (d0 : ℝ) (c01 : ℂ) : ℂ := -2 * (d0 : ℂ) * star c01
def coeffQ (d0 : ℝ) (c02 : ℂ) : ℂ := -2 * (d0 : ℂ) * star c02
def coeffW (d0 d1 : ℝ) (c01 c02 c12 : ℂ) : ℂ :=
  -((d0 : ℂ) * star c01 * c02 + (d1 : ℂ) * c12)

theorem slack_factorization (d0 d1 d2 l1 l2 : ℝ) (c01 c02 c12 z0 u v : ℂ) :
    d0 * ‖z0‖ ^ 2 + (l1 - coeffA d0 d1 l1 c01) * ‖u‖ ^ 2 +
      (l2 - coeffB d0 d1 d2 l2 c02 c12) * ‖v‖ ^ 2 -
      (star z0 * star (coeffP d0 c01) * u + star z0 * star (coeffQ d0 c02) * v +
        2 * star u * coeffW d0 d1 c01 c02 c12 * v).re =
    d0 * ‖z0 + c01 * u + c02 * v‖ ^ 2 + d1 * ‖u + c12 * v‖ ^ 2 + d2 * ‖v‖ ^ 2 := by
  simp only [coeffA, coeffB, coeffP, coeffQ, coeffW, Complex.sq_norm,
    Complex.normSq_apply, map_mul, map_neg, map_ofNat,
    Complex.star_def, Complex.conj_re, Complex.conj_im,
    Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.neg_re, Complex.neg_im, Complex.ofReal_re, Complex.ofReal_im]
  norm_num
  ring

/-- A finite factored positive slack is a certificate for all complex responses
in the two discs. Rational instances can be checked by `norm_num`; no new
numerical axiom or local optimization hypothesis is required. -/
theorem support_of_factor (d0 d1 d2 l1 l2 : ℝ) (c01 c02 c12 : ℂ)
    (hd0 : 0 ≤ d0) (hd1 : 0 ≤ d1) (hd2 : 0 ≤ d2)
    (hl1 : 0 ≤ l1) (hl2 : 0 ≤ l2) (u v : ℂ) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1) :
    twoDiscValue (coeffA d0 d1 l1 c01) (coeffB d0 d1 d2 l2 c02 c12)
      (coeffP d0 c01) (coeffQ d0 c02) (coeffW d0 d1 c01 c02 c12) u v ≤ d0 + l1 + l2 := by
  apply two_disc_price_bound _ _ _ _ _ _ _ _ hl1 hl2 ?_ u v hu hv
  intro z0 u v
  rw [slack_factorization]
  positivity

theorem bilinear_support (u v : ℂ) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1) :
    twoDiscValue 0 0 0 0 1 u v ≤ 2 := by
  have h := support_of_factor 0 1 0 1 1 0 0 (-1)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num) u v hu hv
  norm_num [coeffA, coeffB, coeffP, coeffQ, coeffW] at h
  exact h

theorem independent_interior_support (u v : ℂ) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1) :
    twoDiscValue (-1) (-1) 1 1 0 u v ≤ 1 / 2 := by
  have h := support_of_factor (1/2) (1/2) 0 0 0 (-1) (-1) (-1)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num) u v hu hv
  norm_num [coeffA, coeffB, coeffP, coeffQ, coeffW] at h
  exact h

theorem coupled_interior_support (u v : ℂ) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1) :
    twoDiscValue (-1) (-1) 1 1 (1/4) u v ≤ 2 / 3 := by
  have h := support_of_factor (2/3) (5/8) 0 0 0 (-3/4) (-3/4) (-1)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num) u v hu hv
  norm_num [coeffA, coeffB, coeffP, coeffQ, coeffW, Complex.norm_real] at h
  exact h

theorem complex_linear_support (u v : ℂ) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1) :
    twoDiscValue 0 0 ⟨3/5, 4/5⟩ Complex.I 0 u v ≤ 2 := by
  have h := support_of_factor 1 (1/4) 0 (1/2) (1/2)
    ⟨-3/10,2/5⟩ ⟨0,1/2⟩ ⟨-4/5,3/5⟩
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num) u v hu hv
  convert h using 1 <;>
    norm_num [coeffA, coeffB, coeffP, coeffQ, coeffW, Complex.sq_norm,
      Complex.normSq_apply, Complex.star_def, Complex.ext_iff]
  congr 1 <;> apply Complex.ext <;>
    norm_num [Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im]

theorem sharp_examples_attained :
    twoDiscValue 0 0 0 0 1 1 1 = 2 ∧
    twoDiscValue (-1) (-1) 1 1 0 (1/2) (1/2) = 1/2 ∧
    twoDiscValue (-1) (-1) 1 1 (1/4) (2/3) (2/3) = 2/3 ∧
    twoDiscValue 0 0 ⟨3/5,4/5⟩ Complex.I 0 ⟨3/5,4/5⟩ Complex.I = 2 := by
  norm_num [twoDiscValue, Complex.sq_norm, Complex.normSq_apply, Complex.star_def,
    Complex.ext_iff, Complex.mul_re, Complex.mul_im]

end

end Grothe.LowerAnalytic.TwoDisc
