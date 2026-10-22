import Grothe.Haagerup.Gauss1D

/-!
# The Gaussian integral `G(u, v)`

Let `U, W` be independent complex Gaussians with independent standard real and imaginary parts
(`g2`, `g4 = g2 ⊗ g2`, `cx (a, b) = a + ib`), and `V = zU + sW`.  For `u, v ≥ 0`

  `G(u, v) = E[conj(U) V exp(−u|U|² − v|V|²)] = 2z / Δ²`,
  `Δ = (1 + 2u)(1 + 2vs²) + 2v|z|²`                                    (`integral_G`).

Integrating `W` first (`integral_inner_W`) gives `zU λ⁻² exp(−v|z|²|U|²/λ)`, `λ = 1 + 2vs²`; the
remaining integral is `E|U|² exp(−κ|U|²) = 2/(1+2κ)²`.
-/

namespace Grothe.Haag

open MeasureTheory ProbabilityTheory Real
open scoped ComplexConjugate

noncomputable section

/-- The planar standard Gaussian. -/
abbrev g2 : Measure (ℝ × ℝ) := (gaussianReal 0 1).prod (gaussianReal 0 1)

/-- Two independent planar standard Gaussians. -/
abbrev g4 : Measure ((ℝ × ℝ) × (ℝ × ℝ)) := g2.prod g2

/-- `(a, b) ↦ a + ib`. -/
def cx (p : ℝ × ℝ) : ℂ := ⟨p.1, p.2⟩

@[simp] lemma cx_re (p : ℝ × ℝ) : (cx p).re = p.1 := rfl
@[simp] lemma cx_im (p : ℝ × ℝ) : (cx p).im = p.2 := rfl

@[fun_prop] lemma continuous_cx : Continuous cx :=
  Complex.equivRealProdCLM.symm.continuous

lemma norm_cx_sq (p : ℝ × ℝ) : ‖cx p‖ ^ 2 = p.1 ^ 2 + p.2 ^ 2 := by
  rw [Complex.sq_norm, Complex.normSq_apply, cx_re, cx_im]; ring

/-- `Δ = (1 + 2u)(1 + 2vs²) + 2v|z|²`. -/
def Delta (u v : ℝ) (z : ℂ) (s : ℝ) : ℝ := (1 + 2 * u) * (1 + 2 * v * s ^ 2) + 2 * v * ‖z‖ ^ 2

lemma Delta_pos {u v : ℝ} (hu : 0 ≤ u) (hv : 0 ≤ v) (z : ℂ) (s : ℝ) : 0 < Delta u v z s := by
  unfold Delta; positivity

/-! ### Integrability helpers -/

lemma exp_neg_mul_le_one {v x : ℝ} (hv : 0 ≤ v) (hx : 0 ≤ x) : exp (-(v * x)) ≤ 1 :=
  Real.exp_le_one_iff.2 (neg_nonpos.2 (mul_nonneg hv hx))

lemma integrable_exp_tilt {v : ℝ} (hv : 0 ≤ v) (c s : ℝ) :
    Integrable (fun t : ℝ => exp (-(v * (c + s * t) ^ 2))) (gaussianReal 0 1) :=
  (integrable_const (1 : ℝ)).mono' (by fun_prop) (Filter.Eventually.of_forall fun t => by
    rw [Real.norm_eq_abs, abs_of_pos (exp_pos _)]
    exact exp_neg_mul_le_one hv (sq_nonneg _))

lemma integrable_affine_mul_exp {v : ℝ} (hv : 0 ≤ v) (a b c s : ℝ) :
    Integrable (fun t : ℝ => (a + b * t) * exp (-(v * (c + s * t) ^ 2))) (gaussianReal 0 1) := by
  have hg : Integrable (fun t : ℝ => a + b * t) (gaussianReal 0 1) :=
    (integrable_const a).add (((memLp_id_gaussianReal 1).integrable le_rfl).const_mul b)
  refine (hg.bdd_mul (f := fun t : ℝ => exp (-(v * (c + s * t) ^ 2))) (c := 1)
    (by fun_prop) (Filter.Eventually.of_forall fun t => ?_)).congr
    (Filter.Eventually.of_forall fun t => mul_comm _ _)
  rw [Real.norm_eq_abs, abs_of_pos (exp_pos _)]
  exact exp_neg_mul_le_one hv (sq_nonneg _)

