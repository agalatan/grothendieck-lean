import QuinticResearch.RadialClip
import QuinticResearch.RadialTail
import QuinticResearch.SignedVector
import Mathlib.Analysis.Complex.ExponentialBounds

/-! The exact clipped Laguerre estimate for the signed fifth-sector payoff. Agent-ID: codex-a7c4 -/

set_option warningAsError true
namespace Grothe.LowerAnalytic
open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate
noncomputable section

private theorem cross_price {n : ℕ} {h z : L2G n} (hh : ∀ᵐ x ∂stdGaussian (n+n), ‖h x‖ ≤ 1)
    (hz : HasLaw (fun x => z x) gaussC (stdGaussian (n+n))) {M a : ℝ} (hm : 6 ≤ M) (ha : 0 < a)
    (hp : ⇑((H32 n).starProjection (unitPhaseL z)) =ᵐ[stdGaussian (n+n)] fun x => visibleFifthPolynomial (z x)) :
    (inner ℂ (unitPhaseL z-h) ((H32 n).starProjection (unitPhaseL z))).re ≤
      (√π/2/8)*(laguerre2 M*((∫ x, ‖z x‖ ∂stdGaussian (n+n))-(inner ℂ h z).re)+
      2*(exp (-M)/(2*a)*((M+a^2)*(M-2)+2*M-3))) := by
  let T := fun b : ℂ => radialTail M a (Complex.normSq b)
  have hT := gaussian_radial_tail M a (by linarith)
  have hprod : 0 ≤ (M+a^2)*(M-2) := mul_nonneg (by nlinarith only [hm,sq_nonneg a]) (by linarith)
  have hxpos : 0 < (M+a^2)*(M-2)+2*M-3 := by linarith only [hm,hprod]
  have hint : Integrable T gaussC := by
    by_contra hnon
    have hzero := integral_undef hnon
    change (∫ z, radialTail M a (Complex.normSq z) ∂gaussC) = 0 at hzero
    rw [hT] at hzero
    exact (ne_of_gt (mul_pos (div_pos (exp_pos _) (by positivity)) hxpos)) hzero
  have hmeas : Measurable T := (measurable_radialTail M a).comp Complex.continuous_normSq.measurable
  have hcomp : Integrable (fun x => T (z x)) _ := hz.integrable_comp hint
  have hTz : (∫ x, T (z x) ∂stdGaussian (n+n)) = _ := (hz.integral_comp hmeas.aestronglyMeasurable).trans hT
  have hnorm := ((Lp.memLp z).integrable (by norm_num)).norm
  have hpair := integrable_hre h z
  have hlin : Integrable (fun x => laguerre2 M*(‖z x‖-hre (h x) (z x))) _ := (hnorm.sub hpair).const_mul _
  have hrest : Integrable (fun x => 2*T (z x)) _ := hcomp.const_mul _
  have phlaw : ⇑(unitPhaseL z) =ᵐ[stdGaussian (n+n)] fun x => ph (z x) := MemLp.coeFn_toLp _
  have ph_eq (w : ℂ) : conj (ph w)*w = (‖w‖:ℂ) := by
    simpa only [map_mul,Complex.conj_conj,Complex.conj_ofReal,mul_comm] using congrArg (starRingEnd ℂ) (conj_mul_ph w)
  have f_eq (w : ℂ) : visibleFifthPolynomial w = (((√π/2/8)*laguerre2 (Complex.normSq w):ℝ):ℂ)*w := by
    unfold visibleFifthPolynomial visMu laguerre2
    rw [Complex.normSq_eq_norm_sq]
    push_cast; ring
  have hpnt (w v : ℂ) : hre (ph w-v) (visibleFifthPolynomial w) = (√π/2/8)*(laguerre2 (Complex.normSq w)*(‖w‖-hre v w)) := by
    unfold hre
    rw [f_eq,map_sub,mul_left_comm,sub_mul,ph_eq,Complex.re_ofReal_mul,Complex.sub_re,Complex.ofReal_re]
    ring
  have hi := integral_mono_ae (integrable_hre (unitPhaseL z-h) ((H32 n).starProjection (unitPhaseL z)))
    ((hlin.add hrest).const_mul (√π/2/8)) (by
      filter_upwards [hh,hp,phlaw,Lp.coeFn_sub (unitPhaseL z) h] with x hx hpnt' hph hs
      change hre ((unitPhaseL z-h) x) (((H32 n).starProjection (unitPhaseL z)) x) ≤
        (√π/2/8)*(laguerre2 M*(‖z x‖-hre (h x) (z x))+2*T (z x))
      rw [hs,Pi.sub_apply,hph,hpnt',hpnt]
      exact mul_le_mul_of_nonneg_left (laguerre_clipped hm ha _ _ hx) (by positivity))
  change (∫ x, hre _ _ ∂stdGaussian (n+n)) ≤ ∫ x, (√π/2/8)*(laguerre2 M*(‖z x‖-hre (h x) (z x))+2*T (z x)) ∂stdGaussian (n+n) at hi
  rw [integral_const_mul,integral_add hlin hrest,integral_const_mul,integral_const_mul,
    integral_sub hnorm hpair,hTz,← re_inner_eq_integral,← re_inner_eq_integral] at hi
  exact hi

private theorem projected_tangent {n : ℕ} (h p : L2G n) :
    ‖(H32 n).starProjection p‖^2-2*(inner ℂ (p-h) ((H32 n).starProjection p)).re ≤ ‖(H32 n).starProjection h‖^2 := by
  let F := (H32 n).starProjection
  have he : inner ℂ (F (p-h)) (F p) = inner ℂ (p-h) (F p) := by
    rw [Submodule.inner_starProjection_left_eq_right,Submodule.starProjection_eq_self_iff.mpr ((H32 n).starProjection_apply_mem _)]
  have eq : F h = F p - F (p-h) := by rw [map_sub,sub_sub_cancel]
  change ‖F p‖^2 - 2*(inner ℂ (p-h) (F p)).re ≤ ‖F h‖^2
  rw [eq,@norm_sub_sq ℂ]
  have hs := inner_re_symm (𝕜:=ℂ) (F p) (F (p-h))
  change (inner ℂ (F p) (F (p-h))).re = (inner ℂ (F (p-h)) (F p)).re at hs
  change _ ≤ ‖F p‖^2-2*(inner ℂ (F p) (F (p-h))).re+‖F (p-h)‖^2
  rw [hs,he]
  linarith only [sq_nonneg ‖F (p-h)‖]

/-- A signed estimate on actual phase pairs with freely chosen radius and Laguerre cutoffs. -/
theorem signed_fifth_radial {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 0 < tOf (n+1) f g) {M a r : ℝ} (hM : 6 ≤ M) (ha : 0 < a) (hr : 0 < r) :
    3*π/256-(√π/2/4)*(laguerre2 M*(√π/2-tOf (n+1) f g)+
      2*(exp (-M)/(2*a)*((M+a^2)*(M-2)+2*M-3))) -
      (2*(√π/2-tOf (n+1) f g)/r+r^2/6) ≤
      ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2-‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  let z := visibleDirection (n+1) f g
  have hz : z ∈ H10 (n+1) := visibleDirection_mem (n+1) f g
  have hu : ‖z‖ = 1 := norm_visibleDirection_of_pos ht
  have hx := cross_price (norm_hOf_le (n+1) hf hg) (hasLaw_unit_H10 _ hz hu) hM ha
    (H32_unitPhaseL_ae (Nat.succ_pos _) hz hu)
  obtain ⟨c,hc⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hz
  have hm : (∫ x, ‖z x‖ ∂stdGaussian _) = √π/2 := by
    rw [← hc,integral_norm_linL,hc,hu,mul_one]
  rw [hm,show (inner ℂ (hOf (n+1) f g) z).re = tOf (n+1) f g from re_inner_visibleDirection _ _ _] at hx
  have hp := projected_tangent (hOf (n+1) f g) (unitPhaseL z)
  rw [normSq_H32_unitPhaseL (Nat.succ_pos _) hz hu] at hp
  have hk := visible_half_difference_clip hf hg ht hr
  have hk' : ‖kOf (n+1) f g‖^2 ≤ 2*(√π/2-tOf (n+1) f g)/r+r^2/6 := by
    apply (mul_le_mul_iff_left₀ (sq_pos_of_pos hr)).mp
    rw [add_mul,show (2*(√π/2-tOf (n+1) f g)/r)*(r^2) = 2*r*(√π/2-tOf (n+1) f g) by field_simp]
    nlinarith only [hk]
  have hkp := pow_le_pow_left₀ (norm_nonneg _) ((H32 (n+1)).norm_starProjection_apply_le (kOf (n+1) f g)) 2
  linarith only [hx,hp,hk'.trans' hkp]

private theorem mu_upper : √π/2 ≤ (886227:ℝ)/1000000 := by
  rw [div_le_iff₀ (by norm_num),Real.sqrt_le_left (by norm_num)]
  linarith only [Real.pi_lt_d6]

private theorem exp_cutoff (n : ℕ) (d : ℝ) (hd : 0 < d) (h : d ≤ (2718281/1000000:ℝ)^n) :
    exp (-(n:ℝ)) ≤ 1/d := by
  rw [Real.exp_neg,inv_eq_one_div]
  apply one_div_le_one_div_of_le hd
  have hn := Real.exp_nat_mul 1 n
  rw [mul_one] at hn
  rw [hn]
  exact h.trans (pow_le_pow_left₀ (by norm_num) (by linarith only [Real.exp_one_gt_d9]) _)

private theorem radial_loss_numeric {M a r t t₀ mu U E : ℝ} (ha : 0 < a) (hr : 0 < r) (hm : 0 ≤ mu)
    (hG : 0 ≤ (M+a^2)*(M-2)+2*M-3) (hL : 0 ≤ laguerre2 M)
    (hmu : mu ≤ U) (ht : t₀ ≤ t) (hgap : t ≤ mu) (hE : exp (-M) ≤ E) :
    mu/4*(laguerre2 M*(mu-t)+2*(exp (-M)/(2*a)*((M+a^2)*(M-2)+2*M-3)))+
      (2*(mu-t)/r+r^2/6) ≤ U/4*(laguerre2 M*(U-t₀)+2*(E/(2*a)*((M+a^2)*(M-2)+2*M-3)))+
      (2*(U-t₀)/r+r^2/6) := by
  have he0 := exp_pos (-M)
  have hd : 0 ≤ mu-t := sub_nonneg.mpr hgap
  have hdt : mu-t ≤ U-t₀ := sub_le_sub hmu ht
  have hU : 0 ≤ U := hm.trans hmu
  gcongr


/-- Lower price for the signed fifth energy from visible amplitude 885868/1000000. -/
theorem signed_fifth_radial_885868 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 885868/1000000 ≤ tOf (n+1) f g) :
    (13:ℝ)/500 ≤ ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2 - ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  have h := signed_fifth_radial hf hg (by linarith only [ht]) (M:=10) (a:=3) (r:=129/1000) (by norm_num) (by norm_num) (by norm_num)
  have hE : exp (-10) ≤ (1:ℝ)/22000 := by
    simpa using exp_cutoff 10 22000 (by norm_num) (by norm_num)
  have hp := radial_loss_numeric (M:=10) (a:=3) (r:=129/1000) (by norm_num) (by norm_num) (by positivity : 0 ≤ √π/2)
    (by norm_num) (by norm_num [laguerre2]) mu_upper ht (tOf_le_sqrt_pi _ hf hg) hE
  norm_num [laguerre2] at h hp
  linarith only [h,hp,Real.pi_gt_d6]

