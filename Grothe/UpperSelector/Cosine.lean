import Grothe.UpperSelector.Wiener
import Mathlib.Data.Nat.Cast.Order.Field
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

set_option warningAsError true

/-!
# Odd cosine powers and truncated frequency weights

Multiplication by `cos² θ` averages the two adjacent odd frequencies and the original
frequency. At the first frequency the negative neighbour reflects back to the first.
Truncation and integer division in the nonnegative recurrence give certified lower
weights at any precision.

Agent-ID: codex-a7c4
-/

namespace Haagerup.AngularSelector

open Finset MeasureTheory

/-- One half-line recurrence step. Truncated natural subtraction implements the reflecting boundary. -/
noncomputable def foldedStep (v : ℕ → ℝ) (i : ℕ) : ℝ :=
  (v (i - 1) + 2 * v i + v (i + 1)) / 4

/-- The coefficient of frequency `2i+1` in `cos(θ)^(2k+1)`. -/
noncomputable def foldedWeight : ℕ → ℕ → ℝ
  | 0, i => if i = 0 then 1 else 0
  | k + 1, i => foldedStep (foldedWeight k) i

theorem foldedWeight_nonneg (k i : ℕ) : 0 ≤ foldedWeight k i := by
  induction k generalizing i with
  | zero => simp [foldedWeight]; split <;> norm_num
  | succ k ih =>
    dsimp [foldedWeight, foldedStep]
    exact div_nonneg (add_nonneg (add_nonneg (ih _) (mul_nonneg (by norm_num) (ih _))) (ih _)) (by norm_num)

theorem foldedWeight_zero {k i : ℕ} (h : k < i) : foldedWeight k i = 0 := by
  induction k generalizing i with
  | zero => simp [foldedWeight, Nat.ne_of_gt h]
  | succ k ih =>
    simp [foldedWeight, foldedStep, ih (show k < i - 1 by omega), ih (show k < i by omega),
      ih (show k < i + 1 by omega)]

