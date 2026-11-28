import Grothe.LowerAnalytic.FibreIntegral
import Grothe.LowerAnalytic.Frame
import Grothe.LowerAnalytic.CapPolar
import Mathlib.MeasureTheory.Integral.Gamma

/-! Inverse radial moments of the six cubic fibre functions. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open MeasureTheory Real
open scoped ComplexConjugate
noncomputable section

/-- The Gaussian radial integrand of moment order `j-1/2` in the exponential variable. -/
def invRadMon (j : ℕ) (z : ℂ) : ℝ := ‖z‖ ^ (2*j) / ‖z‖

theorem integral_invRadMon (j : ℕ) :
    (∫ z, invRadMon j z ∂gaussC) = Real.Gamma ((j:ℝ)+1/2) := by
  rw [integral_gaussC_eq_volume _ (by unfold invRadMon; fun_prop)]
  let q : ℝ := (2*j:ℕ)- (1:ℝ)
  have hq : -2 < q := by dsimp [q]; linarith [Nat.cast_nonneg (α := ℝ) (2*j)]
  have h := Complex.integral_rpow_mul_exp_neg_rpow (p:=2) (q:=q) (by norm_num) hq
  have he (z : ℂ) : ‖z‖ ^ q = invRadMon j z := by
    rw [show q = ((2*j:ℕ):ℝ)-1 by rfl, Real.rpow_sub_one' (norm_nonneg _)
      (by
        intro h
        have hj : ((2*j:ℕ):ℝ)=1 := sub_eq_zero.mp h
        have hj' : 2*j=1 := by exact_mod_cast hj
        omega),
      Real.rpow_natCast]
    rfl
  simp only [he, Real.rpow_two] at h
  calc
    _ = π⁻¹ * (∫ z : ℂ, invRadMon j z * Real.exp (-‖z‖ ^ 2)) := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      filter_upwards with z
      rw [Complex.normSq_eq_norm_sq]
      ring
    _ = _ := by
      rw [h, show (q+2)/2 = (j:ℝ)+1/2 by dsimp [q]; push_cast; ring]
      field_simp

lemma integrable_invRadMon (j : ℕ) : Integrable (invRadMon j) gaussC := by
  by_contra h
  have hv := integral_invRadMon j
  rw [integral_undef h] at hv
  exact (Real.Gamma_pos_of_pos (show 0<(j:ℝ)+1/2 by positivity)).ne' hv.symm

/-- Squared inverse-radius norm, as a multiple of `√π`, in the fibre order of `Pieces`. -/
def invRadRatio : Fin 6 → ℝ := ![1, 3/4, 3/8, 1/2, 7/16, 1/2]

private lemma invRad_poly (a b c d : ℝ) :
    (∫ z, a*invRadMon 0 z + b*invRadMon 1 z + c*invRadMon 2 z + d*invRadMon 3 z ∂gaussC) =
      (a+b/2+3*c/4+15*d/8)*√π := by
  have h0 := (integrable_invRadMon 0).const_mul a
  have h1 := (integrable_invRadMon 1).const_mul b
  have h2 := (integrable_invRadMon 2).const_mul c
  have h3 := (integrable_invRadMon 3).const_mul d
  have h01 : Integrable (fun z => a*invRadMon 0 z+b*invRadMon 1 z) gaussC := h0.add h1
  have h012 : Integrable (fun z => a*invRadMon 0 z+b*invRadMon 1 z+c*invRadMon 2 z) gaussC := h01.add h2
  rw [integral_add h012 h3, integral_add h01 h2, integral_add h0 h1]
  simp only [integral_const_mul, integral_invRadMon, Nat.cast_ofNat, Nat.cast_one, Nat.cast_zero,
    zero_add]
  rw [show (3:ℝ)+1/2=(2+1/2)+1 by norm_num, Real.Gamma_add_one (by norm_num),
      show (2:ℝ)+1/2=(1+1/2)+1 by norm_num, Real.Gamma_add_one (by norm_num),
      show (1:ℝ)+1/2=1/2+1 by norm_num, Real.Gamma_add_one (by norm_num), Real.Gamma_one_half_eq]
  ring

