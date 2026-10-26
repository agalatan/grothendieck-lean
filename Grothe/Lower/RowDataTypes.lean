import Mathlib.Data.Rat.Floor

/-!
# Computable row data and rational matrix types

The row constructors, node parser, rational matrix checks and constants used by the compiled
node-cap checker. This module imports no local soundness or lower-bound proof modules.
-/

namespace Grothe.Lower

/-- Parse `n` or `n/d`. -/
def parseQ (s : String) : ℚ :=
  match s.splitOn "/" with
  | [n] => (n.toInt! : ℚ)
  | [n, d] => (n.toInt! : ℚ) / (d.toNat! : ℚ)
  | _ => 0

/-- Parse a comma-separated list of rationals. -/
def parseQs (s : String) : List ℚ := if s = "" then [] else (s.splitOn ",").map parseQ

/-- The witness parameter `ε = 149/200`. -/
def ε : ℚ := 149 / 200

/-- The slack `10⁻¹¹` added to the node caps of the potentials. -/
def capPad : ℚ := 1 / 100000000000

/-- A symmetric `3×3` rational matrix (upper triangle). -/
structure Sym3 where
  m11 : ℚ
  m12 : ℚ
  m13 : ℚ
  m22 : ℚ
  m23 : ℚ
  m33 : ℚ

/-- `M − diag(a, b, c)`. -/
def Sym3.subDiag (M : Sym3) (a b c : ℚ) : Sym3 :=
  { M with m11 := M.m11 - a, m22 := M.m22 - b, m33 := M.m33 - c }

/-- Exact positive-semidefiniteness check of a symmetric `3×3` rational matrix (LDLᵀ with the
Schur complement scaled by `m₁₁`): `m₁₁ > 0`, `S₁₁ = m₂₂m₁₁ − m₁₂² > 0`, `det S ≥ 0`. -/
def Sym3.psdOK (M : Sym3) : Bool :=
  decide (0 < M.m11) && decide (0 < M.m22 * M.m11 - M.m12 ^ 2) &&
    decide (0 ≤ (M.m22 * M.m11 - M.m12 ^ 2) * (M.m33 * M.m11 - M.m13 ^ 2)
      - (M.m23 * M.m11 - M.m12 * M.m13) ^ 2)

/-- A real symmetric `2×2` rational matrix (upper triangle). -/
structure Sym2 where
  m11 : ℚ
  m12 : ℚ
  m22 : ℚ

/-- `M − diag(a, b)`. -/
def Sym2.subDiag (M : Sym2) (a b : ℚ) : Sym2 := { M with m11 := M.m11 - a, m22 := M.m22 - b }

/-- Exact positive-semidefiniteness check of a symmetric `2×2` rational matrix. -/
def Sym2.psdOK (M : Sym2) : Bool :=
  decide (0 < M.m11) && decide (0 ≤ M.m11 * M.m22 - M.m12 ^ 2)

structure Row where
  ell : ℚ
  beta : ℚ
  delta : ℚ
  kappa : ℚ
  smax : ℚ
  cap : ℚ
  /-- the even block `M_E` -/
  E : Sym3
  b1 : ℚ
  b2 : ℚ
  b3 : ℚ
  /-- node caps `r:c;…` -/
  nodes : String
  /-- mesh `v₁,v₂,…` -/
  mesh : String
  /-- the `x`-cells `xlo|xhi|rects|bank|nodes` -/
  cells : List String

def splitL (s sep : String) : List String := if s = "" then [] else s.splitOn sep

def parseCap (s : String) : ℚ × ℚ :=
  match s.splitOn ":" with
  | [a, b] => (parseQ a, parseQ b)
  | _ => (0, 0)

def Row.nodeList (r : Row) : List (ℚ × ℚ) := (splitL r.nodes ";").map parseCap

end Grothe.Lower
