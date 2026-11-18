import Grothe.UpperReplacement.TailSound
import Grothe.UpperReplacement.MixtureHead

set_option warningAsError true

/-!
# Assembly of the private mixture certificate

Agent-ID: codex-a7c4. The signed head is summed before absolute values are taken. The GT
comparison, cell truncation, and infinite tails are separate, explicitly proved allowances.
The closed endpoint supplies the contour and head checks to this assembly.
-/

namespace Grothe.UpperReplacement.Assembly

open Finset Polynomial MeasureTheory Upper UpperChaos GrotheKernel Certificate Production

noncomputable section

def tailIndex : Index ≃ Fin 18 := finCongr channels_length

theorem channelAt_tailIndex (i : Index) : TailInputs.channelAt (tailIndex i) = channel i := rfl

def comparisonError (c : Channel) : ℚ :=
  match c.kind with
  | .gt => GTComparison.univGTHeadErrQ
  | .phase => 0
  | .tiger => TailInputs.cellTruncationTail

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem comparisonError_checked :
    (channels.map fun c ↦ c.weight * comparisonError c).sum ≤ 1467492832 / 10 ^ 15 := by
  decide +kernel

set_option maxRecDepth 10000 in
theorem tiger_unique : ∀ c ∈ channels, c.kind = .tiger → c = TailInputs.channelAt 15 := by
  decide +kernel

theorem weight_nonneg (i : Index) : 0 ≤ weight i := by
  unfold weight
  exact_mod_cast (parameters_checked _ (channel_mem i)).1.le

theorem head_error
    (hGT : ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ))
    (hcell : TailInputs.analyticChecks 15 = true) :
    ∑ n ∈ range 251, |mixture n - mixturePolynomial.coeff n| ≤
      (1467492832 / 10 ^ 15 : ℝ) := by
  have herror (i : Index) :
      ∑ n ∈ range 251,
        |channelSequence (channel i) n - (channelPolynomial (channel i)).coeff n| ≤
        (comparisonError (channel i) : ℝ) := by
    have h := channel_head_error hGT (channel_mem i)
      (T := (TailInputs.cellTruncationTail : ℝ)) (fun ht ↦ by
        rw [tiger_unique _ (channel_mem i) ht]
        exact TailSound.cell_truncation_tail hcell)
    cases hk : (channel i).kind <;> simpa only [comparisonError, hk, Rat.cast_zero] using h
  have he := mixture_head_error_le univ weight (fun i ↦ channelSequence (channel i))
    (fun i n ↦ (channelPolynomial (channel i)).coeff n) 251
    (fun i ↦ (comparisonError (channel i) : ℝ)) (fun i _ ↦ herror i)
  have hbudget : ∑ i : Index, |weight i| * (comparisonError (channel i) : ℝ) ≤
      (1467492832 / 10 ^ 15 : ℝ) := by
    simp_rw [abs_of_nonneg (weight_nonneg _)]
    have h := comparisonError_checked
    rw [sum_map_eq_fin] at h
    unfold weight channel
    simpa only [Rat.cast_sum, Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using
      (Rat.cast_le (K := ℝ)).2 h
  simpa only [mixture, mixturePolynomial_coeff] using he.trans hbudget

theorem mixture_tail
    (hGT : ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ))
    (hchecks : ∀ i : Fin 18, TailInputs.analyticChecks i = true) :
    ∑' n, |mixture (n + 251)| ≤ (225168500 / 10 ^ 15 : ℝ) := by
  have ht (i : Index) :
      ∑' n, |channelSequence (channel i) (n + 251)| ≤
        (LinearTail.ceiling (tailIndex i) : ℝ) := by
    simpa only [channelAt_tailIndex] using
      TailSound.channel_tail_ceiling hGT (tailIndex i) (hchecks (tailIndex i))
  have hm := mixture_tail_le univ weight (fun i ↦ channelSequence (channel i))
    (fun i _ ↦ channel_summable (channel_mem i)) 251
    (fun i ↦ (LinearTail.ceiling (tailIndex i) : ℝ)) (fun i _ ↦ ht i)
  have hbudget : ∑ i : Index, |weight i| * (LinearTail.ceiling (tailIndex i) : ℝ) ≤
      (225168500 / 10 ^ 15 : ℝ) := by
    simp_rw [abs_of_nonneg (weight_nonneg _)]
    have he : ∑ i : Index, weight i * (LinearTail.ceiling (tailIndex i) : ℝ) =
        ∑ j : Fin 18, (TailInputs.channelAt j).weight * (LinearTail.ceiling j : ℝ) := by
      apply Fintype.sum_equiv tailIndex
      intro i
      rw [channelAt_tailIndex]
      rfl
    rw [he]
    have hh := LinearTail.weighted_ceiling
    rw [← List.ofFn_eq_map, List.sum_ofFn] at hh
    simpa only [Rat.cast_sum, Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using
      (Rat.cast_le (K := ℝ)).2 hh
  exact hm.trans hbudget

theorem bound_of_checks
    (hGT : ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ))
    (hchecks : ∀ i : Fin 18, TailInputs.analyticChecks i = true) :
    IsGrothendieckBound (1000000000000000 / 711962052581159) := by
  have hb := MixtureHead.signed_head
  exact bound_of_certificate_bounds mixture_summable mixture_dominated
    (head_error hGT (hchecks 15)) hb.1 hb.2 (mixture_tail hGT hchecks)

end

end Grothe.UpperReplacement.Assembly
