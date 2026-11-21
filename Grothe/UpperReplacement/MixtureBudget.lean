import Grothe.UpperReplacement.Mixture
import Grothe.Upper.Residual
import Grothe.UpperTarget

set_option warningAsError true

/-!
# Assembly of finite heads, comparison errors, and separate channel tails

Agent-ID: codex-a7c4.

Head cancellation is retained by adding the signed coefficients before taking absolute values.
The table comparison is charged once over the whole finite head, including its linear term.
Each channel may use its own Hardy contour; only their resulting tail bounds are combined.
-/

namespace Grothe.UpperReplacement

open Finset

noncomputable section

variable {ι : Type*}

/-- Truncate the composed channel itself, after applying its preprocessor. -/
def truncateChannel (h : ℕ → ℝ) (K : ℕ) (j : ℕ) : ℝ := if j < K then h j else 0

theorem head_error_truncate (h : ℕ → ℝ) (hs : Summable fun n ↦ |h n|)
    {K L : ℕ} (hKL : K ≤ L) :
    ∑ j ∈ range L, |h j - truncateChannel h K j| ≤ ∑' n, |h (n + K)| := by
  rw [← sum_range_add_sum_Ico (fun j ↦ |h j - truncateChannel h K j|) hKL]
  have hz : ∑ j ∈ range K, |h j - truncateChannel h K j| = 0 := by
    apply sum_eq_zero
    intro j hj
    simp only [truncateChannel, ite_eq_left (mem_range.mp hj), sub_self, abs_zero]
  rw [hz, zero_add]
  have he : (∑ j ∈ Ico K L, |h j - truncateChannel h K j|) =
      ∑ j ∈ Ico K L, |h j| := by
    apply sum_congr rfl
    intro j hj
    have hbound := mem_Ico.mp hj
    simp only [truncateChannel, ite_eq_right (by omega : ¬j < K), sub_zero]
  rw [he, sum_Ico_eq_sum_range]
  have htail : Summable fun n ↦ |h (n + K)| := (summable_nat_add_iff K).mpr hs
  simpa only [Nat.add_comm] using
    htail.sum_le_tsum (range (L - K)) (fun n _ ↦ abs_nonneg (h (n + K)))

/-- Per-channel finite comparison errors add with their absolute mixture weights. -/
theorem mixture_head_error_le (s : Finset ι) (w : ι → ℝ) (h a : ι → ℕ → ℝ)
    (L : ℕ) (E : ι → ℝ)
    (hE : ∀ r ∈ s, ∑ j ∈ range L, |h r j - a r j| ≤ E r) :
    ∑ j ∈ range L, |(∑ r ∈ s, w r * h r j) - (∑ r ∈ s, w r * a r j)| ≤
      ∑ r ∈ s, |w r| * E r := by
  calc (∑ j ∈ range L, |(∑ r ∈ s, w r * h r j) - (∑ r ∈ s, w r * a r j)|)
      = ∑ j ∈ range L, |∑ r ∈ s, w r * (h r j - a r j)| := by
        simp only [mul_sub, sum_sub_distrib]
    _ ≤ ∑ j ∈ range L, ∑ r ∈ s, |w r| * |h r j - a r j| := by
        apply sum_le_sum
        intro j _
        simpa only [abs_mul] using abs_sum_le_sum_abs (fun r ↦ w r * (h r j - a r j)) s
    _ = ∑ r ∈ s, |w r| * ∑ j ∈ range L, |h r j - a r j| := by
        rw [sum_comm]
        simp only [mul_sum]
    _ ≤ ∑ r ∈ s, |w r| * E r :=
      sum_le_sum fun r hr ↦ mul_le_mul_of_nonneg_left (hE r hr) (abs_nonneg _)

/-- A channel's certified linear coefficient is removed before estimating its remaining tail.
The head ends at radial index `K`, so the shifted sequence's tail starts at `K`. -/
theorem channel_tail_after_linear {h : ℕ → ℝ} {r B L T : ℝ} {K : ℕ}
    (hr : 1 < r) (hL : 0 ≤ L) (h0 : L ≤ h 0)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B)
    (hT : 0 ≤ T)
    (hnum : ((B - L ^ 2 * r ^ 2) / r ^ 4) * r⁻¹ ^ (2 * (2 * K + 1)) ≤
      T ^ 2 * (1 - r⁻¹ ^ 4)) :
    ∑' n, |h (n + (K + 1))| ≤ T := by
  have hb := hardy_budget_after_linear h r B L (zero_lt_one.trans hr) hL h0 hB
  simpa only [Nat.add_assoc] using
    hardy_tail (fun n ↦ h (n + 1)) r hr ((B - L ^ 2 * r ^ 2) / r ^ 4) hb K T hT hnum

