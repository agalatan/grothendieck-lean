import Grothe.Upper.Selector.FourierGrid
import Grothe.Upper.Selector.Cosine

set_option warningAsError true

/-!
# Certified raw angular rows

The computed Fourier moments are averaged with a downward-rounded frequency row
and the signed result is floored once. Integer division also gives an upper
bound for each omitted geometric series. Together these operations account for
the entire absolutely summable coefficient error of a physical cosine grade.

Agent-ID: codex-a7c4
-/

namespace Grothe.Upper.Selector.RawRow

open Finset FourierGrid

/-- A compact row of lower frequency counts, advanced on the retained finite interval. -/
def nextCounts (M : ℕ) (v : Array ℕ) : Array ℕ :=
  Array.ofFn fun i : Fin M =>
    (v.getD (i - 1 : ℕ) 0 + 2 * v.getD i 0 + v.getD (i + 1 : ℕ) 0) / 4

def countRow (M D : ℕ) : ℕ → Array ℕ
  | 0 => Array.ofFn fun i : Fin M => if i.val = 0 then D else 0
  | k+1 => nextCounts M (countRow M D k)

theorem countRow_get (M D k i : ℕ) : (countRow M D k).getD i 0 = foldedCount M D k i := by
  induction k generalizing i with
  | zero =>
    by_cases h : i < M <;> simp [countRow, foldedCount, h]
  | succ k ih =>
    by_cases h : i < M
    · simpa only [foldedCount, h, ↓reduceIte, ← ih] using
        (show (countRow M D (k+1)).getD i 0 =
          ((countRow M D k).getD (i-1) 0 + 2 * (countRow M D k).getD i 0 +
            (countRow M D k).getD (i+1) 0) / 4 by
          simp [countRow, nextCounts, h])
    · simp [countRow, nextCounts, foldedCount, h]

def count (M k i : ℕ) : ℕ := (countRow M (2^50) k).getD i 0 / 2^24

private theorem count_eq (M k i : ℕ) : count M k i = foldedCount M (2^26 * 2^24) k i / 2^24 := by
  rw [count, countRow_get]
  rfl

private theorem count_zero {M i : ℕ} (hi : M ≤ i) (k : ℕ) : count M k i = 0 := by
  rw [count_eq]
  cases k <;> simp [foldedCount, not_lt.mpr hi]

noncomputable def weight (M k i : ℕ) : ℝ := (count M k i : ℝ) / 2^26

private theorem weight_eq (M k i : ℕ) : weight M k i = roundedWeight M (2^26) (2^24) k i := by
  norm_num [weight, count_eq, roundedWeight]

private theorem weight_nonneg (M k i : ℕ) : 0 ≤ weight M k i := by unfold weight; positivity

private theorem weight_le (M k i : ℕ) : weight M k i ≤ foldedWeight k i := by
  rw [weight_eq]
  exact foldedCount_rescale_le _ _ _ (by norm_num) (by norm_num)

private theorem weight_sum_le (M k : ℕ) : ∑ i : Fin (k+1), weight M k i ≤ 1 := by
  rw [← sum_foldedWeight k, ← Fin.sum_univ_eq_sum_range]
  exact sum_le_sum fun i _ => weight_le M k i

/-- Upper integer bound, at denominator `2^24`, on the omitted geometric mass. -/
def tailCeil (m J : ℕ) : ℤ :=
  -((-(2^24 * (freqNum m ^ 2)^J)) / ((10000 + freqNum m ^ 2)^J))

theorem tailCeil_upper (m J : ℕ) :
    (((m : ℝ) * (17/100)) ^ 2 / (1 + ((m : ℝ) * (17/100)) ^ 2)) ^ J ≤
      (tailCeil m J : ℝ) / 2^24 := by
  let v := freqNum m
  have hv : (m : ℝ) * (17/100) = (v : ℝ)/100 := by dsimp [v, freqNum]; push_cast; ring
  have hd : (0 : ℤ) < (10000 + v ^ 2)^J := by positivity
  have hd' : (0 : ℝ) < (10000 + (v : ℝ)^2)^J := by positivity
  have hq : ((v : ℝ)/100)^2 / (1 + ((v : ℝ)/100)^2) = (v : ℝ)^2/(10000+(v : ℝ)^2) := by
    field_simp
    ring
  rw [hv, hq, div_pow]
  apply (le_div_iff₀ (by norm_num : (0 : ℝ) < 2^24)).mpr
  rw [div_mul_eq_mul_div, div_le_iff₀ hd']
  have he := Int.ediv_mul_le (-(2^24*(v^2)^J)) hd.ne'
  have he' : (((-(2^24*(v^2)^J) / (10000 + v^2)^J : ℤ) : ℝ)) * (10000 + (v : ℝ)^2)^J ≤
       -(2^24 * ((v : ℝ)^2)^J) := by exact_mod_cast he
  change _ ≤ ((-((-(2^24*(v^2)^J))/(10000+v^2)^J) : ℤ):ℝ) * _
  push_cast
  linarith

/-- Dot product of one integer frequency row with one computed Fourier column. -/
def dot (M k j : ℕ) : ℤ := ∑ i ∈ range (min (k+1) M), (count M k i : ℤ) * output (2*i+1) j

private theorem dot_eq (M k j : ℕ) :
    dot M k j = ∑ i : Fin (k+1), (count M k i : ℤ) * output (2*i+1) j := by
  rw [dot, Fin.sum_univ_eq_sum_range (fun i => (count M k i : ℤ) * output (2*i+1) j)]
  apply sum_subset (range_mono (min_le_left _ _))
  intro i hi hdrop
  simp only [mem_range, lt_min_iff, not_and] at hi hdrop
  simp [count_zero (le_of_not_gt (hdrop hi))]

def raw (M k j : ℕ) : ℤ := dot M k j / 2^29

/-- Exact row-head coefficient, in common denominator `2^31`, and zero beyond the chosen cutoff. -/
noncomputable def approx (M k J j : ℕ) : ℝ := if j < J then (raw M k j : ℝ) / 2^31 else 0


private theorem dot_decode (M k j : ℕ) :
    ∑ i : Fin (k+1), weight M k i * ((output (2*i+1) j : ℝ) / 2^34) =
      (dot M k j : ℝ) / 2^60 := by
  rw [dot_eq, Int.cast_sum]
  have h (i : Fin (k+1)) : weight M k i * ((output (2*i+1) j : ℝ) / 2^34) =
      ((((count M k i : ℤ) * output (2*i+1) j : ℤ) : ℝ)) * (2^60)⁻¹ := by
    simp only [weight, Int.cast_mul, Int.cast_natCast]
    ring
  simp only [h, ← sum_mul]
  rw [div_eq_mul_inv]

private theorem raw_floor_error (M k j : ℕ) :
    |(dot M k j : ℝ)/2^60 - (raw M k j : ℝ)/2^31| ≤ 1/2^31 := by
  have he : (dot M k j : ℝ)/2^60 - (raw M k j : ℝ)/2^31 =
      ((dot M k j : ℝ)/((2^29 : ℤ) : ℝ)-((dot M k j / 2^29 : ℤ):ℝ))/2^31 := by
    simp only [raw, Int.cast_pow, Int.cast_ofNat]
    ring
  rw [he, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 2^31)]
  exact div_le_div_of_nonneg_right (ediv_error _ (by norm_num)) (by norm_num)

