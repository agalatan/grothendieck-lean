import Grothe.UpperChaos.Q0GaussMassReindex
import Grothe.UpperChaos.Q0NodeMassLedgerSharp

/-! Source panel/rule form of the selected-node mass calculation. The
identification with mathematical Gauss quadrature remains separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussProductionMass

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussNodeMass
open Grothe.UpperChaos.Q0LegendreInteger

/-- The panel chosen for an ordinal equals its panel in the source-address
equivalence. -/
theorem panel_eq (i : Fin 21577) :
    (location i).panel = sourcePanels.get (toAddress i).1 := by
  have hl := Grothe.UpperChaos.Q0GaussPanelFlatten.source_lookup (rowAt i).panel
    (location i).block (location i).panel (location i).block_lookup (location i).panel_lookup
  rw [(toAddress_spec i).1] at hl
  have h := (List.getElem?_eq_some_iff.mp hl).choose_spec
  exact h.symm

/-- The rule coordinate in the source-address equivalence is the ledger
row's actual rule index. -/
theorem rule_eq (i : Fin 21577) :
    (rowAt i).rule = (toAddress i).2.val := (toAddress_spec i).2.1

/-- The mathematical source-address formula uses the same selected root
family for the node and weight. -/
noncomputable def sourceRoot (a : Address) : ℝ :=
  (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor
    (sourcePanels.get a.1).order (source_order_bounds a)).root a.2

noncomputable def sourceNode (a : Address) : ℝ :=
  panelNode (sourcePanels.get a.1).lo (sourcePanels.get a.1).hi (sourceRoot a)

noncomputable def sourceWeight (a : Address) : ℝ :=
  panelWeight (sourcePanels.get a.1).lo (sourcePanels.get a.1).hi
    ((sourcePanels.get a.1).order - 1) (sourceRoot a)


/-- Equal source orders and rule indices select the same recurrence root. -/
theorem selected_root_congr {n m : ℕ} (h : n = m)
    (hn : 1 ≤ n ∧ n ≤ 64) (hm : 1 ≤ m ∧ m ≤ 64)
    (j : Fin n) (k : Fin m) (hjk : j.val = k.val) :
    (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor n hn).root j =
      (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor m hm).root k := by
  subst m
  have hi : j = k := Fin.ext hjk
  subst k
  rfl

/-- The source address selects exactly the root chosen at its ordinal. -/
theorem root_eq (i : Fin 21577) : rootFin i = sourceRoot (toAddress i) := by
  unfold rootFin sourceRoot
  exact selected_root_congr (congrArg (fun p => p.order) (panel_eq i))
    (location i).order_bounds (source_order_bounds (toAddress i))
    ⟨(rowAt i).rule, (location i).rule_bound⟩ (toAddress i).2 (rule_eq i)

theorem nodeFin_eq (i : Fin 21577) : nodeFin i = sourceNode (toAddress i) := by
  unfold nodeFin sourceNode
  rw [panel_eq i, root_eq i]

theorem weightFin_eq (i : Fin 21577) : weightFin i = sourceWeight (toAddress i) := by
  unfold weightFin sourceWeight
  rw [panel_eq i, root_eq i]

/-- Every original source panel has strictly increasing endpoints. -/
theorem source_panel_lt (p : Fin sourcePanels.length) :
    ((sourcePanels.get p).lo : ℝ) < (sourcePanels.get p).hi := by
  have hb := scan_member_order_bounds sourcePanels 0 21577 complete_scan
    (sourcePanels.get p) (List.get_mem sourcePanels p)
  let a : Address := ⟨p, ⟨0, by omega⟩⟩
  have hv := Grothe.UpperChaos.Q0GaussPhysicalCheck.valid_sound
    (rowAt (fromAddress a))
    (Grothe.UpperChaos.Q0GaussPhysicalAll.each_valid _ (rowAt_spec _).1)
  simpa only [(location (fromAddress a)).lo_eq,
    (location (fromAddress a)).hi_eq, panel_eq (fromAddress a), to_from] using hv.2.1

/-- Every original source panel starts at a nonnegative radial coordinate. -/
theorem source_panel_nonneg (p : Fin sourcePanels.length) :
    0 ≤ ((sourcePanels.get p).lo : ℝ) := by
  have hb := scan_member_order_bounds sourcePanels 0 21577 complete_scan
    (sourcePanels.get p) (List.get_mem sourcePanels p)
  let a : Address := ⟨p, ⟨0, by omega⟩⟩
  have hv := Grothe.UpperChaos.Q0GaussPhysicalCheck.valid_sound
    (rowAt (fromAddress a))
    (Grothe.UpperChaos.Q0GaussPhysicalAll.each_valid _ (rowAt_spec _).1)
  simpa only [(location (fromAddress a)).lo_eq,
    panel_eq (fromAddress a), to_from] using hv.1