theorem mixture_tail_le (s : Finset ι) (w : ι → ℝ) (h : ι → ℕ → ℝ)
    (hs : ∀ r ∈ s, Summable fun n ↦ |h r n|) (N : ℕ) (T : ι → ℝ)
    (hT : ∀ r ∈ s, ∑' n, |h r (n + N)| ≤ T r) :
    ∑' n, |∑ r ∈ s, w r * h r (n + N)| ≤ ∑ r ∈ s, |w r| * T r := by
  have ht : ∀ r ∈ s, Summable fun n ↦ |h r (n + N)| := fun r hr ↦
    (summable_nat_add_iff N).mpr (hs r hr)
  have hsum := summable_sum fun r hr ↦ (ht r hr).mul_left |w r|
  calc
    (∑' n, |∑ r ∈ s, w r * h r (n + N)|)
        ≤ ∑' n, ∑ r ∈ s, |w r| * |h r (n + N)| := by
      apply (summable_abs_mixture s w (fun r n ↦ h r (n + N)) ht).tsum_le_tsum _ hsum
      intro n
      simpa only [abs_mul] using abs_sum_le_sum_abs (fun r ↦ w r * h r (n + N)) s
    _ = ∑ r ∈ s, |w r| * ∑' n, |h r (n + N)| := by
      rw [Summable.tsum_finsetSum (fun r hr ↦ (ht r hr).mul_left |w r|)]
      simp only [tsum_mul_left]
    _ ≤ ∑ r ∈ s, |w r| * T r :=
      sum_le_sum fun r hr ↦ mul_le_mul_of_nonneg_left (hT r hr) (abs_nonneg _)

/-- A finite comparison allowance controls the complete finite residual, without paying its
linear coefficient a second time. -/
theorem head_residual_le {q a : ℕ → ℝ} {K : ℕ} {c E H : ℝ}
    (he : ∑ j ∈ range (K + 1), |q j - a j| ≤ E)
    (ha : ∑ j ∈ range (K + 1), |a j - if j = 0 then c else 0| ≤ H) :
    ∑ j ∈ range (K + 1), |q j - if j = 0 then c else 0| ≤ E + H := by
  calc
    (∑ j ∈ range (K + 1), |q j - if j = 0 then c else 0|)
        ≤ ∑ j ∈ range (K + 1),
          (|q j - a j| + |a j - if j = 0 then c else 0|) := by
      apply sum_le_sum
      intro j _
      exact abs_sub_le (q j) (a j) (if j = 0 then c else 0)
    _ ≤ E + H := by rw [sum_add_distrib]; exact add_le_add he ha

/-- Transfer the certified finite mixture to a dimension-independent complex Grothendieck bound.
The individual channel realizations and both numerical estimates are explicit proof inputs. -/
theorem upper_of_mixture_checks (s : Finset ι) (w : ι → ℝ) (h : ι → ℕ → ℝ)
    (hs : ∀ r ∈ s, Summable fun n ↦ |h r n|)
    (hd : ∀ r ∈ s, DominatedKernel (radialKernel (h r)))
    (hw : ∑ r ∈ s, |w r| ≤ 1)
    {a : ℕ → ℝ} {K : ℕ} {c E H : ℝ} {T : ι → ℝ}
    (he : ∑ j ∈ range (K + 1), |(∑ r ∈ s, w r * h r j) - a j| ≤ E)
    (ha : ∑ j ∈ range (K + 1), |a j - if j = 0 then c else 0| ≤ H)
    (hT : ∀ r ∈ s, ∑' n, |h r (n + (K + 1))| ≤ T r)
    (hgap : E + H + ∑ r ∈ s, |w r| * T r < c) :
    IsGrothendieckBound (1 / (c - (E + H + ∑ r ∈ s, |w r| * T r))) := by
  let q : ℕ → ℝ := fun n ↦ ∑ r ∈ s, w r * h r n
  have hqs := summable_abs_mixture s w h hs
  have hqd : DominatedKernel (radialKernel q) := by
    refine (DominatedKernel.mixture s w (fun r ↦ radialKernel (h r)) hd hw).congr ?_
    exact fun z hz ↦ radialKernel_mixture s w h hs hz
  apply transfer q hqs hqd hgap
  rw [residual_split q hqs c K]
  exact add_le_add (head_residual_le he ha) (mixture_tail_le s w h hs (K + 1) T hT)

/-- A one-sided linear bound avoids charging the difference between that bound and the actual
linear coefficient. The total comparison allowance still includes index zero exactly once. -/
theorem head_gap_lower {q a : ℕ → ℝ} {K : ℕ} {c E H : ℝ}
    (he : ∑ j ∈ range (K + 1), |q j - a j| ≤ E)
    (hc : c ≤ a 0) (hH : ∑ j ∈ range K, |a (j + 1)| ≤ H) :
    c - H - E ≤ q 0 - ∑ j ∈ range K, |q (j + 1)| := by
  rw [sum_range_succ'] at he
  have hq : ∑ j ∈ range K, |q (j + 1)| ≤
      (∑ j ∈ range K, |q (j + 1) - a (j + 1)|) +
        ∑ j ∈ range K, |a (j + 1)| := by
    rw [← sum_add_distrib]
    apply sum_le_sum
    intro j _
    simpa only [sub_add_cancel] using abs_add_le (q (j + 1) - a (j + 1)) (a (j + 1))
  have h₀ := neg_abs_le (q 0 - a 0)
  linarith

theorem gap_lower_of_checks {q a : ℕ → ℝ} (hs : Summable fun n ↦ |q n|)
    {K : ℕ} {c E H T : ℝ}
    (he : ∑ j ∈ range (K + 1), |q j - a j| ≤ E)
    (hc : c ≤ a 0) (hH : ∑ j ∈ range K, |a (j + 1)| ≤ H)
    (hT : ∑' n, |q (n + (K + 1))| ≤ T) :
    c - H - E - T ≤ q 0 - ∑' n, |q (n + 1)| := by
  have hhead := head_gap_lower he hc hH
  have hs1 : Summable fun n ↦ |q (n + 1)| := (summable_nat_add_iff 1).mpr hs
  have hsplit := hs1.sum_add_tsum_nat_add K
  simp only [Nat.add_assoc] at hsplit
  linarith

theorem upper_of_gap_checks {q a : ℕ → ℝ} (hs : Summable fun n ↦ |q n|)
    (hd : DominatedKernel (radialKernel q)) {K : ℕ} {c E H T : ℝ}
    (he : ∑ j ∈ range (K + 1), |q j - a j| ≤ E)
    (hc : c ≤ a 0) (hH : ∑ j ∈ range K, |a (j + 1)| ≤ H)
    (hT : ∑' n, |q (n + (K + 1))| ≤ T) (hp : 0 < c - H - E - T) :
    IsGrothendieckBound (1 / (c - H - E - T)) := by
  have hl := gap_lower_of_checks hs he hc hH hT
  have hδ : (∑' n, |q (n + 1)|) < q 0 := by linarith
  have hb := transfer q hs hd hδ (by simp :
    |q 0 - q 0| + ∑' n, |q (n + 1)| ≤ ∑' n, |q (n + 1)|)
  exact hb.mono (one_div_le_one_div_of_le hp hl)

/-- End arithmetic for the wider-contour certificate. The finite and infinite estimates remain
explicit inputs here; the closed endpoint must instantiate all of them. -/
theorem bound_of_certificate_bounds {q a : ℕ → ℝ} (hs : Summable fun n ↦ |q n|)
    (hd : DominatedKernel (radialKernel q))
    (he : ∑ j ∈ range 251, |q j - a j| ≤ (1467492832 / 10 ^ 15 : ℝ))
    (hc : (711964618746086 / 10 ^ 15 : ℝ) ≤ a 0)
    (hH : ∑ j ∈ range 250, |a (j + 1)| ≤ (873503595 / 10 ^ 15 : ℝ))
    (hT : ∑' n, |q (n + 251)| ≤ (225168500 / 10 ^ 15 : ℝ)) :
    IsGrothendieckBound (1000000000000000 / 711962052581159) := by
  have hb := upper_of_gap_checks hs hd (K := 250) he hc hH hT (by norm_num)
  convert hb using 1
  norm_num

end

end Grothe.UpperReplacement
