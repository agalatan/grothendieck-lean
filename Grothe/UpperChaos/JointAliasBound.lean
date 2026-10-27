import Mathlib.Analysis.SumOverResidueClass
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Tactic

/-!
# Joint bound for any selection of modular alias classes

This uses mathlib's `Finset.sum_indicator_mod` to work with the ZMod
indicator form of a DFT filter without reindexing residues by quotients. The
DFT identity, cutoff splitting and sample enclosures remain separate inputs.
-/

open Finset Set
namespace Grothe.UpperChaos.DirectSample
noncomputable section

/-- The sum over any selected modular classes of a nonnegative summable
sequence is at most the whole sum. -/
theorem tsum_selected_residue_le {m : ℕ} [NeZero m]
    (f : ℕ → ℝ) (hf : Summable f) (hn : ∀ n, 0 ≤ f n)
    (S : Finset (ZMod m)) :
    (∑ j ∈ S, ∑' n : ℕ, {n : ℕ | (n : ZMod m) = j}.indicator f n) ≤
      ∑' n, f n := by
  classical
  let residue : ZMod m → ℕ → ℝ :=
    fun j => {n : ℕ | (n : ZMod m) = j}.indicator f
  have hnonneg (j : ZMod m) (n : ℕ) : 0 ≤ residue j n := by
    exact Set.indicator_apply_nonneg (fun _ => hn n)
  have hsum_n (n : ℕ) : (∑ j ∈ S, residue j n) ≤ f n := by
    have hall : (∑ j : ZMod m, residue j n) = f n := by
      simpa only [residue, Finset.sum_apply] using
        (congrFun (Finset.sum_indicator_mod m f) n).symm
    rw [← hall]
    exact sum_le_sum_of_subset_of_nonneg (subset_univ S)
      (fun j _ _ => hnonneg j n)
  have hres (j : ZMod m) : Summable (residue j) := hf.indicator _
  have hsum : Summable (fun n => ∑ j ∈ S, residue j n) := by
    refine Summable.of_nonneg_of_le ?_ hsum_n hf
    intro n
    exact sum_nonneg fun j _ => hnonneg j n
  calc
    _ = ∑' n : ℕ, ∑ j ∈ S, residue j n := by
      symm
      exact Summable.tsum_finsetSum (fun j _ => hres j)
    _ ≤ _ := hsum.tsum_le_tsum hsum_n hf

/-- The same result for the shifted GT tail; every alias class is paid once.
A separate DFT theorem must show actual mode errors are bounded by these sums. -/
theorem joint_GT_residue_tail_le (h : ℕ → ℝ)
    (hs : Summable (fun n => |h (n + 512)|)) (S : Finset (ZMod 512)) :
    (∑ j ∈ S, ∑' n : ℕ,
      {n : ℕ | (n : ZMod 512) = j}.indicator (fun n => |h (n + 512)|) n) ≤
      ∑' n, |h (n + 512)| :=
  tsum_selected_residue_le _ hs (fun _ => abs_nonneg _) S

end
end Grothe.UpperChaos.DirectSample
