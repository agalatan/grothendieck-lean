import Grothe.UpperChaos.SmallProfileAuxiliaryTail
import Grothe.UpperChaos.CompactTaylorQuadrature

/-!
# The retained source with a shorter cutoff on certified profile intervals

A measurable subset of the proved small-profile region may use auxiliary
endpoint one hundred. Elsewhere the source keeps the full dyadic endpoint.
The error is bounded in the original Gaussian L² space, once for the whole
source, and remains inside the original production reserve.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

/-- Restricting to any certified subset of the small-profile region preserves
the uniform tail bound, independently of the number of radial intervals. -/
theorem norm_smallProfile_subset_tail_le (S : Set (ℂ × ℂ)) (hS : MeasurableSet S)
    (hsub : S ⊆ smallProfileRegion) (j : ℕ) :
    ‖((finiteLaplaceTailError_memLp finiteLaplaceEta 10000 finiteLaplaceEta_pos
      (by norm_num) j).indicator hS).toLp
      (S.indicator (finiteLaplaceTailError finiteLaplaceEta 10000 j))‖ ≤
      (2 / 10 ^ 17 : ℝ) := by
  have he : S.indicator (finiteLaplaceTailError finiteLaplaceEta 10000 j) =
      S.indicator (smallProfileAuxiliaryTail finiteLaplaceEta j) := by
    funext u
    by_cases hu : u ∈ S
    · simp [hu, smallProfileAuxiliaryTail, hsub hu]
    · simp [hu]
  rw [Lp.norm_toLp, he]
  have h := (norm_toLp_indicator_le
    (smallProfileAuxiliaryTail_memLp finiteLaplaceEta finiteLaplaceEta_pos j) hS).trans
    (norm_smallProfileAuxiliaryTail_le finiteLaplaceEta finiteLaplaceEta_pos j)
  simpa only [Lp.norm_toLp] using h

/-- The part removed from the full finite auxiliary source. -/
def profileAuxiliaryCorrection (S : Set (ℂ × ℂ)) (j : ℕ) : ℂ × ℂ → ℂ :=
  S.indicator (finiteLaplaceTailError finiteLaplaceEta 10000 j -
    finiteLaplaceTailError finiteLaplaceEta finiteLaplaceCutoff j)

lemma profileAuxiliaryCorrection_memLp (S : Set (ℂ × ℂ)) (hS : MeasurableSet S)
    (j : ℕ) : MemLp (profileAuxiliaryCorrection S j) 2 mu2 :=
  ((finiteLaplaceTailError_memLp finiteLaplaceEta 10000 finiteLaplaceEta_pos (by norm_num) j).sub
    (finiteLaplaceTailError_memLp finiteLaplaceEta finiteLaplaceCutoff finiteLaplaceEta_pos
      finiteLaplaceCutoff_nonneg j)).indicator hS

theorem norm_profileAuxiliaryCorrection_le (S : Set (ℂ × ℂ)) (hS : MeasurableSet S)
    (hsub : S ⊆ smallProfileRegion) (j : ℕ) :
    ‖(profileAuxiliaryCorrection_memLp S hS j).toLp (profileAuxiliaryCorrection S j)‖ ≤
      (3 / 10 ^ 17 : ℝ) := by
  let hs := (finiteLaplaceTailError_memLp finiteLaplaceEta 10000
    finiteLaplaceEta_pos (by norm_num) j).indicator hS
  let hg := (finiteLaplaceTailError_memLp finiteLaplaceEta finiteLaplaceCutoff
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j).indicator hS
  have he : profileAuxiliaryCorrection S j =
      S.indicator (finiteLaplaceTailError finiteLaplaceEta 10000 j) -
        S.indicator (finiteLaplaceTailError finiteLaplaceEta finiteLaplaceCutoff j) := by
    funext u
    by_cases hu : u ∈ S <;> simp [profileAuxiliaryCorrection, hu]
  rw [MemLp.toLp_congr _ (hs.sub hg) (Filter.Eventually.of_forall (congrFun he)),
    MemLp.toLp_sub hs hg]
  have hsmall := norm_smallProfile_subset_tail_le S hS hsub j
  have hglobal : ‖hg.toLp (S.indicator
      (finiteLaplaceTailError finiteLaplaceEta finiteLaplaceCutoff j))‖ ≤
      (1 / 10 ^ 17 : ℝ) :=
    (norm_toLp_indicator_le
      (finiteLaplaceTailError_memLp finiteLaplaceEta finiteLaplaceCutoff finiteLaplaceEta_pos
        finiteLaplaceCutoff_nonneg j) hS).trans
      ((norm_finiteLaplaceTailError_le finiteLaplaceEta finiteLaplaceCutoff finiteLaplaceEta_pos
        finiteLaplaceCutoff_nonneg j).trans exp_neg_scaled_finiteLaplaceCutoff_le)
  exact (norm_sub_le _ _).trans ((add_le_add hsmall hglobal).trans (by norm_num))

