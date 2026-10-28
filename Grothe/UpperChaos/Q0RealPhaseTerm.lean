import Grothe.UpperChaos.Q0PhaseTermWick
import Grothe.UpperChaos.Q0RealShiftMoments

/-!
# A source phase term evaluated at real radius and real shift

This joins the exact binomial expansion of an actual-format phase source term
to the real shifted-moment sums. It preserves the finite sums and does not
claim the compressed double-factorial form or any numerical enclosure.
Agent-ID: codex-8c4d.
-/

open Grothe.UpperChaos.Q0PhaseMonomialExpansion
open Grothe.UpperChaos.Q0PhaseTermWick
open Grothe.UpperChaos.Q0RealShiftMoments
open Grothe.UpperChaos.Q0WickTermLinearity

namespace Grothe.UpperChaos.Q0RealPhaseTerm

noncomputable section

/-- Real coefficient of one binomial contribution to a phase source term. -/
def realPhaseMonomialCoeff (a c k : ℕ) (d : ℚ) (r : ℝ) : ℝ :=
  (d : ℝ) * (r ^ 2) ^ a * (1 / 2 : ℝ) ^ c *
    (c.choose k : ℝ) * r ^ k * r ^ (c - k)

/-- The complex phase-slice coefficient is the embedding of the real one at
a real first coordinate, including the case `r = 0`. -/
theorem phaseMonomialCoeff_ofReal (a c k : ℕ) (d : ℚ) (r : ℝ) :
    phaseMonomialCoeff a c k d (r : ℂ) = (realPhaseMonomialCoeff a c k d r : ℂ) := by
  simp only [phaseMonomialCoeff, realPhaseMonomialCoeff, Complex.normSq_ofReal,
    Complex.conj_ofReal]
  push_cast; ring

/-- An arbitrary literal phase term at real radius and real shift equals a
real finite binomial sum of the existing exact real shifted moments. -/
theorem wickEval_single_phaseTerm_ofReal (β m r : ℝ) (a b c : ℕ) (d : ℚ) :
    wickEval β (m : ℂ) (phaseInvariantSlice [((a, b, c), d)] (r : ℂ)) =
      ((∑ k ∈ Finset.range (c + 1),
        realPhaseMonomialCoeff a c k d r *
          realImSqMoment β m (b + k) (b + (c - k)) : ℝ) : ℂ) := by
  rw [wickEval_single_phaseTerm, Complex.ofReal_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [phaseMonomialCoeff_ofReal, imSqMoment_ofReal, Complex.ofReal_mul]

/-- The contribution is explicitly real; this does not require the radius or
shift to be nonzero or the Gaussian rate to be positive. -/
theorem wickEval_single_phaseTerm_im_eq_zero (β m r : ℝ) (a b c : ℕ) (d : ℚ) :
    (wickEval β (m : ℂ) (phaseInvariantSlice [((a, b, c), d)] (r : ℂ))).im = 0 := by
  rw [wickEval_single_phaseTerm_ofReal]
  simp

end
end Grothe.UpperChaos.Q0RealPhaseTerm