lemma integrable_sq_gaussianReal : Integrable (fun t : ℝ => t ^ 2) (gaussianReal 0 1) :=
  (memLp_id_gaussianReal 2).integrable_sq

lemma integrable_normSq_g2 : Integrable (fun q : ℝ × ℝ => ‖cx q‖ ^ 2) g2 := by
  simp only [norm_cx_sq]
  exact (integrable_sq_gaussianReal.comp_fst _).add (integrable_sq_gaussianReal.comp_snd _)

/-! ### The inner integral over `W` -/

lemma cx_affine (c : ℂ) (s : ℝ) (q : ℝ × ℝ) :
    c + (s : ℂ) * cx q = ((c.re + s * q.1 : ℝ) : ℂ) + ((c.im + s * q.2 : ℝ) : ℂ) * Complex.I := by
  apply Complex.ext <;> simp

lemma norm_affine_sq (c : ℂ) (s : ℝ) (q : ℝ × ℝ) :
    ‖c + (s : ℂ) * cx q‖ ^ 2 = (c.re + s * q.1) ^ 2 + (c.im + s * q.2) ^ 2 := by
  rw [Complex.sq_norm, Complex.normSq_apply]
  simp; ring

lemma tiltConst_mul (v : ℝ) (hv : 0 ≤ v) (a b s : ℝ) :
    tiltConst v a s * tiltConst v b s = (lam v s)⁻¹ * rexp (-(v * (a ^ 2 + b ^ 2)) / lam v s) := by
  have hl := lam_pos hv s
  unfold tiltConst
  rw [show (√(lam v s))⁻¹ * rexp (-(v * a ^ 2) / lam v s) * ((√(lam v s))⁻¹ *
      rexp (-(v * b ^ 2) / lam v s)) = ((√(lam v s))⁻¹ * (√(lam v s))⁻¹) *
      (rexp (-(v * a ^ 2) / lam v s) * rexp (-(v * b ^ 2) / lam v s)) by ring, ← Real.exp_add,
    ← mul_inv, Real.mul_self_sqrt hl.le]
  congr 2
  ring

