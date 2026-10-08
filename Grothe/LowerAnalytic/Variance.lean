import Mathlib

/-!
# Hilbert-space identities for the lower bound: variance, retained square, two-row mixing

Stated for real inner product spaces (a complex Hilbert space is one via `Re⟪·,·⟫`).
-/

namespace Grothe.LowerAnalytic

open Finset

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **Variance identity**: for weights summing to one,
`Σ wᵢ ‖z + bᵢ‖² = ‖z + Σ wᵢ bᵢ‖² + Σ wᵢ ‖bᵢ‖² − ‖Σ wᵢ bᵢ‖²`. -/
theorem weighted_variance {ι : Type*} (s : Finset ι) (w : ι → ℝ) (hw : ∑ i ∈ s, w i = 1)
    (z : E) (b : ι → E) :
    ∑ i ∈ s, w i * ‖z + b i‖ ^ 2
      = ‖z + ∑ i ∈ s, w i • b i‖ ^ 2 + ∑ i ∈ s, w i * ‖b i‖ ^ 2 - ‖∑ i ∈ s, w i • b i‖ ^ 2 := by
  simp only [norm_add_sq_real, inner_sum, real_inner_smul_right, mul_add, sum_add_distrib]
  have e1 : ∑ i ∈ s, w i * ‖z‖ ^ 2 = ‖z‖ ^ 2 := by rw [← sum_mul, hw, one_mul]
  have e2 : ∑ i ∈ s, w i * (2 * inner ℝ z (b i)) = 2 * ∑ i ∈ s, w i * inner ℝ z (b i) := by
    rw [mul_sum]; exact sum_congr rfl fun i _ => by ring
  rw [e1, e2]; ring

/-- **Retained square**: if `‖v‖² = 2` and `⟪v, h⟫ = ⟪v, Qh⟫` (e.g. `v` in the range of the
orthogonal projection `Q`), then `−ε‖Qh‖² = 2β⟪v,h⟫ + 2β²/ε − ε‖Qh + (β/ε)v‖²`. -/
theorem retained_square (ε β : ℝ) (hε : ε ≠ 0) (Qh v h : E) (hv : ‖v‖ ^ 2 = 2)
    (hvh : inner ℝ v h = inner ℝ v Qh) :
    -ε * ‖Qh‖ ^ 2 = 2 * β * inner ℝ v h + 2 * β ^ 2 / ε - ε * ‖Qh + (β / ε) • v‖ ^ 2 := by
  rw [norm_add_sq_real, real_inner_smul_right, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv,
    ← real_inner_comm Qh v, ← hvh]
  field_simp
  ring

