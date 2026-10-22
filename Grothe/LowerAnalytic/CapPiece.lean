import Grothe.LowerAnalytic.CapCoord
import Grothe.LowerAnalytic.CapMajorant

/-!
# A global cap of the fibre potential from an integrated majorant (routes A, P; AF §§3–6)

Let `A, B : ℂ → ℝ` be measurable prices with `0 < a₀ ≤ A, B ≤ a₁` and `Rb ≥ |L|` measurable
(`Prices`).  Integrating the anchored-pair majorant (`anchored_pair_poly`) with `p = B·v` gives,
for every `v ∈ ℝ¹²`,

  `∫ (|L + p| + |L − p|) dγ ≤ C + 2hᵀv + vᵀHv = qf T 13 (1, v)`,

with the `13 × 13` coefficient matrix `T = ∫ Tz dγ` (`Tz`: index `0` constant, `j + 1` the
coordinate `j`; AF eq. (5)):

  `C = ∫ ν|L|² + (A+B)/2 − δ²/(2D)`,  `hⱼ = ∫ (δν + 2δ/D) uⱼ`,  `Hᵢⱼ = ∫ ν Gᵢⱼ − (8/D) uᵢuⱼ`,

`ν = (1/A + 1/B)/2`, `δν = (1/A − 1/B)/2`, `δ = A² − B²`, `D = majD A B Rb`, `uⱼ = Re(Bⱼ L̄)`,
`Gᵢⱼ = Re(Bᵢ B̄ⱼ)` (`integral_le_qf`).

**The piece check** (`pieceOK`): given rational enclosures `lo ≤ T ≤ up`, the Loewner matrix
`T⁺ = mid + ρI` (`qf_le_loewnerUp`) and the `13 × 13` matrix
`N = cap e₀e₀ᵀ + diag(0, M) − Pᵀ T⁺ P` (`P(1, y) = (1, My + sa)`), the exact `LDLᵀ` check of `N`
proves `J(y, s) ≤ cap` for every `y`, hence `Ψ(s) ≤ cap` (`pot_le_of_pieceOK`).  This is the
finite-dimensional half of every integrating cap route; the remaining input is the enclosure
`lo ≤ T ≤ up` of the integrals.
-/

open MeasureTheory Finset Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Integrability of polynomial weights -/

lemma integrable_one_add_normSq_pow (n : ℕ) :
    Integrable (fun z : ℂ => (1 + Complex.normSq z) ^ n) gaussC := by
  have hc : Continuous (fun z : ℂ => (1 + Complex.normSq z) ^ n) := by fun_prop
  rw [integrable_gaussC_iff _ hc.aestronglyMeasurable]
  refine integrable_of_abs_le_eval (hc.comp continuous_toC).aestronglyMeasurable
    ((MvPolynomial.C 1 + Pn) ^ n) fun x => ?_
  simp only [map_pow, map_add, MvPolynomial.eval_C, eval_Pn]
  exact (abs_of_nonneg (pow_nonneg (by linarith [Complex.normSq_nonneg (toC x)]) n)).le

lemma integrable_of_le_pow (F : ℂ → ℝ) (hF : Continuous F) (C : ℝ) (n : ℕ)
    (h : ∀ z, |F z| ≤ C * (1 + Complex.normSq z) ^ n) : Integrable F gaussC :=
  ((integrable_one_add_normSq_pow n).const_mul C).mono' hF.aestronglyMeasurable
    (Filter.Eventually.of_forall fun z => by rw [Real.norm_eq_abs]; exact h z)

lemma qw_eq (z : ℂ) : qw z = (1 + Complex.normSq z) ^ 2 := rfl

/-! ### Prices -/

/-- Admissible cell prices: measurable, between `a₀ > 0` and `a₁`, and a measurable `Rb`. -/
structure Prices where
  A : ℂ → ℝ
  B : ℂ → ℝ
  Rb : ℂ → ℝ
  a0 : ℝ
  a1 : ℝ
  ha0 : 0 < a0
  mA : Measurable A
  mB : Measurable B
  mR : Measurable Rb
  bA : ∀ z, a0 ≤ A z ∧ A z ≤ a1
  bB : ∀ z, a0 ≤ B z ∧ B z ≤ a1
  bR : ∀ z, 0 ≤ Rb z

variable (ℓ β : ℝ) (pr : Prices)

