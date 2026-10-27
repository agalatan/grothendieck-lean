import Grothe.Haagerup.PhaseLaplaceBounded
import Grothe.UpperChaos.TaylorInnerLaplace

/-!
# Fixed-parameter Gaussian Fubini for the actual Taylor source

The existing `L1` source and the uniform fixed-parameter phase-kernel bound
justify product Fubini at every positive parameter, allowing the exact
conditional Wick formula to be substituted afterwards.
Agent-ID: codex-37fb.
-/

open MeasureTheory Complex Set Grothe.LowerAnalytic
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- The actual weighted source is integrable at every positive Laplace parameter. -/
theorem integrable_taylorInnerSource_kernel {c : ℂ × ℂ → ℂ}
    (hφ : PhiBound) (hc : ChargeFn c) (j : ℕ) (t : ℝ) (ht : 0 < t) :
    Integrable (fun u => taylorInnerSource j c u *
      Haag.phaseLaplaceKernel (basePhaseArgument u) t) mu2 :=
  Haag.integrable_mul_phaseLaplaceKernel_at mu2 measurable_basePhaseArgument
    (integrable_taylorInnerSource hφ hc j) t ht

/-- Product Fubini holds for the actual source at every positive parameter. -/
theorem integral_taylorInnerSource_kernel_prod {c : ℂ × ℂ → ℂ}
    (hφ : PhiBound) (hc : ChargeFn c) (j : ℕ) (t : ℝ) (ht : 0 < t) :
    (∫ u, taylorInnerSource j c u *
      Haag.phaseLaplaceKernel (basePhaseArgument u) t ∂mu2) =
      ∫ z, ∫ w, taylorInnerSource j c (z, w) *
        Haag.phaseLaplaceKernel (basePhaseArgument (z, w)) t ∂gaussC ∂gaussC :=
  integral_prod _ (integrable_taylorInnerSource_kernel hφ hc j t ht)

/-- The production Taylor inner product has an iterated conditional Laplace integral. -/
theorem inner_hpow_eq_phaseLaplace_iterated {c : ℂ × ℂ → ℂ}
    (hφ : PhiBound) (hc : ChargeFn c) (j : ℕ) :
    ⟪hc.memLp.toLp c, (chargeFn_hpow hφ j).memLp.toLp (hpow j)⟫_ℂ =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        ∫ z, ∫ w, taylorInnerSource j c (z, w) *
          Haag.phaseLaplaceKernel (basePhaseArgument (z, w)) t ∂gaussC ∂gaussC := by
  rw [inner_hpow_eq_phaseLaplace hφ hc j]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  exact integral_taylorInnerSource_kernel_prod hφ hc j t ht

end
end Grothe.UpperChaos
