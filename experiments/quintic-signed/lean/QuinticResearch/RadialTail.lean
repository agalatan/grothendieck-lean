import QuinticResearch.SignedFifth

/-! Shifted exponential moments bound the upper tail of the visible Laguerre polynomial. Agent-ID: codex-a7c4 -/

set_option warningAsError true
namespace Grothe.LowerAnalytic
open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
noncomputable section

private theorem integral_radial_exp (f : ℝ → ℝ) (hf : Measurable f) :
    (∫ z, f (Complex.normSq z) ∂gaussC) = ∫ x in Ioi 0, exp (-x) * f x := by
  rw [integral_gaussC_polar (fun z ↦ f (Complex.normSq z)) (hf.comp Complex.continuous_normSq.measurable)]
  have hsplit := setIntegral_prod_mul (μ := volume) (ν := volume)
    (fun r : ℝ ↦ 2 * r * (exp (-r ^ 2) * f (r ^ 2))) (fun _ : ℝ ↦ (2 * π)⁻¹)
    (Ioi 0) (Ioo (-π) π)
  beta_reduce at hsplit
  rw [Measure.volume_eq_prod]
  calc
    _ = ∫ p in Ioi (0 : ℝ) ×ˢ Ioo (-π) π, (2*p.1*(exp (-p.1^2)*f (p.1^2))) * (2*π)⁻¹ := by
      apply setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo)
      intro p hp
      dsimp only
      rw [Complex.normSq_eq_norm_sq, norm_polarCoord_symm_of_mem hp]
      field_simp
    _ = ∫ r in Ioi (0 : ℝ), 2*r*(exp (-r^2)*f (r^2)) := by
      rw [Measure.volume_eq_prod,hsplit,setIntegral_const]
      simp only [measureReal_def,Real.volume_Ioo,sub_neg_eq_add,ENNReal.toReal_ofReal (by positivity : 0 ≤ π+π), smul_eq_mul]
      field_simp
      ring
    _ = _ := by
      convert integral_comp_rpow_Ioi_of_pos (g := fun x : ℝ ↦ exp (-x) * f x)
        (p := (2:ℝ)) (by norm_num) using 1
      norm_num [smul_eq_mul, Real.rpow_two]

/-- The associated Laguerre polynomial of degree two and parameter one. -/
def laguerre2 (x : ℝ) := 3-3*x+x^2/2

/-- A polynomial majorant for the Laguerre excess, supported above M. -/
def radialTail (M a : ℝ) : ℝ → ℝ := (Ioi M).indicator fun x => ((x+a^2)/(2*a))*(laguerre2 x-laguerre2 M)

theorem measurable_radialTail (M a : ℝ) : Measurable (radialTail M a) :=
  (by unfold laguerre2; fun_prop : Measurable (fun x : ℝ => ((x+a^2)/(2*a))*(laguerre2 x-laguerre2 M))).indicator measurableSet_Ioi

private theorem gamma_power (n : ℕ) :
    IntegrableOn (fun x : ℝ => exp (-x)*x^n) (Ioi 0) ∧
    (∫ x : ℝ in Ioi 0, exp (-x)*x^n) = n.factorial := by
  have hs : 0 < (n:ℝ)+1 := by positivity
  have h := Real.Gamma_eq_integral hs
  have hi := Real.GammaIntegral_convergent hs
  rw [add_sub_cancel_right,Real.Gamma_nat_eq_factorial] at h
  simp only [add_sub_cancel_right, rpow_natCast,mul_comm] at hi
  simp only [rpow_natCast] at h
  exact ⟨by simpa only [mul_comm] using hi,h.symm⟩

