import Grothe.UpperChaos.RationalUnitWickProduction
import Grothe.UpperChaos.TaylorQuadrature

/-!
# Rational unit-mode compiler in the regular quadrature kernel

This is an exact source-bound identity for any unit Hermite mode and Taylor
power. The substitution `t = u²` cancels the negative half-power against the
quadrature Jacobian on the positive `u` axis. No parity reduction or numerical
enclosure is asserted.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.RationalUnitQuadrature

open Grothe.UpperChaos.RationalUnitTaylorSource
open Grothe.UpperChaos.RationalWickMonomial
open Grothe.UpperChaos.RationalWickCompiler
open Grothe.UpperChaos.RationalUnitWickProduction

noncomputable section

/-- The actual regular quadrature kernel for any unit mode is a real
normalization and damping factor times the source-derived Wick polynomial. -/
theorem taylorQuadratureKernel_unit_eq_compiled
    {N : ℕ} (i : GradedIdx N) (j : ℕ) (η u s : ℝ)
    (hu : 0 < u) (hs : 0 ≤ s) :
    taylorQuadratureKernel η j N (gradedUnitCoeff i) u s =
      ((2 * Real.exp (-(η ^ 2 * u ^ 2)) * Real.exp (-s) *
        Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) * s) *
          nrm2 (gradedIdx i) *
            Real.exp (-(unitAlpha j * u ^ 2 * s /
              unitBeta j (Real.sqrt s) (u ^ 2))) *
                evalWickQ (Real.sqrt s) (unitBeta j (Real.sqrt s) (u ^ 2))⁻¹
                  (unitKappa (Real.sqrt s) * u ^ 2 /
                    unitBeta j (Real.sqrt s) (u ^ 2)) (unitKappa (Real.sqrt s))
                  (wickCompileQ (unitSourceQ phaseTerms i j)) : ℝ) : ℂ) := by
  have hnorm : Complex.normSq (Real.sqrt s : ℂ) = s := by
    simpa [Complex.normSq_ofReal] using Real.mul_self_sqrt hs
  have hrpow : (u ^ 2) ^ (-(1 / 2 : ℝ)) = u⁻¹ := by
    rw [Real.rpow_neg (sq_nonneg u), ← Real.sqrt_eq_rpow,
      Real.sqrt_sq_eq_abs, abs_of_pos hu]
  have huC : (u : ℂ) ≠ 0 := by exact_mod_cast hu.ne'
  rw [taylorQuadratureKernel,
    taylorRegularWick_eq j N (gradedUnitCoeff i) u hu,
    taylorConditionalWick_unit_eq_compiled i j (u ^ 2) (Real.sqrt s) (sq_pos_of_pos hu),
    hnorm, hrpow]
  calc
    _ = ((u : ℂ) * (u : ℂ)⁻¹) *
        ((2 * Real.exp (-(η ^ 2 * u ^ 2)) * Real.exp (-s) *
          Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) * s) *
            nrm2 (gradedIdx i) *
              Real.exp (-(unitAlpha j * u ^ 2 * s /
                unitBeta j (Real.sqrt s) (u ^ 2))) *
                  evalWickQ (Real.sqrt s) (unitBeta j (Real.sqrt s) (u ^ 2))⁻¹
                    (unitKappa (Real.sqrt s) * u ^ 2 /
                      unitBeta j (Real.sqrt s) (u ^ 2)) (unitKappa (Real.sqrt s))
                    (wickCompileQ (unitSourceQ phaseTerms i j)) : ℝ) : ℂ) := by
      push_cast
      ring
    _ = _ := by rw [mul_inv_cancel₀ huC, one_mul]

end
end Grothe.UpperChaos.RationalUnitQuadrature
