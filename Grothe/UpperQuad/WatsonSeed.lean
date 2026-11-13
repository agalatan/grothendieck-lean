import Grothe.UpperQuad.SeedAnalytic
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

/-!
# The Watson remainder of the seed (obligation S2 at the large nodes)

`WatsonHyp N` of `Grothe/UpperQuad/SeedAnalytic.lean`: for `x > 2N + 2`,
`|J₀(x) − (2/√π) x^{−1/2} Σ_{n≤N} w_n x^{−n}| ≤ (2/π)(Γ(N+3/2) x^{−N−3/2} + 4 e^{−x}/x)`, where
`J₀(x) = (2/π) ∫₀¹ t^{−1/2} √(1−t) e^{−xt} dt` (`OriginalPositiveMoment.moment 0 x`).

The proof: `√(1−t) = Σ_{n≤N} c_n tⁿ + R_N(t)` with `|R_N(t)| ≤ t^{N+1}` on `[0, 1]` (the binomial
coefficients `c_0 = 1`, `c_{n+1} = c_n (n−½)/(n+1)`; the bound by the first-order equation
`(1−t) p_N' + p_N/2 = a_N t^N`, `a_N = −(N+1) c_{N+1} ∈ (0, ½]`, and two monotonicity arguments);
`∫₀¹ t^{n−1/2} e^{−xt} dt = Γ(n+½) x^{−n−½} − T_n(x)` with `0 ≤ T_n(x) ≤ 2 e^{−x}/x` for `x ≥ 2n`;
`Γ(n+½) = √π (2n)!/(4ⁿ n!)`; the remainder integral is at most `Γ(N+3/2) x^{−N−3/2}`, and
`Σ_{n≤N} |c_n| ≤ 2`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Watson

open Grothe.UpperQuad Grothe.UpperChaos Grothe.UpperChaos.OriginalPositiveMoment MeasureTheory Set

/-! ### The binomial coefficients of `√(1 − t)` and the first-order equation -/

/-- `c_0 = 1`, `c_{n+1} = c_n (n − ½)/(n + 1)`: the Taylor coefficients of `√(1 − t)`. -/
noncomputable def binC : ℕ → ℝ
  | 0 => 1
  | n + 1 => binC n * ((n : ℝ) - 1 / 2) / (n + 1)

lemma binC_zero : binC 0 = 1 := rfl

lemma binC_succ (n : ℕ) : binC (n + 1) = binC n * ((n : ℝ) - 1 / 2) / (n + 1) := rfl

/-- The partial sums `p_N(t) = Σ_{n ≤ N} c_n tⁿ`. -/
noncomputable def binP (N : ℕ) (t : ℝ) : ℝ := ∑ n ∈ Finset.range (N + 1), binC n * t ^ n

/-- The derivative `p_N'(t) = Σ_{n < N} (n+1) c_{n+1} tⁿ`. -/
noncomputable def binQ (N : ℕ) (t : ℝ) : ℝ :=
  ∑ n ∈ Finset.range N, ((n : ℝ) + 1) * binC (n + 1) * t ^ n

/-- `a_N = −(N+1) c_{N+1}`. -/
noncomputable def binA (N : ℕ) : ℝ := -(((N : ℝ) + 1) * binC (N + 1))

lemma binC_succ_nonpos : ∀ n, binC (n + 1) ≤ 0
  | 0 => by norm_num [binC_succ, binC_zero]
  | n + 1 => by
    rw [binC_succ (n + 1)]
    have h := binC_succ_nonpos n
    have h1 : (0 : ℝ) ≤ ((n + 1 : ℕ) : ℝ) - 1 / 2 := by push_cast; linarith
    exact div_nonpos_of_nonpos_of_nonneg (mul_nonpos_of_nonpos_of_nonneg h h1) (by positivity)

lemma binA_zero : binA 0 = 1 / 2 := by norm_num [binA, binC_succ, binC_zero]

lemma binA_succ' (N : ℕ) : binA (N + 1) = -(((N : ℝ) + 1 / 2) * binC (N + 1)) := by
  unfold binA
  rw [binC_succ (N + 1)]
  push_cast
  field_simp
  ring