def profileRetainedHpow (S : Set (ℂ × ℂ)) (j : ℕ) : ℂ × ℂ → ℂ :=
  compactLaplaceHpow finiteLaplaceEta finiteLaplaceCutoff 80 j -
    ((TaylorRadialTail.cutoffSet 80)ᶜ).indicator (profileAuxiliaryCorrection S j)

open Classical in
/-- The actual retained response uses the shorter auxiliary cutoff exactly on S. -/
theorem profileRetainedHpow_eq (S : Set (ℂ × ℂ)) (j : ℕ) (u : ℂ × ℂ) :
    profileRetainedHpow S j u =
      if u ∈ TaylorRadialTail.cutoffSet 80 then 0 else
        if u ∈ S then finiteLaplaceHpow finiteLaplaceEta 10000 j u
        else finiteLaplaceHpow finiteLaplaceEta finiteLaplaceCutoff j u := by
  by_cases hu : u ∈ TaylorRadialTail.cutoffSet 80
  · simp [profileRetainedHpow, compactLaplaceHpow, hu]
  · by_cases hs : u ∈ S
    · simp [profileRetainedHpow, compactLaplaceHpow, profileAuxiliaryCorrection,
        finiteLaplaceTailError, hu, hs]
      all_goals abel
    · simp [profileRetainedHpow, compactLaplaceHpow, profileAuxiliaryCorrection, hu, hs]

lemma profileRetainedHpow_memLp (S : Set (ℂ × ℂ)) (hS : MeasurableSet S) (j : ℕ) :
    MemLp (profileRetainedHpow S j) 2 mu2 :=
  (compactLaplaceHpow_memLp finiteLaplaceEta finiteLaplaceCutoff 80 finiteLaplaceEta_pos
    finiteLaplaceCutoff_nonneg j).sub
    ((profileAuxiliaryCorrection_memLp S hS j).indicator
      (TaylorRadialTail.measurableSet_cutoffSet 80).compl)

def profileRetainedError (S : Set (ℂ × ℂ)) (j : ℕ) : ℂ × ℂ → ℂ :=
  hpow j - profileRetainedHpow S j

lemma profileRetainedError_memLp (S : Set (ℂ × ℂ)) (hS : MeasurableSet S) (j : ℕ) :
    MemLp (profileRetainedError S j) 2 mu2 :=
  (chargeFn_hpow phiBound j).memLp.sub (profileRetainedHpow_memLp S hS j)

/-- Softening, radial truncation, the dyadic auxiliary tail and all selected
small-profile omissions jointly fit the original `5e-15` source reserve. -/
theorem norm_profileRetainedError_lt (S : Set (ℂ × ℂ)) (hS : MeasurableSet S)
    (hsub : S ⊆ smallProfileRegion) (j : ℕ) :
    ‖(profileRetainedError_memLp S hS j).toLp (profileRetainedError S j)‖ <
      (5 / 10 ^ 15 : ℝ) := by
  let hc := compactLaplaceError_memLp finiteLaplaceEta finiteLaplaceCutoff 80
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j
  let hr := (profileAuxiliaryCorrection_memLp S hS j).indicator
    (TaylorRadialTail.measurableSet_cutoffSet 80).compl
  have he : profileRetainedError S j =
      compactLaplaceError finiteLaplaceEta finiteLaplaceCutoff 80 j +
        ((TaylorRadialTail.cutoffSet 80)ᶜ).indicator (profileAuxiliaryCorrection S j) := by
    funext u
    simp only [profileRetainedError, profileRetainedHpow, compactLaplaceError,
      Pi.sub_apply, Pi.add_apply]
    abel
  rw [MemLp.toLp_congr _ (hc.add hr) (Filter.Eventually.of_forall (congrFun he)),
    MemLp.toLp_add hc hr]
  have hcBound := norm_compactLaplaceError_le finiteLaplaceEta finiteLaplaceCutoff 80
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j
  have hrBound := (norm_toLp_indicator_le (profileAuxiliaryCorrection_memLp S hS j)
    (TaylorRadialTail.measurableSet_cutoffSet 80).compl).trans
    (norm_profileAuxiliaryCorrection_le S hS hsub j)
  have hrad := norm_source_eighty_le j
  have haux := exp_neg_scaled_finiteLaplaceCutoff_le
  exact (norm_add_le _ _).trans_lt
    ((add_le_add hcBound hrBound).trans_lt
      ((add_le_add (add_le_add hrad (add_le_add le_rfl haux)) le_rfl).trans_lt
        (by norm_num [finiteLaplaceEta])))

