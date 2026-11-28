import Grothe.LowerAnalytic.CapPolar
import Grothe.LowerAnalytic.QuinticDiffuseCarrier
import Grothe.LowerAnalytic.QuinticRemoteSupport
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.MeasureTheory.Integral.Layercake

/-!
# Stability at the largest visible Gaussian amplitude

Clipping the complex Gaussian radius bounds the midpoint’s squared distance from
its visible phase and the full mass of the half-difference in a single estimate.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- The density of a proper Gaussian is bounded by `1 / π`. -/
theorem gaussC_open_disk_prob {r : ℝ} (hr : 0 ≤ r) :
    gaussC.real (Metric.ball (0 : ℂ) r) ≤ r ^ 2 := by
  let s := Metric.ball (0 : ℂ) r
  have hs : MeasurableSet s := Metric.isOpen_ball.measurableSet
  have hvol : volume.real s = r ^ 2 * π := by
    simp [s, measureReal_def, Complex.volume_ball, ENNReal.toReal_ofReal hr, ENNReal.toReal_pow]
  have hi := integral_gaussC_eq_volume (s.indicator (fun _ => (1 : ℝ)))
    (measurable_const.indicator hs)
  have heq : (fun z : ℂ => (π⁻¹ * exp (-Complex.normSq z)) * s.indicator (fun _ => (1 : ℝ)) z) =
      s.indicator (fun z => π⁻¹ * exp (-Complex.normSq z)) := by
    funext z; by_cases hz : z ∈ s <;> simp [hz]
  rw [heq, integral_indicator hs, integral_indicator hs, setIntegral_const, smul_eq_mul, mul_one] at hi
  rw [hi]
  calc (∫ z in s, π⁻¹ * exp (-Complex.normSq z)) ≤ ∫ _z in s, π⁻¹ := by
         have hf : Continuous (fun z : ℂ => π⁻¹ * exp (-Complex.normSq z)) := by fun_prop
         apply setIntegral_mono_on
           ((hf.continuousOn.integrableOn_compact (isCompact_closedBall (0 : ℂ) r)).mono_set
             Metric.ball_subset_closedBall)
           (integrableOn_const (C := π⁻¹) (show (volume : Measure ℂ) s ≠ ⊤ from measure_ball_lt_top.ne)) hs
         intro z _
         exact mul_le_of_le_one_right (by positivity) (Real.exp_le_one_iff.mpr (neg_nonpos.mpr (Complex.normSq_nonneg z)))
       _ = r ^ 2 := by rw [setIntegral_const, smul_eq_mul, hvol]; field_simp

