import Grothe.HJM.OriginResponse
import Grothe.HJM.OriginMehler
import Grothe.HJM.OriginEnergy
import Grothe.HJM.OriginTruncation

/-!
# The sixth HJM branch as an actual dominated radial kernel

Agent-ID: codex-aa04.

The exact polynomial-phase responses define the coefficient sequence; a table
of numbers is not used to define this kernel. Shared Gaussian realization,
the complex Hermite expansion and conjugate-reflection symmetrization give
the domination hypothesis needed by `Grothe.mixture_bound`.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.HJM.Origin

noncomputable section

lemma memLp_F : MemLp F 2 gaussC :=
  MemLp.of_bound measurable_F.aestronglyMeasurable 1
    (Filter.Eventually.of_forall norm_F_le)

lemma memLp_G : MemLp G 2 gaussC :=
  MemLp.of_bound measurable_G.aestronglyMeasurable 1
    (Filter.Eventually.of_forall norm_G_le)

/-- The actual Gaussian `L²` responses. -/
def FLp : Lp ℂ 2 gaussC := memLp_F.toLp F

def GLp : Lp ℂ 2 gaussC := memLp_G.toLp G

/-- Real signed coefficients of the reflection-symmetrized origin kernel. -/
def coeff (n : ℕ) : ℝ := symmetrizedPairCoeff FLp GLp n

/-- The origin branch used in the six-kernel mixture. -/
def kernel : ℂ → ℂ := radialKernel coeff

theorem coeff_summable : Summable fun n => |coeff n| :=
  symmetrizedPairCoeff_summable FLp GLp

/-- Identification with the two actual Gaussian response pairs on the closed disk. -/
theorem kernel_eq_symmetrized {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    kernel ρ = symmetrizedPairKernel F G ρ :=
  (symmetrizedPairKernel_eq_radialKernel measurable_F measurable_G
    memLp_F memLp_G F_charge hρ).symm

/-- Unconditional domination of the actual sixth HJM branch. -/
theorem kernel_dominated : DominatedKernel kernel :=
  symmetrizedPairCoeff_dominated measurable_F measurable_G norm_F_le norm_G_le
    memLp_F memLp_G F_charge

/-- The response at zero cancels the common phase-phase term before norms. -/
theorem endpoint_subtracted_coeff_bound (a b ξ : ℂ) :
    |(conj a * b).re| ≤ ‖ξ‖ * (‖a - f 0 * ξ‖ + ‖b - g 0 * ξ‖) +
      ‖a - f 0 * ξ‖ * ‖b - g 0 * ξ‖ := by
  have ha : f 0 * ξ + (a - f 0 * ξ) = a := by ring
  have hb : g 0 * ξ + (b - g 0 * ξ) = b := by ring
  simpa only [ha, hb] using
    origin_endpoint_cancellation (f 0) (g 0) (a - f 0 * ξ) (b - g 0 * ξ) ξ
      (norm_f_le 0) (norm_g_le 0) endpoint_cross_re

/-- Joint error budget for all omitted left coefficient integrals beyond `s=36`. -/
theorem left_spatial_tail_budget :
    ∑' n, ‖chargeOneCoeff ((memLp_spatialTail measurable_F norm_F_le 6).toLp
      (spatialTail F 6)) n‖ ^ 2 ≤ Real.exp (-36) :=
  spatialTail_coeff_budget_at_six measurable_F norm_F_le

/-- Joint error budget for all omitted right coefficient integrals beyond `s=36`. -/
theorem right_spatial_tail_budget :
    ∑' n, ‖chargeOneCoeff ((memLp_spatialTail measurable_G norm_G_le 6).toLp
      (spatialTail G 6)) n‖ ^ 2 ≤ Real.exp (-36) :=
  spatialTail_coeff_budget_at_six measurable_G norm_G_le

end

end Grothe.HJM.Origin
