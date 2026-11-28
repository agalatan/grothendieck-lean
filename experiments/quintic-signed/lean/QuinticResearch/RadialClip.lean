import QuinticResearch.SignedFifth

/-! The square of the clipped Gaussian radius bounds half-difference energy. Agent-ID: codex-a7c4 -/

set_option warningAsError true
namespace Grothe.LowerAnalytic
open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

private theorem gaussian_radial_integral (F : ℝ → ℝ) (hF : Measurable F) :
    (∫ z, F ‖z‖ ∂gaussC) = ∫ s in Ioi 0, 2*s*exp (-s^2)*F s := by
  rw [integral_gaussC_polar (fun z ↦ F ‖z‖) (hF.comp continuous_norm.measurable)]
  have hsplit := setIntegral_prod_mul (μ := volume) (ν := volume)
    (fun s : ℝ ↦ 2*s*exp (-s^2)*F s) (fun _ : ℝ ↦ (2*π)⁻¹) (Ioi 0) (Ioo (-π) π)
  beta_reduce at hsplit
  rw [Measure.volume_eq_prod]
  calc
    _ = ∫ p in Ioi (0 : ℝ) ×ˢ Ioo (-π) π, (2*p.1*exp (-p.1^2)*F p.1) * (2*π)⁻¹ := by
      apply setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo)
      intro p hp
      dsimp only
      rw [norm_polarCoord_symm_of_mem hp]
      field_simp
    _ = _ := by
      rw [Measure.volume_eq_prod,hsplit,setIntegral_const]
      simp only [measureReal_def, volume_Ioo, sub_neg_eq_add, ENNReal.toReal_ofReal (by positivity : 0 ≤ π+π),smul_eq_mul]
      field_simp
      ring

theorem gaussian_squared_radius_clip {r : ℝ} (hr : 0 < r) :
    (∫ z, max (r-‖z‖) 0 ^2 ∂gaussC) ≤ r^4/6 := by
  rw [gaussian_radial_integral (fun s => max (r-s) 0 ^2) (by fun_prop)]
  have hi : (fun s : ℝ => 2*s*exp (-s^2)*max (r-s) 0 ^2) =
      (Iic r).indicator (fun s => 2*s*exp (-s^2)*(r-s)^2) := by
    funext s
    by_cases h : s ≤ r
    · rw [indicator_of_mem (show s ∈ Iic r from h),max_eq_left (sub_nonneg.mpr h)]
    · rw [indicator_of_notMem (show s ∉ Iic r from h),max_eq_right (by linarith)]
      ring
  rw [hi,setIntegral_indicator measurableSet_Iic, Ioi_inter_Iic]
  have hPoly : Continuous (fun s : ℝ => 2*s*(r-s)^2) := by fun_prop
  calc
    _ ≤ ∫ s in Ioc (0:ℝ) r, 2*s*(r-s)^2 := by
      apply setIntegral_mono_on
        ((show Continuous (fun s : ℝ => 2*s*exp (-s^2)*(r-s)^2) by fun_prop).continuousOn.integrableOn_compact isCompact_Icc |>.mono_set Ioc_subset_Icc_self)
        (hPoly.continuousOn.integrableOn_compact isCompact_Icc |>.mono_set Ioc_subset_Icc_self) measurableSet_Ioc
      intro s hs
      exact mul_le_mul_of_nonneg_right (mul_le_of_le_one_right (by nlinarith only [hs.1] : 0 ≤ 2*s)
        (Real.exp_le_one_iff.mpr (neg_nonpos.mpr (sq_nonneg s)))) (sq_nonneg _)
    _ = _ := by
      rw [← intervalIntegral.integral_of_le hr.le]
      let A := fun s : ℝ => r^2*s^2 - (4/3)*r*s^3 + s^4/2
      have hd (s : ℝ) : HasDerivAt A (2*s*(r-s)^2) s := by
        dsimp [A]
        convert (((((hasDerivAt_id s).pow 2).const_mul (r^2)).sub
          (((hasDerivAt_id s).pow 3).const_mul ((4/3)*r))).add (((hasDerivAt_id s).pow 4).div_const 2)) using 1
        · funext x; rfl
        · dsimp; ring
      rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun x _ => hd x) (hPoly.intervalIntegrable 0 r)]
      dsimp [A]; ring

