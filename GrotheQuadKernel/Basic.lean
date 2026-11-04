/-!
# Fixed-point interval arithmetic at an explicit precision (Mathlib-free, precompiled)

An interval `⟨lo, hi⟩` at precision `K` represents `[lo / 2^K, hi / 2^K]`.  Unlike
`GrotheCapsKernel.Basic`, the precision is a parameter of every rounding operation, so the
same code serves the high-precision conditional recurrences (`K ≈ 1024`) and the contraction
(`K ≈ 128`).  Every operation rounds outward.  This module imports only `Init`, so it compiles
to native code and runs at native speed under `native_decide` and `#eval`; its soundness
(obligation S1 of issue #303) is to be proved in `Grothe/UpperQuad/`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `2^K` as an integer. -/
def pow2 (K : Nat) : Int := ((1 : Nat) <<< K : Nat)

/-- A fixed-point interval `[lo / 2^K, hi / 2^K]` (the precision `K` is implicit in its use). -/
structure Ival where
  lo : Int
  hi : Int
  deriving Repr, Inhabited, BEq

/-- Floor division by `2^K` (`>>>` on `Int` is the arithmetic shift, i.e. floor). -/
def shDown (K : Nat) (x : Int) : Int := x >>> K

/-- Ceiling division by `2^K`. -/
def shUp (K : Nat) (x : Int) : Int := -((-x) >>> K)

/-- Floor division by a positive integer (`/` on `Int` is Euclidean, i.e. floor for `y > 0`). -/
def fdiv (x y : Int) : Int := x / y

/-- Ceiling division by a positive integer. -/
def cdiv (x y : Int) : Int := -((-x) / y)

/-- The interval `{0}`. -/
def zeroI : Ival := ⟨0, 0⟩

/-- The integer `n` at precision `K`. -/
def ofInt (K : Nat) (n : Int) : Ival := ⟨n * pow2 K, n * pow2 K⟩

/-- The natural number `n` at precision `K`. -/
def ofNat (K : Nat) (n : Nat) : Ival := ofInt K n

/-- The enclosure of the rational `num / den` (`den > 0`) at precision `K`. -/
def ofRatND (K : Nat) (num : Int) (den : Nat) : Ival :=
  ⟨fdiv (num * pow2 K) den, cdiv (num * pow2 K) den⟩

/-- The enclosure of a `Rat` at precision `K`. -/
def ofRat (K : Nat) (q : Rat) : Ival := ofRatND K q.num q.den

/-- The thin interval of the dyadic `m / 2^e` at precision `K ≥ e` (exact), else rounded outward. -/
def ofDyadic (K : Nat) (m : Int) (e : Nat) : Ival :=
  if e ≤ K then ⟨m * pow2 (K - e), m * pow2 (K - e)⟩
  else ⟨shDown (e - K) m, shUp (e - K) m⟩

/-- Change the precision from `K` to `K'`, rounding outward. -/
def rescale (K K' : Nat) (a : Ival) : Ival :=
  if K' ≤ K then ⟨shDown (K - K') a.lo, shUp (K - K') a.hi⟩
  else ⟨a.lo * pow2 (K' - K), a.hi * pow2 (K' - K)⟩

/-- Exact addition. -/
def addI (a b : Ival) : Ival := ⟨a.lo + b.lo, a.hi + b.hi⟩

/-- Exact negation. -/
def negI (a : Ival) : Ival := ⟨-a.hi, -a.lo⟩

/-- Exact subtraction. -/
def subI (a b : Ival) : Ival := ⟨a.lo - b.hi, a.hi - b.lo⟩

/-- Exact multiplication by an integer. -/
def mulZ (n : Int) (a : Ival) : Ival :=
  if n ≥ 0 then ⟨n * a.lo, n * a.hi⟩ else ⟨n * a.hi, n * a.lo⟩

/-- Exact multiplication by a natural number. -/
def mulN (n : Nat) (a : Ival) : Ival := ⟨n * a.lo, n * a.hi⟩

/-- Outward division by a positive natural number (exact scale). -/
def divN (n : Nat) (a : Ival) : Ival := ⟨fdiv a.lo n, cdiv a.hi n⟩

/-- Outward-rounded multiplication at precision `K`. -/
def mulI (K : Nat) (a b : Ival) : Ival :=
  if a.lo == a.hi && b.lo == b.hi then
    let p := a.lo * b.lo
    ⟨shDown K p, shUp K p⟩
  else
    let p1 := a.lo * b.lo
    let p2 := a.lo * b.hi
    let p3 := a.hi * b.lo
    let p4 := a.hi * b.hi
    ⟨shDown K (min (min p1 p2) (min p3 p4)), shUp K (max (max p1 p2) (max p3 p4))⟩

/-- Outward-rounded square at precision `K`. -/
def sqI (K : Nat) (a : Ival) : Ival :=
  if a.lo ≥ 0 then ⟨shDown K (a.lo * a.lo), shUp K (a.hi * a.hi)⟩
  else if a.hi ≤ 0 then ⟨shDown K (a.hi * a.hi), shUp K (a.lo * a.lo)⟩
  else ⟨0, shUp K (max (a.lo * a.lo) (a.hi * a.hi))⟩

/-- Outward-rounded division at precision `K`; the divisor must satisfy `b.lo > 0`
(otherwise the result is the empty-of-information interval `[-2^(2K), 2^(2K)]`). -/
def divI (K : Nat) (a b : Ival) : Ival :=
  if b.lo ≤ 0 then ⟨-(pow2 (2 * K)), pow2 (2 * K)⟩
  else
    let n1 := a.lo * pow2 K
    let n2 := a.hi * pow2 K
    let lo := if a.lo ≥ 0 then fdiv n1 b.hi else fdiv n1 b.lo
    let hi := if a.hi ≥ 0 then cdiv n2 b.lo else cdiv n2 b.hi
    ⟨lo, hi⟩

/-- Reciprocal at precision `K` (`a.lo > 0`). -/
def invI (K : Nat) (a : Ival) : Ival := divI K (ofInt K 1) a

/-- Integer square root, rounded down (`Nat.sqrt`) and up. -/
def isqrtDown (n : Nat) : Nat := Nat.sqrt n
def isqrtUp (n : Nat) : Nat :=
  let r := Nat.sqrt n
  if r * r == n then r else r + 1

/-- Outward-rounded square root at precision `K`: `√(max a 0)`; sound for `x ∈ a`, `x ≥ 0`. -/
def sqrtI (K : Nat) (a : Ival) : Ival :=
  let lo := max a.lo 0
  let hi := max a.hi 0
  ⟨(isqrtDown ((lo * pow2 K).toNat) : Nat), (isqrtUp ((hi * pow2 K).toNat) : Nat)⟩

/-- Upper bound (scaled) for `|x|` over the interval (clamped at `0`). -/
def absUpper (a : Ival) : Int := max (max (-a.lo) a.hi) 0

/-- The symmetric interval `[-r, r]` from a scaled radius `r ≥ 0`. -/
def symm (r : Int) : Ival := ⟨-r, r⟩

/-- Widen by a scaled radius. -/
def widen (a : Ival) (r : Int) : Ival := ⟨a.lo - r, a.hi + r⟩

/-- Scaled width `hi - lo`. -/
def width (a : Ival) : Int := a.hi - a.lo

/-- `a ⊆ b`. -/
def subset (a b : Ival) : Bool := b.lo ≤ a.lo && a.hi ≤ b.hi

/-! ### The exponential -/

/-- `e^x` for `x ∈ a ⊆ [0, ∞)` at precision `K`, by the series through `n ≤ N` with the tail
bound `t_{N+1} / (1 - x/(N+2))` (requires `x < N + 2`; the result is the information-free
interval otherwise).  Positive terms: no cancellation. -/
def expPosI (K N : Nat) (a : Ival) : Ival :=
  let x : Ival := ⟨max a.lo 0, max a.hi 0⟩
  -- Σ_{n ≤ N} x^n / n!, computed as t_{i+1} = t_i · x / (i+1)
  let rec loop : Nat → Nat → Ival → Ival → Ival × Ival
    | 0, _, t, s => (s, t)
    | fuel + 1, i, t, s =>
      let t' := divN (i + 1) (mulI K t x)
      loop fuel (i + 1) t' (addI s t')
  let (s, tN) := loop N 0 (ofInt K 1) (ofInt K 1)
  let tNext := divN (N + 1) (mulI K tN x)
  -- tail ≤ t_{N+1} · (N+2) / (N+2 - x), since t_{n+1}/t_n = x/(n+1) ≤ x/(N+2) for n ≥ N+1
  let den : Int := (N + 2 : Nat) * pow2 K - x.hi
  if den ≤ 0 then ⟨-(pow2 (2 * K)), pow2 (2 * K)⟩
  else
    let tail := cdiv (tNext.hi * ((N + 2 : Nat) * pow2 K)) den
    ⟨s.lo, s.hi + tail⟩

/-- `e^{-x}` for `x ∈ a ⊆ [0, ∞)`: the reciprocal of `expPosI`. -/
def expNegI (K N : Nat) (a : Ival) : Ival := invI K (expPosI K N a)

/-! ### Powers -/

/-- `a^n` at precision `K` (binary powering not needed: `n` is small). -/
def powI (K : Nat) (a : Ival) : Nat → Ival
  | 0 => ofInt K 1
  | n + 1 => mulI K (powI K a n) a

/-! ### Rendering (for `#eval` only; never part of a check) -/

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

/-- The interval at precision `K` with `d` decimal digits: `[lo, hi]` rounded outward. -/
def toDecimal (K d : Nat) (a : Ival) : String :=
  let p : Int := ((10 : Nat) ^ d : Nat)
  let lo := shDown K (a.lo * p)
  let hi := shUp K (a.hi * p)
  "[" ++ fmtDecimal lo d ++ ", " ++ fmtDecimal hi d ++ "]"

/-- The midpoint as a `Float` (diagnostics only). -/
def midFloat (K : Nat) (a : Ival) : Float :=
  Float.scaleB (Float.ofInt ((a.lo + a.hi) / 2)) (-(K : Int))

/-- The width as a `Float` (diagnostics only). -/
def widthFloat (K : Nat) (a : Ival) : Float :=
  Float.scaleB (Float.ofInt (a.hi - a.lo)) (-(K : Int))

/-- `log2` of the scaled width, i.e. the width is about `2^(result - K)` (diagnostics only). -/
def widthLog2 (a : Ival) : Int :=
  let w := (a.hi - a.lo).toNat
  if w == 0 then -100000 else (Nat.log2 w : Int)

end GrotheQuad
