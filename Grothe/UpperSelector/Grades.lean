import Grothe.UpperSelector.Binomial
import Grothe.UpperSelector.PhaseMass
import Grothe.UpperSelector.RawTable
import Grothe.UpperSelector.Entry

/-!
# Fully integer preprocessed scalar grades

The signed binomial weights have denominator 2²⁸ and each raw coefficient has
denominator 2³¹. Keeping their convolution at denominator 2⁵⁹ avoids another
rounding step. The raw and lost-preprocessor masses share denominator 2⁵⁰.
-/

open Finset

set_option warningAsError true

namespace Haagerup.AngularSelector.Certificate

private def polyCount (a : Array ℕ) (i : ℕ) : ℕ := a.getD i 0 / 2^22

private def signedCount (a : Array ℕ) (i : ℕ) : ℤ := (-1 : ℤ) ^ i * polyCount a i

/-- Exact integer convolution with a finite raw row. -/
def convNum (M J : ℕ) (a : Array ℕ) (raw : Array Int) (n : ℕ) : Int :=
  ∑ i ∈ range (min (n+1) M), signedCount a i * (if n-i < J then raw.getD (n-i) 0 else 0)

private def polyCharge (M : ℕ) (a : Array ℕ) : Int :=
  2^50 - (∑ i ∈ range M, (polyCount a i : Int)) * 2^22

private def writeGrade (M J : ℕ) (a : Array ℕ) (mass : ℕ) (raw : Array Int × Int) : Grade :=
  { weight := mass / 2^30
    row := Array.ofFn fun j : Fin (J + M) => convNum M J a raw.1 j
    error := raw.2 + polyCharge M a }