/-- **The `W` integral**: `E_W[(c + sW) exp(−v|c + sW|²)] = c λ⁻² exp(−v|c|²/λ)`. -/
theorem integral_inner_W {v : ℝ} (hv : 0 ≤ v) (c : ℂ) (s : ℝ) :
    ∫ q, (c + (s : ℂ) * cx q) * ((rexp (-(v * ‖c + (s : ℂ) * cx q‖ ^ 2)) : ℝ) : ℂ) ∂g2
      = c * (((lam v s)⁻¹ ^ 2 * rexp (-(v * ‖c‖ ^ 2) / lam v s) : ℝ) : ℂ) := by
  have hpt : ∀ q : ℝ × ℝ, (c + (s : ℂ) * cx q) * ((rexp (-(v * ‖c + (s : ℂ) * cx q‖ ^ 2)) : ℝ) : ℂ)
      = (((c.re + s * q.1) * rexp (-(v * (c.re + s * q.1) ^ 2))
          * rexp (-(v * (c.im + s * q.2) ^ 2)) : ℝ) : ℂ)
        + (((rexp (-(v * (c.re + s * q.1) ^ 2))) * ((c.im + s * q.2)
          * rexp (-(v * (c.im + s * q.2) ^ 2))) : ℝ) : ℂ) * Complex.I := by
    intro q
    rw [norm_affine_sq, cx_affine, show -(v * ((c.re + s * q.1) ^ 2 + (c.im + s * q.2) ^ 2))
      = -(v * (c.re + s * q.1) ^ 2) + -(v * (c.im + s * q.2) ^ 2) by ring, Real.exp_add]
    push_cast
    ring
  have i1 : Integrable (fun q : ℝ × ℝ => ((c.re + s * q.1) * rexp (-(v * (c.re + s * q.1) ^ 2)))
      * rexp (-(v * (c.im + s * q.2) ^ 2))) g2 :=
    (integrable_affine_mul_exp hv c.re s c.re s).mul_prod (integrable_exp_tilt hv c.im s)
  have i2 : Integrable (fun q : ℝ × ℝ => rexp (-(v * (c.re + s * q.1) ^ 2))
      * ((c.im + s * q.2) * rexp (-(v * (c.im + s * q.2) ^ 2)))) g2 :=
    (integrable_exp_tilt hv c.re s).mul_prod (integrable_affine_mul_exp hv c.im s c.im s)
  simp_rw [hpt]
  rw [integral_add (i1.ofReal) ((i2.ofReal).mul_const _), integral_mul_const,
    integral_complex_ofReal, integral_complex_ofReal,
    integral_prod_mul (fun t => (c.re + s * t) * rexp (-(v * (c.re + s * t) ^ 2)))
      (fun t => rexp (-(v * (c.im + s * t) ^ 2))),
    integral_prod_mul (fun t => rexp (-(v * (c.re + s * t) ^ 2)))
      (fun t => (c.im + s * t) * rexp (-(v * (c.im + s * t) ^ 2))),
    integral_tilt1 hv, integral_tilt0 hv, integral_tilt0 hv, integral_tilt1 hv]
  have hprod := tiltConst_mul v hv c.re c.im s
  have hn : ‖c‖ ^ 2 = c.re ^ 2 + c.im ^ 2 := by rw [Complex.sq_norm, Complex.normSq_apply]; ring
  rw [hn]
  calc ((c.re / lam v s * tiltConst v c.re s * tiltConst v c.im s : ℝ) : ℂ)
        + ((tiltConst v c.re s * (c.im / lam v s * tiltConst v c.im s) : ℝ) : ℂ) * Complex.I
      = ((c.re / lam v s * (tiltConst v c.re s * tiltConst v c.im s) : ℝ) : ℂ)
        + ((c.im / lam v s * (tiltConst v c.re s * tiltConst v c.im s) : ℝ) : ℂ) * Complex.I := by
        push_cast; ring
    _ = _ := by
        rw [hprod]
        generalize rexp (-(v * (c.re ^ 2 + c.im ^ 2)) / lam v s) = E
        conv_rhs => rw [← Complex.re_add_im c]
        push_cast
        ring

/-! ### The outer integral -/

lemma integrable_sq_mul_exp {κ : ℝ} (hκ : 0 ≤ κ) :
    Integrable (fun t : ℝ => t ^ 2 * rexp (-(κ * t ^ 2))) (gaussianReal 0 1) :=
  (integrable_sq_gaussianReal.bdd_mul (f := fun t : ℝ => rexp (-(κ * t ^ 2))) (c := 1)
    (by fun_prop) (Filter.Eventually.of_forall fun t => by
      rw [Real.norm_eq_abs, abs_of_pos (exp_pos _)]
      exact exp_neg_mul_le_one hκ (sq_nonneg _))).congr
    (Filter.Eventually.of_forall fun t => mul_comm _ _)

lemma integrable_exp_sq {κ : ℝ} (hκ : 0 ≤ κ) :
    Integrable (fun t : ℝ => rexp (-(κ * t ^ 2))) (gaussianReal 0 1) := by
  simpa using integrable_exp_tilt hκ 0 1

lemma integral_exp_sq {κ : ℝ} (hκ : 0 ≤ κ) :
    ∫ t, rexp (-(κ * t ^ 2)) ∂gaussianReal 0 1 = (√(1 + 2 * κ))⁻¹ := by
  have := integral_tilt0 hκ 0 1
  simp only [zero_add, one_mul] at this
  rw [this]
  simp [tiltConst, lam]

