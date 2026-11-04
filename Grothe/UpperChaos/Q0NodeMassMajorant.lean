import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Tactic

/-!
# Rational majorant for positive Gaussian node weights

The numerical pilot bounds each actual node weight times `exp (-s)` by a
rational expression in a lower node enclosure and an upper weight enclosure.
This module does not prove those enclosures or identify the physical nodes.
Agent-ID: codex-aa04.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.Q0NodeMassMajorant

/-- A positive Gaussian factor has a simple rational upper bound. -/
theorem exp_neg_le_majorant (x : ℝ) (hx : 0 ≤ x) :
    Real.exp (-x) ≤ (1 + x / 16)⁻¹ ^ 16 := by
  have hp : 0 < 1 + x / 16 := by positivity
  have he : (1 + x / 16) ^ 16 ≤ Real.exp x := by
    calc
      _ ≤ (Real.exp (x / 16)) ^ 16 := by
        apply pow_le_pow_left₀ hp.le
        simpa [add_comm] using Real.add_one_le_exp (x / 16)
      _ = Real.exp x := by
        rw [← Real.exp_nat_mul]
        congr 1
        ring
  rw [Real.exp_neg, inv_pow]
  exact (inv_le_inv₀ (Real.exp_pos x) (pow_pos hp _)).2 he

/-- Pointwise enclosure using a lower node and an upper positive weight. -/
theorem weighted_node_le {s w lower upper : ℝ}
    (hlower : 0 ≤ lower) (hnode : lower ≤ s)
    (hw : 0 ≤ w) (hweight : w ≤ upper) :
    w * Real.exp (-s) ≤ upper * (1 + lower / 16)⁻¹ ^ 16 := by
  have he : Real.exp (-s) ≤ (1 + lower / 16)⁻¹ ^ 16 :=
    (Real.exp_le_exp.mpr (neg_le_neg hnode)).trans (exp_neg_le_majorant lower hlower)
  have hup : 0 ≤ upper := hw.trans hweight
  exact mul_le_mul hweight he (Real.exp_pos _).le hup

/-- Sum the pointwise bounds without discarding node multiplicities. -/
theorem weighted_nodes_le {ι : Type*} (nodes : Finset ι)
    (s w lower upper : ι → ℝ)
    (hlower : ∀ i ∈ nodes, 0 ≤ lower i)
    (hnode : ∀ i ∈ nodes, lower i ≤ s i)
    (hw : ∀ i ∈ nodes, 0 ≤ w i)
    (hweight : ∀ i ∈ nodes, w i ≤ upper i) :
    ∑ i ∈ nodes, w i * Real.exp (-s i) ≤
      ∑ i ∈ nodes, upper i * (1 + lower i / 16)⁻¹ ^ 16 := by
  exact Finset.sum_le_sum fun i hi =>
    weighted_node_le (hlower i hi) (hnode i hi) (hw i hi) (hweight i hi)

end Grothe.UpperChaos.Q0NodeMassMajorant
