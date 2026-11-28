import QuinticResearch.QuinticVisibleMoments
import QuinticResearch.QuinticVisibleReduction
import QuinticResearch.QuinticPhaseStability
import Grothe.LowerAnalytic.Fifth.VisibleProjection

/-! The cubic phase projection uses the visible Gaussian factors of the fifth projection. Agent-ID: codex-a7c4 -/

namespace Grothe.LowerAnalytic
open MeasureTheory Real
open scoped ComplexConjugate
noncomputable section
variable {n : ℕ}

private theorem visLift_ae (f : ℂ → ℂ) (hf : MemLp f 2 gaussC) :
    ⇑(visLift n f hf) =ᵐ[stdGaussian ((n+1)+(n+1))] fun x => f (split2 x).2 := by
  filter_upwards [tensorL_ae (n:=n) f (fun _ => 1) hf (memLp_const 1)] with x hx
  simp only [visLift,hx,tensorFn,one_mul]

private theorem visLift_sub (f g : ℂ → ℂ) (hf : MemLp f 2 gaussC) (hg : MemLp g 2 gaussC) :
    visLift n (f-g) (hf.sub hg) = visLift n f hf - visLift n g hg := by
  apply Lp.ext
  filter_upwards [visLift_ae (f-g) (hf.sub hg),Lp.coeFn_sub (visLift n f hf) (visLift n g hg),
    visLift_ae f hf,visLift_ae g hg] with x hx ha hb hc
  rw [hx,ha,Pi.sub_apply,Pi.sub_apply,hb,hc]

end
end Grothe.LowerAnalytic

namespace Grothe.LowerAnalytic
open MeasureTheory Real
open scoped ComplexConjugate
noncomputable section
variable {m n : ℕ}

private theorem vis_ae_ne_zero : ∀ᵐ z : ℂ ∂gaussC, z ≠ 0 := by
  have hz : gaussC ({0}:Set ℂ) = 0 := by
    apply (measureReal_eq_zero_iff (measure_ne_top _ _)).mp
    rw [← integral_indicator_one (measurableSet_singleton (0:ℂ)),
      integral_gaussC_eq_volume _ (measurable_one.indicator (measurableSet_singleton _))]
    apply integral_eq_zero_of_ae
    filter_upwards [Measure.ae_ne (volume : Measure ℂ) 0] with z h
    simp [Set.indicator_of_notMem,h]
  simpa using (measure_eq_zero_iff_ae_notMem.mp hz)

private theorem unitPhaseL_ae (u : L2G m) :
    ⇑(unitPhaseL u) =ᵐ[stdGaussian (m+m)] fun x => ph (u x) := MemLp.coeFn_toLp _

private theorem unitPhaseL_Cop (W : EuclideanSpace ℂ (Fin m) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin m))
    (u : L2G m) : unitPhaseL (Cop W u) = Cop W (unitPhaseL u) := by
  apply Lp.ext
  filter_upwards [unitPhaseL_ae (Cop W u),Cop_ae W (unitPhaseL u),comp_ae W (unitPhaseL_ae u),
    Cop_ae W u] with x h1 h2 h3 h4
  rw [h1,h2,h3,h4]

