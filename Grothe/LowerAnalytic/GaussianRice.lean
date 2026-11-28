import Grothe.LowerAnalytic.CapPolar
import Grothe.LowerAnalytic.FibreSup
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

/-!
# The Gaussian Rice tangent for the physical remote scale

For a proper complex Gaussian of variance one, translation by `w` increases the
mean radius by at most `√π * ‖w‖² / 4`. First bound the mean absolute real
projection using its Gaussian density. A second independent proper Gaussian
averages over directions and gives the complex estimate without choosing a phase.

Agent-ID: codex-a7c4
-/

set_option warningAsError true
open MeasureTheory Real Set Filter
open scoped Topology

namespace Grothe.LowerAnalytic.PhysicalRice

/-- The real part of a proper complex Gaussian has density exp(-x²)/√π. -/
private theorem integral_re (f : ℝ → ℝ) (hf : Measurable f) :
    (∫ z, f z.re ∂gaussC) = (√π)⁻¹ * ∫ x : ℝ, exp (-x^2)*f x := by
  rw [integral_gaussC_eq_volume (fun z ↦ f z.re) (hf.comp Complex.measurable_re),
    ← (Complex.volume_preserving_equiv_real_prod.symm).integral_comp
      Complex.measurableEquivRealProd.symm.measurableEmbedding]
  have prod := integral_prod_mul (μ := (volume : Measure ℝ)) (ν := (volume : Measure ℝ))
    (fun x : ℝ ↦ exp (-x^2)*f x) (fun y : ℝ ↦ exp (-y^2))
  beta_reduce at prod
  have hpoint (p : ℝ × ℝ) :
      π⁻¹ * exp (-Complex.normSq (Complex.measurableEquivRealProd.symm p)) *
        f (Complex.measurableEquivRealProd.symm p).re =
      π⁻¹ * ((exp (-p.1^2)*f p.1)*exp (-p.2^2)) := by
    change π⁻¹ * exp (-(p.1 * p.1 + p.2*p.2)) * f p.1 = _
    rw [neg_add, exp_add]; ring_nf
  simp_rw [hpoint]
  rw [integral_const_mul, Measure.volume_eq_prod, prod,
    show (∫ y : ℝ, exp (-y^2)) = √π by simpa using integral_gaussian 1]
  have hpi : 0 < √π := by positivity
  have hk : π⁻¹ * √π = (√π)⁻¹ := by
    field_simp
    nlinarith [Real.sq_sqrt Real.pi_pos.le]
  rw [← hk]
  ring

private theorem integral_tent (a : ℝ) (ha : 0 ≤ a) :
    (∫ x in Icc (-a) a, (a-|x|)) = a^2 := by
  rw [integral_Icc_eq_integral_Ioc, ← intervalIntegral.integral_of_le (by linarith : -a ≤ a)]
  have hcont : Continuous (fun x : ℝ ↦ a - |x|) := by fun_prop
  rw [← intervalIntegral.integral_add_adjacent_intervals
    (hcont.intervalIntegrable (-a) 0) (hcont.intervalIntegrable 0 a)]
  have hleft : (∫ x in -a..0, a-|x|) = ∫ x in -a..0, a+x := by
    apply intervalIntegral.integral_congr
    intro x hx
    rw [uIcc_of_le (neg_nonpos.mpr ha)] at hx
    change a-|x|=a+x
    rw [abs_of_nonpos hx.2]; ring
  have hright : (∫ x in 0..a, a-|x|) = ∫ x in 0..a, a-x := by
    apply intervalIntegral.integral_congr
    intro x hx
    rw [uIcc_of_le ha] at hx
    change a-|x|=a-x
    rw [abs_of_nonneg hx.1]
  rw [hleft, hright,
    intervalIntegral.integral_add (f := fun _ : ℝ ↦ a) (g := fun x : ℝ ↦ x) (intervalIntegrable_const) (continuous_id.intervalIntegrable _ _),
    intervalIntegral.integral_sub (f := fun _ : ℝ ↦ a) (g := fun x : ℝ ↦ x) (intervalIntegrable_const) (continuous_id.intervalIntegrable _ _),
    integral_id, integral_id]
  simp [smul_eq_mul]
  ring


