/-!
# Floating dyadic interval arithmetic at an explicit precision (Mathlib-free, precompiled)

An interval `⟨lo, hi, e⟩` represents `[lo · 2^e, hi · 2^e]` with integer mantissas and a common
integer exponent.  Every operation rounds outward and then normalises the result to at most `P`
mantissa bits (`norm P`), so the precision `P` is a parameter of each rounding operation, and
the representable range is unbounded (the conditional coefficients span `2^{-3000} … 1` at the
nodes of large radius).  Fixed-point export (`toFixed K`) serves the contraction.  This module
imports only `Init`, so it compiles to native code; its soundness (obligation S1 of issue #303)
is to be proved in `Grothe/UpperQuad/`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `2^n` as an integer. -/
def pow2 (n : Nat) : Int := ((1 : Nat) <<< n : Nat)

/-- The number of bits of `|m|` (`0` for `0`). -/
def bitsOf (m : Int) : Nat :=
  let n := m.natAbs
  if n == 0 then 0 else Nat.log2 n + 1

/-- A floating dyadic interval `[lo · 2^e, hi · 2^e]`. -/
structure Ival where
  lo : Int
  hi : Int
  e : Int
  deriving Repr, Inhabited, BEq

/-- Floor division by `2^s` (`>>>` on `Int` is the arithmetic shift, i.e. floor). -/
def shDown (s : Nat) (x : Int) : Int := x >>> s

/-- Ceiling division by `2^s`. -/
def shUp (s : Nat) (x : Int) : Int := -((-x) >>> s)

/-- Floor division by a positive integer (`/` on `Int` is Euclidean, i.e. floor for `y > 0`). -/
def fdiv (x y : Int) : Int := x / y

/-- Ceiling division by a positive integer. -/
def cdiv (x y : Int) : Int := -((-x) / y)

/-- Round outward to at most `P` mantissa bits. -/
def norm (P : Nat) (a : Ival) : Ival :=
  let b := max (bitsOf a.lo) (bitsOf a.hi)
  if b ≤ P then a
  else
    let s := b - P
    ⟨shDown s a.lo, shUp s a.hi, a.e + s⟩

/-- The interval `{0}`. -/
def zeroI : Ival := ⟨0, 0, 0⟩

def isZero (a : Ival) : Bool := a.lo == 0 && a.hi == 0

/-- The integer `n`. -/
def ofInt (P : Nat) (n : Int) : Ival := norm P ⟨n, n, 0⟩

/-- The natural number `n`. -/
def ofNat (P : Nat) (n : Nat) : Ival := ofInt P n

/-- The thin dyadic `m · 2^e`. -/
def ofDyadic (P : Nat) (m : Int) (e : Int) : Ival := norm P ⟨m, m, e⟩

/-- Shift the mantissas left so that the exponent becomes `eNew ≤ a.e` (exact). -/
def alignTo (eNew : Int) (a : Ival) : Ival :=
  let s := (a.e - eNew).toNat
  let p := pow2 s
  ⟨a.lo * p, a.hi * p, eNew⟩

/-- Outward-rounded addition. -/
def addI (P : Nat) (a b : Ival) : Ival :=
  if isZero a then norm P b
  else if isZero b then norm P a
  else
    let a := norm P a
    let b := norm P b
    let (a, b) := if a.e ≤ b.e then (a, b) else (b, a)   -- `a` has the smaller exponent
    let gap := b.e - a.e
    if gap ≤ (P + 8 : Nat) then
      let b' := alignTo a.e b
      norm P ⟨a.lo + b'.lo, a.hi + b'.hi, a.e⟩
    else
      -- `a` is far below the precision of `b`: round it outward to the exponent `b.e − P − 8`
      let s := (gap - (P + 8 : Nat)).toNat
      let eA := a.e + s
      let a' : Ival := ⟨shDown s a.lo, shUp s a.hi, eA⟩
      let b' := alignTo eA b
      norm P ⟨a'.lo + b'.lo, a'.hi + b'.hi, eA⟩

/-- Exact negation. -/
def negI (a : Ival) : Ival := ⟨-a.hi, -a.lo, a.e⟩

/-- Outward-rounded subtraction. -/
def subI (P : Nat) (a b : Ival) : Ival := addI P a (negI b)

/-- Multiplication by an integer. -/
def mulZ (P : Nat) (n : Int) (a : Ival) : Ival :=
  if n ≥ 0 then norm P ⟨n * a.lo, n * a.hi, a.e⟩ else norm P ⟨n * a.hi, n * a.lo, a.e⟩

/-- Multiplication by a natural number. -/
def mulN (P : Nat) (n : Nat) (a : Ival) : Ival := mulZ P n a

/-- Outward-rounded multiplication. -/
def mulI (P : Nat) (a b : Ival) : Ival :=
  if a.lo == a.hi && b.lo == b.hi then
    let p := a.lo * b.lo
    norm P ⟨p, p, a.e + b.e⟩
  else
    let p1 := a.lo * b.lo
    let p2 := a.lo * b.hi
    let p3 := a.hi * b.lo
    let p4 := a.hi * b.hi
    norm P ⟨min (min p1 p2) (min p3 p4), max (max p1 p2) (max p3 p4), a.e + b.e⟩

/-- Outward-rounded square. -/
def sqI (P : Nat) (a : Ival) : Ival :=
  if a.lo ≥ 0 then norm P ⟨a.lo * a.lo, a.hi * a.hi, 2 * a.e⟩
  else if a.hi ≤ 0 then norm P ⟨a.hi * a.hi, a.lo * a.lo, 2 * a.e⟩
  else norm P ⟨0, max (a.lo * a.lo) (a.hi * a.hi), 2 * a.e⟩

/-- The information-free interval `[-2^(2P), 2^(2P)]`, returned on invalid divisions. -/
def hugeI (P : Nat) : Ival := ⟨-(pow2 (2 * P)), pow2 (2 * P), 0⟩

/-- Outward-rounded division; the divisor must satisfy `b.lo > 0` (else `hugeI`). -/
def divI (P : Nat) (a b : Ival) : Ival :=
  if b.lo ≤ 0 then hugeI P
  else
    let t := P + bitsOf b.hi + 2
    let p := pow2 t
    let n1 := a.lo * p
    let n2 := a.hi * p
    let lo := if a.lo ≥ 0 then fdiv n1 b.hi else fdiv n1 b.lo
    let hi := if a.hi ≥ 0 then cdiv n2 b.lo else cdiv n2 b.hi
    norm P ⟨lo, hi, a.e - b.e - t⟩

/-- Division by a positive natural number. -/
def divN (P : Nat) (n : Nat) (a : Ival) : Ival := divI P a (ofNat P n)

/-- Reciprocal (`a.lo > 0`). -/
def invI (P : Nat) (a : Ival) : Ival := divI P (ofInt P 1) a

/-- The rational `n / d` (`d > 0`). -/
def ratI (P : Nat) (n : Int) (d : Nat) : Ival := divN P d (ofInt P n)

/-- `n!`. -/
def factNat (n : Nat) : Nat := (List.range n).foldl (fun p i => p * (i + 1)) 1

/-- Integer square root, rounded down (`Nat.sqrt`) and up. -/
def isqrtDown (n : Nat) : Nat := Nat.sqrt n
def isqrtUp (n : Nat) : Nat :=
  let r := Nat.sqrt n
  if r * r == n then r else r + 1

/-- Outward-rounded square root of `max a 0` (sound for `x ∈ a`, `x ≥ 0`). -/
def sqrtI (P : Nat) (a : Ival) : Ival :=
  let lo := max a.lo 0
  let hi := max a.hi 0
  let need : Int := 2 * (P : Int) - (bitsOf hi : Int)
  let t0 : Nat := if need > 0 then need.toNat else 0
  let t : Nat := if (a.e - (t0 : Int)) % 2 == 0 then t0 else t0 + 1
  let p := pow2 t
  norm P ⟨(isqrtDown (lo * p).toNat : Nat), (isqrtUp (hi * p).toNat : Nat), (a.e - t) / 2⟩

/-- The thin interval of `max(|lo|, |hi|, 0)·2^e`: an upper bound for `|x|`, `x ∈ a`. -/
def absUpper (a : Ival) : Ival :=
  let u := max (max (-a.lo) a.hi) 0
  ⟨u, u, a.e⟩

/-- The symmetric interval `[-r, r]` from a nonnegative bound `r` (its upper end). -/
def symmI (r : Ival) : Ival :=
  let u := max (max (-r.lo) r.hi) 0
  ⟨-u, u, r.e⟩

/-- Widen by a nonnegative radius. -/
def widen (P : Nat) (a r : Ival) : Ival := addI P a (symmI r)

/-- The width `hi − lo` as a thin interval. -/
def width (a : Ival) : Ival := ⟨a.hi - a.lo, a.hi - a.lo, a.e⟩

def isPos (a : Ival) : Bool := a.lo > 0
def isNeg (a : Ival) : Bool := a.hi < 0

/-- `x · 2^e` compared with the integer `n`: `true` iff `x · 2^e < n`. -/
def mantLtInt (x : Int) (e : Int) (n : Int) : Bool :=
  if e ≥ 0 then x * pow2 e.toNat < n else x < n * pow2 (-e).toNat

/-- `a.hi < n` (every element of `a` is below `n`). -/
def ltNat (a : Ival) (n : Nat) : Bool := mantLtInt a.hi a.e n

/-- `a.lo > n`. -/
def gtNat (a : Ival) (n : Nat) : Bool := mantLtInt (-a.lo) a.e (-(n : Int))

/-- `a ⊆ b`. -/
def subset (a b : Ival) : Bool :=
  let e := min a.e b.e
  let a' := alignTo e a
  let b' := alignTo e b
  b'.lo ≤ a'.lo && a'.hi ≤ b'.hi

/-- `a` and `b` have the same elements. -/
def sameI (a b : Ival) : Bool := subset a b && subset b a

/-! ### The exponential -/

/-- `e^x` for `x ∈ a ⊆ [0, ∞)`, by the series through `n ≤ N` with the tail bound
`t_{N+1} / (1 − x/(N+2))` (requires `x < N + 2`, else `hugeI`).  Positive terms: no cancellation. -/
def expPosI (P N : Nat) (a : Ival) : Ival :=
  let x : Ival := ⟨max a.lo 0, max a.hi 0, a.e⟩
  let rec loop : Nat → Nat → Ival → Ival → Ival × Ival
    | 0, _, t, s => (s, t)
    | fuel + 1, i, t, s =>
      let t' := divN P (i + 1) (mulI P t x)
      loop fuel (i + 1) t' (addI P s t')
  let (s, tN) := loop N 0 (ofInt P 1) (ofInt P 1)
  let tNext := divN P (N + 1) (mulI P tN x)
  let den := subI P (ofNat P (N + 2)) x
  if !(isPos den) then hugeI P
  else
    let tail := divI P (mulN P (N + 2) (absUpper tNext)) den
    widen P s tail