/-- Every selected physical node lies inside its own original source panel. -/
theorem source_node_mem_panel (a : Address) :
    sourceNode a ∈ Set.Icc ((sourcePanels.get a.1).lo : ℝ)
      ((sourcePanels.get a.1).hi : ℝ) := by
  have hp := source_panel_lt a.1
  have hr : |sourceRoot a| < 1 :=
    (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor
      (sourcePanels.get a.1).order (source_order_bounds a)).interior a.2
  have hx := abs_lt.mp hr
  have hw : 0 ≤ (((sourcePanels.get a.1).hi : ℝ) -
      (sourcePanels.get a.1).lo) / 2 := by linarith
  have hleft := mul_nonneg hw (show 0 ≤ 1 + sourceRoot a by linarith)
  have hright := mul_nonneg hw (show 0 ≤ 1 - sourceRoot a by linarith)
  change ((sourcePanels.get a.1).lo : ℝ) ≤ sourceNode a ∧
    sourceNode a ≤ ((sourcePanels.get a.1).hi : ℝ)
  unfold sourceNode panelNode
  constructor <;> nlinarith [hleft, hright]

/-- Selected recurrence roots lie strictly inside their physical panels. -/
theorem source_node_mem_open_panel (a : Address) :
    sourceNode a ∈ Set.Ioo ((sourcePanels.get a.1).lo : ℝ)
      ((sourcePanels.get a.1).hi : ℝ) := by
  have hp := source_panel_lt a.1
  have hr : |sourceRoot a| < 1 :=
    (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor
      (sourcePanels.get a.1).order (source_order_bounds a)).interior a.2
  have hx := abs_lt.mp hr
  have hw : 0 < (((sourcePanels.get a.1).hi : ℝ) -
      (sourcePanels.get a.1).lo) / 2 := by linarith
  have hleft := mul_pos hw (show 0 < 1 + sourceRoot a by linarith)
  have hright := mul_pos hw (show 0 < 1 - sourceRoot a by linarith)
  change ((sourcePanels.get a.1).lo : ℝ) < sourceNode a ∧
    sourceNode a < ((sourcePanels.get a.1).hi : ℝ)
  unfold sourceNode panelNode
  constructor <;> nlinarith [hleft, hright]

/-- Every actual retained-panel node has strictly positive radius. -/
theorem sourceNode_pos (a : Address) : 0 < sourceNode a :=
  lt_of_le_of_lt (source_panel_nonneg a.1) (source_node_mem_open_panel a).1


/-- The source node is nonnegative, so the fixed-radius F0 phase slice has
its intended original radial-profile form. -/
theorem sourceNode_nonneg (a : Address) : 0 ≤ sourceNode a := by
  have h := (physicalFin (fromAddress a)).1
  have hn : 0 ≤ nodeFin (fromAddress a) := le_trans (by positivity) h
  rw [nodeFin_eq] at hn
  simpa only [to_from] using hn

theorem node_at (a : Address) : node (fromAddress a).val = sourceNode a := by
  have h := nodeFin_eq (fromAddress a)
  simpa [node, (fromAddress a).isLt, to_from a] using h

theorem weight_at (a : Address) : Q0GaussNodeMass.weight (fromAddress a).val = sourceWeight a := by
  have h := weightFin_eq (fromAddress a)
  simpa [Q0GaussNodeMass.weight, (fromAddress a).isLt, to_from a] using h

set_option maxRecDepth 8192 in
/-- The original source panel/rule family satisfies the checked finite mass
bound when evaluated at its selected recurrence roots. -/
theorem source_mass_lt :
    (∑ p : Fin sourcePanels.length, ∑ j : Fin (sourcePanels.get p).order,
      sourceWeight ⟨p, j⟩ * Real.exp (-(sourceNode ⟨p, j⟩))) < 107 / 100 := by
  have h := Grothe.UpperChaos.Q0GaussNodeMass.mass_lt
  rw [Grothe.UpperChaos.Q0GaussMassReindex.ledger_sum_eq_source_sum] at h
  change (∑ p : Fin sourcePanels.length, ∑ j : Fin (sourcePanels.get p).order,
    Q0GaussNodeMass.weight (fromAddress ⟨p, j⟩).val * Real.exp (-(node (fromAddress ⟨p, j⟩).val))) < 107 / 100 at h
  simpa only [weight_at, node_at] using h


/-- Every source formula weight is positive. -/
theorem sourceWeight_pos (a : Address) : 0 < sourceWeight a := by
  rw [← weight_at a]
  have hw : Q0GaussNodeMass.weight (fromAddress a).val = weightFin (fromAddress a) := by
    simp [Q0GaussNodeMass.weight, (fromAddress a).isLt]
  rw [hw]
  exact (physicalFin (fromAddress a)).2.1

/-- The source quadrature mass is nonnegative. -/
theorem source_mass_nonneg :
    0 ≤ ∑ p : Fin sourcePanels.length, ∑ j : Fin (sourcePanels.get p).order,
      sourceWeight ⟨p, j⟩ * Real.exp (-(sourceNode ⟨p, j⟩)) := by
  apply Finset.sum_nonneg
  intro p _
  apply Finset.sum_nonneg
  intro j _
  exact mul_nonneg (sourceWeight_pos ⟨p, j⟩).le (Real.exp_pos _).le

/-- The source node-mass norm fits the sharp rational ledger. -/
theorem source_mass_sqrt_lt :
    Real.sqrt (∑ p : Fin sourcePanels.length, ∑ j : Fin (sourcePanels.get p).order,
      sourceWeight ⟨p, j⟩ * Real.exp (-(sourceNode ⟨p, j⟩))) < 26 / 25 :=
  Grothe.UpperChaos.Q0NodeMassLedgerSharp.sqrt_mass_lt_norm source_mass_nonneg source_mass_lt

end Grothe.UpperChaos.Q0GaussProductionMass
