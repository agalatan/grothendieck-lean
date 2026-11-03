import Grothe.UpperChaos.Q0LegendreWeightCert

/-! Affine transport of checked normalized Legendre brackets and weight
bounds to a physical panel. Gauss-rule identity is a separate theorem.
Agent-ID: codex-aa04. -/

open LeanCert.Core

namespace Grothe.UpperChaos.Q0LegendreInteger

/-- Exact integer brackets and their rational interval have the same real
members, including their endpoints. -/
theorem mem_rational_interval_of_integer_bracket (lo hi D : ℤ)
    (hle : (lo : ℚ) / D ≤ (hi : ℚ) / D) {x : ℝ}
    (hx : x ∈ Set.Icc ((lo : ℝ) / D) ((hi : ℝ) / D)) :
    x ∈ (⟨(lo : ℚ) / D, (hi : ℚ) / D, hle⟩ : IntervalRat) := by
  simpa only [IntervalRat.mem_def, Set.mem_Icc, Rat.cast_div, Rat.cast_intCast] using hx

noncomputable def panelNode (lo hi x : ℝ) : ℝ := lo + ((hi - lo) / 2) * (1 + x)

noncomputable def panelWeight (lo hi : ℝ) (k : ℕ) (x : ℝ) : ℝ :=
  ((hi - lo) / 2) * weight k x

/-- A normalized bracket lower endpoint supplies a physical node lower bound. -/
theorem panelNode_lower {lo hi lower x : ℝ} {I : IntervalDyadic}
    (hpanel : lo ≤ hi) (hx : x ∈ I)
    (hlower : lower ≤ lo + ((hi - lo) / 2) * (1 + (I.lo.toRat : ℝ))) :
    lower ≤ panelNode lo hi x := by
  have hxlo : (I.lo.toRat : ℝ) ≤ x := hx.1
  have hhalf : 0 ≤ (hi - lo) / 2 := by linarith
  unfold panelNode
  nlinarith

/-- A checked normalized weight upper bound transports to a physical panel. -/
theorem panelWeight_le_of_check (k : ℕ) (I : IntervalDyadic) (upper : ℚ)
    {lo hi x physicalUpper : ℝ} (hpanel : lo ≤ hi) (hx : x ∈ I)
    (hcheck : weightCheck k I upper = true)
    (hupper : ((hi - lo) / 2) * (upper : ℝ) ≤ physicalUpper) :
    panelWeight lo hi k x ≤ physicalUpper := by
  have hhalf : 0 ≤ (hi - lo) / 2 := by linarith
  exact (mul_le_mul_of_nonneg_left (weightCheck_sound k I upper hcheck hx) hhalf).trans hupper

/-- At an interior root on a nondegenerate panel, the formula is positive. -/
theorem panelWeight_pos_of_root (k : ℕ) {lo hi x : ℝ} (hpanel : lo < hi)
    (hx : |x| < 1) (hroot : (realPair x k).2 = 0) : 0 < panelWeight lo hi k x := by
  unfold panelWeight
  exact mul_pos (by linarith) (weight_pos_of_root k x hx hroot)

end Grothe.UpperChaos.Q0LegendreInteger