/-- `e^{-x}` for `x ∈ a ⊆ [0, ∞)`: the reciprocal of `expPosI`. -/
def expNegI (P N : Nat) (a : Ival) : Ival := invI P (expPosI P N a)

/-- `e^x` for `x ∈ a` of either sign: `exp(x) = exp(max x 0)/exp(max (−x) 0)` is wasteful; we use
`expPosI` on `[0, hi]` and `expNegI` on `[0, −lo]` and take the hull. -/
def expI (P N : Nat) (a : Ival) : Ival :=
  let up := expPosI P N ⟨max a.hi 0, max a.hi 0, a.e⟩
  let dn := expNegI P N ⟨max (-a.lo) 0, max (-a.lo) 0, a.e⟩
  -- hull of [dn.lo, up.hi]
  let e := min dn.e up.e
  let d' := alignTo e dn
  let u' := alignTo e up
  norm P ⟨d'.lo, u'.hi, e⟩

/-! ### Powers -/

/-- `a^n`. -/
def powI (P : Nat) (a : Ival) : Nat → Ival
  | 0 => ofInt P 1
  | n + 1 => mulI P (powI P a n) a

/-! ### Fixed-point export (for the contraction) -/

/-- `⌊lo · 2^(e+K)⌋`: the lower end at the fixed scale `2^K`. -/
def toFixedLo (K : Nat) (a : Ival) : Int :=
  let s := a.e + K
  if s ≥ 0 then a.lo * pow2 s.toNat else shDown (-s).toNat a.lo

