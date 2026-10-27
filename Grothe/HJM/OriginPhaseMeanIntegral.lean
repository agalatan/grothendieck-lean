import Grothe.HJM.OriginWitnessRadialAmplitude
import Grothe.HJM.OriginRadialEnergy

/-!
# Zeroth radial phase moment

Agent-ID: codex-aa04. The measurable
radial amplitude is merely bounded; the panel approximant is not assumed
unit-disk-valued. A zeroed representative handles the phase at zero without
requiring a Gaussian non-atomicity lemma. The strict radius-eight cutoff is
removed only almost everywhere on the radial integral.
-/

open MeasureTheory Set Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.HJM.OriginPanel
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- The zeroth phase moment uses `2t`, not the charge-one mode's `2t²`. -/
def signedPhaseMean (u : ℂ) (re im : List ℚ) (ps : List Panel) : ℝ :=
  ∫ t in Ioi (0 : ℝ), 2 * t * Real.exp (-t ^ 2) *
    (conj u * approxList re im ps t).re

/-- Radial representative with the same value as phase squared at zero. -/
def zeroedPhaseRadial (v : ℝ → ℂ) (t : ℝ) : ℂ :=
  if t = 0 then 0 else v (t ^ 2)

theorem measurable_zeroedPhaseRadial (v : ℝ → ℂ) (hv : Measurable v) :
    Measurable (zeroedPhaseRadial v) := by
  unfold zeroedPhaseRadial
  exact measurable_const.ite (measurableSet_singleton 0)
    (hv.comp (by fun_prop : Measurable fun t : ℝ => t ^ 2))

lemma norm_zeroedPhaseRadial_le (v : ℝ → ℂ) {M : ℝ}
    (hbound : ∀ s, ‖v s‖ ≤ M) (t : ℝ) :
    ‖zeroedPhaseRadial v t‖ ≤ M := by
  have hM : 0 ≤ M := (norm_nonneg (v 0)).trans (hbound 0)
  unfold zeroedPhaseRadial
  split_ifs
  · simpa using hM
  · exact hbound _

/-- Exact pointwise cancellation including the zero phase. -/
lemma conj_phase_mul_radial (v : ℝ → ℂ) (z : ℂ) :
    conj (Grothe.Haag.ph z) * (Grothe.Haag.ph z * v (‖z‖ ^ 2)) =
      zeroedPhaseRadial v ‖z‖ := by
  by_cases hz : z = 0
  · subst z
    simp [zeroedPhaseRadial, Grothe.Haag.ph]
  · have hph : conj (Grothe.Haag.ph z) * Grothe.Haag.ph z = 1 := by
      rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq,
        norm_phase hz]
      norm_num
    simp only [zeroedPhaseRadial, if_neg (norm_ne_zero_iff.mpr hz)]
    rw [← mul_assoc, hph, one_mul]

/-- The scalar Gaussian radial weight is integrable on the positive line. -/
lemma integrable_radial_first_gaussian :
    IntegrableOn (fun t : ℝ => t * Real.exp (-t ^ 2)) (Ioi 0) := by
  have h := integrableOn_rpow_mul_exp_neg_mul_sq (b := 1) one_pos
    (s := (1 : ℝ)) (by norm_num)
  simpa using h

/-- Complete complex radial phase-mean integrability for a bounded measurable
amplitude. No boundedness by one is assumed. -/
theorem integrable_phase_radial_mean (v : ℝ → ℂ) (hv : Measurable v)
    {M : ℝ} (hbound : ∀ s, ‖v s‖ ≤ M) :
    IntegrableOn (fun t : ℝ => ((2 * t * Real.exp (-t ^ 2) : ℝ) : ℂ) *
      v (t ^ 2)) (Ioi 0) := by
  have hvz := measurable_zeroedPhaseRadial v hv
  have hR := integrable_radial_first_gaussian.ofReal.mul_bdd hvz.aestronglyMeasurable
    (Filter.Eventually.of_forall (norm_zeroedPhaseRadial_le v hbound))
  have h2 := hR.const_mul (2 : ℂ)
  apply h2.congr
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
  simp only [zeroedPhaseRadial, if_neg (ne_of_gt ht)]
  push_cast
  ring