/-- `uⱼ = Re(Bⱼ L̄)`. -/
def uF (j : ℕ) (z : ℂ) : ℝ := (Bfun j z * conj (Lf ℓ β z)).re
/-- `Gᵢⱼ = Re(Bᵢ B̄ⱼ)`. -/
def GF (i j : ℕ) (z : ℂ) : ℝ := (Bfun i z * conj (Bfun j z)).re
/-- `ν = (1/A + 1/B)/2`. -/
def nuF (z : ℂ) : ℝ := (1 / pr.A z + 1 / pr.B z) / 2
/-- `δν = (1/A − 1/B)/2`. -/
def dnuF (z : ℂ) : ℝ := (1 / pr.A z - 1 / pr.B z) / 2
/-- `δ = A² − B²`. -/
def delF (z : ℂ) : ℝ := pr.A z ^ 2 - pr.B z ^ 2
/-- `D`. -/
def DF (z : ℂ) : ℝ := majD (pr.A z) (pr.B z) (pr.Rb z)

/-- The constant coefficient. -/
def c0F (z : ℂ) : ℝ :=
  nuF pr z * ‖Lf ℓ β z‖ ^ 2 + (pr.A z + pr.B z) / 2 - delF pr z ^ 2 / (2 * DF pr z)
/-- The linear coefficients. -/
def hF (j : ℕ) (z : ℂ) : ℝ := (dnuF pr z + 2 * delF pr z / DF pr z) * uF ℓ β j z
/-- The quadratic coefficients. -/
def HF (i j : ℕ) (z : ℂ) : ℝ := nuF pr z * GF i j z - 8 / DF pr z * (uF ℓ β i z * uF ℓ β j z)

/-- The pointwise `13 × 13` coefficient matrix. -/
def Tz (z : ℂ) (i j : ℕ) : ℝ :=
  if i = 0 then (if j = 0 then c0F ℓ β pr z else hF ℓ β pr (j - 1) z)
  else if j = 0 then hF ℓ β pr (i - 1) z else HF ℓ β pr (i - 1) (j - 1) z

/-- The integrated coefficient matrix `T = ∫ Tz dγ`. -/
def Tint (i j : ℕ) : ℝ := ∫ z, Tz ℓ β pr z i j ∂gaussC

/-! ### The quadratic-form identity -/

/-- `(1, v)`. -/
def wOf (v : ℕ → ℝ) (i : ℕ) : ℝ := if i = 0 then 1 else v (i - 1)

