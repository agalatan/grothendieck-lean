import Grothe.UpperChaos.SmallProfileMeshData
import Grothe.UpperChaos.ProfileRootSound
import Grothe.UpperChaos.ProductionMeshEnclosure

/-!
# A concrete retained mesh for the production profile

Three exact rational interval checks bound the actual normalized profile by
one hundredth. The seven radial strips cover the whole interval `[0,80]`.
Selected strips use auxiliary endpoint one hundred; all others retain the
full endpoint. The source approximation reserve is shared by the entire mesh.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos.SmallProfileMesh
open ProfileRootScreen
noncomputable section

def cut (k : ℕ) : ℝ := (cutQ k : ℝ)

theorem cut_zero : cut 0 = 0 := by norm_num [cut, cutQ]

theorem cut_seven : cut 7 = 80 := by norm_num [cut, cutQ]

theorem monotone_cutQ : Monotone cutQ := by
  apply monotone_nat_of_le_succ
  intro k
  rcases k with _ | (_ | (_ | (_ | (_ | (_ | (_ | k)))))) <;> norm_num [cutQ]

theorem monotone_cut : Monotone cut :=
  fun _ _ h => Rat.cast_le.mpr (monotone_cutQ h)

/-- The actual-profile enclosure uses the already proved centered Horner evaluator. -/
def row (k : ℕ) : Row := ⟨cutQ k, cutQ (k + 1), true⟩

def rowCheck (k : ℕ) : Bool :=
  decide ((1 / 16 : ℚ) ≤ cutQ k ∧ cutQ k ≤ cutQ (k + 1) ∧ cutQ (k + 1) ≤ 80 ∧
    -GrotheKernel.D ≤ 100 * (evalRow (row k)).lo ∧
      100 * (evalRow (row k)).hi ≤ GrotheKernel.D)

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
/-- Kernel reduction checks the three complete rational intervals. -/
theorem selected_rows_checked : ([1, 3, 5] : List ℕ).all rowCheck = true := by
  decide +kernel

/-- Every point of each selected strip meets the actual small-profile condition. -/
theorem profile_on_selected (k : ℕ) (hk : selected k) (s : ℝ)
    (hs : s ∈ Ioc (cut k) (cut (k + 1))) :
    (1 / 16 : ℝ) ≤ s ∧
      |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| ≤ (1 / 100 : ℝ) := by
  have hcheck := (List.all_eq_true.mp selected_rows_checked) k hk
  simp only [rowCheck, decide_eq_true_eq] at hcheck
  rcases hcheck with ⟨hleft, _horder, _hright, hlo, hhi⟩
  have hmin : (1 / 16 : ℝ) ≤ cut k := by
    change (1 / 16 : ℝ) ≤ (cutQ k : ℝ)
    exact_mod_cast hleft
  refine ⟨hmin.trans hs.1.le, ?_⟩
  let y : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s
  have hm : Grothe.Upper.mem y (evalRow (row k)) := by
    have h := row_horner_mem (row k) s hs.1.le hs.2
    simpa only [centered_horner_profile] using h
  have hloR : -(GrotheKernel.D : ℝ) ≤ 100 * ((evalRow (row k)).lo : ℝ) := by
    exact_mod_cast hlo
  have hhiR : 100 * ((evalRow (row k)).hi : ℝ) ≤ (GrotheKernel.D : ℝ) := by
    exact_mod_cast hhi
  have hD : 0 < (GrotheKernel.D : ℝ) := Grothe.Upper.D_pos
  unfold Grothe.Upper.mem at hm
  have hlow : (-1 : ℝ) * GrotheKernel.D ≤ (100 * y) * GrotheKernel.D := by
    nlinarith [hm.1]
  have hhigh : (100 * y) * GrotheKernel.D ≤ (1 : ℝ) * GrotheKernel.D := by
    nlinarith [hm.2]
  have hylo : -1 ≤ 100 * y := le_of_mul_le_mul_right hlow hD
  have hyhi : 100 * y ≤ 1 := le_of_mul_le_mul_right hhigh hD
  change |y| ≤ (1 / 100 : ℝ)
  exact abs_le.mpr ⟨by linarith, by linarith⟩

