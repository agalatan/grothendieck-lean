import Grothe.UpperChaos.Q0GaussMassBridge
import Grothe.UpperChaos.Q0GaussPhysicalAll

/-! Assemble the mass bound once actual physical row enclosures have been
proved. Production node identification remains separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussMassAll

open Grothe.UpperChaos.Q0GaussPhysicalCheck

/-- Actual enclosures for every saved physical row imply the full checked
ledger mass bound. -/
theorem mass_lt_of_physical (s w : ℕ → ℝ)
    (hphysical : ∀ r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows,
      (r.physicalLower : ℝ) / 10^9 ≤ s r.index ∧ 0 ≤ w r.index ∧
      w r.index ≤ (r.physicalUpperWeight : ℝ) / 10^12) :
    (Grothe.UpperChaos.Q0NodeMassAll.rows.map
      (fun r => w r.index * Real.exp (-(s r.index)))).sum < 107 / 100 := by
  have h := Grothe.UpperChaos.Q0GaussMassBridge.sum_bound_of_projection
    Grothe.UpperChaos.Q0GaussPhysicalAll.rows Grothe.UpperChaos.Q0NodeMassAll.rows
    Grothe.UpperChaos.Q0GaussPhysicalAll.projection s w hphysical
    Grothe.UpperChaos.Q0NodeMassAll.each_valid
  have hcap : (((Grothe.UpperChaos.Q0NodeMassAll.rows.map
      Grothe.UpperChaos.Q0NodeMassCheck.Row.termUpper).sum : ℕ) : ℝ) / 10^18 < 107 / 100 := by
    rw [Grothe.UpperChaos.Q0NodeMassAll.total]
    norm_num
  exact lt_of_le_of_lt h hcap

end Grothe.UpperChaos.Q0GaussMassAll