theorem integral_invRad_fibre (j : Fin 6) :
    (∫ z, ‖fibreB j z‖ ^ 2 / ‖z‖ ∂gaussC) = invRadRatio j * √π := by
  have hr : (√2:ℝ)^2=2 := Real.sq_sqrt (by norm_num)
  fin_cases j
  all_goals simp only [invRadRatio, fibreB, Fin.isValue, Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.cons_val, Fin.reduceFinMk]
  case «0» => simpa [invRadMon] using invRad_poly 1 0 0 0
  case «1» =>
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((invRad_poly 1 (-2) 1 0).trans (by ring))
    rw [norm_fB1_eq, sq_abs, Complex.normSq_eq_norm_sq]
    simp only [invRadMon]
    ring
  case «2» =>
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((invRad_poly 0 0 (1/2) 0).trans (by ring))
    rw [norm_fB2_eq, div_pow, hr, Complex.normSq_eq_norm_sq]
    simp only [invRadMon]
    ring
  case «3» =>
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((invRad_poly 0 1 0 0).trans (by ring))
    simp [invRadMon]
  case «4» =>
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((invRad_poly 0 2 (-2) (1/2)).trans (by ring))
    rw [fB4,norm_div,norm_mul,Complex.norm_real,Complex.norm_real,Real.norm_eq_abs,
      Real.norm_eq_abs,abs_of_nonneg (Real.sqrt_nonneg _),div_pow,mul_pow,sq_abs,hr,
      Complex.normSq_eq_norm_sq]
    simp only [invRadMon]
    ring
  case «5» =>
    refine (integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)).trans
      ((invRad_poly 0 1 0 0).trans (by ring))
    simp [invRadMon]

/-! ### Weighted tensor decomposition -/

/-- The square-root density is zero at the origin, the convention for field division. -/
def invRadFibre (j : Fin 6) (z : ℂ) : ℂ := fibreB j z / (√‖z‖ : ℝ)

private theorem invRadFibre_sq (j : Fin 6) (z : ℂ) :
    ‖invRadFibre j z‖^2 = ‖fibreB j z‖^2 / ‖z‖ := by
  simp only [invRadFibre, norm_div, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (Real.sqrt_nonneg _), div_pow, Real.sq_sqrt (norm_nonneg _)]

theorem memLp_invRadFibre (j : Fin 6) : MemLp (invRadFibre j) 2 gaussC := by
  have hm : Measurable (invRadFibre j) := (continuous_fibreB j).measurable.div
    (Complex.measurable_ofReal.comp (Real.continuous_sqrt.comp continuous_norm).measurable)
  rw [memLp_two_iff_integrable_sq_norm hm.aestronglyMeasurable]
  simp_rw [invRadFibre_sq]
  by_contra h
  have hdiag := integral_invRad_fibre j
  rw [integral_undef h] at hdiag
  have hd : 0 < invRadRatio j := by fin_cases j <;> norm_num [invRadRatio]
  exact (mul_pos hd (Real.sqrt_pos.2 Real.pi_pos)).ne' hdiag.symm

private def turn : Fin 6 → ℂ := ![1, 1, -1, Complex.I, Complex.I, -Complex.I]

private theorem invRadFibre_turn (j : Fin 6) (z : ℂ) :
    invRadFibre j (Complex.I*z) = turn j * invRadFibre j z := by
  have h (w : ℂ) : Complex.normSq (Complex.I*w) = Complex.normSq w := by simp
  fin_cases j <;>
    simp [invRadFibre,turn,fibreB,fB1,fB2,fB4,h,Complex.conj_I,mul_pow,Complex.I_sq] <;>
    ring

