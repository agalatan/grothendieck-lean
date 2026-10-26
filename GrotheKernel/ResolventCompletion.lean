import GrotheKernel.ResolventTail

/-! Outward arithmetic for a finite head and its canonical resolvent completion. -/
namespace GrotheKernel

/-- The full head and resolvent correction are added before taking absolute values.
`rs` contains the head weights and `ds` their forward differences at `k`. -/
def completedHeadI (N k : Nat) (pl rl rs ds : List Rat) : List Ival :=
  let pi := pl.map ofRatI
  let ri := rl.map ofRatI
  let a := zeroI :: convI pi pi
  let rt := convI ri (List.replicate k zeroI ++ polyPowI pi (2*k+1))
  let head := convI pi (hornerI N a rs)
  let correction := convI rt (hornerI N ((convI ri a).map negI) ds)
  addL head correction

def completedHeadOK (N k : Nat) (pl rl rs ds : List Rat) (slope cap : Rat) : Bool :=
  decide (absSum (addL (completedHeadI N k pl rl rs ds) [negI (ofRatI slope)]) ≤
    ofRatLo cap)

end GrotheKernel
