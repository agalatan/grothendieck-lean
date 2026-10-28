import Grothe.UpperChaos.Q0ConditionalWickReal
import Grothe.UpperChaos.LeanCertProductionProfile
import Grothe.UpperChaos.LeanCertProductionReality

/-!
# The exact unit-scale q0 radial Wick integrand

This specializes the conditional real-part identity at `t = 1`, then combines
its damping with the radial Gaussian density. The actual phase polynomial is
still represented by the finite shifted-Wick sum; no coefficient compression
or numerical interval is claimed.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.Q0RadialWickReal

noncomputable section

open Grothe.UpperChaos.Q0ConditionalWickReal
open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.Q0AffineCancellation
open Grothe.UpperChaos.Q0PhaseWickBridge
open Grothe.UpperChaos.LeanCertProductionPanel
open Grothe.UpperChaos.LeanCertProductionProfile
open Grothe.UpperChaos.LeanCertProductionReality

/-- The exact finite shifted-Wick sum for the first source at scale one. -/
def q0RadialWickSum (s : ℝ) : ℂ :=
  let r := Real.sqrt s
  let P := phaseInvariantSlice phaseTerms (r : ℂ)
  ∑ k ∈ P.support, P.coeff k * imSqMoment (q0Beta s) (q0Shift r 1) (k 0) (k 1)

/-- At nonnegative squared radii, the actual q0 radial integrand has the
explicit real Gaussian factor and the exact, uncompressed Wick sum. -/
theorem q0_radial_integrand_real (s : ℝ) (hs : 0 ≤ s) :
    (q0RadialIntegrand s).re =
      (-q0Kappa s * s) *
        Real.exp (-(q0Alpha * s) - q0Alpha * s / q0Beta s) *
          (q0RadialWickSum s).re := by
  have hz : Complex.normSq (Real.sqrt s : ℂ) = s := by
    simpa [Complex.normSq_ofReal] using Real.mul_self_sqrt hs
  have hk : kappaAtReal (Real.sqrt s) = q0Kappa s := by
    simpa [kappaAtReal] using (q0Kappa_eq_wick_profile s hs).symm
  have hb : q0Rate (Real.sqrt s) 1 = q0Beta s := by
    simp [q0Rate, q0Beta, q0Alpha, hk]
  have ha : q0Amplitude (Real.sqrt s) 1 =
      -q0Kappa s * s * Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) * s) := by
    simp [q0Amplitude, hk, Real.sq_sqrt hs, hz]
  have hw := q0_conditionalWick_real_centered (Real.sqrt s) 1 (by norm_num)
  simp only [ha, hb, hz, mul_one] at hw
  have hre : (q0RadialIntegrand s).re =
      Real.exp (-s) * (taylorConditionalWick 1 1 q0Coeff 1 (Real.sqrt s : ℂ)).re := by
    simp only [q0RadialIntegrand, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, zero_mul, sub_zero]
  rw [hre, hw]
  have hexp : Real.exp (-s) *
      Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) * s) *
      Real.exp (-(q0Alpha * s / q0Beta s)) =
        Real.exp (-(q0Alpha * s) - q0Alpha * s / q0Beta s) := by
    rw [← Real.exp_add, ← Real.exp_add]
    congr 1
    dsimp [q0Alpha]
    ring
  change Real.exp (-s) *
      ((-q0Kappa s * s * Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) * s)) *
        Real.exp (-(q0Alpha * s / q0Beta s)) * (q0RadialWickSum s).re) = _
  calc
    _ = (-q0Kappa s * s) * (Real.exp (-s) *
        Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) * s) *
          Real.exp (-(q0Alpha * s / q0Beta s))) * (q0RadialWickSum s).re := by ring
    _ = _ := by rw [hexp]

/-- The complex integrand is the real embedding of the same exact expression. -/
theorem q0_radial_integrand_eq_ofReal (s : ℝ) (hs : 0 ≤ s) :
    q0RadialIntegrand s =
      (((-q0Kappa s * s) *
        Real.exp (-(q0Alpha * s) - q0Alpha * s / q0Beta s) *
          (q0RadialWickSum s).re : ℝ) : ℂ) := by
  apply Complex.ext
  · simpa only [Complex.ofReal_re] using q0_radial_integrand_real s hs
  · simp only [Complex.ofReal_im, q0RadialIntegrand_im_eq_zero]

end
end Grothe.UpperChaos.Q0RadialWickReal
