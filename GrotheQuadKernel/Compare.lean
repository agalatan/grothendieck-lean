import GrotheQuadKernel.Basic

/-!
# Comparison with a stored table

A stored binary64 word is decoded exactly into a dyadic `m · 2^e` (`word64ToIval`).  The ℓ¹
distance between a vector of enclosures and a table is bounded above by
`Σ_i max(a_i.hi − t_i.lo, t_i.hi − a_i.lo, 0)` (obligation S7 of #303, trivial), the squared ℓ²
distance by the sum of the squares of the same bounds.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- The sign, biased exponent and fraction of a binary64 word (`w < 2^64`). -/
def word64Parts (w : Nat) : Bool × Nat × Nat :=
  (w / 2 ^ 63 == 1, (w / 2 ^ 52) % 2 ^ 11, w % 2 ^ 52)

/-- The exact dyadic `(m, e)` with value `m · 2^e` of a finite binary64 word (normal or
subnormal; infinities and NaNs decode to `(0, 0)`, which the caller must exclude). -/
def word64Dyadic (w : Nat) : Int × Int :=
  let (neg, ex, fr) := word64Parts w
  if ex == 2047 then (0, 0)
  else
    let m : Nat := if ex == 0 then fr else 2 ^ 52 + fr
    let e : Int := if ex == 0 then -1074 else (ex : Int) - 1075
    (if neg then -(m : Int) else (m : Int), e)

/-- A binary64 word as a thin interval. -/
def word64ToIval (w : Nat) : Ival :=
  let (m, e) := word64Dyadic w
  ⟨m, m, e⟩

/-- The word is finite. -/
def word64Finite (w : Nat) : Bool :=
  let (_, ex, _) := word64Parts w
  ex != 2047

/-- An upper bound of `sup {|x − t| : x ∈ a, t ∈ T}` (as a thin interval). -/
def distUpper (P : Nat) (a t : Ival) : Ival :=
  let d := subI P a t
  absUpper d

/-- Upper bound of the ℓ¹ distance between enclosures and table entries (missing entries `0`). -/
def l1Upper (P : Nat) (encl table : Array Ival) : Ival :=
  (Array.range encl.size).foldl
    (fun s i => addI P s (distUpper P (encl.getD i zeroI) (table.getD i zeroI))) zeroI

/-- Upper bound of the squared ℓ² distance. -/
def l2SqUpper (P : Nat) (encl table : Array Ival) : Ival :=
  (Array.range encl.size).foldl
    (fun s i => addI P s (sqI P (distUpper P (encl.getD i zeroI) (table.getD i zeroI)))) zeroI

/-- `a ≤ b` for nonnegative thin bounds (compares `hi`). -/
def leBound (a b : Ival) : Bool :=
  let e := min a.e b.e
  (alignTo e a).hi ≤ (alignTo e b).hi

/-- The largest per-entry distance bound. -/
def maxDistUpper (P : Nat) (encl table : Array Ival) : Ival :=
  (Array.range encl.size).foldl
    (fun s i =>
      let d := distUpper P (encl.getD i zeroI) (table.getD i zeroI)
      if leBound s d then d else s) zeroI

/-- Upper bound of `Σ |x_i|²` over the enclosures (Bessel check). -/
def sumSqUpper (P : Nat) (encl : Array Ival) : Ival :=
  encl.foldl (fun s a => addI P s (sqI P (absUpper a))) zeroI

end GrotheQuad
