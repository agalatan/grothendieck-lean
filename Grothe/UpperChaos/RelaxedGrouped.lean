import Grothe.UpperChaos.LocalizedComparison
import Grothe.UpperChaos.GroupedRounder

/-! # Grouped comparison with relaxed energy-table accuracy

A sharper selected-spectrum comparison from the same component inputs.
Pieces in each Taylor group occupy disjoint chaos bands, so their squared
norms add before the groups are combined. -/

namespace Grothe.UpperChaos

open MeasureTheory Finset Grothe.Upper GrotheKernel

noncomputable section

/-- Proposed relaxed numerical allowances; these do not assert their validity. -/
def relaxedEnergyErrQ : ℚ := 1 / 2000000
def relaxedRadiusQ : ℚ := 71 / 100000
def relaxedCompareQ : ℚ := 868 / 1000000000
def relaxedHeadResidualQ : ℚ := relaxedCompareQ + headCapQ + relaxedEnergyErrQ
def relaxedLinearLowerQ : ℚ := slopeQ - relaxedHeadResidualQ
def relaxedShiftedBudgetQ : ℚ :=
  (7 / 4 - relaxedLinearLowerQ ^ 2 * (4149 / 4000) ^ 2) / (4149 / 4000) ^ 4
def relaxedTailQ : ℚ := 30489 / 1000000000000

theorem relaxed_grouped_budget :
    2 * (comparisonBands.map fun b => (b.norm + relaxedRadiusQ) * b.error).sum +
      (∑ g : Fin 4, comparisonGroupRadiusQ g) ^ 2 ≤ relaxedCompareQ := by
  decide +kernel

theorem relaxed_tail_numeric :
    (relaxedShiftedBudgetQ : ℝ) * (4149 / 4000 : ℝ)⁻¹ ^ (2 * (2 * 250 + 1))
      ≤ (relaxedTailQ : ℝ) ^ 2 * (1 - (4149 / 4000 : ℝ)⁻¹ ^ 4) := by
  have hN : (308394645332942864203046669437606240000 * 4000 ^ 1002 : ℕ)
      ≤ 37488732433922777455521 * 4149 ^ 1002 := by
    decide +kernel
  have hR : (308394645332942864203046669437606240000 * 4000 ^ 1002 : ℝ)
      ≤ 37488732433922777455521 * 4149 ^ 1002 := by
    exact_mod_cast hN
  have ha : (0 : ℝ) ≤ 4000 ^ 1002 := by positivity
  have hb : (0 : ℝ) < 4149 ^ 1002 := by positivity
  rw [show 2 * (2 * 250 + 1) = 1002 by norm_num,
    show (4149 / 4000 : ℝ)⁻¹ = 4000 / 4149 by norm_num, div_pow]
  generalize (4000 : ℝ) ^ 1002 = a at hR ha ⊢
  generalize (4149 : ℝ) ^ 1002 = b at hR hb ⊢
  norm_num [relaxedShiftedBudgetQ, relaxedLinearLowerQ, relaxedHeadResidualQ,
    relaxedCompareQ, relaxedEnergyErrQ, headCapQ, slopeQ, relaxedTailQ]
  rw [← mul_div_assoc, div_le_iff₀ hb]
  linarith

