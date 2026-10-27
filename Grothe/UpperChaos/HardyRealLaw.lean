import Grothe.UpperChaos.HardyRealDensity
import Grothe.UpperChaos.HardyRealCov
import Grothe.UpperChaos.MehlerL2

/-!
# The smoothed Mehler pair has the law of `(U, RU + SW)` (Hardy step 1(b))

Let `p, q ∈ [−1, 1]` be real correlations, `ω = ((x₁, w₁), (x₂, w₂)) ∼ mu4`, `Z, Z' ∼ mu2`, all independent, and
`X = Xof ω`, `Y = Yof p q ω = (p x₁ + σ₁ w₁, q x₂ + σ₂ w₂)`. With the smoothing `M, N` of the rounding
(`smoothArg`, `M² + N² = I`), the pair

    (MX + NZ, MY + NZ')

has the same law as `(u, Ru + Sw)`, `u, w ∼ mu2` independent, `R = M diag(p, q) M`, `S` the Cholesky factor of
`I − R²` (`law_swap`). Both laws are images of products of `gaussC` under real-linear maps; their characteristic
functions are `exp(−Q/4)` with the same quadratic form `Q` (`cov_eq`).
-/

open MeasureTheory ProbabilityTheory Complex Grothe.LowerAnalytic

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-- `ℓ(1)² + ℓ(i)²`. -/
def Q (ℓ : StrongDual ℝ ℂ) : ℝ := ℓ 1 ^ 2 + ℓ I ^ 2

lemma charFunDual_mu2 (L : StrongDual ℝ (ℂ × ℂ)) :
    charFunDual mu2 L = Complex.exp (-((Q (L.comp (.inl ℝ ℂ ℂ)) + Q (L.comp (.inr ℝ ℂ ℂ)) : ℝ) : ℂ) / 4) := by
  rw [show mu2 = gaussC.prod gaussC from rfl, charFunDual_prod, charFunDual_gaussC, charFunDual_gaussC,
    ← Complex.exp_add, Q, Q]
  congr 1; push_cast; ring

/-- Two independent standard pairs. -/
lemma charFunDual_mu2prod (L : StrongDual ℝ ((ℂ × ℂ) × (ℂ × ℂ))) :
    charFunDual (mu2.prod mu2) L = Complex.exp (-((
      Q ((L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)) +
      Q ((L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)) +
      Q ((L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)) +
      Q ((L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)) : ℝ) : ℂ) / 4) := by
  rw [charFunDual_prod (μ := mu2) (ν := mu2), charFunDual_mu2, charFunDual_mu2, ← Complex.exp_add]
  congr 1; push_cast; ring

/-- A real-linear functional on `ℂ`: `ℓ(z) = Re z · ℓ(1) + Im z · ℓ(i)`. -/
lemma dual_apply (ℓ : StrongDual ℝ ℂ) (z : ℂ) : ℓ z = z.re * ℓ 1 + z.im * ℓ I := by
  conv_lhs => rw [← Complex.re_add_im z]
  rw [map_add, show (z.re : ℂ) = z.re • (1 : ℂ) by simp,
    show (z.im : ℂ) * I = z.im • I by simp, map_smul, map_smul, smul_eq_mul, smul_eq_mul]

lemma dual_ofReal_mul (ℓ : StrongDual ℝ ℂ) (r : ℝ) (z : ℂ) : ℓ ((r : ℂ) * z) = r * ℓ z := by
  rw [show (r : ℂ) * z = r • z by simp, map_smul, smul_eq_mul]

lemma dual_ofReal (ℓ : StrongDual ℝ ℂ) (r : ℝ) : ℓ (r : ℂ) = r * ℓ 1 := by
  rw [← dual_ofReal_mul, mul_one]

/-- The four coordinate functionals of `L` on `(ℂ × ℂ) × (ℂ × ℂ)`. -/
def Lc (L : StrongDual ℝ ((ℂ × ℂ) × (ℂ × ℂ))) (j : Fin 4) : StrongDual ℝ ℂ :=
  match j with
  | 0 => (L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)
  | 1 => (L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)
  | 2 => (L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)
  | 3 => (L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)

/-- `L` in terms of its coordinate functionals. -/
lemma L_apply (L : StrongDual ℝ ((ℂ × ℂ) × (ℂ × ℂ))) (z : (ℂ × ℂ) × (ℂ × ℂ)) :
    L z = Lc L 0 z.1.1 + Lc L 1 z.1.2 + Lc L 2 z.2.1 + Lc L 3 z.2.2 := by
  have : z = ((z.1.1, 0), (0, 0)) + ((0, z.1.2), (0, 0)) + ((0, 0), (z.2.1, 0)) + ((0, 0), (0, z.2.2)) := by
    ext <;> simp
  conv_lhs => rw [this]
  simp only [map_add, Lc, ContinuousLinearMap.comp_apply, ContinuousLinearMap.inl_apply,
    ContinuousLinearMap.inr_apply]
  rfl

/-- The smoothed Mehler pair as a real-linear map of `(ω, (Z, Z'))`. -/
def mehlerPair (p q : ℝ) : ((ℂ × ℂ) × (ℂ × ℂ)) × ((ℂ × ℂ) × (ℂ × ℂ)) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => (smoothArg (Xof v.1) v.2.1, smoothArg (Yof p q v.1) v.2.2)
      map_add' := fun u v => by
        simp only [smoothArg, Xof, Yof, mY, Prod.fst_add, Prod.snd_add, Prod.mk_add_mk]
        ext <;> simp <;> ring
      map_smul' := fun r v => by
        simp only [smoothArg, Xof, Yof, mY, Prod.smul_fst, Prod.smul_snd, Prod.smul_mk, RingHom.id_apply]
        ext <;> simp <;> ring }

