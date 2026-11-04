import Lean.Util.CollectAxioms
import Grothe.UpperChaos.FirstSecondCapturedTail
import Grothe.UpperChaos.ThirdCapturedTail

/-! Recompute every captured tail for the same common tolerance ledger.
The fourteen finite Gaussian norm premises are enlarged before the Taylor
factorial scaling. The resulting three tails are unscaled norms as well;
comparison pieces must divide the second by two and third by six exactly once.
No Gaussian enclosure is proved by this consumer. Agent-ID: codex-7c2e. -/

namespace Grothe.UpperChaos.CommonGaussianTailTolerance

open MeasureTheory
noncomputable section

def finiteIncrementQ : ℚ := 1 / 50000000
def firstErrorQ (k : Fin 6) : ℚ := firstCapturedErrorQ k + finiteIncrementQ
def secondErrorQ (k : Fin 4) : ℚ := secondCapturedErrorQ k + finiteIncrementQ
def thirdErrorQ (k : Fin 4) : ℚ := thirdCapturedErrorQ k + finiteIncrementQ

def firstTailQ : ℚ := 2764127 / 250000000000
def secondTailQ : ℚ := 318927 / 125000000000
def thirdTailQ : ℚ := 548393 / 250000000000

/-- Each new tail pays for the newly enlarged finite errors, rather than
reusing the original tail or the original grouped quadratic radii. -/
theorem first_tail_budget :
    capturedTaylorBudgetQ phaseMoment2Q firstCenterBandLowerQ firstErrorQ ≤ firstTailQ ^ 2 := by
  decide +kernel

theorem second_tail_budget :
    capturedTaylorBudgetQ phaseMoment4Q secondCenterBandLowerQ secondErrorQ ≤ secondTailQ ^ 2 := by
  decide +kernel

theorem third_tail_budget :
    thirdTailBudgetQ thirdCenterBandLowerQ thirdErrorQ ≤ thirdTailQ ^ 2 := by
  decide +kernel

/-- Six actual first-source Gaussian premises imply its recomputed tail. -/
theorem actual_first_tail
    (herror : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand firstTailIndex) (firstTaylorL2 - firstCenter)‖ ≤
      (firstTailQ : ℝ) :=
  norm_firstCenter_tail_le_with_errors firstErrorQ firstTailQ herror first_tail_budget
    (by norm_num [firstTailQ])

/-- Four actual second-source Gaussian premises imply its unscaled tail. -/
theorem actual_second_tail
    (herror : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand secondTailIndex) (secondTaylorL2 - secondCenter)‖ ≤
      (secondTailQ : ℝ) :=
  norm_secondCenter_tail_le_with_errors secondErrorQ secondTailQ herror second_tail_budget
    (by norm_num [secondTailQ])

/-- Four actual third-source Gaussian premises imply its unscaled tail,
using the actual stored center's norm and exact degree support. -/
theorem actual_third_tail
    (herror : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand thirdTailIndex) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdTailQ : ℝ) := by
  have hzero : bandProj (comparisonBand thirdTailIndex) thirdCenter = 0 := by
    change projOn (bandModes (comparisonBand thirdTailIndex)) thirdCenter = 0
    rw [thirdTailModes_eq]
    exact thirdCenter_tail_zero
  exact norm_third_tail_residual_le_with_cap thirdCenter thirdCenterBandLowerQ
    thirdErrorQ thirdTailQ thirdCenterBand_norm_lower herror hzero third_tail_budget
    (by norm_num [thirdTailQ])

end
end Grothe.UpperChaos.CommonGaussianTailTolerance

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.CommonGaussianTailTolerance.first_tail_budget,
      ``Grothe.UpperChaos.CommonGaussianTailTolerance.second_tail_budget,
      ``Grothe.UpperChaos.CommonGaussianTailTolerance.third_tail_budget] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do
      throwError m!"Unexpected common-tolerance axioms: {unexpected}"
