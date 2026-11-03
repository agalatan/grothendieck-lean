import Grothe.UpperChaos.Q0NodeMassLedger

/-! The current rational rounding ledger at norm bound 26/25.
The actual source estimates and numerical-operation model remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0NodeMassLedgerSharp

open Grothe.UpperChaos.Q0NodeMassLedger

/-- Norm allowance for weighted conditional data and the separate smoothing
input. The actual estimates are hypotheses of the corresponding consumers. -/
def normUpper : ℚ := 26 / 25

/-- 147 > sqrt(21577) converts a per-node scale error into an L2 error. -/
def scaleUpper : ℚ := (normUpper + 147 * tinyInput) / (1 - rounding)
/-- 179 > sqrt(31877) couples the selected conditional pairs before taking
absolute values; it is not one independent norm budget per primary charge. -/
def centerUpper : ℚ :=
  (1 + u) * (1 + 179 * conditionalError) * scaleUpper + underflow
def inputError : ℚ :=
  179 * conditionalError * scaleUpper + rounding * scaleUpper + 147 * tinyInput +
    u * (1 + 179 * conditionalError) * scaleUpper + underflow
/-- Raw tensor error budget. The constants describe the intended source model:
* 18: cap on each primary-center block's Frobenius norm (at most 251 rows);
* 10/7 > sqrt(2): exact reflection copies each canonical entry at most twice;
* 2310 > sqrt(5334252): converts per-raw-coefficient errors to a Frobenius error;
* 6732/10^19: allocated analytic integration error per raw coefficient;
* 1/10^27: omitted-coefficient product allowance (1e-30 times a 1000 norm cap).
The arithmetic theorem does not establish these analytic or source-model bounds. -/
def rawUpper : ℚ :=
  (10 / 7) * (gamma749 * 18 * centerUpper + underflow +
    18 * inputError + primaryInputError * normUpper) +
  2310 * (6732 / 10^19) + 2310 * (1 / 10^27) * normUpper

/-- The existing squared-mass cap gives the tighter norm budget. -/
theorem mass_cap_lt_norm_sq : (107 / 100 : ℚ) < normUpper ^ 2 := by
  norm_num [normUpper]

/-- Any nonnegative real mass below the certified cap has norm below 26/25. -/
theorem sqrt_mass_lt_norm {x : ℝ} (hx : 0 ≤ x) (hcap : x < 107 / 100) :
    Real.sqrt x < 26 / 25 := by
  have hs := Real.sqrt_nonneg x
  have hsq := Real.sq_sqrt hx
  nlinarith

/-- The same exact rounding ledger fits the 4.8e-12 target. -/
theorem rawUpper_lt_cap : rawUpper < (48 / 10^13 : ℚ) := by
  norm_num [rawUpper, inputError, centerUpper, scaleUpper, normUpper,
    primaryInputError, gamma749, underflow, conditionalError, tinyInput, rounding, u]


/-- 4/10^15 is the allocated relative smoothing-operator error. The ledger
fits after multiplying it by the separate smoothing-input norm allowance;
the actual operator estimate is still an input to the real transfer. -/
theorem rawUpper_add_smoothing_lt_cap :
    rawUpper + (4 / 10^15 : ℚ) * normUpper < 48 / 10^13 := by
  norm_num [rawUpper, inputError, centerUpper, scaleUpper, normUpper,
    primaryInputError, gamma749, underflow, conditionalError, tinyInput, rounding, u]


/-- Transfer the exact rational budget to real error estimates, keeping the
smoothing-vector norm as a separate hypothesis. -/
theorem real_error_lt_cap {raw smoothing L : ℝ}
    (hraw : raw ≤ (rawUpper : ℝ)) (hL : L ≤ (normUpper : ℝ))
    (hsmoothing : smoothing ≤ (4 / 10^15 : ℝ) * L) :
    raw + smoothing < (48 / 10^13 : ℝ) := by
  have hscale : (4 / 10^15 : ℝ) * L ≤ (4 / 10^15 : ℝ) * (normUpper : ℝ) :=
    mul_le_mul_of_nonneg_left hL (by positivity)
  have hcap : ((rawUpper + (4 / 10^15 : ℚ) * normUpper : ℚ) : ℝ) <
      (((48 / 10^13 : ℚ) : ℝ)) := by
    exact_mod_cast rawUpper_add_smoothing_lt_cap
  push_cast at hcap
  linarith

end Grothe.UpperChaos.Q0NodeMassLedgerSharp
