import Grothe.UpperChaos.GradedHermite
import Grothe.UpperChaos.TaylorCenterBandData

/-! Exact finite comparison-band definitions for the first and second centers.
This module states no band-energy claim. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos

/-- The first center's six finite bands in the actual tensor Hermite degree. -/
def firstCenterBandModes (k : Fin 6) : Set Idx2 :=
  {i | firstCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ firstCenterBandHi k}

instance (k : Fin 6) : DecidablePred (· ∈ firstCenterBandModes k) := fun i =>
  inferInstanceAs (Decidable (firstCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ firstCenterBandHi k))

/-- The second center's four finite bands in the actual tensor Hermite degree. -/
def secondCenterBandModes (k : Fin 4) : Set Idx2 :=
  {i | secondCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ secondCenterBandHi k}

instance (k : Fin 4) : DecidablePred (· ∈ secondCenterBandModes k) := fun i =>
  inferInstanceAs (Decidable (secondCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ secondCenterBandHi k))

end Grothe.UpperChaos
