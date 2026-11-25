import Grothe.UpperSelector.Entry
import Grothe.UpperSelector.Aggregation

set_option warningAsError true

/-!
# Exact weighted angular column

A scalar grade of weight in denominator `2^30` multiplies a signed row in
denominator `2^59`, then shifts it by its grade. Its error is in denominator
`2^50`. The head and final error, including the absolute tail after any chosen
cutoff, therefore have the common denominator `2^89`.

Agent-ID: codex-a7c4
-/

namespace Haagerup.AngularSelector.Certificate

open Finset

/-- All signed coefficients before discarding the computed tail. `K` is the
exclusive grade cutoff and `L` bounds the length of every stored grade row. -/
def signedColumn (G : Array Grade) (K L : ℕ) : Array Int :=
  Array.ofFn fun n : Fin (K+L) =>
    ∑ k ∈ range (min (n.val+1) K),
      let g := G.getD k default
      (g.weight : Int) * g.row.getD (n.val-k) 0

/-- Missing scalar mass plus the weighted per-grade error, in denominator `2^80`. -/
def scalarCharge (G : Array Grade) (K : ℕ) : Int :=
  2^80 + ∑ k ∈ range K, let g := G.getD k default; (g.weight : Int) * (g.error - 2^50)

/-- Sum of absolute integer coefficients discarded past an exclusive head cutoff. -/
def tailCharge (a : Array Int) (H : ℕ) : Int :=
  ∑ n ∈ range (a.size-H), |a.getD (n+H) 0|

/-- The signed stored head and its single full Wiener allowance, both in denominator `2^89`. -/
structure Column where
  head : Array Int
  allowance : Int
  deriving Inhabited

def buildColumn (G : Array Grade) (K L H : ℕ) : Column :=
  let a := signedColumn G K L
  ⟨Array.ofFn (fun i : Fin H => a.getD i 0), 2^9 * scalarCharge G K + tailCharge a H⟩

@[simp] theorem signedColumn_size (G : Array Grade) (K L : ℕ) : (signedColumn G K L).size = K+L := by
  simp [signedColumn]

private theorem sum_prefixMin (f : ℕ → ℤ) (n K : ℕ) :
    ∑ k ∈ range (min (n+1) K), f k = ∑ k ∈ range (n+1), if k < K then f k else 0 := by
  rw [← sum_filter]
  congr 1
  ext i
  simp [lt_min_iff]

private theorem signedColumn_get (G : Array Grade) (K L n : ℕ)
    (hlen : ∀ k < K, (G.getD k default).row.size ≤ L) :
    (signedColumn G K L).getD n 0 =
      ∑ k ∈ range (n+1), if k < K then
        ((G.getD k default).weight : ℤ) * (G.getD k default).row.getD (n-k) 0 else 0 := by
  by_cases h : n < K+L
  · simp only [signedColumn, Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, h, ↓reduceDIte, Option.getD_some]
    exact sum_prefixMin _ n K
  · have hz : (signedColumn G K L)[n]? = none := Array.getElem?_eq_none (by simpa using le_of_not_gt h)
    rw [Array.getD_eq_getD_getElem?, hz, Option.getD_none]
    symm
    apply sum_eq_zero
    intro k _
    by_cases hk : k < K
    · have hlen' : (G.getD k default).row.size ≤ n-k := (hlen k hk).trans (by omega)
      have hzero : (G.getD k default).row.getD (n-k) 0 = 0 := by
        rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_none hlen', Option.getD_none]
      simp only [hk, ↓reduceIte, hzero, mul_zero]
    · simp [hk]

private theorem signedColumn_value (G : Array Grade) (K L n : ℕ)
    (hlen : ∀ k < K, (G.getD k default).row.size ≤ L) :
    ((signedColumn G K L).getD n 0 : ℝ) / 2^89 =
      gradeSeries (fun k j => if k < K then
        ((G.getD k default).weight : ℝ)/2^30 * (((G.getD k default).row.getD j 0 : ℤ):ℝ)/2^59
        else 0) n := by
  rw [signedColumn_get G K L n hlen, Int.cast_sum, div_eq_mul_inv, sum_mul]
  apply sum_congr rfl
  intro k _
  by_cases hk : k < K
  · simp only [hk, ↓reduceIte, Int.cast_mul, Int.cast_natCast]
    ring
  · simp [hk]

private theorem scalarCharge_value (G : Array Grade) (K : ℕ) :
    (scalarCharge G K : ℝ)/2^80 =
      1 - ∑ k ∈ range K, ((G.getD k default).weight : ℝ)/2^30 +
        ∑ k ∈ range K, ((G.getD k default).weight : ℝ)/2^30 * ((G.getD k default).error : ℝ)/2^50 := by
  simp only [scalarCharge, Int.cast_add, Int.cast_sum, Int.cast_mul, Int.cast_natCast, Int.cast_sub,
    Int.cast_pow, Int.cast_ofNat]
  have he (k : ℕ) : ((G.getD k default).weight : ℝ) * (((G.getD k default).error : ℝ) - 2^50) =
      2^80 * (((G.getD k default).weight : ℝ)/2^30 * ((G.getD k default).error : ℝ)/2^50 -
        ((G.getD k default).weight : ℝ)/2^30) := by ring
  simp only [he, ← mul_sum, sum_sub_distrib]
  ring

