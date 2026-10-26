import Mathlib.Data.Rat.Floor
import Mathlib.Data.List.MinMax

/-!
# Computable coverage checks for constrained cap pieces

The rational constraint data, direction checks and finite coverage predicate are
independent of the fibre-potential interpretation and symmetry proofs in `CapCover`.
-/

namespace Grothe.LowerAnalytic

/-- A linear constraint `lo ≤ v·vec(M y)`, and `≤ hi` when `hi` is given, with the S-lemma
multipliers `lam` (of `(τ − lo)(hi − τ)`) and `mu` (of `τ − lo`). -/
structure Cons where
  v : List ℚ
  lo : ℚ
  hi : Option ℚ
  lam : ℚ
  mu : ℚ

/-- `d` vanishes outside the coordinates `blk`. -/
def suppOK (d : List ℚ) (blk : List ℕ) : Bool :=
  (List.range 12).all fun i => blk.contains i || d.getD i 0 == 0

/-- Coefficientwise equality of two vectors on the first 12 coordinates. -/
def vecEq (v w : List ℚ) : Bool := (List.range 12).all fun i => v.getD i 0 == w.getD i 0

/-- Coefficientwise `v = −w`. -/
def vecNeg (v w : List ℚ) : Bool := (List.range 12).all fun i => v.getD i 0 == -w.getD i 0

/-- The coordinate (`0, 1, 2` for `d₀, d₂, d₃`) and sign of a constraint, if any. -/
def dirOf (ds : List (List ℚ)) (c : Cons) : Option (ℕ × Bool) :=
  if vecEq c.v (ds.getD 0 []) then some (0, true)
  else if vecNeg c.v (ds.getD 0 []) then some (0, false)
  else if vecEq c.v (ds.getD 1 []) then some (1, true)
  else if vecNeg c.v (ds.getD 1 []) then some (1, false)
  else if vecEq c.v (ds.getD 2 []) then some (2, true)
  else if vecNeg c.v (ds.getD 2 []) then some (2, false)
  else none

/-- The smallest element of `S` above `b` (or `b + 2`). -/
def nxt (S : List ℚ) (b : ℚ) : ℚ := ((S.filter fun c => decide (b < c)).min?).getD (b + 2)

/-- One rational sample per cell of the partition of the line by `S`. -/
def cands (S : List ℚ) : List ℚ :=
  (S.min?.getD 0 - 1) :: S.flatMap fun b => [b, (b + nxt S b) / 2]

/-- The rational condition `lo ≤ σ x (≤ hi)`. -/
def condQ (c : Cons) (σ : Bool) (x : ℚ) : Bool :=
  let t := if σ then x else -x
  decide (c.lo ≤ t) && match c.hi with
    | none => true
    | some h => decide (t ≤ h)

/-- The endpoints that a constraint contributes to its coordinate. -/
def bndsOf (c : Cons) (σ : Bool) : List ℚ :=
  if σ then c.lo :: c.hi.toList else -c.lo :: c.hi.toList.map Neg.neg

/-- The endpoints of coordinate `k` (and `0`). -/
def bndsK (ds : List (List ℚ)) (P : List (List Cons)) (k : ℕ) : List ℚ :=
  0 :: (P.flatMap fun pc => pc.flatMap fun c =>
    match dirOf ds c with
    | some (k', σ) => if k' = k then bndsOf c σ else []
    | none => [])

/-- A piece contains the sample point `q`. -/
def pieceAt (ds : List (List ℚ)) (pc : List Cons) (q : ℕ → ℚ) : Bool :=
  pc.all fun c =>
    match dirOf ds c with
    | some (k, σ) => condQ c σ (q k)
    | none => false

/-- **The coverage check**: the odd directions live on their blocks, and every sample of
`ℝ × [0, ∞)²` lies in some piece. -/
def capCoverOK (ds : List (List ℚ)) (P : List (List Cons)) : Bool :=
  suppOK (ds.getD 1 []) [6, 7, 10] && suppOK (ds.getD 2 []) [8, 9, 11] &&
    (cands (bndsK ds P 0)).all fun q0 => (cands (bndsK ds P 1)).all fun q2 =>
      (cands (bndsK ds P 2)).all fun q3 =>
        !decide (0 ≤ q2) || !decide (0 ≤ q3) ||
          P.any fun pc => pieceAt ds pc fun k => if k = 0 then q0 else if k = 1 then q2 else q3

end Grothe.LowerAnalytic
