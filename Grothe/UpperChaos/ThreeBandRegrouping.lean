import Grothe.Upper.ThreeBandBudget
import Grothe.UpperChaos.ConcreteTaylorUpper
import Lean.Util.CollectAxioms

/-!
# The actual seven-piece Taylor comparison

Source candidate for task #295. This file has not been compiled.

The three low bands have total-degree cutoffs 51, 51, 11. Each remaining
infinite high band is controlled by an independent whole-source error bound.
Only four unsplit sources enter the quadratic error. The old fourteen Gaussian
band premises do not occur in this interface.

The core abstracts the original phase bound and three original finite checker
equalities. They are discharged by unchanged production facts in the separate
adapter. This keeps the analytic core's intended trust boundary standard-three.
No finite checker equality here asserts a Gaussian approximation or final bound.

Agent-ID: codex-2ca4
-/

open MeasureTheory Finset Grothe.Upper GrotheKernel
open scoped InnerProductSpace

set_option warningAsError true

namespace Grothe.UpperChaos.ThreeBandRegrouping
noncomputable section

/-- Exact finite inputs already used by the original comparison and rounding. -/
structure OriginalFiniteChecks : Prop where
  within : tabWithin 501 energyRows = true
  comparison : comparisonOK (weightedRows energyRows comparisonWeightQ)
    comparisonBands energyErrQ comparisonTriangleQ = true
  rounding : PackedDyadic.gradedIntegerSum 91
    (fun q c d => roundingScaledCoeff q c d ^ 2) = roundingIntegerEnergy

/-- The original positive Taylor power, with its phase proof abstracted. -/
def taylorL2 (hφ : PhiBound) (j : ℕ) : Lp ℂ 2 mu2 :=
  (chargeFn_hpow hφ j).memLp.toLp (hpow j)

/-- The four original unsmoothed sources, with factorials already included. -/
def rawSource (hφ : PhiBound) (p : Fin 4) : Lp ℂ 2 mu2 :=
  (chargeFn_srcP hφ chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn p).memLp.toLp
      (srcP frozenCorrectionFn firstCenterFn secondCenterFn thirdCenterFn p)

/-- The actual four smoothed source errors. -/
def source (hφ : PhiBound) (p : Fin 4) : Lp ℂ 2 mu2 := smoothOp (rawSource hφ p)

def productionG (hφ : PhiBound) : Lp ℂ 2 mu2 := (memLp_GT hφ).toLp GT

def productionX (hφ : PhiBound) : Lp ℂ 2 mu2 :=
  (memLp_Xfun hφ chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)

/-- A new comparison piece retains the power of its original source. -/
def threeBandPower : Fin 7 → Fin 4
  | 0 => 0
  | 1 => 1
  | 2 => 1
  | 3 => 2
  | 4 => 2
  | _ => 3

def threePiece (hφ : PhiBound) (j : Fin 7) : Lp ℂ 2 mu2 :=
  bandProj (threeBandBands j) (source hφ (threeBandPower j))

/-- The retained band of each source containing a positive total degree. -/
def threeBandOf : Fin 4 → ℕ → Fin 7
  | 0, _ => 0
  | 1, d => if d ≤ 51 then 1 else 2
  | 2, d => if d ≤ 51 then 3 else 4
  | _, d => if d ≤ 11 then 5 else 6