/-- Pointwise enclosure of each retained raw coefficient, including the final signed dot-product floor. -/
theorem raw_head_error (M k j : ℕ) (hM : M ≤ 220) (hj : j < 1600) :
    |geometricMix (ι := Fin (k+1)) (fun i => weight M k i)
        (fun i => geometricFirst ((2 * (i : ℝ) + 1) * (17/100)))
        (fun i => geometricRatio ((2 * (i : ℝ) + 1) * (17/100))) j -
      (raw M k j : ℝ) / 2^31| ≤ 2/2^34 + 1/2^31 := by
  let g (i : Fin (k+1)) := geometricRow (geometricFirst ((2 * (i : ℝ) + 1) * (17/100)))
    (geometricRatio ((2 * (i : ℝ) + 1) * (17/100))) j
  let obs (i : Fin (k+1)) := (output (2*i+1) j : ℝ)/2^34
  have hweight (i : Fin (k+1)) : |weight M k i * (g i - obs i)| ≤ weight M k i * (2/2^34) := by
    by_cases hi : (i : ℕ) < M
    · rw [abs_mul, abs_of_nonneg (weight_nonneg _ _ _)]
      apply mul_le_mul_of_nonneg_left _ (weight_nonneg _ _ _)
      have he := output_error_head (m := 2*(i:ℕ)+1) (j := j) (by omega) hj
      simpa only [g, obs, geometricRow, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat, Nat.cast_one] using he
    · simp [weight, count_zero (le_of_not_gt hi)]
  have he : |(∑ i : Fin (k+1), weight M k i * g i) - ∑ i : Fin (k+1), weight M k i * obs i| ≤ 2/2^34 := by
    rw [← sum_sub_distrib]
    simp_rw [← mul_sub]
    refine ((abs_sum_le_sum_abs _ _).trans (sum_le_sum fun i _ => hweight i)).trans ?_
    rw [← sum_mul]
    exact mul_le_of_le_one_left (by norm_num) (weight_sum_le M k)
  have hd : (∑ i : Fin (k+1), weight M k i * obs i) = (dot M k j : ℝ) / 2^60 := dot_decode M k j
  rw [hd] at he
  exact (abs_sub_le _ ((dot M k j : ℝ)/2^60) _).trans (add_le_add he (raw_floor_error M k j))

/-- The whole physical raw row is approximated by executable integers at `2^31`
with the computed missing-frequency and geometric-tail charges. -/
theorem raw_wienerBound (M k J : ℕ) (hM : M ≤ 220) (hJ : J ≤ 1600) :
    WienerBound (fun n => angularRow (17/100) k n - approx M k J n)
      (1 - ∑ i : Fin (k+1), weight M k i +
        ∑ i : Fin (k+1), weight M k i * ((tailCeil (2*i+1) J : ℝ) / 2^24) +
        J * (2/2^34 + 1/2^31)) := by
  have h := angularRow_truncation (17/100) k J M (B := 2^26) (H := 2^24)
    (by norm_num) (by norm_num) (approx M k J) (ε := 2/2^34 + 1/2^31)
    (fun n hn => by
      simpa only [← weight_eq, approx, hn, ↓reduceIte] using raw_head_error M k n hM (hn.trans_le hJ))
    (fun n hn => by simp [approx, not_lt.mpr hn])
  simp only [← weight_eq] at h
  refine ⟨h.1, h.2.trans (add_le_add (add_le_add le_rfl (sum_le_sum fun i _ => ?_)) le_rfl)⟩
  apply mul_le_mul_of_nonneg_left _ (weight_nonneg _ _ _)
  simpa only [Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_ofNat] using tailCeil_upper (2*i.val+1) J

end Grothe.Upper.Selector.RawRow
