import QuinticResearch.SignedRadial
import QuinticResearch.SignedVector

/-! Joint visible cubic and fifth prices for arbitrary bounded responses. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate
noncomputable section

private def visibleWeight (d x : ℝ) : ℝ :=
  (191/250+47/2000)*(2-x)/2+d*laguerre2 x/4

private theorem small_weight {d x : ℝ} (hd : 0 ≤ d) (hdν : d ≤ 47/2000)
    (hx : 0 ≤ x) (hcut : x ≤ 128) : visibleWeight d x ≤ visibleWeight d 0 := by
  have hm := mul_le_mul_of_nonneg_left hcut hd
  have hn : -(191/250+47/2000)/2-3*d/4+d*x/8 ≤ 0 := by linarith
  have hh := mul_nonpos_of_nonneg_of_nonpos hx hn
  unfold visibleWeight laguerre2
  nlinarith only [hh]

private theorem visible_weight_price {d : ℝ} (hd : 0 ≤ d) (hdν : d ≤ 47/2000)
    (z v : ℂ) (hv : ‖v‖ ≤ 1) :
    visibleWeight d (Complex.normSq z)*(‖z‖-hre v z) ≤
    visibleWeight d 0*(‖z‖-hre v z)+(d/2)*radialTail 128 11 (Complex.normSq z) := by
  let x := Complex.normSq z
  have hx : 0 ≤ x := Complex.normSq_nonneg _
  have hr : 0 ≤ ‖z‖-hre v z := by
    apply sub_nonneg.mpr
    exact (Complex.re_le_norm _).trans (by
      rw [norm_mul, Complex.norm_conj]
      exact mul_le_of_le_one_left (norm_nonneg _) hv)
  change visibleWeight d x * _ ≤ visibleWeight d 0 * _ + (d/2)*radialTail 128 11 x
  by_cases hcut : x ≤ 128
  · rw [radialTail, indicator_of_notMem (show x ∉ Ioi (128:ℝ) from not_lt.mpr hcut),mul_zero,add_zero]
    exact mul_le_mul_of_nonneg_right (small_weight hd hdν hx hcut) hr
  · have hl := laguerre_clipped (M:=128) (a:=11) (by norm_num) (by norm_num) z v hv
    change laguerre2 x * _ ≤ laguerre2 128 * _ + 2*radialTail 128 11 x at hl
    have ht := mul_le_mul_of_nonneg_left hl (show 0 ≤ d/4 by positivity)
    have hsmall := mul_le_mul_of_nonneg_right
      (small_weight (x:=128) hd hdν (by norm_num) le_rfl) hr
    have hlin := mul_nonneg (show 0 ≤ x-128 by linarith) hr
    unfold visibleWeight at hsmall ⊢
    linarith only [ht,hsmall,hlin]

private theorem poly_eq (w : ℂ) :
    visibleCubicPolynomial w = (((√π/2/4)*(2-Complex.normSq w) : ℝ):ℂ)*w ∧
    visibleFifthPolynomial w = (((√π/2/8)*laguerre2 (Complex.normSq w) : ℝ):ℂ)*w := by
  unfold visibleCubicPolynomial visibleFifthPolynomial visMu laguerre2
  rw [Complex.normSq_eq_norm_sq]
  push_cast
  constructor <;> ring

private theorem hre_scaled_difference (w v : ℂ) (c : ℝ) :
    hre (ph w-v) ((c:ℂ)*w) = c*(‖w‖-hre v w) := by
  have hp : conj (ph w)*w = (‖w‖:ℂ) := by
    simpa only [map_mul,Complex.conj_conj,Complex.conj_ofReal,mul_comm] using
      congrArg (starRingEnd ℂ) (conj_mul_ph w)
  unfold hre
  rw [map_sub,mul_left_comm,sub_mul,hp,Complex.re_ofReal_mul,Complex.sub_re,Complex.ofReal_re]

