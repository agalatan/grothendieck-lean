import Grothe.UpperChaos.Q0RawWickSource
import Grothe.UpperChaos.PhaseMomentCheck
import Grothe.UpperChaos.PhiCover
import Grothe.UpperChaos.Q0RawWickDefs

/-!
# Source-derived q0 Wick polynomial in the existing dense representation

The exact rational entries coming from the q0 phase source are accumulated by
`PhaseMomentCheck.integerPhase`. Its common denominator is retained explicitly.
These identities assert no numerical value, coefficient-table check, or
quadrature enclosure.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.Q0RawWickDense

open GrotheKernel
open Grothe.UpperChaos.PhaseMomentCheck
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickSource
open Grothe.UpperChaos.Q0RealPhaseSourceSum
open Grothe.UpperChaos.Q0RealRadialSource
open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.LeanCertProductionProfile

noncomputable section

/-- The preserved denominator is strictly positive, including for an empty list. -/
theorem q0RawWickDen_pos : 0 < q0RawWickDen :=
  commonDen_pos q0RawWickEntries

/-- Dense Horner evaluation is the common-denominator-scaled rational sum. -/
theorem q0RawWickDense_eval (S Z V : ℝ) :
    he3 q0RawWickDense S Z V = (q0RawWickDen : ℝ) * Ssum q0RawWickEntries S Z V :=
  e3_integerPhase q0RawWickEntries S Z V

/-- The original rational sum is exactly the integer evaluation divided by
its nonzero common denominator. -/
theorem q0RawWickSsum_eq_dense (S Z V : ℝ) :
    Ssum q0RawWickEntries S Z V = he3 q0RawWickDense S Z V / q0RawWickDen := by
  have hne : (q0RawWickDen : ℝ) ≠ 0 := by exact_mod_cast q0RawWickDen_pos.ne'
  apply (eq_div_iff hne).2
  calc
    Ssum q0RawWickEntries S Z V * (q0RawWickDen : ℝ) =
        (q0RawWickDen : ℝ) * Ssum q0RawWickEntries S Z V := by ring
    _ = he3 q0RawWickDense S Z V := (q0RawWickDense_eval S Z V).symm

/-- The actual real Wick source sum is exactly the scaled integer evaluation. -/
theorem q0RealSourceSum_eq_dense (s : ℝ) (hs : 0 ≤ s) :
    realPhaseSourceSum (q0Beta s) (q0RealShift s) (Real.sqrt s) phaseTerms =
      he3 q0RawWickDense s (q0Beta s)⁻¹ (q0Kappa s / q0Beta s) / q0RawWickDen := by
  rw [q0RealSourceSum_eq_rawWickSsum s hs, q0RawWickSsum_eq_dense]

/-- The actual q0 radial integrand is exactly the original analytic factor
multiplied by the source-derived integer Horner evaluation and its denominator. -/
theorem q0RealRadial_eq_dense (s : ℝ) (hs : 0 ≤ s) :
    q0RealRadial s =
      (-q0Kappa s * s) *
        Real.exp (-(q0Alpha * s) - q0Alpha * s / q0Beta s) *
          (he3 q0RawWickDense s (q0Beta s)⁻¹ (q0Kappa s / q0Beta s) / q0RawWickDen) := by
  rw [q0RealRadial_eq_rawWickSsum s hs, q0RawWickSsum_eq_dense]

end
end Grothe.UpperChaos.Q0RawWickDense
