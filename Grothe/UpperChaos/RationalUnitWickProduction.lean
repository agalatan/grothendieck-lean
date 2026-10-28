import Grothe.UpperChaos.RationalWickIntegralBridge
import Grothe.UpperChaos.TaylorConditionalGaussian

/-!
# Unit-mode production evaluator from the rational Wick compiler

The identity is obtained through the common Gaussian integral. In particular,
it never identifies the support of a four-variable rational polynomial with
the support of its specialized two-variable complex slice. No numerical
enclosure is asserted.

Agent-ID: codex-8c4d
-/

open MeasureTheory Grothe.LowerAnalytic Grothe.Haag

namespace Grothe.UpperChaos.RationalUnitWickProduction

open Grothe.UpperChaos.RationalPhaseInvariant
open Grothe.UpperChaos.RationalUnitTaylorSource
open Grothe.UpperChaos.RationalWickMonomial
open Grothe.UpperChaos.RationalWickCompiler
open Grothe.UpperChaos.RationalWickIntegralBridge

noncomputable section

/-- The production Gaussian rate before the affine tilt. -/
def unitAlpha (j : ℕ) : ℝ :=
  1 + (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)

/-- The actual real affine profile coefficient at the real radius `r`. -/
def unitKappa (r : ℝ) : ℝ :=
  Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖(r : ℂ)‖ ^ 2)

/-- The conditional Gaussian rate for the production unit source. -/
def unitBeta (j : ℕ) (r t : ℝ) : ℝ :=
  unitAlpha j + unitKappa r ^ 2 * t

theorem unitAlpha_pos (j : ℕ) : 0 < unitAlpha j := by
  have hε : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by
    norm_num [Grothe.Upper.phaseEpsQ]
  unfold unitAlpha
  positivity

/-- The actual conditional evaluator of any unit Hermite mode is the
source-derived rational Wick polynomial, multiplied by its normalization and
both original damping factors. -/
theorem taylorConditionalWick_unit_eq_compiled {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (t r : ℝ) (ht : 0 < t) :
    taylorConditionalWick j N (gradedUnitCoeff i) t (r : ℂ) =
      (Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) *
        Complex.normSq (r : ℂ)) : ℂ) *
        ((nrm2 (gradedIdx i) : ℂ) *
          (((t ^ (-(1 / 2 : ℝ)) *
            Real.exp (-(unitAlpha j * t * Complex.normSq (r : ℂ) /
              unitBeta j r t)) : ℝ) : ℂ) *
            (evalWickQ r (unitBeta j r t)⁻¹
              (unitKappa r * t / unitBeta j r t) (unitKappa r)
                (wickCompileQ (unitSourceQ phaseTerms i j)) : ℂ))) := by
  let P : CPoly := taylorSourceSlice phaseTerms j N (gradedUnitCoeff i) (r : ℂ)
  let Q : RatPoly4 := unitSourceQ phaseTerms i j
  have hα : 0 < unitAlpha j := unitAlpha_pos j
  have hslice (w : ℂ) : ev w P = (nrm2 (gradedIdx i) : ℂ) * evalQ (r : ℂ) w Q := by
    exact (eval_unitSourceQ_eq_slice phaseTerms i j (r : ℂ) w).symm
  have hfun : (fun w : ℂ => ev w P *
      phaseLaplaceKernel ((r : ℂ) + (unitKappa r : ℂ) * w) t *
        (Real.exp (-(unitAlpha j - 1) * Complex.normSq w) : ℂ)) =
      fun w : ℂ => (nrm2 (gradedIdx i) : ℂ) *
        (evalQ (r : ℂ) w Q *
          phaseLaplaceKernel ((r : ℂ) + (unitKappa r : ℂ) * w) t *
            (Real.exp (-(unitAlpha j - 1) * Complex.normSq w) : ℂ)) := by
    funext w
    rw [hslice]
    ring
  have hproduction :
      taylorConditionalWick j N (gradedUnitCoeff i) t (r : ℂ) =
        (Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) *
          Complex.normSq (r : ℂ)) : ℂ) *
          ∫ w : ℂ, ev w P * phaseLaplaceKernel ((r : ℂ) + (unitKappa r : ℂ) * w) t *
            (Real.exp (-(unitAlpha j - 1) * Complex.normSq w) : ℂ) ∂gaussC := by
    rw [integral_affine_phaseLaplace_polynomial P (unitAlpha j) (unitKappa r) t
      (r : ℂ) hα ht]
    rfl
  calc
    taylorConditionalWick j N (gradedUnitCoeff i) t (r : ℂ) = _ := hproduction
    _ = (Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) *
          Complex.normSq (r : ℂ)) : ℂ) *
        ((nrm2 (gradedIdx i) : ℂ) *
          ∫ w : ℂ, evalQ (r : ℂ) w Q *
            phaseLaplaceKernel ((r : ℂ) + (unitKappa r : ℂ) * w) t *
              (Real.exp (-(unitAlpha j - 1) * Complex.normSq w) : ℂ) ∂gaussC) := by
      rw [hfun, integral_const_mul]
    _ = _ := by
      rw [integral_evalQ_eq_wickCompile Q r (unitAlpha j) (unitKappa r) t hα ht]
      rfl

end
end Grothe.UpperChaos.RationalUnitWickProduction
