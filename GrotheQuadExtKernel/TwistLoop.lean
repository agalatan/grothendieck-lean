import GrotheQuadExtKernel.TwistNode

/-!
# The node loop of the twisted computation and its checks

The accumulator holds the Gauss–Legendre partial sums of `I_j` (one pair at the scale `2^{2 KOut}`)
and of the low-band coefficients `a_j(q, c, d)`, `2q + 1 ≤ D_low` (`[q][c][d]`, same scale).
`twistSpecs` folds the nodes with `Option.bind` (the checker's pattern: `none` if a flag fails).
The checks: `iPartialOK acc num den` (`acc.lo / 2^{2 KOut} ≥ num/den`) and `lowBandOK acc center E eps`
(the sum over the low band of the squared excursions of the enclosures from the center's
coefficients, at the scale `2^{4 KOut}`, is at most `eps`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace GrotheQuad

/-- The accumulator. -/
structure TwAcc where
  iPart : Int × Int
  low : Array (Array (Array (Int × Int)))
  deriving Inhabited

/-- The zero accumulator for `Qlow` grades. -/
def twAccZero (Qlow : Nat) : TwAcc :=
  ⟨(0, 0), Array.ofFn fun q : Fin Qlow => Array.ofFn fun _ : Fin (q.val + 2) =>
    Array.ofFn fun _ : Fin (q.val + 1) => ((0 : Int), (0 : Int))⟩

def lowGet (low : Array (Array (Array (Int × Int)))) (q c d : Nat) : Int × Int :=
  ((low.getD q #[]).getD c #[]).getD d (0, 0)

/-- Add a node's output to the accumulator. -/
def twAccAdd (Qlow : Nat) (acc : TwAcc) (out : TwistNodeOut) : TwAcc :=
  ⟨addPair acc.iPart out.iPart,
    Array.ofFn fun q : Fin Qlow => Array.ofFn fun c : Fin (q.val + 2) => Array.ofFn fun d : Fin (q.val + 1) =>
      addPair (lowGet acc.low q.val c.val d.val) (lowGet out.low q.val c.val d.val)⟩

/-- One node's contribution (`none` if a flag fails). -/
def twistSpec (P : Nat) (piI : Ival) (pd : ProfileData) (prm : TwistParams) (tabs : TwistTables)
    (nd : NodeSpec) (acc : TwAcc) : Option TwAcc :=
  match nodeShift P piI pd nd with
  | none => none
  | some (neg, aI) =>
    if twistValid P prm nd aI then
      some (twAccAdd (twistQlow prm) acc (twistNode P prm tabs piI (nodeS P nd) (nodeW P nd) neg aI))
    else none

/-- The fold over the nodes. -/
def twistSpecs (P : Nat) (piI : Ival) (pd : ProfileData) (prm : TwistParams) (tabs : TwistTables) :
    List NodeSpec → TwAcc → Option TwAcc
  | [], acc => some acc
  | nd :: rest, acc => (twistSpec P piI pd prm tabs nd acc).bind (twistSpecs P piI pd prm tabs rest)

/-- `acc.iPart.lo / 2^{2 KOut} ≥ num / den` (`den > 0`). -/
def iPartialOK (acc : TwAcc) (num : Int) (den : Nat) : Bool :=
  acc.iPart.1 * den ≥ num * pow2 (2 * KOut)

/-- The excursion of the center value `t` (scale `2^{2 KOut}`) from the enclosure `e`. -/
def excursionTw (e : Int × Int) (t : Int) : Int := max (max (e.2 - t) (t - e.1)) 0

/-- `Σ_{q < Qlow, c ≤ q+1, d ≤ q} excursion²` at the scale `2^{4 KOut}`. -/
def lowBandExcursionSq (acc : TwAcc) (center : Array Int) (E Qlow : Nat) : Int :=
  (List.range Qlow).foldl (fun s q => (List.range (q + 2)).foldl (fun s c => (List.range (q + 1)).foldl
    (fun s d =>
      s + (excursionTw (lowGet acc.low q c d) (center.getD (gradedFlat q c d) 0 * pow2 (2 * KOut - E))) ^ 2)
    s) s) 0

/-- The low-band check. -/
def lowBandOK (acc : TwAcc) (center : Array Int) (E Qlow : Nat) (eps : Int) : Bool :=
  lowBandExcursionSq acc center E Qlow ≤ eps

end GrotheQuad
