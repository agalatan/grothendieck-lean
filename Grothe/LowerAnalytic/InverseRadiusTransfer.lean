import Grothe.LowerAnalytic.InverseRadiusCubic
import Grothe.LowerAnalytic.MassRowFrame

/-! The physical half-pair cubic obeys the scalar weighted Bessel ellipsoid. Agent-ID: codex-a7c4 -/

namespace Grothe.LowerAnalytic
open MeasureTheory Grothe.Lower
open scoped ComplexConjugate

private theorem phase_radius_young (h k q z : ℂ) {C b : ℝ} (hC : 0 ≤ C) (hb : 0 ≤ b)
    (hz : 0 < ‖z‖) (hk : ‖h‖^2+‖k‖^2 = 1) :
    2*C*hre k q ≤ ‖q‖^2/‖z‖ + C^2*((1+b^2)*‖z‖-2*b*hre h z) := by
  have hpair (x y : ℂ) : hre x y ≤ ‖x‖*‖y‖ := by
    simpa [hre, norm_mul] using Complex.re_le_norm (conj x*y)
  have hmass : ‖z‖*‖k‖^2 ≤ (1+b^2)*‖z‖-2*b*hre h z := by
    have hn := mul_nonneg hz.le (sq_nonneg (b-‖h‖))
    nlinarith only [hn, congrArg (fun a : ℝ => ‖z‖*a) hk,
      mul_le_mul_of_nonneg_left (hpair h z) (mul_nonneg (by norm_num : (0:ℝ)≤2) hb)]
  have hy : 2*C*(‖k‖*‖q‖) ≤ ‖q‖^2/‖z‖ + C^2*‖z‖*‖k‖^2 := by
    apply (mul_le_mul_iff_of_pos_right hz).mp
    rw [add_mul, div_mul_cancel₀ _ hz.ne']
    nlinarith only [sq_nonneg (‖q‖-C*‖z‖*‖k‖)]
  linarith only [hy, mul_le_mul_of_nonneg_left (hpair k q) (mul_nonneg (by norm_num : (0:ℝ)≤2) hC),
    mul_le_mul_of_nonneg_left hmass (sq_nonneg C)]

/-- An inverse-radius estimate on the actual cubic converts phase deficit into
a uniform cubic energy bound. The real inner product tests the projection itself. -/
theorem cubic_energy_le_inverse_radius_deficit {n : ℕ} {f g z : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    {C b : ℝ} (hC : 0 < C) (hb : 0 ≤ b) (hz : ∀ᵐ x ∂stdGaussian (n+n), 0 < ‖z x‖)
    (hI : Integrable (fun x => ‖QkOf n f g x‖^2 / ‖z x‖) (stdGaussian (n+n)))
    (hW : (∫ x, ‖QkOf n f g x‖^2/‖z x‖ ∂stdGaussian (n+n)) ≤ C*‖QkOf n f g‖^2) :
    ‖QkOf n f g‖^2 ≤ C*((1+b^2)*(∫ x, ‖z x‖ ∂stdGaussian (n+n))-2*b*(inner ℂ (hOf n f g) z).re) := by
  let h := hOf n f g
  let k := kOf n f g
  let q := QkOf n f g
  let μ := stdGaussian (n+n)
  have hf' : ∀ᵐ x ∂μ, ‖f x‖ = 1 := hf
  have hg' : ∀ᵐ x ∂μ, ‖g x‖ = 1 := hg
  have ha := Lp.coeFn_add h k
  have hs := Lp.coeFn_sub h k
  rw [show h+k=f from hOf_add_kOf ..] at ha
  rw [show h-k=g from hOf_sub_kOf ..] at hs
  have hnorm := ((Lp.memLp z).integrable (by norm_num)).norm
  have hp := integral_mono_ae ((integrable_hre k q).const_mul (2*C))
    (hI.add (((hnorm.const_mul (1+b^2)).sub ((integrable_hre h z).const_mul (2*b))).const_mul (C^2))) (by
      filter_upwards [ha,hs,hf',hg',hz] with x ha hs hf hg hz
      have hpar := parallelogram_law_with_norm ℂ (h x) (k x)
      simp only [Pi.add_apply,Pi.sub_apply] at ha hs
      rw [← ha,← hs,hf,hg] at hpar
      exact phase_radius_young _ _ _ _ hC.le hb hz (by linarith only [hpar]))
  change (∫ x, 2*C*hre (k x) (q x) ∂μ) ≤
    ∫ x, ‖q x‖^2/‖z x‖ + C^2*((1+b^2)*‖z x‖-2*b*hre (h x) (z x)) ∂μ at hp
  have hIq : Integrable (fun x => ‖q x‖^2/‖z x‖) μ := hI
  have hIg : Integrable (fun x => C^2*((1+b^2)*‖z x‖-2*b*hre (h x) (z x))) μ :=
    ((hnorm.const_mul (1+b^2)).sub ((integrable_hre h z).const_mul (2*b))).const_mul _
  rw [integral_const_mul, integral_add hIq hIg, integral_const_mul,
    integral_sub (hnorm.const_mul (1+b^2)) ((integrable_hre h z).const_mul (2*b)),
    integral_const_mul, integral_const_mul, ← re_inner_eq_integral, ← re_inner_eq_integral] at hp
  have he : (inner ℂ k q).re = ‖q‖^2 := re_inner_starProjection (H21 n) k
  rw [he] at hp
  change (∫ x, ‖q x‖^2/‖z x‖ ∂μ) ≤ C*‖q‖^2 at hW
  change ‖q‖^2 ≤ C*((1+b^2)*(∫ x, ‖z x‖ ∂μ)-2*b*(inner ℂ h z).re)
  apply (mul_le_mul_iff_of_pos_left hC).mp
  nlinarith only [hp,hW]

/-- With inverse norm constant twice the mean radius, optimizing the real
visible test recovers the joint squared-amplitude bound. -/
theorem cubic_energy_add_twice_visible_sq {n : ℕ} {f g z : L2G n} {m t : ℝ}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (hm : 0 < m) (ht : 0 ≤ t) (hz : ∀ᵐ x ∂stdGaussian (n+n), 0 < ‖z x‖)
    (hmean : (∫ x, ‖z x‖ ∂stdGaussian (n+n)) = m)
    (halign : (inner ℂ (hOf n f g) z).re = t)
    (hI : Integrable (fun x => ‖QkOf n f g x‖^2 / ‖z x‖) (stdGaussian (n+n)))
    (hW : (∫ x, ‖QkOf n f g x‖^2/‖z x‖ ∂stdGaussian (n+n)) ≤ 2*m*‖QkOf n f g‖^2) :
    ‖QkOf n f g‖^2 ≤ 2*(m^2-t^2) := by
  have h := cubic_energy_le_inverse_radius_deficit hf hg (C := 2*m) (b := t/m)
    (by positivity) (div_nonneg ht hm.le) hz hI hW
  rw [hmean,halign] at h
  convert h using 1
  field_simp
  ring

open Real

private lemma gaussian_radius_ae_pos : ∀ᵐ z : ℂ ∂gaussC, 0 < ‖z‖ := by
  have hz : gaussC ({0}:Set ℂ) = 0 := by
    apply (measureReal_eq_zero_iff (measure_ne_top _ _)).mp
    rw [← integral_indicator_one (measurableSet_singleton (0:ℂ)),
      integral_gaussC_eq_volume _ (measurable_one.indicator (measurableSet_singleton _))]
    apply integral_eq_zero_of_ae
    filter_upwards [Measure.ae_ne (volume : Measure ℂ) 0] with z h
    simp [Set.indicator_of_notMem,h]
  filter_upwards [measure_eq_zero_iff_ae_notMem.mp hz] with z h
  exact norm_pos_iff.mpr h

private lemma unit_H10_ae_norm_pos {m : ℕ} (hm : 0 < m) {u : L2G m}
    (hu : u ∈ H10 m) (h1 : ‖u‖=1) : ∀ᵐ x ∂stdGaussian (m+m), 0 < ‖u x‖ := by
  obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_zero_of_lt hm)
  obtain ⟨W,hW⟩ := exists_Cop_eq (Nat.succ_pos n) hu h1
  have he : Cop W u = zeta0 n := hW
  have hsplit : ∀ᵐ x ∂stdGaussian ((n+1)+(n+1)), 0 < ‖(split2 x).2‖ :=
    (measurePreserving_snd.comp (measurePreserving_split2 (n:=n))).quasiMeasurePreserving.ae
      gaussian_radius_ae_pos
  have hu' : ∀ᵐ x ∂stdGaussian ((n+1)+(n+1)), 0 < ‖u (Phi W x)‖ := by
    have hz := Cop_ae W u
    rw [he] at hz
    filter_upwards [hz,zeta0_ae_split2 n,hsplit] with x h1x h2x h3x
    rwa [← h1x,h2x]
  have hz := (measurePreserving_Phi W.symm).quasiMeasurePreserving.ae hu'
  filter_upwards [hz] with x hx
  simpa only [Phi_Phi_symm] using hx

/-- The scalar weighted-Bessel bound for the actual aligned first/cubic projections
of a unimodular pair. The visible frame may be chosen arbitrarily when `t=0`. -/
theorem QkOf_sq_le_two_visible_gap {n : ℕ} (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    ‖QkOf n f g‖^2 ≤ 2*(π/4-(tOf n f g)^2) := by
  obtain ⟨z,hz,hunit,halign⟩ := exists_frame_vector n hn (hOf n f g)
  obtain ⟨c,hc⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hz
  have hmean : (∫ x, ‖z x‖ ∂stdGaussian (n+n)) = √π/2 := by
    rw [← hc, integral_norm_linL, hc, hunit, mul_one]
  have hpair : (inner ℂ (hOf n f g) z).re = tOf n f g := by
    have htest : inner ℂ z (hOf n f g) = inner ℂ z ((H10 n).starProjection (hOf n f g)) := by
      rw [← Submodule.inner_starProjection_left_eq_right,Submodule.starProjection_eq_self_iff.2 hz]
    rw [← inner_conj_symm,Complex.conj_re,htest,halign,inner_smul_right,inner_self_eq_norm_sq_to_K,hunit]
    simp [tOf]
  have ⟨hi,hW⟩ := integral_invRadius_cubic_of_unit hn
    ((H21 n).starProjection_apply_mem (kOf n f g)) hz hunit
  have h := cubic_energy_add_twice_visible_sq hf hg (m:=√π/2) (by positivity) (norm_nonneg _)
    (unit_H10_ae_norm_pos hn hz hunit) hmean hpair hi (by rw [show 2*(√π/2)=√π by ring]; exact hW)
  change ‖QkOf n f g‖^2 ≤ 2*(π/4-(tOf n f g)^2)
  simpa only [tOf, div_pow,Real.sq_sqrt Real.pi_nonneg,show (2:ℝ)^2=4 by norm_num] using h

end Grothe.LowerAnalytic