private theorem fibre_weighted_offdiag {i j : Fin 6}
    (hij : conj (turn i)*turn j ≠ 1) :
    (∫ z, conj (invRadFibre i z) * invRadFibre j z ∂gaussC) = 0 := by
  have h := integral_rot_gaussC Complex.I Complex.norm_I
    (fun z => conj (invRadFibre i z) * invRadFibre j z)
  simp only [invRadFibre_turn, map_mul] at h
  have hmul (z : ℂ) : conj (turn i) * conj (invRadFibre i z) * (turn j * invRadFibre j z)
      = (conj (turn i)*turn j)*(conj (invRadFibre i z)*invRadFibre j z) := by ring
  simp_rw [hmul,integral_const_mul] at h
  exact Or.resolve_left (mul_eq_zero.mp (show (conj (turn i)*turn j-1) *
      (∫ z, conj (invRadFibre i z)*invRadFibre j z ∂gaussC) = 0 by linear_combination h))
    (sub_ne_zero.mpr hij)

private theorem fibre_weighted_diag (j : Fin 6) :
    (∫ z, conj (invRadFibre j z) * invRadFibre j z ∂gaussC) = ((invRadRatio j * √π:ℝ):ℂ) := by
  rw [← integral_invRad_fibre, ← integral_complex_ofReal]
  apply integral_congr_ae
  filter_upwards with z
  rw [← Complex.normSq_eq_conj_mul_self,Complex.normSq_eq_norm_sq,invRadFibre_sq]

private def invRadT {n : ℕ} (j : Fin 6) (r : L2G n) : L2G (n+1) :=
  tensorL n (invRadFibre j) r (memLp_invRadFibre j) (Lp.memLp r)

/-- After the quarter turn, only equal-charge pairs (0,1) and (3,4) need their
remote orthogonality. -/
private theorem invRadT_inner {n : ℕ} (i j : Fin 6) (r s : L2G n)
    (hr : r ∈ Kspace n i) (hs : s ∈ Kspace n j) :
    inner ℂ (invRadT i r) (invRadT j s) =
      if i=j then inner ℂ r s * ((invRadRatio i * √π:ℝ):ℂ) else 0 := by
  unfold invRadT
  rw [inner_tensorL, ← inner_L2]
  by_cases hij : i=j
  · subst j; rw [ite_eq_left rfl,fibre_weighted_diag]
  rw [ite_eq_right hij]
  by_cases hcharge : conj (turn i)*turn j=1
  · suffices h : inner ℂ r s = 0 by rw [h,zero_mul]
    have he : (i=0 ∧ j=1) ∨ (i=1 ∧ j=0) ∨ (i=3 ∧ j=4) ∨ (i=4 ∧ j=3) := by
      fin_cases i <;> fin_cases j <;>
        norm_num [turn,Complex.conj_I,Complex.I_sq,Complex.ext_iff,Complex.mul_re,Complex.mul_im] at *
    rcases he with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
    · exact (Submodule.mem_orthogonal _ _).1 (H10_le_H21_orth hs) r hr
    · rw [← inner_conj_symm]
      simp [(Submodule.mem_orthogonal _ _).1 (H10_le_H21_orth hr) s hs]
    · exact (Submodule.mem_orthogonal _ _).1 (K4_le_K3_orth hs) r hr
    · rw [← inner_conj_symm]
      simp [(Submodule.mem_orthogonal _ _).1 (K4_le_K3_orth hr) s hs]
  · rw [fibre_weighted_offdiag hcharge, mul_zero]