/-- `(u, w) ↦ (u, Ru + Sw)` as a real-linear map. -/
def pairMap (a b c : ℝ) : (ℂ × ℂ) × (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => (v.1, mulRc a b c v.1 + mulSc a b c v.2)
      map_add' := fun u v => by
        simp only [mulRc, mulSc, Prod.fst_add, Prod.snd_add, Prod.mk_add_mk]
        ext <;> simp <;> ring
      map_smul' := fun r v => by
        simp only [mulRc, mulSc, Prod.smul_fst, Prod.smul_snd, Prod.smul_mk, RingHom.id_apply]
        ext <;> simp <;> ring }

/-! ### `M² + N² = I` for the smoothing of the rounding -/

section MN

private lemma sq_sqrt_eta : √(Grothe.Upper.etaQ : ℝ) ^ 2 = Grothe.Upper.etaQ := Real.sq_sqrt (by norm_num [Grothe.Upper.etaQ])
private lemma sq_sqrt_one_sub_eta : √(1 - (Grothe.Upper.etaQ : ℝ)) ^ 2 = 1 - Grothe.Upper.etaQ := Real.sq_sqrt (by norm_num [Grothe.Upper.etaQ])
private lemma pu_mul : pu * (1 + (Grothe.Upper.bQ : ℝ) ^ 2) = 1 := by
  rw [pu]; field_simp

lemma mn_00 : m00 ^ 2 + m01 ^ 2 + n00 ^ 2 + n01 ^ 2 = 1 := by
  have h1 := sq_sqrt_eta; have h2 := sq_sqrt_one_sub_eta; have h3 := pu_mul
  simp only [m00, m01, n00, n01]
  linear_combination (1 - pu) * h1 + (1 - pu) * h2 + pu * ((1 - √(Grothe.Upper.etaQ : ℝ)) ^ 2 + √(1 - (Grothe.Upper.etaQ : ℝ)) ^ 2) * h3

lemma mn_01 : m00 * m01 + m01 * m11 + n00 * n01 + n01 * n11 = 0 := by
  have h1 := sq_sqrt_eta; have h2 := sq_sqrt_one_sub_eta; have h3 := pu_mul
  simp only [m00, m01, m11, n00, n01, n11]
  linear_combination (-(pu * Grothe.Upper.bQ)) * h1 + (-(pu * Grothe.Upper.bQ)) * h2 + pu * Grothe.Upper.bQ * ((1 - √(Grothe.Upper.etaQ : ℝ)) ^ 2 + √(1 - (Grothe.Upper.etaQ : ℝ)) ^ 2) * h3