/-- `E|U|² exp(−κ|U|²) = 2/(1+2κ)²`. -/
lemma integral_normSq_exp {κ : ℝ} (hκ : 0 ≤ κ) :
    ∫ q, ‖cx q‖ ^ 2 * rexp (-(κ * ‖cx q‖ ^ 2)) ∂g2 = 2 / (1 + 2 * κ) ^ 2 := by
  have hpt : ∀ q : ℝ × ℝ, ‖cx q‖ ^ 2 * rexp (-(κ * ‖cx q‖ ^ 2))
      = q.1 ^ 2 * rexp (-(κ * q.1 ^ 2)) * rexp (-(κ * q.2 ^ 2))
        + rexp (-(κ * q.1 ^ 2)) * (q.2 ^ 2 * rexp (-(κ * q.2 ^ 2))) := by
    intro q
    rw [norm_cx_sq, show -(κ * (q.1 ^ 2 + q.2 ^ 2)) = -(κ * q.1 ^ 2) + -(κ * q.2 ^ 2) by ring,
      Real.exp_add]
    ring
  simp_rw [hpt]
  rw [integral_add ((integrable_sq_mul_exp hκ).mul_prod (integrable_exp_sq hκ))
      ((integrable_exp_sq hκ).mul_prod (integrable_sq_mul_exp hκ)),
    integral_prod_mul (fun t => t ^ 2 * rexp (-(κ * t ^ 2))) (fun t => rexp (-(κ * t ^ 2))),
    integral_prod_mul (fun t => rexp (-(κ * t ^ 2))) (fun t => t ^ 2 * rexp (-(κ * t ^ 2))),
    integral_exp_sq hκ]
  have h2 : ∫ t, t ^ 2 * rexp (-(κ * t ^ 2)) ∂gaussianReal 0 1 = (√(1 + 2 * κ))⁻¹ / (1 + 2 * κ) :=
    integral_tilt2 hκ
  rw [h2]
  have hp : (0 : ℝ) < 1 + 2 * κ := by positivity
  have hs := Real.mul_self_sqrt hp.le
  field_simp
  nlinarith [hs]