lemma binA_succ (N : ℕ) : binA (N + 1) = binA N * (((N : ℝ) + 1 / 2) / (N + 1)) := by
  rw [binA_succ']
  unfold binA
  field_simp

lemma binA_pos : ∀ N, 0 < binA N
  | 0 => by rw [binA_zero]; norm_num
  | N + 1 => by
    rw [binA_succ]
    exact mul_pos (binA_pos N) (by positivity)

lemma binA_le_half : ∀ N, binA N ≤ 1 / 2
  | 0 => by rw [binA_zero]
  | N + 1 => by
    rw [binA_succ]
    have h1 : ((N : ℝ) + 1 / 2) / (N + 1) ≤ 1 := by
      rw [div_le_one (by positivity)]; linarith
    exact (mul_le_of_le_one_right (binA_pos N).le h1).trans (binA_le_half N)

lemma binP_succ (N : ℕ) (t : ℝ) : binP (N + 1) t = binP N t + binC (N + 1) * t ^ (N + 1) := by
  unfold binP; rw [Finset.sum_range_succ]

lemma binQ_succ (N : ℕ) (t : ℝ) :
    binQ (N + 1) t = binQ N t + ((N : ℝ) + 1) * binC (N + 1) * t ^ N := by
  unfold binQ; rw [Finset.sum_range_succ]

/-- **The first-order equation** `(1 − t) p_N'(t) + p_N(t)/2 = a_N t^N`. -/
lemma binP_ode (N : ℕ) (t : ℝ) : (1 - t) * binQ N t + binP N t / 2 = binA N * t ^ N := by
  induction N with
  | zero => simp [binP, binQ, binA_zero, binC_zero]
  | succ N ih =>
    rw [binP_succ, binQ_succ, binA_succ']
    unfold binA at ih
    linear_combination ih

lemma binP_zero (N : ℕ) : binP N 0 = 1 := by
  unfold binP
  rw [Finset.sum_range_succ']
  simp [binC_zero]

/-- `p_N(1) = 2 a_N` (so `0 < p_N(1) ≤ 1`). -/
lemma binP_one (N : ℕ) : binP N 1 = 2 * binA N := by
  have h := binP_ode N 1
  simp only [sub_self, zero_mul, zero_add, one_pow, mul_one] at h
  linarith

/-! ### Derivatives -/

lemma hasDerivAt_binP (N : ℕ) (t : ℝ) : HasDerivAt (binP N) (binQ N t) t := by
  induction N with
  | zero =>
    have : binP 0 = fun _ => 1 := by funext s; simp [binP, binC_zero]
    rw [this]
    simpa [binQ] using hasDerivAt_const t (1 : ℝ)
  | succ N ih =>
    have hf : binP (N + 1) = fun s => binP N s + binC (N + 1) * s ^ (N + 1) :=
      funext (binP_succ N)
    rw [hf, binQ_succ]
    have h2 := (hasDerivAt_pow (N + 1) t).const_mul (binC (N + 1))
    convert ih.add h2 using 1
    push_cast
    ring

/-- `√(1 − t)` for `t < 1`. -/
lemma hasDerivAt_sqrt_one_sub {t : ℝ} (ht : t < 1) :
    HasDerivAt (fun y : ℝ => √(1 - y)) (-1 / (2 * √(1 - t))) t := by
  have h : HasDerivAt (fun y : ℝ => 1 - y) (-1) t := (hasDerivAt_id t).const_sub 1
  exact h.sqrt (by rw [sub_ne_zero]; exact ht.ne')

/-- The remainder `r_N(t) = √(1 − t) − p_N(t)`. -/
noncomputable def binR (N : ℕ) (t : ℝ) : ℝ := √(1 - t) - binP N t

/-- `r_N(t) / √(1 − t)` is nonincreasing on `[0, 1)`: its derivative is `−a_N t^N (1−t)^{−3/2}`. -/
lemma hasDerivAt_binR_div {N : ℕ} {t : ℝ} (ht : t < 1) :
    HasDerivAt (fun y => binR N y * (√(1 - y))⁻¹)
      ((-1 / (2 * √(1 - t)) - binQ N t) * (√(1 - t))⁻¹ +
        binR N t * (-(-1 / (2 * √(1 - t))) / (√(1 - t)) ^ 2)) t := by
  have hs : √(1 - t) ≠ 0 := (Real.sqrt_pos.2 (by linarith)).ne'
  exact ((hasDerivAt_sqrt_one_sub ht).sub (hasDerivAt_binP N t)).mul
    ((hasDerivAt_sqrt_one_sub ht).inv hs)

lemma deriv_binR_div_nonpos {N : ℕ} {t : ℝ} (ht0 : 0 ≤ t) (ht : t < 1) :
    (-1 / (2 * √(1 - t)) - binQ N t) * (√(1 - t))⁻¹ +
      binR N t * (-(-1 / (2 * √(1 - t))) / (√(1 - t)) ^ 2) ≤ 0 := by
  have hspos : 0 < √(1 - t) := Real.sqrt_pos.2 (by linarith)
  have hs2 : √(1 - t) ^ 2 = 1 - t := Real.sq_sqrt (by linarith)
  have key := binP_ode N t
  have hE : (-1 / (2 * √(1 - t)) - binQ N t) * (√(1 - t))⁻¹ +
      binR N t * (-(-1 / (2 * √(1 - t))) / (√(1 - t)) ^ 2) =
      -(√(1 - t) ^ 2 * binQ N t + binP N t / 2) / √(1 - t) ^ 3 := by
    unfold binR
    field_simp
    ring
  rw [hE, hs2, key]
  apply div_nonpos_of_nonpos_of_nonneg _ (by positivity)
  have := binA_pos N
  have := pow_nonneg ht0 N
  nlinarith

/-- `(t^{N+1} + r_N(t)) / √(1 − t)` is nondecreasing on `[0, 1)`. -/
lemma hasDerivAt_binU_div {N : ℕ} {t : ℝ} (ht : t < 1) :
    HasDerivAt (fun y => (y ^ (N + 1) + binR N y) * (√(1 - y))⁻¹)
      ((((N + 1 : ℕ) : ℝ) * t ^ N + (-1 / (2 * √(1 - t)) - binQ N t)) * (√(1 - t))⁻¹ +
        (t ^ (N + 1) + binR N t) * (-(-1 / (2 * √(1 - t))) / (√(1 - t)) ^ 2)) t := by
  have hs : √(1 - t) ≠ 0 := (Real.sqrt_pos.2 (by linarith)).ne'
  exact ((hasDerivAt_pow (N + 1) t).add
    ((hasDerivAt_sqrt_one_sub ht).sub (hasDerivAt_binP N t))).mul
    ((hasDerivAt_sqrt_one_sub ht).inv hs)

lemma deriv_binU_div_nonneg {N : ℕ} {t : ℝ} (ht0 : 0 ≤ t) (ht : t < 1) :
    0 ≤ (((N + 1 : ℕ) : ℝ) * t ^ N + (-1 / (2 * √(1 - t)) - binQ N t)) * (√(1 - t))⁻¹ +
      (t ^ (N + 1) + binR N t) * (-(-1 / (2 * √(1 - t))) / (√(1 - t)) ^ 2) := by
  have hspos : 0 < √(1 - t) := Real.sqrt_pos.2 (by linarith)
  have hs2 : √(1 - t) ^ 2 = 1 - t := Real.sq_sqrt (by linarith)
  have key := binP_ode N t
  have hE : (((N + 1 : ℕ) : ℝ) * t ^ N + (-1 / (2 * √(1 - t)) - binQ N t)) * (√(1 - t))⁻¹ +
      (t ^ (N + 1) + binR N t) * (-(-1 / (2 * √(1 - t))) / (√(1 - t)) ^ 2) =
      (((N : ℝ) + 1) * t ^ N * √(1 - t) ^ 2 - (√(1 - t) ^ 2 * binQ N t + binP N t / 2) +
        t ^ (N + 1) / 2) / √(1 - t) ^ 3 := by
    unfold binR
    push_cast
    field_simp
    ring
  rw [hE, hs2, key]
  apply div_nonneg _ (by positivity)
  have hA := binA_le_half N
  have htN := pow_nonneg ht0 N
  have hid : ((N : ℝ) + 1) * t ^ N * (1 - t) - binA N * t ^ N + t ^ (N + 1) / 2 =
      t ^ N * (((N : ℝ) + 1 - binA N) - ((N : ℝ) + 1 / 2) * t) := by ring
  rw [hid]
  apply mul_nonneg htN
  nlinarith

/-- A function with nonpositive derivative on `[0, 1)` decreases on `[0, t]`, `t < 1`. -/
private lemma le_of_hasDerivAt_nonpos {f f' : ℝ → ℝ} {t : ℝ} (ht0 : 0 ≤ t) (ht : t < 1)
    (hf : ∀ y < 1, HasDerivAt f (f' y) y) (hf' : ∀ y, 0 ≤ y → y < 1 → f' y ≤ 0) :
    f t ≤ f 0 := by
  have hlt : ∀ y ∈ Icc (0 : ℝ) t, y < 1 := fun y hy => hy.2.trans_lt ht
  refine antitoneOn_of_deriv_nonpos (convex_Icc 0 t)
    (fun y hy => (hf y (hlt y hy)).continuousAt.continuousWithinAt)
    (fun y hy => (hf y (hlt y (interior_subset hy))).differentiableAt.differentiableWithinAt)
    (fun y hy => ?_) (left_mem_Icc.2 ht0) ⟨ht0, le_rfl⟩ ht0
  have hy' := interior_subset hy
  rw [(hf y (hlt y hy')).deriv]
  exact hf' y hy'.1 (hlt y hy')

/-- **The binomial remainder**: `|√(1 − t) − p_N(t)| ≤ t^{N+1}` on `[0, 1]`. -/
theorem abs_binR_le (N : ℕ) {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) : |binR N t| ≤ t ^ (N + 1) := by
  rcases ht1.lt_or_eq with ht | rfl
  · -- the two monotone quotients on `[0, t]`
    have hs : 0 < √(1 - t) := Real.sqrt_pos.2 (by linarith)
    -- upper bound: `r_N ≤ 0`
    have hv0 : binR N 0 * (√(1 - 0))⁻¹ = 0 := by simp [binR, binP_zero]
    have hvt : binR N t * (√(1 - t))⁻¹ ≤ binR N 0 * (√(1 - 0))⁻¹ :=
      le_of_hasDerivAt_nonpos ht0 ht (fun _ hy => hasDerivAt_binR_div hy)
        fun _ hy0 hy1 => deriv_binR_div_nonpos hy0 hy1
    rw [hv0] at hvt
    have hr_le : binR N t ≤ 0 := nonpos_of_mul_nonpos_left hvt (inv_pos.2 hs)
    -- lower bound: `t^{N+1} + r_N ≥ 0`
    have hw0 : ((0 : ℝ) ^ (N + 1) + binR N 0) * (√(1 - 0))⁻¹ = 0 := by simp [binR, binP_zero]
    have hwt : ((0 : ℝ) ^ (N + 1) + binR N 0) * (√(1 - 0))⁻¹ ≤
        (t ^ (N + 1) + binR N t) * (√(1 - t))⁻¹ :=
      neg_le_neg_iff.mp <| le_of_hasDerivAt_nonpos ht0 ht
        (fun _ hy => (hasDerivAt_binU_div hy).neg)
        fun _ hy0 hy1 => neg_nonpos.mpr (deriv_binU_div_nonneg hy0 hy1)
    rw [hw0] at hwt
    have hu_ge : 0 ≤ t ^ (N + 1) + binR N t := nonneg_of_mul_nonneg_left hwt (inv_pos.2 hs)
    rw [abs_le]
    constructor <;> linarith
  · -- the endpoint `t = 1`: `r_N(1) = −p_N(1) = −2 a_N`
    unfold binR
    rw [sub_self, Real.sqrt_zero, zero_sub, abs_neg, binP_one, one_pow,
      abs_of_pos (by linarith [binA_pos N])]
    linarith [binA_le_half N]

/-- `Σ_{n ≤ N} |c_n| ≤ 2`: `|c_0| = 1` and `Σ_{1 ≤ n ≤ N} |c_n| = 1 − p_N(1) ≤ 1`. -/
theorem sum_abs_binC_le (N : ℕ) : ∑ n ∈ Finset.range (N + 1), |binC n| ≤ 2 := by
  have h1 : ∑ n ∈ Finset.range (N + 1), |binC n| = 2 - binP N 1 := by
    rw [Finset.sum_range_succ']
    unfold binP
    rw [Finset.sum_range_succ']
    simp only [binC_zero, abs_one, pow_zero, mul_one, one_pow]
    have : ∀ n, |binC (n + 1)| = -binC (n + 1) := fun n => abs_of_nonpos (binC_succ_nonpos n)
    simp only [this, Finset.sum_neg_distrib]
    ring
  rw [h1, binP_one]
  linarith [binA_pos N]

/-! ### The Gamma integrals `∫_{(0,∞)} t^a e^{−xt} dt = Γ(a+1) x^{−a−1}` -/

lemma integrableOn_rpow_mul_exp {a x : ℝ} (ha : -1 < a) (hx : 0 < x) :
    IntegrableOn (fun t : ℝ => t ^ a * Real.exp (-x * t)) (Ioi 0) := by
  have h0 := Real.GammaIntegral_convergent (show 0 < a + 1 by linarith)
  have h1 := (integrableOn_Ioi_comp_mul_left_iff
    (fun u : ℝ => Real.exp (-u) * u ^ (a + 1 - 1)) 0 hx).2 (by simpa using h0)
  have h2 := h1.const_mul (x ^ a)⁻¹
  refine IntegrableOn.congr_fun h2 (fun t ht => ?_) measurableSet_Ioi
  have ht0 : 0 < t := ht
  have hxa : x ^ a ≠ 0 := (Real.rpow_pos_of_pos hx a).ne'
  simp only [add_sub_cancel_right]
  rw [Real.mul_rpow hx.le ht0.le, neg_mul]
  field_simp

lemma integral_rpow_mul_exp {a x : ℝ} (ha : -1 < a) (hx : 0 < x) :
    ∫ t in Ioi (0 : ℝ), t ^ a * Real.exp (-x * t) = Real.Gamma (a + 1) / x ^ (a + 1) := by
  have hG : Real.Gamma (a + 1) = ∫ u in Ioi (0 : ℝ), Real.exp (-u) * u ^ a := by
    rw [Real.Gamma_eq_integral (show 0 < a + 1 by linarith), add_sub_cancel_right]
  have hscale := integral_comp_mul_left_Ioi (fun u : ℝ => Real.exp (-u) * u ^ (a + 1 - 1)) 0 hx
  simp only [mul_zero, smul_eq_mul, add_sub_cancel_right] at hscale
  rw [← hG] at hscale
  have hcongr : ∫ t in Ioi (0 : ℝ), Real.exp (-(x * t)) * (x * t) ^ a =
      x ^ a * ∫ t in Ioi (0 : ℝ), t ^ a * Real.exp (-x * t) := by
    rw [← integral_const_mul]
    apply setIntegral_congr_fun measurableSet_Ioi
    intro t ht
    have ht0 : 0 < t := ht
    simp only
    rw [Real.mul_rpow hx.le ht0.le, neg_mul]
    ring
  rw [hcongr] at hscale
  have hxa : 0 < x ^ a := Real.rpow_pos_of_pos hx a
  rw [Real.rpow_add hx, Real.rpow_one, eq_div_iff (by positivity)]
  calc (∫ t in Ioi (0 : ℝ), t ^ a * Real.exp (-x * t)) * (x ^ a * x)
      = (x ^ a * ∫ t in Ioi (0 : ℝ), t ^ a * Real.exp (-x * t)) * x := by ring
    _ = x⁻¹ * Real.Gamma (a + 1) * x := by rw [hscale]
    _ = Real.Gamma (a + 1) := by field_simp

/-- `Γ(n + ½) = √π (2n)!/(4ⁿ n!)`. -/
lemma Gamma_nat_add_half (n : ℕ) : Real.Gamma ((n : ℝ) + 1 / 2) = √Real.pi * watsonG n := by
  induction n with
  | zero =>
    rw [show ((0 : ℕ) : ℝ) + 1 / 2 = 1 / 2 by norm_num, Real.Gamma_one_half_eq, watsonG_zero, mul_one]
  | succ n ih =>
    have h : ((n + 1 : ℕ) : ℝ) + 1 / 2 = ((n : ℝ) + 1 / 2) + 1 := by push_cast; ring
    rw [h, Real.Gamma_add_one (by positivity), ih, watsonG_succ]
    ring

/-- `x^{n+½} = xⁿ √x`. -/
lemma rpow_nat_add_half {x : ℝ} (hx : 0 < x) (n : ℕ) : x ^ ((n : ℝ) + 1 / 2) = x ^ n * √x := by
  rw [Real.rpow_add hx, Real.rpow_natCast, Real.sqrt_eq_rpow]

/-- `w_n = c_n g_n`. -/
lemma watsonW_eq (n : ℕ) : watsonW n = binC n * watsonG n := by
  induction n with
  | zero => simp [watsonW_zero, binC_zero, watsonG_zero]
  | succ n ih =>
    rw [watsonW_succ, ih, binC_succ, watsonG_succ]
    field_simp
    ring

/-! ### The tails `T_n(x) = ∫_{(1,∞)} t^{n−½} e^{−xt} dt ≤ 2 e^{−x}/x` for `x ≥ 2n` -/

lemma tail_nonneg {n : ℕ} {x : ℝ} :
    0 ≤ ∫ t in Ioi (1 : ℝ), t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t) := by
  apply setIntegral_nonneg measurableSet_Ioi
  intro t ht
  have ht0 : 0 < t := zero_lt_one.trans ht
  positivity

lemma tail_le {n : ℕ} {x : ℝ} (hx : 2 * (n : ℝ) ≤ x) (hx0 : 0 < x) :
    ∫ t in Ioi (1 : ℝ), t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t) ≤ 2 * Real.exp (-x) / x := by
  have hxn : (n : ℝ) - x < 0 := by linarith [(Nat.cast_nonneg n : (0 : ℝ) ≤ n)]
  have hint : IntegrableOn (fun t : ℝ => t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t)) (Ioi 1) :=
    (integrableOn_rpow_mul_exp (by linarith [(Nat.cast_nonneg n : (0 : ℝ) ≤ n)]) hx0).mono_set
      (Ioi_subset_Ioi zero_le_one)
  have hg : IntegrableOn (fun t : ℝ => Real.exp (-(n : ℝ)) * Real.exp (((n : ℝ) - x) * t)) (Ioi 1) :=
    (integrableOn_exp_mul_Ioi hxn 1).const_mul _
  calc ∫ t in Ioi (1 : ℝ), t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t)
      ≤ ∫ t in Ioi (1 : ℝ), Real.exp (-(n : ℝ)) * Real.exp (((n : ℝ) - x) * t) := by
        apply setIntegral_mono_on hint hg measurableSet_Ioi
        intro t ht
        have ht1 : (1 : ℝ) < t := ht
        have h1 : t ^ ((n : ℝ) - 1 / 2) ≤ t ^ (n : ℝ) :=
          Real.rpow_le_rpow_of_exponent_le ht1.le (by linarith)
        have h2 : t ^ (n : ℝ) ≤ Real.exp ((n : ℝ) * (t - 1)) := by
          rw [Real.rpow_natCast, Real.exp_nat_mul]
          apply pow_le_pow_left₀ (by linarith)
          linarith [Real.add_one_le_exp (t - 1)]
        calc t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t)
            ≤ Real.exp ((n : ℝ) * (t - 1)) * Real.exp (-x * t) :=
              mul_le_mul_of_nonneg_right (h1.trans h2) (Real.exp_pos _).le
          _ = Real.exp (-(n : ℝ)) * Real.exp (((n : ℝ) - x) * t) := by
              rw [← Real.exp_add, ← Real.exp_add]; ring_nf
    _ = Real.exp (-(n : ℝ)) * (-Real.exp (((n : ℝ) - x) * 1) / ((n : ℝ) - x)) := by
        rw [integral_const_mul, integral_exp_mul_Ioi hxn]
    _ = Real.exp (-x) / (x - n) := by
        have h1 : Real.exp (-(n : ℝ)) * Real.exp ((n : ℝ) - x) = Real.exp (-x) := by
          rw [← Real.exp_add]; congr 1; ring
        rw [mul_one, neg_div, mul_neg, ← mul_div_assoc, h1, ← div_neg, neg_sub]
    _ ≤ 2 * Real.exp (-x) / x := by
        rw [div_le_div_iff₀ (by linarith) hx0]
        have := Real.exp_pos (-x)
        nlinarith

/-! ### The integrals over `(0, 1]` -/

/-- `∫_{(0,1]} t^{n−½} e^{−xt} dt = Γ(n+½) x^{−n−½} − T_n(x)`. -/
lemma integral_Ioc_rpow_mul_exp {n : ℕ} {x : ℝ} (hx0 : 0 < x) :
    ∫ t in Ioc (0 : ℝ) 1, t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t) =
      Real.Gamma ((n : ℝ) + 1 / 2) / x ^ ((n : ℝ) + 1 / 2) -
        ∫ t in Ioi (1 : ℝ), t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t) := by
  have ha : (-1 : ℝ) < (n : ℝ) - 1 / 2 := by linarith [(Nat.cast_nonneg n : (0 : ℝ) ≤ n)]
  have hint := integrableOn_rpow_mul_exp ha hx0
  have hsplit := setIntegral_union (f := fun t : ℝ => t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t))
    (μ := volume) (Set.Ioc_disjoint_Ioi le_rfl) measurableSet_Ioi
    (hint.mono_set Ioc_subset_Ioi_self) (hint.mono_set (Ioi_subset_Ioi zero_le_one))
  rw [Set.Ioc_union_Ioi_eq_Ioi zero_le_one, integral_rpow_mul_exp ha hx0,
    show (n : ℝ) - 1 / 2 + 1 = (n : ℝ) + 1 / 2 by ring] at hsplit
  linarith

/-! ### The Watson remainder -/

/-- **The Watson remainder** `WatsonHyp N`: for `x > 2N + 2`,
`|J₀(x) − (2/√π) x^{−1/2} Σ_{n≤N} w_n x^{−n}| ≤ (2/π)(Γ(N+3/2) x^{−N−3/2} + 4 e^{−x}/x)`. -/
theorem watsonHyp (N : ℕ) : WatsonHyp N := by
  intro x hx
  have hx0 : 0 < x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  have hsx : 0 < √x := Real.sqrt_pos.2 hx0
  have hspi : 0 < √Real.pi := Real.sqrt_pos.2 Real.pi_pos
  -- the integrand pieces
  set f : ℕ → ℝ → ℝ := fun n t => t ^ ((n : ℝ) - 1 / 2) * Real.exp (-x * t) with hf
  set e : ℝ → ℝ := fun t => t ^ ((0 : ℝ) - 1 / 2) * Real.exp (-x * t) * binR N t with he
  have hpoint : ∀ t ∈ Ioc (0 : ℝ) 1,
      integrand 0 x t = (∑ n ∈ Finset.range (N + 1), binC n * f n t) + e t := by
    intro t ht
    have ht0 : 0 < t := ht.1
    have hr : ∀ n : ℕ, t ^ ((n : ℝ) - 1 / 2) = t ^ ((0 : ℝ) - 1 / 2) * t ^ n := by
      intro n
      rw [← Real.rpow_natCast, ← Real.rpow_add ht0]
      congr 1; ring
    have hs : ∑ n ∈ Finset.range (N + 1), binC n * f n t =
        (t ^ ((0 : ℝ) - 1 / 2) * Real.exp (-x * t)) * binP N t := by
      unfold binP
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro n _
      simp only [hf]
      rw [hr n]
      ring
    rw [hs]
    simp only [he, binR, integrand, Nat.cast_zero]
    ring
  -- integrability of the pieces on `(0, 1]`
  have hfint : ∀ n : ℕ, IntegrableOn (f n) (Ioc 0 1) := fun n =>
    (integrableOn_rpow_mul_exp (by linarith [(Nat.cast_nonneg n : (0 : ℝ) ≤ n)]) hx0).mono_set
      Ioc_subset_Ioi_self
  have hsumint : IntegrableOn (fun t => ∑ n ∈ Finset.range (N + 1), binC n * f n t) (Ioc 0 1) :=
    integrable_finsetSum _ fun n _ => (hfint n).const_mul _
  have hIint : IntegrableOn (integrand 0 x) (Ioc 0 1) :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le zero_le_one).1 (integrand_intervalIntegrable 0 x)
  have heint : IntegrableOn e (Ioc 0 1) := by
    have : IntegrableOn (fun t => integrand 0 x t - ∑ n ∈ Finset.range (N + 1), binC n * f n t)
        (Ioc 0 1) := hIint.sub hsumint
    exact this.congr_fun (fun t ht => by simp only; rw [hpoint t ht]; ring) measurableSet_Ioc
  -- the integral of `J₀`
  have hJ : moment 0 x = 2 / Real.pi *
      ((∑ n ∈ Finset.range (N + 1), binC n * ∫ t in Ioc (0 : ℝ) 1, f n t) +
        ∫ t in Ioc (0 : ℝ) 1, e t) := by
    unfold moment
    rw [intervalIntegral.integral_of_le zero_le_one,
      setIntegral_congr_fun measurableSet_Ioc hpoint, integral_add hsumint heint,
      integral_finsetSum _ fun n _ => (hfint n).const_mul _]
    simp_rw [integral_const_mul]
  -- the main term
  have hmain : 2 / Real.pi * (∑ n ∈ Finset.range (N + 1),
      binC n * (Real.Gamma ((n : ℝ) + 1 / 2) / x ^ ((n : ℝ) + 1 / 2))) = watsonMain N x := by
    unfold watsonMain watsonS
    simp_rw [Gamma_nat_add_half, rpow_nat_add_half hx0, watsonW_eq, one_div_pow]
    rw [Finset.mul_sum, Finset.mul_sum, Finset.sum_div]
    apply Finset.sum_congr rfl
    intro n _
    set s := √Real.pi with hs
    have hpi : Real.pi = s * s := (Real.mul_self_sqrt Real.pi_pos.le).symm
    rw [hpi]
    field_simp
  -- the remainder integral
  have hE : |∫ t in Ioc (0 : ℝ) 1, e t| ≤ watsonU N x := by
    have hb : ∀ t ∈ Ioc (0 : ℝ) 1, ‖e t‖ ≤ f (N + 1) t := by
      intro t ht
      have ht0 : 0 < t := ht.1
      simp only [he, hf, Real.norm_eq_abs, abs_mul, abs_of_pos (Real.rpow_pos_of_pos ht0 _),
        abs_of_pos (Real.exp_pos _)]
      have hR := abs_binR_le N ht0.le ht.2
      have hr : t ^ (((N + 1 : ℕ) : ℝ) - 1 / 2) = t ^ ((0 : ℝ) - 1 / 2) * t ^ (N + 1) := by
        rw [← Real.rpow_natCast, ← Real.rpow_add ht0]
        congr 1; push_cast; ring
      rw [hr]
      calc t ^ ((0 : ℝ) - 1 / 2) * Real.exp (-x * t) * |binR N t|
          ≤ t ^ ((0 : ℝ) - 1 / 2) * Real.exp (-x * t) * t ^ (N + 1) :=
            mul_le_mul_of_nonneg_left hR (by positivity)
        _ = t ^ ((0 : ℝ) - 1 / 2) * t ^ (N + 1) * Real.exp (-x * t) := by ring
    have h1 : ‖∫ t in Ioc (0 : ℝ) 1, e t‖ ≤ ∫ t in Ioc (0 : ℝ) 1, f (N + 1) t :=
      norm_integral_le_of_norm_le (hfint (N + 1)) (ae_restrict_of_forall_mem measurableSet_Ioc hb)
    have h2 : ∫ t in Ioc (0 : ℝ) 1, f (N + 1) t ≤ ∫ t in Ioi (0 : ℝ), f (N + 1) t := by
      apply setIntegral_mono_set
        (integrableOn_rpow_mul_exp (by linarith [(Nat.cast_nonneg (N + 1) : (0 : ℝ) ≤ (N + 1 : ℕ))]) hx0)
      · apply ae_restrict_of_forall_mem measurableSet_Ioi
        intro t ht
        have ht0 : 0 < t := ht
        simp only [Pi.zero_apply]
        positivity
      · exact Filter.Eventually.of_forall Ioc_subset_Ioi_self
    have h3 : ∫ t in Ioi (0 : ℝ), f (N + 1) t = watsonU N x := by
      simp only [hf]
      rw [integral_rpow_mul_exp (by linarith [(Nat.cast_nonneg (N + 1) : (0 : ℝ) ≤ (N + 1 : ℕ))]) hx0]
      have : ((N + 1 : ℕ) : ℝ) - 1 / 2 + 1 = ((N + 1 : ℕ) : ℝ) + 1 / 2 := by ring
      rw [this, Gamma_nat_add_half, rpow_nat_add_half hx0]
      rfl
    rw [Real.norm_eq_abs] at h1
    linarith
  -- the tails
  have hT : |∑ n ∈ Finset.range (N + 1), binC n * ∫ t in Ioi (1 : ℝ), f n t| ≤
      4 * (Real.exp (-x) * (1 / x)) := by
    calc |∑ n ∈ Finset.range (N + 1), binC n * ∫ t in Ioi (1 : ℝ), f n t|
        ≤ ∑ n ∈ Finset.range (N + 1), |binC n| * (2 * Real.exp (-x) / x) := by
          refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun n hn => ?_)
          rw [Finset.mem_range] at hn
          rw [abs_mul, abs_of_nonneg (tail_nonneg (n := n) (x := x))]
          apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
          apply tail_le _ hx0
          have : (n : ℝ) ≤ N := by exact_mod_cast (show n ≤ N by omega)
          linarith
      _ = (∑ n ∈ Finset.range (N + 1), |binC n|) * (2 * Real.exp (-x) / x) := by
          rw [Finset.sum_mul]
      _ ≤ 2 * (2 * Real.exp (-x) / x) :=
          mul_le_mul_of_nonneg_right (sum_abs_binC_le N) (by positivity)
      _ = 4 * (Real.exp (-x) * (1 / x)) := by ring
  -- assembly
  have hsplit : ∑ n ∈ Finset.range (N + 1), binC n * ∫ t in Ioc (0 : ℝ) 1, f n t =
      (∑ n ∈ Finset.range (N + 1),
        binC n * (Real.Gamma ((n : ℝ) + 1 / 2) / x ^ ((n : ℝ) + 1 / 2))) -
      ∑ n ∈ Finset.range (N + 1), binC n * ∫ t in Ioi (1 : ℝ), f n t := by
    rw [← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro n _
    simp only [hf]
    rw [integral_Ioc_rpow_mul_exp hx0]
    ring
  have hdiff : moment 0 x - watsonMain N x = 2 / Real.pi *
      ((∫ t in Ioc (0 : ℝ) 1, e t) - ∑ n ∈ Finset.range (N + 1), binC n * ∫ t in Ioi (1 : ℝ), f n t) := by
    rw [hJ, ← hmain, hsplit]
    ring
  rw [hdiff, abs_mul, abs_of_pos (by positivity : (0 : ℝ) < 2 / Real.pi),
    show watsonBound N x = 2 / Real.pi * (watsonU N x + 4 * (Real.exp (-x) * (1 / x))) by
      unfold watsonBound; ring]
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  exact (abs_sub _ _).trans (add_le_add hE hT)

end Grothe.UpperQuad.Watson
