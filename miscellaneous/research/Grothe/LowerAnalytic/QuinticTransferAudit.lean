import Mathlib

/-!
Generic algebra for the external quintic projection audit. The nonnegative
weights and their total energy budget are hypotheses. This file makes no
claim about Gaussian projections, Hermite orthogonality, or the Mehler identity.
-/

open scoped BigOperators

namespace Grothe.LowerAnalytic.QuinticTransferAudit

variable {ι : Type*}

/-- A diagonal error multiplier is bounded by its largest absolute entry,
provided the supplied nonnegative energy weights have total mass at most one. -/
theorem diagonal_error_bound (s : Finset ι) (a e : ι → ℝ) (δ : ℝ)
    (hδ : 0 ≤ δ) (ha : ∀ i ∈ s, 0 ≤ a i)
    (henergy : ∑ i ∈ s, a i ≤ 1)
    (he : ∀ i ∈ s, |e i| ≤ δ) :
    |∑ i ∈ s, e i * a i| ≤ δ := by
  calc
    |∑ i ∈ s, e i * a i| ≤ ∑ i ∈ s, |e i * a i| :=
      Finset.abs_sum_le_sum_abs _ _
    _ = ∑ i ∈ s, |e i| * a i := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [abs_mul, abs_of_nonneg (ha i hi)]
    _ ≤ ∑ i ∈ s, δ * a i := by
      exact Finset.sum_le_sum fun i hi ↦ mul_le_mul_of_nonneg_right (he i hi) (ha i hi)
    _ = δ * (∑ i ∈ s, a i) := (Finset.mul_sum ..).symm
    _ ≤ δ * 1 := mul_le_mul_of_nonneg_left henergy hδ
    _ = δ := mul_one δ

/-- The separate upper and lower error bounds used for a sign-flipped pair. -/
theorem diagonal_one_sided_bounds (s : Finset ι) (a e : ι → ℝ) (p n : ℝ)
    (hp : 0 ≤ p) (hn : 0 ≤ n) (ha : ∀ i ∈ s, 0 ≤ a i)
    (henergy : ∑ i ∈ s, a i ≤ 1)
    (he : ∀ i ∈ s, -n ≤ e i ∧ e i ≤ p) :
    -n ≤ ∑ i ∈ s, e i * a i ∧ (∑ i ∈ s, e i * a i) ≤ p := by
  constructor
  · calc
      -n = -n * 1 := (mul_one (-n)).symm
      _ ≤ -n * (∑ i ∈ s, a i) :=
        mul_le_mul_of_nonpos_left henergy (neg_nonpos.mpr hn)
      _ = ∑ i ∈ s, -n * a i := Finset.mul_sum ..
      _ ≤ ∑ i ∈ s, e i * a i := by
        exact Finset.sum_le_sum fun i hi ↦ mul_le_mul_of_nonneg_right (he i hi).1 (ha i hi)
  · calc
      (∑ i ∈ s, e i * a i) ≤ ∑ i ∈ s, p * a i := by
        exact Finset.sum_le_sum fun i hi ↦ mul_le_mul_of_nonneg_right (he i hi).2 (ha i hi)
      _ = p * (∑ i ∈ s, a i) := (Finset.mul_sum ..).symm
      _ ≤ p * 1 := mul_le_mul_of_nonneg_left henergy hp
      _ = p := mul_one p

/-- An external strict upper bound survives any supplied absolute error budget. -/
theorem negative_of_error_bound (finite limit δ : ℝ)
    (herror : |finite - limit| ≤ δ) (hlimit : limit + δ < 0) : finite < 0 := by
  have hupper : finite - limit ≤ δ := (abs_le.mp herror).2
  linarith

/-- A convex mixture preserves a strict interval, including either endpoint. -/
theorem strict_interval_convex_mix (x y lo hi t : ℝ)
    (hx : lo < x ∧ x < hi) (hy : lo < y ∧ y < hi)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    lo < t * x + (1 - t) * y ∧ t * x + (1 - t) * y < hi := by
  constructor
  · have h1 := mul_nonneg ht (le_of_lt (sub_pos.mpr hx.1))
    have h2 := mul_nonneg (sub_nonneg.mpr ht1) (le_of_lt (sub_pos.mpr hy.1))
    by_cases hzero : t = 0
    · simpa [hzero] using hy.1
    · have htpos : 0 < t := lt_of_le_of_ne ht (Ne.symm hzero)
      have hstrict := mul_pos htpos (sub_pos.mpr hx.1)
      nlinarith
  · have h1 := mul_nonneg ht (le_of_lt (sub_pos.mpr hx.2))
    have h2 := mul_nonneg (sub_nonneg.mpr ht1) (le_of_lt (sub_pos.mpr hy.2))
    by_cases hzero : t = 0
    · simpa [hzero] using hy.2
    · have htpos : 0 < t := lt_of_le_of_ne ht (Ne.symm hzero)
      have hstrict := mul_pos htpos (sub_pos.mpr hx.2)
      nlinarith

