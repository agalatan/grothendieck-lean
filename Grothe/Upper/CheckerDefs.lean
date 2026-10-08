import Grothe.Upper.Interface
import GrotheKernel.Basic

/-!
# Concrete interval data of the certificate (definitions only)

Everything here is computable.  `dloIntFinal` is the scaled integer
`P₀ − Σ_{n≥1} |Pₙ|` certified by the kernel; its soundness is proved in `Checker.lean`.
-/

namespace Grothe.Upper

open GrotheKernel

/-- The mixture weights as rationals (`wtQ i = wt i`). -/
def wtQ : Fin 6 → ℚ :=
  ![0.983543458398378100, 0.012416654023174663, 0.003031585753026536,
    0.000593628184609741, 0.000016934659448514, 0.000397738981362458]

/-- Interval for `π` from Mathlib's 20-digit bounds. -/
def piI : Ival := boxI 3.14159265358979323846 3.14159265358979323847

/-- Interval lists for the five scalar preprocessors. -/
def rowI (i : Fin 5) : List Ival := (rowQ i).map ofRatI

/-- Intervals for `h_j/π`, `j < modes`. -/
def hRatL : List Ival := List.ofFn fun j : Fin modes => ofRatI (hRat j)

/-- `G = X · P²` as an interval list. -/
def gOf (PI : List Ival) : List Ival := zeroI :: convI PI PI

/-- Interval enclosures of the scalar profile coefficients `sProf (rowQ i) n`, `n < modes`. -/
def sProfL (i : Fin 5) : List Ival :=
  (convI (rowI i) (hornerT modes (gOf (rowI i)) hRatL)).take modes

/-- The scalar part `Σ_{i<5} w_i · sProf_i n` as an interval. -/
def scalarI (n : ℕ) : Ival :=
  addI (addI (addI (addI
    (mulI (ofRatI (wtQ 0)) ((sProfL 0).getD n zeroI))
    (mulI (ofRatI (wtQ 1)) ((sProfL 1).getD n zeroI)))
    (mulI (ofRatI (wtQ 2)) ((sProfL 2).getD n zeroI)))
    (mulI (ofRatI (wtQ 3)) ((sProfL 3).getD n zeroI)))
    (mulI (ofRatI (wtQ 4)) ((sProfL 4).getD n zeroI))

/-- Interval for `Re(A_n conj(B_n)) = Re A·Re B + Im A·Im B` from the data boxes. -/
def originI (n : ℕ) : Ival :=
  addI (mulI (boxI (coeffQ aReLo n) (coeffQ aReHi n)) (boxI (coeffQ bReLo n) (coeffQ bReHi n)))
       (mulI (boxI (coeffQ aImLo n) (coeffQ aImHi n)) (boxI (coeffQ bImLo n) (coeffQ bImHi n)))

/-- Interval for the retained mixture coefficient `c_n`, `n < modes`. -/
def cI (n : ℕ) : Ival :=
  addI (mulI piI (scalarI n)) (mulI (ofRatI (wtQ 5)) (originI n))

/-- The `modes` mixture coefficient intervals. -/
def cList : List Ival := List.ofFn fun n : Fin modes => cI n

/-- Interval list of the preprocessor polynomial `E`. -/
def etaI : List Ival := etaCoeffs.map ofRatI

/-- The certified scaled value of `P₀ − Σ_{n=1}^{…} |Pₙ|`, `P = E · Σ_j c_j (X E²)^j`. -/
def dloIntFinal : Int := dloInt (maxIndex + 1) etaI (gOf etaI) cList

end Grothe.Upper
