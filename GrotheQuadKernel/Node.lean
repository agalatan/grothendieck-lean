import GrotheQuadKernel.Contract

/-!
# One node of the partition: node, weight, sign, shift, coefficients, validity flags

A node is given by its physical panel `[loN/loD, hiN/hiD]`, the order of its Gauss–Legendre rule,
the integer bracket of its root `x` (`Q0LegendreRuleNN.brackets`) and its conditional cutoff.
The kernel computes the node `s = lo + (hi−lo)/2 · (1 + x)` and the weight `(hi−lo)/2 · w(x)`
(`Q0GaussPhysical.panelNode`/`panelWeight`), the profile's sign and the shift
`A = √s / (κ |vprof s|)` (`profileShiftI`), and the canonical coefficients
`sign^{c+d} · S(A) · U_{c,d}` of the prefix `c + d ≤ cutoff` (`canonicalTriangleI`).  Every
condition that the soundness theorems need and the kernel cannot guarantee is a flag of
`nodeValid` (`Grothe/UpperQuad/NodeSound.lean`).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- One node of the partition. -/
structure NodeSpec where
  loN : Int
  loD : Nat
  hiN : Int
  hiD : Nat
  order : Nat
  bracket : Bracket
  cutoff : Nat
  deriving Repr, Inhabited

/-- The panel's lower end. -/
def panelLoI (P : Nat) (nd : NodeSpec) : Ival := ratI P nd.loN nd.loD

/-- The panel's half-width `(hi − lo)/2`. -/
def panelHalfI (P : Nat) (nd : NodeSpec) : Ival :=
  divN P 2 (subI P (ratI P nd.hiN nd.hiD) (panelLoI P nd))

/-- The node `s = lo + (hi−lo)/2 · (1 + x)`, `x` in the bracket. -/
def nodeS (P : Nat) (nd : NodeSpec) : Ival :=
  addI P (panelLoI P nd) (mulI P (panelHalfI P nd) (addI P (ofInt P 1) nd.bracket.toIval))

/-- The weight `(hi − lo)/2 · w(x)`. -/
def nodeW (P : Nat) (nd : NodeSpec) : Ival :=
  mulI P (panelHalfI P nd) (weightI P nd.order nd.bracket.toIval)

/-- The weight's divisor `n² P_{n−1}(x)²` is decided positive. -/
def weightValid (P : Nat) (nd : NodeSpec) : Bool :=
  isPos (mulN P (nd.order * nd.order) (sqI P (legendreI P nd.bracket.toIval (nd.order - 1))))

/-- The depth of the ratio recurrence for the cutoff `D`. -/
def ratioDepth (D : Nat) : Nat := D + 2000

/-- The profile's sign (`true` = negative) and the shift enclosure of a node (`none` if the sign
is undecided). -/
def nodeShift (P : Nat) (piI : Ival) (pd : ProfileData) (nd : NodeSpec) : Option (Bool × Ival) :=
  match profileShiftI P piI pd (nodeS P nd) with
  | none => none
  | some (_, neg, aI) => some (neg, aI)

/-- The moment ratios at `x = A²`. -/
def nodeRatios (P : Nat) (nd : NodeSpec) (aI : Ival) : Array Ival :=
  ratiosI P (sqI P aI) (ratioDepth nd.cutoff)

/-- The canonical coefficients `sign^{c+d} · S(A) · U_{c,d}` of the prefix `c + d ≤ cutoff`. -/
def nodeVals (P : Nat) (piI : Ival) (nd : NodeSpec) (neg : Bool) (aI : Ival) : Array Ival :=
  canonicalTriangleI P (seedScalarI P piI aI) neg zeroI aI (nodeRatios P nd aI) nd.cutoff 265

/-- The validity flags of a node. -/
def nodeValid (P : Nat) (nd : NodeSpec) (aI : Ival) : Bool :=
  bracketOK P nd.order nd.bracket && decide (0 < nd.loD) && decide (0 < nd.hiD) &&
    decide (1 ≤ nd.order) && weightValid P nd && isPos (nodeS P nd) &&
    nodeFactorsValid P (nodeS P nd) && isPos aI &&
    ratiosValid P (sqI P aI) (ratioDepth nd.cutoff) &&
    (List.range (nd.cutoff + 1)).all (fun n => isPos (sqrtNatI P (n + 1))) &&
    (List.range ((nd.cutoff + 1) / 2 + 1)).all (fun c => isPos (mulI P aI (sqrtNatI P (c + 1))))

/-- The profile's normalisation constants are decided positive (node-independent). -/
def profileValid (P : Nat) (piI : Ival) (pd : ProfileData) : Bool :=
  (List.range pd.coeffs.size).all fun j => isPos (nrmHalfI P (sqrtI P piI) j)

/-- The node's contribution to the accumulator: `none` if a flag fails. -/
def accumulateSpec (P : Nat) (piI : Ival) (pd : ProfileData) (nd : NodeSpec) (acc : Raw) :
    Option Raw :=
  match nodeShift P piI pd nd with
  | none => none
  | some (neg, aI) =>
    if nodeValid P nd aI then
      some (accumulateNode nd.cutoff ((nodeVals P piI nd neg aI).map toFx)
        (nodeFactors P (nodeS P nd) (nodeW P nd)) acc)
    else none

/-- Fold a list of nodes into the accumulator (`none` if any flag fails).  Written with
`Option.bind` rather than a `match`, so that the soundness proof never has to reduce a match on
the (large, symbolic) node computation. -/
def accumulateSpecs (P : Nat) (piI : Ival) (pd : ProfileData) : List NodeSpec → Raw → Option Raw
  | [], acc => some acc
  | nd :: rest, acc => (accumulateSpec P piI pd nd acc).bind (accumulateSpecs P piI pd rest)

end GrotheQuad
