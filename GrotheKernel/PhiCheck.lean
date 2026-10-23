/-!
# The phase cover checker (Mathlib-free, precompiled)

Checks `φ² ≤ 3` for the phase `φ = D e^{−ε(U+V)} S(U, V, W)` of the upper certificate
(`Grothe/UpperChaos/PhiCover.lean` proves soundness).  The phase polynomial `S` comes from the
strings `i,j,k:p/q` of `Data.lean` (`parseTerm`).  With `L` the common denominator and
`SC = 16`, the integer array `A0[i][j][k] = Σ L c_{ijk} 2^{SC(17 − i − j − k)}` satisfies
`A0(2^SC U, 2^SC V, 2^SC W) = L 2^{17 SC} S(U, V, W)`.  On a leaf box (integer coordinates in units
`2^{−SC}`) the array is Taylor-shifted to the centre (`shift3`) and
`|S| ≤ Σ |B_α| r^α / (L 2^{17 SC})` (`absEval3`); with `e^{−x} ≤ q^{⌊x⌋}/(1 + {x})`,
`q = 10⁹/2718281828`, the leaf test is an integer inequality (`leafOK`).  The bisection tree is a
string over `U V W L F X` (`walk`).
-/

namespace GrotheKernel

/-! ### Parsing -/

/-- A rational `p/q` from a string. -/
def parseQ (s : String) : Rat :=
  match s.splitOn "/" with
  | [a] => ((a.toInt?).getD 0 : Rat)
  | [a, b] => ((a.toInt?).getD 0 : Rat) / ((b.toNat?).getD 1 : Rat)
  | _ => 0

/-- A monomial `i,j,k:c`. -/
def parseTerm (s : String) : (Nat × Nat × Nat) × Rat :=
  match s.splitOn ":" with
  | [p, c] =>
    match p.splitOn "," with
    | [i, j, k] => (((i.toNat?).getD 0, (j.toNat?).getD 0, (k.toNat?).getD 0), parseQ c)
    | _ => ((0, 0, 0), 0)
  | _ => ((0, 0, 0), 0)

/-! ### Dense polynomials (Horner order: index = exponent) -/

/-- Pointwise sum of coefficient lists. -/
def zipAddG {α : Type} (add : α → α → α) : List α → List α → List α
  | [], q => q
  | p, [] => p
  | a :: p, b :: q => add a b :: zipAddG add p q

/-- `acc · (m + Y)`. -/
def mulLinG {α : Type} (add : α → α → α) (smul : Int → α → α) (zero : α) (m : Int)
    (acc : List α) : List α :=
  zipAddG add (acc.map (smul m)) (zero :: acc)

/-- **Taylor shift** `p(Y) ↦ p(m + Y)` (Horner). -/
def shiftG {α : Type} (add : α → α → α) (smul : Int → α → α) (zero : α) (m : Int)
    (p : List α) : List α :=
  p.foldr (fun a acc => zipAddG add (mulLinG add smul zero m acc) [a]) []

def add1 (a b : List Int) : List Int := zipAddG (· + ·) a b
def smul1 (m : Int) (a : List Int) : List Int := a.map (m * ·)
def add2 (a b : List (List Int)) : List (List Int) := zipAddG add1 a b
def smul2 (m : Int) (a : List (List Int)) : List (List Int) := a.map (smul1 m)

def shift1 (m : Int) (p : List Int) : List Int := shiftG (· + ·) (· * ·) 0 m p
def shift2 (m : Int) (p : List (List Int)) : List (List Int) := shiftG add1 smul1 [] m p
def shift3 (m : Int) (p : List (List (List Int))) : List (List (List Int)) :=
  shiftG add2 smul2 [] m p

/-- Shift all three variables: `B(y) = A(mU + y₁, mV + y₂, mW + y₃)`. -/
def shiftAll (mU mV mW : Int) (A : List (List (List Int))) : List (List (List Int)) :=
  shift3 mU (A.map fun row => shift2 mV (row.map (shift1 mW)))

/-- `Σ |p_i| r^i` (Horner). -/
def absEval1 (r : Nat) (p : List Int) : Nat := p.foldr (fun a acc => a.natAbs + r * acc) 0
def absEval2 (r s : Nat) (p : List (List Int)) : Nat :=
  p.foldr (fun a acc => absEval1 s a + r * acc) 0
def absEval3 (r s t : Nat) (p : List (List (List Int))) : Nat :=
  p.foldr (fun a acc => absEval2 s t a + r * acc) 0

/-! ### The data -/

/-- Scale exponent of the grid. -/
def SC : Nat := 16

/-- Total degree bound. -/
def DEG : Nat := 17

/-- The common denominator of the coefficients. -/
def commonDen (ts : List ((Nat × Nat × Nat) × Rat)) : Nat :=
  ts.foldl (fun l t => Nat.lcm l t.2.den) 1

/-- The integer array `A0`. -/
def denseA0 (ts : List ((Nat × Nat × Nat) × Rat)) : List (List (List Int)) :=
  let L := commonDen ts
  (List.range (DEG + 1)).map fun i => (List.range (DEG + 1)).map fun j =>
    (List.range (DEG + 1)).map fun k =>
      (ts.filter fun t => t.1 = (i, j, k)).foldl (fun s t =>
        s + (t.2 * (L : Rat)).num * (2 : Int) ^ (SC * (DEG - (i + j + k)))) 0

