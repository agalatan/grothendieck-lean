import QuinticResearch.SignedRadial
import QuinticResearch.SignedVector
import QuinticResearch.QuinticVisibleMoments
import Grothe.LowerAnalytic.MassRowFrame
import Grothe.LowerAnalytic.Reduction

set_option warningAsError true

/-! A physical bound for all phase pairs in terms of their actual half-difference cubic energy.
Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open MeasureTheory Real Grothe.Lower
open scoped ComplexConjugate
noncomputable section

/- The two visible-coordinate estimates below are the projection and frame arguments of
#890, from CubicVisibleTangent.lean at commit 3426294198c4313e365f363bd9093c42ab6b6ac0.
The third radial moment is available from this optional package. -/
private theorem coord_cubic_norm_moment : (∫ z:ℂ, ‖z‖^3 ∂gaussC) = 3*√π/4 := by
  convert visible_radial_odd 1 using 1
  norm_num [Nat.doubleFactorial]

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
private theorem retained_visible_cubic_tangent {n : ℕ} (hn : 0 < n) {f g : L2G n}
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


/-- The phase value, the retained cubic energy and the visible radial deficit. -/
def signedCubicBudget (d t q : ℝ) : ℝ :=
  let μ := √π/2
  47/2000 + (1-47/2000)*μ^2 - (191/250+47/2000)*(π/32) - d*(3*π/256)
    + d*(μ/4)*(199/177000) + (191/250-47/2000)*q
    - ((1-47/2000)*t + (1-191/250-2*(47/2000)-61*d/8)*μ)*(μ-t)

/-- The spectral contribution of the half-difference after its cubic energy is
retained. The three terms price the first projection, its joint orthogonal
complement with the cubic projection, and the part beyond the fifth projection. -/
def signedHalfDifferenceDebit (d : ℝ) (n : ℕ) (f g : L2G n) : ℝ :=
  let p := ‖PkOf n f g‖^2
  let s := ‖kOf n f g‖^2-p-‖QkOf n f g‖^2
  (1+47/2000)*p + (2*(47/2000)-d)*s + d*(s-‖(H32 n).starProjection (kOf n f g)‖^2)

/-- Bessel's inequality makes each of the three spectral debits nonnegative. -/
theorem signedHalfDifferenceDebit_nonneg {n : ℕ} {f g : L2G n} {d : ℝ}
    (hd : 0 ≤ d) (hdν : d ≤ 47/2000) : 0 ≤ signedHalfDifferenceDebit d n f g := by
  have hb := quintic_projection_energy_le n (kOf n f g)
  change ‖PkOf n f g‖^2 + ‖QkOf n f g‖^2 + _ ≤ _ at hb
  have hrem : 0 ≤ ‖kOf n f g‖^2-‖PkOf n f g‖^2-‖QkOf n f g‖^2
      - ‖(H32 n).starProjection (kOf n f g)‖^2 := by linarith only [hb]
  have hs : 0 ≤ ‖kOf n f g‖^2-‖PkOf n f g‖^2-‖QkOf n f g‖^2 := by
    linarith only [hrem,sq_nonneg ‖(H32 n).starProjection (kOf n f g)‖]
  unfold signedHalfDifferenceDebit
  exact add_nonneg (add_nonneg (mul_nonneg (by norm_num) (sq_nonneg _))
    (mul_nonneg (by linarith only [hdν]) hs)) (mul_nonneg hd hrem)

/-- The real signed payoff with the entire half-difference spectral cost.
Only the visible estimates on the half-sum lose information in this step. -/
theorem signed_cubic_budget_with_residuals {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    {d : ℝ} (hd : 0 ≤ d) :
    (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) d g)).re ≤
      signedCubicBudget d (tOf (n+1) f g) (‖QkOf (n+1) f g‖^2) -
        signedHalfDifferenceDebit d (n+1) f g := by
  have hq := retained_visible_cubic_tangent (Nat.succ_pos _) hf hg
  have hh := mul_le_mul_of_nonneg_left (fifth_h_tangent_eleven hf hg) hd
  rw [signedFifth_payoff, VOf_eq]
  unfold signedCubicBudget signedHalfDifferenceDebit
  have hs := normSq_hOf_add_normSq_kOf (n+1) hf hg
  nlinarith only [hq,hh,hs]