private theorem unitPhaseL_zeta0 :
    unitPhaseL (zeta0 n) = visLift n visiblePhase visPhase_mem := by
  have hph : ph =ᵐ[gaussC] visiblePhase := by
    filter_upwards [vis_ae_ne_zero] with z hz
    simp [ph,hz,visiblePhase]
  have hh := tensorFn_congr_ae (n:=n) (G:=fun _ => (1:ℂ)) (G':=fun _ => (1:ℂ)) hph Filter.EventuallyEq.rfl
  have hz (x : Fin ((n+1)+(n+1)) → ℝ) :
      zc (n+1) 0 x = ((√2:ℝ):ℂ) * (split2 x).2 := by
    simpa only [split2_symm_split2] using joinR_zc0 (split2 (n:=n) x).2 (split2 x).1
  apply Lp.ext
  filter_upwards [unitPhaseL_ae (zeta0 n),Lp.coeFn_smul (((√2:ℝ):ℂ)⁻¹) (zL (n+1) 0),
    zL_ae (n+1) 0,visLift_ae visiblePhase visPhase_mem,hh] with x h1 h2 h3 h4 h5
  rw [h1,h4,zeta0,h2,Pi.smul_apply,smul_eq_mul,h3,hz,inv_mul_cancel_left₀
    (show ((√2:ℝ):ℂ) ≠ 0 by exact_mod_cast sqrt_two_ne)]
  simpa [tensorFn] using h5

end
end Grothe.LowerAnalytic

namespace Grothe.LowerAnalytic
open MeasureTheory Grothe.Lower Real
open scoped ComplexConjugate
noncomputable section
variable {m n : ℕ}

private theorem vis_cubic_split :
    visLift n visCubic visCubic_mem =
      visMu • zeta0 n + ((-(√π/2)/4 : ℝ) : ℂ) • vL (n+1) 0 := by
  apply Lp.ext
  filter_upwards [visLift_ae visCubic visCubic_mem,Lvec_ae (n:=n) (√π/2) (-(√π/2)/4)] with x hx hy
  rw [hx,visMu,hy]
  have h := Lfun_joinR (n:=n) (√π/2) (-(√π/2)/4) (split2 x).2 (split2 x).1
  rw [split2_symm_split2] at h
  rw [h]
  let z := (split2 x).2
  have hzz : z * conj z = (Complex.normSq z:ℂ) := Complex.mul_conj z
  change visCubic z = Lf _ _ z
  simp only [visCubic,visMu,visiblePower,Pi.sub_apply,Pi.smul_apply,smul_eq_mul,Lf,
    pow_zero,pow_one]
  push_cast
  linear_combination (-(Real.sqrt Real.pi:ℂ)*z/8) * hzz

private theorem H21_visible_unitPhaseL :
    (H21 (n+1)).starProjection (unitPhaseL (zeta0 n)) =
      ((-(√π/2)/4 : ℝ):ℂ) • vL (n+1) 0 := by
  have hr := visible_orthogonal_chargeOne5 (n:=n) _ ((visPhase_mem.sub visCubic_mem).sub visFifth_mem)
    (fun p hp q hq => visPhase_orth_five p q hp hq)
  change visLift n _ _ ∈ _ at hr
  rw [visLift_sub _ _ (visPhase_mem.sub visCubic_mem) visFifth_mem,visLift_sub _ _ visPhase_mem visCubic_mem,vis_cubic_split] at hr
  have hf := visible_orthogonal_chargeOne3 (n:=n) visFifth visFifth_mem (fun p hp q hq => visFifth_orth_cubic p q hp hq)
  have h35 : H21 (n+1) ≤ chargeOne5 (n+1) := (inf_le_left : H21 (n+1) ≤ chargeOne3 (n+1)).trans le_sup_left
  have a := Submodule.orthogonal_le h35 hr
  have b := Submodule.orthogonal_le (inf_le_left : H21 (n+1) ≤ chargeOne3 (n+1)) hf
  change visLift n _ _ ∈ _ at b
  have c := Submodule.orthogonal_le (H21_le_orthogonal (n+1))
    ((H10 (n+1)).le_orthogonal_orthogonal ((H10 (n+1)).smul_mem visMu (zeta0_mem (n:=n))))
  rw [unitPhaseL_zeta0]
  apply Submodule.eq_starProjection_of_mem_orthogonal (Submodule.smul_mem _ _ (vL_mem_H21 _ _))
  convert (H21 (n+1))ᗮ.add_mem ((H21 (n+1))ᗮ.add_mem a b) c using 1; abel

def visibleCubicPolynomial (z:ℂ) := -(visMu/4) * z * ((‖z‖:ℂ)^2-2)

private theorem visible_vL_ae :
    ⇑(vL (n+1) 0) =ᵐ[stdGaussian ((n+1)+(n+1))]
      fun x => zeta0 n x * ((‖zeta0 n x‖:ℂ)^2-2) := by
  have hv := Lvec_ae (n:=n) 0 1
  simp only [Complex.ofReal_zero,Complex.ofReal_one,zero_smul,one_smul,zero_add] at hv
  filter_upwards [hv,Lp.coeFn_smul (((√2:ℝ):ℂ)⁻¹) (zL (n+1) 0),
    zL_ae (n+1) 0] with x h hs hz
  have hz' : zc (n+1) 0 x = ((√2:ℝ):ℂ) * (split2 x).2 := by
    simpa only [split2_symm_split2] using joinR_zc0 (split2 (n:=n) x).2 (split2 x).1
  have hl := Lfun_joinR (n:=n) 0 1 (split2 x).2 (split2 x).1
  rw [split2_symm_split2] at hl
  rw [h,hl,zeta0,hs,Pi.smul_apply,smul_eq_mul,hz,hz',inv_mul_cancel_left₀
    (show ((√2:ℝ):ℂ) ≠ 0 by exact_mod_cast sqrt_two_ne)]
  simp [Lf,Complex.normSq_eq_norm_sq]

theorem H21_unitPhaseL_ae (hm : 0 < m) {u : L2G m} (hu : u ∈ H10 m) (h1 : ‖u‖ = 1) :
    ⇑((H21 m).starProjection (unitPhaseL u)) =ᵐ[stdGaussian (m+m)]
      fun x => visibleCubicPolynomial (u x) := by
  obtain ⟨W,hW⟩ := exists_Cop_eq hm hu h1
  obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_zero_of_lt hm)
  let P := (H21 (n+1)).starProjection (unitPhaseL u)
  have hcov : ⇑(Cop W P) =ᵐ[stdGaussian ((n+1)+(n+1))]
      fun x => visibleCubicPolynomial ((Cop W u) x) := by
    dsimp only [P]
    rw [← Q_Cop,← unitPhaseL_Cop,hW]
    change ⇑((H21 (n+1)).starProjection (unitPhaseL (zeta0 n))) =ᵐ[_] fun x => visibleCubicPolynomial (zeta0 n x)
    rw [H21_visible_unitPhaseL]
    filter_upwards [Lp.coeFn_smul ((-(√π/2)/4:ℝ):ℂ) (vL (n+1) 0),
      visible_vL_ae (n:=n)] with x ha hb
    simp only [ha,Pi.smul_apply,smul_eq_mul,hb,visibleCubicPolynomial,visMu]
    push_cast; ring
  change ⇑P =ᵐ[_] _
  filter_upwards [comp_ae W.symm hcov,comp_ae W.symm (Cop_ae W P),
    comp_ae W.symm (Cop_ae W u)] with x hc ha hb
  simpa only [ha,hb,Phi_Phi_symm] using hc

theorem normSq_H21_unitPhaseL (hm : 0 < m) {u : L2G m} (hu : u ∈ H10 m) (h1 : ‖u‖ = 1) :
    ‖(H21 m).starProjection (unitPhaseL u)‖^2 = π/32 := by
  obtain ⟨W,hW⟩ := exists_Cop_eq hm hu h1
  obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_zero_of_lt hm)
  calc
    _ = ‖(H21 (n+1)).starProjection (unitPhaseL (Cop W u))‖^2 := by
      rw [unitPhaseL_Cop,Q_Cop,LinearIsometry.norm_map]
    _ = _ := by
      rw [hW]
      change ‖(H21 (n+1)).starProjection (unitPhaseL (zeta0 n))‖^2 = _
      rw [H21_visible_unitPhaseL,norm_smul,mul_pow,norm_vL_sq,Complex.norm_real,
        Real.norm_eq_abs,sq_abs]
      nlinarith [Real.sq_sqrt Real.pi_pos.le]
end
end Grothe.LowerAnalytic
