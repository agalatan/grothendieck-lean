import Grothe.UpperChaos.HardyKernel
import Grothe.UpperChaos.HolIntegral
import Grothe.UpperChaos.OddSeries
import Grothe.UpperChaos.OddParseval

/-!
# Holomorphy of the continued rounding kernel (step 1(a) of the `hardy` plan)

`Hhol R` (`HardyKernel.lean`) integrates the bounded rounding `Tround` against the holomorphic Gaussian
kernel `k_R`. Its exponent is a linear combination of six real quadratic monomials with coefficients
the entries of `A = (I − R²)⁻¹` and `C = R A` (`kExp_add_eq_sum`). Under the decay condition
`KerPos R λ` (the real part of the 4×4 form `[[A, −C], [−C, A]]` is `≥ λ` on real vectors),
the integrand is dominated by a Gaussian, and on any open set of `t` where `KerPos (Rt t) λ` holds
for some `λ > 0`, `t ↦ Hhol (Rt t)` is holomorphic (`differentiableOn_Hhol_Rt`).

`KerPos R λ` with `λ > 0` forces `det(I − R²) ≠ 0` (`detIm_ne_zero_of_kerPos`). For a complex
symmetric `Σ = [[I, R], [R, I]]` it follows from `Re Σ ≻ 0`, i.e. `I ± Re R ≻ 0`, which is what the
external certificate checks along its arcs.
-/

open MeasureTheory Complex
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- Decay of the holomorphic kernel: the real part of `xᵀAx + yᵀAy − 2xᵀCy` dominates `λ|(x, y)|²`. -/
def KerPos (R : Sym2C) (l : ℝ) : Prop :=
  ∀ x y : ℝ × ℝ, l * (x.1 ^ 2 + x.2 ^ 2 + y.1 ^ 2 + y.2 ^ 2) ≤
    (R.Amat.form x x + R.Amat.form y y - 2 * R.Cmat.form x y).re

lemma detIm_ne_zero_of_kerPos {R : Sym2C} {l : ℝ} (hl : 0 < l) (h : KerPos R l) :
    R.detIm ≠ 0 := by
  intro h0
  have := h (1, 0) (0, 0)
  simp [Sym2C.Amat, Sym2C.Cmat, Sym2C.form, h0] at this
  linarith

/-- The six coefficients of the exponent: the entries of `A` and of `C`. -/
def coefK (R : Sym2C) : Fin 6 → ℂ :=
  ![R.Amat.a, R.Amat.b, R.Amat.c, R.Cmat.a, R.Cmat.b, R.Cmat.c]

/-- The six real quadratic monomials of one real copy `(x, y)`. -/
def monoK (x y : ℝ × ℝ) : Fin 6 → ℝ :=
  ![-(x.1 ^ 2 + y.1 ^ 2) / 2, -(x.1 * x.2 + y.1 * y.2), -(x.2 ^ 2 + y.2 ^ 2) / 2,
    x.1 * y.1, x.1 * y.2 + x.2 * y.1, x.2 * y.2]

/-- The points of `ℝ⁸`: `q.1 = (x, ξ)` (first point `z = x + iξ`), `q.2 = (y, η)`. -/
abbrev Pt8 := ((ℝ × ℝ) × (ℝ × ℝ)) × ((ℝ × ℝ) × (ℝ × ℝ))

/-- The weights of both real copies. -/
def mK (k : Fin 6) (q : Pt8) : ℝ := monoK q.1.1 q.2.1 k + monoK q.1.2 q.2.2 k

/-- The squared norm on `ℝ⁸`. -/
def N8 (q : Pt8) : ℝ :=
  q.1.1.1 ^ 2 + q.1.1.2 ^ 2 + q.1.2.1 ^ 2 + q.1.2.2 ^ 2 +
    q.2.1.1 ^ 2 + q.2.1.2 ^ 2 + q.2.2.1 ^ 2 + q.2.2.2 ^ 2

lemma kExp_eq_sum (R : Sym2C) (x y : ℝ × ℝ) :
    kExp R x y = ∑ k, coefK R k * (monoK x y k : ℂ) := by
  simp only [Fin.sum_univ_six]
  simp [kExp, Sym2C.form, coefK, monoK]
  ring

