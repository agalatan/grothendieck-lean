import Grothe.UpperChaos.Q0GaussOrdinal
import Grothe.UpperChaos.Q0GaussActualRow
import Grothe.UpperChaos.Q0GaussMassAll

/-! The physical Gauss nodes and weights indexed by the saved ordinal ledger.
The source addresses and selected root formulas are explicit; identification
with the production quadrature rule and complete source schedule remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussNodeMass

open Grothe.UpperChaos.Q0GaussPhysicalCheck
open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0LegendreInteger

/-- The unique saved physical row bearing a given ordinal. -/
noncomputable def rowAt (i : Fin 21577) : Row :=
  Classical.choose (Grothe.UpperChaos.Q0GaussOrdinal.unique_row i i.isLt).exists

theorem rowAt_spec (i : Fin 21577) :
    rowAt i ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows ∧ (rowAt i).index = i :=
  Classical.choose_spec (Grothe.UpperChaos.Q0GaussOrdinal.unique_row i i.isLt).exists

theorem rowAt_eq (r : Row) (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows)
    (hi : r.index < 21577) : rowAt ⟨r.index, hi⟩ = r := by
  apply (Grothe.UpperChaos.Q0GaussOrdinal.unique_row r.index hi).unique
  · exact rowAt_spec ⟨r.index, hi⟩
  · exact ⟨hr, rfl⟩

theorem row_index_lt (r : Row) (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :
    r.index < 21577 := by
  have h : r.index ∈ List.range' 0 21577 := by
    rw [← Grothe.UpperChaos.Q0GaussOrdinal.indices]
    exact List.mem_map.mpr ⟨r, hr, rfl⟩
  simpa using h

/-- A saved row's source address. The lookups fix the panel uniquely. -/
structure Location (r : Row) where
  block : Array Panel
  panel : Panel
  block_lookup : panelBlocks[r.panel / 64]? = some block
  panel_lookup : block[r.panel % 64]? = some panel
  lo_eq : r.lo = panel.lo
  hi_eq : r.hi = panel.hi
  order_bounds : 1 ≤ panel.order ∧ panel.order ≤ 64
  rule_bound : r.rule < panel.order
  ordinal : r.index = panel.offset + r.rule

theorem location_exists (r : Row) (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :
    Nonempty (Location r) := by
  obtain ⟨block, panel, hb, hp, _, _, hlo, hhi, horderlo, horderhi, hrule, hindex⟩ :=
    Grothe.UpperChaos.Q0GaussAddressAll.each_source r hr
  exact ⟨⟨block, panel, hb, hp, hlo, hhi, ⟨horderlo, horderhi⟩, hrule, hindex⟩⟩

/-- The chosen location is pinned by the source's safe array lookups. -/
noncomputable def location (i : Fin 21577) : Location (rowAt i) :=
  Classical.choice (location_exists (rowAt i) (rowAt_spec i).1)

/-- Any other successful source lookup for the row selects this same panel. -/
theorem location_panel_eq (i : Fin 21577) (block : Array Panel) (p : Panel)
    (hb : panelBlocks[(rowAt i).panel / 64]? = some block)
    (hp : block[(rowAt i).panel % 64]? = some p) : (location i).panel = p := by
  have hblock : (location i).block = block := Option.some.inj ((location i).block_lookup.symm.trans hb)
  have hpanel := (location i).panel_lookup
  rw [hblock] at hpanel
  exact Option.some.inj (hpanel.symm.trans hp)

/-- The selected original rule root, not an independently chosen enclosure. -/
noncomputable def rootFin (i : Fin 21577) : ℝ :=
  (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor (location i).panel.order
    (location i).order_bounds).root ⟨(rowAt i).rule, (location i).rule_bound⟩

/-- The node and weight use the actual source panel and the same selected root. -/
noncomputable def nodeFin (i : Fin 21577) : ℝ :=
  panelNode (location i).panel.lo (location i).panel.hi (rootFin i)

noncomputable def weightFin (i : Fin 21577) : ℝ :=
  panelWeight (location i).panel.lo (location i).panel.hi
    ((location i).panel.order - 1) (rootFin i)

/-- The pointwise saved enclosures apply to the source formulas. -/
theorem physicalFin (i : Fin 21577) :
    ((rowAt i).physicalLower : ℝ) / 10^9 ≤ nodeFin i ∧
    0 < weightFin i ∧
    weightFin i ≤ ((rowAt i).physicalUpperWeight : ℝ) / 10^12 := by
  have h := Grothe.UpperChaos.Q0GaussActualRow.enclosures (rowAt i) (rowAt_spec i).1
    (location i).block (location i).panel (location i).block_lookup
    (location i).panel_lookup (location i).order_bounds (location i).rule_bound
  simpa only [nodeFin, weightFin, rootFin, (location i).lo_eq, (location i).hi_eq] using h

/-- Values beyond the saved ledger are zero and never appear in its sum. -/
noncomputable def node (i : ℕ) : ℝ :=
  if h : i < 21577 then nodeFin ⟨i, h⟩ else 0

noncomputable def weight (i : ℕ) : ℝ :=
  if h : i < 21577 then weightFin ⟨i, h⟩ else 0

theorem hphysical : ∀ r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows,
    (r.physicalLower : ℝ) / 10^9 ≤ node r.index ∧ 0 ≤ weight r.index ∧
    weight r.index ≤ (r.physicalUpperWeight : ℝ) / 10^12 := by
  intro r hr
  let hi := row_index_lt r hr
  have h := physicalFin ⟨r.index, hi⟩
  rw [rowAt_eq r hr hi] at h
  have hn : node r.index = nodeFin ⟨r.index, hi⟩ := by simp [node, hi]
  have hw : weight r.index = weightFin ⟨r.index, hi⟩ := by simp [weight, hi]
  rw [hn, hw]
  exact ⟨h.1, le_of_lt h.2.1, h.2.2⟩

/-- The saved mass bound for the explicitly selected source formulas. -/
theorem mass_lt : (Grothe.UpperChaos.Q0NodeMassAll.rows.map
    (fun r => weight r.index * Real.exp (-(node r.index)))).sum < 107 / 100 :=
  Grothe.UpperChaos.Q0GaussMassAll.mass_lt_of_physical node weight hphysical

end Grothe.UpperChaos.Q0GaussNodeMass