theorem threeBandOf_spec (p : Fin 4) {n m : ℕ} (hd : 1 ≤ n + m) :
    threeBandPower (threeBandOf p (n + m)) = p ∧
      (threeBandBands (threeBandOf p (n + m))).contains n m = true := by
  fin_cases p
  · refine ⟨rfl, ?_⟩
    rw [contains_iff]
    change 0 < n + m ∧ ((0 : ℕ) = 0 ∨ n + m ≤ 0)
    exact ⟨by omega, Or.inl rfl⟩
  · change threeBandPower (threeBandOf 1 (n + m)) = 1 ∧
      (threeBandBands (threeBandOf 1 (n + m))).contains n m = true
    by_cases h : n + m ≤ 51
    · rw [show threeBandOf 1 (n + m) = 1 by simp [threeBandOf, h]]
      refine ⟨rfl, ?_⟩
      rw [contains_iff]
      change 0 < n + m ∧ ((51 : ℕ) = 0 ∨ n + m ≤ 51)
      exact ⟨by omega, Or.inr h⟩
    · rw [show threeBandOf 1 (n + m) = 2 by simp [threeBandOf, h]]
      refine ⟨rfl, ?_⟩
      rw [contains_iff]
      change 51 < n + m ∧ ((0 : ℕ) = 0 ∨ n + m ≤ 0)
      exact ⟨by omega, Or.inl rfl⟩
  · change threeBandPower (threeBandOf 2 (n + m)) = 2 ∧
      (threeBandBands (threeBandOf 2 (n + m))).contains n m = true
    by_cases h : n + m ≤ 51
    · rw [show threeBandOf 2 (n + m) = 3 by simp [threeBandOf, h]]
      refine ⟨rfl, ?_⟩
      rw [contains_iff]
      change 0 < n + m ∧ ((51 : ℕ) = 0 ∨ n + m ≤ 51)
      exact ⟨by omega, Or.inr h⟩
    · rw [show threeBandOf 2 (n + m) = 4 by simp [threeBandOf, h]]
      refine ⟨rfl, ?_⟩
      rw [contains_iff]
      change 51 < n + m ∧ ((0 : ℕ) = 0 ∨ n + m ≤ 0)
      exact ⟨by omega, Or.inl rfl⟩
  · change threeBandPower (threeBandOf 3 (n + m)) = 3 ∧
      (threeBandBands (threeBandOf 3 (n + m))).contains n m = true
    by_cases h : n + m ≤ 11
    · rw [show threeBandOf 3 (n + m) = 5 by simp [threeBandOf, h]]
      refine ⟨rfl, ?_⟩
      rw [contains_iff]
      change 0 < n + m ∧ ((11 : ℕ) = 0 ∨ n + m ≤ 11)
      exact ⟨by omega, Or.inr h⟩
    · rw [show threeBandOf 3 (n + m) = 6 by simp [threeBandOf, h]]
      refine ⟨rfl, ?_⟩
      rw [contains_iff]
      change 11 < n + m ∧ ((0 : ℕ) = 0 ∨ n + m ≤ 0)
      exact ⟨by omega, Or.inl rfl⟩

theorem threeBands_disjoint : ∀ j k : Fin 7,
    threeBandPower j = threeBandPower k → j ≠ k →
      ((threeBandBands j).hi ≠ 0 ∧ (threeBandBands j).hi ≤ (threeBandBands k).lo) ∨
      ((threeBandBands k).hi ≠ 0 ∧ (threeBandBands k).hi ≤ (threeBandBands j).lo) := by
  decide +kernel

theorem threeBand_unique {j k : Fin 7} (hp : threeBandPower j = threeBandPower k)
    {n m : ℕ} (hj : (threeBandBands j).contains n m = true)
    (hk : (threeBandBands k).contains n m = true) : j = k := by
  by_contra hne
  rw [contains_iff] at hj hk
  rcases threeBands_disjoint j k hp hne with h | h <;> omega

/-- Zero-mode exclusion is inherited from the actual charge-one sources. -/
theorem inner_idx0_source (hφ : PhiBound) (p : Fin 4) :
    ⟪hvec2 idx0, source hφ p⟫_ℂ = 0 :=
  inner_idx0_srcL hφ chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn p

/-- The low and full infinite high band sum to their original smoothed source. -/
theorem sum_threePiece_fiber (hφ : PhiBound) (p : Fin 4) :
    ∑ j ∈ (univ : Finset (Fin 7)).filter (fun j => threeBandPower j = p),
      threePiece hφ j = source hφ p := by
  classical
  rw [sum_congr rfl (g := fun j => projOn (bandModes (threeBandBands j)) (source hφ p))
    (fun j hj => by rw [threePiece, (mem_filter.1 hj).2]; rfl)]
  refine sum_projOn _ (fun j => bandModes (threeBandBands j)) _
    (fun i hi => ?_) (fun i j hj k hk hij hik => ?_)
  · have hd : 1 ≤ (bideg i).1 + (bideg i).2 := by
      by_contra hzero
      exact hi (by
        rw [bideg_eq_idx0 (i := i) (by omega)]
        exact inner_idx0_source hφ p)
    obtain ⟨hp, hb⟩ := threeBandOf_spec p hd
    exact ⟨threeBandOf p ((bideg i).1 + (bideg i).2), ⟨mem_filter.2 ⟨mem_univ _, hp⟩, hb⟩,
      fun k hk => threeBand_unique ((mem_filter.1 hk.1).2.trans hp.symm) hk.2 hb⟩
  · exact threeBand_unique ((mem_filter.1 hj).2.trans (mem_filter.1 hk).2.symm) hij hik

