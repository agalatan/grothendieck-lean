import Grothe.Upper.CheckerDefs
import GrotheKernel.Bivar

/-!
Smoke test of the bivariate routine: with the table `μ[2k+1, 0] = h_k/π` and `Q = 0`, `bivarFull`
must enclose the same numbers as `composeI` (the existing `𝔥 ∘ ρ` column), and the two
enclosures must overlap with tiny widths.  Run with `lake env lean scratch/BivarSmoke.lean`
(interpreted); the native timing of a 200×40 table lives in `scratch/BivarTiming.lean`.
-/

open GrotheKernel Grothe.Upper

def J : Nat := 40

/-- Haagerup's table as a single row `m = 0`. -/
def hTab : List RowI := [(0, (List.range J).map fun k => (2 * k + 1, hRatL.getD k zeroI))]

/-- The first branch whose preprocessor has a nonzero constant coefficient. -/
def i0 : Fin branches :=
  ((List.finRange branches).find? fun i => (rowQ i).getD 0 0 != 0).getD 0

def P0 : List Ival := rowI i0

def viaBivar : List Ival := bivarFull hTab P0 [] (2 * J - 1) 0
def viaCompose : List Ival := composeI 60 P0 (hRatL.take J)

/-- Overlap and width (scaled by `2^-128`) of the first few coefficients. -/
def report : List (Nat × Bool × Int × Int) :=
  (List.range 8).map fun n =>
    let a := viaBivar.getD n zeroI
    let b := viaCompose.getD n zeroI
    (n, decide (a.lo ≤ b.hi ∧ b.lo ≤ a.hi), a.hi - a.lo, (a.lo - b.lo).natAbs)

#eval report
#eval (viaBivar.length, viaCompose.length)

/-- Numeric values (scaled integers divided by `2^128`, printed as rationals) of the first
coefficients, against `h_0/π · P₀ ≈ 0.25 · 0.906…`. -/
#eval (List.range 4).map fun n =>
  let a := viaBivar.getD n zeroI
  (n, (a.lo : Rat) / (D : Rat), (viaCompose.getD n zeroI).lo == a.lo)
#eval (i0, (rowQ i0).take 3)
