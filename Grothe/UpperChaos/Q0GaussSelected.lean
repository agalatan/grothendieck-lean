import Grothe.UpperChaos.Q0GaussPhysicalBounds

/-! Generic physical-panel bridge for one common Fin-indexed selected root
family. Construction from the original checked brackets is a separate step.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelected

open Grothe.UpperChaos.Q0GaussPhysicalCheck
open Grothe.UpperChaos.Q0LegendreInteger

structure SelectedRule (n : ℕ) where
  root : Fin n → ℝ
  lower : Fin n → ℚ
  upper : Fin n → ℚ
  interior : ∀ i, |root i| < 1
  isRoot : ∀ i, (realPair (root i) (n - 1)).2 = 0
  lower_le : ∀ i, (lower i : ℝ) ≤ root i
  weight_le : ∀ i, weight (n - 1) (root i) ≤ (upper i : ℝ)
  injective : Function.Injective root

/-- Transfer a checked row to the same selected root used by the finite
Gauss rule, given a proved match to that row's normalized context. -/
theorem physical_of_selected (n : ℕ) (rule : SelectedRule n) (i : Fin n) (r : Row)
    (hrow : valid r = true) (hlo : r.normalizedLower = rule.lower i)
    (hup : r.normalizedUpperWeight = rule.upper i) :
    (r.physicalLower : ℝ) / 10^9 ≤ panelNode r.lo r.hi (rule.root i) ∧
    0 < panelWeight r.lo r.hi (n - 1) (rule.root i) ∧
    panelWeight r.lo r.hi (n - 1) (rule.root i) ≤ (r.physicalUpperWeight : ℝ) / 10^12 := by
  apply actual_of_bounds r (n - 1) hrow
  · simpa only [hlo] using rule.lower_le i
  · simpa only [hup] using rule.weight_le i
  · exact rule.interior i
  · exact rule.isRoot i


/-- If the row and selected rule are both identified with the same safe
lookup result, the checked physical bounds hold for that selected root. -/
theorem physical_of_matching_lookup (n : ℕ) (rule : SelectedRule n) (i : Fin n)
    (r : Row) (hrow : valid r = true) (context : Option (ℚ × ℚ))
    (hrowContext : context = some (r.normalizedLower, r.normalizedUpperWeight))
    (hruleContext : context = some (rule.lower i, rule.upper i)) :
    (r.physicalLower : ℝ) / 10^9 ≤ panelNode r.lo r.hi (rule.root i) ∧
    0 < panelWeight r.lo r.hi (n - 1) (rule.root i) ∧
    panelWeight r.lo r.hi (n - 1) (rule.root i) ≤ (r.physicalUpperWeight : ℝ) / 10^12 := by
  have h := Option.some.inj (hrowContext.symm.trans hruleContext)
  exact physical_of_selected n rule i r hrow (congrArg Prod.fst h) (congrArg Prod.snd h)

end Grothe.UpperChaos.Q0GaussSelected