/-- The original decomposition is also the sum of its four unsplit sources. -/
theorem difference_sources (hφ : PhiBound) :
    productionG hφ - productionX hφ = ∑ p : Fin 4, source hφ p := by
  have h := difference_pieces hφ chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn
  rw [← sum_fiberwise univ pw
    (piece hφ chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn)] at h
  simpa only [sum_pieces_fiber, productionG, productionX, source, rawSource, srcL] using h

/-- The seven new pieces still give the actual difference, including infinite tails. -/
theorem difference_threePieces (hφ : PhiBound) :
    productionG hφ - productionX hφ = ∑ j : Fin 7, threePiece hφ j := by
  rw [← sum_fiberwise univ threeBandPower (threePiece hφ)]
  simp only [sum_threePiece_fiber]
  exact difference_sources hφ

theorem threePiece_support (hφ : PhiBound) (j : Fin 7) (p : ℕ × ℕ)
    (hp : (threeBandBands j).contains p.1 p.2 = false) :
    energy (threePiece hφ j) p = 0 :=
  energy_bandProj_eq_zero _ _ p hp

/-- The old table bands, regrouped without referring to their error bounds. -/
theorem old_group_power : ∀ k : ComparisonIndex,
    threeBandPower (threeBandOldGroup k) = pw k := by
  decide +kernel

theorem threeBand_contains_iff (j : Fin 7) (n m : ℕ) :
    (threeBandBands j).contains n m = true ↔
      ∃ k : ComparisonIndex, threeBandOldGroup k = j ∧
        (comparisonBand k).contains n m = true := by
  change (threeBandBands j).contains n m = true ↔
    ∃ k : Fin 18, threeBandOldGroup k = j ∧ comparisonBands[k].contains n m = true
  fin_cases j <;>
    simp [Fin.exists_fin_succ, threeBandOldGroup, threeBandBands, comparisonBands,
      ComparisonBand.contains] <;> omega

theorem threeBand_indices_union (j : Fin 7) :
    bandIndices (threeBandBands j) =
      ((univ : Finset (Fin 18)).filter (fun k => threeBandOldGroup k = j)).biUnion
        (fun k => bandIndices (comparisonBand k)) := by
  classical
  unfold bandIndices
  generalize headIdx 501 = S
  ext p
  constructor
  · intro hp
    obtain ⟨hS, hj⟩ := mem_filter.1 hp
    obtain ⟨k, hk, hb⟩ := (threeBand_contains_iff j p.1 p.2).1 hj
    exact mem_biUnion.2 ⟨k, mem_filter.2 ⟨mem_univ _, hk⟩, mem_filter.2 ⟨hS, hb⟩⟩
  · intro hp
    obtain ⟨k, hk, hb⟩ := mem_biUnion.1 hp
    obtain ⟨hS, hb⟩ := mem_filter.1 hb
    exact mem_filter.2 ⟨hS,
      (threeBand_contains_iff j p.1 p.2).2 ⟨k, (mem_filter.1 hk).2, hb⟩⟩

theorem old_group_indices_disjoint (j : Fin 7) :
    (↑((univ : Finset (Fin 18)).filter (fun k => threeBandOldGroup k = j)) :
        Set (Fin 18)).PairwiseDisjoint
      (fun k : Fin 18 => bandIndices (comparisonBand k)) := by
  unfold bandIndices
  generalize headIdx 501 = S
  intro k hk l hl hkl
  refine Finset.disjoint_left.2 fun p hp hq => ?_
  have hk' : threeBandOldGroup k = j := (mem_filter.1 hk).2
  have hl' : threeBandOldGroup l = j := (mem_filter.1 hl).2
  have hpw : pw k = pw l := by
    rw [← old_group_power k, ← old_group_power l, hk', hl']
  exact hkl (band_unique hpw (mem_filter.1 hp).2 (mem_filter.1 hq).2)

