import Grothe.UpperChaos.Q0GaussPhysicalAll
import Grothe.UpperChaos.Q0OrdinalCoverage

/-! Physical-row ordinals inherit the ledger's complete range. Source-panel
address uniqueness and production Gauss-node identity are separate steps.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussOrdinal

open Grothe.UpperChaos.Q0GaussPhysicalCheck

theorem indices : Grothe.UpperChaos.Q0GaussPhysicalAll.rows.map Row.index =
    List.range' 0 21577 := by
  have hp := congrArg (List.map (fun p => p.1))
    Grothe.UpperChaos.Q0GaussPhysicalAll.projection
  have h : Grothe.UpperChaos.Q0GaussPhysicalAll.rows.map Row.index =
      Grothe.UpperChaos.Q0NodeMassAll.rows.map Grothe.UpperChaos.Q0NodeMassCheck.Row.index := by
    simp only [List.map_map] at hp
    change Grothe.UpperChaos.Q0GaussPhysicalAll.rows.map (fun r => r.index) =
      Grothe.UpperChaos.Q0NodeMassAll.rows.map (fun r => r.index) at hp
    exact hp
  exact h.trans Grothe.UpperChaos.Q0NodeMassAll.indices

theorem unique_row (i : ℕ) (hi : i < 21577) :
    ∃! r : Row, r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows ∧ r.index = i :=
  Grothe.UpperChaos.Q0OrdinalCoverage.exists_unique_of_map_range Row.index
    Grothe.UpperChaos.Q0GaussPhysicalAll.rows 21577 indices i hi

end Grothe.UpperChaos.Q0GaussOrdinal
