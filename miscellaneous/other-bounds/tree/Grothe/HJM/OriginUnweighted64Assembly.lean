import Grothe.HJM.OriginUnweightedWitnessMass

/-!
# Conditional assembly of the unweighted 64-mode certificates

Agent-ID: codex-aa04. The exact witness-mass
bounds are already supplied by `OriginUnweightedWitnessMass`. The two
actual response norm bounds and the two signed correlation bounds remain
explicit assumptions; this module does not assert their numerical truth.
-/

open MeasureTheory Finset

namespace Grothe.HJM.Origin

noncomputable section

/-- The actual left 64-mode witness requires only a residual norm cap and
one signed correlation after its exact mass check. -/
theorem leftUnweightedTail_of_64_norm_and_correlation
    (htotal : ‖fResidualLp‖ ^ 2 ≤ (46593520 / 10 ^ 8 : ℝ))
    (hcorr : (46592855 / 10 ^ 8 : ℝ) ≤
      (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.leftAlpha)
        fResidualLp 64).re) :
    leftUnweightedTail 120 ≤ (53 / 20000 : ℝ) ^ 2 :=
  leftUnweightedTail_of_64_targets htotal leftUnweightedWitness_mass hcorr

/-- The corresponding actual right witness requires the same two kinds of
input and retains every omitted mode in the suffix estimate. -/
theorem rightUnweightedTail_of_64_norm_and_correlation
    (htotal : ‖gResidualLp‖ ^ 2 ≤ (46577720 / 10 ^ 8 : ℝ))
    (hcorr : (46577050 / 10 ^ 8 : ℝ) ≤
      (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.rightAlpha)
        gResidualLp 64).re) :
    rightUnweightedTail 120 ≤ (53 / 20000 : ℝ) ^ 2 :=
  rightUnweightedTail_of_64_targets htotal rightUnweightedWitness_mass hcorr

end
end Grothe.HJM.Origin

namespace Grothe.HJM

noncomputable section

/-- The repriced origin-tail ledger follows from precisely the two actual
norm bounds and two signed witness correlations stated here. No numerical
claim about these four hypotheses is made. -/
theorem repriced_origin_tail_of_64_norms_and_correlations
    (hLtotal : ‖Origin.fResidualLp‖ ^ 2 ≤ (46593520 / 10 ^ 8 : ℝ))
    (hLcorr : (46592855 / 10 ^ 8 : ℝ) ≤
      (Origin.unweightedTestCorrelation
        (Origin.unweightedRationalTest OriginWitnessData.leftAlpha) Origin.fResidualLp 64).re)
    (hRtotal : ‖Origin.gResidualLp‖ ^ 2 ≤ (46577720 / 10 ^ 8 : ℝ))
    (hRcorr : (46577050 / 10 ^ 8 : ℝ) ≤
      (Origin.unweightedTestCorrelation
        (Origin.unweightedRationalTest OriginWitnessData.rightAlpha) Origin.gResidualLp 64).re) :
    |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (repricedOriginTail : ℝ) :=
  repriced_origin_tail_of_unweighted_residual_caps
    (Origin.leftUnweightedTail_of_64_norm_and_correlation hLtotal hLcorr)
    (Origin.rightUnweightedTail_of_64_norm_and_correlation hRtotal hRcorr)

end
end Grothe.HJM
