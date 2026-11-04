import Grothe.UpperChaos.Q0GaussPhysicalCheck

/-! Transfer already established normalized root and weight bounds to a
physical row. Identification of the quadrature rule is a separate step.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0GaussPhysicalCheck

open Grothe.UpperChaos.Q0LegendreInteger

/-- The row certificate needs only the lower bound and the formula-weight
upper bound; it does not require recomputing the interval certificate. -/
theorem actual_of_bounds (r : Row) (k : ℕ) (hrow : valid r = true)
    {x : ℝ} (hxlo : (r.normalizedLower : ℝ) ≤ x)
    (hweight : weight k x ≤ (r.normalizedUpperWeight : ℝ))
    (hinterior : |x| < 1) (hroot : (realPair x k).2 = 0) :
    (r.physicalLower : ℝ) / 10^9 ≤ panelNode r.lo r.hi x ∧
    0 < panelWeight r.lo r.hi k x ∧
    panelWeight r.lo r.hi k x ≤ (r.physicalUpperWeight : ℝ) / 10^12 := by
  have hc := valid_sound r hrow
  have hhalf : 0 ≤ ((r.hi : ℝ) - r.lo) / 2 := by linarith [hc.2.1]
  refine ⟨?_, panelWeight_pos_of_root k hc.2.1 hinterior hroot, ?_⟩
  · unfold panelNode
    have hmul := mul_le_mul_of_nonneg_left hxlo hhalf
    nlinarith [hc.2.2.1]
  · unfold panelWeight
    exact (mul_le_mul_of_nonneg_left hweight hhalf).trans hc.2.2.2

end Grothe.UpperChaos.Q0GaussPhysicalCheck