/-- A positive fifth multiplier strictly lowers a frozen payoff when its
signed fifth coefficient is strictly negative. This is not a global cap. -/
theorem signed_step_decreases (base η fifth : ℝ) (hη : 0 < η) (hfifth : fifth < 0) :
    base + η * fifth < base := by
  have hstep : η * fifth < 0 := mul_neg_of_pos_of_neg hη hfifth
  linarith

/-- The same step with a certified quantitative improvement. -/
theorem signed_step_margin (base η fifth γ : ℝ) (hη : 0 ≤ η)
    (hfifth : fifth ≤ -γ) : base + η * fifth ≤ base - η * γ := by
  have hstep := mul_le_mul_of_nonneg_left hfifth hη
  nlinarith

/-- Generic Cramer algebra for three real columns. The first column has
coordinates `(x0, k * x0)`. A nonzero denominator gives weights of total
mass one that cancel both coordinates. Nonnegativity of the weights is a
separate condition; no Gaussian or interval-certificate claim is made here. -/
theorem cramer_three_column_cancellation (k x0 x1 y1 x2 y2 : ℝ)
    (hD : x0 * ((y2 - k * x2) - (y1 - k * x1)) -
      ((y2 - k * x2) * x1 - (y1 - k * x1) * x2) ≠ 0) :
    let a1 := y1 - k * x1
    let a2 := y2 - k * x2
    let X := a2 * x1 - a1 * x2
    let D := x0 * (a2 - a1) - X
    let weight0 := -X / D
    let weight1 := x0 * a2 / D
    let weight2 := -x0 * a1 / D
    weight0 + weight1 + weight2 = 1 ∧
      weight0 * x0 + weight1 * x1 + weight2 * x2 = 0 ∧
      weight0 * (k * x0) + weight1 * y1 + weight2 * y2 = 0 := by
  dsimp only
  let denom := x0 * ((y2 - k * x2) - (y1 - k * x1)) -
    ((y2 - k * x2) * x1 - (y1 - k * x1) * x2)
  refine ⟨?_, ?_, ?_⟩
  · calc
      _ = denom / denom := by
        dsimp [denom]
        ring
      _ = 1 := div_self hD
  · ring
  · ring

/-- Exact rational bookkeeping for the linear necessary score at `theta=49/250`.
The coordinate inequalities are hypotheses; there is no Gaussian claim here.
The affine bound has slope `-0.000005272` and does not need a range for beta. -/
theorem linear_necessary_score_affine_bound (β p c5 C : ℝ)
    (hp : p ≤ 35619 / 50000 + (19 / 25000) * β)
    (hc5 : c5 ≤ -(2021 / 500000) * β)
    (hC : 18 / 25 - (1 / 50) * β ≤ C) :
    (1 + (49 : ℝ) / 250) * p + (1 + (49 : ℝ) / 250) * c5 -
        ((49 : ℝ) / 250) * C ≤
      8886081 / 12500000 - (659 / 125000000) * β := by
  linarith

/-- On `[0,1]`, the supplied coordinate bounds imply a score at most
`0.71088648`. In fact nonnegative beta alone suffices for this consequence. -/
theorem linear_necessary_score_bound (β p c5 C : ℝ)
    (hβ : β ∈ Set.Icc (0 : ℝ) 1)
    (hp : p ≤ 35619 / 50000 + (19 / 25000) * β)
    (hc5 : c5 ≤ -(2021 / 500000) * β)
    (hC : 18 / 25 - (1 / 50) * β ≤ C) :
    (1 + (49 : ℝ) / 250) * p + (1 + (49 : ℝ) / 250) * c5 -
        ((49 : ℝ) / 250) * C ≤ 8886081 / 12500000 := by
  have hbound := linear_necessary_score_affine_bound β p c5 C hp hc5 hC
  have hβ0 : 0 ≤ β := hβ.1
  linarith

/-- The same exact rational bound when the cubic coordinate is zero,
with its coefficient in the full linear necessary score displayed explicitly. -/
theorem zero_cubic_necessary_score_bound (β p c3 c5 C : ℝ)
    (hβ : β ∈ Set.Icc (0 : ℝ) 1)
    (hp : p ≤ 35619 / 50000 + (19 / 25000) * β)
    (hc3 : c3 = 0)
    (hc5 : c5 ≤ -(2021 / 500000) * β)
    (hC : 18 / 25 - (1 / 50) * β ≤ C) :
    (1 + (49 : ℝ) / 250) * p + ((49 : ℝ) / 250 - 1) * c3 +
        (1 + (49 : ℝ) / 250) * c5 - ((49 : ℝ) / 250) * C ≤
      8886081 / 12500000 := by
  simpa only [hc3, mul_zero, add_zero] using
    linear_necessary_score_bound β p c5 C hβ hp hc5 hC

#print axioms diagonal_error_bound
#print axioms diagonal_one_sided_bounds
#print axioms negative_of_error_bound
#print axioms strict_interval_convex_mix
#print axioms signed_step_decreases
#print axioms signed_step_margin
#print axioms cramer_three_column_cancellation
#print axioms linear_necessary_score_affine_bound
#print axioms linear_necessary_score_bound
#print axioms zero_cubic_necessary_score_bound

end Grothe.LowerAnalytic.QuinticTransferAudit
