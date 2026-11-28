import Grothe.LowerAnalytic.Fifth.Witness
import Grothe.LowerAnalytic.FibreIntegral
import Grothe.LowerAnalytic.Frame

/-! # Rotation and fibre orthogonality of the fifth Hermite space

Agent-ID: codex-a7c4
-/

set_option warningAsError true

namespace Grothe.LowerAnalytic
open MeasureTheory
open scoped ComplexConjugate
noncomputable section
variable {m : ℕ}
variable (W : EuclideanSpace ℂ (Fin m) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin m))

private def quinticTag (i : Fin 5) : ℂ →+* ℂ :=
  if (i:ℕ) < 3 then RingHom.id ℂ else starRingEnd ℂ

private theorem quintic_product (p : Fin 5 → Fin m) (x : Fin (m+m) → ℝ) :
    quinticMonomial m p x = ∏ i, quinticTag i (zc m (p i) x) := by
  rw [Fin.prod_univ_five]
  rfl

private theorem Cop_quintic (p : Fin 5 → Fin m) :
    Cop W (quinticMonomialL m p) =
      ∑ s : Fin 5 → Fin m, (∏ i, quinticTag i (wco m W (p i) (s i))) • quinticMonomialL m s := by
  classical
  have h (s : Fin 5 → Fin m) :
      ⇑(quinticMonomialL m s) =ᵐ[stdGaussian (m+m)] quinticMonomial m s := MemLp.coeFn_toLp _
  refine Lp.ext ((Cop_ae W _).trans ((comp_ae W (h p)).trans ?_))
  refine Filter.EventuallyEq.trans ?_ (sum_smul_ae _ _ _ h).symm
  filter_upwards with x
  simp_rw [quintic_product,zc_Phi_sum,map_sum,map_mul,Fintype.prod_sum,Finset.prod_mul_distrib]
  rfl

theorem Cop_chargeOne5 : chargeOne5 m ≤ (chargeOne5 m).comap (Cop W).toLinearMap := by
  apply sup_le
  · intro u hu
    exact (le_sup_left : chargeOne3 m ≤ chargeOne5 m) (Cop_chargeOne3 W hu)
  · apply Submodule.span_le.mpr
    rintro _ ⟨p,rfl⟩
    change Cop W (quinticMonomialL m p) ∈ chargeOne5 m
    rw [Cop_quintic]
    exact Submodule.sum_mem _ fun s _ => Submodule.smul_mem _ _
      ((le_sup_right : Submodule.span ℂ (Set.range (quinticMonomialL m)) ≤ chargeOne5 m)
        (Submodule.subset_span ⟨s,rfl⟩))

theorem Cop_H32 : H32 m ≤ (H32 m).comap (Cop W).toLinearMap := by
  intro x hx
  obtain ⟨h1,h2⟩ := Submodule.mem_inf.mp hx
  refine Submodule.mem_inf.mpr ⟨Cop_chargeOne5 W h1,?_⟩
  rw [Submodule.mem_orthogonal]
  intro a ha
  change inner ℂ a (Cop W x) = 0
  rw [← Cop_Cop_symm W a, LinearIsometry.inner_map_map]
  exact (Submodule.mem_orthogonal _ _).mp h2 _ (Cop_chargeOne3 W.symm ha)

theorem H32_starProjection_Cop (u : L2G m) :
    (H32 m).starProjection (Cop W u) = Cop W ((H32 m).starProjection u) :=
  starProjection_Cop W _ (Cop_H32 W) (Cop_H32 W.symm) u

end
end Grothe.LowerAnalytic

namespace Grothe.LowerAnalytic
open MeasureTheory
open scoped ComplexConjugate
noncomputable section
variable {n : ℕ}

private def Factors (k l : ℕ) (f : ℂ → ℂ) : Prop :=
  ∃ p ≤ k, ∃ q ≤ l, ∃ a : ℂ, ∀ z, f z = a * z^p * conj z^q

private theorem Factors.mul {k l k' l' : ℕ} {f g : ℂ → ℂ}
    (hf : Factors k l f) (hg : Factors k' l' g) :
    Factors (k+k') (l+l') (fun z => f z * g z) := by
  obtain ⟨p,hp,q,hq,a,ha⟩ := hf
  obtain ⟨r,hr,s,hs,b,hb⟩ := hg
  refine ⟨p+r, by omega, q+s, by omega, a*b, fun z => ?_⟩
  dsimp only
  rw [ha,hb,pow_add,pow_add]
  ring

private theorem Factors.conj {k l : ℕ} {f : ℂ → ℂ} (hf : Factors k l f) :
    Factors l k (fun z => conj (f z)) := by
  obtain ⟨p,hp,q,hq,a,ha⟩ := hf
  refine ⟨q,hq,p,hp,conj a,fun z => ?_⟩
  simp only [ha,map_mul,map_pow,Complex.conj_conj]
  ring

private theorem factors_coord (j : Fin (n+1)) (y : Fin (n+n) → ℝ) :
    Factors 1 0 (fun z => zc (n+1) j (joinR z y)) := by
  cases j using Fin.cases with
  | zero => exact ⟨1,by decide,0,by decide,(√2:ℝ),fun z => by simp [joinR_zc0]⟩
  | succ j => exact ⟨0,by decide,0,by decide,zc n j y,fun z => by simp [joinR_zc_succ]⟩