/-- Averaging the Gaussian disk bound over smaller radii retains the factor `1/3`
in the clipping cost for a small complex radius. -/
theorem gaussC_soft_disk {r : ℝ} (hr : 0 < r) :
    (∫ z, max (r - ‖z‖) 0 ∂gaussC) ≤ r^3/3 := by
  let F : ℂ → ℝ := fun z => max (r - ‖z‖) 0
  have hF0 (z : ℂ) : 0 ≤ F z := le_max_right _ _
  have hFi : Integrable F gaussC := (integrable_const r).mono' (by fun_prop)
    (.of_forall fun z => by rw [Real.norm_eq_abs, abs_of_nonneg (hF0 _)];
                            exact max_le (sub_le_self _ (norm_nonneg _)) hr.le)
  change (∫ z, F z ∂gaussC) ≤ _
  rw [hFi.integral_eq_integral_meas_lt (.of_forall hF0)]
  let g : ℝ → ℝ := (Ioc 0 r).indicator fun t => (r-t)^2
  have hg : Integrable g := ((Continuous.integrableOn_Icc (by fun_prop : Continuous (fun t : ℝ => (r-t)^2))).mono_set
    Ioc_subset_Icc_self).integrable_indicator measurableSet_Ioc
  calc _ ≤ ∫ t in Ioi (0:ℝ), g t := by
         apply integral_mono_of_nonneg (.of_forall fun _ => measureReal_nonneg) hg.integrableOn
         filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
         have ht' : 0 < t := ht
         by_cases htr : t ≤ r
         · have he : {z : ℂ | t < F z} = Metric.ball (0 : ℂ) (r-t) := by
             ext z; simp [F, lt_max_iff, ht'.not_gt, Metric.mem_ball, dist_zero_right]; constructor <;> intro h <;> linarith
           rw [he, show g t = (r-t)^2 from indicator_of_mem (show t ∈ Ioc (0:ℝ) r from ⟨ht',htr⟩) _]
           exact gaussC_open_disk_prob (sub_nonneg.mpr htr)
         · have he : {z : ℂ | t < F z} = ∅ := by
             apply eq_empty_iff_forall_notMem.mpr; intro z hz
             have htF : t < max (r-‖z‖) 0 := hz
             exact htr (htF.le.trans (max_le (sub_le_self _ (norm_nonneg _)) hr.le))
           simp [he,g,htr]
       _ = r^3/3 := by
         rw [show (∫ t in Ioi (0:ℝ), g t) = ∫ t in Ioc 0 r, (r-t)^2 by
               rw [show g = _ from rfl, integral_indicator measurableSet_Ioc, Measure.restrict_restrict measurableSet_Ioc,
                 inter_eq_left.mpr (show Ioc (0:ℝ) r ⊆ Ioi 0 from fun _ hx => hx.1)]]
         rw [← intervalIntegral.integral_of_le hr.le]
         have he := intervalIntegral.integral_comp_sub_left (fun t : ℝ => t^2) r (a := 0) (b := r)
         norm_num [integral_pow] at he ⊢; exact he

/-- A unit complex phase with the visible direction, with a fixed value at the origin. -/
def unitPhaseL {n : ℕ} (z : L2G n) : L2G n :=
  (MemLp.of_bound (measurable_ph.comp_aemeasurable (Lp.aestronglyMeasurable z).aemeasurable).aestronglyMeasurable
    1 (.of_forall fun x => norm_ph_le (z x))).toLp (fun x => ph (z x))

private theorem norm_ph_one (w : ℂ) : ‖ph w‖ = 1 := by
  by_cases hw : w = 0
  · simp [ph, hw]
  · simp [ph, hw, norm_ne_zero_iff.mpr hw]

private theorem phase_scale (w : ℂ) : (‖w‖ : ℂ) * ph w = w := by
  by_cases hw : w = 0
  · simp [hw]
  · have hn : (‖w‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.mpr hw
    unfold ph
    simp [hw, hn, mul_div_cancel₀]

/-- Clipping the radius at `r` bounds angular disagreement without division by a random radius. -/
private theorem pointwise_phase_stability (z h : ℂ) (hh : ‖h‖ ≤ 1) (r : ℝ) :
    r * (1 - (conj h * ph z).re) ≤ ‖z‖ - (conj h * z).re +
      2 * max (r - ‖z‖) 0 := by
  have hn : ‖conj h * ph z‖ ≤ 1 := by simpa [norm_mul, norm_ph_one] using hh
  have hp := (Complex.re_le_norm (conj h * ph z)).trans hn
  have hm := (Complex.abs_re_le_norm (conj h * ph z)).trans hn
  have he : (conj h * z).re = ‖z‖ * (conj h * ph z).re := by
    have e : conj h * z = (‖z‖ : ℂ) * (conj h * ph z) := by rw [mul_left_comm, phase_scale]
    rw [e, Complex.re_ofReal_mul]
  rw [he]
  by_cases hz : ‖z‖ ≤ r
  · rw [max_eq_left (sub_nonneg.mpr hz)]
    have hlow := (abs_le.mp hm).1
    nlinarith only [mul_nonneg (sub_nonneg.mpr hz) (show 0 ≤ 1 + (conj h * ph z).re by linarith)]
  · rw [max_eq_right (by linarith)]
    nlinarith only [mul_nonneg (by linarith : 0 ≤ ‖z‖-r) (sub_nonneg.mpr hp)]

/-- The same phase comparison yields an integrated mass bound on an actual phase pair. -/
theorem phase_stability_soft_disk {n : ℕ} {f g z : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (hz : HasLaw (fun x => z x) gaussC (stdGaussian (n+n))) {r : ℝ} (hr : 0 < r) :
    r * (‖hOf n f g - unitPhaseL z‖ ^ 2 + ‖kOf n f g‖ ^ 2) ≤
      2 * ((∫ x, ‖z x‖ ∂stdGaussian (n+n)) - (inner ℂ (hOf n f g) z).re) + 4 * r ^ 3 / 3 := by
  let h := hOf n f g
  let p := unitPhaseL z
  have hp : ⇑p =ᵐ[stdGaussian (n+n)] fun x => ph (z x) := MemLp.coeFn_toLp _
  have hpu : p ∈ Unimod (stdGaussian (n+n)) := by
    filter_upwards [hp] with x hx
    rw [hx, norm_ph_one]
  let χ : ℂ → ℝ := fun w => max (r-‖w‖) 0
  have hmχ : Measurable χ := by unfold χ; fun_prop
  have hiχ : Integrable χ gaussC := (integrable_const r).mono' hmχ.aestronglyMeasurable
    (.of_forall fun x => by rw [Real.norm_eq_abs, abs_of_nonneg (show 0 ≤ χ x from le_max_right _ _)];
                            exact max_le (sub_le_self _ (norm_nonneg _)) hr.le)
  have hiχz : Integrable (fun x => χ (z x)) (stdGaussian (n+n)) := hz.integrable_comp hiχ
  have heχ : (∫ x, χ (z x) ∂stdGaussian (n+n)) ≤ r ^ 3 / 3 := by
    change (∫ x, (χ ∘ fun x => z x) x ∂stdGaussian (n+n)) ≤ _
    rw [hz.integral_comp hmχ.aestronglyMeasurable]; exact gaussC_soft_disk hr
  have hc := integrable_hre h p
  have hd := integrable_hre h z
  have hnorm := ((Lp.memLp z).integrable (by norm_num)).norm
  have hm := integral_mono_ae (((integrable_const (1:ℝ)).sub hc).const_mul r)
      ((hnorm.sub hd).add (hiχz.const_mul 2)) (by
        filter_upwards [norm_hOf_le n hf hg, hp] with x hx hy
        change r * (1 - hre (h x) (p x)) ≤ ‖z x‖ - hre (h x) (z x) + 2 * χ (z x)
        rw [hy]; exact pointwise_phase_stability (z x) (h x) hx r)
  change (∫ x, r * (1 - hre (h x) (p x)) ∂stdGaussian (n+n)) ≤
    ∫ x, (‖z x‖ - hre (h x) (z x)) + 2*χ (z x) ∂stdGaussian (n+n) at hm
  have hi1 : Integrable (fun x => ‖z x‖ - hre (h x) (z x)) (stdGaussian (n+n)) := hnorm.sub hd
  have hi2 : Integrable (fun x => 2*χ (z x)) (stdGaussian (n+n)) := hiχz.const_mul 2
  rw [integral_add hi1 hi2, integral_const_mul, integral_const_mul,
    integral_sub (integrable_const (1:ℝ)) hc, integral_sub hnorm hd,
    ← re_inner_eq_integral h p, ← re_inner_eq_integral h z, integral_const] at hm
  simp only [probReal_univ, one_smul] at hm
  have hp₂ := norm_sq_of_mem_unimod n hpu
  have hkm := normSq_hOf_add_normSq_kOf n hf hg
  change r*(‖h-p‖^2+‖kOf n f g‖^2) ≤ _
  rw [@norm_sub_sq ℂ]
  change r * (‖h‖ ^ 2 - 2 * (inner ℂ h p).re + ‖p‖ ^ 2 + ‖kOf n f g‖ ^ 2) ≤ _
  change ‖h‖^2 + ‖kOf n f g‖^2 = 1 at hkm
  change _ ≤ 2*((∫ x, ‖z x‖ ∂stdGaussian (n+n))-(inner ℂ h z).re)+4*r^3/3
  rw [hp₂]
  nlinarith only [hm, heχ, congrArg (fun a : ℝ => r * a) hkm]

/-- Every positive-amplitude phase pair is close to the phase of its own visible
projection when its amplitude is close to the largest possible Gaussian first moment. -/
theorem visible_phase_stability {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 0 < tOf (n+1) f g) {r : ℝ} (hr : 0 < r) :
    r * (‖hOf (n+1) f g - unitPhaseL (visibleDirection (n+1) f g)‖ ^ 2 + ‖kOf (n+1) f g‖ ^ 2) ≤
      2 * (√π / 2 - tOf (n+1) f g) + 4 * r ^ 3 / 3 := by
  have hz := visibleDirection_mem (n+1) f g
  have hu := norm_visibleDirection_of_pos ht
  have hh := phase_stability_soft_disk hf hg (hasLaw_unit_H10 _ hz hu) hr
  obtain ⟨c,hc⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hz
  have hm : (∫ x, ‖visibleDirection (n+1) f g x‖ ∂stdGaussian ((n+1)+(n+1))) = √π / 2 := by
    rw [← hc, integral_norm_linL, hc, hu, mul_one]
  rwa [hm,re_inner_visibleDirection] at hh

end
end Grothe.LowerAnalytic
