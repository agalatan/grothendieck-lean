/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
/-!
# Intervals at scale `2⁻¹²⁸`

An interval `⟨lo, hi⟩ : Ival` is a pair of integers that stands for `[lo / D, hi / D]` with `D = 2¹²⁸` (the
enclosures of Appendix A.1 of the article, at scale `2⁻¹²⁸`). The checkers of `HaagerupKernel` share this type: the
table of the overlaps `μ_n` (Computation 2) is a `List Ival`, and the table of the energies `E(d₁, d₂)`
(Computation 3) is a list of rows `RowI`. The file has no imports.

-/

set_option warningAsError true

namespace HaagerupKernel

/-- The number of fractional bits of the intervals. -/
def K : Nat := 128

/-- The denominator `D = 2¹²⁸` of the intervals. -/
def D : Int := (2 : Int) ^ K

/-- The interval `[lo / D, hi / D]`, given by its integer endpoints. -/
structure Ival where
  lo : Int
  hi : Int

/-- The interval `{0}`. -/
def zeroI : Ival := ⟨0, 0⟩

/-- The sum of two intervals (exact: the endpoints are added). -/
def addI (a b : Ival) : Ival := ⟨a.lo + b.lo, a.hi + b.hi⟩

/-- A row of a table of energies: `(d₂, [(d₁, I), …])`, where the interval `I` encloses the energy `E(d₁, d₂)`. -/
abbrev RowI := Nat × List (Nat × Ival)

/-- Boolean equality of two lists of intervals, endpoint by endpoint. -/
def ivalListEq : List Ival → List Ival → Bool
  | [], [] => true
  | a :: l, b :: m => decide (a.lo = b.lo ∧ a.hi = b.hi) && ivalListEq l m
  | _, _ => false

/-- `ivalListEq` decides equality of lists of intervals. -/
theorem ivalListEq_iff : ∀ l m : List Ival, ivalListEq l m = true ↔ l = m
  | [], [] => by simp [ivalListEq]
  | [], _ :: _ => by simp [ivalListEq]
  | _ :: _, [] => by simp [ivalListEq]
  | ⟨alo, ahi⟩ :: l, ⟨blo, bhi⟩ :: m => by
    simp only [ivalListEq, Bool.and_eq_true, decide_eq_true_eq, List.cons.injEq, Ival.mk.injEq]
    rw [ivalListEq_iff l m]

end HaagerupKernel