/-- Lower price for the signed fifth energy from visible amplitude 886176/1000000. -/
theorem signed_fifth_radial_886176 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 886176/1000000 ≤ tOf (n+1) f g) :
    (17:ℝ)/500 ≤ ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2 - ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2 := by
  have h := signed_fifth_radial hf hg (by linarith only [ht]) (M:=12) (a:=7/2) (r:=67/1000) (by norm_num) (by norm_num) (by norm_num)
  have hE : exp (-12) ≤ (1:ℝ)/162700 := by
    simpa using exp_cutoff 12 162700 (by norm_num) (by norm_num)
  have hp := radial_loss_numeric (M:=12) (a:=7/2) (r:=67/1000) (by norm_num) (by norm_num) (by positivity : 0 ≤ √π/2)
    (by norm_num) (by norm_num [laguerre2]) mu_upper ht (tOf_le_sqrt_pi _ hf hg) hE
  norm_num [laguerre2] at h hp
  linarith only [h,hp,Real.pi_gt_d6]

/-- An actual negative adjustment to the fifth eigenvalue saves at least 17/500 of
that adjustment in every upper-arm physical real payoff. -/
theorem signedFifth_payoff_radial_high {n : ℕ} {e ν debit : ℝ} (hd : 0 ≤ debit)
    {f g : L2G (n+1)} (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (ht : (886176:ℝ)/1000000 ≤ tOf (n+1) f g) :
    (inner ℂ f (signedFifthWitness (n+1) e ν debit g)).re ≤ VOf (n+1) e ν f g - debit*(17/500) := by
  rw [signedFifth_payoff]
  exact sub_le_sub_left (mul_le_mul_of_nonneg_left (signed_fifth_radial_886176 hf hg ht) hd) _

end
end Grothe.LowerAnalytic
