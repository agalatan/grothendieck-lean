-- Grothe/UpperChaos/CollectiveTail.lean
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Cancellation-preserving tails of finite kernel mixtures

Agent-ID: codex-9b17.

The coefficients of a mixture must be added before taking absolute values.  Given
absolutely summable real branch coefficients `a i n` (including their weights),
`collectiveTailBudget s a N K` retains this cancellation for `K` coefficients
starting at `N` and uses separate branch tails only after `N + K`.

`collective_tail_le` proves the resulting infinite-tail bound.  The exact identity
`collectiveTailBudget_add_refund` expresses its gain over separate branch tails as
the finite, nonnegative `cancellationRefund`.  Consequently the bound decreases
as the retained window grows.  `weighted_tail_le_cap_sub_refund` applies the same
refund directly to previously certified individual tail caps, with signed weights;
no new infinite-tail certificate is needed for that version.

These are general coefficient estimates.  They neither assert a numerical
Grothendieck endpoint nor discharge the analytic inputs of any rounding kernel.
-/

namespace Grothe.UpperChaos

open Finset

noncomputable section

variable {ι : Type*}

/-- The coefficient of the finite mixture; weights may be included in `a`. -/
def collectiveCoeff (s : Finset ι) (a : ι → ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ i ∈ s, a i n

/-- The sum of separate absolute branch tails starting at `N`. -/
def separateTail (s : Finset ι) (a : ι → ℕ → ℝ) (N : ℕ) : ℝ :=
  ∑ i ∈ s, ∑' n, |a i (n + N)|

/-- Keep cancellation for `K` modes, then use separate tails. -/
def collectiveTailBudget (s : Finset ι) (a : ι → ℕ → ℝ) (N K : ℕ) : ℝ :=
  (∑ n ∈ range K, |collectiveCoeff s a (n + N)|) + separateTail s a (N + K)

/-- The exact saving from keeping cancellation in a finite window. -/
def cancellationRefund (s : Finset ι) (a : ι → ℕ → ℝ) (N K : ℕ) : ℝ :=
  ∑ n ∈ range K, ((∑ i ∈ s, |a i (n + N)|) - |collectiveCoeff s a (n + N)|)

lemma abs_collectiveCoeff_le (s : Finset ι) (a : ι → ℕ → ℝ) (n : ℕ) :
    |collectiveCoeff s a n| ≤ ∑ i ∈ s, |a i n| :=
  abs_sum_le_sum_abs _ _

lemma summable_abs_collectiveCoeff (s : Finset ι) (a : ι → ℕ → ℝ)
    (ha : ∀ i ∈ s, Summable fun n => |a i n|) :
    Summable fun n => |collectiveCoeff s a n| :=
  Summable.of_nonneg_of_le (fun _ => abs_nonneg _)
    (abs_collectiveCoeff_le s a) (summable_sum ha)

lemma tsum_abs_collectiveCoeff_le (s : Finset ι) (a : ι → ℕ → ℝ)
    (ha : ∀ i ∈ s, Summable fun n => |a i n|) :
    ∑' n, |collectiveCoeff s a n| ≤ ∑ i ∈ s, ∑' n, |a i n| := by
  calc
    _ ≤ ∑' n, ∑ i ∈ s, |a i n| :=
      (summable_abs_collectiveCoeff s a ha).tsum_le_tsum
        (abs_collectiveCoeff_le s a) (summable_sum ha)
    _ = _ := Summable.tsum_finsetSum ha

lemma collective_tail_le_separateTail (s : Finset ι) (a : ι → ℕ → ℝ)
    (ha : ∀ i ∈ s, Summable fun n => |a i n|) (N : ℕ) :
    ∑' n, |collectiveCoeff s a (n + N)| ≤ separateTail s a N := by
  simpa only [collectiveCoeff, separateTail] using
    tsum_abs_collectiveCoeff_le s (fun i n => a i (n + N))
      (fun i hi => (summable_nat_add_iff N).2 (ha i hi))

/-- **Collective finite-window bound.** The coefficients in the retained window
are added before their absolute values are taken. -/
theorem collective_tail_le (s : Finset ι) (a : ι → ℕ → ℝ)
    (ha : ∀ i ∈ s, Summable fun n => |a i n|) (N K : ℕ) :
    ∑' n, |collectiveCoeff s a (n + N)| ≤ collectiveTailBudget s a N K := by
  have hs := (summable_nat_add_iff N).2 (summable_abs_collectiveCoeff s a ha)
  have he : (∑' n, |collectiveCoeff s a (n + N)|) =
      (∑ n ∈ range K, |collectiveCoeff s a (n + N)|) +
        ∑' n, |collectiveCoeff s a (n + (N + K))| := by
    calc
      _ = (∑ n ∈ range K, |collectiveCoeff s a (n + N)|) +
          ∑' n, |collectiveCoeff s a (n + K + N)| :=
        (hs.sum_add_tsum_nat_add K).symm
      _ = _ := by simp only [Nat.add_assoc, Nat.add_comm K N]
  rw [he, collectiveTailBudget]
  exact add_le_add le_rfl (collective_tail_le_separateTail s a ha (N + K))

theorem cancellationRefund_nonneg (s : Finset ι) (a : ι → ℕ → ℝ) (N K : ℕ) :
    0 ≤ cancellationRefund s a N K :=
  sum_nonneg fun n _ => sub_nonneg.2 (abs_collectiveCoeff_le s a (n + N))

theorem cancellationRefund_mono (s : Finset ι) (a : ι → ℕ → ℝ) (N : ℕ)
    {K L : ℕ} (hKL : K ≤ L) :
    cancellationRefund s a N K ≤ cancellationRefund s a N L := by
  exact sum_le_sum_of_subset_of_nonneg (range_subset_range.2 hKL)
    fun n _ _ => sub_nonneg.2 (abs_collectiveCoeff_le s a (n + N))

/-- **Exact cancellation refund.** The collective budget plus the finite refund
equals the sum of the original separate infinite tails. -/
theorem collectiveTailBudget_add_refund (s : Finset ι) (a : ι → ℕ → ℝ)
    (ha : ∀ i ∈ s, Summable fun n => |a i n|) (N K : ℕ) :
    collectiveTailBudget s a N K + cancellationRefund s a N K = separateTail s a N := by
  have hsplit (i : ι) (hi : i ∈ s) : (∑' n, |a i (n + N)|) =
      (∑ n ∈ range K, |a i (n + N)|) + ∑' n, |a i (n + (N + K))| := by
    calc
      _ = (∑ n ∈ range K, |a i (n + N)|) + ∑' n, |a i (n + K + N)| :=
        (((summable_nat_add_iff N).2 (ha i hi)).sum_add_tsum_nat_add K).symm
      _ = _ := by simp only [Nat.add_assoc, Nat.add_comm K N]
  have hsum : separateTail s a N =
      (∑ n ∈ range K, ∑ i ∈ s, |a i (n + N)|) + separateTail s a (N + K) := by
    unfold separateTail
    rw [sum_congr rfl hsplit, sum_add_distrib, sum_comm]
  rw [collectiveTailBudget, cancellationRefund, sum_sub_distrib, hsum]
  ring

/-- Increasing the retained window can only improve the exact collective budget. -/
theorem collectiveTailBudget_antitone (s : Finset ι) (a : ι → ℕ → ℝ)
    (ha : ∀ i ∈ s, Summable fun n => |a i n|) (N : ℕ) :
    Antitone (collectiveTailBudget s a N) := by
  intro K L hKL
  have hK := collectiveTailBudget_add_refund s a ha N K
  have hL := collectiveTailBudget_add_refund s a ha N L
  have hrefund := cancellationRefund_mono s a N hKL
  linarith

/-- Subtract a finite cancellation refund from any certified cap on the sum of
separate branch tails. -/
theorem collective_tail_le_cap_sub_refund (s : Finset ι) (a : ι → ℕ → ℝ)
    (ha : ∀ i ∈ s, Summable fun n => |a i n|) (N K : ℕ) {B : ℝ}
    (hB : separateTail s a N ≤ B) :
    ∑' n, |collectiveCoeff s a (n + N)| ≤ B - cancellationRefund s a N K := by
  have ht := collective_tail_le s a ha N K
  have he := collectiveTailBudget_add_refund s a ha N K
  linarith

/-- **Weighted certified-tail refinement.** Arbitrary real weights are allowed.
The only infinite inputs are the original individual tail caps at `N`; the
improvement is computed entirely from the next `K` coefficients. -/
theorem weighted_tail_le_cap_sub_refund (s : Finset ι) (w : ι → ℝ)
    (a : ι → ℕ → ℝ) (ha : ∀ i ∈ s, Summable fun n => |a i n|)
    (N K : ℕ) (B : ι → ℝ) (hB : ∀ i ∈ s, (∑' n, |a i (n + N)|) ≤ B i) :
    (∑' n, |∑ i ∈ s, w i * a i (n + N)|) ≤
      (∑ i ∈ s, |w i| * B i) - cancellationRefund s (fun i n => w i * a i n) N K := by
  have hs : ∀ i ∈ s, Summable fun n => |w i * a i n| := by
    intro i hi
    simpa only [abs_mul] using (ha i hi).mul_left |w i|
  have hb : separateTail s (fun i n => w i * a i n) N ≤ ∑ i ∈ s, |w i| * B i := by
    apply sum_le_sum
    intro i hi
    simp only [abs_mul, tsum_mul_left]
    exact mul_le_mul_of_nonneg_left (hB i hi) (abs_nonneg _)
  exact collective_tail_le_cap_sub_refund s (fun i n => w i * a i n) hs N K hb

end

end Grothe.UpperChaos
