import Grothe.UpperChaos.ProfileAdaptiveSource
import Grothe.UpperChaos.QuadraturePartition

/-!
# Exact coefficients for finitely many shortened radial intervals

The numerical cover selects disjoint half-open radial intervals. Their
auxiliary corrections are differences of the existing compact sources, so
the original Gaussian pairing is exactly a finite combination of proved
rectangle integrals. No additional Gaussian or Fubini premise is introduced.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

/-- A radial shell is the difference of two compact sources, including its
boundary convention exactly. -/
theorem indicator_radialInterval_finiteLaplace (η T a b : ℝ) (hab : a ≤ b) (j : ℕ) :
    (profileRadialRegion (Ioc a b)).indicator (finiteLaplaceHpow η T j) =
      compactLaplaceHpow η T b j - compactLaplaceHpow η T a j := by
  funext u
  by_cases ha : ‖u.1‖ ^ 2 ≤ a
  · have hb := ha.trans hab
    simp [profileRadialRegion, compactLaplaceHpow, TaylorRadialTail.cutoffSet,
      not_lt.mpr ha, not_lt.mpr hb]
  · have ha' : a < ‖u.1‖ ^ 2 := lt_of_not_ge ha
    by_cases hb : ‖u.1‖ ^ 2 ≤ b
    · simp [profileRadialRegion, compactLaplaceHpow, TaylorRadialTail.cutoffSet,
        ha', hb, not_lt.mpr hb]
    · have hb' : b < ‖u.1‖ ^ 2 := lt_of_not_ge hb
      simp [profileRadialRegion, compactLaplaceHpow, TaylorRadialTail.cutoffSet,
        ha', hb, hb']

/-- The removed radial shell consists of four finite compact sources. -/
theorem profileAuxiliaryCorrection_interval_eq (a b : ℝ) (hab : a ≤ b) (j : ℕ) :
    profileAuxiliaryCorrection (profileRadialRegion (Ioc a b)) j =
      (compactLaplaceHpow finiteLaplaceEta finiteLaplaceCutoff b j -
        compactLaplaceHpow finiteLaplaceEta finiteLaplaceCutoff a j) -
      (compactLaplaceHpow finiteLaplaceEta 10000 b j -
        compactLaplaceHpow finiteLaplaceEta 10000 a j) := by
  have he : finiteLaplaceTailError finiteLaplaceEta 10000 j -
      finiteLaplaceTailError finiteLaplaceEta finiteLaplaceCutoff j =
      finiteLaplaceHpow finiteLaplaceEta finiteLaplaceCutoff j -
        finiteLaplaceHpow finiteLaplaceEta 10000 j := by
    funext u
    simp only [finiteLaplaceTailError, Pi.sub_apply]
    abel
  rw [profileAuxiliaryCorrection, he, Set.indicator_sub',
    indicator_radialInterval_finiteLaplace _ _ _ _ hab,
    indicator_radialInterval_finiteLaplace _ _ _ _ hab]

/-- A finite union of radial intervals chosen by the numerical certificate. -/
def profileIntervalUnion {ι : Type*} (I : Finset ι) (a b : ι → ℝ) : Set (ℂ × ℂ) :=
  ⋃ i ∈ I, profileRadialRegion (Ioc (a i) (b i))

lemma measurableSet_profileIntervalUnion {ι : Type*} (I : Finset ι) (a b : ι → ℝ) :
    MeasurableSet (profileIntervalUnion I a b) :=
  I.measurableSet_biUnion fun _ _ => measurableSet_profileRadialRegion measurableSet_Ioc

theorem profileIntervalUnion_subset_smallProfile {ι : Type*} (I : Finset ι)
    (a b : ι → ℝ)
    (hcert : ∀ i ∈ I, ∀ s ∈ Ioc (a i) (b i), (1 / 16 : ℝ) ≤ s ∧
      |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| ≤ (1 / 100 : ℝ)) :
    profileIntervalUnion I a b ⊆ smallProfileRegion := by
  intro u hu
  obtain ⟨i, hi, hui⟩ := mem_iUnion₂.mp hu
  exact profileRadialRegion_subset_smallProfile (hcert i hi) hui

theorem profileAuxiliaryCorrection_union_eq_sum {ι : Type*} (I : Finset ι)
    (a b : ι → ℝ) (j : ℕ)
    (hdisj : (I : Set ι).PairwiseDisjoint fun i => Ioc (a i) (b i)) :
    profileAuxiliaryCorrection (profileIntervalUnion I a b) j =
      ∑ i ∈ I, profileAuxiliaryCorrection (profileRadialRegion (Ioc (a i) (b i))) j := by
  have hd : (I : Set ι).PairwiseDisjoint
      (fun i => profileRadialRegion (Ioc (a i) (b i))) := by
    intro i hi k hk hik
    exact Disjoint.preimage (fun u : ℂ × ℂ => ‖u.1‖ ^ 2) (hdisj hi hk hik)
  funext u
  simpa only [profileAuxiliaryCorrection, profileIntervalUnion, Finset.sum_apply] using
    Finset.indicator_biUnion_apply I
      (f := finiteLaplaceTailError finiteLaplaceEta 10000 j -
        finiteLaplaceTailError finiteLaplaceEta finiteLaplaceCutoff j)
      (fun i => profileRadialRegion (Ioc (a i) (b i))) hd u

private theorem toLp_finsetSum {ι : Type*} (I : Finset ι) (f : ι → ℂ × ℂ → ℂ)
    (hf : ∀ i, MemLp (f i) 2 mu2) :
    (memLp_finsetSum' I (fun i _ => hf i)).toLp (∑ i ∈ I, f i) =
      ∑ i ∈ I, (hf i).toLp (f i) := by
  classical
  induction I using Finset.induction_on with
  | empty => simp
  | @insert i I hi ih =>
      simp only [Finset.sum_insert hi]
      rw [MemLp.toLp_add (hf i) (memLp_finsetSum' I (fun k _ => hf k)), ih]

/-- The exact quadrature value of the part removed on one radial interval. -/
def profileIntervalCorrectionValue (a b : ℝ) (j N : ℕ) (c : ℕ → ℕ → ℕ → ℚ) : ℂ :=
  (compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff b j N c -
    compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff a j N c) -
  (compactTaylorQuadratureValue finiteLaplaceEta 10000 b j N c -
    compactTaylorQuadratureValue finiteLaplaceEta 10000 a j N c)

theorem inner_profileAuxiliaryCorrection_interval (a b : ℝ) (ha : 0 ≤ a)
    (hab : a ≤ b) (j N : ℕ) (c : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N c,
      (profileAuxiliaryCorrection_memLp (profileRadialRegion (Ioc a b))
        (measurableSet_profileRadialRegion measurableSet_Ioc) j).toLp
        (profileAuxiliaryCorrection (profileRadialRegion (Ioc a b)) j)⟫_ℂ =
      profileIntervalCorrectionValue a b j N c := by
  let hg (L : ℝ) := compactLaplaceHpow_memLp finiteLaplaceEta finiteLaplaceCutoff L
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j
  let hs (L : ℝ) := compactLaplaceHpow_memLp finiteLaplaceEta 10000 L
    finiteLaplaceEta_pos (by norm_num) j
  rw [MemLp.toLp_congr _ (((hg b).sub (hg a)).sub ((hs b).sub (hs a)))
    (Filter.Eventually.of_forall (congrFun (profileAuxiliaryCorrection_interval_eq a b hab j)))]
  rw [MemLp.toLp_sub ((hg b).sub (hg a)) ((hs b).sub (hs a)),
    MemLp.toLp_sub (hg b) (hg a), MemLp.toLp_sub (hs b) (hs a)]
  simp only [inner_sub_right]
  rw [inner_gradedHermite_compactLaplace_eq_quadrature _ _ _ finiteLaplaceEta_pos
      finiteLaplaceCutoff_nonneg (ha.trans hab),
    inner_gradedHermite_compactLaplace_eq_quadrature _ _ _ finiteLaplaceEta_pos
      finiteLaplaceCutoff_nonneg ha,
    inner_gradedHermite_compactLaplace_eq_quadrature _ _ _ finiteLaplaceEta_pos
      (by norm_num : (0 : ℝ) ≤ 10000) (ha.trans hab),
    inner_gradedHermite_compactLaplace_eq_quadrature _ _ _ finiteLaplaceEta_pos
      (by norm_num : (0 : ℝ) ≤ 10000) ha]
  rfl

/-- The entire retained coefficient as a finite combination of rectangle values. -/
def profileIntervalQuadratureValue {ι : Type*} (I : Finset ι) (a b : ι → ℝ)
    (j N : ℕ) (c : ℕ → ℕ → ℕ → ℚ) : ℂ :=
  compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80 j N c -
    ∑ i ∈ I, profileIntervalCorrectionValue (a i) (b i) j N c

theorem inner_profileRetained_eq_intervalQuadrature {ι : Type*} (I : Finset ι)
    (a b : ι → ℝ) (j N : ℕ) (c : ℕ → ℕ → ℕ → ℚ)
    (ha : ∀ i ∈ I, 0 ≤ a i) (hab : ∀ i ∈ I, a i ≤ b i)
    (hb : ∀ i ∈ I, b i ≤ 80)
    (hdisj : (I : Set ι).PairwiseDisjoint fun i => Ioc (a i) (b i)) :
    ⟪gradedHermite N c, profileRetainedL2 (profileIntervalUnion I a b)
      (measurableSet_profileIntervalUnion I a b) j⟫_ℂ =
      profileIntervalQuadratureValue I a b j N c := by
  have he : ((TaylorRadialTail.cutoffSet 80)ᶜ).indicator
      (profileAuxiliaryCorrection (profileIntervalUnion I a b) j) =
      profileAuxiliaryCorrection (profileIntervalUnion I a b) j := by
    funext u
    by_cases hu : u ∈ profileIntervalUnion I a b
    · obtain ⟨i, hi, hui⟩ := mem_iUnion₂.mp hu
      change ‖u.1‖ ^ 2 ∈ Ioc (a i) (b i) at hui
      have hcut : u ∉ TaylorRadialTail.cutoffSet 80 := by
        have := hui.2.trans (hb i hi)
        simpa [TaylorRadialTail.cutoffSet] using not_lt.mpr this
      simp [hcut]
    · simp [profileAuxiliaryCorrection, hu]
  let hf (i : ι) := profileAuxiliaryCorrection_memLp
    (profileRadialRegion (Ioc (a i) (b i)))
    (measurableSet_profileRadialRegion measurableSet_Ioc) j
  have hfun : profileRetainedHpow (profileIntervalUnion I a b) j =
      compactLaplaceHpow finiteLaplaceEta finiteLaplaceCutoff 80 j -
        ∑ i ∈ I, profileAuxiliaryCorrection (profileRadialRegion (Ioc (a i) (b i))) j := by
    rw [profileRetainedHpow, he, profileAuxiliaryCorrection_union_eq_sum I a b j hdisj]
  unfold profileRetainedL2
  rw [MemLp.toLp_congr _
    ((compactLaplaceHpow_memLp _ _ _ finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j).sub
      (memLp_finsetSum' I (fun i _ => hf i)))
    (Filter.Eventually.of_forall (congrFun hfun)),
    MemLp.toLp_sub
      (compactLaplaceHpow_memLp _ _ _ finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j)
      (memLp_finsetSum' I (fun i _ => hf i)), toLp_finsetSum I _ hf,
    inner_sub_right, inner_sum,
    inner_gradedHermite_compactLaplace_eq_quadrature _ _ _ finiteLaplaceEta_pos
      finiteLaplaceCutoff_nonneg (by norm_num : (0 : ℝ) ≤ 80)]
  unfold profileIntervalQuadratureValue
  congr 1
  apply Finset.sum_congr rfl
  intro i hi
  exact inner_profileAuxiliaryCorrection_interval (a i) (b i) (ha i hi) (hab i hi) j N c

end
end Grothe.UpperChaos
