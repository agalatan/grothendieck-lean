import Grothe.UpperSelector.RawRow

set_option warningAsError true

/-!
# Array implementation of the signed angular row table

Each retained frequency is advanced one radial power at a time, and each grade
advances the frequency weights one step. The executable constructors expose their
row state so certificate computations may consume the table incrementally.

Agent-ID: codex-a7c4
-/

namespace Haagerup.AngularSelector.RawTable

open Finset FourierGrid RawRow

private theorem getD_push_lt {α : Type*} (xs : Array α) (v deflt : α) {i : ℕ} (hi : i < xs.size) :
    (xs.push v).getD i deflt = xs.getD i deflt := by
  simp [Array.getD_eq_getD_getElem?, Array.getElem?_push_lt hi, hi]

private theorem getD_push_last {α : Type*} (xs : Array α) (v deflt : α) {i : ℕ} (hi : i = xs.size) :
    (xs.push v).getD i deflt = v := by subst i; simp

/-- State after generating `J` signed coefficients of the `m`th Gaussian Fourier series. -/
def momentPrefix (m : ℕ) : ℕ → Pair × Array Int
  | 0 => (start m, #[])
  | J+1 =>
    let prev := momentPrefix m J
    (mulDiv prev.1 (ratioNum m) (denom m), prev.2.push (prev.1.re / 2^26))

private theorem momentPrefix_last (m J : ℕ) : (momentPrefix m J).1 = moment m J := by
  induction J with
  | zero => rfl
  | succ J ih => simp [momentPrefix, moment, ih]

@[simp] theorem momentPrefix_size (m J : ℕ) : (momentPrefix m J).2.size = J := by
  induction J with
  | zero => rfl
  | succ J ih => simp [momentPrefix, ih]

theorem momentPrefix_get {j J : ℕ} (hj : j < J) (m : ℕ) :
    (momentPrefix m J).2.getD j 0 = output m j := by
  induction J generalizing j with
  | zero => omega
  | succ J ih =>
    change ((momentPrefix m J).2.push ((momentPrefix m J).1.re / 2^26)).getD j 0 = _
    by_cases h : j < J
    · rw [getD_push_lt _ _ _ (by simpa using h)]
      exact ih h
    · have h' : j = J := by omega
      subst j
      rw [getD_push_last _ _ _ (by simp), momentPrefix_last]
      rfl

/-- A column is contiguous in memory for the retained-frequency dot products in each grade. -/
def momentColumns (M J : ℕ) : Array (Array Int) :=
  let frequencies := Array.ofFn fun i : Fin M => (momentPrefix (2*i+1) J).2
  Array.ofFn fun j : Fin J => Array.ofFn fun i : Fin M =>
    (frequencies.getD i #[]).getD j 0

theorem momentColumns_get {M i j J : ℕ} (hi : i < M) (hj : j < J) :
    ((momentColumns M J).getD j #[]).getD i 0 = output (2*i+1) j := by
  simpa [momentColumns, hi, hj] using momentPrefix_get hj (2*i+1)

/-- A raw row using shared working counts and the already computed Fourier columns. -/
def row (M J k : ℕ) (counts : Array ℕ) (cols : Array (Array Int)) : Array Int :=
  let rounded : Array ℕ := counts.map (fun n : ℕ => n / 2^24)
  Array.ofFn fun j : Fin J =>
    let column := cols.getD j #[]
    (∑ i ∈ range (min (k+1) M), (rounded.getD i 0 : Int) * column.getD i 0) / 2^29

theorem row_get {M j J : ℕ} (hj : j < J) (k : ℕ) :
    (row M J k (countRow M (2^50) k) (momentColumns M J)).getD j 0 = raw M k j := by
  simp only [row, Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hj, ↓reduceDIte, Option.getD_some]
  rw [raw, dot]
  congr 1
  apply sum_congr rfl
  intro i hi
  have him : i < M := (lt_min_iff.mp (mem_range.mp hi)).2
  simp only [← Array.getD_eq_getD_getElem?, momentColumns_get him hj]
  unfold count
  congr 2
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map]
  cases (countRow M (2^50) k)[i]? <;> rfl

/-- Advance the frequency counts once per grade, saving whatever the consumer emits. -/
def gradePrefix {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → α) : ℕ → Array ℕ × Array α
  | 0 => (countRow M (2^50) 0, #[])
  | K+1 =>
    let prev := gradePrefix M emit K
    (nextCounts M prev.1, prev.2.push (emit K prev.1))

theorem gradePrefix_counts {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → α) (K : ℕ) :
    (gradePrefix M emit K).1 = countRow M (2^50) K := by
  induction K with
  | zero => simp only [gradePrefix]
  | succ K ih => simp [gradePrefix, countRow, ih]

@[simp] theorem gradePrefix_size {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → α) (K : ℕ) :
    (gradePrefix M emit K).2.size = K := by
  induction K with
  | zero => simp only [gradePrefix, Array.size_empty]
  | succ K ih => simp [gradePrefix, ih]

theorem gradePrefix_get {α : Type*} (M : ℕ) (emit : ℕ → Array ℕ → α) (d : α)
    {k K : ℕ} (hk : k < K) :
    (gradePrefix M emit K).2.getD k d = emit k (countRow M (2^50) k) := by
  induction K generalizing k with
  | zero => omega
  | succ K ih =>
    change ((gradePrefix M emit K).2.push (emit K (gradePrefix M emit K).1)).getD k d = _
    by_cases h : k < K
    · rw [getD_push_lt _ _ _ (by simpa using h)]
      exact ih h
    · have h' : k = K := by omega
      subst k
      rw [getD_push_last _ _ _ (by simp), gradePrefix_counts]

/-- Generate `K` raw frequency-averaged grades of `J` coefficients, with no external data. -/
def table (M K J : ℕ) : Array (Array Int) :=
  let cols := momentColumns M J
  (gradePrefix M (fun k counts => row M J k counts cols) K).2

theorem table_get {M k j K J : ℕ} (hk : k < K) (hj : j < J) :
    ((table M K J).getD k #[]).getD j 0 = raw M k j := by
  simp only [table, gradePrefix_get _ _ _ hk, row_get hj]

/-- Upper geometric-tail numerators are computed only once for all scalar grades. -/
def tailRow (M J : ℕ) : Array Int := Array.ofFn fun i : Fin M => tailCeil (2*i+1) J

/-- Raw Wiener allowance in denominator `2^50`. The last term pays for the two dot-product
roundings, and the signed sum gives the missing frequency mass plus the positive tail. -/
def charge (M J k : ℕ) (counts : Array ℕ) (tails : Array Int) : Int :=
  2^50 + (∑ i ∈ range (min (k+1) M), ((counts.getD i 0 / 2^24 : ℕ) : Int) *
    (tails.getD i 0 - 2^24)) + J * 10 * 2^16

theorem charge_eq (M J k : ℕ) :
    (charge M J k (countRow M (2^50) k) (tailRow M J) : ℝ) / 2^50 =
      1 - ∑ i : Fin (k+1), weight M k i +
        ∑ i : Fin (k+1), weight M k i * ((tailCeil (2*i+1) J : ℝ) / 2^24) +
        J * (2/2^34 + 1/2^31) := by
  let summand (i : ℕ) : ℤ := (count M k i : ℤ) * (tailCeil (2*i+1) J-2^24)
  have hfull : ∑ i ∈ range (min (k+1) M), summand i = ∑ i : Fin (k+1), summand i := by
    rw [Fin.sum_univ_eq_sum_range]
    apply sum_subset (range_mono (min_le_left _ _))
    intro i hi hdrop
    have him : M ≤ i := by simp only [mem_range, lt_min_iff] at hi hdrop; omega
    have hz : count M k i = 0 := by
      unfold count
      have hs : (countRow M (2^50) k).size = M := by cases k <;> simp [countRow, nextCounts]
      rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_none (hs.trans_le him)]
      rfl
    simp [summand, hz]
  have hc : charge M J k (countRow M (2^50) k) (tailRow M J) =
      2^50 + (∑ i : Fin (k+1), summand i) + J * 10 * 2^16 := by
    rw [← hfull, charge]
    congr 2
    exact sum_congr rfl fun i hi => by
      have him : i < M := (lt_min_iff.mp (mem_range.mp hi)).2
      simp [summand, count, tailRow, him]
  rw [hc]
  push_cast
  have term (i : Fin (k+1)) : (summand i : ℝ) =
      2^50 * (weight M k i * ((tailCeil (2*i+1) J : ℝ)/2^24) - weight M k i) := by
    simp only [summand, weight, Int.cast_mul, Int.cast_natCast, Int.cast_sub, Int.cast_pow, Int.cast_ofNat]
    ring
  simp only [term, ← mul_sum, sum_sub_distrib]
  ring

/-- All finite row and charge data in one pass with a shared integer working row. -/
def rowsAndCharges (M K J : ℕ) : Array (Array Int × Int) :=
  let cols := momentColumns M J
  let tails := tailRow M J
  (gradePrefix M (fun k counts => (row M J k counts cols, charge M J k counts tails)) K).2

/-- The computed row with its computed allowance bounds the complete physical moment series. -/
theorem rowsAndCharges_sound {M K J k : ℕ} (hk : k < K) (hM : M ≤ 220) (hJ : J ≤ 1600) :
    let entry := (rowsAndCharges M K J).getD k (#[], 0)
    WienerBound (fun n => angularRow (17/100) k n -
      (if n < J then (entry.1.getD n 0 : ℝ)/2^31 else 0)) ((entry.2 : ℝ)/2^50) := by
  simp only [rowsAndCharges, gradePrefix_get _ _ _ hk, charge_eq]
  have ha (n : ℕ) :
      (if n < J then ((row M J k (countRow M (2^50) k) (momentColumns M J)).getD n 0 : ℝ)/2^31 else 0) =
        approx M k J n := by
    by_cases hn : n < J
    · simp only [approx, hn, ↓reduceIte, row_get hn]
    · simp [approx, hn]
  simp only [ha]
  exact raw_wienerBound M k J hM hJ

end Haagerup.AngularSelector.RawTable