/-- The data are admissible: total degree `≤ 17` and `L c` integral. -/
def termsOK (ts : List ((Nat × Nat × Nat) × Rat)) : Bool :=
  let L := commonDen ts
  ts.all fun t => t.1.1 + t.1.2.1 + t.1.2.2 ≤ DEG && (t.2 * (L : Rat)).den = 1

/-! ### Leaves -/

/-- A box `[Ul, Uh] × [Vl, Vh] × [Wl, Wh]` in units `2^{−SC}`. -/
structure Box where
  Ul : Int
  Uh : Int
  Vl : Int
  Vh : Int
  Wl : Int
  Wh : Int

/-- `min W²` over `[Wl, Wh]`. -/
def w2lo (b : Box) : Int :=
  if b.Wl ≤ 0 ∧ 0 ≤ b.Wh then 0 else min (b.Wl * b.Wl) (b.Wh * b.Wh)

/-- `qn = 10⁹`, `qd = 2718281828` (`e > qd / qn`). -/
def qn : Nat := 1000000000
def qd : Nat := 2718281828

/-- **The leaf test** (for `S` with common denominator `L` and array `A0`):
`(UV − W²) e^{−2ε(U+V)} S² ≤ 3` on the box, `ε = 21/20`. -/
def leafOK (L : Nat) (A0 : List (List (List Int))) (b : Box) : Bool :=
  let S : Int := (2 : Int) ^ SC
  let mU := (b.Ul + b.Uh) / 2
  let mV := (b.Vl + b.Vh) / 2
  let mW := (b.Wl + b.Wh) / 2
  let rU := (mU - b.Ul).toNat
  let rV := (mV - b.Vl).toNat
  let rW := (mW - b.Wl).toNat
  -- the box is centred: `Uh − mU = mU − Ul` etc.
  let centred := b.Uh - mU = mU - b.Ul && b.Vh - mV = mV - b.Vl && b.Wh - mW = mW - b.Wl
  let Sn : Nat := absEval3 rU rV rW (shiftAll mU mV mW A0)
  let Dm : Int := max 0 (b.Uh * b.Vh - w2lo b)
  -- x = 21 s / (10 · 2^SC), s = Ul + Vl ≥ 0
  let s : Int := b.Ul + b.Vl
  let den : Int := 10 * S
  let n : Nat := (21 * s / den).toNat
  let onePlusF : Int := den + 21 * s - den * n
  centred && 0 ≤ b.Ul && 0 ≤ b.Vl && 0 ≤ s && 0 < onePlusF &&
    Dm * (qn : Int) ^ n * den * (Sn : Int) ^ 2
      ≤ 3 * S ^ 2 * (qd : Int) ^ n * onePlusF * ((L : Int) * S ^ DEG) ^ 2

/-! ### The tree -/

/-- Split a box along an axis: lower and upper halves. -/
def splitBox (b : Box) : Char → Box × Box
  | 'U' => let m := (b.Ul + b.Uh) / 2; ({ b with Uh := m }, { b with Ul := m })
  | 'V' => let m := (b.Vl + b.Vh) / 2; ({ b with Vh := m }, { b with Vl := m })
  | _ => let m := (b.Wl + b.Wh) / 2; ({ b with Wh := m }, { b with Wl := m })

/-- The far-field cut: `U + V ≥ 60` on the whole box. -/
def farLeaf (b : Box) : Bool := 60 * (2 : Int) ^ SC ≤ b.Ul + b.Vl

/-- The box contains no admissible point: `W² > UV` throughout. -/
def emptyLeaf (b : Box) : Bool := 0 ≤ b.Ul && 0 ≤ b.Vl && b.Uh * b.Vh < w2lo b

/-- Walk the tree: returns the remaining characters if every leaf passes. -/
def walk (L : Nat) (A0 : List (List (List Int))) : Nat → List Char → Box → Option (List Char)
  | 0, _, _ => none
  | _ + 1, [], _ => none
  | fuel + 1, c :: cs, b =>
    if c = 'L' then (if leafOK L A0 b then some cs else none)
    else if c = 'F' then (if farLeaf b then some cs else none)
    else if c = 'X' then (if emptyLeaf b then some cs else none)
    else if c = 'U' ∨ c = 'V' ∨ c = 'W' then
      match walk L A0 fuel cs (splitBox b c).1 with
      | none => none
      | some rest => walk L A0 fuel rest (splitBox b c).2
    else none

/-- The root box `[0, 64]² × [−32, 32]`. -/
def rootBox : Box :=
  { Ul := 0, Uh := 64 * 2 ^ SC, Vl := 0, Vh := 64 * 2 ^ SC, Wl := -32 * 2 ^ SC, Wh := 32 * 2 ^ SC }

/-- `Σ_t |c_t| 2^{−k−1} 60^{i+j+k+1} ≤ (17/10) (qd/qn)^63` (the far field). -/
def farOK (ts : List ((Nat × Nat × Nat) × Rat)) : Bool :=
  let tot : Rat := ts.foldl (fun s t =>
    s + (if t.2 < 0 then -t.2 else t.2) / (2 : Rat) ^ (t.1.2.2 + 1)
      * (60 : Rat) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1)) 0
  decide (tot * (qn : Rat) ^ 63 ≤ 17 / 10 * (qd : Rat) ^ 63)

/-- **The phase cover check.** -/
def phiCoverOK (strs : List String) (tree : String) : Bool :=
  let ts := strs.map parseTerm
  let L := commonDen ts
  termsOK ts && farOK ts && (walk L (denseA0 ts) 64 tree.toList rootBox == some [])

end GrotheKernel
