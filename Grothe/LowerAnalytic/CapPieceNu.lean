import Grothe.LowerAnalytic.CapPiece

/-!
# The integrated majorant with an identity tail

The analogue of the first half of `CapPiece.lean` for the fibre potential with a tail `ν`.

Weights (`WtsNu`): seven bounded measurable functions `W 0, …, W 6 : ℂ → ℝ` with the pointwise
majorant of the pair potential

  `Ψ_ν(L + p, L − p) ≤ majPoly (W · z) L p`    (`L = L(z)`, every `p ∈ ℂ`),

`majPoly W L p = W₁ + W₄|L|² + W₆|L|⁴ + W₀|p|² + 2W₂x + 2W₅|L|²x − W₃x²`, `x = Re(p L̄)`
(for the weights `majWt` of a checked cell this is `psiT_le_majPoly`, `CapMajorant.lean`).  With
`p = B·v`, integrating gives for every `v ∈ ℝ¹²`

  `∫ (Ψ_ν(L + p, L − p) − ν) dγ ≤ qf T 13 (1, v)`,   `T = TintNu`,

`T₀₀ = ∫ (W₁ + W₄|L|² + W₆|L|⁴) − ν`, `T₀ⱼ = ∫ (W₂ + W₅|L|²) uⱼ`, `Tᵢⱼ = ∫ W₀Gᵢⱼ − W₃uᵢuⱼ`
(`uⱼ = Re(Bⱼ L̄)`, `Gᵢⱼ = Re(Bᵢ B̄ⱼ)`), hence `J(y, s) ≤ qf T 13 (1, v) − yᵀMy` with
`v = vec(My + sa)` (`Jpot_le_qfNu`).  The finite checks of a piece (`pieceOK`, `pieceOKc`) see only
an enclosure of `T`; their soundness for any matrix with this property is `Jpot_le_of_qfN_of_le`
(`CapPiece.lean`).
-/

open MeasureTheory Finset Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-- Weights of the cell majorant with a tail `ν`: bounded measurable `W 0, …, W 6` with the
pointwise majorant of the pair potential. -/
structure WtsNu (ℓ β ν : ℝ) where
  W : ℕ → ℂ → ℝ
  c : ℝ
  mW : ∀ w, Measurable (W w)
  bW : ∀ w z, |W w z| ≤ c
  maj : ∀ z p, psiT ν (Lf ℓ β z + p) (Lf ℓ β z - p) ≤ majPoly (fun w => W w z) (Lf ℓ β z) p

variable (ℓ β ν : ℝ) (wt : WtsNu ℓ β ν)

/-- The pointwise `13 × 13` coefficient matrix with a tail. -/
def TzNu (z : ℂ) (i j : ℕ) : ℝ :=
  if i = 0 then
    (if j = 0 then wt.W 1 z + wt.W 4 z * ‖Lf ℓ β z‖ ^ 2 + wt.W 6 z * ‖Lf ℓ β z‖ ^ 4
    else (wt.W 2 z + wt.W 5 z * ‖Lf ℓ β z‖ ^ 2) * uF ℓ β (j - 1) z)
  else if j = 0 then (wt.W 2 z + wt.W 5 z * ‖Lf ℓ β z‖ ^ 2) * uF ℓ β (i - 1) z
  else wt.W 0 z * GF (i - 1) (j - 1) z - wt.W 3 z * (uF ℓ β (i - 1) z * uF ℓ β (j - 1) z)

/-- The integrated coefficient matrix `T = ∫ TzNu dγ − ν e₀e₀ᵀ` (the constant `−ν` of the integrand
of the potential sits in the entry `(0, 0)`). -/
def TintNu (i j : ℕ) : ℝ := ∫ z, TzNu ℓ β ν wt z i j ∂gaussC - if i = 0 ∧ j = 0 then ν else 0