/-- The finite reflecting walk is self-adjoint when summing over the full reachable support. -/
private theorem foldedStep_sum {k : ℕ} (v F : ℕ → ℝ) (hz : ∀ i, k < i → v i = 0) :
    ∑ i ∈ range (k + 2), foldedStep v i * F i =
      ∑ i ∈ range (k + 1), v i * foldedStep F i := by
  have hdown : ∑ i ∈ range (k + 2), v (i - 1) * F i =
      v 0 * F 0 + ∑ i ∈ range (k + 1), v i * F (i + 1) := by
    rw [sum_range_succ']
    simp [add_comm]
  have hup : ∑ i ∈ range (k + 2), v (i + 1) * F i + v 0 * F 0 =
      ∑ i ∈ range (k + 1), v i * F (i - 1) := by
    rw [sum_range_succ' (fun i => v i * F (i - 1)), sum_range_succ, sum_range_succ]
    simp [hz (k + 1) (by omega), hz (k + 1 + 1) (by omega)]
  have hmid : ∑ i ∈ range (k + 2), v i * F i = ∑ i ∈ range (k + 1), v i * F i := by
    rw [sum_range_succ]
    simp [hz (k + 1) (by omega)]
  have hl (a b c d : ℝ) : (a + 2 * b + c) / 4 * d = (a*d + 2*(b*d) + c*d) / 4 := by ring
  have hr (a b c d : ℝ) : a * ((b + 2 * c + d) / 4) = (a*b + 2*(a*c) + a*d) / 4 := by ring
  simp only [foldedStep, hl, hr]
  simp only [div_eq_mul_inv, ← sum_mul, sum_add_distrib, ← mul_sum, hdown, hmid]
  linarith

theorem sum_foldedWeight (k : ℕ) : ∑ i ∈ range (k + 1), foldedWeight k i = 1 := by
  induction k with
  | zero => simp [foldedWeight]
  | succ k ih =>
    have h := foldedStep_sum (foldedWeight k) (fun _ => 1) (fun _ hi => foldedWeight_zero hi)
    norm_num [foldedStep, ih] at h
    exact h

private theorem foldedStep_cos (θ : ℝ) (i : ℕ) :
    foldedStep (fun n => Real.cos ((2 * (n : ℝ) + 1) * θ)) i =
      Real.cos ((2 * (i : ℝ) + 1) * θ) * Real.cos θ ^ 2 := by
  let x := (2 * (i : ℝ) + 1) * θ
  have hlow : Real.cos ((2 * ((i - 1 : ℕ) : ℝ) + 1) * θ) = Real.cos (x - 2 * θ) := by
    cases i with
    | zero => simp [x, show θ - 2 * θ = -θ by ring]
    | succ i =>
      congr 1
      simp [x]
      ring
  have hhigh : (2 * ((i + 1 : ℕ) : ℝ) + 1) * θ = x + 2 * θ := by dsimp [x]; push_cast; ring
  change (_ + 2 * Real.cos x + _) / 4 = Real.cos x * Real.cos θ ^ 2
  dsimp only
  rw [hlow, hhigh, Real.cos_sub, Real.cos_add, Real.cos_two_mul]
  ring

/-- Cosine-power expansion over the positive odd frequencies, with exact nonnegative mass one. -/
theorem cos_odd_pow (θ : ℝ) (k : ℕ) :
    Real.cos θ ^ (2 * k + 1) =
      ∑ i ∈ range (k + 1), foldedWeight k i * Real.cos ((2 * (i : ℝ) + 1) * θ) := by
  induction k with
  | zero => simp [foldedWeight]
  | succ k ih =>
    have h := foldedStep_sum (foldedWeight k) (fun i => Real.cos ((2 * (i : ℝ) + 1) * θ))
      (fun _ hi => foldedWeight_zero hi)
    change _ = ∑ i ∈ range (k + 2), foldedStep (foldedWeight k) i * _
    rw [h]
    simp_rw [foldedStep_cos, ← mul_assoc]
    rw [← sum_mul, ← ih, show 2 * (k + 1) + 1 = (2 * k + 1) + 2 by omega, pow_add]

/-- Lower integer weights with `M` retained frequencies, at common denominator `D`. -/
def foldedCount (M D : ℕ) : ℕ → ℕ → ℕ
  | 0, i => if i = 0 ∧ i < M then D else 0
  | k + 1, i => if i < M then
      (foldedCount M D k (i - 1) + 2 * foldedCount M D k i + foldedCount M D k (i + 1)) / 4
    else 0

/-- Truncating the top frequency and rounding every retained update down preserves a lower bound. -/
theorem foldedCount_le (M D k i : ℕ) : (foldedCount M D k i : ℝ) ≤ D * foldedWeight k i := by
  induction k generalizing i with
  | zero =>
    by_cases hi : i = 0
    · subst i
      simp [foldedCount, foldedWeight]
      split <;> simp
    · simp [foldedCount, foldedWeight, hi]
  | succ k ih =>
    by_cases hi : i < M
    · simp only [foldedCount, hi, ↓reduceIte, foldedWeight, foldedStep]
      refine (Nat.cast_div_le (α := ℝ)).trans ?_
      push_cast
      linarith [ih (i - 1), ih i, ih (i + 1)]
    · simp [foldedCount, hi, mul_nonneg (Nat.cast_nonneg D) (foldedWeight_nonneg (k + 1) i)]

/-- A second downward precision conversion also remains below the exact folded frequency weight. -/
theorem foldedCount_rescale_le (M k i : ℕ) {B H : ℕ} (hB : 0 < B) (hH : 0 < H) :
    ((foldedCount M (B * H) k i / H : ℕ) : ℝ) / B ≤ foldedWeight k i := by
  apply (div_le_iff₀ (Nat.cast_pos.mpr hB : (0 : ℝ) < B)).mpr
  refine (Nat.cast_div_le (α := ℝ)).trans ?_
  apply (div_le_iff₀ (Nat.cast_pos.mpr hH : (0 : ℝ) < H)).mpr
  simpa only [Nat.cast_mul, mul_assoc, mul_comm, mul_left_comm] using foldedCount_le M (B * H) k i


/-- Signed radial coefficients of the odd cosine moment of the actual Gaussian pair. -/
noncomputable def angularRow (t : ℝ) (k n : ℕ) : ℝ :=
  geometricMix (ι := Fin (k + 1)) (fun i => foldedWeight k i)
    (fun i => geometricFirst ((2 * (i : ℝ) + 1) * t))
    (fun i => geometricRatio ((2 * (i : ℝ) + 1) * t)) n

/-- Integrating the finite folded expansion identifies the generating series with
the physical cosine moment on every real correlation, including both endpoints. -/
theorem angularRow_hasSum {r : ℝ} (hrlo : -1 ≤ r) (hrhi : r ≤ 1) (t : ℝ) (k : ℕ) :
    HasSum (fun n => angularRow t k n * (r ^ 2) ^ n)
      (∫ u : ℂ × ℂ, Real.cos (t * (Complex.normSq u.1 + Complex.normSq (mY (r : ℂ) u) - 2)) ^
        (2 * k + 1) ∂mu2) := by
  let s (u : ℂ × ℂ) : ℝ := Complex.normSq u.1 + Complex.normSq (mY (r : ℂ) u) - 2
  let freq (i : Fin (k + 1)) : ℝ := (2 * (i : ℝ) + 1) * t
  let F (a : ℝ) (u : ℂ × ℂ) : ℂ := Complex.exp (Complex.I * a * (s u : ℂ))
  have hint (a : ℝ) : Integrable (F a) mu2 := by
    refine (integrable_const (1 : ℝ)).mono' (by dsimp [F, s, mY]; fun_prop) (ae_of_all _ fun u => ?_)
    simp [F, Complex.norm_exp]
  have hre (a : ℝ) (u : ℂ × ℂ) : (F a u).re = Real.cos (a * s u) := by
    simp [F, Complex.exp_re]
  have hwint (i : Fin (k + 1)) : Integrable (fun u => foldedWeight k i * (F (freq i) u).re) mu2 :=
    ((hint _).re).const_mul _
  have h := hasSum_sum (s := (univ : Finset (Fin (k + 1)))) fun i _ =>
    (selectorRow_hasSum hrlo hrhi (freq i)).mul_left (foldedWeight k i)
  have coeff (n : ℕ) : angularRow t k n * (r ^ 2) ^ n =
      ∑ i : Fin (k + 1), foldedWeight k i *
        (geometricRow (geometricFirst (freq i)) (geometricRatio (freq i)) n * (r ^ 2) ^ n) := by
    simp only [angularRow, geometricMix, sum_mul, mul_assoc, freq]
  simp_rw [coeff]
  convert h using 1
  change (∫ u, Real.cos (t * s u) ^ (2 * k + 1) ∂mu2) =
    ∑ i : Fin (k + 1), foldedWeight k i * (∫ u, F (freq i) u ∂mu2).re
  calc
    _ = ∫ u, ∑ i : Fin (k + 1), foldedWeight k i * (F (freq i) u).re ∂mu2 := by
      apply integral_congr_ae
      filter_upwards [] with u
      simpa only [hre, freq, mul_assoc, ← Fin.sum_univ_eq_sum_range] using cos_odd_pow (t * s u) k
    _ = _ := by
      rw [integral_finsetSum _ (fun i _ => hwint i)]
      refine sum_congr rfl fun i _ => ?_
      rw [integral_const_mul]
      congr 1
      exact integral_re (hint _)

/-- Unit Wiener budget for every scalar phase grade, before any frequency or grade cutoff. -/
theorem angularRow_wienerBound (t : ℝ) (k : ℕ) : WienerBound (angularRow t k) 1 := by
  have h := geometricMix_tail (ι := Fin (k + 1)) (fun i => foldedWeight_nonneg k i)
    (fun i => norm_geometricRatio_lt_one ((2 * (i : ℝ) + 1) * t))
    (fun i => norm_geometricFirst_eq ((2 * (i : ℝ) + 1) * t)) 0
  simpa only [angularRow, WienerBound, Nat.add_zero, pow_zero, mul_one, Fin.sum_univ_eq_sum_range,
    sum_foldedWeight] using h


/-- The frequency subweights retained after fixed-point iteration and a second precision cut. -/
noncomputable def roundedWeight (M B H k i : ℕ) : ℝ :=
  ((foldedCount M (B * H) k i / H : ℕ) : ℝ) / B

/-- Full Wiener error of the physical odd cosine grade after frequency truncation and
downward rounding at both precisions. Only the finite head approximation remains an input. -/
theorem angularRow_truncation (t : ℝ) (k J M : ℕ) {B H : ℕ} (hB : 0 < B) (hH : 0 < H)
    (approx : ℕ → ℝ) {ε : ℝ}
    (hhead : ∀ n < J, |geometricMix (ι := Fin (k + 1)) (fun i => roundedWeight M B H k i)
      (fun i => geometricFirst ((2 * (i : ℝ) + 1) * t))
      (fun i => geometricRatio ((2 * (i : ℝ) + 1) * t)) n - approx n| ≤ ε)
    (hzero : ∀ n, J ≤ n → approx n = 0) :
    WienerBound (fun n => angularRow t k n - approx n)
      (1 - ∑ i : Fin (k + 1), roundedWeight M B H k i +
        ∑ i : Fin (k + 1), roundedWeight M B H k i *
          ((((2 * (i : ℝ) + 1) * t) ^ 2) / (1 + ((2 * (i : ℝ) + 1) * t) ^ 2)) ^ J +
        J * ε) := by
  have hmass : ∑ i : Fin (k + 1), foldedWeight k i = 1 := by
    rw [Fin.sum_univ_eq_sum_range, sum_foldedWeight]
  exact selectorMix_truncation (fun i : Fin (k + 1) => (2 * (i : ℝ) + 1) * t)
    (fun i => div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _))
    (fun i => foldedCount_rescale_le M k i hB hH) hmass J approx hhead hzero

end Haagerup.AngularSelector