private theorem clip_point (z h : ℂ) (hh : ‖h‖ ≤ 1) {r : ℝ} (hr : 0 < r) :
    r^2*(1-‖h‖^2) ≤ 2*r*(‖z‖-hre h z) + max (r-‖z‖) 0 ^2 := by
  have ha : hre h z ≤ ‖h‖*‖z‖ := by
    simpa [hre,norm_mul] using Complex.re_le_norm (conj h*z)
  have hdiff := mul_le_mul_of_nonneg_left ha (show 0 ≤ 2*r by positivity)
  by_cases hc : ‖z‖ ≤ r
  · rw [max_eq_left (sub_nonneg.mpr hc)]
    nlinarith only [hdiff,sq_nonneg (r*‖h‖-‖z‖)]
  · rw [max_eq_right (by linarith)]; norm_num
    have hprod := mul_nonneg (mul_nonneg hr.le (sub_nonneg.mpr (le_of_not_ge hc))) (sub_nonneg.mpr hh)
    nlinarith only [hdiff,hprod,sq_nonneg (r*(1-‖h‖))]

/-- The visible Gaussian radius penalizes the total energy of the half-difference. -/
theorem visible_half_difference_clip {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 0 < tOf (n+1) f g) {r : ℝ} (hr : 0 < r) :
    r^2*‖kOf (n+1) f g‖^2 ≤ 2*r*(√π/2-tOf (n+1) f g)+r^4/6 := by
  let z := visibleDirection (n+1) f g
  let h := hOf (n+1) f g
  let χ := fun w : ℂ => max (r-‖w‖) 0 ^2
  have zmem := visibleDirection_mem (n+1) f g
  have hunit := norm_visibleDirection_of_pos ht
  have law := hasLaw_unit_H10 _ zmem hunit
  have hχ : Integrable χ gaussC := (integrable_const (r^2)).mono' (by dsimp [χ]; fun_prop)
    (.of_forall fun x => by
      rw [Real.norm_eq_abs,abs_of_nonneg (sq_nonneg _)]
      exact pow_le_pow_left₀ (le_max_right _ _) (max_le (sub_le_self _ (norm_nonneg _)) hr.le) 2)
  have measχ : Measurable χ := by dsimp [χ]; fun_prop
  have hcomp : Integrable (fun x => χ (z x)) _ := law.integrable_comp hχ
  have priced : (∫ x, χ (z x) ∂stdGaussian ((n+1)+(n+1))) ≤ r^4/6 := by
    change (∫ x, (χ ∘ fun x => z x) x ∂stdGaussian ((n+1)+(n+1))) ≤ _
    rw [law.integral_comp measχ.aestronglyMeasurable]
    exact gaussian_squared_radius_clip hr
  have hnorm := ((Lp.memLp z).integrable (by norm_num)).norm
  have hpair := integrable_hre h z
  have hsquare := (Lp.memLp h).norm.integrable_sq
  have hi := integral_mono_ae (((integrable_const (1:ℝ)).sub hsquare).const_mul (r^2))
    (((hnorm.sub hpair).const_mul (2*r)).add hcomp) (by
      filter_upwards [norm_hOf_le (n+1) hf hg] with x hx
      exact clip_point (z x) (h x) hx hr)
  change (∫ x, r^2*(1-‖h x‖^2) ∂stdGaussian _) ≤ ∫ x, 2*r*(‖z x‖-hre (h x) (z x)) + χ (z x) ∂stdGaussian _ at hi
  have hsub : Integrable (fun x => ‖z x‖-hre (h x) (z x)) _ := hnorm.sub hpair
  have hlinear : Integrable (fun x => 2*r*(‖z x‖-hre (h x) (z x))) _ := hsub.const_mul _
  rw [integral_add hlinear hcomp,integral_const_mul,integral_const_mul,
    integral_sub (integrable_const (1:ℝ)) hsquare, integral_sub hnorm hpair, ← norm_sq_eq_integral,
    ← re_inner_eq_integral, integral_const] at hi
  simp only [probReal_univ,one_smul] at hi
  obtain ⟨c,hc⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 zmem
  have hzval : (∫ x, ‖z x‖ ∂stdGaussian _) = √π/2 := by
    dsimp [z]; rw [← hc,integral_norm_linL,hc,hunit,mul_one]
  rw [hzval,show (inner ℂ h z).re = tOf (n+1) f g from re_inner_visibleDirection _ _ _] at hi
  have hmass := normSq_hOf_add_normSq_kOf (n+1) hf hg
  change ‖h‖^2+‖kOf (n+1) f g‖^2 = 1 at hmass
  linarith only [hi,priced,congrArg (fun x : ℝ => r^2*x) hmass]

end Grothe.LowerAnalytic
