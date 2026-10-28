import Grothe.UpperChaos.RationalWickMonomial
import Grothe.UpperChaos.ShiftedMomentRecurrence

/-!
# Shared real shifted moment recurrence

A foundational exact bridge for the all-mode compiler. It does not claim a
numerical bound or a source table certificate.
Agent-ID: codex-8c4d.
-/

open MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos.SharedWickMomentRecurrence
open Grothe.UpperChaos.RationalWickMonomial

/-- Shifted complex Gaussian moments with inverse-rate mass and real shift. -/
def momentRec (r b v : ℝ) : ℕ → ℕ → ℝ
  | 0, q => b * (-(v * r)) ^ q
  | p + 1, q => -(v * r) * momentRec r b v p q +
      (q : ℝ) * b * momentRec r b v p (q - 1)

/-- The recurrence computes the existing shifted complex moment at positive
inverse rate. -/
theorem momentRec_eq_shifted (r b v : ℝ) (hb : 0 < b) (p q : ℕ) :
    (momentRec r b v p q : ℂ) =
      shiftedDampedMoment b⁻¹ (-(v * r) : ℝ) p q := by
  have hrate : 0 < b⁻¹ := inv_pos.mpr hb
  induction p generalizing q with
  | zero =>
      simp [momentRec, shiftedDampedMoment, div_eq_mul_inv, mul_comm]
  | succ p ih =>
      rw [shiftedDampedMoment_succ_left _ _ _ _ hrate]
      simp only [momentRec, Complex.ofReal_add, Complex.ofReal_mul,
        Complex.ofReal_neg, Complex.ofReal_natCast, ih]
      push_cast
      simp [div_eq_mul_inv, mul_assoc]

/-- The literal polynomial compiler's moment has the same shifted moment,
including at zero inverse rate. -/
theorem eval_wickMomentQ_eq_shifted (r b v κ : ℝ) (p q : ℕ) :
    (evalWickQ r b v κ (wickMomentQ p q) : ℂ) =
      shiftedDampedMoment b⁻¹ (-(v * r) : ℝ) p q := by
  have h := Grothe.UpperChaos.RationalWickMonomial.eval_wickMomentQ
    r b⁻¹ v κ p q
  simp only [inv_inv] at h
  calc
    (evalWickQ r b v κ (wickMomentQ p q) : ℂ) =
        (Grothe.UpperChaos.Q0RealShiftMoments.realShiftedMoment b⁻¹
          (-(v * r)) p q : ℂ) := congrArg Complex.ofReal h
    _ = shiftedDampedMoment b⁻¹ (-(v * r) : ℝ) p q :=
      (Grothe.UpperChaos.Q0RealShiftMoments.shiftedDampedMoment_ofReal
        b⁻¹ (-(v * r)) p q).symm

/-- The recurrence agrees with the exact polynomial compiler, for positive
inverse rate. -/
theorem momentRec_eq_wickMomentQ (r b v κ : ℝ) (hb : 0 < b) (p q : ℕ) :
    momentRec r b v p q = evalWickQ r b v κ (wickMomentQ p q) := by
  apply Complex.ofReal_injective
  rw [momentRec_eq_shifted r b v hb, eval_wickMomentQ_eq_shifted]

end Grothe.UpperChaos.SharedWickMomentRecurrence