lemma integrable_G_integrand {u v : ℝ} (hu : 0 ≤ u) (hv : 0 ≤ v) (z : ℂ) (s : ℝ) :
    Integrable (fun p : (ℝ × ℝ) × (ℝ × ℝ) => conj (cx p.1) * (z * cx p.1 + (s : ℂ) * cx p.2)
      * ((rexp (-(u * ‖cx p.1‖ ^ 2)) * rexp (-(v * ‖z * cx p.1 + (s : ℂ) * cx p.2‖ ^ 2)) : ℝ) : ℂ))
      g4 := by
  have hb : Integrable (fun p : (ℝ × ℝ) × (ℝ × ℝ) =>
      (‖z‖ + |s|) * (‖cx p.1‖ ^ 2 + ‖cx p.2‖ ^ 2)) g4 :=
    ((integrable_normSq_g2.comp_fst g2).add (integrable_normSq_g2.comp_snd g2)).const_mul _
  refine hb.mono' (by fun_prop) (Filter.Eventually.of_forall fun p => ?_)
  rw [norm_mul, norm_mul, Complex.norm_conj, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (by positivity)]
  have e1 : rexp (-(u * ‖cx p.1‖ ^ 2)) * rexp (-(v * ‖z * cx p.1 + (s : ℂ) * cx p.2‖ ^ 2)) ≤ 1 :=
    (mul_le_mul (exp_neg_mul_le_one hu (sq_nonneg _)) (exp_neg_mul_le_one hv (sq_nonneg _))
      (exp_pos _).le zero_le_one).trans (one_mul 1).le
  have e2 : ‖z * cx p.1 + (s : ℂ) * cx p.2‖ ≤ ‖z‖ * ‖cx p.1‖ + |s| * ‖cx p.2‖ := by
    refine (norm_add_le _ _).trans ?_
    rw [norm_mul, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  have a0 := norm_nonneg (cx p.1)
  have b0 := norm_nonneg (cx p.2)
  have z0 := norm_nonneg z
  have s0 := abs_nonneg s
  have hV0 := norm_nonneg (z * cx p.1 + (s : ℂ) * cx p.2)
  calc ‖cx p.1‖ * ‖z * cx p.1 + (s : ℂ) * cx p.2‖ * (rexp (-(u * ‖cx p.1‖ ^ 2))
        * rexp (-(v * ‖z * cx p.1 + (s : ℂ) * cx p.2‖ ^ 2)))
      ≤ ‖cx p.1‖ * (‖z‖ * ‖cx p.1‖ + |s| * ‖cx p.2‖) * 1 := by
        apply mul_le_mul (mul_le_mul_of_nonneg_left e2 a0) e1 (by positivity) (by positivity)
    _ ≤ (‖z‖ + |s|) * (‖cx p.1‖ ^ 2 + ‖cx p.2‖ ^ 2) := by
        nlinarith [mul_nonneg z0 (sq_nonneg ‖cx p.2‖), mul_nonneg s0 (sq_nonneg (‖cx p.1‖ - ‖cx p.2‖)),
          mul_nonneg s0 (sq_nonneg ‖cx p.1‖), mul_nonneg s0 (sq_nonneg ‖cx p.2‖)]

/-- **`G(u, v) = 2z/Δ²`.** -/
theorem integral_G {u v : ℝ} (hu : 0 ≤ u) (hv : 0 ≤ v) (z : ℂ) (s : ℝ) :
    ∫ p, conj (cx p.1) * (z * cx p.1 + (s : ℂ) * cx p.2)
      * ((rexp (-(u * ‖cx p.1‖ ^ 2)) * rexp (-(v * ‖z * cx p.1 + (s : ℂ) * cx p.2‖ ^ 2)) : ℝ) : ℂ)
      ∂g4 = 2 * z / ((Delta u v z s : ℝ) : ℂ) ^ 2 := by
  rw [integral_prod _ (integrable_G_integrand hu hv z s)]
  have hl := lam_pos hv s
  set κ := u + v * ‖z‖ ^ 2 / lam v s with hκ
  have hκ0 : 0 ≤ κ := by positivity
  have inner : ∀ a : ℝ × ℝ, ∫ q, conj (cx a) * (z * cx a + (s : ℂ) * cx q)
      * ((rexp (-(u * ‖cx a‖ ^ 2)) * rexp (-(v * ‖z * cx a + (s : ℂ) * cx q‖ ^ 2)) : ℝ) : ℂ) ∂g2
      = z * (((lam v s)⁻¹ ^ 2 * (‖cx a‖ ^ 2 * rexp (-(κ * ‖cx a‖ ^ 2))) : ℝ) : ℂ) := by
    intro a
    have e : ∀ q : ℝ × ℝ, conj (cx a) * (z * cx a + (s : ℂ) * cx q)
        * ((rexp (-(u * ‖cx a‖ ^ 2)) * rexp (-(v * ‖z * cx a + (s : ℂ) * cx q‖ ^ 2)) : ℝ) : ℂ)
        = (conj (cx a) * ((rexp (-(u * ‖cx a‖ ^ 2)) : ℝ) : ℂ)) * ((z * cx a + (s : ℂ) * cx q)
          * ((rexp (-(v * ‖z * cx a + (s : ℂ) * cx q‖ ^ 2)) : ℝ) : ℂ)) := fun q => by
      push_cast; ring
    simp_rw [e]
    rw [integral_const_mul, integral_inner_W hv]
    have hc : conj (cx a) * cx a = ((‖cx a‖ ^ 2 : ℝ) : ℂ) := by
      rw [Complex.conj_mul']; push_cast; ring
    have hexp : rexp (-(u * ‖cx a‖ ^ 2)) * rexp (-(v * ‖z * cx a‖ ^ 2) / lam v s)
        = rexp (-(κ * ‖cx a‖ ^ 2)) := by
      rw [← Real.exp_add, norm_mul, mul_pow, hκ]
      congr 1
      field_simp
      ring
    rw [← hexp]
    have e2 : conj (cx a) * ((rexp (-(u * ‖cx a‖ ^ 2)) : ℝ) : ℂ) * (z * cx a
        * (((lam v s)⁻¹ ^ 2 * rexp (-(v * ‖z * cx a‖ ^ 2) / lam v s) : ℝ) : ℂ))
        = z * (conj (cx a) * cx a) * (((lam v s)⁻¹ ^ 2 * (rexp (-(u * ‖cx a‖ ^ 2))
          * rexp (-(v * ‖z * cx a‖ ^ 2) / lam v s)) : ℝ) : ℂ) := by push_cast; ring
    rw [e2, hc]
    push_cast
    ring
  dsimp only
  simp_rw [inner]
  rw [integral_const_mul, integral_complex_ofReal, integral_const_mul, integral_normSq_exp hκ0]
  have hD : Delta u v z s = lam v s * (1 + 2 * κ) := by
    rw [hκ]; unfold Delta lam at *; field_simp; ring
  rw [hD]
  have h1 : (0 : ℝ) < 1 + 2 * κ := by positivity
  push_cast
  field_simp

end

end Grothe.Haag
