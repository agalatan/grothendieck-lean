import Grothe.UpperChaos.GradedUnitBasis
import Grothe.UpperChaos.TaylorWickRadial
import Grothe.UpperChaos.SoftPhaseLaplace

/-!
# The first production coefficient and one softened radial panel

The q = c = d = 0 Hermite mode is the first complex coordinate. The finite
panel below is expressed using the actual phase polynomial, profile and
conditional Wick evaluator; it is not a numerical enclosure, a complete
coefficient certificate or a captured-band bound.

Agent-ID: codex-8c4d
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.LeanCertProductionPanel

noncomputable section

/-- The first charge-one Hermite coordinate `(q,c,d) = (0,0,0)`. -/
def q0Index : GradedIdx 1 := ⟨⟨0, by decide⟩, ⟨⟨0, by decide⟩, ⟨0, by decide⟩⟩⟩

/-- Unit coefficients for the first coordinate. -/
def q0Coeff : ℕ → ℕ → ℕ → ℚ := gradedUnitCoeff q0Index

/-- The selected production mode is exactly the first complex coordinate. -/
theorem q0_pointwise (u : ℂ × ℂ) : gradedHermiteFn 1 q0Coeff u = u.1 := by
  rw [show gradedHermiteFn 1 q0Coeff = hfun2 (gradedIdx q0Index) from
    gradedHermiteFn_unit q0Index]
  simp [q0Index, gradedIdx, gradedMode, hfun2, nrm2, fac2, H2,
    H_succ_left, H_zero_zero, A0, ev, zv]

/-- The source in the first Taylor coefficient has the intended conjugation. -/
theorem q0_taylor_source (u : ℂ × ℂ) :
    taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) u =
      conj u.1 * (Complex.I * (phiT u : ℂ)) := by
  simp [taylorInnerSource, taylorPhasePower, q0_pointwise]

/-- The source-bound, unweighted `m = 0` radial integrand. It uses the
complete phase and profile data through `taylorConditionalWick`. -/
def q0RadialIntegrand (s : ℝ) : ℂ :=
  (Real.exp (-s) : ℂ) * taylorConditionalWick 1 1 q0Coeff 1 (Real.sqrt s : ℂ)

/-- One panel of the exact radial expression, before the softened-mixture
weight is applied. -/
def q0RadialPanel : ℂ := ∫ s in (1 : ℝ)..(1001 / 1000 : ℝ), q0RadialIntegrand s

/-- Weight of the `m = 0` term of the recorded softened mixture. -/
def q0M0Weight : ℝ :=
  finiteSoftLaplaceWeight (1 / 10^14) (3 / 10) (1 + 15 / 10^15) 1

/-- The exact finite panel to be enclosed by a future checker. -/
def q0M0Panel : ℂ := (q0M0Weight : ℂ) * q0RadialPanel

/-- The first Taylor coefficient is the full auxiliary integral of the same
source-bound Wick evaluator; no numerical or tail estimate is asserted. -/
theorem q0_coefficient_radial (hφ : PhiBound) :
    ⟪gradedHermite 1 q0Coeff, (chargeFn_hpow hφ 1).memLp.toLp (hpow 1)⟫_ℂ =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        ∫ s : ℝ in Ioi 0, (Real.exp (-s) : ℂ) *
          taylorConditionalWick 1 1 q0Coeff t (Real.sqrt s : ℂ) :=
  inner_gradedHermite_hpow_eq_radial_wick hφ 1 1 q0Coeff

/-- At scale `t = 1`, the full radial integral is the actual two-Gaussian
conditional integral; `q0RadialPanel` retains only its stated finite panel. -/
theorem q0_radial_scale_one :
    (∫ z, taylorConditionalWick 1 1 q0Coeff 1 z ∂gaussC) =
      ∫ s in Ioi (0 : ℝ), q0RadialIntegrand s := by
  simpa [q0RadialIntegrand] using
    (integral_taylorConditionalWick_radial 1 1 q0Coeff 1 (by norm_num))

end
end Grothe.UpperChaos.LeanCertProductionPanel