theorem localized_comparison_of_relaxed_band_bounds {G X : Lp ℂ 2 mu2} (h : ComparisonInputs G X)
    (hband : ∀ j : ComparisonIndex,
      ∑ p ∈ bandIndices (comparisonBand j), comparisonWeight p ^ 2 * energy X p ≤
        (((comparisonBand j).norm : ℝ) + (relaxedRadiusQ : ℝ)) ^ 2) :
    ∑ p ∈ headIdx 501, comparisonWeight p * |energy G p - energy X p| ≤
      (relaxedCompareQ : ℝ) := by
  classical
  generalize hS : headIdx 501 = S at ⊢
  let a : ComparisonIndex → ℝ := fun j => ((comparisonBand j).norm : ℝ) + (relaxedRadiusQ : ℝ)
  let e : ComparisonIndex → ℝ := fun j => ((comparisonBand j).error : ℝ)
  let r : Fin 4 → ℝ := fun g => (comparisonGroupRadiusQ g : ℝ)
  have ha : ∀ j, 0 ≤ a j := fun j => by
    dsimp [a]
    have hn : (0 : ℝ) ≤ ((comparisonBand j).norm : ℝ) := by
      exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).2.1
    have hr : (0 : ℝ) ≤ (relaxedRadiusQ : ℝ) := by norm_num [relaxedRadiusQ]
    exact add_nonneg hn hr
  have he : ∀ j, 0 ≤ e j := fun j => by
    dsimp [e]
    exact_mod_cast (comparison_facts.1 _ (comparisonBand_mem j)).1
  have hz (j : ComparisonIndex) (p : ℕ × ℕ)
      (hn : (comparisonBand j).contains p.1 p.2 = false) :
      energyBlock (h.piece j) p = 0 := by
    have hh : ‖energyBlock (h.piece j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (h.support j p hn)
    apply norm_eq_zero.mp
    nlinarith [norm_nonneg (energyBlock (h.piece j) p)]
  have hradius (g : Fin 4) : 0 ≤ r g ∧
      ∑ j ∈ (univ : Finset ComparisonIndex).filter (fun j => comparisonGroup j = g),
        e j ^ 2 ≤ r g ^ 2 := by
    have hg := comparison_group_radii g
    constructor
    · change 0 ≤ (comparisonGroupRadiusQ g : ℝ)
      exact_mod_cast hg.1
    · change ∑ j ∈ (univ : Finset GroupedComparisonIndex).filter
          (fun j => comparisonGroup j = g), ((comparisonBands[j].error : ℝ) ^ 2) ≤
          (comparisonGroupRadiusQ g : ℝ) ^ 2
      have hq : ((∑ j : GroupedComparisonIndex,
          if comparisonGroup j = g then comparisonBands[j].error ^ 2 else 0 : ℚ) : ℝ) ≤
          ((comparisonGroupRadiusQ g ^ 2 : ℚ) : ℝ) := by exact_mod_cast hg.2
      rw [sum_filter]
      simpa only [Rat.cast_sum, Rat.cast_pow, apply_ite, Rat.cast_zero] using hq
  have hquad : ∑ p ∈ S, ‖energyBlock G p - energyBlock X p‖ ^ 2 ≤
      (∑ g : Fin 4, r g) ^ 2 := by
    have hh := BandComparison.quadratic_sum_le_grouped S (univ : Finset ComparisonIndex)
      (univ : Finset (Fin 4)) (fun j => energyBlock (h.piece j)) e comparisonGroup r
      (by simp) (fun j _ => he j)
      (fun j _ => by
        simp_rw [norm_energyBlock_sq]
        exact (energy_sum_le_norm_sq _ _).trans
          (pow_le_pow_left₀ (norm_nonneg _) (h.norm_le j) 2))
      (fun j _ k _ hgroup hne p _ => by
        have hs := comparison_group_separate j k hgroup hne
        rcases comparisonOverlap_separate (comparisonBand j) (comparisonBand k) p.1 p.2 hs
          with hj | hk
        · exact Or.inl (hz j p hj)
        · exact Or.inr (hz k p hk))
      (fun g _ => hradius g)
    simpa only [← energyBlock_sub, h.difference, energyBlock_sum] using hh
  have hc := BandComparison.weighted_compare S (univ : Finset ComparisonIndex) comparisonWeight
    (energyBlock X) (energyBlock G) (fun j => energyBlock (h.piece j))
    (fun j => bandIndices (comparisonBand j)) a e ((∑ g : Fin 4, r g) ^ 2)
    (fun p _ => comparisonWeight_bounds p)
    (fun p _ => by rw [← energyBlock_sub, h.difference, energyBlock_sum])
    (fun j _ p hp hpb => by
      have hn : (comparisonBand j).contains p.1 p.2 = false := by
        simpa [bandIndices, hS, hp] using hpb
      exact hz j p hn)
    (fun j _ => ha j) (fun j _ => he j)
    (fun j _ => by
      have hh := hband j
      have hi : S ∩ bandIndices (comparisonBand j) = bandIndices (comparisonBand j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hh)
    (fun j _ => by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _) (h.norm_le j) 2)) hquad
  simp_rw [norm_energyBlock_sq] at hc
  refine hc.trans ?_
  have hcross : ∑ j, a j * e j =
      (((comparisonBands.map fun b => (b.norm + relaxedRadiusQ) * b.error).sum : ℚ) : ℝ) := by
    change (∑ j, (((comparisonBand j).norm : ℝ) + (relaxedRadiusQ : ℝ)) * ((comparisonBand j).error : ℝ)) = _
    rw [sum_comparisonBand (fun b => ((b.norm : ℝ) + (relaxedRadiusQ : ℝ)) * (b.error : ℝ)), cast_list_sum]
    simp [List.map_map, Function.comp_def]
  have hsum : (∑ g : Fin 4, r g) = ((∑ g : Fin 4, comparisonGroupRadiusQ g : ℚ) : ℝ) := by
    simp [r]
  rw [hcross, hsum]
  exact_mod_cast relaxed_grouped_budget

