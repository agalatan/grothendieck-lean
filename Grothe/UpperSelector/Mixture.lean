import Grothe.UpperSelector.Aggregation
import Grothe.UpperSixExact.VariableCutoff

/-! # Mixed interval heads with full Wiener error allowances -/

open Finset HaagerupKernel
open Haagerup.Statement

set_option warningAsError true

namespace Haagerup.AngularSelector

/-- Combining rigorous interval heads with individual full-series errors permits both signed
head cancellation and a single debit for the selector's all-coefficient approximation. -/
theorem transfer_of_approximate_heads {k N : ℕ} {w : Fin k → ℚ}
    {h a : Fin k → ℕ → ℝ} {headI : Fin k → List Ival} {e : Fin k → ℝ}
    {c b : ℚ} {δ : ℝ}
    (hw : ∀ i, 0 ≤ (w i : ℝ)) (hw1 : ∑ i, (w i : ℝ) = 1)
    (hs : ∀ i, Summable fun n => |h i n|) (hd : ∀ i, DominatedKernel (radialKernel (h i)))
    (hlen : ∀ i, (headI i).length ≤ N + 1)
    (hm : ∀ i n, n < (headI i).length → mem (a i n) ((headI i).getD n zeroI))
    (he : ∀ i, WienerBound (fun n => h i n - (if n < (headI i).length then a i n else 0)) (e i))
    (hb : absSum (addL (sumL ((List.finRange k).map fun i =>
      (headI i).map (mulI (ofRatI (w i))))) [negI (ofRatI c)]) ≤ ofRatLo b)
    (hδ : (b : ℝ) + ∑ i, (w i : ℝ) * e i ≤ δ) (hpos : δ < (c : ℝ)) :
    IsBound (1 / ((c : ℝ) - δ)) := by
  let G (i : Fin k) (n : ℕ) := if n < (headI i).length then a i n else 0
  let r (n : ℕ) := (∑ i, (w i : ℝ) * G i n) - if n = 0 then (c : ℝ) else 0
  have head : ∑ n ∈ range (N + 1), |r n| ≤ (b : ℝ) := variable_interval_head hm hb
  have hz (n : ℕ) (hn : n ∉ range (N + 1)) : |r n| = 0 := by
    have hge : N + 1 ≤ n := Nat.le_of_not_gt fun lt => hn (mem_range.mpr lt)
    have hno (i : Fin k) : ¬ n < (headI i).length := not_lt.mpr ((hlen i).trans hge)
    simp [r, G, hno, show n ≠ 0 by omega]
  have hr : WienerBound r (b : ℝ) := ⟨summable_of_ne_finset_zero hz, by rwa [tsum_eq_sum hz]⟩
  have hei := weightedMix_approximation (fun i => (w i : ℝ)) hw he
  have ht (n) : r n + ((∑ i, ↑(w i) * h i n) - ∑ i, ↑(w i) * G i n) =
      (∑ i, ↑(w i) * h i n) - (if n = 0 then (c : ℝ) else 0) := by dsimp [r]; ring
  have hv : WienerBound (fun n => (∑ i, (w i : ℝ) * h i n) - (if n = 0 then (c : ℝ) else 0))
      ((b : ℝ) + ∑ i, (w i : ℝ) * e i) := by
    have hsum := hr.add hei
    change WienerBound (fun n => r n + ((∑ i, ↑(w i) * h i n) - ∑ i, ↑(w i) * G i n)) _ at hsum
    simpa only [ht] using hsum
  apply transfer _ (summable_convex_comb (fun i => (w i : ℝ)) hs) _ hpos
  · have hbnd := hv.2.trans hδ
    rw [hv.1.tsum_eq_zero_add] at hbnd
    simpa using hbnd
  · exact dominatedKernel_congr_ball (dominatedKernel_convex_comb hw hw1 hd)
      fun z hz => (radialKernel_convex_comb (fun i => (w i : ℝ)) hs hz).symm

/-- An exact enclosure of an old head incurs precisely the existing omitted tail allowance. -/
theorem exactHead_error (h : ℕ → ℝ) (N : ℕ) (e : ℝ) (hs : Summable fun n => |h n|)
    (ht : ∑' n, |h (n + N)| ≤ e) :
    WienerBound (fun n => h n - (if n < N then h n else 0)) e := by
  have herr : WienerBound (fun n => h n - h n) 0 := by simp [WienerBound]
  have tail : WienerBound (fun n => h (n + N)) e := ⟨(summable_nat_add_iff N).mpr hs, ht⟩
  simpa using wienerBound_truncateHead N herr tail

end Haagerup.AngularSelector
