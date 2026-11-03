import Grothe.UpperChaos.Q0GaussProductionMass
import Grothe.UpperChaos.F0ConditionalNode

/-! Actual F0 conditional Hermite energy at every selected source node.
The mathematical quadrature identity and numerical source approximation
remain separate. Agent-ID: codex-aa04. -/
open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0GaussConditionalEnergy

open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.F0ConditionalNode


/-- At a selected source node, the phase slice is the actual frozen radial
profile used by the production F0 response. -/
theorem source_phaseSlice_eq (a : Address) (w : ℂ) :
    phaseSlice (sourceNode a) w =
      Grothe.Haag.ph ((Real.sqrt (sourceNode a) : ℂ) +
        ((Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) *
          Grothe.UpperChaos.vprof (sourceNode a) : ℝ) : ℂ) * w) := by
  exact phaseSlice_eq (sourceNode a) (sourceNode_nonneg a) w


/-- Each selected-node coefficient is the actual Gaussian integral of the
source radial phase against its normalized Hermite mode. -/
theorem source_coefficient_eq_integral (a : Address) (i : ℕ × ℕ) :
    coefficient (sourceNode a) i =
      ∫ w, conj (Grothe.UpperChaos.hfun i w) *
        Grothe.Haag.ph ((Real.sqrt (sourceNode a) : ℂ) +
          ((Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) *
            Grothe.UpperChaos.vprof (sourceNode a) : ℝ) : ℂ) * w) ∂gaussC := by
  rw [coefficient_eq_integral]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall fun w =>
    congrArg (fun z : ℂ => conj (Grothe.UpperChaos.hfun i w) * z)
      (source_phaseSlice_eq a w)

/-- The actual finite-mode energy is bounded by the exact source node mass,
without applying a numerical cap or restricting the sparse mode sets. -/
theorem source_weighted_energy_le_mass (modes : Address → Finset (ℕ × ℕ)) :
    (∑ a : Address, (sourceWeight a * Real.exp (-(sourceNode a))) *
      (∑ j ∈ modes a, ‖coefficient (sourceNode a) j‖ ^ 2)) ≤
      ∑ a : Address, sourceWeight a * Real.exp (-(sourceNode a)) := by
  have hw : ∀ a ∈ (Finset.univ : Finset Address),
      0 ≤ sourceWeight a * Real.exp (-(sourceNode a)) := by
    intro a _
    exact mul_nonneg (sourceWeight_pos a).le (Real.exp_pos _).le
  exact weighted_sum_sq_le_mass (Finset.univ : Finset Address)
    sourceNode (fun a => sourceWeight a * Real.exp (-(sourceNode a))) modes hw

/-- Any finite mode set at each source address has coupled weighted energy
below the checked node-mass cap. -/
theorem source_weighted_energy_lt (modes : Address → Finset (ℕ × ℕ)) :
    (∑ a : Address, (sourceWeight a * Real.exp (-(sourceNode a))) *
      (∑ j ∈ modes a, ‖coefficient (sourceNode a) j‖ ^ 2)) < 107 / 100 := by
  have hm : (∑ a : Address, sourceWeight a * Real.exp (-(sourceNode a))) < 107 / 100 := by
    simpa only [Fintype.sum_sigma] using source_mass_lt
  exact lt_of_le_of_lt (source_weighted_energy_le_mass modes) hm

/-- The same estimate in the original dependent panel-and-rule ordering.
This form can be consumed by a source-panel contraction without changing
the ordering or silently dropping any selected node. -/
theorem source_panel_energy_lt
    (modes : ∀ p : Fin sourcePanels.length,
      Fin (sourcePanels.get p).order → Finset (ℕ × ℕ)) :
    (∑ p : Fin sourcePanels.length, ∑ j : Fin (sourcePanels.get p).order,
      (sourceWeight ⟨p, j⟩ * Real.exp (-(sourceNode ⟨p, j⟩))) *
        (∑ k ∈ modes p j, ‖coefficient (sourceNode ⟨p, j⟩) k‖ ^ 2)) < 107 / 100 := by
  simpa only [Fintype.sum_sigma] using
    source_weighted_energy_lt (fun a => modes a.1 a.2)

/-- The actual finite-mode weighted energy is nonnegative. -/
theorem source_weighted_energy_nonneg (modes : Address → Finset (ℕ × ℕ)) :
    0 ≤ ∑ a : Address, (sourceWeight a * Real.exp (-(sourceNode a))) *
      (∑ j ∈ modes a, ‖coefficient (sourceNode a) j‖ ^ 2) := by
  apply Finset.sum_nonneg
  intro a _
  apply mul_nonneg (mul_nonneg (sourceWeight_pos a).le (Real.exp_pos _).le)
  apply Finset.sum_nonneg
  intro j _
  exact sq_nonneg _

/-- The square root of actual weighted finite-mode energy fits the node
norm budget independently of the separate smoothing-vector norm. -/
theorem source_weighted_energy_sqrt_lt (modes : Address → Finset (ℕ × ℕ)) :
    Real.sqrt (∑ a : Address, (sourceWeight a * Real.exp (-(sourceNode a))) *
      (∑ j ∈ modes a, ‖coefficient (sourceNode a) j‖ ^ 2)) < 26 / 25 :=
  Grothe.UpperChaos.Q0NodeMassLedgerSharp.sqrt_mass_lt_norm
    (source_weighted_energy_nonneg modes) (source_weighted_energy_lt modes)

end Grothe.UpperChaos.Q0GaussConditionalEnergy
