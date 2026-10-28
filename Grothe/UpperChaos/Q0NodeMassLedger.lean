import Mathlib.Tactic

/-!
# Rational budget for a relaxed Gaussian node mass

This checks the arithmetic only. Connecting the quantities to the actual
quadrature, matrix contraction and omitted coefficients is separate.
Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0NodeMassLedger

def normUpper : ℚ := 11 / 10
def u : ℚ := 1 / 2^53
def rounding : ℚ := u / (1 - u)
def tinyInput : ℚ := 1 / 10^24
def conditionalError : ℚ := 2 / 10^16
/-- A deliberately coarse rational upper bound for the historical 10⁻²⁹⁰. -/
def underflow : ℚ := 1 / 10^24
def gamma749 : ℚ := 749 * u / (1 - 749 * u)
def scaleUpper : ℚ := (normUpper + 147 * tinyInput) / (1 - rounding)
def conditionalCenterUpper : ℚ :=
  (1 + u) * (1 + 179 * conditionalError) * scaleUpper + underflow
def conditionalInputError : ℚ :=
  179 * conditionalError * scaleUpper + rounding * scaleUpper + 147 * tinyInput +
    u * (1 + 179 * conditionalError) * scaleUpper + underflow
def primaryInputError : ℚ := 197 * rounding + 147 * 179 * tinyInput
def rawUpper : ℚ :=
  (10 / 7) * (gamma749 * 18 * conditionalCenterUpper + underflow +
    18 * conditionalInputError + primaryInputError * normUpper) +
  2310 * (6732 / 10^19) + 2310 * (1 / 10^27) * normUpper

theorem historical_underflow_le : (1 / 10^290 : ℚ) ≤ underflow := by
  unfold underflow
  apply one_div_le_one_div_of_le (by positivity)
  gcongr <;> norm_num

/-- A 107/100 squared-mass cap fits inside the chosen norm upper bound. -/
theorem mass_cap_lt_norm_sq : (107 / 100 : ℚ) < normUpper ^ 2 := by
  norm_num [normUpper]

/-- The original raw error cap survives all listed 11/10 norm factors. -/
theorem rawUpper_lt_cap : rawUpper < (5 / 10^12 : ℚ) := by
  norm_num [rawUpper, primaryInputError, conditionalInputError,
    conditionalCenterUpper, scaleUpper, gamma749, underflow, conditionalError,
    tinyInput, rounding, u, normUpper]

end Grothe.UpperChaos.Q0NodeMassLedger