/-- The weighted-variance consequence used for mixing retained-square inequalities: if
`V ≤ Fᵢ − ε‖Qh + (βᵢ/ε) v‖²` for each `i`, then for probability weights
`V ≤ Σ wᵢ Fᵢ − (2/ε)(Σ wᵢβᵢ² − (Σ wᵢβᵢ)²)` (the last square is discarded). -/
theorem mix_retained {ι : Type*} (s : Finset ι) (w : ι → ℝ) (hw0 : ∀ i ∈ s, 0 ≤ w i)
    (hw : ∑ i ∈ s, w i = 1) (ε : ℝ) (hε : 0 < ε) (Qh v : E) (hv : ‖v‖ ^ 2 = 2)
    (F β : ι → ℝ) (V : ℝ) (hV : ∀ i ∈ s, V ≤ F i - ε * ‖Qh + (β i / ε) • v‖ ^ 2) :
    V ≤ ∑ i ∈ s, w i * F i - 2 / ε * (∑ i ∈ s, w i * β i ^ 2 - (∑ i ∈ s, w i * β i) ^ 2) := by
  have hVw : V = ∑ i ∈ s, w i * V := by rw [← sum_mul, hw, one_mul]
  have hsum : ∑ i ∈ s, w i * V ≤ ∑ i ∈ s, w i * (F i - ε * ‖Qh + (β i / ε) • v‖ ^ 2) :=
    sum_le_sum fun i hi => mul_le_mul_of_nonneg_left (hV i hi) (hw0 i hi)
  have hvar := weighted_variance s w hw Qh (fun i => (β i / ε) • v)
  have hsq : ∀ i, ‖(β i / ε) • v‖ ^ 2 = 2 * β i ^ 2 / ε ^ 2 := by
    intro i
    rw [norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv]; field_simp
  have hlin : ∑ i ∈ s, w i • ((β i / ε) • v) = ((∑ i ∈ s, w i * β i) / ε) • v := by
    rw [sum_div, sum_smul]
    all_goals (refine sum_congr rfl fun i _ => ?_; rw [smul_smul, mul_div_assoc])
  have hnn : 0 ≤ ‖Qh + ((∑ i ∈ s, w i * β i) / ε) • v‖ ^ 2 := by positivity
  have hbig : ‖((∑ i ∈ s, w i * β i) / ε) • v‖ ^ 2 = 2 * (∑ i ∈ s, w i * β i) ^ 2 / ε ^ 2 := by
    rw [norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv]; field_simp
  simp only [hsq, hlin, hbig] at hvar
  have expand : ∑ i ∈ s, w i * (F i - ε * ‖Qh + (β i / ε) • v‖ ^ 2)
      = ∑ i ∈ s, w i * F i - ε * ∑ i ∈ s, w i * ‖Qh + (β i / ε) • v‖ ^ 2 := by
    rw [mul_sum, ← sum_sub_distrib]; exact sum_congr rfl fun i _ => by ring
  have e3 : ∑ i ∈ s, w i * (2 * β i ^ 2 / ε ^ 2) = 2 / ε ^ 2 * ∑ i ∈ s, w i * β i ^ 2 := by
    rw [mul_sum]; exact sum_congr rfl fun i _ => by ring
  rw [e3] at hvar
  have hε2 : 0 < ε ^ 2 := by positivity
  calc V = ∑ i ∈ s, w i * V := hVw
    _ ≤ ∑ i ∈ s, w i * (F i - ε * ‖Qh + (β i / ε) • v‖ ^ 2) := hsum
    _ = ∑ i ∈ s, w i * F i - ε * ∑ i ∈ s, w i * ‖Qh + (β i / ε) • v‖ ^ 2 := expand
    _ ≤ ∑ i ∈ s, w i * F i - 2 / ε * (∑ i ∈ s, w i * β i ^ 2 - (∑ i ∈ s, w i * β i) ^ 2) := by
        rw [hvar]
        have : ε * (2 / ε ^ 2 * ∑ i ∈ s, w i * β i ^ 2 - 2 * (∑ i ∈ s, w i * β i) ^ 2 / ε ^ 2)
            = 2 / ε * (∑ i ∈ s, w i * β i ^ 2 - (∑ i ∈ s, w i * β i) ^ 2) := by
          field_simp
          try ring
        nlinarith [mul_nonneg hε.le hnn]

/-- **Two-row mixing bound.**  If `V ≤ (1−θ)Fᵢ + θFⱼ − aθ(1−θ)` for every `θ ∈ [0,1]` (with
`a > 0`), then `V` is at most the envelope value: `min(Fᵢ,Fⱼ)` when `|Fᵢ−Fⱼ| ≥ a`, and
`(Fᵢ+Fⱼ)/2 − a/4 − (Fᵢ−Fⱼ)²/(4a)` otherwise. -/
theorem mixing_bound (Fi Fj a V : ℝ) (ha : 0 < a)
    (h : ∀ θ : ℝ, 0 ≤ θ → θ ≤ 1 → V ≤ (1 - θ) * Fi + θ * Fj - a * θ * (1 - θ)) :
    V ≤ if |Fi - Fj| ≤ a then (Fi + Fj) / 2 - a / 4 - (Fi - Fj) ^ 2 / (4 * a) else min Fi Fj := by
  split_ifs with hc
  · rw [abs_le] at hc
    have hθ0 : 0 ≤ (a + Fi - Fj) / (2 * a) := by apply div_nonneg <;> linarith
    have hθ1 : (a + Fi - Fj) / (2 * a) ≤ 1 := by rw [div_le_one (by positivity)]; linarith
    refine (h _ hθ0 hθ1).trans (le_of_eq ?_)
    field_simp
    ring
  · rcases le_or_gt Fi Fj with hij | hij
    · rw [min_eq_left hij]; simpa using h 0 le_rfl zero_le_one
    · rw [min_eq_right hij.le]; simpa using h 1 zero_le_one le_rfl

end Grothe.LowerAnalytic
