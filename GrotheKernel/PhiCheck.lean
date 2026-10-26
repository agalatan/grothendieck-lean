/-!
# The phase cover checker (Mathlib-free, precompiled)

Checks `φ² ≤ 99/100` for the phase `φ = D e^{−ε(U+V)} S(U, V, W)` of the upper certificate
(`Grothe/UpperChaos/PhiCover.lean` proves soundness).  The phase polynomial `S` comes from the
strings `i,j,k:p/q` of `Data.lean` (`parseTerm`).  With `L` the common denominator and
`SC = 16`, the integer array `A0[i][j][k] = Σ L c_{ijk} 2^{SC(17 − i − j − k)}` satisfies
`A0(2^SC U, 2^SC V, 2^SC W) = L 2^{17 SC} S(U, V, W)`.  On a leaf box (integer coordinates in units
`2^{−SC}`, centre `m`, half-widths `r`) the array is Taylor-shifted to the centre (`shiftAll`); the
exponential is expanded to first order around the centre: with `h_s = h_U + h_V`,
`e^{−ε h_s} S = S (1 − ε h_s) + S R` and `|R| ≤ a²/2 + 2a³/9`, `a = ε (r_U + r_V) ≤ 1`, so
`|e^{−ε h_s} S| ≤ (|P1|_r/(20·2^SC) + |B|_r (a²/2 + 2a³/9))/(L 2^{17 SC})` with the integer array
`P1 = 20·2^SC·B − 21 (y_U + y_V) B` (`firstOrder`); `e^{−x}` at the centre is bounded by
`q^n · 720 den⁶/T(f)` (`q = 10⁹/2718281828`, `T` the degree-6 Taylor polynomial of `e^{f/den}`); the leaf
test is an integer inequality (`leafOK`).  The bisection trees are strings over `U V W L F X` (`walk`);
the root box is first split into 512 cubes (`phiSplit`), one tree each.
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

/-- `x · B` and `y · B` (outer index `U`, then `V`). -/
def mulU (B : List (List (List Int))) : List (List (List Int)) := [] :: B
def mulV (B : List (List (List Int))) : List (List (List Int)) := B.map fun row => [] :: row
def add3 (a b : List (List (List Int))) : List (List (List Int)) := zipAddG add2 a b
def smul3 (m : Int) (a : List (List (List Int))) : List (List (List Int)) := a.map (smul2 m)

/-- `20·2^SC·B − 21 (y_U + y_V) B`: the first-order factor `20·2^SC (1 − ε h_s)` times `B`. -/
def firstOrder (B : List (List (List Int))) : List (List (List Int)) :=
  add3 (smul3 (20 * 2 ^ SC) B) (smul3 (-21) (add3 (mulU B) (mulV B)))

/-- `720 den⁶ · T(f/den)`, `T` the degree-6 Taylor polynomial of the exponential. -/
def expDen (f den : Int) : Int :=
  720 * den ^ 6 + 720 * f * den ^ 5 + 360 * f ^ 2 * den ^ 4 + 120 * f ^ 3 * den ^ 3
    + 30 * f ^ 4 * den ^ 2 + 6 * f ^ 5 * den + f ^ 6

/-- The target `φ² ≤ tN / tD`. -/
def tN : Nat := 99
def tD : Nat := 100

/-- The exponential test: with `e^{−21 s/den} ≤ (qn/qd)^n · 720 den⁶/expDen f den` (`21 s = den n + f`),
`(M/S²) e^{−21 s/den} (G/(Gd L S^DEG))² ≤ tN/tD`. -/
def expTest (L : Nat) (M s G Gd : Int) : Bool :=
  let S : Int := (2 : Int) ^ SC
  let den : Int := 10 * S
  let n : Nat := (21 * s / den).toNat
  0 ≤ s && 0 < Gd &&
    (tD : Int) * M * (qn : Int) ^ n * den ^ 6 * 720 * G ^ 2
      ≤ (tN : Int) * S ^ 2 * (qd : Int) ^ n * expDen (21 * s - den * n) den * Gd ^ 2 * ((L : Int) * S ^ DEG) ^ 2

