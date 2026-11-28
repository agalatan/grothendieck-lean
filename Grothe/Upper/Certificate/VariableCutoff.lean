import Grothe.Upper.Rounding.Transfer

set_option warningAsError true

/-!
# Convex transfer with a separate head length for each channel

The interval lists enclose the coefficients up to each channel's first omitted index.
The omitted coefficients can contribute throughout the longer channels' heads.
Their entire contribution fits in the sum of the weighted absolute tail budgets.

Agent-ID: codex-a7c4
-/

namespace Grothe.Upper

open Finset Polynomial Grothe.Upper.Optima Grothe.Upper.Kernel

noncomputable section

private theorem clippedTailSum (h : ℕ → ℝ) (hs : Summable fun n => |h n|) (m : ℕ) :
    Summable (fun n => if n < m then (0 : ℝ) else |h n|) ∧
      (∑' n, if n < m then (0 : ℝ) else |h n|) = ∑' n, |h (n + m)| := by
  have ht : Summable (fun n => if n < m then (0 : ℝ) else |h n|) :=
    Summable.of_nonneg_of_le (fun n => by split <;> positivity)
      (fun n => by split <;> simp [abs_nonneg]) hs
  refine ⟨ht, ?_⟩
  have hz : ∑ n ∈ range m, (if n < m then (0 : ℝ) else |h n|) = 0 :=
    sum_eq_zero fun n hn => by simp [mem_range.mp hn]
  rw [← ht.sum_add_tsum_nat_add m, hz, zero_add]
  exact tsum_congr fun n => by simp

/-- Bound the full signed residual using the zero-padded channel heads and one tail per channel.
`N + 1` includes the target linear coefficient even when all the heads are empty. -/
theorem residual_of_channel_cutoffs {k N : ℕ} {w : Fin k → ℝ} {h : Fin k → ℕ → ℝ}
    {cut : Fin k → ℕ} {tl : Fin k → ℝ} {c head : ℝ}
    (hw : ∀ p, 0 ≤ w p) (hs : ∀ p, Summable fun n => |h p n|)
    (hcut : ∀ p, cut p ≤ N + 1)
    (ht : ∀ p, ∑' n, |h p (n + cut p)| ≤ tl p)
    (hh : ∑ n ∈ range (N + 1),
      |(∑ p, w p * (if n < cut p then h p n else 0)) - (if n = 0 then c else 0)| ≤ head) :
    |(∑ p, w p * h p 0) - c| + (∑' n, |∑ p, w p * h p (n + 1)|)
      ≤ head + ∑ p, w p * tl p := by
  let G (n : ℕ) := (∑ p, w p * (if n < cut p then h p n else 0)) - (if n = 0 then c else 0)
  let E (p : Fin k) (n : ℕ) := if n < cut p then (0 : ℝ) else |h p n|
  have hG0 (n : ℕ) (hn : n ∉ range (N + 1)) : |G n| = 0 := by
    have hge := Nat.le_of_not_gt (fun h => hn (mem_range.mpr h))
    have hno (p : Fin k) : ¬ n < cut p := not_lt.mpr ((hcut p).trans hge)
    have hn0 : n ≠ 0 := by omega
    simp [G, hno, hn0]
  have hGs : Summable fun n => |G n| := summable_of_ne_finset_zero hG0
  have hes (p : Fin k) : Summable (E p) := (clippedTailSum (h p) (hs p) (cut p)).1
  have hws := summable_sum (s := univ) fun p (_ : p ∈ univ) => (hes p).mul_left (w p)
  have hp (n : ℕ) : |(∑ p, w p * h p n) - (if n = 0 then c else 0)| ≤
      |G n| + ∑ p, w p * E p n := by
    let r (p : Fin k) := if n < cut p then (0 : ℝ) else h p n
    have splitSum : (∑ p, w p * h p n) - (if n = 0 then c else 0) =
        G n + ∑ p, w p * r p := by
      dsimp only [G]
      have he (p : Fin k) : w p * h p n =
          w p * (if n < cut p then h p n else 0) + w p * r p := by
        by_cases hn : n < cut p <;> simp [r, hn]
      simp_rw [he]
      rw [sum_add_distrib]
      ring
    rw [splitSum]
    refine (abs_add_le _ _).trans (add_le_add le_rfl ((abs_sum_le_sum_abs _ _).trans ?_))
    exact le_of_eq (sum_congr rfl fun p _ => by
      by_cases hn : n < cut p <;> simp [r, E, hn, abs_mul, abs_of_nonneg (hw p)])
  have hsum := Summable.of_nonneg_of_le (fun _ => abs_nonneg _) hp (hGs.add hws)
  have hcomp := hsum.tsum_le_tsum hp (hGs.add hws)
  rw [hGs.tsum_add hws, (tsum_eq_sum hG0), Summable.tsum_finsetSum
    (fun p (_ : p ∈ univ) => (hes p).mul_left (w p))] at hcomp
  have htail : (∑ p, ∑' n, w p * E p n) ≤ ∑ p, w p * tl p := by
    refine sum_le_sum fun p _ => ?_
    rw [tsum_mul_left]
    exact mul_le_mul_of_nonneg_left ((clippedTailSum (h p) (hs p) (cut p)).2.le.trans (ht p)) (hw p)
  have htotal := hcomp.trans (add_le_add hh htail)
  rw [hsum.tsum_eq_zero_add] at htotal
  simpa using htotal

/-- An interval check bounds the zero-padded, weighted head even when exact coefficients
of some channels are obtained by a separate full-series approximation. -/
theorem variable_interval_head {k N : ℕ} {wQ : Fin k → ℚ} {h : Fin k → ℕ → ℝ}
    {headI : Fin k → List Ival} {cQ headCapQ : ℚ}
    (hmem : ∀ p n, n < (headI p).length → mem (h p n) ((headI p).getD n zeroI))
    (hhead : absSum (addL (sumL ((List.finRange k).map fun p =>
        (headI p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI cQ)]) ≤ ofRatLo headCapQ) :
    ∑ n ∈ range (N + 1), |(∑ p, (wQ p : ℝ) * (if n < (headI p).length then h p n else 0)) -
      (if n = 0 then (cQ : ℝ) else 0)| ≤ (headCapQ : ℝ) := by
  let w (p : Fin k) : ℝ := (wQ p : ℝ)
  let g (p : Fin k) (n : ℕ) := if n < (headI p).length then h p n else 0
  let P (p : Fin k) : ℝ[X] := ∑ n ∈ range (N + 1), monomial n (g p n)
  have hcoeff (p : Fin k) (n : ℕ) (hn : n < N + 1) : (P p).coeff n = g p n := by
    simp only [P, finsetSum_coeff, coeff_monomial]
    rw [sum_eq_single n (fun b _ hbn => by simp [hbn]) (fun hnp => absurd (mem_range.2 hn) hnp)]
    simp
  have hp : ∀ p ∈ List.finRange k,
      memB (N + 1) (C (w p) * P p) ((headI p).map (mulI (ofRatI (wQ p)))) := by
    intro p _
    apply memB_C_mul (mem_ofRatI (wQ p))
    intro n hn
    rw [hcoeff p n hn]
    by_cases hj : n < (headI p).length
    · simpa [g, hj] using hmem p n hj
    · simpa [g, hj, List.getD_eq_getElem?_getD, List.getElem?_eq_none (Nat.le_of_not_gt hj)] using mem_zero
  have hsumB := memB_add (memB_sumL _ _ (List.finRange k) hp)
    (memB_single (N := N + 1) (mem_neg (mem_ofRatI cQ)))
  have hinterval := (absSum_le hsumB).trans ((Int.cast_le.2 hhead).trans (ofRatLo_le headCapQ))
  change ∑ n ∈ range (N + 1), |(∑ p, w p * g p n) - (if n = 0 then (cQ : ℝ) else 0)| ≤ _
  refine le_of_mul_le_mul_right ((le_of_eq ?_).trans hinterval) D_pos
  congr 1
  refine sum_congr rfl fun n hn => ?_
  rw [coeff_add, coeff_C, ← Fin.sum_univ_def, finsetSum_coeff]
  have he : ∑ p : Fin k, (C (w p) * P p).coeff n = ∑ p, w p * g p n :=
    sum_congr rfl fun p _ => by rw [coeff_C_mul, hcoeff p n (mem_range.mp hn)]
  rw [he]
  congr 1
  split_ifs <;> ring

/-- Compute the signed-head budget with interval lists of their actual lengths, then charge
each channel's true tail starting at the first index outside its list. -/
theorem convex_transfer_variable_ival {k N : ℕ} {wQ : Fin k → ℚ} {h : Fin k → ℕ → ℝ}
    {headI : Fin k → List Ival} {tl : Fin k → ℝ} {cQ headCapQ : ℚ} {δ : ℝ}
    (hw0 : ∀ p, 0 ≤ (wQ p : ℝ)) (hw1 : ∑ p, (wQ p : ℝ) = 1)
    (hs : ∀ p, Summable fun n => |h p n|)
    (hdom : ∀ p, DominatedKernel (radialKernel (h p)))
    (hlen : ∀ p, (headI p).length ≤ N + 1)
    (hmem : ∀ p n, n < (headI p).length → mem (h p n) ((headI p).getD n zeroI))
    (htail : ∀ p, ∑' n, |h p (n + (headI p).length)| ≤ tl p)
    (hhead : absSum (addL (sumL ((List.finRange k).map fun p =>
        (headI p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI cQ)]) ≤ ofRatLo headCapQ)
    (hδ : (headCapQ : ℝ) + ∑ p, (wQ p : ℝ) * tl p ≤ δ)
    (hδc : δ < (cQ : ℝ)) : IsBound (1 / ((cQ : ℝ) - δ)) := by
  let w (p : Fin k) : ℝ := (wQ p : ℝ)
  have hheadReal := variable_interval_head (N := N) hmem hhead
  refine transfer _ (summable_convex_comb w hs) ?_ hδc ?_
  · exact dominatedKernel_congr_ball (dominatedKernel_convex_comb hw0 hw1 hdom) fun _ hz =>
      (radialKernel_convex_comb w hs hz).symm
  · exact (residual_of_channel_cutoffs hw0 hs hlen htail hheadReal).trans hδ

end

end Grothe.Upper
