import GrotheKernel.HardyArc
import Grothe.Upper.Data

/-!
# The data of the Hardy arc check

Everything the four native parts `HardyArcPart0–3` evaluate: the interval data of `R(t)` and the parameters of
`partOK`. It imports only the checker and the stored coefficient lists, so the parts (20–40 minutes each) are rebuilt
only when the checker or this data changes, not when the analytic modules that use their results change. The
soundness of these definitions is proved in `HardyArcSound`, `HardyArcCover` and `HardyArcMean`.
-/

namespace Grothe.UpperChaos.HardyArcSound

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper

/-- `√(4/5)` lies between two rationals. -/
def sqLo : ℚ := 894427190999915878563669467492 / 10 ^ 30
def sqHi : ℚ := 894427190999915878563669467493 / 10 ^ 30

/-- The interval of `√η`. -/
def sqI : Ival := ⟨ofRatLo sqLo, ofRatHi sqHi⟩

/-- The rational `p_u = 1/(1 + b²)`. -/
def puQ : ℚ := 1 / (1 + bQ ^ 2)

/-- Interval data of `R(t)`: the smoothing entries and the coefficient lists. -/
def hardyData : RData :=
  ⟨addI (ofRatI puQ) (mulI sqI (ofRatI (1 - puQ))),
   subI (ofRatI (puQ * bQ)) (mulI sqI (ofRatI (puQ * bQ))),
   addI (ofRatI (puQ * bQ ^ 2)) (mulI sqI (ofRatI (1 - puQ * bQ ^ 2))),
   pList.map ofRatI, qList.map ofRatI⟩

end Grothe.UpperChaos.HardyArcSound

namespace Grothe.UpperChaos.HardyArcCover

/-- The radius and the reference precision. -/
def rhoQ : ℚ := 4149 / 4000
def jQ : ℚ := 9 / 20

end Grothe.UpperChaos.HardyArcCover

namespace Grothe.UpperChaos.HardyArcMean

open GrotheKernel GrotheKernel.HardyArc HardyArcSound HardyArcCover

/-- The kernel parameters of the four parts: leaf width `D/1024`, tolerance `D/10`, depth `26`, `1024` pieces per
half, budget `2.73` each (scaled). -/
def partsOK (neg : Bool) (k₀ : ℕ) : Bool :=
  partOK (ofRatI jQ) (ofRatI rhoQ) hardyData neg (D / 1024) (D / 10) 26 1024 k₀ 1024 (273 * D / 100)

end Grothe.UpperChaos.HardyArcMean
