import Grothe.UpperChaos.Q0GaussPhysical

/-! Exact rational checks for transporting a normalized bracket and weight
upper bound to one physical quadrature candidate. The connection to the
original mathematical Gauss rule remains separate. Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0GaussPhysicalCheck

structure Row where
  index : ℕ
  panel : ℕ
  rule : ℕ
  lo : ℚ
  hi : ℚ
  normalizedLower : ℚ
  normalizedUpperWeight : ℚ
  physicalLower : ℕ
  physicalUpperWeight : ℕ
  deriving DecidableEq

def valid (r : Row) : Bool :=
  decide (0 ≤ r.lo ∧ r.lo < r.hi ∧
    (r.physicalLower : ℚ) / 10^9 ≤ r.lo + (r.hi - r.lo) / 2 * (1 + r.normalizedLower) ∧
    (r.hi - r.lo) / 2 * r.normalizedUpperWeight ≤ (r.physicalUpperWeight : ℚ) / 10^12)

theorem valid_sound (r : Row) (h : valid r = true) :
    (0 : ℝ) ≤ r.lo ∧ (r.lo : ℝ) < r.hi ∧
    (r.physicalLower : ℝ) / 10^9 ≤ (r.lo : ℝ) + ((r.hi : ℝ) - r.lo) / 2 * (1 + (r.normalizedLower : ℝ)) ∧
    ((r.hi : ℝ) - r.lo) / 2 * (r.normalizedUpperWeight : ℝ) ≤ (r.physicalUpperWeight : ℝ) / 10^12 := by
  have hc : 0 ≤ r.lo ∧ r.lo < r.hi ∧
      (r.physicalLower : ℚ) / 10^9 ≤ r.lo + (r.hi - r.lo) / 2 * (1 + r.normalizedLower) ∧
      (r.hi - r.lo) / 2 * r.normalizedUpperWeight ≤ (r.physicalUpperWeight : ℚ) / 10^12 :=
    of_decide_eq_true h
  have hnode : (((r.physicalLower : ℚ) / 10^9 : ℚ) : ℝ) ≤
      ((r.lo + (r.hi - r.lo) / 2 * (1 + r.normalizedLower) : ℚ) : ℝ) := by
    exact_mod_cast hc.2.2.1
  have hweight : (((r.hi - r.lo) / 2 * r.normalizedUpperWeight : ℚ) : ℝ) ≤
      (((r.physicalUpperWeight : ℚ) / 10^12 : ℚ) : ℝ) := by
    exact_mod_cast hc.2.2.2
  push_cast at hnode hweight
  exact ⟨by exact_mod_cast hc.1, by exact_mod_cast hc.2.1, hnode, hweight⟩

/-- A checked row plus the independently checked normalized root/weight
certificates gives a physical node lower bound and a positive weight upper
bound. Identifying this formula with the actual Gauss rule is separate. -/
theorem actual_of_checks (r : Row) (k : ℕ) (I : LeanCert.Core.IntervalDyadic)
    (hrow : valid r = true) (hlo : I.lo.toRat = r.normalizedLower)
    (hweight : Grothe.UpperChaos.Q0LegendreInteger.weightCheck k I r.normalizedUpperWeight = true)
    {x : ℝ} (hx : x ∈ I) (hinterior : |x| < 1)
    (hroot : (Grothe.UpperChaos.Q0LegendreInteger.realPair x k).2 = 0) :
    (r.physicalLower : ℝ) / 10^9 ≤
      Grothe.UpperChaos.Q0LegendreInteger.panelNode r.lo r.hi x ∧
    0 < Grothe.UpperChaos.Q0LegendreInteger.panelWeight r.lo r.hi k x ∧
    Grothe.UpperChaos.Q0LegendreInteger.panelWeight r.lo r.hi k x ≤
      (r.physicalUpperWeight : ℝ) / 10^12 := by
  have hc := valid_sound r hrow
  have hpanel : (r.lo : ℝ) ≤ r.hi := hc.2.1.le
  refine ⟨?_, ?_, ?_⟩
  · apply Grothe.UpperChaos.Q0LegendreInteger.panelNode_lower hpanel hx
    simpa [hlo] using hc.2.2.1
  · exact Grothe.UpperChaos.Q0LegendreInteger.panelWeight_pos_of_root k hc.2.1 hinterior hroot
  · exact Grothe.UpperChaos.Q0LegendreInteger.panelWeight_le_of_check k I r.normalizedUpperWeight
      hpanel hx hweight hc.2.2.2

end Grothe.UpperChaos.Q0GaussPhysicalCheck
