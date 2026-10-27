import Grothe.HJM.OriginVisibleEnergy

/-!
# Radial lift and boundedness for the actual accepted panel approximation.

Agent-ID: codex-aa04.
-/

open MeasureTheory Set Finset Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.HJM.OriginPanel
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- The radial amplitude is cut off at the same strict radius as
`OriginPanels.radialApprox`. Negative inputs are harmless: `sqrt s = 0`. -/
def radialAmplitude (re im : List ℚ) (ps : List Panel) (s : ℝ) : ℂ :=
  if Real.sqrt s < 8 then approxList re im ps (Real.sqrt s) else 0

theorem measurable_radialAmplitude (re im : List ℚ) (ps : List Panel) :
    Measurable (radialAmplitude re im ps) := by
  exact ((measurable_approxList re im ps).comp Real.continuous_sqrt.measurable).ite
    (measurableSet_lt Real.continuous_sqrt.measurable measurable_const) measurable_const

theorem radialAmplitude_lift (re im : List ℚ) (ps : List Panel) (z : ℂ) :
    Grothe.Haag.ph z * radialAmplitude re im ps (‖z‖ ^ 2) =
      OriginPanels.radialApprox re im ps z := by
  simp only [radialAmplitude, OriginPanels.radialApprox, Real.sqrt_sq (norm_nonneg z),
    mul_ite, mul_zero]

/-- The approximating radial amplitude is bounded without being required to
lie in the unit disk. The uniform phase residual supplies the extra epsilon. -/
theorem norm_radialAmplitude_le (re im : List ℚ) (ps : List Panel)
    (hchecks : ps.all (panelCheck re im OriginPanels.epsilon) = true)
    (hcover : covers 0 8 ps = true) (s : ℝ) :
    ‖radialAmplitude re im ps s‖ ≤ 1 + (OriginPanels.epsilon : ℝ) := by
  unfold radialAmplitude
  split_ifs with ht
  · have he := approxList_uniform_error re im OriginPanels.epsilon ps hchecks hcover
      (by norm_num) (Real.sqrt s) (by simp) (by simpa using ht.le)
    have hp := Grothe.Haag.norm_ph_le (evalC ⟨re, im⟩ (Real.sqrt s ^ 2))
    calc
      ‖approxList re im ps (Real.sqrt s)‖ =
          ‖(approxList re im ps (Real.sqrt s) -
            Grothe.Haag.ph (evalC ⟨re, im⟩ (Real.sqrt s ^ 2))) +
            Grothe.Haag.ph (evalC ⟨re, im⟩ (Real.sqrt s ^ 2))‖ := by
        rw [sub_add_cancel]
      _ ≤ _ + _ := norm_add_le _ _
      _ ≤ (OriginPanels.epsilon : ℝ) + 1 := add_le_add he hp
      _ = _ := by ring
  · norm_num [OriginPanels.epsilon]

/-- Except at the one cutoff point, the radial amplitude at `t²` is the
same piecewise polynomial used by the signed Gaussian moment checker. -/
theorem radialAmplitude_sq_of_ne (re im : List ℚ) {ps : List Panel}
    (hcover : covers 0 8 ps = true) {t : ℝ} (ht : 0 < t) (ht8 : t ≠ 8) :
    radialAmplitude re im ps (t ^ 2) = approxList re im ps t := by
  simp only [radialAmplitude, Real.sqrt_sq ht.le]
  by_cases h : t < 8
  · rw [ite_eq_left h]
  · have hgt : (8 : ℝ) < t := lt_of_le_of_ne (le_of_not_gt h) (Ne.symm ht8)
    rw [ite_eq_right h, approxList_zero_of_gt re im ps hcover t (by simpa using hgt)]

def leftRadialAmplitude : ℝ → ℂ :=
  radialAmplitude OriginData.leftReal OriginData.leftImag OriginPanels.leftPanels

def rightRadialAmplitude : ℝ → ℂ :=
  radialAmplitude OriginData.rightReal OriginData.rightImag OriginPanels.rightPanels

theorem leftRadialAmplitude_lift :
    (fun z : ℂ => Grothe.Haag.ph z * leftRadialAmplitude (‖z‖ ^ 2)) =
      OriginPanels.leftApprox := by
  funext z
  exact radialAmplitude_lift _ _ _ z

theorem rightRadialAmplitude_lift :
    (fun z : ℂ => Grothe.Haag.ph z * rightRadialAmplitude (‖z‖ ^ 2)) =
      OriginPanels.rightApprox := by
  funext z
  exact radialAmplitude_lift _ _ _ z

theorem memLp_leftRadialAmplitude :
    MemLp (fun z : ℂ => Grothe.Haag.ph z * leftRadialAmplitude (‖z‖ ^ 2)) 2 gaussC := by
  rw [leftRadialAmplitude_lift]
  exact OriginPanels.memLp_leftApprox

theorem memLp_rightRadialAmplitude :
    MemLp (fun z : ℂ => Grothe.Haag.ph z * rightRadialAmplitude (‖z‖ ^ 2)) 2 gaussC := by
  rw [rightRadialAmplitude_lift]
  exact OriginPanels.memLp_rightApprox

theorem leftRadialAmplitude_toLp :
    memLp_leftRadialAmplitude.toLp (fun z : ℂ =>
      Grothe.Haag.ph z * leftRadialAmplitude (‖z‖ ^ 2)) = OriginPanels.leftApproxLp := by
  apply MemLp.toLp_congr memLp_leftRadialAmplitude OriginPanels.memLp_leftApprox
  exact Filter.Eventually.of_forall fun z => congrFun leftRadialAmplitude_lift z

theorem rightRadialAmplitude_toLp :
    memLp_rightRadialAmplitude.toLp (fun z : ℂ =>
      Grothe.Haag.ph z * rightRadialAmplitude (‖z‖ ^ 2)) = OriginPanels.rightApproxLp := by
  apply MemLp.toLp_congr memLp_rightRadialAmplitude OriginPanels.memLp_rightApprox
  exact Filter.Eventually.of_forall fun z => congrFun rightRadialAmplitude_lift z


end

end Grothe.HJM.Origin