lemma mn_11 : m01 ^ 2 + m11 ^ 2 + n01 ^ 2 + n11 ^ 2 = 1 := by
  have h1 := sq_sqrt_eta; have h2 := sq_sqrt_one_sub_eta; have h3 := pu_mul
  simp only [m01, m11, n01, n11]
  linear_combination (1 - pu * Grothe.Upper.bQ ^ 2) * h1 + (1 - pu * Grothe.Upper.bQ ^ 2) * h2
    + pu * Grothe.Upper.bQ ^ 2 * ((1 - √(Grothe.Upper.etaQ : ℝ)) ^ 2 + √(1 - (Grothe.Upper.etaQ : ℝ)) ^ 2) * h3

end MN

/-- **The law swap**: the smoothed Mehler pair has the law of `(u, Ru + Sw)`. -/
theorem law_swap {p q : ℝ} (hp : |p| ≤ 1) (hq : |q| ≤ 1) {a b c : ℝ}
    (ha : a = m00 ^ 2 * p + m01 ^ 2 * q) (hb : b = m00 * m01 * p + m01 * m11 * q)
    (hc : c = m01 ^ 2 * p + m11 ^ 2 * q) (h : 0 < k11 a b) (hd : 0 < kdet a b c) :
    (mu4.prod (mu2.prod mu2)).map (mehlerPair p q) = (mu2.prod mu2).map (pairMap a b c) := by
  have hσ₁ : √(1 - p ^ 2) ^ 2 = 1 - p ^ 2 := Real.sq_sqrt (by nlinarith [abs_le.1 hp, sq_abs p])
  have hσ₂ : √(1 - q ^ 2) ^ 2 = 1 - q ^ 2 := Real.sq_sqrt (by nlinarith [abs_le.1 hq, sq_abs q])
  have hs₁ : sig (p : ℂ) = ((√(1 - p ^ 2) : ℝ) : ℂ) := by simp [sig, Complex.norm_real, sq_abs]
  have hs₂ : sig (q : ℂ) = ((√(1 - q ^ 2) : ℝ) : ℂ) := by simp [sig, Complex.norm_real, sq_abs]
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, charFunDual_map, charFunDual_mu2prod (L.comp (pairMap a b c)),
    charFunDual_prod (μ := mu4) (ν := mu2.prod mu2), show mu4 = mu2.prod mu2 from rfl,
    charFunDual_mu2prod, charFunDual_mu2prod, ← Complex.exp_add]
  have e1 := cov_eq mn_00 mn_01 mn_11 hσ₁ hσ₂ ha hb hc h hd ![Lc L 0 1, Lc L 1 1, Lc L 2 1, Lc L 3 1]
  have e2 := cov_eq mn_00 mn_01 mn_11 hσ₁ hσ₂ ha hb hc h hd ![Lc L 0 I, Lc L 1 I, Lc L 2 I, Lc L 3 I]
  simp only [covMehler, covPair, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    Matrix.cons_val_three, Matrix.head_cons, Matrix.tail_cons] at e1 e2
  congr 1
  simp only [Q, ContinuousLinearMap.comp_apply, ContinuousLinearMap.inl_apply, ContinuousLinearMap.inr_apply,
    mehlerPair, pairMap, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk,
    smoothArg, Xof, Yof, mY, mulRc, mulSc, hs₁, hs₂]
  simp only [L_apply]
  simp only [Prod.fst_zero, Prod.snd_zero, Prod.mk_add_mk, mul_one, mul_zero, add_zero, zero_add, map_zero,
    dual_ofReal_mul, dual_ofReal]
  rw [← add_div, ← neg_add, ← Complex.ofReal_add, div_left_inj' (show (4 : ℂ) ≠ 0 by norm_num), neg_inj,
    Complex.ofReal_inj]
  linear_combination e1 + e2

end

end Grothe.UpperChaos.HardyReal