private theorem integral_tent_second (a : ℝ) (ha : 0 ≤ a) :
    (∫ x in Icc (-a) a, (a-|x|)*x^2) = a^4/6 := by
  rw [integral_Icc_eq_integral_Ioc, ← intervalIntegral.integral_of_le (by linarith : -a ≤ a)]
  have hc : Continuous (fun x : ℝ ↦ (a-|x|)*x^2) := by fun_prop
  rw [← intervalIntegral.integral_add_adjacent_intervals
    (hc.intervalIntegrable (-a) 0) (hc.intervalIntegrable 0 a)]
  have hleft : (∫ x in -a..0, (a-|x|)*x^2) = ∫ x in -a..0, a*x^2+x^3 := by
    apply intervalIntegral.integral_congr
    intro x hx
    rw [uIcc_of_le (neg_nonpos.mpr ha)] at hx
    change (a-|x|)*x^2=_
    rw [abs_of_nonpos hx.2]; ring
  have hright : (∫ x in 0..a, (a-|x|)*x^2) = ∫ x in 0..a, a*x^2-x^3 := by
    apply intervalIntegral.integral_congr
    intro x hx
    rw [uIcc_of_le ha] at hx
    change (a-|x|)*x^2=_
    rw [abs_of_nonneg hx.1]; ring
  have h2 : Continuous (fun x : ℝ ↦ a*x^2) := by fun_prop
  have h3 : Continuous (fun x : ℝ ↦ x^3) := by fun_prop
  rw [hleft,hright,intervalIntegral.integral_add (h2.intervalIntegrable _ _) (h3.intervalIntegrable _ _),
    intervalIntegral.integral_sub (h2.intervalIntegrable _ _) (h3.intervalIntegrable _ _)]
  simp only [intervalIntegral.integral_const_mul, integral_pow]
  norm_num
  ring

private theorem density_tent (a x : ℝ) (hx : x ∈ Icc (-a) a) :
    exp (-x^2)*(a-|x|) ≤ (a-|x|) - ((a-|x|)*x^2)/(1+a^2) := by
  have hab : |x| ≤ a := abs_le.mpr hx
  have ha : 0 ≤ a := (abs_nonneg _).trans hab
  have hs : 0 ≤ 1+a^2 := by positivity
  have hp : 0 < 1+x^2 := by positivity
  have hxx : x^2 ≤ a^2 := by
    simpa only [sq_abs] using (sq_le_sq₀ (abs_nonneg x) ha).2 hab
  have he : exp (-x^2) ≤ (1+x^2)⁻¹ := by
    rw [Real.exp_neg]
    apply inv_anti₀ hp
    linarith [Real.add_one_le_exp (x^2)]
  have hbound : exp (-x^2) ≤ 1-x^2/(1+a^2) := by
    apply he.trans
    rw [inv_eq_one_div]
    field_simp [show 0 < 1+a^2 by positivity, hp]
    nlinarith only [mul_nonneg (sq_nonneg x) (sub_nonneg.mpr hxx)]
  calc
    exp (-x^2)*(a-|x|) ≤ (1-x^2/(1+a^2))*(a-|x|) :=
      mul_le_mul_of_nonneg_right hbound (sub_nonneg.mpr hab)
    _ = _ := by ring

/-- Affine numerator and quadratic coefficient of the real marginal support. -/
noncomputable def riceIntercept (k : ℝ) : ℝ := 1+k^2/6
noncomputable def riceSlope (k : ℝ) : ℝ := 1-(2*k-k^2)/6

theorem riceSlope_pos (k : ℝ) : 0 < riceSlope k := by
  unfold riceSlope
  nlinarith only [sq_nonneg (k-1)]