private theorem norm_sq_invRadT_sum {n : ℕ} (R : Fin 6 → L2G n)
    (hR : ∀ j, R j ∈ Kspace n j) :
    ‖∑ j, invRadT j (R j)‖^2 = ∑ j, ‖R j‖^2*(invRadRatio j * √π) := by
  rw [@norm_sq_eq_re_inner ℂ, sum_inner]
  simp_rw [inner_sum,invRadT_inner _ _ _ _ (hR _) (hR _),Finset.sum_ite_eq,Finset.mem_univ,ite_true]
  rw [RCLike.re_to_complex,Complex.re_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [inner_self_eq_norm_sq_to_K]
  change ((Complex.ofReal ‖R j‖)^2 * Complex.ofReal (invRadRatio j * √π)).re = _
  simp [sq,Complex.mul_re,Complex.mul_im]

/-- The exact weighted squared norm for the six cubic pieces. Only the stated
remote-space membership is needed, so all six coefficient fields may share variables. -/
theorem invRadius_energy_of_pieces {n : ℕ} (R : Fin 6 → L2G n)
    (hR : ∀ j, R j ∈ Kspace n j) :
    let q := ∑ j, T n j (R j)
    Integrable (fun x => ‖q x‖^2 / ‖(split2 x).2‖) (stdGaussian ((n+1)+(n+1))) ∧
      (∫ x, ‖q x‖^2 / ‖(split2 x).2‖ ∂stdGaussian ((n+1)+(n+1))) =
        ∑ j, ‖R j‖^2*(invRadRatio j * √π) := by
  dsimp only
  let q := ∑ j, T n j (R j)
  let S : L2G (n+1) := ∑ j, invRadT j (R j)
  have hS : ⇑S =ᵐ[stdGaussian ((n+1)+(n+1))] fun x => q x / (√‖(split2 x).2‖:ℝ) := by
    have h0 := coeFn_finset_sum (n+1) Finset.univ (fun j => invRadT j (R j))
    have h1 := coeFn_finset_sum (n+1) Finset.univ (fun j => T n j (R j))
    have h2 : ∀ᵐ x ∂stdGaussian ((n+1)+(n+1)), ∀ j, (invRadT j (R j)) x =
        tensorFn n (invRadFibre j) (R j) x :=
      ae_all_iff.2 fun j => tensorL_ae _ _ _ _
    have h3 : ∀ᵐ x ∂stdGaussian ((n+1)+(n+1)), ∀ j, (T n j (R j)) x =
        tensorFn n (fibreB j) (R j) x := ae_all_iff.2 fun j => Tfun_ae j (R j)
    filter_upwards [h0,h1,h2,h3] with x h0x h1x h2x h3x
    dsimp only [q]
    change (∑ j, invRadT j (R j) : L2G (n+1)) x = _
    rw [h0x,h1x]
    simp only [h2x,h3x,tensorFn,invRadFibre,mul_div_assoc,Finset.sum_div]
  have hs : (fun x => ‖S x‖^2) =ᵐ[stdGaussian ((n+1)+(n+1))]
      fun x => ‖q x‖^2 / ‖(split2 x).2‖ := by
    filter_upwards [hS] with x hx
    rw [hx,norm_div,Complex.norm_real,Real.norm_eq_abs,
      abs_of_nonneg (Real.sqrt_nonneg _),div_pow,Real.sq_sqrt (norm_nonneg _)]
  refine ⟨((memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable S)).1 (Lp.memLp S)).congr hs,?_⟩
  rw [← integral_congr_ae hs,← norm_sq_eq_integral]
  exact norm_sq_invRadT_sum R hR

/-- Dividing the squared norm of a true cubic by the radius of one standard
complex coordinate costs at most √π. -/
theorem integral_invRadius_cubic {n : ℕ} {q : L2G (n+1)} (hq : q ∈ H21 (n+1)) :
    Integrable (fun x => ‖q x‖^2 / ‖(split2 x).2‖) (stdGaussian ((n+1)+(n+1))) ∧
    (∫ x, ‖q x‖^2 / ‖(split2 x).2‖ ∂stdGaussian ((n+1)+(n+1))) ≤ √π * ‖q‖^2 := by
  obtain ⟨R,hR,rfl⟩ := exists_piece_repr hq
  obtain ⟨hi,he⟩ := invRadius_energy_of_pieces R hR
  refine ⟨hi,?_⟩
  rw [he,norm_sq_sum_T,Finset.mul_sum]
  refine Finset.sum_le_sum fun j _ => ?_
  have hle : invRadRatio j ≤ 1 := by fin_cases j <;> norm_num [invRadRatio]
  nlinarith [mul_nonneg (sq_nonneg ‖R j‖) (mul_nonneg (sub_nonneg.mpr hle) (Real.sqrt_nonneg π))]

