import Grothe.UpperChaos.Q0RealPhaseTerm
import Grothe.UpperChaos.Q0RadialWickReal

/-!
# The actual phase source as real finite Wick sums

The per-term real identity is summed over the literal `phaseTerms` list. This
preserves the binomial and moment sums and introduces no external coefficient
bank or numerical enclosure. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RealPhaseSourceSum

open Grothe.UpperChaos.Q0RealPhaseTerm
open Grothe.UpperChaos.Q0RealShiftMoments
open Grothe.UpperChaos.Q0WickTermLinearity
open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.Q0AffineCancellation
open Grothe.UpperChaos.Q0RadialWickReal
open Grothe.UpperChaos.LeanCertProductionProfile

noncomputable section

/-- The exact real Wick contribution of one source-format phase monomial. -/
def realPhaseSourceTerm (β m r : ℝ) (t : (ℕ × ℕ × ℕ) × ℚ) : ℝ :=
  ∑ k ∈ Finset.range (t.1.2.2 + 1),
    realPhaseMonomialCoeff t.1.1 t.1.2.2 k t.2 r *
      realImSqMoment β m (t.1.2.1 + k) (t.1.2.1 + (t.1.2.2 - k))

/-- The real finite sum for any source-format phase list. -/
def realPhaseSourceSum (β m r : ℝ) (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : ℝ :=
  (ts.map (realPhaseSourceTerm β m r)).sum

/-- Summing the per-term identity preserves the exact finite source list,
including repeated or zero-valued source terms. -/
theorem wickEval_phaseInvariantSlice_ofReal (β m r : ℝ)
    (ts : List ((ℕ × ℕ × ℕ) × ℚ)) :
    wickEval β (m : ℂ) (phaseInvariantSlice ts (r : ℂ)) =
      (realPhaseSourceSum β m r ts : ℂ) := by
  rw [wickEval_phaseInvariantSlice]
  unfold realPhaseSourceSum
  induction ts with
  | nil => simp
  | cons t ts ih =>
      simp only [List.map_cons, List.sum_cons, Complex.ofReal_add]
      rw [ih]
      congr 1
      rcases t with ⟨⟨a, b, c⟩, d⟩
      exact wickEval_single_phaseTerm_ofReal β m r a b c d

/-- The real scalar shift at the production q0 radial scale. -/
def q0RealShift (s : ℝ) : ℝ :=
  -(q0Kappa s / q0Beta s) * Real.sqrt s

/-- The actual complex q0 shift is the embedding of the real scalar shift. -/
theorem q0Shift_eq_ofReal (s : ℝ) (hs : 0 ≤ s) :
    q0Shift (Real.sqrt s) 1 = (q0RealShift s : ℂ) := by
  have hk : kappaAtReal (Real.sqrt s) = q0Kappa s := by
    simpa [kappaAtReal] using (q0Kappa_eq_wick_profile s hs).symm
  have hb : q0Rate (Real.sqrt s) 1 = q0Beta s := by
    simp [q0Rate, q0Beta, q0Alpha, hk]
  simp only [q0Shift, q0RealShift, hb, hk, mul_one,
    ← Complex.ofReal_neg, ← Complex.ofReal_mul]

/-- The production radial Wick sum equals the real finite source-term sum;
this statement uses the actual phase list and actual profile-dependent rate. -/
theorem q0RadialWickSum_eq_realSourceSum (s : ℝ) (hs : 0 ≤ s) :
    q0RadialWickSum s =
      (realPhaseSourceSum (q0Beta s) (q0RealShift s) (Real.sqrt s) phaseTerms : ℂ) := by
  change wickEval (q0Beta s) (q0Shift (Real.sqrt s) 1)
    (phaseInvariantSlice phaseTerms (Real.sqrt s : ℂ)) = _
  rw [q0Shift_eq_ofReal s hs]
  exact wickEval_phaseInvariantSlice_ofReal _ _ _ _

end
end Grothe.UpperChaos.Q0RealPhaseSourceSum