/-- Finite dimensions, arbitrary unimodular pairs, and no remote-sector hypothesis. -/
theorem signed_cubic_budget {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    {d : ℝ} (hd : 0 ≤ d) (hdν : d ≤ 47/2000) :
    (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) d g)).re ≤
      signedCubicBudget d (tOf (n+1) f g) (‖QkOf (n+1) f g‖^2) :=
  (signed_cubic_budget_with_residuals hf hg hd).trans
    (sub_le_self _ (signedHalfDifferenceDebit_nonneg hd hdν))

/-- A uniform real-payoff cap with the actual half-difference cubic energy retained. -/
theorem signed_cubic_cap_add_energy {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    :
    (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) g)).re ≤
      712398/1000000 + (191/250-47/2000)*‖QkOf (n+1) f g‖^2 := by
  apply (signed_cubic_budget hf hg (d:=1/50) (by norm_num) (by norm_num)).trans
  have hμ : 0 ≤ √π/2 := by positivity
  have hU : √π/2 ≤ (886227:ℝ)/1000000 := by
    rw [div_le_iff₀ (by norm_num), Real.sqrt_le_left (by norm_num)]
    linarith only [Real.pi_lt_d6]
  have ht : 0 ≤ tOf (n+1) f g := norm_nonneg _
  have hgap := sub_nonneg.mpr (tOf_le_sqrt_pi (n+1) hf hg)
  have hprod := mul_nonneg (add_nonneg
    (mul_nonneg (by norm_num : 0 ≤ (1-47/2000:ℝ)) ht)
    (mul_nonneg (by norm_num : 0 ≤ (1-191/250-2*(47/2000)-61*(1/50)/8:ℝ)) hμ)) hgap
  unfold signedCubicBudget
  nlinarith only [hprod,hU,Real.pi_lt_d6,Real.sq_sqrt Real.pi_nonneg]

/-- Every phase pair with vanishing half-difference cubic projection, in particular
every diagonal pair, obeys this real-payoff cap. -/
theorem signed_zero_cubic_cap {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hzero : QkOf (n+1) f g = 0) :
    (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) g)).re ≤
      712398/1000000 := by
  simpa [hzero] using signed_cubic_cap_add_energy hf hg

/-- The 1.4023 real-payoff target holds at every amplitude for sufficiently small
physical cubic half-difference. A complex rotation can change this projection. -/
theorem signed_small_cubic_14023 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hsmall : ‖QkOf (n+1) f g‖ ≤ 31/1000) :
    (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) g)).re <
      10000/14023 := by
  apply (signed_cubic_cap_add_energy hf hg).trans_lt
  nlinarith only [sq_le_sq' ((neg_nonpos.mpr (by norm_num : (0:ℝ) ≤ 31/1000)).trans (norm_nonneg _)) hsmall]


/-- Across the five central cells the visible deficit pays for a substantially larger
cubic energy than the amplitude-independent test. -/
theorem signed_central_cubic_14023 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hlo : 1071/1280 ≤ tOf (n+1) f g) (hhi : tOf (n+1) f g ≤ 2151/2560)
    (hq : ‖QkOf (n+1) f g‖^2 ≤ 537/10000) :
    (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) g)).re <
      10000/14023 := by
  apply (signed_cubic_budget hf hg (d:=1/50) (by norm_num) (by norm_num)).trans_lt
  let μ := √π/2
  have hm : (88622:ℝ)/100000 ≤ μ := by
    dsimp [μ]
    rw [le_div_iff₀ (by norm_num), Real.le_sqrt (by norm_num) Real.pi_nonneg]
    linarith only [Real.pi_gt_d6]
  have hM : μ ≤ (886227:ℝ)/1000000 := by
    dsimp [μ]
    rw [div_le_iff₀ (by norm_num), Real.sqrt_le_left (by norm_num)]
    linarith only [Real.pi_lt_d6]
  have ha : ((1-47/2000)*(1071/1280)+(1-191/250-2*(47/2000)-61*(1/50)/8)*(88622/100000):ℝ)
      ≤ (1-47/2000)*tOf (n+1) f g + (1-191/250-2*(47/2000)-61*(1/50)/8)*μ := by
    linarith only [hlo,hm]
  have hb : (88622/100000-2151/2560:ℝ) ≤ μ-tOf (n+1) f g := by linarith only [hm,hhi]
  have hp := mul_le_mul ha hb (by norm_num) (le_trans (by norm_num) ha)
  unfold signedCubicBudget
  dsimp [μ] at hp hM
  nlinarith only [hp,hM,Real.pi_lt_d6,Real.sq_sqrt Real.pi_nonneg,hq]

end
end Grothe.LowerAnalytic
