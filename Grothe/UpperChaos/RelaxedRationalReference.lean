import Grothe.UpperChaos.RelaxedEnergy
import Grothe.UpperChaos.ProductionF0RationalCompletion

/-! The exact dyadic reference feeds the actual relaxed selected-energy
consumer. Table agreement must concern this very rational output; no archived
floating-output certificate is transferred. All fourteen Gaussian inputs and
the actual Hardy tail remain explicit. Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset Grothe.Upper GrotheKernel

namespace Grothe.UpperChaos.RelaxedComparison
noncomputable section

open CompositeComparison FixedChaosSmoothing

variable
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ))

include hfirst hsecond hthird

/-- A coupled actual canonical tensor error, with the completion error
derived from the source norm, suffices for the relaxed selected head. -/
theorem head_residual_of_dyadic_reference (g : ℕ → ℕ → ℕ → ℚ)
    (hcanonical : canonicalTensorErrorNorm g ≤ (66 / 10 ^ 10 : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed (dyadicTensorReference g)) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff (energy rounding) j -
      if j = 0 then (slopeQ : ℝ) else 0| ≤ (RelaxedComparisonData.headResidualQ : ℝ) :=
  head_residual_of_raw_source hfirst hsecond hthird (dyadicTensorReference g)
    (raw_error_of_dyadicTensorReference g hcanonical) htable

/-- Conditional candidate through the actual source, rational completion,
frozen correction, smoothing and energy-table chain. No input is a statement
that the endpoint itself holds. Physical/source and table certificates for
the chosen canonical centers remain to be supplied. -/
theorem upper_of_dyadic_reference_and_tail (g : ℕ → ℕ → ℕ → ℚ)
    (hcanonical : canonicalTensorErrorNorm g ≤ (66 / 10 ^ 10 : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed (dyadicTensorReference g)) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ))
    (htail : ∑' n, |kernelCoeff (energy rounding) (n + 251)| ≤
      (CompositeComparisonData.rawTailQ : ℝ)) :
    IsGrothendieckBound (RelaxedComparisonData.upperQ : ℝ) :=
  upper_of_raw_source_and_tail hfirst hsecond hthird (dyadicTensorReference g)
    (raw_error_of_dyadicTensorReference g hcanonical) htable htail

end
end Grothe.UpperChaos.RelaxedComparison