/-- Exact phase inner product for an arbitrary bounded measurable radial
amplitude, with zero handled pointwise rather than by a measure-zero claim. -/
theorem phase_inner_radial_mean (v : ℝ → ℂ) (hv : Measurable v)
    {M : ℝ} (hbound : ∀ s, ‖v s‖ ≤ M)
    (hV : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC) :
    ⟪Grothe.Haag.phaseLp,
      hV.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))⟫_ℂ =
      ∫ t in Ioi (0 : ℝ), ((2 * t * Real.exp (-t ^ 2) : ℝ) : ℂ) * v (t ^ 2) := by
  have hz := measurable_zeroedPhaseRadial v hv
  have hG : Integrable (fun z : ℂ => zeroedPhaseRadial v ‖z‖) gaussC :=
    Integrable.of_bound (hz.comp measurable_norm).aestronglyMeasurable M
      (Filter.Eventually.of_forall fun z => norm_zeroedPhaseRadial_le v hbound ‖z‖)
  have hR := integrable_radial_first_gaussian.ofReal.mul_bdd hz.aestronglyMeasurable
    (Filter.Eventually.of_forall (norm_zeroedPhaseRadial_le v hbound))
  change ⟪Grothe.Haag.memLp_ph.toLp Grothe.Haag.ph,
    hV.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))⟫_ℂ = _
  rw [Grothe.UpperChaos.inner_toLp]
  calc
    _ = ∫ z : ℂ, zeroedPhaseRadial v ‖z‖ ∂gaussC := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (conj_phase_mul_radial v)
    _ = (2 : ℂ) * ∫ t in Ioi (0 : ℝ),
        ((t * Real.exp (-t ^ 2) : ℝ) : ℂ) * zeroedPhaseRadial v t :=
      integral_gaussC_radial_complex (zeroedPhaseRadial v) hz hG hR
    _ = ∫ t in Ioi (0 : ℝ), (2 : ℂ) *
        (((t * Real.exp (-t ^ 2) : ℝ) : ℂ) * zeroedPhaseRadial v t) :=
      (integral_const_mul (2 : ℂ) _).symm
    _ = _ := by
      apply integral_congr_ae
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
      simp only [zeroedPhaseRadial, if_neg (ne_of_gt ht)]
      push_cast
      ring

/-- The actual panel approximation's signed radial mean is exactly its
phase inner product. The sole cutoff discrepancy at t = 8 is null. -/
theorem signedPhaseMean_eq_inner (u : ℂ) (re im : List ℚ) (ps : List Panel)
    (hchecks : ps.all (panelCheck re im OriginPanels.epsilon) = true)
    (hcover : covers 0 8 ps = true)
    (hV : MemLp (fun z : ℂ => Grothe.Haag.ph z * radialAmplitude re im ps (‖z‖ ^ 2))
      2 gaussC) :
    signedPhaseMean u re im ps =
      (⟪u • Grothe.Haag.phaseLp,
        hV.toLp (fun z : ℂ => Grothe.Haag.ph z * radialAmplitude re im ps (‖z‖ ^ 2))⟫_ℂ).re := by
  let v := radialAmplitude re im ps
  have hv : Measurable v := measurable_radialAmplitude re im ps
  have hb : ∀ s, ‖v s‖ ≤ 1 + (OriginPanels.epsilon : ℝ) :=
    norm_radialAmplitude_le re im ps hchecks hcover
  have hi := integrable_phase_radial_mean v hv hb
  have hu := hi.const_mul (conj u)
  have hinner : (⟪u • Grothe.Haag.phaseLp,
      hV.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))⟫_ℂ) =
      ∫ t in Ioi (0 : ℝ), conj u *
        (((2 * t * Real.exp (-t ^ 2) : ℝ) : ℂ) * v (t ^ 2)) := by
    rw [inner_smul_left, phase_inner_radial_mean v hv hb hV]
    exact (integral_const_mul (conj u) _).symm
  rw [hinner, ← integral_re hu]
  unfold signedPhaseMean
  apply integral_congr_ae
  filter_upwards [ae_restrict_mem measurableSet_Ioi,
    (volume.restrict (Ioi (0 : ℝ))).ae_ne (8 : ℝ)] with t ht ht8
  have he := radialAmplitude_sq_of_ne re im hcover ht ht8
  simp only [v, he, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
    zero_mul, sub_zero]
  ring

/-- Concrete left binding, with the actual endpoint and actual approximation. -/
theorem left_signedPhaseMean_eq_inner :
    signedPhaseMean (f 0) OriginData.leftReal OriginData.leftImag OriginPanels.leftPanels =
      (⟪f 0 • Grothe.Haag.phaseLp, OriginPanels.leftApproxLp⟫_ℂ).re := by
  have h := signedPhaseMean_eq_inner (f 0) OriginData.leftReal OriginData.leftImag
    OriginPanels.leftPanels OriginPanels.left_checks OriginPanels.left_cover
    memLp_leftRadialAmplitude
  simpa only [leftRadialAmplitude_toLp] using h

/-- Concrete right binding, with the actual endpoint and actual approximation. -/
theorem right_signedPhaseMean_eq_inner :
    signedPhaseMean (g 0) OriginData.rightReal OriginData.rightImag OriginPanels.rightPanels =
      (⟪g 0 • Grothe.Haag.phaseLp, OriginPanels.rightApproxLp⟫_ℂ).re := by
  have h := signedPhaseMean_eq_inner (g 0) OriginData.rightReal OriginData.rightImag
    OriginPanels.rightPanels OriginPanels.right_checks OriginPanels.right_cover
    memLp_rightRadialAmplitude
  simpa only [rightRadialAmplitude_toLp] using h

end
end Grothe.HJM.Origin
