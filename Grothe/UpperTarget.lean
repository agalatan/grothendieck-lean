import Grothe.StatementBridges
import Grothe.UpperChaos.GroupedRounder

/-!
# The upper-bound target, from the proof

This module connects the proof to the statement `Grothe.Statement.UpperTarget`
(`some Grothendieck bound is below 1.4046`, `Grothe/Statement.lean`).

* `upperBelow_of_bound`: a Grothendieck bound below `c` proves `UpperBelow c`. The upper bound
  `upper_below_tight` (`Grothe/UpperTightFinal.lean`) uses it.
* `upper_target_of_inputs`: the conditional sharper route. The target follows from the concrete
  rounding of `fresh_upper_concrete_taylor`; its hypotheses are the finite-band Gaussian error
  estimates of the three Taylor centers, which are not proved in Lean, and the energy-table accuracy
  (proved: `Final.hclose_final`). `main_bounds` does not use it.

What `UpperTarget` says about the constant (`K_G^ℂ < 1.4046`) is `constant_lt_of_upperBelow`
in `Grothe/StatementBridges.lean`.
-/

namespace Grothe.Statement

open GrotheKernel Grothe.Upper Grothe.UpperChaos

/-- A Grothendieck bound below `c` proves `UpperBelow c`. -/
theorem upperBelow_of_bound {K c : ℝ} (h : Grothe.IsGrothendieckBound K) (hK : K < c) :
    UpperBelow c :=
  ⟨K, isBound_iff.mpr h, hK⟩

/-- **The upper bound `K_G^ℂ < 1.4046`, conditional on the inputs not yet proved in Lean** (the bound
the rounding gives is below `1.404598149141`):
the finite-band Gaussian error estimates of the three Taylor centers (`hfirst`, `hsecond`, `hthird`)
and the accuracy of the energy table (`hclose`). Everything else is proved. -/
theorem upper_target_of_inputs
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ))
    (hclose : ∑ p ∈ Grothe.Upper.headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (Grothe.Upper.energyTable p : ℝ)| ≤
      (Grothe.Upper.energyErrQ : ℝ)) :
    UpperTarget :=
  upperBelow_of_bound (fresh_upper_concrete_taylor hfirst hsecond hthird hclose) (by norm_num)

end Grothe.Statement