lemma qf_succ (T : ℕ → ℕ → ℝ) (n : ℕ) (w : ℕ → ℝ) :
    qf T (n + 1) w = T 0 0 * w 0 * w 0
      + ∑ j ∈ range n, (T 0 (j + 1) + T (j + 1) 0) * w 0 * w (j + 1)
      + ∑ i ∈ range n, ∑ j ∈ range n, T (i + 1) (j + 1) * w (i + 1) * w (j + 1) := by
  unfold qf
  rw [Finset.sum_range_succ']
  simp_rw [Finset.sum_range_succ' (fun j => T _ j * w _ * w j)]
  rw [Finset.sum_add_distrib]
  have : ∀ j ∈ range n, (T 0 (j + 1) + T (j + 1) 0) * w 0 * w (j + 1)
      = T 0 (j + 1) * w 0 * w (j + 1) + T (j + 1) 0 * w (j + 1) * w 0 := fun _ _ => by ring
  rw [Finset.sum_congr rfl this, Finset.sum_add_distrib]
  ring

lemma normSq_sum (v : ℕ → ℝ) (z : ℂ) :
    ‖∑ j ∈ range 12, (v j : ℂ) * Bfun j z‖ ^ 2
      = ∑ i ∈ range 12, ∑ j ∈ range 12, GF i j z * v i * v j := by
  rw [← Complex.normSq_eq_norm_sq, ← Complex.ofReal_re (Complex.normSq _),
    Complex.normSq_eq_conj_mul_self, map_sum, Finset.sum_mul_sum, Complex.re_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Complex.re_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  simp [GF, Complex.mul_re, Complex.mul_im]
  ring

lemma re_sum_mul (v : ℕ → ℝ) (z : ℂ) :
    ((∑ j ∈ range 12, (v j : ℂ) * Bfun j z) * conj (Lf ℓ β z)).re
      = ∑ j ∈ range 12, uF ℓ β j z * v j := by
  rw [Finset.sum_mul, Complex.re_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  simp only [uF, mul_assoc, Complex.re_ofReal_mul]
  ring

lemma DF_pos (z : ℂ) : 0 < DF pr z :=
  majD_pos (pr.ha0.trans_le (pr.bA z).1) (pr.ha0.trans_le (pr.bB z).1) (pr.bR z)

/-- **The pointwise bound**: `|L + p| + |L − p| ≤ qf (Tz z) 13 (1, v)` for `p = Σ vⱼ Bⱼ`. -/
theorem pointwise_le_qf (hLR : ∀ z, ‖Lf ℓ β z‖ ≤ pr.Rb z) (v : ℕ → ℝ) (z : ℂ) :
    ‖Lf ℓ β z + ∑ j ∈ range 12, (v j : ℂ) * Bfun j z‖
      + ‖Lf ℓ β z - ∑ j ∈ range 12, (v j : ℂ) * Bfun j z‖ ≤ qf (Tz ℓ β pr z) 13 (wOf v) := by
  have hA := pr.ha0.trans_le (pr.bA z).1
  have hB := pr.ha0.trans_le (pr.bB z).1
  have h := anchored_pair_poly (Lf ℓ β z) (∑ j ∈ range 12, (v j : ℂ) * Bfun j z) hA hB (hLR z)
  rw [normSq_sum, re_sum_mul] at h
  refine h.trans (le_of_eq ?_)
  rw [qf_succ]
  simp only [Tz, wOf, Nat.add_one_ne_zero, ↓reduceIte, Nat.add_sub_cancel]
  have hD := DF_pos pr z
  have hx : (∑ j ∈ range 12, uF ℓ β j z * v j) ^ 2
      = ∑ i ∈ range 12, ∑ j ∈ range 12, uF ℓ β i z * uF ℓ β j z * v i * v j := by
    rw [sq, Finset.sum_mul_sum]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => by ring
  simp only [c0F, hF, HF, nuF, dnuF, delF, DF] at *
  generalize hD' : majD (pr.A z) (pr.B z) (pr.Rb z) = D at *
  generalize hX : ∑ j ∈ range 12, uF ℓ β j z * v j = X at hx
  have e1 : ∑ j ∈ range 12, (((1 / pr.A z - 1 / pr.B z) / 2
      + 2 * (pr.A z ^ 2 - pr.B z ^ 2) / D) * uF ℓ β j z + ((1 / pr.A z - 1 / pr.B z) / 2
      + 2 * (pr.A z ^ 2 - pr.B z ^ 2) / D) * uF ℓ β j z) * 1 * v j
      = 2 * ((1 / pr.A z - 1 / pr.B z) / 2 + 2 * (pr.A z ^ 2 - pr.B z ^ 2) / D) * X := by
    rw [← hX, Finset.mul_sum]
    exact Finset.sum_congr rfl fun j _ => by ring
  have e2 : ∑ i ∈ range 12, ∑ j ∈ range 12, ((1 / pr.A z + 1 / pr.B z) / 2 * GF i j z
      - 8 / D * (uF ℓ β i z * uF ℓ β j z)) * v i * v j
      = (1 / pr.A z + 1 / pr.B z) / 2 * ∑ i ∈ range 12, ∑ j ∈ range 12, GF i j z * v i * v j
        - 8 / D * X ^ 2 := by
    rw [hx, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl fun j _ => by ring
  rw [e1, e2]
  field_simp
  ring

/-! ### Integrability of the coefficients -/

lemma norm_Lf_le' (z : ℂ) : ‖Lf ℓ β z‖ ≤ (|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2 :=
  norm_Lf_le ℓ β z

lemma abs_uF_le (j : ℕ) (z : ℂ) :
    |uF ℓ β j z| ≤ 2 * (|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 4 := by
  unfold uF
  refine (Complex.abs_re_le_norm _).trans ?_
  rw [norm_mul, Complex.norm_conj]
  have h1 := norm_Bfun_le j z
  have h2 := norm_Lf_le' ℓ β z
  rw [qw_eq] at h1
  have : (0 : ℝ) ≤ |ℓ| + 3 * |β| := by positivity
  calc ‖Bfun j z‖ * ‖Lf ℓ β z‖ ≤ (2 * (1 + Complex.normSq z) ^ 2)
        * ((|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2) :=
        mul_le_mul h1 h2 (norm_nonneg _) (by positivity)
    _ = _ := by ring

lemma abs_GF_le (i j : ℕ) (z : ℂ) : |GF i j z| ≤ 4 * (1 + Complex.normSq z) ^ 4 := by
  unfold GF
  refine (Complex.abs_re_le_norm _).trans ?_
  rw [norm_mul, Complex.norm_conj]
  have h1 := norm_Bfun_le i z
  have h2 := norm_Bfun_le j z
  rw [qw_eq] at h1 h2
  calc ‖Bfun i z‖ * ‖Bfun j z‖ ≤ (2 * (1 + Complex.normSq z) ^ 2) * (2 * (1 + Complex.normSq z) ^ 2) :=
        mul_le_mul h1 h2 (norm_nonneg _) (by positivity)
    _ = _ := by ring

lemma continuous_uF (j : ℕ) : Continuous (uF ℓ β j) := by
  unfold uF
  have := continuous_Bfun j; have := continuous_Lf ℓ β
  fun_prop

lemma continuous_GF (i j : ℕ) : Continuous (GF i j) := by
  unfold GF
  have := continuous_Bfun i; have := continuous_Bfun j
  fun_prop

lemma integrable_uF (j : ℕ) : Integrable (uF ℓ β j) gaussC :=
  integrable_of_le_pow _ (continuous_uF ℓ β j) _ 4 (abs_uF_le ℓ β j)

lemma integrable_GF (i j : ℕ) : Integrable (GF i j) gaussC :=
  integrable_of_le_pow _ (continuous_GF i j) _ 4 (abs_GF_le i j)

lemma integrable_uu (i j : ℕ) : Integrable (fun z => uF ℓ β i z * uF ℓ β j z) gaussC := by
  refine integrable_of_le_pow _ ((continuous_uF ℓ β i).mul (continuous_uF ℓ β j))
    ((2 * (|ℓ| + 3 * |β|)) ^ 2) 8 fun z => ?_
  rw [abs_mul]
  have h1 := abs_uF_le ℓ β i z
  have h2 := abs_uF_le ℓ β j z
  calc |uF ℓ β i z| * |uF ℓ β j z|
      ≤ (2 * (|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 4)
        * (2 * (|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 4) :=
        mul_le_mul h1 h2 (abs_nonneg _) (le_trans (abs_nonneg _) h1)
    _ = _ := by ring

lemma integrable_normL_sq : Integrable (fun z => ‖Lf ℓ β z‖ ^ 2) gaussC := by
  refine integrable_of_le_pow _ (by have := continuous_Lf ℓ β; fun_prop) ((|ℓ| + 3 * |β|) ^ 2) 4
    fun z => ?_
  rw [abs_of_nonneg (sq_nonneg _)]
  have h := norm_Lf_le' ℓ β z
  calc ‖Lf ℓ β z‖ ^ 2 ≤ ((|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2) ^ 2 :=
        pow_le_pow_left₀ (norm_nonneg _) h 2
    _ = _ := by ring

/-- A bounded measurable factor times an integrable function is integrable. -/
lemma integrable_bdd_mul' {f g : ℂ → ℝ} (hf : Measurable f) (c : ℝ) (hc : ∀ z, |f z| ≤ c)
    (hg : Integrable g gaussC) : Integrable (fun z => f z * g z) gaussC :=
  hg.bdd_mul hf.aestronglyMeasurable (Filter.Eventually.of_forall fun z => by
    rw [Real.norm_eq_abs]; exact hc z)

lemma measurable_DF : Measurable (DF pr) := by
  unfold DF majD
  have := pr.mA; have := pr.mB; have := pr.mR
  fun_prop

lemma DF_ge (z : ℂ) : 8 * pr.a0 ^ 3 ≤ DF pr z := by
  unfold DF majD
  have hA := (pr.bA z).1; have hB := (pr.bB z).1; have h0 := pr.ha0
  have hR := pr.bR z
  have h1 : 2 * pr.a0 ≤ pr.A z + pr.B z := by linarith
  have h2 : 0 ≤ 4 * pr.Rb z ^ 2 + 4 * pr.Rb z * |pr.A z - pr.B z| := by positivity
  have h3 : (2 * pr.a0) ^ 2 ≤ (pr.A z + pr.B z) ^ 2 := pow_le_pow_left₀ (by linarith) h1 2
  have h4 : (2 * pr.a0) * (2 * pr.a0) ^ 2 ≤ (pr.A z + pr.B z) * ((pr.A z + pr.B z) ^ 2
      + 4 * pr.Rb z ^ 2 + 4 * pr.Rb z * |pr.A z - pr.B z|) :=
    mul_le_mul h1 (by linarith) (by positivity) (by linarith)
  nlinarith

lemma abs_inv_le {x : ℝ} (a : ℝ) (ha : 0 < a) (hx : a ≤ x) : |1 / x| ≤ 1 / a := by
  rw [abs_of_pos (by have := ha.trans_le hx; positivity)]
  exact one_div_le_one_div_of_le ha hx

lemma abs_A_le (z : ℂ) : |pr.A z| ≤ pr.a1 := by
  rw [abs_of_pos (pr.ha0.trans_le (pr.bA z).1)]; exact (pr.bA z).2
lemma abs_B_le (z : ℂ) : |pr.B z| ≤ pr.a1 := by
  rw [abs_of_pos (pr.ha0.trans_le (pr.bB z).1)]; exact (pr.bB z).2

lemma abs_nuF_le (z : ℂ) : |nuF pr z| ≤ 1 / pr.a0 := by
  unfold nuF
  have h1 := abs_inv_le pr.a0 pr.ha0 (pr.bA z).1
  have h2 := abs_inv_le pr.a0 pr.ha0 (pr.bB z).1
  rw [abs_div, abs_two]
  have := abs_add_le (1 / pr.A z) (1 / pr.B z)
  linarith

lemma abs_dnuF_le (z : ℂ) : |dnuF pr z| ≤ 1 / pr.a0 := by
  unfold dnuF
  have h1 := abs_inv_le pr.a0 pr.ha0 (pr.bA z).1
  have h2 := abs_inv_le pr.a0 pr.ha0 (pr.bB z).1
  rw [abs_div, abs_two]
  have := abs_sub (1 / pr.A z) (1 / pr.B z)
  linarith

lemma abs_delF_le (z : ℂ) : |delF pr z| ≤ 2 * pr.a1 ^ 2 := by
  unfold delF
  have h1 := abs_A_le pr z; have h2 := abs_B_le pr z
  have e1 : |pr.A z ^ 2| ≤ pr.a1 ^ 2 := by
    rw [abs_pow]; exact pow_le_pow_left₀ (abs_nonneg _) h1 2
  have e2 : |pr.B z ^ 2| ≤ pr.a1 ^ 2 := by
    rw [abs_pow]; exact pow_le_pow_left₀ (abs_nonneg _) h2 2
  have := abs_sub (pr.A z ^ 2) (pr.B z ^ 2)
  linarith

lemma abs_div_DF_le (z : ℂ) {x : ℝ} (c : ℝ) (hx : |x| ≤ c) :
    |x / DF pr z| ≤ c / (8 * pr.a0 ^ 3) := by
  have hD := DF_ge pr z
  have h8 : 0 < 8 * pr.a0 ^ 3 := by have := pr.ha0; positivity
  rw [abs_div, abs_of_pos (h8.trans_le hD)]
  have hc : 0 ≤ c := (abs_nonneg _).trans hx
  calc |x| / DF pr z ≤ c / DF pr z := div_le_div_of_nonneg_right hx (h8.trans_le hD).le
    _ ≤ c / (8 * pr.a0 ^ 3) := div_le_div_of_nonneg_left hc h8 hD

lemma measurable_nuF : Measurable (nuF pr) := by
  unfold nuF; have := pr.mA; have := pr.mB; fun_prop
lemma measurable_dnuF : Measurable (dnuF pr) := by
  unfold dnuF; have := pr.mA; have := pr.mB; fun_prop
lemma measurable_delF : Measurable (delF pr) := by
  unfold delF; have := pr.mA; have := pr.mB; fun_prop

lemma integrable_c0F : Integrable (c0F ℓ β pr) gaussC := by
  have h1 := integrable_bdd_mul' (measurable_nuF pr) _ (abs_nuF_le pr) (integrable_normL_sq ℓ β)
  have h2 := integrable_bdd_mul' (f := fun z => (pr.A z + pr.B z) / 2) (g := fun _ => (1 : ℝ))
    (by have := pr.mA; have := pr.mB; fun_prop) pr.a1 (fun z => by
      have := abs_A_le pr z; have := abs_B_le pr z
      rw [abs_div, abs_two]; have := abs_add_le (pr.A z) (pr.B z); linarith)
    (integrable_const 1)
  have h3 := integrable_bdd_mul' (f := fun z => delF pr z ^ 2 / (2 * DF pr z))
    (g := fun _ => (1 : ℝ))
    (by have := measurable_delF pr; have := measurable_DF pr; fun_prop)
    ((2 * pr.a1 ^ 2) ^ 2 / 2 / (8 * pr.a0 ^ 3)) (fun z => by
      have e : delF pr z ^ 2 / (2 * DF pr z) = (delF pr z ^ 2 / 2) / DF pr z := by ring
      rw [e]
      refine abs_div_DF_le pr z _ ?_
      rw [abs_div, abs_two, abs_pow]
      have := abs_delF_le pr z
      have := pow_le_pow_left₀ (abs_nonneg _) this 2
      linarith)
    (integrable_const 1)
  refine ((h1.add h2).sub h3).congr (Filter.Eventually.of_forall fun z => ?_)
  simp [c0F]

lemma measurable_hcoef : Measurable (fun z => dnuF pr z + 2 * delF pr z / DF pr z) := by
  have := measurable_dnuF pr; have := measurable_delF pr; have := measurable_DF pr; fun_prop

lemma integrable_hF (j : ℕ) : Integrable (hF ℓ β pr j) gaussC :=
  integrable_bdd_mul' (measurable_hcoef pr)
    (1 / pr.a0 + 2 * (2 * pr.a1 ^ 2) / (8 * pr.a0 ^ 3)) (fun z => by
      refine (abs_add_le _ _).trans (add_le_add (abs_dnuF_le pr z) ?_)
      refine abs_div_DF_le pr z _ ?_
      rw [abs_mul, abs_two]
      have := abs_delF_le pr z
      linarith)
    (integrable_uF ℓ β j)

lemma integrable_HF (i j : ℕ) : Integrable (HF ℓ β pr i j) gaussC := by
  have h1 := integrable_bdd_mul' (measurable_nuF pr) _ (abs_nuF_le pr) (integrable_GF i j)
  have h2 := integrable_bdd_mul' (f := fun z => 8 / DF pr z) (by have := measurable_DF pr; fun_prop)
    (8 / (8 * pr.a0 ^ 3)) (fun z => abs_div_DF_le pr z 8 (by norm_num)) (integrable_uu ℓ β i j)
  exact (h1.sub h2).congr (Filter.Eventually.of_forall fun z => by simp [HF])

lemma integrable_Tz (i j : ℕ) : Integrable (fun z => Tz ℓ β pr z i j) gaussC := by
  unfold Tz
  split_ifs
  · exact integrable_c0F ℓ β pr
  · exact integrable_hF ℓ β pr _
  · exact integrable_hF ℓ β pr _
  · exact integrable_HF ℓ β pr _ _

lemma integral_qf (w : ℕ → ℝ) :
    ∫ z, qf (Tz ℓ β pr z) 13 w ∂gaussC = qf (Tint ℓ β pr) 13 w := by
  unfold qf Tint
  rw [integral_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ =>
    ((integrable_Tz ℓ β pr i j).mul_const _).mul_const _]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [integral_finsetSum _ fun j _ => ((integrable_Tz ℓ β pr i j).mul_const _).mul_const _]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [integral_mul_const, integral_mul_const]

lemma integrable_qf (w : ℕ → ℝ) : Integrable (fun z => qf (Tz ℓ β pr z) 13 w) gaussC := by
  unfold qf
  exact integrable_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ =>
    ((integrable_Tz ℓ β pr i j).mul_const _).mul_const _

/-! ### The cap of a piece -/

variable (E : Sym3) (R : Sym2) (a : Fib)

/-- **The integrated majorant**: `J(y, s) ≤ qf T 13 (1, v) − yᵀMy` with `v = vec(My + sa)`. -/
theorem Jpot_le_qf (hLR : ∀ z, ‖Lf ℓ β z‖ ≤ pr.Rb z) (y : Fib) (s : ℝ) :
    Jpot E R ℓ β a y s
      ≤ qf (Tint ℓ β pr) 13 (wOf ((Fib.M E R y).add (a.smul s)).vec) - Fib.quad E R y := by
  unfold Jpot
  have hpt : ∀ z, ‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖
      ≤ qf (Tz ℓ β pr z) 13 (wOf ((Fib.M E R y).add (a.smul s)).vec) := by
    intro z
    have h := pointwise_le_qf ℓ β pr hLR ((Fib.M E R y).add (a.smul s)).vec z
    rw [← fn_eq_sum] at h
    exact h
  have := integral_mono (integrable_Jint E R ℓ β a y s) (integrable_qf ℓ β pr _) hpt
  rw [integral_qf] at this
  linarith

/-! ### The finite check -/

/-- The map `P(w₀, y) = (w₀, w₀ s a + M y)` on `ℝ¹³`. -/
def pMat (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s : ℚ) (r c : ℕ) : ℚ :=
  if r = 0 then (if c = 0 then 1 else 0) else if c = 0 then s * av (r - 1) else Mq (r - 1) (c - 1)

/-- `N = cap e₀e₀ᵀ + diag(0, M) − Pᵀ T⁺ P`. -/
def pieceN (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) (Tup : QMat) : QMat :=
  QMat.ofFn 13 fun i j =>
    (if i = 0 ∧ j = 0 then cap else 0) + (if i ≠ 0 ∧ j ≠ 0 then Mq (i - 1) (j - 1) else 0)
      - ((List.range 13).map fun k => ((List.range 13).map fun l =>
          pMat Mq av s k i * Tup.at k l * pMat Mq av s l j).sum).sum

/-- **The piece check**: enclosure sanity, Loewner matrix, exact `LDLᵀ` of `N`. -/
def pieceOK (lo up : QMat) (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) : Bool :=
  enclOK lo up 13 && ldlOK (pieceN Mq av s cap (loewnerUp lo up 13)) 13

lemma qf_congr {m m' : ℕ → ℕ → ℝ} {n : ℕ} (w : ℕ → ℝ)
    (h : ∀ i < n, ∀ j < n, m i j = m' i j) : qf m n w = qf m' n w := by
  unfold qf
  exact Finset.sum_congr rfl fun i hi => Finset.sum_congr rfl fun j hj => by
    rw [h i (mem_range.1 hi) j (mem_range.1 hj)]

lemma qf_conj (P T : ℕ → ℕ → ℝ) (n : ℕ) (w : ℕ → ℝ) :
    qf (fun i j => ∑ k ∈ range n, ∑ l ∈ range n, P k i * T k l * P l j) n w
      = qf T n (fun k => ∑ i ∈ range n, P k i * w i) := by
  unfold qf
  have e1 : ∀ i j, (∑ k ∈ range n, ∑ l ∈ range n, P k i * T k l * P l j) * w i * w j
      = ∑ k ∈ range n, ∑ l ∈ range n, T k l * (P k i * w i) * (P l j * w j) := by
    intro i j
    rw [Finset.sum_mul, Finset.sum_mul]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [Finset.sum_mul, Finset.sum_mul]
    exact Finset.sum_congr rfl fun l _ => by ring
  have e2 : ∀ k l, T k l * (∑ i ∈ range n, P k i * w i) * (∑ j ∈ range n, P l j * w j)
      = ∑ i ∈ range n, ∑ j ∈ range n, T k l * (P k i * w i) * (P l j * w j) := by
    intro k l
    rw [mul_assoc, Finset.sum_mul_sum, Finset.mul_sum]
    exact Finset.sum_congr rfl fun i _ => by rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun j _ => by ring
  simp_rw [e1, e2]
  calc ∑ i ∈ range n, ∑ j ∈ range n, ∑ k ∈ range n, ∑ l ∈ range n,
          T k l * (P k i * w i) * (P l j * w j)
      = ∑ i ∈ range n, ∑ k ∈ range n, ∑ j ∈ range n, ∑ l ∈ range n,
          T k l * (P k i * w i) * (P l j * w j) :=
        Finset.sum_congr rfl fun _ _ => Finset.sum_comm
    _ = ∑ k ∈ range n, ∑ i ∈ range n, ∑ j ∈ range n, ∑ l ∈ range n,
          T k l * (P k i * w i) * (P l j * w j) := Finset.sum_comm
    _ = ∑ k ∈ range n, ∑ i ∈ range n, ∑ l ∈ range n, ∑ j ∈ range n,
          T k l * (P k i * w i) * (P l j * w j) :=
        Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => Finset.sum_comm
    _ = ∑ k ∈ range n, ∑ l ∈ range n, ∑ i ∈ range n, ∑ j ∈ range n,
          T k l * (P k i * w i) * (P l j * w j) :=
        Finset.sum_congr rfl fun _ _ => Finset.sum_comm

/-- **The cap of a piece** (no constraints): if the enclosure `lo ≤ T ≤ up` of the integrated
coefficient matrix holds and `pieceOK` passes, then `Ψ(s) ≤ cap`. -/
theorem pot_le_of_pieceOK (av : ℕ → ℚ) (hav : ∀ j < 12, a.vec j = av j)
    (hLR : ∀ z, ‖Lf ℓ β z‖ ≤ pr.Rb z) (s cap : ℚ) (lo up : QMat)
    (henc : ∀ i < 13, ∀ j < 13, (lo.at i j : ℝ) ≤ Tint ℓ β pr i j ∧ Tint ℓ β pr i j ≤ up.at i j)
    (hchk : pieceOK lo up (mMat E R) av s cap = true) :
    pot E R ℓ β a s ≤ cap := by
  simp only [pieceOK, Bool.and_eq_true] at hchk
  obtain ⟨henc', hldl⟩ := hchk
  refine ciSup_le fun y => (Jpot_le_qf ℓ β pr E R a hLR y s).trans ?_
  set Tup := loewnerUp lo up 13
  have hL := qf_le_loewnerUp henc' (Tint ℓ β pr) henc
    (wOf ((Fib.M E R y).add (a.smul s)).vec)
  have hN := qf_nonneg_of_ldlOK hldl (wOf y.vec)
  -- expand qf N
  have hNe : qf (fun i j => ((pieceN (mMat E R) av s cap Tup).at i j : ℝ)) 13 (wOf y.vec)
      = qf (fun i j => (((if i = 0 ∧ j = 0 then cap else 0)
          + (if i ≠ 0 ∧ j ≠ 0 then mMat E R (i - 1) (j - 1) else 0) : ℚ) : ℝ)) 13 (wOf y.vec)
        - qf (fun i j => ∑ k ∈ range 13, ∑ l ∈ range 13, (pMat (mMat E R) av s k i : ℝ)
          * (Tup.at k l : ℝ) * pMat (mMat E R) av s l j) 13 (wOf y.vec) := by
    rw [qf_congr (m' := fun i j => (((if i = 0 ∧ j = 0 then cap else 0)
          + (if i ≠ 0 ∧ j ≠ 0 then mMat E R (i - 1) (j - 1) else 0) : ℚ) : ℝ)
          - ∑ k ∈ range 13, ∑ l ∈ range 13, (pMat (mMat E R) av s k i : ℝ)
          * (Tup.at k l : ℝ) * pMat (mMat E R) av s l j)]
    · unfold qf
      rw [← Finset.sum_sub_distrib]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [← Finset.sum_sub_distrib]
      exact Finset.sum_congr rfl fun j _ => by ring
    · intro i hi j hj
      rw [pieceN, QMat.at_ofFn _ hi hj]
      simp only [sum_range_map]
      push_cast
      rfl
  rw [hNe, qf_conj] at hN
  -- the image of (1, y) is (1, v)
  have hPw : (fun k => ∑ i ∈ range 13, (pMat (mMat E R) av s k i : ℝ) * wOf y.vec i)
      = fun k => if k < 13 then wOf ((Fib.M E R y).add (a.smul s)).vec k else
          ∑ i ∈ range 13, (pMat (mMat E R) av s k i : ℝ) * wOf y.vec i := by
    funext k
    split_ifs with hk
    · rw [Finset.sum_range_succ']
      rcases Nat.eq_zero_or_pos k with rfl | hk0
      · simp [pMat, wOf]
      · obtain ⟨k', rfl⟩ : ∃ k', k = k' + 1 := ⟨k - 1, by omega⟩
        simp only [pMat, Nat.add_one_ne_zero, ↓reduceIte, Nat.add_sub_cancel, wOf]
        rw [vec_add, vec_smul, vec_M E R y k' (by omega), hav k' (by omega)]
        push_cast
        ring
    · rfl
  have hq1 : qf (fun i j => ((Tup.at i j : ℚ) : ℝ)) 13
      (fun k => ∑ i ∈ range 13, (pMat (mMat E R) av s k i : ℝ) * wOf y.vec i)
      = qf (fun i j => ((Tup.at i j : ℚ) : ℝ)) 13 (wOf ((Fib.M E R y).add (a.smul s)).vec) := by
    rw [hPw]
    unfold qf
    refine Finset.sum_congr rfl fun i hi => Finset.sum_congr rfl fun j hj => ?_
    simp [mem_range.1 hi, mem_range.1 hj]
  rw [hq1] at hN
  have hq2 : qf (fun i j => (((if i = 0 ∧ j = 0 then cap else 0)
          + (if i ≠ 0 ∧ j ≠ 0 then mMat E R (i - 1) (j - 1) else 0) : ℚ) : ℝ)) 13 (wOf y.vec)
      = cap + Fib.quad E R y := by
    rw [qf_succ, quad_eq_qf]
    simp [wOf]
  rw [hq2] at hN
  linarith

end

end Grothe.LowerAnalytic
