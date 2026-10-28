import Grothe.UpperChaos.ProfileIntervalQuadrature
import Grothe.UpperChaos.CompactTaylorBands

/-!
# Band certificates on the adaptively retained domain

Radial selection preserves charge one. The already established exact
interval coefficients therefore give a finite Parseval sum for each band.
The original source reserve is added once to that band, independently of
the number of radial intervals or Hermite coefficients.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

theorem profileRetainedHpow_rot (S : Set (ℂ × ℂ))
    (hS : ∀ c u, ‖c‖ = 1 → (rot2 c u ∈ S ↔ u ∈ S))
    (j : ℕ) (c : ℂ) (u : ℂ × ℂ) (hc : ‖c‖ = 1) :
    profileRetainedHpow S j (rot2 c u) = c * profileRetainedHpow S j u := by
  have ha : basePhaseArg (rot2 c u) = c * basePhaseArg u := by
    simp only [basePhaseArg, rot2, norm_mul, hc, one_mul]
    ring
  have hf (T : ℝ) : finiteLaplaceHpow finiteLaplaceEta T j (rot2 c u) =
      c * finiteLaplaceHpow finiteLaplaceEta T j u := by
    simp only [finiteLaplaceHpow, phiT_rot2 hc, ha,
      finiteLaplacePhase_mul_unit finiteLaplaceEta T c _ hc]
    ring
  have hm : rot2 c u ∈ TaylorRadialTail.cutoffSet 80 ↔
      u ∈ TaylorRadialTail.cutoffSet 80 := by
    simp only [TaylorRadialTail.cutoffSet, mem_prod, mem_ofPred_eq, mem_univ, and_true,
      rot2, norm_mul, hc, one_mul]
  by_cases hu : u ∈ TaylorRadialTail.cutoffSet 80
  · simp [profileRetainedHpow_eq, hm, hu]
  · by_cases hs : u ∈ S
    · simp [profileRetainedHpow_eq, hm, hS c u hc, hu, hs, hf]
    · simp [profileRetainedHpow_eq, hm, hS c u hc, hu, hs, hf]

theorem chargeOne_profileIntervalL2 {ι : Type*} (I : Finset ι) (a b : ι → ℝ) (j : ℕ) :
    ChargeOne (profileRetainedL2 (profileIntervalUnion I a b)
      (measurableSet_profileIntervalUnion I a b) j) := by
  apply chargeOne_toLp
  apply profileRetainedHpow_rot
  intro c u hc
  simp [profileIntervalUnion, profileRadialRegion, rot2, hc]

/-- The finite residual energy uses exactly the retained rectangle coefficients. -/
def profileIntervalBandEnergy {ι : Type*} (I : Finset ι) (a b : ι → ℝ)
    (B : Set Idx2) [DecidablePred (· ∈ B)] (j N M : ℕ)
    (c : ℕ → ℕ → ℕ → ℚ) : ℝ :=
  ∑ i : GradedIdx N, if gradedIdx i ∈ B then
    ‖profileIntervalQuadratureValue I a b j N (gradedUnitCoeff i) -
      (if i.1.val < M then (c i.1 i.2.1 i.2.2 : ℂ) else 0)‖ ^ 2 else 0

theorem norm_projOn_profileInterval_sub_graded_sq {ι : Type*} (I : Finset ι)
    (a b : ι → ℝ) (B : Set Idx2) [DecidablePred (· ∈ B)] (j N M : ℕ)
    (c : ℕ → ℕ → ℕ → ℚ)
    (ha : ∀ i ∈ I, 0 ≤ a i) (hab : ∀ i ∈ I, a i ≤ b i)
    (hb : ∀ i ∈ I, b i ≤ 80)
    (hdisj : (I : Set ι).PairwiseDisjoint fun i => Ioc (a i) (b i))
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N) :
    ‖projOn B (profileRetainedL2 (profileIntervalUnion I a b)
      (measurableSet_profileIntervalUnion I a b) j - gradedHermite M c)‖ ^ 2 =
      profileIntervalBandEnergy I a b B j N M c := by
  rw [norm_projOn_chargeOne_sub_graded_sq B _ (chargeOne_profileIntervalL2 I a b j)
    N M c hdegree]
  unfold profileIntervalBandEnergy
  apply Finset.sum_congr rfl
  intro i _hi
  rw [← gradedHermite_unit i,
    inner_profileRetained_eq_intervalQuadrature I a b j N (gradedUnitCoeff i)
      ha hab hb hdisj]

/-- Certified radial intervals and retained-cell energies give the original
Gaussian band bound with the unchanged shared approximation reserve. -/
theorem norm_hpow_band_sub_graded_le_profileIntervals {ι : Type*} (I : Finset ι)
    (a b : ι → ℝ) (B : Set Idx2) [DecidablePred (· ∈ B)] (j N M : ℕ)
    (c : ℕ → ℕ → ℕ → ℚ) (δ : ℝ) (hδ : 0 ≤ δ)
    (ha : ∀ i ∈ I, 0 ≤ a i) (hab : ∀ i ∈ I, a i ≤ b i)
    (hb : ∀ i ∈ I, b i ≤ 80)
    (hdisj : (I : Set ι).PairwiseDisjoint fun i => Ioc (a i) (b i))
    (hprofile : ∀ i ∈ I, ∀ s ∈ Ioc (a i) (b i), (1 / 16 : ℝ) ≤ s ∧
      |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| ≤ (1 / 100 : ℝ))
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (henergy : profileIntervalBandEnergy I a b B j N M c ≤ δ ^ 2) :
    ‖projOn B ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - gradedHermite M c)‖ ≤
      (5 / 10 ^ 15 : ℝ) + δ := by
  apply norm_band_error_le_shared_approx B _
    (profileRetainedL2 (profileIntervalUnion I a b)
      (measurableSet_profileIntervalUnion I a b) j) (gradedHermite M c) _ δ
    (norm_hpow_sub_profileRetainedL2_lt _ _
      (profileIntervalUnion_subset_smallProfile I a b hprofile) j).le
  rw [← norm_projOn_profileInterval_sub_graded_sq I a b B j N M c ha hab hb hdisj hdegree]
    at henergy
  exact (sq_le_sq₀ (norm_nonneg _) hδ).mp henergy

end
end Grothe.UpperChaos