theorem joint_visible_cross_price {n : ℕ} {h z : L2G (n+1)}
    (hh : ∀ᵐ x ∂stdGaussian ((n+1)+(n+1)), ‖h x‖ ≤ 1)
    (hz : z ∈ H10 (n+1)) (hu : ‖z‖ = 1) {d : ℝ} (hd : 0 ≤ d) (hdν : d ≤ 47/2000) :
    2*(191/250+47/2000)*(inner ℂ (unitPhaseL z-h) ((H21 (n+1)).starProjection (unitPhaseL z))).re +
    2*d*(inner ℂ (unitPhaseL z-h) ((H32 (n+1)).starProjection (unitPhaseL z))).re ≤
    (√π/2)*((191/250+47/2000+3*d/4)*((∫ x, ‖z x‖ ∂stdGaussian _) - (inner ℂ h z).re)
        + d/2*(exp (-128)/22*((128+11^2)*(128-2)+2*128-3))) := by
  let γ := stdGaussian ((n+1)+(n+1))
  let D := fun x ↦ ‖z x‖-hre (h x) (z x)
  let T := fun b : ℂ ↦ radialTail 128 11 (Complex.normSq b)
  let q := (H21 (n+1)).starProjection (unitPhaseL z)
  let f := (H32 (n+1)).starProjection (unitPhaseL z)
  let E : ℝ := 191/250+47/2000
  have law := hasLaw_unit_H10 _ hz hu
  have ht := gaussian_radial_tail 128 11 (by norm_num)
  have it : Integrable T gaussC := by
    by_contra hn
    have h' := integral_undef hn
    change (∫ z, radialTail 128 11 (Complex.normSq z) ∂gaussC) = 0 at h'
    rw [ht] at h'
    exact (ne_of_gt (mul_pos (div_pos (exp_pos _) (by norm_num)) (by norm_num))) h'
  have meas := (measurable_radialTail 128 11).comp Complex.continuous_normSq.measurable
  have hTZ : (∫ x, T (z x) ∂γ) = _ := (law.integral_comp meas.aestronglyMeasurable).trans ht
  have id' : Integrable D γ := ((Lp.memLp z).integrable (by norm_num)).norm.sub (integrable_hre h z)
  have iT : Integrable (fun x => T (z x)) γ := law.integrable_comp it
  have iq := (integrable_hre (unitPhaseL z-h) q).const_mul (2*E)
  have iF := (integrable_hre (unitPhaseL z-h) f).const_mul (2*d)
  have hu' : ⇑(unitPhaseL z) =ᵐ[γ] fun x => ph (z x) := MemLp.coeFn_toLp _
  have hpoint : (fun x => 2*E*hre ((unitPhaseL z-h) x) (q x) +
        2*d*hre ((unitPhaseL z-h) x) (f x)) ≤ᵐ[γ]
      (fun x => (√π/2)*(visibleWeight d 0*D x+(d/2)*T (z x))) := by
    filter_upwards [hh,hu',Lp.coeFn_sub (unitPhaseL z) h,
      H21_unitPhaseL_ae (Nat.succ_pos n) hz hu,H32_unitPhaseL_ae (Nat.succ_pos n) hz hu]
      with x hx hp hs hq hf
    change 2*E*hre ((unitPhaseL z-h) x) (((H21 (n+1)).starProjection (unitPhaseL z)) x) +
        2*d*hre ((unitPhaseL z-h) x) (((H32 (n+1)).starProjection (unitPhaseL z)) x) ≤ _
    rw [hs,Pi.sub_apply,hp,hq,hf,(poly_eq _).1,(poly_eq _).2,hre_scaled_difference,hre_scaled_difference]
    have r := mul_le_mul_of_nonneg_left (visible_weight_price hd hdν (z x) (h x) hx)
      (show 0 ≤ √π/2 by positivity)
    dsimp only [D,T,E]
    unfold visibleWeight at r ⊢
    linarith only [r]
  have main := integral_mono_ae (iq.add iF)
    (((id'.const_mul (visibleWeight d 0)).add (iT.const_mul (d/2))).const_mul (√π/2)) hpoint
  change (∫ x, 2*E*hre ((unitPhaseL z-h) x) (q x)+2*d*hre ((unitPhaseL z-h) x) (f x) ∂γ) ≤
    ∫ x, (√π/2)*(visibleWeight d 0*D x+d/2*T (z x)) ∂γ at main
  rw [integral_add iq iF,integral_const_mul,integral_const_mul,integral_const_mul,
    integral_add (id'.const_mul _) (iT.const_mul _),integral_const_mul,integral_const_mul,hTZ] at main
  dsimp only [D,γ] at main
  rw [integral_sub ((Lp.memLp z).integrable (by norm_num)).norm (integrable_hre h z),
    ←re_inner_eq_integral,←re_inner_eq_integral,←re_inner_eq_integral] at main
  dsimp only [q,f,E,γ,visibleWeight,laguerre2] at main
  convert main using 1
  ring

private theorem projection_tangent {n : ℕ} (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection]
    (h p : L2G n) :
    ‖K.starProjection p‖^2-2*(inner ℂ (p-h) (K.starProjection p)).re ≤ ‖K.starProjection h‖^2 := by
  let F := K.starProjection
  have he : inner ℂ (F (p-h)) (F p) = inner ℂ (p-h) (F p) := by
    rw [Submodule.inner_starProjection_left_eq_right, Submodule.starProjection_eq_self_iff.mpr
      (K.starProjection_apply_mem _)]
  have eq : F h = F p - F (p-h) := by rw [map_sub,sub_sub_cancel]
  change ‖F p‖^2-2*(inner ℂ (p-h) (F p)).re ≤ ‖F h‖^2
  rw [eq,@norm_sub_sq ℂ]
  have hs : (inner ℂ (F p) (F (p-h))).re = (inner ℂ (F (p-h)) (F p)).re := by
    rw [← inner_conj_symm,Complex.conj_re]
  change _ ≤ ‖F p‖^2-2*(inner ℂ (F p) (F (p-h))).re+‖F (p-h)‖^2
  rw [hs,he]
  linarith only [sq_nonneg ‖F (p-h)‖]

/-- The joint radial price leaves the full cubic energy of the half-difference visible.
The exponentially small error is the exact shifted Laguerre tail. -/
theorem signed_joint_visible_budget {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    {d : ℝ} (hd : 0 ≤ d) (hdν : d ≤ 47/2000) :
    (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) d g)).re ≤
    47/2000+(1-47/2000)*(√π/2)^2-(191/250+47/2000)*(π/32)-d*(3*π/256) +
    (√π/2)*(d/2)*(exp (-128)/22*((128+11^2)*(128-2)+2*128-3)) +
    (191/250-47/2000)*‖QkOf (n+1) f g‖^2 -
    ((1-47/2000)*tOf (n+1) f g+(1-191/250-2*(47/2000)-3*d/4)*(√π/2))*
      (√π/2-tOf (n+1) f g) := by
  let h := hOf (n+1) f g
  obtain ⟨z,hz,hu,hproj⟩ := exists_frame_vector (n+1) (Nat.succ_pos n) h
  have ht : (inner ℂ h z).re = tOf (n+1) f g := by
    have hp : inner ℂ z h = inner ℂ z ((H10 (n+1)).starProjection h) := by
      rw [← Submodule.inner_starProjection_left_eq_right,Submodule.starProjection_eq_self_iff.2 hz]
    rw [← inner_conj_symm,Complex.conj_re,hp,hproj,inner_smul_right,inner_self_eq_norm_sq_to_K,hu]
    simp [tOf,h]
  obtain ⟨c,hc⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hz
  have hm : (∫ x, ‖z x‖ ∂stdGaussian _) = √π/2 := by
    rw [← hc,integral_norm_linL,hc,hu,mul_one]
  have hcross := joint_visible_cross_price (norm_hOf_le (n+1) hf hg) hz hu hd hdν
  change _ ≤ (√π/2)*((191/250+47/2000+3*d/4)*((∫ x, ‖z x‖ ∂stdGaussian _) -
    (inner ℂ h z).re)+_) at hcross
  rw [ht,hm] at hcross
  have hq := projection_tangent (H21 (n+1)) h (unitPhaseL z)
  have h5 := mul_le_mul_of_nonneg_left (projection_tangent (H32 (n+1)) h (unitPhaseL z)) hd
  rw [normSq_H21_unitPhaseL (Nat.succ_pos n) hz hu] at hq
  rw [normSq_H32_unitPhaseL (Nat.succ_pos n) hz hu] at h5
  have hb := quintic_projection_energy_le (n+1) (kOf (n+1) f g)
  change ‖PkOf (n+1) f g‖^2 + ‖QkOf (n+1) f g‖^2 + _ ≤ _ at hb
  have hk := mul_le_mul_of_nonneg_right hdν
    (sq_nonneg ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖)
  have hs := normSq_hOf_add_normSq_kOf (n+1) hf hg
  rw [signedFifth_payoff,VOf_eq]
  dsimp only [h] at hq h5
  change _ ≤ ‖QhOf (n+1) f g‖^2 at hq
  nlinarith only [hcross,hq,h5,hb,hk,hs,sq_nonneg ‖PkOf (n+1) f g‖,
    sq_nonneg ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖]

end
end Grothe.LowerAnalytic
