import Grothe.UpperChaos.Q0RawWickPerTerm
import Grothe.UpperChaos.Q0RealRadialSource

/-!
# Source-bound trivariate sum for the q0 radial integrand

This lifts the per-term real shifted-Wick identity over a phase-source list
and then specializes to the actual production data. The entries are the
uncompressed rational terms derived in Lean; no external coefficient bank,
numerical enclosure or integration estimate is asserted. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RawWickSource

open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickPerTerm
open Grothe.UpperChaos.Q0RealPhaseSourceSum
open Grothe.UpperChaos.Q0RealRadialSource
open Grothe.UpperChaos.Q0RadialWickReal
open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.LeanCertProductionProfile

noncomputable section

/-- Summing the per-term raw identity works for any source-format term list,
including repeated terms and zeros. -/
theorem realPhaseSourceSum_eq_rawWickSsum (β r v : ℝ)
    (ts : List ((ℕ × ℕ × ℕ) × ℚ)) :
    realPhaseSourceSum β (-(v * r)) r ts =
      Ssum (rawWickEntries ts) (r ^ 2) β⁻¹ v := by
  unfold realPhaseSourceSum
  rw [Ssum_rawWickEntries]
  apply congrArg List.sum
  apply List.map_congr_left
  intro t ht
  rcases t with ⟨⟨a, b, c⟩, d⟩
  exact realPhaseSourceTerm_eq_rawWickSsum β r v a b c d

/-- The actual q0 real source sum equals the source-derived rational
trivariate sum at `S=s`, `Z=β⁻¹`, `V=κ/β`. -/
theorem q0RealSourceSum_eq_rawWickSsum (s : ℝ) (hs : 0 ≤ s) :
    realPhaseSourceSum (q0Beta s) (q0RealShift s) (Real.sqrt s) phaseTerms =
      Ssum q0RawWickEntries s (q0Beta s)⁻¹ (q0Kappa s / q0Beta s) := by
  have hshift : q0RealShift s = -((q0Kappa s / q0Beta s) * Real.sqrt s) := by
    unfold q0RealShift
    ring
  have hsqrt : (Real.sqrt s) ^ 2 = s := Real.sq_sqrt hs
  have h := realPhaseSourceSum_eq_rawWickSsum (q0Beta s) (Real.sqrt s)
    (q0Kappa s / q0Beta s) phaseTerms
  rw [hshift]
  simpa only [hsqrt, q0RawWickEntries] using h

/-- The original complex radial Wick sum is the real embedding of the
source-derived rational trivariate sum. -/
theorem q0RadialWickSum_eq_rawWickSsum (s : ℝ) (hs : 0 ≤ s) :
    q0RadialWickSum s =
      (Ssum q0RawWickEntries s (q0Beta s)⁻¹ (q0Kappa s / q0Beta s) : ℂ) := by
  rw [q0RadialWickSum_eq_realSourceSum s hs, q0RealSourceSum_eq_rawWickSsum s hs]

/-- The exact actual radial integrand uses the same Lean-derived rational
trivariate entries and the original Gaussian/profile factors. -/
theorem q0RealRadial_eq_rawWickSsum (s : ℝ) (hs : 0 ≤ s) :
    q0RealRadial s =
      (-q0Kappa s * s) *
        Real.exp (-(q0Alpha * s) - q0Alpha * s / q0Beta s) *
          Ssum q0RawWickEntries s (q0Beta s)⁻¹ (q0Kappa s / q0Beta s) := by
  unfold q0RealRadial
  rw [q0RealSourceSum_eq_rawWickSsum s hs]

end
end Grothe.UpperChaos.Q0RawWickSource