/-- The affine cost of the triangular shift at any rational or real tangent parameter. -/
private theorem tent_le (a k : ℝ) (ha : 0 ≤ a) :
    (∫ z : ℂ, max (a - |z.re|) 0 ∂gaussC) ≤ (√π)⁻¹*(riceIntercept k-1+riceSlope k*a^2) := by
  rw [integral_re (fun x : ℝ ↦ max (a - |x|) 0) (by fun_prop)]
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  have hid : (fun x : ℝ ↦ exp (-x^2)*max (a-|x|) 0) =
      (Icc (-a) a).indicator (fun x ↦ exp (-x^2)*(a-|x|)) := by
    funext x
    by_cases h : x ∈ Icc (-a) a
    · rw [indicator_of_mem h, max_eq_left (sub_nonneg.mpr (abs_le.mpr h))]
    · have hlt : a < |x| := lt_of_not_ge (fun hx ↦ h (abs_le.mp hx))
      rw [indicator_of_notMem h, max_eq_right (sub_nonpos.mpr hlt.le), mul_zero]
  rw [hid, integral_indicator measurableSet_Icc]
  calc
    _ ≤ ∫ x in Icc (-a) a, ((a-|x|)-((a-|x|)*x^2)/(1+a^2)) := by
      apply setIntegral_mono_on (Continuous.integrableOn_Icc (by fun_prop))
        (Continuous.integrableOn_Icc (by fun_prop)) measurableSet_Icc
      exact fun x hx ↦ density_tent a x hx
    _ = a^2-a^4/(6*(1+a^2)) := by
      rw [integral_sub (Continuous.integrableOn_Icc (by fun_prop)) (Continuous.integrableOn_Icc (by fun_prop)),
        integral_div,integral_tent a ha,integral_tent_second a ha]
      rw [div_div]
    _ ≤ _ := by
      unfold riceIntercept riceSlope
      have hpos : 0 < 1+a^2 := by positivity
      field_simp [hpos]
      nlinarith only [sq_nonneg (a^2-k*(1+a^2))]

private theorem mean_abs_re : (∫ z : ℂ, |z.re| ∂gaussC) = (√π)⁻¹ := by
  rw [integral_re abs (by fun_prop)]
  have hall : (∫ x : ℝ, exp (-x^2)*|x|) = 2*∫ x in Ioi (0:ℝ), exp (-x^2)*x := by
    have h := integral_comp_abs (f := fun x : ℝ ↦ exp (-x^2)*x)
    beta_reduce at h
    simp_rw [sq_abs] at h
    exact h
  have hsub := integral_comp_rpow_Ioi_of_pos (g := fun y : ℝ ↦ exp (-y))
    (p := (2:ℝ)) (by norm_num)
  rw [integral_exp_neg_Ioi_zero] at hsub
  norm_num [smul_eq_mul, Real.rpow_two] at hsub
  have heq : (2*∫ x in Ioi (0:ℝ), exp (-x^2)*x) = 1 := by
    rw [← integral_const_mul, ← hsub]
    apply setIntegral_congr_fun measurableSet_Ioi
    intro x hx
    dsimp only
    ring
  rw [hall,heq,mul_one]

/-- Sharp quadratic majorant for the first absolute moment of a shifted real marginal. -/
private theorem shifted_abs_re_le (k b : ℝ) :
    (∫ z : ℂ, |z.re+b| ∂gaussC) ≤ (√π)⁻¹*(riceIntercept k+riceSlope k*b^2) := by
  have hiR : Integrable (fun z : ℂ ↦ z.re) gaussC := by
    apply integrable_gaussC_of_bound _ (by fun_prop) 1 1 0 0
    intro z
    have h := Complex.abs_re_le_norm z
    rw [Complex.normSq_eq_norm_sq]
    nlinarith [sq_nonneg (‖z‖-1)]
  have plus : Integrable (fun z : ℂ ↦ |z.re+b|) gaussC :=
    (hiR.add (integrable_const b)).abs
  have minus : Integrable (fun z : ℂ ↦ |z.re-b|) gaussC :=
    (hiR.sub (integrable_const b)).abs
  have equal : (∫ z : ℂ, |z.re-b| ∂gaussC) = ∫ z : ℂ, |z.re+b| ∂gaussC := by
    let g (z : ℂ) := |z.re+b|
    have h := integral_rot_continuous (-1) (by simp) g (by unfold g; fun_prop)
    simp only [g,neg_one_mul,Complex.neg_re, neg_add_eq_sub] at h
    simpa only [abs_sub_comm b] using h
  have pt (x : ℝ) : |x+b|+|x-b| = 2*(|x|+max (|b|-|x|) 0) := by
    simp only [abs_eq_max_neg, max_def]
    split_ifs <;> linarith
  have hrhs : Integrable (fun z : ℂ ↦ max (|b|-|z.re|) 0) gaussC :=
    ((integrable_const |b|).sub hiR.abs).sup (integrable_const 0)
  have h := integral_add plus minus
  simp_rw [pt] at h
  rw [integral_const_mul, integral_add hiR.abs hrhs, mean_abs_re, equal] at h
  have kt := tent_le |b| k (abs_nonneg b)
  rw [sq_abs] at kt
  nlinarith