/-- The original finite checker implies precisely its arithmetic mass facts. -/
theorem original_mass_facts (hf : OriginalFiniteChecks) :
    ∀ b ∈ comparisonBands, 0 ≤ b.error ∧ 0 ≤ b.norm ∧
      comparisonMass (weightedRows energyRows comparisonWeightQ) b + energyErrQ ≤ b.norm ^ 2 := by
  have h :
      (∀ b ∈ comparisonBands, 0 ≤ b.error ∧ 0 ≤ b.norm ∧
        comparisonMass (weightedRows energyRows comparisonWeightQ) b + energyErrQ ≤ b.norm ^ 2) ∧
      2 * (comparisonBands.map fun b => b.norm * b.error).sum +
        (comparisonBands.map fun b => b.error).sum ^ 2 ≤ comparisonTriangleQ := by
    simpa only [comparisonOK, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq,
      and_assoc] using hf.comparison
  exact h.1

/-- The old per-band mass lemma, with its original finite inputs exposed. -/
theorem actual_band_mass_of_checks (hf : OriginalFiniteChecks) {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    {b : ComparisonBand} (hb : b ∈ comparisonBands) :
    ∑ p ∈ bandIndices b, comparisonWeight p ^ 2 * EX p ≤ (b.norm : ℝ) ^ 2 := by
  have hm : (∑ p ∈ bandIndices b, (energyTable p : ℝ) * comparisonWeight p ^ 2) +
      (energyErrQ : ℝ) ≤ (b.norm : ℝ) ^ 2 := by
    have h := (original_mass_facts hf b hb).2.2
    rw [comparisonMass_weighted_sum hf.within] at h
    change (∑ p ∈ bandIndices b, tabVal energyRows p * comparisonWeightQ p.1 p.2 ^ 2) +
      energyErrQ ≤ b.norm ^ 2 at h
    change (∑ p ∈ bandIndices b, (tabVal energyRows p : ℝ) *
      (comparisonWeightQ p.1 p.2 : ℝ) ^ 2) + (energyErrQ : ℝ) ≤ (b.norm : ℝ) ^ 2
    generalize hS : bandIndices b = S at h ⊢
    exact_mod_cast h
  have he : ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) :=
    (sum_le_sum_of_subset_of_nonneg (bandIndices_subset b)
      fun p _ _ => abs_nonneg _).trans hclose
  have hw (p : ℕ × ℕ) : comparisonWeight p ^ 2 ≤ 1 :=
    pow_le_one₀ (comparisonWeight_bounds p).1 (comparisonWeight_bounds p).2
  calc
    _ ≤ ∑ p ∈ bandIndices b, ((energyTable p : ℝ) * comparisonWeight p ^ 2 +
        |EX p - (energyTable p : ℝ)|) := by
      refine sum_le_sum fun p _ => ?_
      have ha := mul_le_mul_of_nonneg_right
        (le_abs_self (EX p - (energyTable p : ℝ))) (sq_nonneg (comparisonWeight p))
      have hh := mul_le_of_le_one_right (abs_nonneg (EX p - (energyTable p : ℝ))) (hw p)
      nlinarith
    _ = (∑ p ∈ bandIndices b, (energyTable p : ℝ) * comparisonWeight p ^ 2) +
        ∑ p ∈ bandIndices b, |EX p - (energyTable p : ℝ)| := sum_add_distrib
    _ ≤ (∑ p ∈ bandIndices b, (energyTable p : ℝ) * comparisonWeight p ^ 2) +
        (energyErrQ : ℝ) := add_le_add le_rfl he
    _ ≤ (b.norm : ℝ) ^ 2 := hm

