import Grothe.UpperChaos.CompactTaylorQuadrature
import Grothe.UpperChaos.ChargeBandApproximation
import Grothe.UpperChaos.GradedUnitBasis

/-!
# Finite-rectangle coefficients of the production Taylor bands

The compact source preserves charge one. Parseval therefore expresses each
bounded degree band using the actual finite-rectangle coefficients. The proved
source approximation error is added once to the entire band norm.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

theorem finiteLaplacePhase_mul_unit (η T : ℝ) (c z : ℂ) (hc : ‖c‖ = 1) :
    finiteLaplacePhase η T (c * z) = c * finiteLaplacePhase η T z := by
  have hk (t : ℝ) : softPhaseLaplaceKernel η (c * z) t =
      c * softPhaseLaplaceKernel η z t := by
    simp only [softPhaseLaplaceKernel, Haag.phaseLaplaceKernel, norm_mul, hc, one_mul]
    ring
  simp only [finiteLaplacePhase, hk, intervalIntegral.integral_const_mul]
  ring

theorem compactLaplaceHpow_rot (η T L : ℝ) (j : ℕ) (c : ℂ) (u : ℂ × ℂ)
    (hc : ‖c‖ = 1) :
    compactLaplaceHpow η T L j (rot2 c u) = c * compactLaplaceHpow η T L j u := by
  have ha : basePhaseArg (rot2 c u) = c * basePhaseArg u := by
    simp only [basePhaseArg, rot2, norm_mul, hc, one_mul]
    ring
  have hf : finiteLaplaceHpow η T j (rot2 c u) = c * finiteLaplaceHpow η T j u := by
    simp only [finiteLaplaceHpow, phiT_rot2 hc, ha, finiteLaplacePhase_mul_unit η T c _ hc]
    ring
  have hm : rot2 c u ∈ TaylorRadialTail.cutoffSet L ↔ u ∈ TaylorRadialTail.cutoffSet L := by
    simp only [TaylorRadialTail.cutoffSet, mem_prod, mem_ofPred_eq, mem_univ, and_true,
      rot2, norm_mul, hc, one_mul]
  by_cases hu : u ∈ TaylorRadialTail.cutoffSet L <;>
    simp [compactLaplaceHpow, hm, hu, hf]

/-- The fixed compact approximation used by the numerical certificates. -/
def compactTaylorL2 (j : ℕ) : Lp ℂ 2 mu2 :=
  (compactLaplaceHpow_memLp finiteLaplaceEta finiteLaplaceCutoff 80
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j).toLp
    (compactLaplaceHpow finiteLaplaceEta finiteLaplaceCutoff 80 j)

theorem chargeOne_compactTaylorL2 (j : ℕ) : ChargeOne (compactTaylorL2 j) :=
  chargeOne_toLp _ (compactLaplaceHpow_rot _ _ _ j)

theorem norm_hpow_sub_compactTaylorL2_lt (j : ℕ) :
    ‖(chargeFn_hpow phiBound j).memLp.toLp (hpow j) - compactTaylorL2 j‖ <
      (5 / 10 ^ 15 : ℝ) := by
  unfold compactTaylorL2
  rw [← toLp_compactLaplaceError _ _ _ finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j]
  exact norm_compactLaplaceError_cutoff_lt j

/-- A unit graded polynomial represents the normalized Hermite basis vector in L². -/
theorem gradedHermite_unit {N : ℕ} (i : GradedIdx N) :
    gradedHermite N (gradedUnitCoeff i) = hvec2 (gradedIdx i) := by
  apply Lp.ext
  have hf : gradedHermiteFn N (gradedUnitCoeff i) =ᵐ[mu2] hfun2 (gradedIdx i) :=
    Filter.Eventually.of_forall (congrFun (gradedHermiteFn_unit i))
  exact (coeFn_gradedHermite N (gradedUnitCoeff i)).trans
    (hf.trans (memLp_hfun2 (gradedIdx i)).coeFn_toLp.symm)

