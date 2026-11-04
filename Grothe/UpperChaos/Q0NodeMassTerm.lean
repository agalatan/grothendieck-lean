import Grothe.UpperChaos.Q0NodeMassCheck
import Grothe.UpperChaos.Q0NodeMassMajorant

/-!
The integer row check implies a real bound on the rational exponential
majorant. The relation to actual nodes and weights remains separate.
Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0NodeMassCheck

theorem valid_real_bound (r : Row) (h : valid r = true) :
    ((r.weightUpper : ℝ) / 10^12) *
      (1 + ((r.nodeLower : ℝ) / 10^9) / 16)⁻¹ ^ 16 ≤
        (r.termUpper : ℝ) / 10^18 := by
  have hn : r.weightUpper * (16000000000 : ℕ)^16 * 1000000000000000000 ≤
      r.termUpper * 1000000000000 * (16000000000 + r.nodeLower)^16 :=
    of_decide_eq_true h
  have hreal : (r.weightUpper : ℝ) * (16000000000 : ℝ)^16 * 1000000000000000000 ≤
      (r.termUpper : ℝ) * 1000000000000 * (16000000000 + r.nodeLower)^16 := by
    exact_mod_cast hn
  have hb : 0 < (16000000000 : ℝ) + r.nodeLower := by positivity
  have hid : 1 + ((r.nodeLower : ℝ) / 10^9) / 16 =
      ((16000000000 : ℝ) + r.nodeLower) / 16000000000 := by ring
  have hratio : ((r.weightUpper : ℝ) / 10^12) *
      (1 + ((r.nodeLower : ℝ) / 10^9) / 16)⁻¹ ^ 16 =
      ((r.weightUpper : ℝ) * (16000000000 : ℝ)^16) /
        ((10^12 : ℝ) * ((16000000000 : ℝ) + r.nodeLower)^16) := by
    rw [hid, inv_div, div_pow]
    field_simp [ne_of_gt hb]
  rw [hratio]
  apply (div_le_div_iff₀ (by positivity) (by norm_num)).2
  convert hreal using 1 <;> ring

/-- A checked row bounds the actual weighted Gaussian factor, once its
node and weight enclosures have independently been proved. -/
theorem valid_weighted_node_bound (r : Row) (h : valid r = true)
    {s w : ℝ} (hnode : (r.nodeLower : ℝ) / 10^9 ≤ s)
    (hw : 0 ≤ w) (hweight : w ≤ (r.weightUpper : ℝ) / 10^12) :
    w * Real.exp (-s) ≤ (r.termUpper : ℝ) / 10^18 := by
  exact (Q0NodeMassMajorant.weighted_node_le (by positivity) hnode hw hweight).trans
    (valid_real_bound r h)

/-- Add all checked row bounds, retaining every list occurrence. -/
theorem sum_weighted_nodes_le (rows : List Row) (s w : Row → ℝ)
    (hvalid : ∀ r ∈ rows, valid r = true)
    (hnode : ∀ r ∈ rows, (r.nodeLower : ℝ) / 10^9 ≤ s r)
    (hw : ∀ r ∈ rows, 0 ≤ w r)
    (hweight : ∀ r ∈ rows, w r ≤ (r.weightUpper : ℝ) / 10^12) :
    (rows.map (fun r => w r * Real.exp (-(s r)))).sum ≤
      ((rows.map Row.termUpper).sum : ℝ) / 10^18 := by
  induction rows with
  | nil => simp
  | cons r rs ih =>
      have ht : w r * Real.exp (-(s r)) ≤ (r.termUpper : ℝ) / 10^18 :=
        valid_weighted_node_bound r (hvalid r (by simp))
          (hnode r (by simp)) (hw r (by simp)) (hweight r (by simp))
      have hs := ih
        (fun q hq => hvalid q (List.Mem.tail _ hq))
        (fun q hq => hnode q (List.Mem.tail _ hq))
        (fun q hq => hw q (List.Mem.tail _ hq))
        (fun q hq => hweight q (List.Mem.tail _ hq))
      simpa only [List.map_cons, List.sum_cons, Nat.cast_add, add_div] using add_le_add ht hs

end Grothe.UpperChaos.Q0NodeMassCheck