/-- The selected radial region of the concrete production mesh. -/
def region : Set (ℂ × ℂ) :=
  profileIntervalUnion ((Finset.range 7).filter selected) cut (fun k => cut (k + 1))

theorem measurable_region : MeasurableSet region :=
  measurableSet_profileIntervalUnion _ _ _

theorem region_subset_smallProfile : region ⊆ smallProfileRegion := by
  apply profileIntervalUnion_subset_smallProfile
  intro k hk s hs
  exact profile_on_selected k (Finset.mem_filter.mp hk).2 s hs

/-- The concrete retained Gaussian source. -/
def source (j : ℕ) : Lp ℂ 2 mu2 := profileRetainedL2 region measurable_region j

/-- This fixed mesh retains the original shared source reserve. -/
theorem norm_hpow_sub_source_lt (j : ℕ) :
    ‖(chargeFn_hpow phiBound j).memLp.toLp (hpow j) - source j‖ <
      (5 / 10 ^ 15 : ℝ) :=
  norm_hpow_sub_profileRetainedL2_lt region measurable_region region_subset_smallProfile j

/-- The actual source coefficient is the complete regular/reciprocal mesh. -/
theorem inner_source_eq_reciprocalMesh {N : ℕ} (i : GradedIdx N) (j : ℕ) :
    ⟪hvec2 (gradedIdx i), source j⟫_ℂ =
      retainedReciprocalMeshValue i j cut 7 selected :=
  inner_profileRetained_eq_reciprocalMesh i j cut 7 selected monotone_cut cut_zero cut_seven

theorem strips_disjoint :
    (((Finset.range 7).filter selected : Finset ℕ) : Set ℕ).PairwiseDisjoint
      (fun k => Ioc (cut k) (cut (k + 1))) := by
  intro k _hk l _hl hkl
  rcases lt_or_gt_of_ne hkl with h | h
  · exact Ioc_disjoint_Ioc_of_le (monotone_cut (Nat.succ_le_of_lt h))
  · exact (Ioc_disjoint_Ioc_of_le (monotone_cut (Nat.succ_le_of_lt h))).symm

/-- The remaining finite energy is expressed using the actual fixed mesh. -/
def bandEnergy (B : Set Idx2) [DecidablePred (· ∈ B)] (j N M : ℕ)
    (c : ℕ → ℕ → ℕ → ℚ) : ℝ :=
  profileIntervalBandEnergy ((Finset.range 7).filter selected)
    cut (fun k => cut (k + 1)) B j N M c

/-- A numerical retained-energy certificate now needs no profile-region premise. -/
theorem norm_band_error_le (B : Set Idx2) [DecidablePred (· ∈ B)] (j N M : ℕ)
    (c : ℕ → ℕ → ℕ → ℚ) (δ : ℝ) (hδ : 0 ≤ δ)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (henergy : bandEnergy B j N M c ≤ δ ^ 2) :
    ‖projOn B ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - gradedHermite M c)‖ ≤
      (5 / 10 ^ 15 : ℝ) + δ := by
  apply norm_hpow_band_sub_graded_le_profileIntervals ((Finset.range 7).filter selected)
    cut (fun k => cut (k + 1)) B j N M c δ hδ
  · intro k _hk
    simpa only [cut_zero] using monotone_cut (Nat.zero_le k)
  · intro k _hk
    exact monotone_cut (Nat.le_succ k)
  · intro k hk
    have hk7 : k < 7 := Finset.mem_range.mp (Finset.mem_filter.mp hk).1
    simpa only [cut_seven] using monotone_cut (Nat.succ_le_of_lt hk7)
  · exact strips_disjoint
  · intro k hk s hs
    exact profile_on_selected k (Finset.mem_filter.mp hk).2 s hs
  · exact hdegree
  · exact henergy

end
end Grothe.UpperChaos.SmallProfileMesh
