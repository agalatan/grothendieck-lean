set_option warningAsError true

/-!
# Fixed-point 128-bit intervals (Mathlib-free)

Intervals are pairs of integers `⟨lo, hi⟩` representing `[lo / D, hi / D]` with `D = 2^128`. The checkers of
`HaagerupKernel` share this type, and the interval energy tables of the certificate are lists of rows `RowI`.
This module imports only `Init`.

-/

namespace HaagerupKernel

/-- Fixed-point precision (bits). -/
def K : Nat := 128

/-- Scale `D = 2^128`. -/
def D : Int := (2 : Int) ^ K

/-- Fixed-point interval `[lo / D, hi / D]`. -/
structure Ival where
  lo : Int
  hi : Int

/-- Thin zero interval `{0}`. -/
def zeroI : Ival := ⟨0, 0⟩

/-- Exact interval addition. -/
def addI (a b : Ival) : Ival := ⟨a.lo + b.lo, a.hi + b.hi⟩

/-- An interval energy table row: `(m, [(n, I_{n,m}), …])`. -/
abbrev RowI := Nat × List (Nat × Ival)

/-- Structural equality test on `List Ival`. -/
def ivalListEq : List Ival → List Ival → Bool
  | [], [] => true
  | a :: l, b :: m => decide (a.lo = b.lo ∧ a.hi = b.hi) && ivalListEq l m
  | _, _ => false

theorem ivalListEq_iff : ∀ l m : List Ival, ivalListEq l m = true ↔ l = m
  | [], [] => by simp [ivalListEq]
  | [], _ :: _ => by simp [ivalListEq]
  | _ :: _, [] => by simp [ivalListEq]
  | ⟨alo, ahi⟩ :: l, ⟨blo, bhi⟩ :: m => by
    simp only [ivalListEq, Bool.and_eq_true, decide_eq_true_eq, List.cons.injEq, Ival.mk.injEq]
    rw [ivalListEq_iff l m]

end HaagerupKernel