private theorem inner_visible_zero {k l : ℕ} (F : ℂ → ℂ) (hF : MemLp F 2 gaussC)
    (hm : ∀ p ≤ k, ∀ q ≤ l, (∫ z : ℂ, conj (z^p * conj z^q) * F z ∂gaussC) = 0)
    {G : L2G (n+1)} {g : (Fin ((n+1)+(n+1)) → ℝ) → ℂ}
    (hg : ⇑G =ᵐ[stdGaussian ((n+1)+(n+1))] g)
    (hs : ∀ y, Factors k l (fun z => g (joinR z y))) :
    inner ℂ G (tensorL n F (fun _ => 1) hF (memLp_const 1)) = 0 := by
  let H := tensorL n F (fun _ => 1) hF (memLp_const 1)
  have hi := L2.integrable_inner (𝕜 := ℂ) G H
  have he : (fun x => inner ℂ (G x) (H x)) =ᵐ[stdGaussian ((n+1)+(n+1))]
      fun x => conj (g x) * tensorFn n F (fun _ => 1) x := by
    filter_upwards [hg,tensorL_ae F (fun _ => 1) hF (memLp_const 1)] with x hx hy
    rw [RCLike.inner_apply',hx,show H x = _ from hy]
  change inner ℂ G H = 0
  rw [L2.inner_def,integral_congr_ae he,integral_split2 _ (hi.congr he)]
  apply integral_eq_zero_of_ae
  filter_upwards with y
  obtain ⟨p,hp,q,hq,a,ha⟩ := hs y
  simp_rw [tensorFn_joinR,one_mul,ha]
  calc
    _ = conj a * ∫ z : ℂ, conj (z^p * conj z^q) * F z ∂gaussC := by
      rw [← integral_const_mul]; congr 1; funext z; simp only [map_mul]; ring
    _ = 0 := by rw [hm p hp q hq,mul_zero]

/-- Six one-variable tests suffice in degree three. -/
theorem visible_orthogonal_chargeOne3 (F : ℂ → ℂ) (hF : MemLp F 2 gaussC)
    (hm : ∀ p ≤ 2, ∀ q ≤ 1, (∫ z : ℂ, conj (z^p * conj z^q) * F z ∂gaussC) = 0) :
    tensorL n F (fun _ => 1) hF (memLp_const 1) ∈ (chargeOne3 (n+1))ᗮ := by
  let H := tensorL n F (fun _ => 1) hF (memLp_const 1)
  suffices h : chargeOne3 (n+1) ≤ (ℂ ∙ H)ᗮ by
    apply (Submodule.mem_orthogonal _ _).2
    intro g hg
    exact Submodule.mem_orthogonal_singleton_iff_inner_left.mp (h hg)
  apply Submodule.span_le.mpr
  rintro g (⟨j,rfl⟩ | ⟨⟨i,j,k⟩,rfl⟩) <;>
    apply Submodule.mem_orthogonal_singleton_iff_inner_left.mpr
  · exact inner_visible_zero F hF (k:=1) (l:=0) (fun p hp q hq => hm p (by omega) q (by omega))
      (MemLp.coeFn_toLp _) (factors_coord j)
  · exact inner_visible_zero F hF hm (MemLp.coeFn_toLp _) (fun y =>
      ((factors_coord i y).mul (factors_coord j y)).mul (factors_coord k y).conj)

/-- A scalar test against 12 visible monomials is sufficient for orthogonality
to the entire multivariate charge-one degree-five polynomial space. -/
theorem visible_orthogonal_chargeOne5 (F : ℂ → ℂ) (hF : MemLp F 2 gaussC)
    (hm : ∀ p ≤ 3, ∀ q ≤ 2, (∫ z : ℂ, conj (z^p * conj z^q) * F z ∂gaussC) = 0) :
    tensorL n F (fun _ => 1) hF (memLp_const 1) ∈ (chargeOne5 (n+1))ᗮ := by
  let H := tensorL n F (fun _ => 1) hF (memLp_const 1)
  suffices h : chargeOne5 (n+1) ≤ (ℂ ∙ H)ᗮ by
    apply (Submodule.mem_orthogonal _ _).2
    intro g hg
    exact Submodule.mem_orthogonal_singleton_iff_inner_left.mp (h hg)
  apply sup_le
  · intro g hg
    apply Submodule.mem_orthogonal_singleton_iff_inner_left.mpr
    exact Submodule.inner_right_of_mem_orthogonal hg (visible_orthogonal_chargeOne3 F hF
      (fun p hp q hq => hm p (by omega) q (by omega)))
  · apply Submodule.span_le.mpr
    rintro _ ⟨j,rfl⟩
    apply Submodule.mem_orthogonal_singleton_iff_inner_left.mpr
    exact inner_visible_zero F hF hm (MemLp.coeFn_toLp _) (fun y =>
      ((((factors_coord (j 0) y).mul (factors_coord (j 1) y)).mul
        (factors_coord (j 2) y)).mul (factors_coord (j 3) y).conj).mul
          (factors_coord (j 4) y).conj)
end
end Grothe.LowerAnalytic