/-- One normalized coefficient, defined by the complete finite rectangle. -/
def compactTaylorCoefficient (j : ℕ) {N : ℕ} (i : GradedIdx N) : ℂ :=
  compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80
    j N (gradedUnitCoeff i)

theorem inner_hvec2_compactTaylorL2 (j : ℕ) {N : ℕ} (i : GradedIdx N) :
    ⟪hvec2 (gradedIdx i), compactTaylorL2 j⟫_ℂ = compactTaylorCoefficient j i := by
  rw [← gradedHermite_unit i]
  exact inner_gradedHermite_compactLaplace_eq_quadrature _ _ _
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg (by norm_num) j N (gradedUnitCoeff i)

/-- The complete coefficient residual of a finite band, with the stored center included. -/
def compactTaylorBandEnergy (B : Set Idx2) [DecidablePred (· ∈ B)]
    (j N M : ℕ) (a : ℕ → ℕ → ℕ → ℚ) : ℝ :=
  ∑ i : GradedIdx N, if gradedIdx i ∈ B then
    ‖compactTaylorCoefficient j i -
      (if i.1.val < M then (a i.1 i.2.1 i.2.2 : ℂ) else 0)‖ ^ 2 else 0

/-- The finite numerical sum is exactly the compact source's band error. -/
theorem norm_projOn_compactTaylor_sub_graded_sq (B : Set Idx2)
    [DecidablePred (· ∈ B)] (j N M : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N) :
    ‖projOn B (compactTaylorL2 j - gradedHermite M a)‖ ^ 2 =
      compactTaylorBandEnergy B j N M a := by
  have hcharge : ChargeOne (compactTaylorL2 j - gradedHermite M a) := by
    intro i hi
    rw [inner_sub_right, chargeOne_compactTaylorL2 j i hi,
      inner_gradedHermite_eq_zero_of_charge M a i hi, sub_self]
  rw [norm_projOn_chargeOne_sq_coefficients B N _ hcharge hdegree,
    Finset.sum_filter, gradedSupport, Finset.sum_map]
  change (∑ i : GradedIdx N, if gradedIdx i ∈ B then
    ‖⟪hvec2 (gradedIdx i), compactTaylorL2 j - gradedHermite M a⟫_ℂ‖ ^ 2 else 0) = _
  apply Finset.sum_congr rfl
  intro i _hi
  have hc : ⟪hvec2 (gradedIdx i), gradedHermite M a⟫_ℂ =
      if i.1.val < M then (a i.1 i.2.1 i.2.2 : ℂ) else 0 := by
    have hcond : ((gradedIdx i).1.2 + (gradedIdx i).2.2 < M ∧
        (gradedIdx i).1.1 + (gradedIdx i).2.1 =
          (gradedIdx i).1.2 + (gradedIdx i).2.2 + 1) ↔ i.1.val < M := by
      constructor
      · intro h
        simpa only [gradedIdx_antidegree] using h.1
      · intro h
        exact ⟨by simpa only [gradedIdx_antidegree] using h, gradedIdx_charge i⟩
    simp only [inner_hvec2_gradedHermite, hcond, gradedIdx_antidegree]
  simp only [inner_sub_right, inner_hvec2_compactTaylorL2, hc]

/-- The actual Gaussian band inherits the finite rectangle's error, with the
combined source reserve charged only once, independently of the number of modes. -/
theorem norm_hpow_band_sub_graded_le_compact (B : Set Idx2)
    [DecidablePred (· ∈ B)] (j N M : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (δ : ℝ)
    (hδ : 0 ≤ δ) (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (hcert : compactTaylorBandEnergy B j N M a ≤ δ ^ 2) :
    ‖projOn B ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) - gradedHermite M a)‖ ≤
      (5 / 10 ^ 15 : ℝ) + δ := by
  apply norm_band_error_le_shared_approx B _ (compactTaylorL2 j) (gradedHermite M a)
    _ δ (norm_hpow_sub_compactTaylorL2_lt j).le
  rw [← norm_projOn_compactTaylor_sub_graded_sq B j N M a hdegree] at hcert
  exact (sq_le_sq₀ (norm_nonneg _) hδ).mp hcert

end
end Grothe.UpperChaos
