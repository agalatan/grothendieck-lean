import Grothe.UpperChaos.TaylorConditionalGaussian
import Grothe.UpperChaos.TaylorInnerFubini

/-!
# The actual Taylor inner product as an iterated finite Wick integral

The center is the existing graded Hermite vector. Its canonical pointwise
representative gives the charge and integrability needed by absolute Fubini.
The entire second-coordinate Gaussian integration is evaluated exactly;
the remaining auxiliary and first-coordinate integrations are explicit.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Exact reduction of the production inner product with every finite graded center. -/
theorem inner_gradedHermite_hpow_eq_wick (hφ : PhiBound) (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N a, (chargeFn_hpow hφ j).memLp.toLp (hpow j)⟫_ℂ =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        ∫ z, taylorConditionalWick j N a t z ∂Grothe.LowerAnalytic.gaussC := by
  let hc : ChargeFn (gradedHermiteFn N a) :=
    ⟨measurable_gradedHermiteFn N a, memLp_gradedHermiteFn N a,
      gradedHermiteFn_rot2 N a⟩
  have h := inner_hpow_eq_phaseLaplace_iterated hφ hc j
  have hrep : hc.memLp.toLp (gradedHermiteFn N a) = gradedHermite N a :=
    toLp_gradedHermiteFn N a
  rw [hrep] at h
  rw [h]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun z => integral_taylorInnerSource_conditional j N a t z ht)

end
end Grothe.UpperChaos
