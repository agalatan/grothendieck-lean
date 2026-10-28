import Grothe.UpperChaos.RationalUnitQuadrature
import Grothe.UpperChaos.UnitSquaredRadiusProfile

/-!
# Conditional squared-radius form of the unit quadrature kernel

The exact parity reduction is an explicit hypothesis. This module does not
assume or manufacture a parity theorem, and makes no numerical claim.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.UnitSquaredQuadratureConditional

open Grothe.UpperChaos.RationalUnitTaylorSource
open Grothe.UpperChaos.RationalWickMonomial
open Grothe.UpperChaos.RationalWickCompiler
open Grothe.UpperChaos.RationalUnitWickProduction
open Grothe.UpperChaos.RationalUnitQuadrature
open Grothe.UpperChaos.UnitSquaredRadiusProfile

noncomputable section

/-- The proposed squared-radius real kernel, parametrized by an arbitrary
function replacing the radius-dependent Wick evaluation. -/
def squaredRealKernel {N : ℕ} (i : GradedIdx N) (j : ℕ) (η : ℝ)
    (W : ℝ → ℝ → ℝ → ℝ → ℝ) (s u : ℝ) : ℝ :=
  2 * Real.exp (-(η ^ 2 * u ^ 2)) * Real.exp (-s) *
    Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) * s) *
      nrm2 (gradedIdx i) *
        Real.exp (-(unitAlpha j * u ^ 2 * s / unitSquaredBeta j s u)) *
          W s (unitSquaredBeta j s u)⁻¹
            (unitSquaredKappa s * u ^ 2 / unitSquaredBeta j s u) (unitSquaredKappa s)

/-- At one physical point, any proposed squared-radius representation of the
Wick evaluation yields the corresponding exact production kernel identity. -/
theorem quadrature_eq_squared_of_pointwise {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s)
    (W : ℝ → ℝ → ℝ → ℝ → ℝ)
    (hparity :
      evalWickQ (Real.sqrt s) (unitSquaredBeta j s u)⁻¹
          (unitSquaredKappa s * u ^ 2 / unitSquaredBeta j s u) (unitSquaredKappa s)
          (wickCompileQ (unitSourceQ phaseTerms i j)) =
        W s (unitSquaredBeta j s u)⁻¹
          (unitSquaredKappa s * u ^ 2 / unitSquaredBeta j s u) (unitSquaredKappa s)) :
    taylorQuadratureKernel η j N (gradedUnitCoeff i) u s =
      (squaredRealKernel i j η W s u : ℂ) := by
  have h := taylorQuadratureKernel_unit_eq_compiled i j η u s hu hs
  simp only [unitBeta_sqrt_square_eq_squared j s u hs,
    unitKappa_sqrt_eq_squared s hs] at h
  rw [hparity] at h
  exact h

/-- A uniform parity/evaluation identity supplies the pointwise hypothesis on
every physical cell, without constraining the representation of `W`. -/
theorem quadrature_eq_squared_of_identity {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s)
    (W : ℝ → ℝ → ℝ → ℝ → ℝ)
    (hparity : ∀ s : ℝ, 0 ≤ s → ∀ b v k : ℝ,
      evalWickQ (Real.sqrt s) b v k (wickCompileQ (unitSourceQ phaseTerms i j)) =
        W s b v k) :
    taylorQuadratureKernel η j N (gradedUnitCoeff i) u s =
      (squaredRealKernel i j η W s u : ℂ) := by
  apply quadrature_eq_squared_of_pointwise i j η u s hu hs W
  exact hparity s hs _ _ _

end
end Grothe.UpperChaos.UnitSquaredQuadratureConditional