lemma kExp_add_eq_sum (R : Sym2C) (q : Pt8) :
    kExp R q.1.1 q.2.1 + kExp R q.1.2 q.2.2 = ∑ k, coefK R k * (mK k q : ℂ) := by
  rw [kExp_eq_sum, kExp_eq_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun k _ => ?_
  simp only [mK]; push_cast; ring

lemma abs_monoK_le (x y : ℝ × ℝ) (k : Fin 6) :
    |monoK x y k| ≤ x.1 ^ 2 + x.2 ^ 2 + y.1 ^ 2 + y.2 ^ 2 := by
  obtain ⟨a, b⟩ := x
  obtain ⟨c, d⟩ := y
  fin_cases k <;> simp only [monoK, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    rw [abs_le] <;> constructor <;>
    nlinarith [sq_nonneg (a - c), sq_nonneg (a + c), sq_nonneg (a - d), sq_nonneg (a + d),
      sq_nonneg (b - c), sq_nonneg (b + c), sq_nonneg (b - d), sq_nonneg (b + d),
      sq_nonneg (a - b), sq_nonneg (a + b), sq_nonneg (c - d), sq_nonneg (c + d),
      sq_nonneg a, sq_nonneg b, sq_nonneg c, sq_nonneg d]

lemma abs_mK_le (k : Fin 6) (q : Pt8) : |mK k q| ≤ N8 q := by
  have h1 := abs_monoK_le q.1.1 q.2.1 k
  have h2 := abs_monoK_le q.1.2 q.2.2 k
  have := abs_add_le (monoK q.1.1 q.2.1 k) (monoK q.1.2 q.2.2 k)
  simp only [mK, N8]; linarith

lemma continuous_mK (k : Fin 6) : Continuous (mK k) := by
  unfold mK monoK
  fin_cases k <;> simp <;> fun_prop

lemma N8_nonneg (q : Pt8) : 0 ≤ N8 q := by unfold N8; positivity

lemma re_kExp_le {R : Sym2C} {l : ℝ} (h : KerPos R l) (x y : ℝ × ℝ) :
    (kExp R x y).re ≤ -(l / 2 * (x.1 ^ 2 + x.2 ^ 2 + y.1 ^ 2 + y.2 ^ 2)) := by
  have := h x y
  have hre : (kExp R x y).re = -((R.Amat.form x x + R.Amat.form y y - 2 * R.Cmat.form x y).re) / 2 := by
    simp only [kExp, Complex.sub_re, Complex.neg_re, Complex.div_re, Complex.add_re,
      Complex.mul_re]
    norm_num; ring
  rw [hre]; linarith

lemma re_sum_le {R : Sym2C} {l : ℝ} (h : KerPos R l) (q : Pt8) :
    (∑ k, coefK R k * (mK k q : ℂ)).re ≤ -(l / 2 * N8 q) := by
  rw [← kExp_add_eq_sum, Complex.add_re]
  have h1 := re_kExp_le h q.1.1 q.2.1
  have h2 := re_kExp_le h q.1.2 q.2.2
  simp only [N8]; linarith

/-! ### The coefficients are holomorphic where `det(I − R²) ≠ 0` -/

lemma differentiable_odd (P : Polynomial ℝ) :
    Differentiable ℂ fun t : ℂ => t * Polynomial.aeval (t ^ 2) P := by
  have : (fun t : ℂ => Polynomial.aeval (t ^ 2) P) =
      fun t : ℂ => (P.map (algebraMap ℝ ℂ)).eval (t ^ 2) := by
    funext t; rw [Polynomial.aeval_def, Polynomial.eval₂_eq_eval_map]
  have h2 : Differentiable ℂ fun t : ℂ => Polynomial.aeval (t ^ 2) P := by
    have hsq : Differentiable ℂ fun t : ℂ => t ^ 2 := by fun_prop
    rw [this]; exact (Polynomial.differentiable _).comp hsq
  exact differentiable_id.mul h2

lemma differentiable_Rt_a : Differentiable ℂ fun t => (Rt t).a := by
  have e : (fun t => (Rt t).a) = fun t =>
      (m00 : ℂ) ^ 2 * (t * Polynomial.aeval (t ^ 2) Grothe.Upper.primaryPoly) +
        (m01 : ℂ) ^ 2 * (t * Polynomial.aeval (t ^ 2) Grothe.Upper.auxPoly) := rfl
  rw [e]
  exact ((differentiable_const _).mul (differentiable_odd _)).add
    ((differentiable_const _).mul (differentiable_odd _))

lemma differentiable_Rt_b : Differentiable ℂ fun t => (Rt t).b := by
  have e : (fun t => (Rt t).b) = fun t =>
      (m00 : ℂ) * m01 * (t * Polynomial.aeval (t ^ 2) Grothe.Upper.primaryPoly) +
        (m01 : ℂ) * m11 * (t * Polynomial.aeval (t ^ 2) Grothe.Upper.auxPoly) := rfl
  rw [e]
  exact ((differentiable_const _).mul (differentiable_odd _)).add
    ((differentiable_const _).mul (differentiable_odd _))

lemma differentiable_Rt_c : Differentiable ℂ fun t => (Rt t).c := by
  have e : (fun t => (Rt t).c) = fun t =>
      (m01 : ℂ) ^ 2 * (t * Polynomial.aeval (t ^ 2) Grothe.Upper.primaryPoly) +
        (m11 : ℂ) ^ 2 * (t * Polynomial.aeval (t ^ 2) Grothe.Upper.auxPoly) := rfl
  rw [e]
  exact ((differentiable_const _).mul (differentiable_odd _)).add
    ((differentiable_const _).mul (differentiable_odd _))

/-- Entries of `A`, `C` and `det(I − R²)` are holomorphic for any holomorphic family `R`. -/
lemma differentiableAt_detIm {R : ℂ → Sym2C} {t : ℂ}
    (ha : DifferentiableAt ℂ (fun s => (R s).a) t) (hb : DifferentiableAt ℂ (fun s => (R s).b) t)
    (hc : DifferentiableAt ℂ (fun s => (R s).c) t) :
    DifferentiableAt ℂ (fun s => (R s).detIm) t := by
  simp only [Sym2C.detIm, Sym2C.sq]; fun_prop

lemma differentiableAt_coefK {R : ℂ → Sym2C} {t : ℂ}
    (ha : DifferentiableAt ℂ (fun s => (R s).a) t) (hb : DifferentiableAt ℂ (fun s => (R s).b) t)
    (hc : DifferentiableAt ℂ (fun s => (R s).c) t) (hne : (R t).detIm ≠ 0) (k : Fin 6) :
    DifferentiableAt ℂ (fun s => coefK (R s) k) t := by
  have hd := differentiableAt_detIm ha hb hc
  have hi : DifferentiableAt ℂ (fun s => ((R s).detIm)⁻¹) t := hd.inv hne
  have hAa : DifferentiableAt ℂ (fun s => (R s).Amat.a) t := by
    have e : (fun s => (R s).Amat.a) = fun s =>
        (1 - ((R s).b * (R s).b + (R s).c * (R s).c)) * ((R s).detIm)⁻¹ := by
      funext s; simp [Sym2C.Amat, Sym2C.sq, div_eq_mul_inv]
    rw [e]; fun_prop
  have hAb : DifferentiableAt ℂ (fun s => (R s).Amat.b) t := by
    have e : (fun s => (R s).Amat.b) = fun s =>
        ((R s).a * (R s).b + (R s).b * (R s).c) * ((R s).detIm)⁻¹ := by
      funext s; simp [Sym2C.Amat, Sym2C.sq, div_eq_mul_inv]
    rw [e]; fun_prop
  have hAc : DifferentiableAt ℂ (fun s => (R s).Amat.c) t := by
    have e : (fun s => (R s).Amat.c) = fun s =>
        (1 - ((R s).a * (R s).a + (R s).b * (R s).b)) * ((R s).detIm)⁻¹ := by
      funext s; simp [Sym2C.Amat, Sym2C.sq, div_eq_mul_inv]
    rw [e]; fun_prop
  fin_cases k
  · exact hAa
  · exact hAb
  · exact hAc
  · show DifferentiableAt ℂ (fun s => (R s).a * (R s).Amat.a + (R s).b * (R s).Amat.b) t
    fun_prop
  · show DifferentiableAt ℂ (fun s => (R s).a * (R s).Amat.b + (R s).b * (R s).Amat.c) t
    fun_prop
  · show DifferentiableAt ℂ (fun s => (R s).b * (R s).Amat.b + (R s).c * (R s).Amat.c) t
    fun_prop

lemma differentiable_detIm_Rt : Differentiable ℂ fun t => (Rt t).detIm := fun t =>
  differentiableAt_detIm (differentiable_Rt_a t) (differentiable_Rt_b t) (differentiable_Rt_c t)

lemma differentiableOn_coefK {U : Set ℂ} (hU : ∀ t ∈ U, (Rt t).detIm ≠ 0) (k : Fin 6) :
    DifferentiableOn ℂ (fun t => coefK (Rt t) k) U := fun t ht =>
  (differentiableAt_coefK (differentiable_Rt_a t) (differentiable_Rt_b t) (differentiable_Rt_c t)
    (hU t ht) k).differentiableWithinAt

/-! ### Gaussian integrability on `ℝ⁸` -/

lemma integrable_exp_neg_N8 {l : ℝ} (hl : 0 < l) :
    Integrable (fun q : Pt8 => Real.exp (-(l * N8 q))) := by
  have g1 : Integrable (fun x : ℝ => Real.exp (-l * x ^ 2)) := integrable_exp_neg_mul_sq hl
  have g2 : Integrable (fun v : ℝ × ℝ => Real.exp (-l * v.1 ^ 2) * Real.exp (-l * v.2 ^ 2)) :=
    g1.mul_prod g1
  have g4 : Integrable (fun p : (ℝ × ℝ) × (ℝ × ℝ) =>
      (Real.exp (-l * p.1.1 ^ 2) * Real.exp (-l * p.1.2 ^ 2)) *
        (Real.exp (-l * p.2.1 ^ 2) * Real.exp (-l * p.2.2 ^ 2))) := g2.mul_prod g2
  have g8 := g4.mul_prod g4
  refine g8.congr (Filter.Eventually.of_forall fun q => ?_)
  simp only [N8]
  rw [← Real.exp_add, ← Real.exp_add, ← Real.exp_add, ← Real.exp_add, ← Real.exp_add,
    ← Real.exp_add, ← Real.exp_add]
  congr 1; ring

lemma integrable_N8_mul_exp {l : ℝ} (hl : 0 < l) :
    Integrable (fun q : Pt8 => N8 q * Real.exp (-(l * N8 q))) := by
  refine Integrable.mono' ((integrable_exp_neg_N8 (half_pos hl)).const_mul (2 / l)) ?_
    (Filter.Eventually.of_forall fun q => ?_)
  · exact ((by unfold N8; fun_prop : Continuous fun q : Pt8 => N8 q * Real.exp (-(l * N8 q)))
      ).aestronglyMeasurable
  · have hN := N8_nonneg q
    rw [Real.norm_eq_abs, abs_of_nonneg (by positivity)]
    -- `N e^{-lN} = N e^{-lN/2} e^{-lN/2} ≤ (2/l) e^{-lN/2}` since `u e^{-u} ≤ 1`
    have hu : l / 2 * N8 q * Real.exp (-(l / 2 * N8 q)) ≤ 1 := by
      have := Real.add_one_le_exp (l / 2 * N8 q)
      have he : 0 < Real.exp (l / 2 * N8 q) := Real.exp_pos _
      rw [Real.exp_neg, mul_inv_le_iff₀ he]; linarith
    have hsplit : Real.exp (-(l * N8 q)) = Real.exp (-(l / 2 * N8 q)) * Real.exp (-(l / 2 * N8 q)) := by
      rw [← Real.exp_add]; congr 1; ring
    rw [hsplit]
    have he2 : 0 < Real.exp (-(l / 2 * N8 q)) := Real.exp_pos _
    calc N8 q * (Real.exp (-(l / 2 * N8 q)) * Real.exp (-(l / 2 * N8 q)))
        = (2 / l) * (l / 2 * N8 q * Real.exp (-(l / 2 * N8 q))) * Real.exp (-(l / 2 * N8 q)) := by
          field_simp
      _ ≤ (2 / l) * 1 * Real.exp (-(l / 2 * N8 q)) := by gcongr
      _ = 2 / l * Real.exp (-(l / 2 * N8 q)) := by ring

/-! ### Holomorphy of `t ↦ Hhol (Rt t)` -/

lemma measurable_toC2 : Measurable fun p : (ℝ × ℝ) × (ℝ × ℝ) => toC2 p.1 p.2 := by
  unfold toC2; fun_prop

lemma Hhol_eq (R : Sym2C) :
    Hhol R = ∫ q : Pt8, (conj (Tround (toC2 q.1.1 q.1.2)) * Tround (toC2 q.2.1 q.2.2)) *
      (((((2 * Real.pi) ^ 4 : ℝ) : ℂ)⁻¹ * R.detIm⁻¹) *
        Complex.exp (∑ k, coefK R k * (mK k q : ℂ))) := by
  unfold Hhol
  refine integral_congr_ae (Filter.Eventually.of_forall fun q => ?_)
  simp only [kHol, ← kExp_add_eq_sum]

/-- **Step 1(a): holomorphy.** On an open set of `t` where the continued kernel decays
(`KerPos (Rt t) λ` for some `λ > 0`), `t ↦ Hhol (Rt t)` is holomorphic. -/
theorem differentiableOn_Hhol_Rt (hφ : PhiBound) {U : Set ℂ} (hU : IsOpen U)
    (hpos : ∀ t ∈ U, ∃ l > 0, KerPos (Rt t) l) :
    DifferentiableOn ℂ (fun t => Hhol (Rt t)) U := by
  have hdet : ∀ t ∈ U, (Rt t).detIm ≠ 0 := fun t ht => by
    obtain ⟨l, hl, h⟩ := hpos t ht; exact detIm_ne_zero_of_kerPos hl h
  have hfun : (fun t => Hhol (Rt t)) = fun t => ∫ q : Pt8,
      (conj (Tround (toC2 q.1.1 q.1.2)) * Tround (toC2 q.2.1 q.2.2)) *
        (((((2 * Real.pi) ^ 4 : ℝ) : ℂ)⁻¹ * (Rt t).detIm⁻¹) *
          Complex.exp (∑ k, coefK (Rt t) k * (mK k q : ℂ))) := by
    funext t; exact Hhol_eq _
  rw [hfun]
  refine differentiableOn_integral_exp (n := 6) hU (fun k => differentiableOn_coefK hdet k)
    ?_ (fun k => ?_) ?_ (fun q => ?_) N8_nonneg abs_mK_le (fun t ht => ?_)
    (fun l hl => integrable_exp_neg_N8 hl) (fun l hl => integrable_N8_mul_exp hl)
  · intro t ht
    exact ((differentiableAt_const _).mul
      ((differentiable_detIm_Rt t).inv (hdet t ht))).differentiableWithinAt
  · exact (continuous_mK k).measurable
  · exact (((Complex.continuous_conj.measurable.comp
      (measurable_Tround.comp (measurable_toC2.comp measurable_fst)))).mul
      (measurable_Tround.comp (measurable_toC2.comp measurable_snd))).aestronglyMeasurable
  · rw [norm_mul, Complex.norm_conj]
    have h1 := norm_Tround_le hφ (toC2 q.1.1 q.1.2)
    have h2 := norm_Tround_le hφ (toC2 q.2.1 q.2.2)
    nlinarith [norm_nonneg (Tround (toC2 q.1.1 q.1.2)), norm_nonneg (Tround (toC2 q.2.1 q.2.2))]
  · obtain ⟨l, hl, h⟩ := hpos t ht
    exact ⟨l / 2, half_pos hl, fun q => re_sum_le h q⟩

/-- **`hardy` from three explicit inputs.** Let `h` be absolutely summable real coefficients and
`ρ = 4149/4000`. Suppose
* (region) on a disc of radius `r > ρ` the continued kernel decays, `KerPos (Rt t) λ` with `λ > 0`;
* (real identification, step 1(b)) for real `0 < t < 1`, `∑ⱼ hⱼ t^{2j+1} = Hhol (Rt t)`;
* (circle) the mean of `|Hhol (Rt z)|²` over `‖z‖ = ρ` is at most `7/4`.
Then every partial sum `∑_{n<J} hₙ² ρ^{2(2n+1)}` is at most `7/4` — the `hardy` hypothesis of
`fresh_upper_rounder` when `h = kernelCoeff (energy G_T)`. -/
theorem hardy_of_inputs (hφ : PhiBound) {r : ℝ} (hr : 4149 / 4000 < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (Rt t) l)
    {h : ℕ → ℝ} (hs : Summable fun j => |h j|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun j => (h j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (Hhol (Rt t)))
    (hmean : (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖Hhol (Rt (((4149 / 4000 : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ 7 / 4)
    (J : ℕ) :
    ∑ n ∈ Finset.range J, h n ^ 2 * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4 := by
  have hr1 : 1 < r := by linarith
  have hdiff := differentiableOn_Hhol_Rt hφ Metric.isOpen_ball hU
  have hball := hasSum_odd_of_eqOn_real hr1 hdiff hs hreal
  refine sum_sq_le_of_mean_le (f := fun t => Hhol (Rt t)) (fun θ => hball _ ?_)
    (summable_abs_of_hasSum_ball (by norm_num) hr hball) hmean J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    Complex.norm_exp_ofReal_mul_I, mul_one]
  norm_num; linarith

end

end Grothe.UpperChaos
