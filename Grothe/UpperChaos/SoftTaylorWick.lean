import Grothe.UpperChaos.SoftPhaseLaplaceFubini
import Grothe.UpperChaos.ProductionSoftPhase
import Grothe.UpperChaos.TaylorWickReduction

/-! Exact conditional integration of the softened production Taylor sources.
The same finite Wick evaluator is retained, with its explicit exponential
auxiliary damping. Agent-ID: codex-2ca4. -/

open MeasureTheory Set
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

lemma softHpow_memLp (η : ℝ) (hη : 0 < η) (j : ℕ) : MemLp (softHpow η j) 2 mu2 := by
  have h := (chargeFn_hpow phiBound j).memLp.sub (softTaylorError_memLp η hη j)
  have he : (fun u => hpow j u - softTaylorError η j u) = softHpow η j := by
    funext u
    simp [softTaylorError]
  exact he ▸ h

/-- The pointwise softening error represents the difference of the two actual L² sources. -/
theorem toLp_softTaylorError (η : ℝ) (hη : 0 < η) (j : ℕ) :
    (softTaylorError_memLp η hη j).toLp (softTaylorError η j) =
      (chargeFn_hpow phiBound j).memLp.toLp (hpow j) -
        (softHpow_memLp η hη j).toLp (softHpow η j) :=
  MemLp.toLp_sub (chargeFn_hpow phiBound j).memLp (softHpow_memLp η hη j)

/-- Every actual Hermite band can use the softened source with the certified error reserve. -/
theorem norm_projOn_hpow_sub_softHpow_cutoff_lt (B : Set Idx2) (j : ℕ) :
    ‖projOn B ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) -
      (softHpow_memLp (1 / 10 ^ 15) (by positivity) j).toLp
        (softHpow (1 / 10 ^ 15) j))‖ < (5 / 10 ^ 15 : ℝ) := by
  rw [← toLp_softTaylorError _ (by positivity)]
  exact ((modeSpace B).norm_starProjection_apply_le _).trans_lt (norm_softTaylorError_cutoff_lt j)

/-- Actual production smoothing preserves the same bandwise replacement error. -/
theorem norm_projOn_smooth_hpow_sub_softHpow_cutoff_lt (B : Set Idx2) (j : ℕ) :
    ‖projOn B (smoothOp ((chargeFn_hpow phiBound j).memLp.toLp (hpow j) -
      (softHpow_memLp (1 / 10 ^ 15) (by positivity) j).toLp
        (softHpow (1 / 10 ^ 15) j)))‖ < (5 / 10 ^ 15 : ℝ) := by
  rw [← toLp_softTaylorError _ (by positivity)]
  exact ((modeSpace B).norm_starProjection_apply_le _).trans_lt
    ((norm_smoothOp_le _).trans_lt (norm_softTaylorError_cutoff_lt j))

/-- The actual softened source is evaluated by the existing finite Wick sum. -/
theorem integral_gradedHermite_softHpow_eq_wick (η : ℝ) (hη : 0 < η)
    (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    (∫ u, conj (gradedHermiteFn N a u) * softHpow η j u ∂mu2) =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        (Real.exp (-(η ^ 2 * t)) : ℂ) *
          ∫ z, taylorConditionalWick j N a t z ∂Grothe.LowerAnalytic.gaussC := by
  let hc : ChargeFn (gradedHermiteFn N a) :=
    ⟨measurable_gradedHermiteFn N a, memLp_gradedHermiteFn N a,
      gradedHermiteFn_rot2 N a⟩
  have he : (fun u => conj (gradedHermiteFn N a u) * softHpow η j u) =
      fun u => taylorInnerSource j (gradedHermiteFn N a) u *
        softPhase η (basePhaseArgument u) := by
    funext u
    simp only [softHpow, softF0, taylorInnerSource, taylorPhasePower,
      basePhaseArg, basePhaseArgument, mul_assoc]
  rw [he, integral_mul_softPhase_eq_laplace mu2 η hη
    (measurable_taylorInnerSource hc j) measurable_basePhaseArgument
    (integrable_taylorInnerSource phiBound hc j)]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  calc
    _ = (Real.exp (-(η ^ 2 * t)) : ℂ) *
        ∫ u, taylorInnerSource j (gradedHermiteFn N a) u *
          Grothe.Haag.phaseLaplaceKernel (basePhaseArgument u) t ∂mu2 := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun u => by
        unfold softPhaseLaplaceKernel
        ring
    _ = _ := by
      rw [integral_taylorInnerSource_kernel_prod phiBound hc j t ht]
      congr 1
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun z =>
        integral_taylorInnerSource_conditional j N a t z ht

/-- The finite Wick integral is the coefficient pairing in the original Gaussian L² space. -/
theorem inner_gradedHermite_softHpow_eq_wick (η : ℝ) (hη : 0 < η)
    (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N a, (softHpow_memLp η hη j).toLp (softHpow η j)⟫_ℂ =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        (Real.exp (-(η ^ 2 * t)) : ℂ) *
          ∫ z, taylorConditionalWick j N a t z ∂Grothe.LowerAnalytic.gaussC := by
  rw [← toLp_gradedHermiteFn N a,
    inner_toLp2 (memLp_gradedHermiteFn N a) (softHpow_memLp η hη j)]
  exact integral_gradedHermite_softHpow_eq_wick η hη j N a

end
end Grothe.UpperChaos