private def stream {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → ℕ → α) : ℕ → (Array ℕ × ℕ) × Array α
  | 0 => ((polynomialCountRow M (2^50) 0, phaseMassCount (2^60) 0), #[])
  | K + 1 =>
    let prev := stream M emit K
    ((nextPolynomialCounts M prev.1.1, prev.1.2 * (2*K+1)^2 / (4*(K+1)*(K+2))),
      prev.2.push (emit K prev.1.1 prev.1.2))

private theorem stream_state {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → ℕ → α) (K : ℕ) :
    (stream M emit K).1 = (polynomialCountRow M (2^50) K, phaseMassCount (2^60) K) := by
  induction K with
  | zero => rfl
  | succ K ih => simp [stream, ih, polynomialCountRow, phaseMassCount]

@[simp] private theorem stream_size {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → ℕ → α) (K : ℕ) :
    (stream M emit K).2.size = K := by
  induction K with
  | zero => rfl
  | succ K ih => simp [stream, ih]

private theorem stream_get {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → ℕ → α) (d : α)
    {k K : ℕ} (hk : k < K) :
    (stream M emit K).2.getD k d =
      emit k (polynomialCountRow M (2^50) k) (phaseMassCount (2^60) k) := by
  induction K generalizing k with
  | zero => omega
  | succ K ih =>
    change ((stream M emit K).2.push (emit K (stream M emit K).1.1 (stream M emit K).1.2)).getD k d = _
    by_cases h : k < K
    · have hl : k < (stream M emit K).2.size := by simpa using h
      have hpush (xs : Array α) (v : α) {i : ℕ} (hi : i < xs.size) :
          (xs.push v).getD i d = xs.getD i d := by
        simp [Array.getD_eq_getD_getElem?, Array.getElem?_push_lt hi, hi]
      rw [hpush _ _ hl]
      exact ih h
    · have hh : k = K := by omega
      subst k
      have hh (xs : Array α) (v : α) {i : ℕ} (hi : i = xs.size) : (xs.push v).getD i d = v := by
        subst i; simp
      rw [hh _ _ (by simp), stream_state]

/-- All scalar phase grades below K; the frequency, radial, and polynomial cutoffs are exclusive. -/
def grades (F K J M : ℕ) : Array Grade :=
  let raw := RawTable.rowsAndCharges F K J
  (stream M (fun k a mass => writeGrade M J a mass (raw.getD k (#[], 0))) K).2

@[simp] theorem grades_size (F K J M : ℕ) : (grades F K J M).size = K := by simp [grades]

theorem grades_row_size {F K J M k : ℕ} (hk : k < K) :
    ((grades F K J M).getD k default).row.size = J + M := by
  simp [grades, stream_get _ _ _ hk, writeGrade]

private theorem polyCount_eq (M k i : ℕ) : polyCount (polynomialCountRow M (2^50) k) i =
    polynomialNumerator M (2^28) (2^22) k i := by
  rw [polyCount, polynomialCountRow_get]
  rfl

private theorem signed_decode (M k i : ℕ) :
    ((if i < M then signedCount (polynomialCountRow M (2^50) k) i else 0 : ℤ) : ℝ) / 2^28 =
      clippedPolynomial M (2^28) (2^22) k i := by
  by_cases hi : i < M
  · simp only [hi, ↓reduceIte, signedCount, Int.cast_mul, Int.cast_pow, Int.cast_neg, Int.cast_one,
      Int.cast_natCast, clippedPolynomial, polyCount_eq, Nat.cast_pow, Nat.cast_ofNat]
    ring
  · simp [hi, clippedPolynomial]

private noncomputable def rawValue (raw : Array Int) (J j : ℕ) : ℝ :=
  if j < J then (raw.getD j 0 : ℝ) / 2^31 else 0

private theorem conv_decode (M J k n : ℕ) (raw : Array Int) :
    (convNum M J (polynomialCountRow M (2^50) k) raw n : ℝ) / 2^59 =
      wienerConv (clippedPolynomial M (2^28) (2^22) k) (rawValue raw J) n := by
  let a := polynomialCountRow M (2^50) k
  let term (i : ℕ) : ℤ := (if i < M then signedCount a i else 0) *
    (if n - i < J then raw.getD (n - i) 0 else 0)
  have hex : convNum M J a raw n = ∑ i ∈ range (n+1), term i := by
    calc
      _ = ∑ i ∈ range (min (n+1) M), term i := by
        apply sum_congr rfl
        intro i hi
        simp only [term, (lt_min_iff.mp (mem_range.mp hi)).2, ↓reduceIte]
      _ = _ := sum_subset (range_mono (min_le_left _ _)) fun i hi hni => by
        have hbig : ¬ i < M := fun h => hni (mem_range.mpr (lt_min (mem_range.mp hi) h))
        simp [term, hbig]
  rw [show polynomialCountRow M (2^50) k = a from rfl, hex, Int.cast_sum, sum_div, wienerConv]
  refine sum_congr rfl fun i _ => ?_
  rw [← signed_decode]
  dsimp only [term, rawValue, a]
  by_cases hi : i < M <;> by_cases hj : n - i < J <;> simp [hi, hj]; ring

private theorem conv_zero (M J n : ℕ) (a : Array ℕ) (raw : Array Int) (hn : J+M ≤ n) :
    convNum M J a raw n = 0 := by
  apply sum_eq_zero
  intro i hi
  have hh := (lt_min_iff.mp (mem_range.mp hi)).2
  have hj : ¬ n - i < J := by omega
  simp [hj]

private theorem polyCharge_decode (M k : ℕ) :
    (polyCharge M (polynomialCountRow M (2^50) k) : ℝ) / 2^50 =
      1 - ∑ i ∈ range M, (polynomialNumerator M (2^28) (2^22) k i : ℝ) / 2^28 := by
  simp only [polyCharge, Int.cast_sub, Int.cast_pow, Int.cast_ofNat, Int.cast_mul, Int.cast_sum,
    Int.cast_natCast, polyCount_eq, ← sum_div]
  ring

/-- The computed grade weights are submasses. Its signed row and integer charge certify
the entire preprocessed moment series. Only the preset Fourier grid cutoffs are bounded. -/
theorem grades_sound {F K J M k : ℕ} (hk : k < K) (hF : F ≤ 220) (hJ : J ≤ 1600) :
    let g := (grades F K J M).getD k default
    (g.weight : ℝ) / 2^30 ≤ haagCoeff k ∧
    WienerBound (fun n => preprocessedRow linearPreprocessor (17/100) k n - (g.row.getD n 0 : ℝ)/2^59)
      ((g.error : ℝ)/2^50) := by
  let raw := (RawTable.rowsAndCharges F K J).getD k (#[], 0)
  let a := polynomialCountRow M (2^50) k
  let mass := phaseMassCount (2^60) k
  change _ ∧ _
  simp only [grades, stream_get _ _ _ hk]
  constructor
  · simpa only [writeGrade, phaseMassWeight, show (2^30 * 2^30 : ℕ) = 2^60 by decide,
      Nat.cast_pow, Nat.cast_ofNat] using
      phaseMassWeight_le (by norm_num : 0 < 2^30) (by norm_num : 0 < 2^30) k
  · have hraw : WienerBound (fun n => angularRow (17/100) k n - rawValue raw.1 J n) ((raw.2 : ℝ)/2^50) :=
      RawTable.rowsAndCharges_sound hk hF hJ
    have h := preprocessedRow_error M k (by norm_num : 0 < 2^28) (by norm_num : 0 < 2^22) _ _ hraw
    have hc (n : ℕ) : ((writeGrade M J a mass raw).row.getD n 0 : ℝ)/2^59 =
        wienerConv (clippedPolynomial M (2^28) (2^22) k) (rawValue raw.1 J) n := by
      rw [← conv_decode]
      by_cases hn : n < J+M
      · simp [writeGrade, hn, a]
      · simp [writeGrade, hn, conv_zero _ _ _ _ _ (Nat.le_of_not_gt hn), a]
    have he : (((writeGrade M J a mass raw).error : ℤ) : ℝ)/2^50 =
        (raw.2 : ℝ)/2^50 + (1 - ∑ i ∈ range M, (polynomialNumerator M (2^28) (2^22) k i : ℝ) / 2^28) := by
      rw [← polyCharge_decode]
      simp only [writeGrade, a, Int.cast_add, add_div]
    change WienerBound (fun n => preprocessedRow linearPreprocessor (17/100) k n -
      ((writeGrade M J a mass raw).row.getD n 0 : ℝ)/2^59) (((writeGrade M J a mass raw).error : ℝ)/2^50)
    rw [he]
    simpa only [hc, Nat.cast_pow, Nat.cast_ofNat] using h

end Haagerup.AngularSelector.Certificate
