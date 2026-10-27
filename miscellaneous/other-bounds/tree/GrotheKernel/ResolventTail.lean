import GrotheKernel.PowerTail

/-! Outward-rounded certificates for a polynomial resolvent and its combined seed. -/
namespace GrotheKernel

def resolventDefectI (pl rl : List Rat) : List Ival :=
  let pi := pl.map ofRatI
  let di := addL [ofRatI 1] ((zeroI :: convI pi pi).map negI)
  addL [ofRatI 1] ((convI (rl.map ofRatI) di).map negI)

def resolventNormOK (pl rl : List Rat) (eta : Rat) : Bool :=
  decide (absSum (resolventDefectI pl rl) ≤ ofRatLo eta)

def seedNormOK (pl rl : List Rat) (s : Nat) (b : Rat) : Bool :=
  decide (absSum (convI (rl.map ofRatI) (polyPowI (pl.map ofRatI) s)) ≤ ofRatLo b)

def resolventTailI (k s : Nat) (q b gamma eta : Rat) : Ival :=
  mulI (ofRatI (2*b*gamma / (((k+1)*(2*k+1) : Nat) : Rat) / (1-eta)))
    (powIval (ofRatI q) ((2*k+1-s)/4))

def resolventTailOK (k s : Nat) (q b gamma eta cap : Rat) : Bool :=
  decide ((resolventTailI k s q b gamma eta).hi ≤ ofRatLo cap)

end GrotheKernel
