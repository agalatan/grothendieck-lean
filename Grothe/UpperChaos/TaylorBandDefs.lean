import Grothe.UpperChaos.GradedHermite
import Grothe.UpperChaos.TaylorBandData

/-! Exact third Taylor approximant and its comparison-band definitions.
No finite energy or decoding claim is asserted. Agent-ID: codex-8c4d. -/
open MeasureTheory
namespace Grothe.UpperChaos

/-- The complete, unscaled, third Taylor approximant. -/
noncomputable def thirdCenter : Lp ℂ 2 mu2 := gradedHermite 26 thirdCenterCoeff

/-- The four finite comparison bands, expressed by total degree. -/
def thirdCenterBandModes (k : Fin 4) : Set Idx2 :=
  {i | thirdCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ thirdCenterBandHi k}

instance (k : Fin 4) : DecidablePred (· ∈ thirdCenterBandModes k) := fun i =>
  inferInstanceAs (Decidable (thirdCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ thirdCenterBandHi k))

end Grothe.UpperChaos