/-- A relaxed absolute energy discrepancy gives all inflated band bounds. -/
theorem actual_band_mass_relaxed {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (relaxedEnergyErrQ : ℝ))
    {b : ComparisonBand} (hb : b ∈ comparisonBands) :
    ∑ p ∈ bandIndices b, comparisonWeight p ^ 2 * EX p ≤ ((b.norm : ℝ) + (relaxedRadiusQ : ℝ)) ^ 2 := by
  have hm : (∑ p ∈ bandIndices b, (energyTable p : ℝ) * comparisonWeight p ^ 2) +
      (energyErrQ : ℝ) ≤ (b.norm : ℝ) ^ 2 := by
    have h := (comparison_facts.1 b hb).2.2
    rw [comparisonMass_weighted_sum energyRows_within] at h
    change (∑ p ∈ bandIndices b, tabVal energyRows p * comparisonWeightQ p.1 p.2 ^ 2) +
      energyErrQ ≤ b.norm ^ 2 at h
    change (∑ p ∈ bandIndices b, (tabVal energyRows p : ℝ) *
      (comparisonWeightQ p.1 p.2 : ℝ) ^ 2) + (energyErrQ : ℝ) ≤ (b.norm : ℝ) ^ 2
    generalize hS : bandIndices b = S at h ⊢
    exact_mod_cast h
  have he : ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| ≤ (relaxedEnergyErrQ : ℝ) :=
    (sum_le_sum_of_subset_of_nonneg (bandIndices_subset b) fun p _ _ => abs_nonneg _).trans hclose
  have hw (p : ℕ × ℕ) : comparisonWeight p ^ 2 ≤ 1 :=
    pow_le_one₀ (comparisonWeight_bounds p).1 (comparisonWeight_bounds p).2
  calc
    _ ≤ ∑ p ∈ bandIndices b, ((energyTable p : ℝ) * comparisonWeight p ^ 2 +
        |EX p - (energyTable p : ℝ)|) := by
      refine sum_le_sum fun p _ => ?_
      have ha := mul_le_mul_of_nonneg_right (le_abs_self (EX p - (energyTable p : ℝ)))
        (sq_nonneg (comparisonWeight p))
      have hh := mul_le_of_le_one_right (abs_nonneg (EX p - (energyTable p : ℝ))) (hw p)
      nlinarith
    _ = (∑ p ∈ bandIndices b, (energyTable p : ℝ) * comparisonWeight p ^ 2) +
        ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| := sum_add_distrib
    _ ≤ (∑ p ∈ bandIndices b, (energyTable p : ℝ) * comparisonWeight p ^ 2) + (relaxedEnergyErrQ : ℝ) :=
      add_le_add le_rfl he
    _ ≤ ((b.norm : ℝ) + (relaxedRadiusQ : ℝ)) ^ 2 := by
      have hnorm : (0 : ℝ) ≤ (b.norm : ℝ) := by
        exact_mod_cast (comparison_facts.1 b hb).2.1
      have heps : (0 : ℝ) ≤ (relaxedRadiusQ : ℝ) := by norm_num [relaxedRadiusQ]
      have herror : (0 : ℝ) ≤ (energyErrQ : ℝ) := by norm_num [energyErrQ]
      have hsq : (relaxedEnergyErrQ : ℝ) ≤ (relaxedRadiusQ : ℝ) ^ 2 := by
        norm_num [relaxedEnergyErrQ, relaxedRadiusQ]
      nlinarith