/-- Gaussian probe along an arbitrary complex direction. -/
theorem projected_abs_shift (k : ℝ) (c w : ℂ) :
    (∫ z : ℂ, |(c*(z+w)).re| ∂gaussC) ≤
      (√π)⁻¹*(riceIntercept k*‖c‖ + riceSlope k*((c*w).re^2/‖c‖)) := by
  by_cases hc : c=0
  · simp [hc]
  have hn : 0 < ‖c‖ := norm_pos_iff.mpr hc
  let u : ℂ := c / (‖c‖ : ℂ)
  have hu : ‖u‖=1 := by simp [u, hn.ne']
  have he (x : ℂ) : (c*x).re = ‖c‖*(u*x).re := by
    have hc' : c*x = (‖c‖ : ℂ)*(u*x) := by
      have hz : (‖c‖ : ℂ) ≠ 0 := by exact_mod_cast hn.ne'
      dsimp [u]
      field_simp [hz]
    rw [hc']; simp
  have hrot := integral_rot_continuous u hu (fun z : ℂ ↦ |z.re+(u*w).re|) (by fun_prop)
  have heq (z : ℂ) : |(c*(z+w)).re| = ‖c‖*|(u*z).re+(u*w).re| := by
    rw [he, mul_add, Complex.add_re, abs_mul, abs_norm]
  simp_rw [heq]
  rw [integral_const_mul, hrot, he]
  have h := mul_le_mul_of_nonneg_left (shifted_abs_re_le k (u*w).re) hn.le
  convert h using 1
  field_simp

private theorem projected_abs (c : ℂ) :
    (∫ z : ℂ, |(c*z).re| ∂gaussC) = ‖c‖*(√π)⁻¹ := by
  by_cases hc : c=0
  · simp [hc]
  let u : ℂ := c / (‖c‖ : ℂ)
  have hn : 0 < ‖c‖ := norm_pos_iff.mpr hc
  have hu : ‖u‖=1 := by simp [u, hn.ne']
  have he (z : ℂ) : |(c*z).re| = ‖c‖*|(u*z).re| := by
    have h : c*z = (‖c‖ : ℂ)*(u*z) := by
      have hz : (‖c‖ : ℂ) ≠ 0 := by exact_mod_cast hn.ne'
      dsimp [u]; field_simp [hz]
    rw [h]; simp [abs_mul]
  simp_rw [he]
  rw [integral_const_mul,integral_rot_continuous u hu (fun z : ℂ ↦ |z.re|) (by fun_prop),mean_abs_re]

private theorem norm_integrable : Integrable (fun z : ℂ ↦ ‖z‖) gaussC := by
  apply integrable_gaussC_of_bound _ (by fun_prop) 1 1 0 0
  intro z
  rw [abs_norm,Complex.normSq_eq_norm_sq]
  nlinarith [sq_nonneg (‖z‖-1)]

private theorem projected_sq_le (c w : ℂ) : (c*w).re^2/‖c‖ ≤ ‖w‖^2*‖c‖ := by
  by_cases hc : c=0
  · simp [hc]
  apply (div_le_iff₀ (norm_pos_iff.mpr hc)).mpr
  have h : (c*w).re^2 ≤ ‖c*w‖^2 := sq_le_sq.mpr (by rw [abs_norm]; exact Complex.abs_re_le_norm (c*w))
  rw [norm_mul] at h
  nlinarith only [h]

private theorem projected_sq_mean (w : ℂ) :
    (∫ c : ℂ, (c*w).re^2/‖c‖ ∂gaussC) = (‖w‖^2/2)*∫ c : ℂ, ‖c‖ ∂gaussC := by
  let f (c : ℂ) := (c*w).re^2/‖c‖
  have hi : Integrable f gaussC := (norm_integrable.const_mul (‖w‖^2)).mono' (by unfold f; apply Measurable.aestronglyMeasurable; fun_prop)
    (Filter.Eventually.of_forall fun c ↦ by simpa [f, Real.norm_eq_abs,abs_of_nonneg (div_nonneg (sq_nonneg _) (norm_nonneg _))] using projected_sq_le c w)
  have rot := integral_rot_gaussC Complex.I Complex.norm_I f
  have hj : Integrable (fun c : ℂ ↦ f (Complex.I*c)) gaussC :=
    (norm_integrable.const_mul (‖w‖^2)).mono' (by unfold f; apply Measurable.aestronglyMeasurable; fun_prop)
      (Filter.Eventually.of_forall fun c ↦ by
        have := projected_sq_le (Complex.I*c) w
        simpa [f, Real.norm_eq_abs,abs_of_nonneg (div_nonneg (sq_nonneg _) (norm_nonneg _))] using this)
  have hpt (c : ℂ) : f c+f (Complex.I*c) = ‖w‖^2*‖c‖ := by
    by_cases hc : c=0
    · simp [hc,f]
    have hn := (norm_pos_iff.mpr hc).ne'
    simp only [f, mul_assoc, Complex.I_mul_re, neg_sq, norm_mul, Complex.norm_I, one_mul]
    have he : (c*w).re^2 + (c*w).im^2 = ‖c*w‖^2 := by
      rw [Complex.sq_norm,Complex.normSq_apply]; ring
    rw [← add_div, he, norm_mul]
    field_simp
  have h := integral_add hi hj
  simp_rw [hpt] at h
  rw [integral_const_mul,rot] at h
  change (∫ c : ℂ, f c ∂gaussC) = _
  linarith


theorem mean_norm : (∫ z : ℂ, ‖z‖ ∂gaussC) = √π/2 := by
  rw [integral_gaussC_eq_gauss2 _ continuous_norm]
  have hf (p : ℝ × ℝ) : ‖F2 p‖ = (√(p.1^2+p.2^2))/√2 := by
    rw [F2, norm_div, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _)]
    congr 1
    simp [Complex.norm_def, Complex.normSq_apply, sq]
  simp_rw [hf]
  rw [integral_div,integral_norm_gauss2]
  field_simp

/-- A Gaussian radius majorant valid for every deterministic shift and every tangent price. -/
theorem rice_price (k : ℝ) (w : ℂ) :
    (∫ z : ℂ, ‖z+w‖ ∂gaussC) ≤ (√π/2)*(riceIntercept k+riceSlope k*(‖w‖^2/2)) := by
  let F (z c : ℂ) := |(c*(z+w)).re|
  have hshift : Integrable (fun z : ℂ ↦ ‖z+w‖) gaussC :=
    (norm_integrable.add (integrable_const ‖w‖)).mono' (by fun_prop)
      (Filter.Eventually.of_forall fun z ↦ by simpa using norm_add_le z w)
  have hprod : Integrable (Function.uncurry F) (gaussC.prod gaussC) :=
    (hshift.mul_prod norm_integrable).mono' (by unfold F Function.uncurry; fun_prop)
      (Filter.Eventually.of_forall fun p ↦ by
        simpa [F, Function.uncurry,Real.norm_eq_abs,abs_abs,norm_mul,mul_comm] using Complex.abs_re_le_norm (p.2*(p.1+w)))
  have hswap := integral_integral_swap hprod
  have hfirst (z : ℂ) : (∫ c, F z c ∂gaussC) = ‖z+w‖*(√π)⁻¹ := by
    simpa [F,mul_comm] using projected_abs (z+w)
  simp_rw [hfirst] at hswap
  rw [integral_mul_const] at hswap
  have him : Integrable (fun c : ℂ ↦ (c*w).re^2/‖c‖) gaussC :=
    (norm_integrable.const_mul (‖w‖^2)).mono' (by apply Measurable.aestronglyMeasurable; fun_prop)
      (Filter.Eventually.of_forall fun c ↦ by simpa [Real.norm_eq_abs,abs_of_nonneg (div_nonneg (sq_nonneg _) (norm_nonneg _))] using projected_sq_le c w)
  have hI := norm_integrable.const_mul (riceIntercept k)
  have hS := him.const_mul (riceSlope k)
  have hadd : Integrable (fun c : ℂ ↦ riceIntercept k*‖c‖+riceSlope k*((c*w).re^2/‖c‖)) gaussC := hI.add hS
  have h := integral_mono_of_nonneg (Filter.Eventually.of_forall fun c : ℂ ↦ integral_nonneg fun z ↦ abs_nonneg (c*(z+w)).re)
    (hadd.const_mul ((√π)⁻¹)) (Filter.Eventually.of_forall fun c ↦ projected_abs_shift k c w)
  change (∫ c, ∫ z, F z c ∂gaussC ∂gaussC) ≤ _ at h
  rw [← hswap, integral_const_mul,integral_add hI hS,integral_const_mul,integral_const_mul,projected_sq_mean,mean_norm] at h
  have hp : 0 < (√π)⁻¹ := by positivity
  apply (mul_le_mul_iff_of_pos_right hp).mp
  calc
    _ ≤ _ := h
    _ = _ := by ring


/-- The sharp quadratic tangent at the origin is the zero-price specialization. -/
theorem rice_tangent (w : ℂ) :
    (∫ z : ℂ, ‖z+w‖ ∂gaussC) ≤ (√π/2)*(1+‖w‖^2/2) := by
  simpa [riceIntercept,riceSlope] using rice_price 0 w

end Grothe.LowerAnalytic.PhysicalRice

open scoped ComplexConjugate

namespace Grothe.LowerAnalytic.PhysicalRice

/-- A single bounded response spends its visible linear deficit on its entire fibre mean. -/
private theorem response_of_price {a μ : ℝ} (hμ : 0 < μ)
    (hp : ∀ w : ℂ, (∫ z, ‖z+w‖ ∂gaussC) ≤ a+μ*(‖w‖^2/2)) {f : ℂ → ℂ}
    (hf : AEStronglyMeasurable f gaussC) (hb : ∀ z, ‖f z‖ ≤ 1) :
    ‖∫ z, f z ∂gaussC‖^2 ≤ 2*μ*(a - (∫ z, conj z * f z ∂gaussC).re) := by
  let m := ∫ z, f z ∂gaussC
  let b : ℂ := m / (μ : ℂ)
  have hi : Integrable f gaussC := by
    simpa using integrable_mul_k hf hb (integrable_const (1 : ℂ))
  have hzi : Integrable (fun z : ℂ ↦ conj z * f z) gaussC :=
    integrable_mul_k hf hb (integrable_conj_of integrable_id)
  have h := (re_integral_conj_mul_le (integrable_id.add (integrable_const b)) hf hb).trans
    (hp b)
  change (∫ z, conj (z+b) * f z ∂gaussC).re ≤ a+μ*(‖b‖^2/2) at h
  simp_rw [map_add, add_mul] at h
  rw [integral_add hzi (hi.const_mul (conj b)), integral_const_mul, Complex.add_re] at h
  have hpair : (conj b * m).re = ‖m‖^2/μ := by
    simp only [b,map_div₀,Complex.conj_ofReal]
    rw [div_mul_eq_mul_div, mul_comm (conj m), Complex.mul_conj, ← Complex.ofReal_div,
      Complex.ofReal_re, Complex.normSq_eq_norm_sq]
  have hn : ‖b‖ = ‖m‖ / μ := by simp [b,Real.norm_eq_abs,abs_of_pos hμ]
  change _ + (conj b * m).re ≤ _ at h
  rw [hpair, hn] at h
  have hmul := mul_le_mul_of_nonneg_left h hμ.le
  have hx (x : ℝ) : μ*(x+‖m‖^2/μ) = μ*x+‖m‖^2 := by field_simp
  have hy : μ*(a+μ*((‖m‖/μ)^2/2)) = μ*a+‖m‖^2/2 := by field_simp
  rw [hx, hy] at hmul
  change ‖m‖^2 ≤ 2*μ*(a-_)
  linarith

/-- The joint cost retains the energy of both the half-sum and half-difference. -/
theorem joint_fibre_energy_priced (k : ℝ) {f g : ℂ → ℂ}
    (hf : AEStronglyMeasurable f gaussC) (hg : AEStronglyMeasurable g gaussC)
    (hfb : ∀ z, ‖f z‖ ≤ 1) (hgb : ∀ z, ‖g z‖ ≤ 1) :
    ‖((∫ z, f z ∂gaussC) + (∫ z, g z ∂gaussC))/2‖^2 +
    ‖((∫ z, f z ∂gaussC) - (∫ z, g z ∂gaussC))/2‖^2 ≤
      2*((√π/2)*riceSlope k)*((√π/2)*riceIntercept k-
        ((∫ z, conj z * f z ∂gaussC).re+(∫ z, conj z * g z ∂gaussC).re)/2) := by
  have hp (w : ℂ) : (∫ z, ‖z+w‖ ∂gaussC) ≤
      (√π/2)*riceIntercept k+((√π/2)*riceSlope k)*(‖w‖^2/2) := by
    simpa only [mul_add,mul_assoc] using rice_price k w
  have hm : 0 < (√π/2)*riceSlope k := mul_pos (by positivity) (riceSlope_pos k)
  have h := parallelogram_law_with_norm ℂ (∫ z, f z ∂gaussC) (∫ z, g z ∂gaussC)
  simp only [norm_div, Complex.norm_ofNat]
  nlinarith only [h, response_of_price hm hp hf hfb, response_of_price hm hp hg hgb]

/-- Physical energy of the half-difference, including the quartic Gaussian density debit. -/
theorem fibre_mean_energy_priced (k : ℝ) {f g : ℂ → ℂ}
    (hfm : AEStronglyMeasurable f gaussC) (hgm : AEStronglyMeasurable g gaussC)
    (hfb : ∀ z, ‖f z‖ ≤ 1) (hgb : ∀ z, ‖g z‖ ≤ 1) :
    ‖∫ z, (f z - g z)/2 ∂gaussC‖^2 ≤ 2*((√π/2)*riceSlope k)*
      ((√π/2)*riceIntercept k - (∫ z, conj z * ((f z+g z)/2) ∂gaussC).re) := by
  have hi : Integrable f gaussC := by simpa using integrable_mul_k hfm hfb (integrable_const (1 : ℂ))
  have hj : Integrable g gaussC := by simpa using integrable_mul_k hgm hgb (integrable_const (1 : ℂ))
  have hzi := integrable_mul_k hfm hfb (integrable_conj_of integrable_id)
  have hzj := integrable_mul_k hgm hgb (integrable_conj_of integrable_id)
  simp_rw [mul_div_assoc', mul_add]
  rw [integral_div,integral_sub hi hj,integral_div,integral_add hzi hzj]
  have hjoint := joint_fibre_energy_priced k hfm hgm hfb hgb
  simp only [Complex.div_ofNat_re,Complex.add_re]
  linarith only [hjoint, sq_nonneg ‖((∫ z, f z ∂gaussC)+(∫ z, g z ∂gaussC))/2‖]

end Grothe.LowerAnalytic.PhysicalRice
