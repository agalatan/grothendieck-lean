import Grothe.UpperChaos.Q0RadialWickReal

/-!
# Source-term linearity of the q0 radial Wick sum

The production phase slice is a sum of the literal `phaseTerms`. This file
splits its shifted-Wick evaluation into one contribution per source term and
states the evaluation of any polynomial monomial. It does not yet prove the
binomial/double-factorial compression formula or a numerical enclosure.
Agent-ID: codex-8c4d.
-/

open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0WickTermLinearity

open MvPolynomial
open Grothe.UpperChaos.Q0PhaseWickBridge
open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.Q0RadialWickReal
open Grothe.UpperChaos.LeanCertProductionProfile

noncomputable section

/-- Shifted imaginary-square Wick evaluation as a finitely supported sum. -/
def wickEval (β : ℝ) (μ : ℂ) (P : CPoly) : ℂ :=
  P.coeff.sum fun k c => c * imSqMoment β μ (k 0) (k 1)

/-- Wick evaluation is additive in the polynomial, including cancellation of
coefficients when supports overlap. -/
theorem wickEval_add (β : ℝ) (μ : ℂ) (P Q : CPoly) :
    wickEval β μ (P + Q) = wickEval β μ P + wickEval β μ Q := by
  classical
  unfold wickEval
  rw [AddMonoidAlgebra.coeff_add]
  exact Finsupp.sum_add_index' (fun _ => zero_mul _) (fun _ _ _ => add_mul _ _ _)

/-- The value of an arbitrary complex monomial is its coefficient times the
corresponding existing shifted imaginary-square moment. -/
theorem wickEval_monomial (β : ℝ) (μ : ℂ) (k : Fin 2 →₀ ℕ) (c : ℂ) :
    wickEval β μ (monomial k c) = c * imSqMoment β μ (k 0) (k 1) := by
  classical
  simp [wickEval, ← MvPolynomial.single_eq_monomial, AddMonoidAlgebra.coeff_single,
    Finsupp.sum_single_index]

/-- The `b = c = 0` source monomial has only the zero-index imaginary
moment; its coefficient is tied to the literal phase-slice constructor. -/
theorem wickEval_constantAngular_phaseTerm (β : ℝ) (μ z : ℂ) (a : ℕ) (d : ℚ) :
    wickEval β μ (phaseInvariantSlice [((a, 0, 0), d)] z) =
      ((d : ℂ) * (Complex.normSq z : ℂ) ^ a) * imSqMoment β μ 0 0 := by
  have hs : phaseInvariantSlice [((a, 0, 0), d)] z =
      monomial 0 ((d : ℂ) * (Complex.normSq z : ℂ) ^ a) := by
    simp only [phaseInvariantSlice, List.map_cons, List.map_nil, List.sum_cons,
      List.sum_nil, pow_zero, mul_one, add_zero]
    rw [← map_pow, ← map_mul, MvPolynomial.C_apply]
  rw [hs, wickEval_monomial]
  simp

/-- The actual phase-slice construction may be evaluated term by term. -/
theorem wickEval_phaseInvariantSlice (β : ℝ) (μ z : ℂ)
    (ts : List ((ℕ × ℕ × ℕ) × ℚ)) :
    wickEval β μ (phaseInvariantSlice ts z) =
      (ts.map fun t => wickEval β μ (phaseInvariantSlice [t] z)).sum := by
  induction ts with
  | nil => simp [phaseInvariantSlice, wickEval]
  | cons t ts ih =>
      have hs : phaseInvariantSlice (t :: ts) z =
          phaseInvariantSlice [t] z + phaseInvariantSlice ts z := by
        simp [phaseInvariantSlice]
      rw [hs, wickEval_add, ih]
      simp

/-- The production radial Wick sum is the sum of the contributions from the
actual source data; no numerical values or external term lists are assumed. -/
theorem q0RadialWickSum_eq_source_terms (s : ℝ) :
    q0RadialWickSum s =
      (phaseTerms.map fun t =>
        wickEval (q0Beta s) (q0Shift (Real.sqrt s) 1)
          (phaseInvariantSlice [t] (Real.sqrt s : ℂ))).sum := by
  change wickEval (q0Beta s) (q0Shift (Real.sqrt s) 1)
    (phaseInvariantSlice phaseTerms (Real.sqrt s : ℂ)) = _
  exact wickEval_phaseInvariantSlice _ _ _ _

end
end Grothe.UpperChaos.Q0WickTermLinearity