private theorem arrayTail_bound (a : Array Int) (H : ℕ) :
    WienerBound (fun n => (a.getD (n+H) 0 : ℝ) / 2^89) ((tailCharge a H : ℝ) / 2^89) := by
  let f (n : ℕ) := |(a.getD (n+H) 0 : ℝ) / 2^89|
  have hs : HasSum f (∑ n ∈ range (a.size-H), f n) := by
    apply hasSum_sum_of_ne_finset_zero
    intro n hn
    have h : a.size ≤ n+H := by simp only [mem_range] at hn; omega
    simp only [f, Array.getD_eq_getD_getElem?, Array.getElem?_eq_none h, Option.getD_none,
      Int.cast_zero, zero_div, abs_zero]
  refine ⟨hs.summable, hs.tsum_eq.le.trans_eq ?_⟩
  simp only [tailCharge, Int.cast_sum, Int.cast_abs, f, abs_div, abs_of_pos (by norm_num : (0:ℝ)<2^89)]
  simp only [div_eq_mul_inv, ← sum_mul]

/-- The final integer column has a full-series Wiener guarantee from normalized scalar masses,
unit true rows and the certified rows of the finite grade array. -/
theorem buildColumn_sound (G : Array Grade) (K L H : ℕ) (r : ℕ → ℝ) (F : ℕ → ℕ → ℝ)
    (hr : Summable r) (hmass : ∑' k, r k ≤ 1) (hr0 : ∀ k, 0 ≤ r k)
    (hF : ∀ k, WienerBound (F k) 1)
    (hlen : ∀ k < K, (G.getD k default).row.size ≤ L)
    (hw : ∀ k < K, ((G.getD k default).weight : ℝ)/2^30 ≤ r k)
    (herr : ∀ k < K, WienerBound (fun n => F k n - ((G.getD k default).row.getD n 0 : ℝ)/2^59)
      (((G.getD k default).error : ℝ)/2^50)) :
    let cert := buildColumn G K L H
    WienerBound (fun n => gradeSeries (fun k j => r k * F k j) n - (cert.head.getD n 0 : ℝ)/2^89)
      ((cert.allowance : ℝ)/2^89) := by
  let a := signedColumn G K L
  let f (n : ℕ) := gradeSeries (fun k j => r k * F k j) n
  let A (n : ℕ) := (a.getD n 0 : ℝ)/2^89
  have h := scalarGrade_truncation r (fun k => ((G.getD k default).weight : ℝ)/2^30)
    (fun k => ((G.getD k default).error : ℝ)/2^50) F
    (fun k n => ((G.getD k default).row.getD n 0 : ℝ)/2^59) K hr hmass hr0
    (fun k hk => ⟨by positivity, hw k hk⟩) hF herr
  have hcol (n : ℕ) : A n = gradeSeries (fun k j => if k < K then
      ((G.getD k default).weight : ℝ)/2^30 * (((G.getD k default).row.getD j 0 : ℝ)/2^59) else 0) n := by
    simpa only [A, a, mul_div_assoc] using signedColumn_value G K L n hlen
  have hfull : WienerBound (fun n => f n - A n) ((scalarCharge G K : ℝ)/2^80) := by
    simpa only [f, hcol, scalarCharge_value, mul_div_assoc] using h
  have hall := wienerBound_truncateHead H hfull (arrayTail_bound a H)
  have hhead (n : ℕ) : ((buildColumn G K L H).head.getD n 0 : ℝ) / 2^89 =
      if n < H then A n else 0 := by
    by_cases hn : n < H <;> simp [buildColumn, A, a, hn]
  have hbudget : ((buildColumn G K L H).allowance : ℝ)/2^89 =
      (scalarCharge G K : ℝ)/2^80 + (tailCharge a H : ℝ)/2^89 := by
    simp only [buildColumn, a, Int.cast_add, Int.cast_mul, Int.cast_pow, Int.cast_ofNat]
    ring
  simpa only [f, hhead, hbudget] using hall


/-- Exact embedding of a computed coefficient into the existing `2^128` transfer intervals. -/
def thinCoeff (n : Int) : HaagerupKernel.Ival := ⟨n * 2^39, n * 2^39⟩

def Column.thinHead (c : Column) : List HaagerupKernel.Ival := c.head.toList.map thinCoeff

@[simp] theorem Column.thinHead_length (c : Column) : c.thinHead.length = c.head.size := by
  simp [Column.thinHead]

/-- The stored coefficient has zero interval error before and after the list cutoff. -/
theorem Column.thinHead_mem (c : Column) (n : ℕ) :
    Haagerup.mem ((c.head.getD n 0 : ℝ) / 2^89) (c.thinHead.getD n HaagerupKernel.zeroI) := by
  have hg : c.thinHead.getD n HaagerupKernel.zeroI = thinCoeff (c.head.getD n 0) := by
    simp only [Column.thinHead, List.getD_eq_getElem?_getD, List.getElem?_map, Array.getElem?_toList,
      Array.getD_eq_getD_getElem?]
    cases c.head[n]? <;> rfl
  rw [hg]
  simp only [Haagerup.mem, thinCoeff, HaagerupKernel.D, HaagerupKernel.K, Int.cast_mul, Int.cast_pow,
    Int.cast_ofNat, ← le_antisymm_iff]
  ring

theorem Column.clipped_value (c : Column) (n : ℕ) :
    (if n < c.thinHead.length then (c.head.getD n 0 : ℝ)/2^89 else 0) =
      (c.head.getD n 0 : ℝ)/2^89 := by
  by_cases h : n < c.head.size
  · simp [h]
  · simp only [thinHead_length, h, ↓reduceIte]
    rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_none (by omega)]
    norm_num

end Haagerup.AngularSelector.Certificate
