import Grothe.UpperChaos.Q0RealShiftMoments
import Grothe.UpperChaos.RationalWickDefs

/-!
# Rational Wick polynomials for a real-shifted monomial

The four variables are `(r, b, v, κ)` with shift `-v*r` and `b=β⁻¹`.
This is source-independent algebra; it asserts no source compression or
numerical certificate.

Agent-ID: codex-8c4d
-/

open MvPolynomial

namespace Grothe.UpperChaos.RationalWickMonomial

open Grothe.UpperChaos.Q0RealShiftMoments

noncomputable section

/-- Evaluating the rational polynomial gives the exact shifted Gaussian
moment, including the inverse-rate mass. No nonzero-rate premise is needed
for this algebraic identity. -/
theorem eval_wickMomentQ (r β v κ : ℝ) (p q : ℕ) :
    evalWickQ r β⁻¹ v κ (wickMomentQ p q) =
      realShiftedMoment β (-(v * r)) p q := by
  rw [wickMomentQ, map_sum, realShiftedMoment_powerSum]
  apply Finset.sum_congr rfl
  intro j hj
  simp [evalWickQ, div_eq_mul_inv, inv_pow]; ring; simp

/-- Evaluating the full affine monomial compiler gives the exact real
finite-moment expression. -/
theorem eval_wickAffineMonomialQ (r β v κ : ℝ) (A B p q : ℕ) :
    evalWickQ r β⁻¹ v κ (wickAffineMonomialQ A B p q) =
      r ^ (A + B) * (r * realShiftedMoment β (-(v * r)) p q +
        κ * realShiftedMoment β (-(v * r)) (p + 1) q) := by
  simp only [wickAffineMonomialQ, map_mul, map_add, map_pow, eval_wickMomentQ]
  simp [evalWickQ]

/-- The compiled rational monomial is exactly the complex Wick expression
at a real radius and a real Gaussian shift. -/
theorem eval_wickAffineMonomialQ_eq_shifted (r β v κ : ℝ) (A B p q : ℕ) :
    (evalWickQ r β⁻¹ v κ (wickAffineMonomialQ A B p q) : ℂ) =
      (r : ℂ) ^ (A + B) *
        ((r : ℂ) * shiftedDampedMoment β (-(v * r) : ℝ) p q +
          (κ : ℂ) * shiftedDampedMoment β (-(v * r) : ℝ) (p + 1) q) := by
  rw [eval_wickAffineMonomialQ, shiftedDampedMoment_ofReal, shiftedDampedMoment_ofReal]
  push_cast
  rfl

end
end Grothe.UpperChaos.RationalWickMonomial
