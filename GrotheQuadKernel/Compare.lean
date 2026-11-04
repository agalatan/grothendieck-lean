import GrotheQuadKernel.Basic

/-!
# Comparison with a stored table

A stored binary64 word is decoded exactly into a dyadic `m · 2^e` and then enclosed at precision
`K` (`word64ToIval`; exact when `e + K ≥ 0`).  The ℓ¹ distance between a vector of enclosures
and a table is bounded above by `Σ_i max(a_i.hi − t_i.lo, t_i.hi − a_i.lo, 0)` (obligation S7
of #303, trivial), and the squared ℓ² distance by the sum of the squares of the same bounds.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- The sign, biased exponent and fraction of a binary64 word (`w < 2^64`). -/
def word64Parts (w : Nat) : Bool × Nat × Nat :=
  (w / 2 ^ 63 == 1, (w / 2 ^ 52) % 2 ^ 11, w % 2 ^ 52)

/-- The exact dyadic value `(m, e)` with value `m · 2^(−e)` of a finite binary64 word
(normal or subnormal; infinities and NaNs decode to `(0, 0)`, which the caller must exclude). -/
def word64Dyadic (w : Nat) : Int × Nat :=
  let (neg, ex, fr) := word64Parts w
  if ex == 2047 then (0, 0)
  else
    let m : Nat := if ex == 0 then fr else 2 ^ 52 + fr
    let e : Nat := if ex == 0 then 1074 else 1075 - ex
    (if neg then -(m : Int) else (m : Int), e)

/-- A binary64 word as an interval at precision `K`. -/
def word64ToIval (K : Nat) (w : Nat) : Ival :=
  let (m, e) := word64Dyadic w
  ofDyadic K m e

/-- The word is finite and `|value| ≤ 1`. -/
def word64Finite (w : Nat) : Bool :=
  let (_, ex, _) := word64Parts w
  ex != 2047

/-- An upper bound (scaled) of `sup {|x − t| : x ∈ a, t ∈ T}`. -/
def distUpper (a t : Ival) : Int := max (max (a.hi - t.lo) (t.hi - a.lo)) 0

/-- Upper bound (scaled) of the ℓ¹ distance between enclosures and table entries
(missing table entries count as `0`). -/
def l1Upper (encl table : Array Ival) : Int :=
  (Array.range encl.size).foldl
    (fun s i => s + distUpper (encl.getD i zeroI) (table.getD i zeroI)) 0

/-- Upper bound (scaled by `2^(2K)`) of the squared ℓ² distance. -/
def l2SqUpper (encl table : Array Ival) : Int :=
  (Array.range encl.size).foldl
    (fun s i => let d := distUpper (encl.getD i zeroI) (table.getD i zeroI); s + d * d) 0

/-- The largest per-entry distance bound (scaled). -/
def maxDistUpper (encl table : Array Ival) : Int :=
  (Array.range encl.size).foldl
    (fun s i => max s (distUpper (encl.getD i zeroI) (table.getD i zeroI))) 0

/-- Upper bound (scaled by `2^(2K)`) of `Σ |x_i|²` over the enclosures (Bessel check). -/
def sumSqUpper (encl : Array Ival) : Int :=
  encl.foldl (fun s a => let u := absUpper a; s + u * u) 0

end GrotheQuad
