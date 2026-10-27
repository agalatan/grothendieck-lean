import Grothe.UpperChaos.HardyArcMean
import Grothe.UpperChaos.HardyArcRegionCheck
import Grothe.UpperChaos.HardyArcPart0
import Grothe.UpperChaos.HardyArcPart1
import Grothe.UpperChaos.HardyArcPart2
import Grothe.UpperChaos.HardyArcPart3

/-!
# The Hardy tail with only the real identification left

Steps 1(a), 1(c), 2 (`HardyHolo.lean`, `OddSeries.lean`, `OddParseval.lean`), 3 (the Gaussian Schur bound,
`SchurMain.lean`) and 4 (the checked arc cover and region, `HardyArc*.lean`) give the `hardy` statement for any
measurable pair `F, G` with `‖F‖, ‖G‖ ≤ 1` from one remaining input: the real odd-series identification (step 1(b)).
-/

namespace Grothe.UpperChaos

open HardyArcRegion

/-- **The region and the circle mean are proved** (from the checked disc and arc covers). -/
theorem hardy_region_and_mean {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1) :
    (∀ t ∈ Metric.ball (0 : ℂ) (regionR : ℝ), ∃ l > 0, KerPos (Rt t) l) ∧
      (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
        ‖HholPair F G (Rt (((4149 / 4000 : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ 7 / 4 := by
  have hU := kerPos_on_ball hardy_region_check
  exact ⟨hU, HardyArcMean.hmean_of_parts hFm hGm hF hG (by norm_num [regionR]) hU
    hardy_arc_part_0 hardy_arc_part_1 hardy_arc_part_2 hardy_arc_part_3⟩

/-- **The Hardy tail from the real identification alone** (step 1(b) is the only remaining input). -/
theorem hardy_of_real {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {h : ℕ → ℝ} (hs : Summable fun j => |h j|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun j => (h j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (HholPair F G (Rt t)))
    (J : ℕ) :
    ∑ n ∈ Finset.range J, h n ^ 2 * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4 := by
  obtain ⟨hU, hmean⟩ := hardy_region_and_mean hFm hGm hF hG
  exact hardy_of_pair_inputs hFm hGm hF hG (by norm_num [regionR]) hU hs hreal hmean J

end Grothe.UpperChaos
