import GrotheQuadKernel

/-!
# The row-227 node as a native fact (cost measurement, `docs/QUAD_CHECKER.md` §11.4)

One `NodeSpec` literal (node 227 of the committed partition: panel 4 = [1, 2], order 62, the
bracket of index 31 of `Q0LegendreRule62`, cutoff 531) is accumulated into the zero accumulator by
`accumulateSpec`, and the entries 0 and 63001 are compared with the values of the milestone-2 run.
The fact measures the cost of a `native_decide` over the precompiled kernel; the module is excluded
from the `Grothe` root (`data/root-imports-exclude.txt`) and is not part of any proof.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Row227Fact

open GrotheQuad

/-- `profileQ`, `aQ` of `Grothe/Upper/Data.lean` as rationals (`data/quad-checker/profile.txt`). -/
def profile : ProfileData :=
  ⟨#[(509888697151587, 1250000000000000), (1592452691513103, 500000000000000000),
    (640284779707751, 125000000000000000), (142901914550863, 100000000000000000),
    (-1514225877130847, 1000000000000000000), (-9854978909658353, 10000000000000000000),
    (-433106588072407, 1000000000000000000), (28572288462058417, 100000000000000000000),
    (-5127576756513993, 10000000000000000000), (4280011654313799, 5000000000000000000),
    (-336844283516839, 400000000000000000), (869607565630577, 2000000000000000000)],
   7229250152720283, 250000000000000000⟩

/-- Node 227: panel `[1, 2]`, order 62, bracket 31 of rule 62 (`[lo, hi] / 2^640`), cutoff 531. -/
def node227 : NodeSpec :=
  ⟨1, 1, 2, 1, 62,
    ⟨114650899874979377689273316031068338956467605415691762931839861847958546058901462010762880492528003872455326791093334887479914695971648255193455885081050717937389912377384486361059252343372655,
     114650899874979377689273316031068338956467605415691762931839861847958546058901462010762880492528003872455326791093334887479914695971648255193455885081050717937389912377384486361059252343372658,
     640⟩,
    531⟩

def P0 : Nat := 1024
def piI : Ival := piMachinI P0 (P0 / 3 + 20)

/-- The node is accepted (every validity flag holds) and the accumulated entries `(0,0,0)` and
`(1,0,0)` (flat index 63001) are those of the milestone-2 run. -/
def check : Bool :=
  match accumulateSpec P0 piI profile 0 251 node227 rawZero with
  | none => false
  | some acc =>
    (rawGet acc 0 0 0).1 == 78525282267841828504090538347507860060654960618817179945265005165433736303 &&
    (rawGet acc 0 0 0).2 == 78525282267841828504090538347507860104223733632430872741433795837658752920 &&
    (rawGet acc 1 0 0).1 == 776622549699474244422624994135123718389813680187605262977113164582013901756

theorem node227_check : check = true := by native_decide

end Grothe.UpperQuad.Row227Fact
