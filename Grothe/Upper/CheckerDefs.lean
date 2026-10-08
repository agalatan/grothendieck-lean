import Grothe.Upper.Interface
import GrotheKernel.Basic

/-!
# Concrete interval data of the certificate (definitions only)

Everything here is computable.  `dloIntFinal` is the scaled integer
`mix₀ − Σ_{n≥1} |mixₙ| − Σᵢ wtᵢ (majTailᵢ + highTailᵢ)` certified by the kernel; its soundness
is proved in `Checker.lean`.  The `49` branch columns are computed in parallel tasks.
-/

namespace Grothe.Upper

open GrotheKernel

/-- Interval for `π` from Mathlib's 20-digit bounds. -/
def piI : Ival := boxI 3.14159265358979323846 3.14159265358979323847

/-- The weight of branch `i` as an interval. -/
def wtI (i : Fin branches) : Ival := ofRatI (wtQ i)

/-- Interval list of the preprocessor of branch `i`. -/
def rowI (i : Fin branches) : List Ival := (rowQ i).map ofRatI

/-- `[hRat j, …, hRat (j + n − 1)]`, given `cur = hRat j`. -/
def hRatFrom (j : ℕ) (cur : ℚ) : ℕ → List ℚ
  | 0 => []
  | n + 1 =>
    cur :: hRatFrom (j + 1) (cur * ((2 * (j : ℚ) + 1) ^ 2) / (4 * ((j : ℚ) + 1) * ((j : ℚ) + 2))) n

/-- `[hRat 0, …, hRat (cutoff − 1)]`. -/
def hRatQ : List ℚ := hRatFrom 0 (1 / 4) cutoff

/-- Intervals for `h_j/π`, `j < cutoff`. -/
def hRatL : List Ival := hRatQ.map ofRatI

/-- Lower bounds for `h_j/π`, `j < cutoff`. -/
def hRatLo : List Int := hRatQ.map ofRatLo

/-- Interval enclosures of the scalar profile coefficients `sProf (rowQ i) n`, `n < cutoff`. -/
def sProfL (i : Fin branches) : List Ival := composeI cutoff (rowI i) hRatL

/-- Scaled lower bound of `Σ_{n < cutoff} π · sProf (absRow i) n`. -/
def majSumLo (i : Fin branches) : Int :=
  ((composeLo cutoff ((absRow i).map ofRatLo) hRatLo).map (mulLo piI.lo)).sum

/-- Interval for `Re(A_n conj(B_n)) = Re A·Re B + Im A·Im B` from the data boxes. -/
def originI (aReLo aReHi aImLo aImHi bReLo bReHi bImLo bImHi : List ℚ) (n : ℕ) : Ival :=
  addI (mulI (boxI (coeffQ aReLo n) (coeffQ aReHi n)) (boxI (coeffQ bReLo n) (coeffQ bReHi n)))
       (mulI (boxI (coeffQ aImLo n) (coeffQ aImHi n)) (boxI (coeffQ bImLo n) (coeffQ bImHi n)))

/-- The `modes` coefficient intervals of the truncated origin kernel `H`. -/
def headA : List Ival :=
  List.ofFn fun n : Fin modes => originI aReLo aReHi aImLo aImHi bReLo bReHi bImLo bImHi n

/-- The `modes` coefficient intervals of the truncated origin kernel `H*`. -/
def headS : List Ival :=
  List.ofFn fun n : Fin modes => originI asReLo asReHi asImLo asImHi bsReLo bsReHi bsImLo bsImHi n

/-- The full finite composition of a truncated origin kernel with the preprocessor of
branch `i`. -/
def originCol (i : Fin branches) (head : List Ival) : List Ival :=
  composeI (fullLen i) (rowI i) head

/-- The retained column of branch `i` (`cutoff` intervals) and the scaled upper bound of its
computed tail budget: the positive majorant `1 − Σ_{n<cutoff} (𝔥 ∘ |ρᵢ|)_n` for a scalar
branch (clamped at `0`), the discarded coefficients for an origin branch. -/
def branchCol (i : Fin branches) : List Ival × Int :=
  match tag i with
  | .scalar => ((sProfL i).map (mulI piI), max 0 (D - majSumLo i))
  | .cauchy _ => ((sProfL i).map (mulI piI), 0)
  | .origin => let p := originCol i headA; (p.take cutoff, absSumFrom cutoff p)
  | .originStar => let p := originCol i headS; (p.take cutoff, absSumFrom cutoff p)

/-- All branch columns, computed in parallel. -/
def allCols : List (List Ival × Int) :=
  (List.ofFn fun i : Fin branches => Task.spawn fun _ => branchCol i).map Task.get

/-- The computed column and tail budget of branch `i`. -/
def colOf (i : Fin branches) : List Ival × Int := allCols.getD i ([], 0)

/-- The retained mixture column `Σᵢ wtᵢ · colᵢ`. -/
def mixCol : List Ival := mixL (List.ofFn wtI) (List.ofFn fun i => (colOf i).1)

/-- Scaled upper bound of `Σᵢ wtᵢ (majTailᵢ + highTailᵢ)`. -/
def tailsInt : Int := (List.ofFn fun i => wTailUp (wtI i) (colOf i).2).sum

/-- The certified scaled value of
`mix₀ − Σ_{n=1}^{cutoff−1} |mixₙ| − Σᵢ wtᵢ (majTailᵢ + highTailᵢ)`. -/
def dloIntFinal : Int := headLo mixCol - absSumFrom 1 mixCol - tailsInt

end Grothe.Upper
