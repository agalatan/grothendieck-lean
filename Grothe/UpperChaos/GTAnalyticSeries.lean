import Grothe.UpperChaos.HardyReal

/-! The actual GT continuation has its odd coefficient series at each unit
circle point; no numerical sample evaluations are asserted. -/

open Complex Metric
namespace Grothe.UpperChaos.DirectSample
noncomputable section

/-- Unit-circle identity for the actual continued kernel, using the proved
Hardy region, real Mehler identification and analytic continuation. -/
theorem GT_hasSum_unit_circle {z : ℂ} (hz : ‖z‖ = 1) :
    HasSum (fun j => (HardyReal.hGT phiBound j : ℂ) * z ^ (2 * j + 1))
      (HholPair Tround Tround (Rt z)) := by
  have hreg := (hardy_region_and_mean measurable_Tround measurable_Tround
    (norm_Tround_le phiBound) (norm_Tround_le phiBound)).1
  have hdiff := differentiableOn_HholPair_Rt measurable_Tround measurable_Tround
    (norm_Tround_le phiBound) (norm_Tround_le phiBound) Metric.isOpen_ball hreg
  have hr : (1 : ℝ) < (HardyArcRegion.regionR : ℝ) := by
    norm_num [HardyArcRegion.regionR]
  have hball := hasSum_odd_of_eqOn_real hr hdiff (HardyReal.summable_hGT phiBound)
    (HardyReal.hreal_GT phiBound)
  apply hball
  rw [Metric.mem_ball, dist_zero_right, hz]
  exact hr

end
end Grothe.UpperChaos.DirectSample
