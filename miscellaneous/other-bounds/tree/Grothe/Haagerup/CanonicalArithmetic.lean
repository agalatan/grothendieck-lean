import GrotheKernel.ResolventTail

/-! Outward arithmetic for a finite head and its canonical resolvent completion. -/
namespace GrotheKernel

/-- Horner evaluation with a prescribed polynomial after the last coefficient. -/
def hornerWithTailI (N : Nat) (Y tail : List Ival) : List Rat → List Ival
  | [] => tail
  | r :: rs => (addL [ofRatI r] (convI Y (hornerWithTailI N Y tail rs))).take N

/-- The full head and resolvent correction are added before taking absolute values.
`rs` contains the head weights and `ds` their forward differences at `k`. -/
def completedHeadI (N k : Nat) (pl rl rs ds : List Rat) : List Ival :=
  let pi := pl.map ofRatI
  let ri := rl.map ofRatI
  let a := zeroI :: convI pi pi
  let tail := convI ri (hornerI N ((convI ri a).map negI) ds)
  convI pi (hornerWithTailI N a tail (rs.take k))

def completedHeadOK (N k : Nat) (pl rl rs ds : List Rat) (slope cap : Rat) : Bool :=
  decide (absSum (addL (completedHeadI N k pl rl rs ds) [negI (ofRatI slope)]) ≤
    ofRatLo cap)

end GrotheKernel