/-- `⌈hi · 2^(e+K)⌉`. -/
def toFixedHi (K : Nat) (a : Ival) : Int :=
  let s := a.e + K
  if s ≥ 0 then a.hi * pow2 s.toNat else shUp (-s).toNat a.hi

/-- A fixed-point interval `[lo, hi] / 2^K` back to a floating one. -/
def ofFixed (K : Nat) (lo hi : Int) : Ival := ⟨lo, hi, -(K : Int)⟩

/-! ### Rendering (for diagnostics only; never part of a check) -/

/-- A scaled integer `v / 10^d` as a decimal string. -/
def fmtDecimal (v : Int) (d : Nat) : String :=
  let neg := v < 0
  let n := v.natAbs
  let p : Nat := 10 ^ d
  let ip := n / p
  let fp := n % p
  let fs := toString fp
  let fs := String.ofList (List.replicate (d - fs.length) '0') ++ fs
  (if neg then "-" else "") ++ toString ip ++ (if d == 0 then "" else "." ++ fs)

/-- `⌊x · 10^d⌋` for the dyadic `x = m · 2^e`. -/
def scaledFloor (m : Int) (e : Int) (d : Nat) : Int :=
  let v := m * ((10 : Nat) ^ d : Nat)
  if e ≥ 0 then v * pow2 e.toNat else shDown (-e).toNat v

