-- Grothe/Upper/ImprovedHeadWeight.lean
import Grothe.Upper.HeadWeight
import Grothe.Upper.PolynomialHeadTail
import Grothe.Upper.ImprovedHeadWeightData

/-! Soundness of the longer-prefix coefficient costs used by the production
comparison. The omitted coefficients are bounded analytically, independently
of the finite mass checks. Agent-ID: codex-9b17. Refs #379. -/

set_option warningAsError true

namespace Grothe.Upper

open GrotheKernel Polynomial Finset

noncomputable section

/-- Multiplying the `i`th coefficient by `r^i` is polynomial dilation. -/
theorem ofListQ_mapIdx_mul_pow (l : List ℚ) (r : ℚ) :
    ofListQ (l.mapIdx (fun i q ↦ q * r ^ i)) =
      (ofListQ l).comp (C (r : ℝ) * X) := by
  ext n
  rw [coeff_ofListQ, comp_C_mul_X_coeff, coeff_ofListQ]
  have h : (l.mapIdx (fun i q ↦ q * r ^ i)).getD n 0 = l.getD n 0 * r ^ n := by
    simp only [List.getD_eq_getElem?_getD, List.getElem?_mapIdx]
    cases l[n]? <;> simp
  exact_mod_cast h

private theorem l1_dilated_primary_le :
    l1 (primaryPoly.comp (C (3 / 2 : ℝ) * X)) ≤ 10049 / 10000 := by
  have h : ofListQ scaledPList = primaryPoly.comp (C (3 / 2 : ℝ) * X) := by
    simpa only [scaledPList, primaryPoly, Rat.cast_div, Rat.cast_ofNat] using
      ofListQ_mapIdx_mul_pow pList (3 / 2)
  rw [← h]
  exact (l1_ofListQ_le scaledPList).trans (by
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_le (K := ℝ)).mpr scaledPList_norm)

private theorem l1_dilated_aux_tail_le :
    l1 ((ofListQ qList.tail).comp (C (3 / 2 : ℝ) * X)) ≤ 10023 / 10000 := by
  have h : ofListQ scaledQList = (ofListQ qList.tail).comp (C (3 / 2 : ℝ) * X) := by
    simpa only [scaledQList, Rat.cast_div, Rat.cast_ofNat] using
      ofListQ_mapIdx_mul_pow qList.tail (3 / 2)
  rw [← h]
  exact (l1_ofListQ_le scaledQList).trans (by
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_le (K := ℝ)).mpr scaledQList_norm)

/-- The uniform remainder applies to every production polynomial power. -/
theorem improved_unshifted_tail (n m : ℕ) (hn : n ≤ 501) (hm : m ≤ 167) :
    l1 ((primaryPoly ^ n * ofListQ qList.tail ^ m).comp (C (3 / 2 : ℝ) * X)) /
      (3 / 2 : ℝ) ^ 51 ≤ (improvedTailQ : ℝ) := by
  have h := l1_dilated_pow_mul_le primaryPoly (ofListQ qList.tail)
    (by norm_num : (1 : ℝ) ≤ 10049 / 10000)
    (by norm_num : (1 : ℝ) ≤ 10023 / 10000)
    l1_dilated_primary_le l1_dilated_aux_tail_le hn hm
  refine (div_le_div_of_nonneg_right h (by positivity)).trans ?_
  simpa only [Rat.cast_div, Rat.cast_mul, Rat.cast_pow, Rat.cast_ofNat] using
    (Rat.cast_le (K := ℝ)).mpr improvedTail_numeric

/-- The interval prefix encloses the absolute coefficients actually retained. -/
theorem improved_prefix_sound (n m : ℕ) (hn : n ≤ 501) (hm : m ≤ 167) :
    ∑ j ∈ range (min (251 - (n / 2 + m / 2 + m)) 51),
      |(primaryPoly ^ n * ofListQ qList.tail ^ m).coeff j| ≤
        (improvedPrefixCostQ n m : ℝ) := by
  have hb := memB_conv
    (memB_pow (memB_ofListQ pList 51) 501 n hn)
    (memB_pow (memB_ofListQ qList.tail 51) 167 m hm)
  have hc := absSum_le (memB_take (memB_mono hb
    (min_le_right (251 - (n / 2 + m / 2 + m)) 51)))
  unfold improvedPrefixCostQ
  push_cast
  apply (le_div_iff₀ D_pos).mpr
  exact hc

