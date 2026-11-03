import Grothe.UpperChaos.Q0CenteredIntegral
import Grothe.UpperChaos.Q0AffineCancellation

/-!
# The real q0 conditional integral as a centered Wick sum

This assembles the exact affine cancellation, Gaussian translation and
imaginary-square Wick insertion. It keeps the Gaussian mass inside the shifted
moments and does not divide by the real radius or affine profile. No finite
coefficient compression, quadrature or numerical bound is asserted.

Agent-ID: codex-8c4d
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0ConditionalWickReal

noncomputable section

open Grothe.UpperChaos.Q0AffineCancellation
open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.Q0CenteredIntegral
open Grothe.UpperChaos.Q0PhaseWickBridge
open Grothe.UpperChaos.LeanCertProductionPanel

/-- The real phase-polynomial factor left by q0 affine cancellation. -/
def q0PhaseReal (r : ℝ) (w : ℂ) : ℝ :=
  w.im ^ 2 * Sphase (Complex.normSq (r : ℂ)) (Complex.normSq w)
    (conj (r : ℂ) * w).re

/-- The complex polynomial source is the real q0 factor as an embedding. -/
theorem q0PhaseImSq_eq_ofReal (r : ℝ) (w : ℂ) :
    q0PhaseImSq r w = (q0PhaseReal r w : ℂ) := by
  unfold q0PhaseImSq q0PhaseReal
  rw [ev_phaseInvariantSlice]
  simp only [Sphase, Ssum, Complex.ofReal_mul]

/-- All factors outside the tilted q0 phase integral. -/
def q0Amplitude (r t : ℝ) : ℝ :=
  -kappaAtReal r * r ^ 2 * t ^ (-(1 / 2 : ℝ)) *
    Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) * Complex.normSq (r : ℂ))

/-- The real part of the actual pointwise conditional source is the scalar
amplitude times the phase polynomial under the two Gaussian tilts. -/
theorem q0_conditional_real_pointwise (r t : ℝ) (w : ℂ) :
    (taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), w) *
      Haag.phaseLaplaceKernel (basePhaseArgument ((r : ℂ), w)) t).re =
      q0Amplitude r t *
        (q0PhaseReal r w * Real.exp (-(q0Alpha - 1) * Complex.normSq w) *
          Real.exp (-(t * Complex.normSq ((r : ℂ) + (kappaAtReal r : ℂ) * w)))) := by
  have hexp : Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) *
      (‖(r : ℂ)‖ ^ 2 + ‖w‖ ^ 2)) =
      Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) * ‖(r : ℂ)‖ ^ 2) *
        Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) * ‖w‖ ^ 2) := by
    rw [← Real.exp_add]
    congr 1
    ring
  have hα : q0Alpha - 1 = (Grothe.Upper.phaseEpsQ : ℝ) := by
    dsimp [q0Alpha]
    ring
  rw [q0_laplace_integrand_real, phiT_real_first, hexp, hα]
  simp only [q0Amplitude, q0PhaseReal, basePhaseArgument, kappaAtReal,
    Complex.normSq_eq_norm_sq]
  ring_nf

/-- Exact real conditional q0 Wick formula after completing the affine square.
The shifted moments already include their inverse-rate Gaussian mass. -/
theorem q0_conditionalWick_real_centered (r t : ℝ) (ht : 0 < t) :
    let P := phaseInvariantSlice phaseTerms (r : ℂ)
    (taylorConditionalWick 1 1 q0Coeff t (r : ℂ)).re =
      q0Amplitude r t *
        Real.exp (-(q0Alpha * t * Complex.normSq (r : ℂ) / q0Rate r t)) *
        (∑ k ∈ P.support, P.coeff k * imSqMoment (q0Rate r t) (q0Shift r t) (k 0) (k 1)).re := by
  dsimp only
  let f : ℂ → ℂ := fun w =>
    taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), w) *
      Haag.phaseLaplaceKernel (basePhaseArgument ((r : ℂ), w)) t
  let g : ℂ → ℝ := fun w => q0PhaseReal r w *
    Real.exp (-(q0Alpha - 1) * Complex.normSq w) *
      Real.exp (-(t * Complex.normSq ((r : ℂ) + (kappaAtReal r : ℂ) * w)))
  have hf : Integrable f gaussC :=
    integrable_taylorInnerSource_conditional 1 1 q0Coeff t (r : ℂ) ht
  have hw := integral_taylorInnerSource_conditional 1 1 q0Coeff t (r : ℂ) ht
  change (∫ w, f w ∂gaussC) = _ at hw
  have hre : (∫ w, (f w).re ∂gaussC) = (∫ w, f w ∂gaussC).re := by
    simpa only [RCLike.re_to_complex] using integral_re hf
  rw [← hw, ← hre]
  have hg (w : ℂ) : (f w).re = q0Amplitude r t * g w := by
    exact q0_conditional_real_pointwise r t w
  simp_rw [hg]
  rw [integral_const_mul]
  have hreal : (∫ w : ℂ, g w ∂gaussC) =
      (∫ w : ℂ, q0PhaseImSq r w *
        (Real.exp (-(q0Alpha - 1) * Complex.normSq w) : ℂ) *
        (Real.exp (-(t * Complex.normSq ((r : ℂ) + (kappaAtReal r : ℂ) * w))) : ℂ)
        ∂gaussC).re := by
    have hfun : (fun w : ℂ => q0PhaseImSq r w *
        (Real.exp (-(q0Alpha - 1) * Complex.normSq w) : ℂ) *
        (Real.exp (-(t * Complex.normSq ((r : ℂ) + (kappaAtReal r : ℂ) * w))) : ℂ)) =
        fun w => (g w : ℂ) := by
      funext w
      rw [q0PhaseImSq_eq_ofReal]
      simp only [g, Complex.ofReal_mul]
    rw [hfun, integral_complex_ofReal]
    simp only [Complex.ofReal_re]
  rw [hreal]
  have hcenter := congrArg Complex.re (q0_affine_phase_wick r t ht)
  simp only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero] at hcenter
  rw [hcenter]
  ring

end
end Grothe.UpperChaos.Q0ConditionalWickReal