/-- Each high mass is the union of all original high bands, including its last tail. -/
theorem actual_threeBand_mass (hf : OriginalFiniteChecks) {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    (j : Fin 7) :
    ∑ p ∈ bandIndices (threeBandBands j), comparisonWeight p ^ 2 * EX p ≤
      ((threeBandBands j).norm : ℝ) ^ 2 := by
  classical
  rw [threeBand_indices_union, sum_biUnion (old_group_indices_disjoint j)]
  calc
    _ ≤ ∑ k ∈ (univ : Finset (Fin 18)).filter (fun k => threeBandOldGroup k = j),
        ((comparisonBand k).norm : ℝ) ^ 2 :=
      sum_le_sum fun k _ => actual_band_mass_of_checks hf hclose (comparisonBand_mem k)
    _ ≤ ((threeBandBands j).norm : ℝ) ^ 2 := by
      rw [sum_filter]
      have h := threeBand_mass_caps j
      change (∑ k : Fin 18, if threeBandOldGroup k = j then
        (comparisonBands[k].norm : ℝ) ^ 2 else 0) ≤ ((threeBandBands j).norm : ℝ) ^ 2
      have h' := (Rat.cast_le (K := ℝ)).mpr h
      simpa only [Rat.cast_sum, apply_ite (fun q : ℚ => (q : ℝ)), Rat.cast_zero, Rat.cast_pow] using h'

/-- The original rounding norm proof, with its exact finite fold exposed. -/
theorem norm_roundingDifference_le_of_checks (hf : OriginalFiniteChecks) :
    ‖roundingDifference‖ ≤ (comparisonGroupRadiusQ 0 : ℝ) := by
  have he : ‖roundingDifference‖ ^ 2 =
      (((roundingIntegerEnergy : ℚ) / (6 * (2 : ℚ) ^ 206) ^ 2 : ℚ) : ℝ) := by
    rw [roundingDifference_eq, norm_gradedHermite_sq_cast]
    apply congrArg (fun r : ℚ => (r : ℝ))
    simp_rw [roundingCoeff, div_pow]
    simp only [div_eq_mul_inv, ← Finset.sum_mul, ← Int.cast_pow, ← Int.cast_sum]
    rw [← PackedDyadic.gradedIntegerSum_eq, hf.rounding]
  have hq : (roundingIntegerEnergy : ℚ) / (6 * (2 : ℚ) ^ 206) ^ 2 ≤
      comparisonGroupRadiusQ 0 ^ 2 := by
    decide +kernel
  have hr : (((roundingIntegerEnergy : ℚ) / (6 * (2 : ℚ) ^ 206) ^ 2 : ℚ) : ℝ) ≤
      (comparisonGroupRadiusQ 0 : ℝ) ^ 2 := by exact_mod_cast hq
  have hn : (0 : ℝ) ≤ comparisonGroupRadiusQ 0 := by norm_num [comparisonGroupRadiusQ]
  nlinarith [norm_nonneg roundingDifference]

theorem rawSource_zero (hφ : PhiBound) : rawSource hφ 0 = roundingDifference := by
  let hs := ((chargeFn_firstCenterFn.memLp.add
    (chargeFn_secondCenterFn.memLp.const_smul (1 / 2 : ℂ))).add
      (chargeFn_thirdCenterFn.memLp.const_smul (1 / 6 : ℂ))).sub chargeFn_frozenCorrectionFn.memLp
  have h : rawSource hφ 0 = hs.toLp
      (firstCenterFn + (1 / 2 : ℂ) • secondCenterFn +
        (1 / 6 : ℂ) • thirdCenterFn - frozenCorrectionFn) := by
    apply (MemLp.toLp_eq_toLp_iff _ _).mpr
    exact Filter.Eventually.of_forall fun u => by
      simp only [srcP, Pi.smul_apply, Pi.add_apply, Pi.sub_apply, smul_eq_mul]
      ring
  have hh : hs.toLp (firstCenterFn + (1 / 2 : ℂ) • secondCenterFn +
      (1 / 6 : ℂ) • thirdCenterFn - frozenCorrectionFn) =
      chargeFn_firstCenterFn.memLp.toLp firstCenterFn +
      (1 / 2 : ℂ) • chargeFn_secondCenterFn.memLp.toLp secondCenterFn +
      (1 / 6 : ℂ) • chargeFn_thirdCenterFn.memLp.toLp thirdCenterFn -
      chargeFn_frozenCorrectionFn.memLp.toLp frozenCorrectionFn := rfl
  rw [hh, toLp_firstCenterFn, toLp_secondCenterFn, toLp_thirdCenterFn,
    toLp_frozenCorrectionFn] at h
  simpa only [roundingDifference, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using h

theorem rawSource_one (hφ : PhiBound) :
    rawSource hφ 1 = taylorL2 hφ 1 - firstCenter := by
  have h : rawSource hφ 1 = taylorL2 hφ 1 -
      chargeFn_firstCenterFn.memLp.toLp firstCenterFn := rfl
  rwa [toLp_firstCenterFn] at h

private theorem toLp_div_sub_generic {f g : ℂ × ℂ → ℂ}
    (hf : MemLp f 2 mu2) (hg : MemLp g 2 mu2) (a : ℂ)
    (hs : MemLp (fun u => (f u - g u) / a) 2 mu2) :
    hs.toLp (fun u => (f u - g u) / a) =
      (1 / a : ℂ) • (hf.toLp f - hg.toLp g) := by
  let ht := (hf.sub hg).const_smul (1 / a : ℂ)
  calc
    hs.toLp (fun u => (f u - g u) / a) = ht.toLp ((1 / a : ℂ) • (f - g)) := by
      apply (MemLp.toLp_eq_toLp_iff _ _).mpr
      exact Filter.Eventually.of_forall fun u => by
        simp only [Pi.smul_apply, Pi.sub_apply, smul_eq_mul, div_eq_mul_inv]
        ring
    _ = (1 / a : ℂ) • (hf.toLp f - hg.toLp g) := rfl

theorem rawSource_two (hφ : PhiBound) :
    rawSource hφ 2 = (1 / 2 : ℂ) • (taylorL2 hφ 2 - secondCenter) := by
  have h := toLp_div_sub_generic (chargeFn_hpow hφ 2).memLp
    chargeFn_secondCenterFn.memLp (2 : ℂ)
    (chargeFn_srcP hφ chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 2).memLp
  rwa [toLp_secondCenterFn] at h

theorem rawSource_three (hφ : PhiBound) :
    rawSource hφ 3 = (1 / 6 : ℂ) • (taylorL2 hφ 3 - thirdCenter) := by
  have h := toLp_div_sub_generic (chargeFn_hpow hφ 3).memLp
    chargeFn_thirdCenterFn.memLp (6 : ℂ)
    (chargeFn_srcP hφ chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 3).memLp
  rwa [toLp_thirdCenterFn] at h

section Inputs

variable (hφ : PhiBound) (hf : OriginalFiniteChecks)
  (hfirst : ‖projOn (firstCenterBandModes 0) (taylorL2 hφ 1 - firstCenter)‖ ≤
    (firstCapturedErrorQ 0 : ℝ))
  (hsecond : ‖projOn (secondCenterBandModes 0) (taylorL2 hφ 2 - secondCenter)‖ ≤
    (secondCapturedErrorQ 0 : ℝ))
  (hthird : ‖projOn (thirdCenterBandModes 0) (taylorL2 hφ 3 - thirdCenter)‖ ≤
    (thirdCapturedErrorQ 0 : ℝ))
  (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ))
  (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ))
  (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ))

