import Grothe.Statement
import Grothe.UpperSixExact.Bound

/-! # Existence of a complex Grothendieck bound from the six established channels

The lower proof needs an inhabitant of the set of Grothendieck bounds. Its witness is the
exact six-channel transfer factor. The production upper endpoint is in `Grothe.UpperResult`.
-/

set_option warningAsError true

namespace Grothe.UpperSix

/-- The exact six-channel bound used to witness nonemptiness in the lower-bound argument. -/
theorem bound : Statement.IsBound ((10 : ℝ) ^ 27 / 711968558203721328194311213) :=
  Haagerup.SixChannelExact.isBound

end Grothe.UpperSix
