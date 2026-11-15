import Grothe.UpperChaos.UnitSquaredQuadratureConditional
import Grothe.UpperChaos.RationalSquaredRadius

/-!
# Exact squared-radius unit quadrature kernel

This composes the production quadrature identity with the source-derived
radius-parity theorem. It asserts no numerical enclosure or approximation.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.UnitSquaredQuadrature

open Grothe.UpperChaos.RationalUnitTaylorSource
open Grothe.UpperChaos.RationalWickMonomial
open Grothe.UpperChaos.RationalWickCompiler
open Grothe.UpperChaos.RationalSquaredRadius
open Grothe.UpperChaos.UnitSquaredQuadratureConditional

noncomputable section

/-- The actual unit-source Wick polynomial with its radius exponent halved. -/
def unitSquaredWickQ {N : ℕ} (i : GradedIdx N) (j : ℕ) : WickPoly :=
  squareRadiusQ (wickCompileQ (unitSourceQ phaseTerms i j))

/-- The source-bound real quadrature kernel in `(s,u)` order, with no
variable square root in the polynomial, profile or rate. -/
def unitSquaredRealKernel {N : ℕ} (i : GradedIdx N) (j : ℕ) (η s u : ℝ) : ℝ :=
  squaredRealKernel i j η (fun s b v κ => evalWickQ s b v κ (unitSquaredWickQ i j)) s u

/-- For physical inputs, the actual regular production kernel equals the
squared-radius polynomial expression, including all normalization and damping
factors. -/
theorem taylorQuadratureKernel_unit_eq_squared {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s) :
    taylorQuadratureKernel η j N (gradedUnitCoeff i) u s =
      (unitSquaredRealKernel i j η s u : ℂ) := by
  apply quadrature_eq_squared_of_identity i j η u s hu hs
    (fun s b v κ => evalWickQ s b v κ (unitSquaredWickQ i j))
  intro s hs b v κ
  exact eval_unitWickQ_sqrt phaseTerms i j s b v κ hs

end
end Grothe.UpperChaos.UnitSquaredQuadrature