/-- The set of Gaussian samples selected by a certified squared-radius set. -/
def profileRadialRegion (R : Set ℝ) : Set (ℂ × ℂ) :=
  {u | ‖u.1‖ ^ 2 ∈ R}

lemma measurableSet_profileRadialRegion {R : Set ℝ} (hR : MeasurableSet R) :
    MeasurableSet (profileRadialRegion R) :=
  hR.preimage (continuous_fst.norm.pow 2).measurable

/-- Numerical interval certificates need only bound the squared radius and
the actual profile; no exact root locations are needed. -/
theorem profileRadialRegion_subset_smallProfile {R : Set ℝ}
    (hR : ∀ s ∈ R, (1 / 16 : ℝ) ≤ s ∧
      |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| ≤ (1 / 100 : ℝ)) :
    profileRadialRegion R ⊆ smallProfileRegion := by
  intro u hu
  obtain ⟨hr, hp⟩ := hR (‖u.1‖ ^ 2) hu
  refine ⟨?_, hp⟩
  nlinarith [norm_nonneg u.1]

/-- The retained source as an actual vector in Gaussian L². -/
def profileRetainedL2 (S : Set (ℂ × ℂ)) (hS : MeasurableSet S) (j : ℕ) :
    Lp ℂ 2 mu2 :=
  (profileRetainedHpow_memLp S hS j).toLp (profileRetainedHpow S j)

theorem norm_hpow_sub_profileRetainedL2_lt (S : Set (ℂ × ℂ)) (hS : MeasurableSet S)
    (hsub : S ⊆ smallProfileRegion) (j : ℕ) :
    ‖(chargeFn_hpow phiBound j).memLp.toLp (hpow j) - profileRetainedL2 S hS j‖ <
      (5 / 10 ^ 15 : ℝ) := by
  have he : (profileRetainedError_memLp S hS j).toLp (profileRetainedError S j) =
      (chargeFn_hpow phiBound j).memLp.toLp (hpow j) - profileRetainedL2 S hS j :=
    MemLp.toLp_sub (chargeFn_hpow phiBound j).memLp (profileRetainedHpow_memLp S hS j)
  rw [← he]
  exact norm_profileRetainedError_lt S hS hsub j

/-- Projection and the actual smoothing operator preserve the single source reserve. -/
theorem norm_projOn_smooth_profileRetainedError_lt (B : Set Idx2)
    (S : Set (ℂ × ℂ)) (hS : MeasurableSet S) (hsub : S ⊆ smallProfileRegion) (j : ℕ) :
    ‖projOn B (smoothOp ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) -
      profileRetainedL2 S hS j))‖ < (5 / 10 ^ 15 : ℝ) :=
  ((modeSpace B).norm_starProjection_apply_le _).trans_lt
    ((norm_smoothOp_le _).trans_lt (norm_hpow_sub_profileRetainedL2_lt S hS hsub j))

/-- Every Hermite pairing is controlled by the same original-source estimate. -/
theorem norm_inner_hpow_sub_profileRetained_le (S : Set (ℂ × ℂ)) (hS : MeasurableSet S)
    (hsub : S ⊆ smallProfileRegion) (j : ℕ) (g : Lp ℂ 2 mu2) :
    ‖⟪g, (chargeFn_hpow phiBound j).memLp.toLp (hpow j)⟫_ℂ -
      ⟪g, profileRetainedL2 S hS j⟫_ℂ‖ ≤ ‖g‖ * (5 / 10 ^ 15 : ℝ) := by
  rw [← inner_sub_right]
  exact (norm_inner_le_norm _ _).trans
    (mul_le_mul_of_nonneg_left (norm_hpow_sub_profileRetainedL2_lt S hS hsub j).le
      (norm_nonneg _))

end
end Grothe.UpperChaos
