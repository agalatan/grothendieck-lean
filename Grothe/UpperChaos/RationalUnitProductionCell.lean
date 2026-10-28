import Grothe.UpperChaos.ComplexRealCellIntegral
import Grothe.UpperChaos.AffineSquareIntegralBounds
import Grothe.UpperChaos.RationalUnitRealKernelContinuity

/-!
# Conditional production-cell enclosure for a unit Hermite mode

The model's first variable is squared radius `s` and its second variable is
the regular auxiliary coordinate `u`. The production integral has outer `u`
and inner `s`. The pointwise model enclosure remains an explicit hypothesis;
no numerical certificate or improper-integral bound is asserted.

Agent-ID: codex-8c4d
-/

open MeasureTheory Set LeanCert.Core

namespace Grothe.UpperChaos.RationalUnitProductionCell

open Grothe.UpperChaos.ComplexRealCellIntegral
open Grothe.UpperChaos.AffineSquareIntegralBounds
open Grothe.UpperChaos.RectangleListPolynomialIntegral
open Grothe.UpperChaos.RationalUnitRealKernelContinuity

/-- A certified normalized-square model encloses the real part of the actual
production cell integral; its imaginary part is zero. The outer `1 / √π` of
the full quadrature value is not included here. -/
theorem unit_production_cell_mem_of_model {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (η : ℝ) (cs hs cu hu : ℚ) (p : List (List ℚ)) (R : IntervalRat)
    (hhs : 0 < hs) (hhu : 0 < hu)
    (hsNonneg : 0 ≤ (cs : ℝ) - hs) (huNonneg : 0 ≤ (cu : ℝ) - hu)
    (hmodel : ∀ x ∈ Icc (-1 : ℝ) 1, ∀ y ∈ Icc (-1 : ℝ) 1,
      unitRealKernel i j η ((cs : ℝ) + (hs : ℝ) * x)
          ((cu : ℝ) + (hu : ℝ) * y) - squareListEval p x y ∈ R) :
    let cell : ℂ := ∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
      ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs),
        taylorQuadratureKernel η j N (gradedUnitCoeff i) u s
    cell.re ∈ IntervalRat.add (IntervalRat.singleton (hs * hu * squareListIntegralQ p))
        (IntervalRat.scale (4 * hs * hu) R) ∧ cell.im = 0 := by
  have hreal := integral_mem_affine_square_model_swapped (unitRealKernel i j η)
    cs hs cu hu p R hhs hhu (continuous_unitRealKernel i j η) hmodel
  have heq :
      (∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
        ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs),
          taylorQuadratureKernel η j N (gradedUnitCoeff i) u s) =
      ((∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
        ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), unitRealKernel i j η s u) : ℂ) := by
    apply integral_eq_ofReal_of_affine_cell
      (taylorQuadratureKernel η j N (gradedUnitCoeff i)) (unitRealKernel i j η)
      cs hs cu hu hhs hhu hsNonneg huNonneg
    intro u _ s _ huPos hsNonneg'
    exact taylorQuadratureKernel_unit_eq_realKernel i j η u s huPos hsNonneg'
  dsimp only
  rw [heq]
  constructor
  · simpa only [intervalIntegral.integral_ofReal, Complex.ofReal_re] using hreal
  · simp only [intervalIntegral.integral_ofReal, Complex.ofReal_im]

end Grothe.UpperChaos.RationalUnitProductionCell