include hf hwholeFirst hwholeSecond hwholeThird

/-- Four whole-source radii; low errors do not get added to these radii again. -/
theorem norm_source_le (p : Fin 4) :
    ‖source hφ p‖ ≤ (comparisonGroupRadiusQ p : ℝ) := by
  refine (norm_smoothOp_le _).trans ?_
  fin_cases p
  · change ‖rawSource hφ 0‖ ≤ (comparisonGroupRadiusQ 0 : ℝ)
    rw [rawSource_zero]
    exact norm_roundingDifference_le_of_checks hf
  · change ‖rawSource hφ 1‖ ≤ (comparisonGroupRadiusQ 1 : ℝ)
    rw [rawSource_one]
    exact hwholeFirst
  · change ‖rawSource hφ 2‖ ≤ (comparisonGroupRadiusQ 2 : ℝ)
    rw [rawSource_two, norm_smul]
    have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    linarith
  · change ‖rawSource hφ 3‖ ≤ (comparisonGroupRadiusQ 3 : ℝ)
    rw [rawSource_three, norm_smul]
    have hscale : ‖(1 / 6 : ℂ)‖ = (1 / 6 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    linarith

theorem norm_threePiece_whole_le (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (comparisonGroupRadiusQ (threeBandPower j) : ℝ) :=
  ((modeSpace (bandModes (threeBandBands j))).norm_starProjection_apply_le _).trans
    (norm_source_le hφ hf hwholeFirst hwholeSecond hwholeThird _)

include hfirst hsecond hthird in
/-- The seven linear pieces use three low errors and three independent whole errors. -/
theorem norm_threePiece_le (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ ((threeBandBands j).error : ℝ) := by
  fin_cases j
  · simpa [threeBandBands, threeBandPower, comparisonGroupRadiusQ, comparisonBands] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 0
  · change ‖bandProj (comparisonBand (firstCapturedIndex 0))
        (smoothOp (rawSource hφ 1))‖ ≤ ((comparisonBand (firstCapturedIndex 0)).error : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_one]
    change ‖projOn (bandModes (comparisonBand (firstCapturedIndex 0)))
      (taylorL2 hφ 1 - firstCenter)‖ ≤ _
    rw [← firstCenterBandModes_eq_comparison]
    exact hfirst.trans (by exact_mod_cast firstCapturedErrorQ_le_public 0)
  · simpa [threeBandBands, threeBandPower, threeBandScaledRQ] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 2
  · change ‖bandProj (comparisonBand (secondCapturedIndex 0))
        (smoothOp (rawSource hφ 2))‖ ≤ ((comparisonBand (secondCapturedIndex 0)).error : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_two]
    change ‖projOn (bandModes (comparisonBand (secondCapturedIndex 0)))
      ((1 / 2 : ℂ) • (taylorL2 hφ 2 - secondCenter))‖ ≤ _
    rw [map_smul, norm_smul, ← secondCenterBandModes_eq_comparison]
    have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    have hq : (secondCapturedErrorQ 0 : ℝ) ≤
        2 * ((comparisonBand (secondCapturedIndex 0)).error : ℝ) := by
      exact_mod_cast secondCapturedErrorQ_le_public 0
    linarith
  · simpa [threeBandBands, threeBandPower, threeBandScaledRQ] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 4
  · change ‖bandProj (comparisonBand (thirdCapturedIndex 0))
        (smoothOp (rawSource hφ 3))‖ ≤ ((comparisonBand (thirdCapturedIndex 0)).error : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_three]
    change ‖projOn (bandModes (comparisonBand (thirdCapturedIndex 0)))
      ((1 / 6 : ℂ) • (taylorL2 hφ 3 - thirdCenter))‖ ≤ _
    rw [map_smul, norm_smul, ← thirdCenterBandModes_eq_comparison]
    have hscale : ‖(1 / 6 : ℂ)‖ = (1 / 6 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    have hq : (thirdCapturedErrorQ 0 : ℝ) ≤
        6 * ((comparisonBand (thirdCapturedIndex 0)).error : ℝ) := by
      exact_mod_cast thirdCapturedErrorQ_le_public 0
    linarith
  · simpa [threeBandBands, threeBandPower, threeBandScaledRQ] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 6

/-- One quadratic cost, obtained from four unsplit sources and finite Bessel. -/
theorem quadratic_threeBand_le :
    ∑ p ∈ headIdx 501, ‖energyBlock (productionG hφ) p -
      energyBlock (productionX hφ) p‖ ^ 2 ≤
      (∑ g : Fin 4, (comparisonGroupRadiusQ g : ℝ)) ^ 2 := by
  generalize headIdx 501 = S
  have hn : ‖productionG hφ - productionX hφ‖ ≤
      ∑ g : Fin 4, (comparisonGroupRadiusQ g : ℝ) := by
    rw [difference_sources]
    exact (norm_sum_le _ _).trans
      (sum_le_sum fun g _ => norm_source_le hφ hf hwholeFirst hwholeSecond hwholeThird g)
  calc
    _ = ∑ p ∈ S, energy (productionG hφ - productionX hφ) p :=
      sum_congr rfl fun p _ => by rw [← energyBlock_sub, norm_energyBlock_sq]
    _ ≤ ‖productionG hφ - productionX hφ‖ ^ 2 := energy_sum_le_norm_sq _ _
    _ ≤ _ := pow_le_pow_left₀ (norm_nonneg _) hn 2

include hfirst hsecond hthird in
/-- Conditional actual comparison with no old high-band Gaussian premises. -/
theorem localized_comparison_three_band_of_checks
    (hclose : ∑ p ∈ headIdx 501,
      |energy (productionX hφ) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501, comparisonWeight p *
      |energy (productionG hφ) p - energy (productionX hφ) p| ≤ (threeBandCompareQ : ℝ) := by
  classical
  generalize hS : headIdx 501 = S at hclose ⊢
  let a : Fin 7 → ℝ := fun j => ((threeBandBands j).norm : ℝ)
  let e : Fin 7 → ℝ := fun j => ((threeBandBands j).error : ℝ)
  have ha (j : Fin 7) : 0 ≤ a j := Rat.cast_nonneg.mpr (threeBand_nonneg j).1
  have he (j : Fin 7) : 0 ≤ e j := Rat.cast_nonneg.mpr (threeBand_nonneg j).2
  have hz (j : Fin 7) (p : ℕ × ℕ)
      (hp : (threeBandBands j).contains p.1 p.2 = false) :
      energyBlock (threePiece hφ j) p = 0 := by
    have hh : ‖energyBlock (threePiece hφ j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (threePiece_support hφ j p hp)
    exact norm_eq_zero.mp ((pow_eq_zero_iff two_ne_zero).mp hh)
  have hc := BandComparison.weighted_compare S (univ : Finset (Fin 7))
    comparisonWeight (energyBlock (productionX hφ)) (energyBlock (productionG hφ))
    (fun j => energyBlock (threePiece hφ j)) (fun j => bandIndices (threeBandBands j))
    a e ((∑ g : Fin 4, (comparisonGroupRadiusQ g : ℝ)) ^ 2)
    (fun p _ => comparisonWeight_bounds p)
    (fun p _ => by rw [← energyBlock_sub, difference_threePieces, energyBlock_sum])
    (fun j _ p hp hpb => by
      have hn : (threeBandBands j).contains p.1 p.2 = false := by
        simpa [bandIndices, hS, hp] using hpb
      exact hz j p hn)
    (fun j _ => ha j) (fun j _ => he j)
    (fun j _ => by
      have hm := actual_threeBand_mass hf (by simpa only [hS] using hclose) j
      have hi : S ∩ bandIndices (threeBandBands j) = bandIndices (threeBandBands j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hm)
    (fun j _ => by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _)
          (norm_threePiece_le hφ hf hfirst hsecond hthird
            hwholeFirst hwholeSecond hwholeThird j) 2))
    (by simpa only [hS] using
      quadratic_threeBand_le hφ hf hwholeFirst hwholeSecond hwholeThird)
  simp_rw [norm_energyBlock_sq] at hc
  have hq : 2 * (∑ j : Fin 7, a j * e j) +
      (∑ g : Fin 4, (comparisonGroupRadiusQ g : ℝ)) ^ 2 = (threeBandCompareQ : ℝ) := by
    simp only [threeBandCompareQ, threeBandLinearQ, threeBandQuadraticQ, a, e,
      Rat.cast_add, Rat.cast_mul, Rat.cast_sum,
      Rat.cast_pow, Rat.cast_ofNat]
  exact hc.trans_eq hq

end Inputs

open Lean Elab Command
run_cmd do
  for target in #[``OriginalFiniteChecks, ``taylorL2, ``rawSource, ``source,
      ``productionG, ``productionX, ``threeBandPower, ``threePiece, ``threeBandOf,
      ``threeBandOf_spec, ``threeBands_disjoint, ``threeBand_unique,
      ``inner_idx0_source, ``sum_threePiece_fiber, ``difference_sources,
      ``difference_threePieces, ``threePiece_support, ``old_group_power,
      ``threeBand_contains_iff, ``threeBand_indices_union, ``old_group_indices_disjoint,
      ``original_mass_facts, ``actual_band_mass_of_checks, ``actual_threeBand_mass,
      ``norm_roundingDifference_le_of_checks, ``rawSource_zero, ``rawSource_one,
      ``rawSource_two, ``rawSource_three, ``norm_source_le, ``norm_threePiece_whole_le,
      ``norm_threePiece_le, ``quadratic_threeBand_le,
      ``localized_comparison_three_band_of_checks] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.ThreeBandRegrouping
