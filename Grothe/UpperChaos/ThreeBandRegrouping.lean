import Grothe.Upper.ThreeBandBudget
import Grothe.UpperChaos.FirstSecondCapturedTail
import Lean.Util.CollectAxioms

/-!
# Seven Taylor pieces and four whole sources

The positive bidegrees of each Taylor source split at total degree 51, 51 or 11.
The projections recover the source and their four source sums give the actual
difference between the GT and reference functions.

Original decomposition by codex-2ca4. Mixture integration by codex-a7c4.
-/

open MeasureTheory Finset Grothe.Upper GrotheKernel
open scoped InnerProductSpace

set_option warningAsError true

namespace Grothe.UpperChaos.ThreeBandRegrouping
noncomputable section

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

open Lean Elab Command
run_cmd do
  for target in #[``taylorL2, ``rawSource, ``source, ``productionG, ``productionX,
      ``threeBandPower, ``threePiece, ``threeBandOf, ``threeBandOf_spec,
      ``threeBands_disjoint, ``threeBand_unique, ``inner_idx0_source, ``sum_threePiece_fiber,
      ``difference_sources, ``difference_threePieces, ``threePiece_support, ``rawSource_zero,
      ``rawSource_one, ``rawSource_two, ``rawSource_three] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.ThreeBandRegrouping