/-- **The pointwise bound**: `Ψ_ν(L + p, L − p) ≤ qf (TzNu z) 13 (1, v)` for `p = Σ vⱼ Bⱼ`. -/
theorem psiT_le_qfNu (v : ℕ → ℝ) (z : ℂ) :
    psiT ν (Lf ℓ β z + ∑ j ∈ range 12, (v j : ℂ) * Bfun j z)
      (Lf ℓ β z - ∑ j ∈ range 12, (v j : ℂ) * Bfun j z) ≤ qf (TzNu ℓ β ν wt z) 13 (wOf v) := by
  have h := wt.maj z (∑ j ∈ range 12, (v j : ℂ) * Bfun j z)
  unfold majPoly at h
  rw [normSq_sum, re_sum_mul] at h
  refine h.trans (le_of_eq ?_)
  rw [qf_succ]
  simp only [TzNu, wOf, Nat.add_one_ne_zero, ↓reduceIte, Nat.add_sub_cancel]
  have hx : (∑ j ∈ range 12, uF ℓ β j z * v j) ^ 2
      = ∑ i ∈ range 12, ∑ j ∈ range 12, uF ℓ β i z * uF ℓ β j z * v i * v j := by
    rw [sq, Finset.sum_mul_sum]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => by ring
  generalize hX : ∑ j ∈ range 12, uF ℓ β j z * v j = X at hx
  have e1 : ∑ j ∈ range 12, ((wt.W 2 z + wt.W 5 z * ‖Lf ℓ β z‖ ^ 2) * uF ℓ β j z
      + (wt.W 2 z + wt.W 5 z * ‖Lf ℓ β z‖ ^ 2) * uF ℓ β j z) * 1 * v j
      = 2 * (wt.W 2 z + wt.W 5 z * ‖Lf ℓ β z‖ ^ 2) * X := by
    rw [← hX, Finset.mul_sum]
    exact Finset.sum_congr rfl fun j _ => by ring
  have e2 : ∑ i ∈ range 12, ∑ j ∈ range 12, (wt.W 0 z * GF i j z
      - wt.W 3 z * (uF ℓ β i z * uF ℓ β j z)) * v i * v j
      = wt.W 0 z * ∑ i ∈ range 12, ∑ j ∈ range 12, GF i j z * v i * v j - wt.W 3 z * X ^ 2 := by
    rw [hx, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl fun j _ => by ring
  rw [e1, e2]
  ring

/-! ### Integrability of the coefficients -/

lemma integrable_normL_pow4 : Integrable (fun z => ‖Lf ℓ β z‖ ^ 4) gaussC := by
  refine integrable_of_le_pow _ (by have := continuous_Lf ℓ β; fun_prop) ((|ℓ| + 3 * |β|) ^ 4) 8
    fun z => ?_
  rw [abs_of_nonneg (by positivity)]
  have h := norm_Lf_le' ℓ β z
  calc ‖Lf ℓ β z‖ ^ 4 ≤ ((|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2) ^ 4 :=
        pow_le_pow_left₀ (norm_nonneg _) h 4
    _ = _ := by ring

lemma integrable_normL_sq_uF (j : ℕ) :
    Integrable (fun z => ‖Lf ℓ β z‖ ^ 2 * uF ℓ β j z) gaussC := by
  refine integrable_of_le_pow _
    (by have := continuous_Lf ℓ β; have := continuous_uF ℓ β j; fun_prop)
    ((|ℓ| + 3 * |β|) ^ 2 * (2 * (|ℓ| + 3 * |β|))) 8 fun z => ?_
  rw [abs_mul, abs_of_nonneg (sq_nonneg _)]
  have h1 := norm_Lf_le' ℓ β z
  have h2 := abs_uF_le ℓ β j z
  have h3 : ‖Lf ℓ β z‖ ^ 2 ≤ ((|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2) ^ 2 :=
    pow_le_pow_left₀ (norm_nonneg _) h1 2
  calc ‖Lf ℓ β z‖ ^ 2 * |uF ℓ β j z|
      ≤ ((|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2) ^ 2
        * (2 * (|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 4) :=
        mul_le_mul h3 h2 (abs_nonneg _) (by positivity)
    _ = _ := by ring

variable {ℓ β ν} in
/-- A weight times an integrable function is integrable. -/
lemma integrable_W_mul (w : ℕ) {g : ℂ → ℝ} (hg : Integrable g gaussC) :
    Integrable (fun z => wt.W w z * g z) gaussC :=
  integrable_bdd_mul' (wt.mW w) wt.c (wt.bW w) hg

lemma integrable_TzNu (i j : ℕ) : Integrable (fun z => TzNu ℓ β ν wt z i j) gaussC := by
  have hlin : ∀ k, Integrable
      (fun z => (wt.W 2 z + wt.W 5 z * ‖Lf ℓ β z‖ ^ 2) * uF ℓ β k z) gaussC := fun k =>
    ((integrable_W_mul wt 2 (integrable_uF ℓ β k)).add
      (integrable_W_mul wt 5 (integrable_normL_sq_uF ℓ β k))).congr
      (Filter.Eventually.of_forall fun z => by simp only [Pi.add_apply]; ring)
  unfold TzNu
  split_ifs
  · exact (((integrable_W_mul wt 1 (integrable_const (1 : ℝ))).add
      (integrable_W_mul wt 4 (integrable_normL_sq ℓ β))).add
      (integrable_W_mul wt 6 (integrable_normL_pow4 ℓ β))).congr
      (Filter.Eventually.of_forall fun z => by simp only [Pi.add_apply, mul_one])
  · exact hlin _
  · exact hlin _
  · exact (integrable_W_mul wt 0 (integrable_GF _ _)).sub
      (integrable_W_mul wt 3 (integrable_uu ℓ β _ _))

lemma integrable_qfNu (w : ℕ → ℝ) : Integrable (fun z => qf (TzNu ℓ β ν wt z) 13 w) gaussC := by
  unfold qf
  exact integrable_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ =>
    ((integrable_TzNu ℓ β ν wt i j).mul_const _).mul_const _

/-- `∫ qf (TzNu z) 13 w dγ − ν w₀² = qf TintNu 13 w`. -/
lemma integral_qfNu (w : ℕ → ℝ) :
    ∫ z, qf (TzNu ℓ β ν wt z) 13 w ∂gaussC - ν * w 0 * w 0 = qf (TintNu ℓ β ν wt) 13 w := by
  have e : ∫ z, qf (TzNu ℓ β ν wt z) 13 w ∂gaussC
      = qf (fun i j => ∫ z, TzNu ℓ β ν wt z i j ∂gaussC) 13 w := by
    unfold qf
    rw [integral_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ =>
      ((integrable_TzNu ℓ β ν wt i j).mul_const _).mul_const _]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [integral_finsetSum _ fun j _ => ((integrable_TzNu ℓ β ν wt i j).mul_const _).mul_const _]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [integral_mul_const, integral_mul_const]
  rw [e, qf_succ, qf_succ]
  simp only [TintNu, Nat.add_one_ne_zero, and_false, false_and, and_self, ↓reduceIte, sub_zero]
  ring

/-! ### The integrated majorant -/

variable (E : Sym3) (R : Sym2) (a : Fib)

/-- **The integrated majorant with a tail**: `J(y, s) ≤ qf T 13 (1, v) − yᵀMy` with
`v = vec(My + sa)`, `T = TintNu`. -/
theorem Jpot_le_qfNu (y : Fib) (s : ℝ) :
    Jpot E R ℓ β a ν y s
      ≤ qf (TintNu ℓ β ν wt) 13 (wOf ((Fib.M E R y).add (a.smul s)).vec) - Fib.quad E R y := by
  have hpt : ∀ z, psiT ν (Lf ℓ β z + pfn E R a y s z) (Lf ℓ β z - pfn E R a y s z) - ν
      ≤ qf (TzNu ℓ β ν wt z) 13 (wOf ((Fib.M E R y).add (a.smul s)).vec) - ν := by
    intro z
    have h := psiT_le_qfNu ℓ β ν wt ((Fib.M E R y).add (a.smul s)).vec z
    rw [← fn_eq_sum] at h
    exact sub_le_sub_right h ν
  have hmono : ∫ z, (psiT ν (Lf ℓ β z + pfn E R a y s z) (Lf ℓ β z - pfn E R a y s z) - ν) ∂gaussC
      ≤ ∫ z, (qf (TzNu ℓ β ν wt z) 13 (wOf ((Fib.M E R y).add (a.smul s)).vec) - ν) ∂gaussC :=
    integral_mono (integrable_Jtail E R ℓ β a ν y s)
      ((integrable_qfNu ℓ β ν wt _).sub (integrable_const ν)) hpt
  rw [integral_sub (integrable_qfNu ℓ β ν wt _) (integrable_const ν), integral_const,
    probReal_univ, one_smul] at hmono
  have hq := integral_qfNu ℓ β ν wt (wOf ((Fib.M E R y).add (a.smul s)).vec)
  have hw0 : wOf ((Fib.M E R y).add (a.smul s)).vec 0 = 1 := rfl
  rw [hw0, mul_one, mul_one] at hq
  unfold Jpot
  linarith

end

end Grothe.LowerAnalytic