/-- The normalized zero-th coordinate is the visible component of the product split. -/
lemma zeta0_ae_split2 (n : ℕ) : ⇑(zeta0 n) =ᵐ[stdGaussian ((n+1)+(n+1))]
    fun x => (split2 x).2 := by
  unfold zeta0
  filter_upwards [Lp.coeFn_smul (((√2:ℝ):ℂ)⁻¹) (zL (n+1) 0), zL_ae (n+1) 0] with x hs hz
  have hzx : zc (n+1) 0 x = ((√2:ℝ):ℂ)*(split2 x).2 := by
    simpa only [split2_symm_split2] using joinR_zc0 (split2 (n:=n) x).2 (split2 x).1
  rw [hs,Pi.smul_apply,smul_eq_mul,hz,hzx,inv_mul_cancel_left₀
    (show ((√2:ℝ):ℂ) ≠ 0 by exact_mod_cast sqrt_two_ne)]

/-- Rotation-invariant inverse-radius bound for every unit visible first-chaos direction. -/
theorem integral_invRadius_cubic_of_unit {m : ℕ} (hm : 0 < m) {q u : L2G m}
    (hq : q ∈ H21 m) (hu : u ∈ H10 m) (h1 : ‖u‖=1) :
    Integrable (fun x => ‖q x‖^2 / ‖u x‖) (stdGaussian (m+m)) ∧
    (∫ x, ‖q x‖^2 / ‖u x‖ ∂stdGaussian (m+m)) ≤ √π*‖q‖^2 := by
  obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_zero_of_lt hm)
  obtain ⟨W,hW⟩ := exists_Cop_eq (Nat.succ_pos n) hu h1
  have hdir : ⇑(Cop W u) =ᵐ[stdGaussian ((n+1)+(n+1))] fun x => (split2 x).2 := by
    rw [hW]
    exact zeta0_ae_split2 n
  set g := fun x => ‖q x‖^2/‖u x‖
  have hg : AEStronglyMeasurable g (stdGaussian ((n+1)+(n+1))) :=
    (((Lp.aestronglyMeasurable q).norm.pow 2).aemeasurable.div
      (Lp.aestronglyMeasurable u).norm.aemeasurable).aestronglyMeasurable
  have hcomp : (fun x => ‖(Cop W q) x‖^2/‖(split2 x).2‖) =ᵐ[stdGaussian ((n+1)+(n+1))]
      g ∘ Phi W := by
    filter_upwards [hdir,Cop_ae W u,Cop_ae W q] with x hz hu' hq'
    simp only [g,Function.comp_apply,hq',← hz,hu']
  have ⟨hi,hle⟩ := integral_invRadius_cubic (q:=Cop W q) (Cop_H21 W hq)
  have hp := measurePreserving_Phi W
  refine ⟨(hp.integrable_comp hg).1 (hi.congr hcomp),?_⟩
  have he := integral_map (μ:=stdGaussian ((n+1)+(n+1))) hp.measurable.aemeasurable
    (f:=g) (hp.map_eq.symm ▸ hg)
  rw [hp.map_eq] at he
  change (∫ x, g x ∂_) ≤ _
  rw [he]
  rw [integral_congr_ae hcomp,LinearIsometry.norm_map] at hle
  exact hle

end
end Grothe.LowerAnalytic