/-- The same relaxed discrepancy controls the residual of the actual kernel head. -/
theorem head_of_relaxed_energy_close {EX : ℕ × ℕ → ℝ}
    (hparX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → EX p = 0)
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (relaxedEnergyErrQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (headCapQ : ℝ) + relaxedEnergyErrQ := by
  have h1 := Upper.head_residual_le primaryPoly auxPoly l1_primaryPoly l1_auxPoly auxPoly_coeff_zero EX
    (fun p => (energyTable p : ℝ)) hparX (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
  have h2 : ∑ j ∈ range 251, |∑ p ∈ headIdx 501,
      (energyTable p : ℝ) * (termOf primaryPoly auxPoly p).coeff j
        - if j = 0 then (slopeQ : ℝ) else 0| ≤ headCapQ := head_le_of_check head_check
  unfold kernelCoeff
  linarith

/-- A direct bound on the head of X and the weighted comparison bound control G's head. -/
theorem head_of_direct_head {E EX : ℕ × ℕ → ℝ}
    (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → E p = 0)
    (hparX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → EX p = 0)
    (hhead : ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (headCapQ : ℝ) + relaxedEnergyErrQ)
    (hcompare : ∑ p ∈ headIdx 501, comparisonWeight p * |E p - EX p| ≤
      (relaxedCompareQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (relaxedHeadResidualQ : ℝ) := by
  have hloc := Upper.head_residual_le_weighted primaryPoly auxPoly auxPoly_coeff_zero
    E EX hpar (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ) comparisonWeight
    (fun p _ => comparisonWeight_sound p)
  have heq : (∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, EX p * (termOf primaryPoly auxPoly p).coeff j -
        if j = 0 then (slopeQ : ℝ) else 0|) =
      ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| := by
    refine sum_congr rfl fun j hj => ?_
    rw [show kernelCoeff EX j = ∑ p ∈ headIdx 501,
      EX p * (termOf primaryPoly auxPoly p).coeff j from
      bivarKernel_eq_head primaryPoly auxPoly auxPoly_coeff_zero EX hparX
        (by have := mem_range.1 hj; omega)]
  rw [heq] at hloc
  have h := hloc.trans (add_le_add hhead hcompare)
  change (∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|)
    ≤ (headCapQ : ℝ) + relaxedEnergyErrQ + relaxedCompareQ at h
  calc _ ≤ (headCapQ : ℝ) + relaxedEnergyErrQ + relaxedCompareQ := h
    _ = (relaxedHeadResidualQ : ℝ) := by norm_num [relaxedHeadResidualQ]; ring

/-- The known Hardy tail bound only needs the actual head budget, not a table hypothesis. -/
theorem tail_of_direct_head {E : ℕ × ℕ → ℝ}
    (hhead : ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (relaxedHeadResidualQ : ℝ))
    (hhardy : ∀ J, ∑ n ∈ range J, kernelCoeff E n ^ 2 *
      (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4) :
    ∑' n, |kernelCoeff E (n + 251)| ≤ (relaxedTailQ : ℝ) := by
  have hz : |kernelCoeff E 0 - (slopeQ : ℝ)| ≤
      ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| := by
    simpa using (single_le_sum (fun j (_ : j ∈ range 251) =>
      abs_nonneg (kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0))
      (show 0 ∈ range 251 by simp))
  have hl : (relaxedLinearLowerQ : ℝ) ≤ kernelCoeff E 0 := by
    have ha := (abs_le.mp (hz.trans hhead)).1
    norm_num [relaxedLinearLowerQ] at ⊢
    linarith
  have hs := hardy_budget_after_linear (kernelCoeff E) (4149 / 4000 : ℝ) (7 / 4)
    (relaxedLinearLowerQ : ℝ) (by norm_num)
    (by norm_num [relaxedLinearLowerQ, relaxedHeadResidualQ, relaxedCompareQ, headCapQ, relaxedEnergyErrQ, slopeQ])
    hl hhardy
  have hb : ∀ J, ∑ n ∈ range J, kernelCoeff E (n + 1) ^ 2 *
      (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ (relaxedShiftedBudgetQ : ℝ) := by
    intro J
    simpa only [relaxedShiftedBudgetQ, Rat.cast_div, Rat.cast_sub, Rat.cast_pow, Rat.cast_ofNat,
      Rat.cast_mul] using hs J
  have ht := hardy_tail (fun n => kernelCoeff E (n + 1)) (4149 / 4000 : ℝ)
    (by norm_num) (relaxedShiftedBudgetQ : ℝ) hb 250 (relaxedTailQ : ℝ)
    (by norm_num [relaxedTailQ]) relaxed_tail_numeric
  simpa only [Nat.add_assoc, show 250 + 1 = 251 by norm_num] using ht

/-- Same conditional endpoint with direct band bounds and an actual-X head bound. -/
theorem fresh_upper_rounder_relaxed_direct_bounds {X : ℂ × ℂ → ℂ} (hXL : MemLp X 2 mu2)
    (hXch : ∀ c u, ‖c‖ = 1 → X (rot2 c u) = c * X u)
    (herrors : ComparisonInputs ((memLp_GT phiBound).toLp GT) (hXL.toLp X))
    (hband : ∀ j : ComparisonIndex,
      ∑ p ∈ bandIndices (comparisonBand j), comparisonWeight p ^ 2 * energy (hXL.toLp X) p ≤
        (((comparisonBand j).norm : ℝ) + (relaxedRadiusQ : ℝ)) ^ 2)
    (hhead : ∑ j ∈ range 251,
      |kernelCoeff (energy (hXL.toLp X)) j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) + relaxedEnergyErrQ) :
    IsGrothendieckBound (10000000000000 / 7119468837041) := by
  let E := energy ((memLp_GT phiBound).toLp GT)
  let EX := energy (hXL.toLp X)
  have hcompare : ∑ p ∈ headIdx 501, comparisonWeight p * |E p - EX p| ≤
      (relaxedCompareQ : ℝ) := localized_comparison_of_relaxed_band_bounds herrors hband
  obtain ⟨hv, hs, hsX, hpX⟩ := structural_fields measurable_GT (norm_GT_le phiBound)
    (fun _ u hc => GT_rot2 hc u) (memLp_GT phiBound) hXL hXch
  have hp : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → E p = 0 :=
    energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hc => GT_rot2 hc u)
  have hGhead := head_of_direct_head hp hpX hhead hcompare
  have htail := tail_of_direct_head hGhead (HardyReal.hardy_GT phiBound)
  have hgrouped : ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (relaxedHeadResidualQ : ℝ) := by
    have hloc := Upper.head_residual_le_weighted primaryPoly auxPoly auxPoly_coeff_zero
      E EX hp (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ) comparisonWeight
      (fun p _ => comparisonWeight_sound p)
    have heq : (∑ j ∈ range 251,
        |∑ p ∈ headIdx 501, EX p * (termOf primaryPoly auxPoly p).coeff j -
          if j = 0 then (slopeQ : ℝ) else 0|) =
        ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| := by
      refine sum_congr rfl fun j hj => ?_
      rw [show kernelCoeff EX j = ∑ p ∈ headIdx 501,
        EX p * (termOf primaryPoly auxPoly p).coeff j from
        bivarKernel_eq_head primaryPoly auxPoly auxPoly_coeff_zero EX hpX
          (by have := mem_range.1 hj; omega)]
    rw [heq] at hloc
    have hh := hloc.trans (add_le_add hhead hcompare)
    change (∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|)
      ≤ (headCapQ : ℝ) + relaxedEnergyErrQ + relaxedCompareQ at hh
    calc _ ≤ (headCapQ : ℝ) + relaxedEnergyErrQ + relaxedCompareQ := hh
      _ = (relaxedHeadResidualQ : ℝ) := by norm_num [relaxedHeadResidualQ]; ring
  have hsum := summable_kernelCoeff hs
  have hr : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 1426642000 / 1000000000000000 := by
    rw [residual_split (kernelCoeff E) hsum (slopeQ : ℝ) 250]
    have h := add_le_add hgrouped htail
    have e : (relaxedHeadResidualQ : ℝ) + relaxedTailQ =
        1426642000 / 1000000000000000 := by
      norm_num [relaxedHeadResidualQ, relaxedCompareQ, headCapQ, relaxedEnergyErrQ, relaxedTailQ]
    linarith
  refine (transfer (kernelCoeff E) hsum hv (by norm_num [slopeQ]) hr).mono (le_of_eq ?_)
  norm_num [slopeQ]

/-- The same explicit rounder with an enlarged, still assumed ℓ¹ energy discrepancy. -/
theorem fresh_upper_rounder_relaxed {X : ℂ × ℂ → ℂ} (hXL : MemLp X 2 mu2)
    (hXch : ∀ c u, ‖c‖ = 1 → X (rot2 c u) = c * X u)
    (herrors : ComparisonInputs ((memLp_GT phiBound).toLp GT) (hXL.toLp X))
    (hclose : ∑ p ∈ headIdx 501, |energy (hXL.toLp X) p - (energyTable p : ℝ)| ≤
      (relaxedEnergyErrQ : ℝ)) :
    IsGrothendieckBound (10000000000000 / 7119468837041) := by
  have hpX := energy_eq_zero_of_even hXL hXch
  apply fresh_upper_rounder_relaxed_direct_bounds hXL hXch herrors
  · intro j
    exact actual_band_mass_relaxed hclose (comparisonBand_mem j)
  · exact head_of_relaxed_energy_close hpX hclose

/-- Fix the production center; no Gaussian error estimate is hidden. -/
theorem fresh_upper_concrete_taylor_relaxed
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ))
    (hclose : ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤ (relaxedEnergyErrQ : ℝ)) :
    IsGrothendieckBound (10000000000000 / 7119468837041) :=
  fresh_upper_rounder_relaxed (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
    (comparisonInputs_taylorCenters hfirst hsecond hthird) hclose

/-- The conditional endpoint is strictly below the stated decimal. -/
theorem relaxed_upper_value_lt :
    (10000000000000 / 7119468837041 : ℝ) < 1.404599424 := by norm_num

end
end Grothe.UpperChaos