/-- `⌈x · 10^d⌉`. -/
def scaledCeil (m : Int) (e : Int) (d : Nat) : Int := -(scaledFloor (-m) e d)

/-- The interval with `d` decimal digits, rounded outward. -/
def toDecimal (d : Nat) (a : Ival) : String :=
  "[" ++ fmtDecimal (scaledFloor a.lo a.e d) d ++ ", " ++ fmtDecimal (scaledCeil a.hi a.e d) d ++ "]"

/-- A short scientific rendering of a nonnegative bound `m · 2^e` (diagnostics): `m` rounded to
`digits` significant decimals and a power of ten. -/
def sciString (a : Ival) : String :=
  let u := max (max (-a.lo) a.hi) 0
  if u == 0 then "0"
  else
    -- log10 estimate from bits
    let b : Int := (bitsOf u : Int) + a.e           -- u·2^e < 2^b
    let l10 : Int := (b * 30103) / 100000 - 1       -- ≈ log10, rounded down a little
    let d : Nat := if l10 ≥ 0 then 0 else (-l10).toNat + 3
    let v := scaledCeil u a.e d                      -- ⌈u·2^e·10^d⌉
    fmtDecimal v d

/-- The base-2 logarithm of the width (`−100000` for a thin interval). -/
def widthLog2 (a : Ival) : Int :=
  let w := (a.hi - a.lo).toNat
  if w == 0 then -100000 else (Nat.log2 w : Int) + a.e

/-- The base-2 logarithm of the magnitude bound (`−100000` for `{0}`). -/
def magLog2 (a : Ival) : Int :=
  let u := (max (max (-a.lo) a.hi) 0).toNat
  if u == 0 then -100000 else (Nat.log2 u : Int) + a.e

end GrotheQuad
