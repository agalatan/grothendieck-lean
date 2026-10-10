/-!
# Fixed-point interval arithmetic kernel (Mathlib-free, precompiled)

Intervals are pairs of integers `⟨lo, hi⟩` representing `[lo / D, hi / D]` with `D = 2^K`.
All operations round outward.  This module imports only `Init` so that it can be compiled to
native code and used by `native_decide` at native speed; the soundness proofs live in
`Grothe/Upper/IntervalSound.lean` and `Grothe/Upper/Head.lean`.
-/

namespace GrotheKernel

/-- Fixed-point precision (bits). -/
def K : Nat := 128

/-- The scale `D = 2^K`. -/
def D : Int := (2 : Int) ^ K

/-- A fixed-point interval `[lo / D, hi / D]`. -/
structure Ival where
  lo : Int
  hi : Int
deriving Repr, Inhabited

/-- The interval `{0}`. -/
def zeroI : Ival := ⟨0, 0⟩

/-- Exact addition. -/
def addI (a b : Ival) : Ival := ⟨a.lo + b.lo, a.hi + b.hi⟩

/-- Exact negation. -/
def negI (a : Ival) : Ival := ⟨-a.hi, -a.lo⟩

/-- Floor division by `D` (`/` on `Int` is Euclidean division, which is floor for `D > 0`). -/
def shDown (x : Int) : Int := x / D

/-- Ceiling division by `D`. -/
def shUp (x : Int) : Int := -((-x) / D)

/-- Outward-rounded multiplication. -/
def mulI (a b : Ival) : Ival :=
  let p1 := a.lo * b.lo
  let p2 := a.lo * b.hi
  let p3 := a.hi * b.lo
  let p4 := a.hi * b.hi
  ⟨shDown (min (min p1 p2) (min p3 p4)), shUp (max (max p1 p2) (max p3 p4))⟩

/-- Upper bound (scaled) for `|x|` over the interval (clamped at `0`). -/
def absUpper (a : Ival) : Int := max (max (-a.lo) a.hi) 0

/-- Scaled floor of a rational: `⌊q · D⌋`. -/
def ofRatLo (q : Rat) : Int := Rat.floor (q * (D : Rat))

/-- Scaled ceiling of a rational: `⌈q · D⌉ = -⌊-q · D⌋`. -/
def ofRatHi (q : Rat) : Int := -(Rat.floor (-(q * (D : Rat))))

/-- The thin interval enclosing a rational. -/
def ofRatI (q : Rat) : Ival := ⟨ofRatLo q, ofRatHi q⟩

/-! ### Interval coefficient lists -/

/-- Pointwise addition of interval coefficient lists (zero padded). -/
def addL : List Ival → List Ival → List Ival
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => addI a b :: addL l m

/-- Convolution (polynomial product) of interval coefficient lists.  Recursion is on the first
argument, which should be the *sparse* list: its zero entries cost nothing. -/
def convI : List Ival → List Ival → List Ival
  | [], _ => []
  | a :: l, m =>
    if a.lo == 0 && a.hi == 0 then zeroI :: convI l m
    else addL (m.map (mulI a)) (zeroI :: convI l m)

/-- Scaled sum of `absUpper` over all coefficients of index `≥ k`. -/
def absSumFrom (k : Nat) (L : List Ival) : Int := (L.drop k).foldl (fun s a => s + absUpper a) 0

end GrotheKernel
