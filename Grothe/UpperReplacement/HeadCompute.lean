import Grothe.UpperReplacement.CertificateInputs
import Grothe.UpperReplacement.CellHeadCompute
import GrotheKernel.Haagerup

/-!
# Signed mixture-head computation

Agent-ID: codex-a7c4. All channels are added before absolute values are taken. Interval
coefficients may have either sign. A shortened cell head must have a separate proved
truncation allowance; this module does not assert that allowance or an upper bound.
-/

namespace Grothe.UpperReplacement.HeadCompute

open GrotheKernel Certificate

def horner (M : Nat) (Y : List Ival) : List Ival → List Ival
  | [] => []
  | a :: rest => (addL [a] (convI Y (horner M Y rest))).take M

/-- `P(X) · Σ a_k (X P(X)²)^k`, with all arithmetic truncated to `M` coefficients. -/
def compose (M : Nat) (pl : List Rat) (coefficients : List Ival) : List Ival :=
  let P := pl.map ofRatI
  let Y := zeroI :: convI P P
  (convI P (horner M Y coefficients)).take M

def phaseCoefficients (M : Nat) (pi : Ival) : List Ival :=
  (haagList M).map fun r ↦ mulI pi (ofRatI (r / 4))

def channelHead (M : Nat) (rows : List RowQ) (cellGrades : Array Ival) (pi : Ival)
    (c : Channel) : List Ival :=
  match c.kind with
  | .gt => bivarT M (tabI rows) (c.primary.map ofRatI) (c.auxiliary.map ofRatI) 501 167
  | .phase => compose M c.primary (phaseCoefficients M pi)
  | .tiger => compose (min M cellGrades.size) c.primary cellGrades.toList

def mixtureHead (M : Nat) (rows : List RowQ) (cellGrades : Array Ival) (pi : Ival) : List Ival :=
  sumL (channels.map fun c ↦ (channelHead M rows cellGrades pi c).map (mulI (ofRatI c.weight)))

def headOK (M : Nat) (rows : List RowQ) (cellGrades : Array Ival) (pi : Ival)
    (linearLower nonlinearUpper : Rat) : Bool :=
  let head := mixtureHead M rows cellGrades pi
  decide (ofRatHi linearLower ≤ (head.getD 0 zeroI).lo) &&
    decide (absSum (head.drop 1) ≤ ofRatLo nonlinearUpper)

end Grothe.UpperReplacement.HeadCompute
