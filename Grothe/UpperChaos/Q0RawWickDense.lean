import Grothe.UpperChaos.Q0RawWickPerTerm
import Grothe.UpperChaos.PhaseMomentCheck
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
open Grothe.UpperChaos.Q0RealPhaseSourceSum
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

end
end Grothe.UpperChaos.Q0RawWickDense