/-- Three shifted exponential moments price the part beyond the radial cutoff. -/
theorem gaussian_radial_tail (M a : ℝ) (hM : 0 ≤ M) :
    (∫ z, radialTail M a (Complex.normSq z) ∂gaussC) =
      exp (-M)/(2*a)*((M+a^2)*(M-2)+2*M-3) := by
  rw [integral_radial_exp _ (measurable_radialTail M a)]
  let G := fun x : ℝ => exp (-x)*(((x+a^2)/(2*a))*(laguerre2 x-laguerre2 M))
  have fact : (fun x : ℝ => exp (-x)*radialTail M a x) = (Ioi M).indicator G := by
    funext x; by_cases h : M < x <;> simp [radialTail,G,h]
  rw [fact,setIntegral_indicator measurableSet_Ioi,inter_eq_right.mpr (Ioi_subset_Ioi hM)]
  have ht := (measurePreserving_add_left volume M).setIntegral_preimage_emb (measurableEmbedding_addLeft M) G (Ioi M)
  rw [← ht,show ((M+·) ⁻¹' Ioi M) = Ioi 0 by ext x; simp]
  let c1 := (M+a^2)*(M-3)
  let c2 := (M+a^2)/2+M-3
  have expand (x : ℝ) : G (M+x) = (exp (-M)/(2*a))*
      (c1*(exp (-x)*x^1)+c2*(exp (-x)*x^2)+(1/2)*(exp (-x)*x^3)) := by
    dsimp [G,c1,c2,laguerre2]
    rw [neg_add,Real.exp_add]
    ring
  simp only [expand]
  have h12 : IntegrableOn (fun x : ℝ => c1*(exp (-x)*x^1)+c2*(exp (-x)*x^2)) (Ioi 0) :=
    ((gamma_power 1).1.const_mul c1).add ((gamma_power 2).1.const_mul c2)
  rw [integral_const_mul,
    integral_add h12 ((gamma_power 3).1.const_mul (1/2)),
    integral_add ((gamma_power 1).1.const_mul c1) ((gamma_power 2).1.const_mul c2),integral_const_mul,
    integral_const_mul,integral_const_mul,(gamma_power 1).2,(gamma_power 2).2,(gamma_power 3).2]
  congr 1
  norm_num [c1,c2,Nat.factorial]
  ring

theorem radialTail_nonneg {M a x : ℝ} (hm : 6 ≤ M) (ha : 0 < a) :
    0 ≤ radialTail M a x := by
  by_cases hx : M < x
  · rw [radialTail,indicator_of_mem (show x ∈ Ioi M from hx)]
    have xpos : 0 ≤ x := by linarith
    apply mul_nonneg (by positivity : 0 ≤ (x+a^2)/(2*a))
    have id : laguerre2 x-laguerre2 M = (x-M)*(x+M-6)/2 := by unfold laguerre2; ring
    rw [id]; exact div_nonneg (mul_nonneg (by linarith) (by linarith)) (by norm_num)
  · rw [radialTail,indicator_of_notMem (show x ∉ Ioi M from hx)]

theorem laguerre_clipped {M a : ℝ} (hM : 6 ≤ M) (ha : 0 < a) (z h : ℂ) (hh : ‖h‖ ≤ 1) :
    laguerre2 (Complex.normSq z)*(‖z‖-hre h z) ≤ laguerre2 M*(‖z‖-hre h z)+2*radialTail M a (Complex.normSq z) := by
  let x := Complex.normSq z
  have hrele : |hre h z| ≤ ‖z‖ := (Complex.abs_re_le_norm _).trans (by
    rw [norm_mul,Complex.norm_conj]; exact mul_le_of_le_one_left (norm_nonneg _) hh)
  have hx : ‖z‖^2 = x := (Complex.normSq_eq_norm_sq z).symm
  have hnorm : 0 ≤ x := Complex.normSq_nonneg z
  change laguerre2 x*_ ≤ _+2*radialTail M a x
  have hfact : laguerre2 x-laguerre2 M = (x-M)*(x+M-6)/2 := by unfold laguerre2; ring
  by_cases hcut : M < x
  · rw [radialTail,indicator_of_mem (show x ∈ Ioi M from hcut)]
    have hd : 0 ≤ laguerre2 x-laguerre2 M := by rw [hfact]; apply div_nonneg (mul_nonneg (by linarith) (by linarith)) (by norm_num)
    have hrad : ‖z‖ ≤ (x+a^2)/(2*a) := by rw [le_div_iff₀ (by positivity)]; nlinarith only [sq_nonneg (‖z‖-a),hx]
    have hprice := mul_le_mul_of_nonneg_left (show ‖z‖-hre h z ≤ 2*((x+a^2)/(2*a)) by linarith [(abs_le.mp hrele).1]) hd
    nlinarith only [hprice]
  · rw [radialTail,indicator_of_notMem (show x ∉ Ioi M from hcut)]; simp only [mul_zero,add_zero]
    apply mul_le_mul_of_nonneg_right _ (by linarith [(abs_le.mp hrele).2])
    have : (x-M)*(x+M-6) ≤ 0 := mul_nonpos_of_nonpos_of_nonneg (by linarith [le_of_not_gt hcut]) (by linarith)
    linarith only [hfact,this]

end
end Grothe.LowerAnalytic