/-- The first-order test: the exponential at the centre `s = m_U + m_V`, the first-order bound for
`e^{−ε h_s} S` (only for `a = ε (r_U + r_V) ≤ 1`). -/
def firstTest (L : Nat) (B : List (List (List Int))) (M mU mV rU rV rW : Int) : Bool :=
  let S : Int := (2 : Int) ^ SC
  let Pn : Int := absEval3 rU.toNat rV.toNat rW.toNat (firstOrder B)
  let Sn : Int := absEval3 rU.toNat rV.toNat rW.toNat B
  21 * (rU + rV) ≤ 20 * S &&
    expTest L M (mU + mV) (18 * (20 * S) ^ 2 * Pn
      + Sn * (180 * S * (21 * (rU + rV)) ^ 2 + 4 * (21 * (rU + rV)) ^ 3)) (18 * (20 * S) ^ 3)

/-- **The leaf test** (for `S` with common denominator `L` and array `A0`):
`(UV − W²) e^{−2ε(U+V)} S² ≤ tN/tD` on the box, `ε = 21/20`.  Either the exponential at the lower corner
with `|S| ≤ |B|_r` (cheap), or the first-order test. -/
def leafOK (L : Nat) (A0 : List (List (List Int))) (b : Box) : Bool :=
  let mU := (b.Ul + b.Uh) / 2
  let mV := (b.Vl + b.Vh) / 2
  let mW := (b.Wl + b.Wh) / 2
  let rU := mU - b.Ul
  let rV := mV - b.Vl
  let rW := mW - b.Wl
  -- the box is centred: `Uh − mU = mU − Ul` etc.
  let centred := b.Uh - mU = rU && b.Vh - mV = rV && b.Wh - mW = rW
  let B := shiftAll mU mV mW A0
  let M : Int := max 0 (min (b.Uh * b.Vh - w2lo b)
    (mU * mV - mW * mW + mV * rU + mU * rV + 2 * (mW.natAbs : Int) * rW + rU * rV))
  centred && 0 ≤ b.Ul && 0 ≤ b.Vl && 0 ≤ rU && 0 ≤ rV && 0 ≤ rW &&
    (expTest L M (b.Ul + b.Vl) (absEval3 rU.toNat rV.toNat rW.toNat B) 1
      || firstTest L B M mU mV rU rV rW)

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

/-- All boxes after the splits `cs`, in tree order. -/
def splitAll : List Char → Box → List Box
  | [], b => [b]
  | c :: cs, b => splitAll cs (splitBox b c).1 ++ splitAll cs (splitBox b c).2

/-- The first splits: 512 cubes of side 8. -/
def phiSplit : List Char := ['U', 'V', 'W', 'U', 'V', 'W', 'U', 'V', 'W']

/-- `Σ_t |c_t| 2^{−k−1} 60^{i+j+k+1} ≤ (1/10) (qd/qn)^63` (the far field: `|φ| ≤ 1/10`). -/
def farOK (ts : List ((Nat × Nat × Nat) × Rat)) : Bool :=
  let tot : Rat := ts.foldl (fun s t =>
    s + (if t.2 < 0 then -t.2 else t.2) / (2 : Rat) ^ (t.1.2.2 + 1)
      * (60 : Rat) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1)) 0
  decide (tot * (qn : Rat) ^ 63 ≤ 1 / 10 * (qd : Rat) ^ 63)

/-- The admissibility and far-field part of the check (cheap). -/
def phiHeadOK (strs : List String) : Bool :=
  let ts := strs.map parseTerm
  termsOK ts && farOK ts

/-- Cube `i` of `phiSplit` passes with tree `trees[i]`. -/
def phiCubeOK (L : Nat) (A0 : List (List (List Int))) (trees : List String) (i : Nat) : Bool :=
  walk L A0 100 (trees.getD i "").toList ((splitAll phiSplit rootBox).getD i rootBox) == some []

/-- **The phase cover on the cubes `lo, …, hi − 1`** (one `native_decide` per range). -/
def phiRangeOK (strs trees : List String) (lo hi : Nat) : Bool :=
  let ts := strs.map parseTerm
  phiHeadOK strs && (List.range' lo (hi - lo)).all (phiCubeOK (commonDen ts) (denseA0 ts) trees)

end GrotheKernel
