import GrotheKernel.Table

/-! Exact finite masses for the localized comparison (after coefficient-cost weighting). `hi = 0` means no upper cutoff. -/
namespace GrotheKernel

structure ComparisonBand where
  lo : Nat
  hi : Nat
  error : Rat
  norm : Rat
  deriving DecidableEq

def ComparisonBand.contains (b : ComparisonBand) (n m : Nat) : Bool :=
  b.lo < n + m && (b.hi == 0 || n + m ≤ b.hi)

/-- Reweight the finite energy rows; the Gaussian error is still priced once. -/
def weightedRows (rows : List RowQ) (w : Nat → Nat → Rat) : List RowQ :=
  rows.map fun r => (r.1, r.2.map fun e => (e.1, e.2 * w e.1 r.1 ^ 2))

def comparisonMass (rows : List RowQ) (b : ComparisonBand) : Rat :=
  (rows.map fun r => (r.2.map fun e => if b.contains e.1 r.1 then e.2 else 0).sum).sum

def comparisonOK (rows : List RowQ) (bands : List ComparisonBand) (err cap : Rat) : Bool :=
  bands.all (fun b => b.error ≥ 0 && b.norm ≥ 0 && comparisonMass rows b + err ≤ b.norm ^ 2) &&
  2 * (bands.map fun b => b.norm * b.error).sum +
    (bands.map fun b => b.error).sum ^ 2 ≤ cap

end GrotheKernel
