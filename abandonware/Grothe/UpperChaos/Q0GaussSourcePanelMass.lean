import Grothe.UpperChaos.Q0GaussSmallOrderMass
import Grothe.UpperChaos.Q0GaussSelectedChoice
import Grothe.UpperChaos.Q0GaussProductionMass

/-!
# Exact mass of the actual source panels of Gauss order at most four

Agent-ID: codex-2ca4. Version 2 complete source draft; NOT COMPILED.

The SelectedRule adapter lives in this wrapper so the arithmetic core has no
selected-rule or physical-bounds dependency. Its original theorem name and
signature are preserved. The actual source theorem uses the original root
selection and physical weights. Applying the finite exceptional-panel order
scan discharges its sole extra premise for all exceptional panels.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.Q0GaussSmallOrderMass

open Q0GaussSelected

/-- Degree-zero exactness for any existing selected rule of order one to four. -/
theorem selected_rule_weight_sum (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 4)
    (rule : SelectedRule n) :
    (∑ i, Q0LegendreInteger.weight (n - 1) (rule.root i)) = 2 :=
  recurrence_weight_sum n hn rule.root rule.injective rule.isRoot

end Grothe.UpperChaos.Q0GaussSmallOrderMass

namespace Grothe.UpperChaos.Q0GaussSourcePanelMass

open Q0GaussSelectedChoice Q0LegendreInteger

/-- Normalization for the root family already chosen by the production source. -/
theorem selected_weight_sum (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 64) (hsmall : n ≤ 4) :
    (∑ i, Q0LegendreInteger.weight (n - 1) ((selectedFor n hn).root i)) = 2 :=
  Q0GaussSmallOrderMass.selected_rule_weight_sum n ⟨hn.1, hsmall⟩ (selectedFor n hn)

/-- The existing affine physical weights sum to the oriented panel length. -/
theorem selected_panel_weight_sum (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 64)
    (hsmall : n ≤ 4) (lo hi : ℝ) :
    (∑ i, panelWeight lo hi (n - 1) ((selectedFor n hn).root i)) = hi - lo := by
  simp only [panelWeight, ← Finset.mul_sum, selected_weight_sum n hn hsmall]
  ring

open Q0GaussAddressScan Q0GaussOrdinalEquiv Q0GaussProductionMass

private theorem source_panel_order_bounds (p : Fin sourcePanels.length) :
    1 ≤ (sourcePanels.get p).order ∧ (sourcePanels.get p).order ≤ 64 :=
  scan_member_order_bounds sourcePanels 0 21577 complete_scan
    (sourcePanels.get p) (List.get_mem sourcePanels p)

/-- Actual source-indexed panel normalization for every panel of order at most
four. The finite exceptional-panel order bound supplies the sole extra premise. -/
theorem source_panel_weight_sum (p : Fin sourcePanels.length)
    (hsmall : (sourcePanels.get p).order ≤ 4) :
    (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
      ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ) := by
  simpa only [sourceWeight, sourceRoot] using
    selected_panel_weight_sum (sourcePanels.get p).order (source_panel_order_bounds p)
      hsmall (sourcePanels.get p).lo (sourcePanels.get p).hi

end Grothe.UpperChaos.Q0GaussSourcePanelMass
