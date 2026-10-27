import Grothe.UpperChaos.ComparisonPieces
import Grothe.UpperChaos.PhaseMoment2
import Grothe.UpperChaos.PhaseMoment4
import Grothe.UpperChaos.PhaseMoment6

/-!
# Exact norms of the three Taylor sources

The even phase moments are exactly the squared `L²` norms of the positive
Taylor sources used by the comparison decomposition. These identities supply
their total energies; estimates for individual comparison bands additionally
need the captured Hermite energy and approximation errors.

Agent-ID: codex-2ca4
-/

open MeasureTheory

namespace Grothe.UpperChaos

noncomputable section

/-- The first Taylor source has total energy equal to the second phase moment. -/
theorem norm_hpow_one_sq :
    ‖(chargeFn_hpow phiBound 1).memLp.toLp (hpow 1)‖ ^ 2 = (phaseMoment2Q : ℝ) :=
  (norm_hpow_toLp_sq_eq (j := 1) (by decide)).trans integral_phiT_sq

/-- The second Taylor source has total energy equal to the fourth phase moment. -/
theorem norm_hpow_two_sq :
    ‖(chargeFn_hpow phiBound 2).memLp.toLp (hpow 2)‖ ^ 2 = (phaseMoment4Q : ℝ) :=
  (norm_hpow_toLp_sq_eq (j := 2) (by decide)).trans integral_phiT_pow_four

/-- The third Taylor source has total energy equal to the sixth phase moment. -/
theorem norm_hpow_three_sq :
    ‖(chargeFn_hpow phiBound 3).memLp.toLp (hpow 3)‖ ^ 2 = (phaseMoment6Q : ℝ) :=
  (norm_hpow_toLp_sq_eq (j := 3) (by decide)).trans integral_phiT_pow_six

end

end Grothe.UpperChaos
