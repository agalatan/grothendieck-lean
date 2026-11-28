import Grothe.LowerAnalytic.InverseRadiusTransfer

/-! A single visible Wick cubic gives the signed lower tangent on the physical h projection.
Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open MeasureTheory Real Grothe.Lower
open scoped ComplexConjugate
noncomputable section

private theorem coord_cubic_norm_moment :
    (∫ z:ℂ, ‖z‖^3 ∂gaussC) = 3*√π/4 := by
  have h (z : ℂ) : ‖z‖^3 = invRadMon 2 z := by
    by_cases wz : ‖z‖=0
    · simp [invRadMon,wz]
    unfold invRadMon
    rw [eq_div_iff wz]
    ring
  simp_rw [h,integral_invRadMon]
  rw [show ((2:ℕ):ℝ)+1/2=(1+1/2)+1 by norm_num, Real.Gamma_add_one (by norm_num),
      show (1:ℝ)+1/2=1/2+1 by norm_num,Real.Gamma_add_one (by norm_num),Real.Gamma_one_half_eq]
  ring

private theorem cubic_tangent_coord {n : ℕ} (h : L2G (n+1))
    (hh : ∀ᵐ x ∂stdGaussian ((n+1)+(n+1)), ‖h x‖≤1) :
    π/32 - (√π/2)*(√π/2-(inner ℂ h (zeta0 n)).re) ≤ ‖(H21 (n+1)).starProjection h‖^2 := by
  let v := vL (n+1) 0
  let z := zeta0 n
  let w : L2G (n+1) := (2:ℂ) • z + v
  let q := (H21 (n+1)).starProjection h
  have hw : ⇑w =ᵐ[stdGaussian ((n+1)+(n+1))] fun x => (split2 x).2 * (Complex.normSq (split2 x).2 : ℂ) := by
    have ha := Lvec_ae (n:=n) 2 1
    simp only [Complex.ofReal_ofNat,Complex.ofReal_one,one_smul] at ha
    refine ha.trans (Filter.Eventually.of_forall fun x => ?_)
    have hx := Lfun_joinR 2 1 (split2 (n:=n) x).2 (split2 x).1
    rw [split2_symm_split2] at hx
    simpa [Lf] using hx
  have hm : (∫ x, ‖(split2 (n:=n) x).2‖^3 ∂stdGaussian ((n+1)+(n+1))) = 3*√π/4 := by
    have hp := measurePreserving_snd.comp (measurePreserving_split2 (n:=n))
    have hg : AEStronglyMeasurable (fun z:ℂ => ‖z‖^3) gaussC := by fun_prop
    have he := integral_map hp.measurable.aemeasurable (hp.map_eq.symm ▸ hg)
    rw [hp.map_eq,coord_cubic_norm_moment] at he
    exact he.symm
  have hi : Integrable (fun x => ‖(split2 (n:=n) x).2‖^3) (stdGaussian ((n+1)+(n+1))) :=
    Integrable.of_integral_ne_zero (by rw [hm]; positivity)
  have h3 : (inner ℂ h w).re ≤ 3*√π/4 := by
    rw [re_inner_eq_integral, ← hm]
    apply integral_mono_ae (integrable_hre h w) hi
    filter_upwards [hh,hw] with x hx hw'
    calc
      hre (h x) (w x) ≤ ‖h x‖*‖w x‖ := by
        simpa [hre,norm_mul] using Complex.re_le_norm (conj (h x)*w x)
      _ ≤ ‖w x‖ := mul_le_of_le_one_left (norm_nonneg _) hx
      _ = _ := by rw [hw',norm_mul,Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (Complex.normSq_nonneg _),Complex.normSq_eq_norm_sq]; ring
  have hproj : inner ℂ h v = inner ℂ q v := by
    change _ = inner ℂ ((H21 (n+1)).starProjection h) _
    rw [Submodule.inner_starProjection_left_eq_right,Submodule.starProjection_eq_self_iff.2
      (vL_mem_H21 (n+1) 0)]
  have hneg : -(inner ℂ h v).re ≤ ‖q‖*‖v‖ := by
    rw [hproj]
    exact (neg_le_abs _).trans ((Complex.abs_re_le_norm _).trans (norm_inner_le_norm _ _))
  have hwexpand : (inner ℂ h w).re = 2*(inner ℂ h z).re + (inner ℂ h v).re := by
    simp [w,inner_smul_right,inner_add_right]
  rw [hwexpand] at h3
  have hv : ‖v‖^2=2 := norm_vL_sq (n+1) 0
  have ha := Real.sq_sqrt Real.pi_nonneg
  have hscale := mul_le_mul_of_nonneg_left hneg (Real.sqrt_nonneg π)
  have hscale' := mul_le_mul_of_nonneg_left h3 (Real.sqrt_nonneg π)
  change π/32-(√π/2)*(√π/2-(inner ℂ h z).re) ≤ ‖q‖^2
  nlinarith only [hscale,hscale',sq_nonneg (‖q‖-(√π/8)*‖v‖),
    congrArg (fun v : ℝ => (√π)^2*v) hv,ha]

/-- The cubic content of a unimodular pair is bounded below by testing just its
visible cubic Wick polynomial. Valid at zero amplitude as well. -/
theorem QhOf_sq_ge_visible_tangent {n : ℕ} (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    π/32-(√π/2)*(√π/2-tOf n f g) ≤ ‖QhOf n f g‖^2 := by
  obtain ⟨k,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_zero_of_lt hn)
  let h := hOf (k+1) f g
  obtain ⟨z,hz,h1,hzproj⟩ := exists_frame_vector (k+1) (Nat.succ_pos k) h
  obtain ⟨W,hW⟩ := exists_Cop_eq (Nat.succ_pos k) hz h1
  have he : Cop W z = zeta0 k := hW
  have ht : (inner ℂ h z).re = tOf (k+1) f g := by
    have htest : inner ℂ z h = inner ℂ z ((H10 (k+1)).starProjection h) := by
      rw [← Submodule.inner_starProjection_left_eq_right,Submodule.starProjection_eq_self_iff.2 hz]
    rw [← inner_conj_symm,Complex.conj_re,htest,hzproj,inner_smul_right,inner_self_eq_norm_sq_to_K,h1]
    simp [tOf,h]
  have hh : ∀ᵐ x ∂stdGaussian ((k+1)+(k+1)), ‖(Cop W h) x‖≤1 := by
    filter_upwards [Cop_ae W h,(measurePreserving_Phi W).quasiMeasurePreserving.ae
      (norm_hOf_le (k+1) hf hg)] with x h1' h2'
    rwa [h1']
  have hr := cubic_tangent_coord (Cop W h) hh
  rw [← he,LinearIsometry.inner_map_map,ht,Q_Cop,LinearIsometry.norm_map] at hr
  exact hr
/-- The physical high-amplitude profile with its signed tail correction.
The coefficients apply to any admissible hat parameters. -/
theorem VhatOf_le_visible_cubic_profile {n : ℕ} (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    {e ν : ℝ} (hν : 0 ≤ nuHat ν) (hε : 2*nuHat ν ≤ epsHat e ν) :
    VhatOf n e ν f g ≤ tOf n f g ^ 2 -
      epsHat e ν * (π/32-(√π/2)*(√π/2-tOf n f g)) +
      (epsHat e ν-2*nuHat ν)*2*(π/4-tOf n f g ^ 2) := by
  have he : 0 ≤ epsHat e ν := by linarith
  have hq : ‖QkOf n f g‖^2 ≤ ‖kOf n f g‖^2 :=
    pow_le_pow_left₀ (norm_nonneg _) (Submodule.norm_starProjection_apply_le _ _) 2
  have hk := QkOf_sq_le_two_visible_gap hn hf hg
  have hh := QhOf_sq_ge_visible_tangent hn hf hg
  unfold VhatOf
  nlinarith only [mul_le_mul_of_nonneg_left hh he,
    mul_le_mul_of_nonneg_left hk (sub_nonneg.mpr hε),
    mul_le_mul_of_nonneg_left hq hν,sq_nonneg ‖PkOf n f g‖]

end
end Grothe.LowerAnalytic
