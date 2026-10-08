/-!
# Fixed-point interval arithmetic kernel (Mathlib-free, precompiled)

Intervals are pairs of integers `⟨lo, hi⟩` representing `[lo / D, hi / D]` with `D = 2^K`.
All operations round outward.  This module imports only `Init` so that it can be compiled to
native code and used by `native_decide` at native speed; the soundness proofs live in
`Grothe/Upper/IntervalSound.lean`.

Besides the outward-rounded interval arithmetic there is a *lower-only* variant on
nonnegative scaled integers (`mulLo`, `convLo`, `hornerLo`), used for the positive-coefficient
majorants where only lower bounds are needed.
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

/-- The interval enclosing `[lo, hi]` for rationals `lo ≤ hi`. -/
def boxI (lo hi : Rat) : Ival := ⟨ofRatLo lo, ofRatHi hi⟩

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

/-- `hornerX G N [c₀, c₁, …]` is the list of the first `N` coefficients of
`c₀ + X·G·(c₁ + X·G·(c₂ + …))`; the truncation length decreases with the depth. -/
def hornerX (G : List Ival) : Nat → List Ival → List Ival
  | 0, _ => []
  | _, [] => []
  | N + 1, c :: cs => c :: (convI G (hornerX G N cs)).take N

/-- The first `N` radial coefficients of the composition `Σ_j c_j · X^j · P^{2j+1}`
(`= P · hornerX (P²) N cs`). -/
def composeI (N : Nat) (P : List Ival) (cs : List Ival) : List Ival :=
  (convI P (hornerX (convI P P) N cs)).take N

/-- Scaled lower endpoint of the constant coefficient. -/
def headLo (L : List Ival) : Int := (L.getD 0 zeroI).lo

/-- Scaled sum of `absUpper` over all coefficients of index `≥ k`. -/
def absSumFrom (k : Nat) (L : List Ival) : Int := (L.drop k).foldl (fun s a => s + absUpper a) 0

/-- The weighted sum `Σ_i wᵢ · colᵢ` of interval coefficient lists. -/
def mixL : List Ival → List (List Ival) → List Ival
  | w :: ws, c :: cs => addL (c.map (mulI w)) (mixL ws cs)
  | _, _ => []

/-- Scaled upper bound for `w · t` where `w ∈ wI` and `0 ≤ t` is a scaled upper bound. -/
def wTailUp (wI : Ival) (t : Int) : Int := shUp (wI.hi * t)

/-! ### Lower-only arithmetic on nonnegative scaled integers -/

/-- Lower bound of a product of nonnegative scaled numbers. -/
def mulLo (a b : Int) : Int := shDown (a * b)

/-- Pointwise addition (zero padded). -/
def addLo : List Int → List Int → List Int
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => (a + b) :: addLo l m

/-- Convolution of lower-bound lists (zero entries of the first list are skipped). -/
def convLo : List Int → List Int → List Int
  | [], _ => []
  | a :: l, m => if a == 0 then 0 :: convLo l m else addLo (m.map (mulLo a)) (0 :: convLo l m)

/-- Truncated Horner evaluation of lower bounds, as `hornerX`. -/
def hornerLo (G : List Int) : Nat → List Int → List Int
  | 0, _ => []
  | _, [] => []
  | N + 1, c :: cs => c :: (convLo G (hornerLo G N cs)).take N

/-- Lower bounds of the first `N` radial coefficients of `Σ_j c_j · X^j · P^{2j+1}`. -/
def composeLo (N : Nat) (P : List Int) (cs : List Int) : List Int :=
  (convLo P (hornerLo (convLo P P) N cs)).take N

end GrotheKernel
