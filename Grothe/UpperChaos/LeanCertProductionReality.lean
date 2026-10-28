import Grothe.UpperChaos.LeanCertProductionPanel
import Grothe.LowerAnalytic.CapSymmetry

/-!
# Reality of the first production conditional Wick integrand

At a real first Gaussian coordinate, conjugating the second coordinate flips
the real phase. The factor of `i` flips under conjugation as well, so the
whole actual first-source integrand is conjugate symmetric. Gaussian
conjugation invariance then makes the conditional Wick value real. This does
not assert a numerical enclosure or the sign of the coefficient.

Agent-ID: codex-8c4d
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.LeanCertProductionReality

noncomputable section

open Grothe.UpperChaos.LeanCertProductionPanel

/-- The actual phase changes sign when the second coordinate is conjugated
and the first coordinate is real. -/
theorem phiT_real_first_conj (r : ℝ) (w : ℂ) :
    phiT ((r : ℂ), conj w) = -phiT ((r : ℂ), w) := by
  simp [phiT, Complex.mul_re, Complex.mul_im]

/-- With a real first coordinate the actual affine phase argument commutes
with conjugation of the second coordinate. -/
theorem basePhaseArgument_real_first_conj (r : ℝ) (w : ℂ) :
    basePhaseArgument ((r : ℂ), conj w) =
      conj (basePhaseArgument ((r : ℂ), w)) := by
  simp [basePhaseArgument, map_add, map_mul, Complex.conj_ofReal]

/-- The positive-parameter kernel commutes with complex conjugation. -/
theorem phaseLaplaceKernel_conj (z : ℂ) (t : ℝ) :
    Grothe.Haag.phaseLaplaceKernel (conj z) t =
      conj (Grothe.Haag.phaseLaplaceKernel z t) := by
  simp only [Grothe.Haag.phaseLaplaceKernel, Complex.norm_conj, map_mul, Complex.conj_ofReal]

/-- The actual q0 integrand has the reflection symmetry required by Gaussian
conjugation invariance. -/
theorem q0_conditional_integrand_conj (r t : ℝ) (w : ℂ) :
    taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), conj w) *
        Grothe.Haag.phaseLaplaceKernel (basePhaseArgument ((r : ℂ), conj w)) t =
      conj (taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), w) *
        Grothe.Haag.phaseLaplaceKernel (basePhaseArgument ((r : ℂ), w)) t) := by
  rw [basePhaseArgument_real_first_conj, phaseLaplaceKernel_conj]
  rw [q0_taylor_source, q0_taylor_source, phiT_real_first_conj]
  simp [map_mul, Complex.conj_I, Complex.conj_ofReal]

/-- At every positive Laplace scale and every real radius, the exact production
conditional Wick integral has zero imaginary part. -/
theorem q0_conditionalWick_im_eq_zero (r t : ℝ) (ht : 0 < t) :
    (taylorConditionalWick 1 1 q0Coeff t (r : ℂ)).im = 0 := by
  let f : ℂ → ℂ := fun w =>
    taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), w) *
      Grothe.Haag.phaseLaplaceKernel (basePhaseArgument ((r : ℂ), w)) t
  have hf : Integrable f gaussC :=
    integrable_taylorInnerSource_conditional 1 1 q0Coeff t (r : ℂ) ht
  have hfm : AEStronglyMeasurable f (gaussC.map (fun z : ℂ => conj z)) := by
    rw [gaussC_map_conj]
    exact hf.aestronglyMeasurable
  have hmap := integral_map (μ := gaussC) Complex.continuous_conj.measurable.aemeasurable hfm
  rw [gaussC_map_conj] at hmap
  have hconj : conj (∫ w, f w ∂gaussC) = ∫ w, f w ∂gaussC := by
    rw [← integral_conj]
    calc
      (∫ w, conj (f w) ∂gaussC) = ∫ w, f (conj w) ∂gaussC := by
        apply integral_congr_ae
        exact Filter.Eventually.of_forall (fun w => (q0_conditional_integrand_conj r t w).symm)
      _ = ∫ w, f w ∂gaussC := hmap.symm
  have him := congrArg Complex.im hconj
  simp only [Complex.conj_im] at him
  have hw := integral_taylorInnerSource_conditional 1 1 q0Coeff t (r : ℂ) ht
  change (∫ w, f w ∂gaussC) = _ at hw
  rw [← hw]
  linarith

/-- In particular, the actual q0 radial integrand is real at every squared
radius for which the first-coordinate square root is formed. -/
theorem q0RadialIntegrand_im_eq_zero (s : ℝ) : (q0RadialIntegrand s).im = 0 := by
  have hw := q0_conditionalWick_im_eq_zero (Real.sqrt s) 1 (by norm_num)
  simp only [q0RadialIntegrand, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
    zero_mul, add_zero, hw, mul_zero]

end
end Grothe.UpperChaos.LeanCertProductionReality
