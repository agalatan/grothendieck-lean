set_option warningAsError true

/-!
# Fixed-point 128-bit interval arithmetic kernel (Mathlib-free, precompiled)

Intervals are pairs of integers `⟨lo, hi⟩` representing `[lo / D, hi / D]` with `D = 2^128`.
All operations round outward. This module imports only `Init` so that `HaagerupKernel` compiles to
native C code (`precompileModules = true`) for fast `native_decide` verification.

Agent-ID: gemini-21d5
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

/-- Exact interval negation. -/
def negI (a : Ival) : Ival := ⟨-a.hi, -a.lo⟩

/-- Exact interval subtraction `a - b`. -/
def subI (a b : Ival) : Ival := addI a (negI b)

/-- Thin interval for an integer `n`. -/
def intI (n : Int) : Ival := ⟨n * D, n * D⟩

/-- Strict positivity gate `0 < lo`. -/
def posI (a : Ival) : Bool := decide (0 < a.lo)

/-- Floor division by `D`. -/
def shDown (x : Int) : Int := x / D

/-- Ceiling division by `D`. -/
def shUp (x : Int) : Int := -((-x) / D)

/-- Ceiling division by a positive integer `b`. -/
def ceilDiv (a b : Int) : Int := -((-a) / b)

/-- Outward-rounded interval multiplication. -/
def mulI (a b : Ival) : Ival :=
  let p1 := a.lo * b.lo
  let p2 := a.lo * b.hi
  let p3 := a.hi * b.lo
  let p4 := a.hi * b.hi
  ⟨shDown (min (min p1 p2) (min p3 p4)), shUp (max (max p1 p2) (max p3 p4))⟩

/-- Outward-rounded reciprocal `1 / a` for a positive interval (`0 < a.lo`). -/
def invPosI (a : Ival) : Ival := ⟨(D * D) / a.hi, -((-(D * D)) / a.lo)⟩

/-- Scaled upper bound for `|x|` over `a`, clamped at `0`. -/
def absUpper (a : Ival) : Int := max (max (-a.lo) a.hi) 0

/-- Scaled floor of a rational: `⌊q · D⌋`. -/
def ofRatLo (q : Rat) : Int := Rat.floor (q * (D : Rat))

/-- Scaled ceiling of a rational: `⌈q · D⌉ = -⌊-q · D⌋`. -/
def ofRatHi (q : Rat) : Int := -(Rat.floor (-(q * (D : Rat))))

/-- Thin interval enclosing a rational `q`. -/
def ofRatI (q : Rat) : Ival := ⟨ofRatLo q, ofRatHi q⟩

/-- Pointwise addition of interval coefficient lists (zero-padded). -/
def addL : List Ival → List Ival → List Ival
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => addI a b :: addL l m

/-- Polynomial product (Cauchy convolution) of interval coefficient lists. -/
def convI : List Ival → List Ival → List Ival
  | [], _ => []
  | a :: l, m =>
    if a.lo == 0 && a.hi == 0 then zeroI :: convI l m
    else addL (m.map (mulI a)) (zeroI :: convI l m)

/-- Scaled sum of `absUpper` over all coefficients. -/
def absSum (L : List Ival) : Int := (L.map absUpper).sum

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