noncomputable def improvedWeight (p : ℕ × ℕ) : ℝ := improvedWeightQ p.1 p.2

private theorem improvedOldWeightQ_eq (n m : ℕ) :
    improvedOldWeightQ n m = comparisonWeightQ n m := rfl

/-- The refined cost retains every improvement already made by the old cost. -/
theorem improvedWeight_le_comparisonWeight (p : ℕ × ℕ) :
    improvedWeight p ≤ comparisonWeight p := by
  change (improvedWeightQ p.1 p.2 : ℝ) ≤ (comparisonWeightQ p.1 p.2 : ℝ)
  rw [← improvedOldWeightQ_eq]
  apply Rat.cast_le.mpr
  by_cases hp : p.1 ≤ 501 ∧ p.2 ≤ 167
  · rw [improvedWeightQ, ite_eq_left hp]
    exact min_le_left _ _
  · rw [improvedWeightQ, ite_eq_right hp]

theorem improvedWeight_bounds (p : ℕ × ℕ) :
    0 ≤ improvedWeight p ∧ improvedWeight p ≤ 1 := by
  refine ⟨?_, (improvedWeight_le_comparisonWeight p).trans (comparisonWeight_bounds p).2⟩
  apply Rat.cast_nonneg.mpr
  have ho : 0 ≤ improvedOldWeightQ p.1 p.2 :=
    (headWeight_bounds 501 21 _ _ p.1 p.2).1
  by_cases hp : p.1 ≤ 501 ∧ p.2 ≤ 167
  · rw [improvedWeightQ, ite_eq_left hp]
    exact le_min ho (le_min zero_le_one (le_max_left _ _))
  · rw [improvedWeightQ, ite_eq_right hp]
    exact ho

/-- The new prefix plus analytic tail bounds the actual coefficient map. -/
theorem improvedWeight_sound (p : ℕ × ℕ) :
    ∑ j ∈ range 251, |(termOf primaryPoly auxPoly p).coeff j| ≤ improvedWeight p := by
  have hold := comparisonWeight_sound p
  have hold' : (∑ j ∈ range 251, |(termOf primaryPoly auxPoly p).coeff j|) ≤
      (improvedOldWeightQ p.1 p.2 : ℝ) := by
    rw [improvedOldWeightQ_eq]
    exact hold
  by_cases hp : p.1 ≤ 501 ∧ p.2 ≤ 167
  · have heq : termOf primaryPoly auxPoly p =
        X ^ (p.1 / 2 + p.2 / 2 + p.2) *
          (primaryPoly ^ p.1 * ofListQ qList.tail ^ p.2) := by
      have hQ : auxPoly = X * ofListQ qList.tail := by simp [auxPoly, qList, ofListQ]
      rw [hQ]
      unfold termOf shiftOf
      rw [mul_pow, pow_add]
      ring
    have hnew : (∑ j ∈ range 251, |(termOf primaryPoly auxPoly p).coeff j|) ≤
        (improvedPrefixCostQ p.1 p.2 : ℝ) +
          if 51 < 251 - (p.1 / 2 + p.2 / 2 + p.2) then (improvedTailQ : ℝ) else 0 := by
      rw [heq, shifted_abs_sum]
      exact (sum_abs_coeff_le_prefix_tail _ (by norm_num : (1 : ℝ) ≤ 3 / 2)
        51 (251 - (p.1 / 2 + p.2 / 2 + p.2))
        (improved_unshifted_tail p.1 p.2 hp.1 hp.2)).trans
          (add_le_add (improved_prefix_sound p.1 p.2 hp.1 hp.2) le_rfl)
    have hunit := hold.trans (comparisonWeight_bounds p).2
    change _ ≤ (improvedWeightQ p.1 p.2 : ℝ)
    rw [improvedWeightQ, ite_eq_left hp]
    by_cases hk : 51 < 251 - (p.1 / 2 + p.2 / 2 + p.2)
    · simp only [ite_eq_left hk] at hnew ⊢
      push_cast
      exact le_min hold' (le_min hunit (hnew.trans (le_max_right _ _)))
    · simp only [ite_eq_right hk] at hnew ⊢
      push_cast
      exact le_min hold' (le_min hunit (hnew.trans (le_max_right _ _)))
  · change _ ≤ (improvedWeightQ p.1 p.2 : ℝ)
    rw [improvedWeightQ, ite_eq_right hp]
    exact hold'

end
end Grothe.Upper
