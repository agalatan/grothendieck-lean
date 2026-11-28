import QuinticResearch.RadialClip
import QuinticResearch.RadialTail
import QuinticResearch.SignedVector
import Mathlib.Analysis.Complex.ExponentialBounds
import Grothe.LowerAnalytic.Fifth.Energy

/-! Further physical cutoffs for the signed fifth coefficient. Agent-ID: codex-a7c4 -/

set_option warningAsError true

namespace Grothe.LowerAnalytic
open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate
noncomputable section

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

/-- A uniform affine fifth-energy estimate that also holds at zero visible amplitude. -/
theorem fifth_h_tangent_eleven {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    3*π/256-(√π/2/4)*((61/2)*(√π/2-tOf (n+1) f g)+199/177000) ≤
      ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2 := by
  have hμ : 0 ≤ √π/2 := by positivity
  by_cases ht : 0 < tOf (n+1) f g
  · have h := signed_fifth_h_tangent hf hg ht (M:=11) (a:=3) (by norm_num) (by norm_num)
    have he : exp (-11) ≤ (1:ℝ)/59000 := by
      simpa using exp_cutoff 11 59000 (by norm_num) (by norm_num)
    norm_num [laguerre2] at h
    nlinarith only [h,mul_nonneg hμ (sub_nonneg.mpr he)]
  · have hz : tOf (n+1) f g = 0 :=
      le_antisymm (le_of_not_gt ht) (norm_nonneg _)
    rw [hz,sub_zero]
    nlinarith only [Real.sq_sqrt Real.pi_nonneg, Real.pi_pos, hμ,
      sq_nonneg ‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖]

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
