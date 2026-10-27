import Grothe.UpperChaos.Smoothing
import Grothe.UpperChaos.KernelStability
import Grothe.Upper.Final

/-!
# Stability of the complete kernel under source approximation

The smoothing map and both fixed preprocessing polynomials are contractions.
Thus an L² approximation to the unsmoothed response controls the entire
processed kernel, including every omitted mode. This result does not construct
or certify such an approximation.
-/

open MeasureTheory Grothe.Upper

namespace Grothe.UpperChaos
noncomputable section

/-- A source approximation with error `e` changes the whole smoothed,
preprocessed coefficient sequence by at most `2e`. -/
theorem smooth_kernel_stability (F G : Lp ℂ 2 mu2)
    (hF : ‖F‖ ≤ 1) (hG : ‖G‖ ≤ 1) {e : ℝ} (he : ‖G - F‖ ≤ e) :
    ∑' j, |kernelCoeff (energy (smoothOp G)) j -
      kernelCoeff (energy (smoothOp F)) j| ≤ 2 * e := by
  apply tsum_abs_bivarKernel_energy_sub_le_two_mul (smoothOp F) (smoothOp G)
    primaryPoly auxPoly Grothe.l1_primaryPoly Grothe.l1_auxPoly
    ((norm_smoothOp_le F).trans hF) ((norm_smoothOp_le G).trans hG)
  rw [← map_sub]
  exact (norm_smoothOp_le (G - F)).trans he

end
end Grothe.UpperChaos
