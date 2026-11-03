import Grothe.StatementBridges
import Grothe.UpperChaos.GroupedRounder

/-!
# The upper-bound target, from the proof

This module connects the proof to the statement `Grothe.Statement.UpperTarget`
(`some Grothendieck bound is below 1.404598149141`, `Grothe/Statement.lean`).

* `upperBelow_of_bound`: a Grothendieck bound below `c` proves `UpperBelow c`.
* `upper_target_of_inputs`: **the current state of the upper bound.** The target follows from the
  concrete rounding of `fresh_upper_concrete_taylor`; its hypotheses are exactly what is not yet proved
  in Lean (the finite-band Gaussian error estimates of the three Taylor centers and the energy-table
  accuracy). When they are proved, an unconditional `theorem upper_target : UpperTarget` replaces it.
  Whether its proof then rests on standard axioms and the listed native facts only is what the axiom
  report (`scratch/Axioms.lean`, `scripts/check_axioms.py`) will show; this theorem's own report says
  nothing about the inputs.

What `UpperTarget` says about the constant (`K_G^ℂ < 1.404598149141`) is `constant_lt_of_upperBelow`
in `Grothe/StatementBridges.lean`.
-/

namespace Grothe.Statement

open GrotheKernel Grothe.Upper Grothe.UpperChaos

/-- A Grothendieck bound below `c` proves `UpperBelow c`. -/
theorem upperBelow_of_bound {K c : ℝ} (h : Grothe.IsGrothendieckBound K) (hK : K < c) :
    UpperBelow c :=
  ⟨K, isBound_iff.mpr h, hK⟩

/-- **The upper bound `K_G^ℂ < 1.404598149141`, conditional on the inputs not yet proved in Lean**:
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
