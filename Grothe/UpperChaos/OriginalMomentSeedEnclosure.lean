import Grothe.UpperChaos.OriginalMomentSeedInteger
import Grothe.UpperChaos.OriginalMomentSeedCheck

/-!
# A concrete enclosure of the original J₀ integral

The checked integer transcript encloses J₀ at the pinned rational midpoint
squared. Binding that midpoint to the physical row parameter and bounding
the sqrt(π) prefactor are separate obligations. This theorem takes no
numerical error hypothesis.

Agent-ID: codex-aa04. Refs #21.
-/

namespace Grothe.UpperChaos.OriginalMomentSeedEnclosure
open OriginalMomentSeedData OriginalMomentSeedCheck OriginalMomentSeedInteger

/-- Every proposed transition is checked, with no omitted indices. -/
private theorem steps (n : ℕ) (hn : n < 512 + 1) :
    lower (n + 1) * denominatorZ xDenominator n ≤ factorZ xNumerator n * upper n ∧
      factorZ xNumerator n * lower n ≤ upper (n + 1) * denominatorZ xDenominator n := by
  have hmem : n ∈ List.range' 0 513 := by
    exact List.mem_range'.2 ⟨n, hn, by simp⟩
  have h := (List.all_eq_true.mp all_steps) n hmem
  exact of_decide_eq_true h

/-- The checked transcript bounds the actual integral at its exact rational input. -/
theorem moment_mem :
    (enclosureLower : ℝ) / (scale : ℝ) ≤
        OriginalPositiveMoment.moment 0 ((xNumerator : ℝ) / (xDenominator : ℝ)) ∧
      OriginalPositiveMoment.moment 0 ((xNumerator : ℝ) / (xDenominator : ℝ)) ≤
        (enclosureUpper : ℝ) / (scale : ℝ) := by
  have h := moment_zero_mem_of_integer 512 scale xNumerator xDenominator radius lower upper
    parameters.1 parameters.2.1 parameters.2.2 initial steps terminal
  simpa only [lowerBoundZ, upperBoundZ, lower_sum, upper_sum,
    enclosureLower, enclosureUpper] using h

/-- Algebraic identity only: binding this midpoint to the physical row is separate. -/
theorem parameter_eq_midpoint_sq :
    (xNumerator : ℝ) / (xDenominator : ℝ) =
      ((midpoint : ℝ) / (scale : ℝ)) ^ 2 := by
  simp only [xNumerator, xDenominator, Int.cast_mul, div_pow, pow_two]

/-- Concrete enclosure of J₀ at the pinned rational midpoint squared. -/
theorem moment_midpoint_mem :
    (enclosureLower : ℝ) / (scale : ℝ) ≤
        OriginalPositiveMoment.moment 0 (((midpoint : ℝ) / (scale : ℝ)) ^ 2) ∧
      OriginalPositiveMoment.moment 0 (((midpoint : ℝ) / (scale : ℝ)) ^ 2) ≤
        (enclosureUpper : ℝ) / (scale : ℝ) := by
  simpa only [parameter_eq_midpoint_sq] using moment_mem

theorem enclosure_width_integer : enclosureUpper - enclosureLower = 73351 := by
  decide +kernel

/-- The exact numerical width, including the integrated remainder allowance. -/
theorem enclosure_width :
    (enclosureUpper : ℝ) / (scale : ℝ) - (enclosureLower : ℝ) / (scale : ℝ) =
      (73351 : ℝ) / (scale : ℝ) := by
  rw [← sub_div, ← Int.cast_sub, enclosure_width_integer]
  norm_num

/-- The checked common scale makes the full width an explicit power-of-two bound. -/
theorem enclosure_width_power :
    (enclosureUpper : ℝ) / (scale : ℝ) - (enclosureLower : ℝ) / (scale : ℝ) =
      (73351 : ℝ) / (2 : ℝ) ^ 1024 := by
  simpa only [scale_eq_power, Int.cast_pow, Int.cast_ofNat] using enclosure_width

end Grothe.UpperChaos.OriginalMomentSeedEnclosure

/-- info: 'Grothe.UpperChaos.OriginalMomentSeedEnclosure.moment_mem' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalMomentSeedEnclosure.moment_mem
/-- info: 'Grothe.UpperChaos.OriginalMomentSeedEnclosure.moment_midpoint_mem' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalMomentSeedEnclosure.moment_midpoint_mem
