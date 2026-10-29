import Grothe.Statement
import Grothe.UpperChaos.GroupedRounder

/-!
# The upper-bound target, from the proof

This module connects the proof to the statement `Grothe.Statement.UpperTarget`
(`K_G^ℂ < 1.404598149141`, `Grothe/Statement.lean`).

* `isBound_iff`: the statement's `IsBound` is the proof's `Grothe.IsGrothendieckBound`.
* `bounds_bddBelow`: every Grothendieck bound is nonnegative, so `K_G^ℂ` is a genuine infimum.
* `upperTarget_of_bound`: any Grothendieck bound below `1.404598149141` proves the target.
* `upper_target_of_inputs`: **the current state of the upper bound.** The target follows from the
  concrete rounding of `fresh_upper_concrete_taylor`; its hypotheses are exactly what is not yet proved
  in Lean (the finite-band Gaussian error estimates of the three Taylor centers and the energy-table
  accuracy). When they are proved, an unconditional `theorem upper_target : UpperTarget` replaces it.
-/

namespace Grothe.Statement

open GrotheKernel Grothe.Upper Grothe.UpperChaos

theorem isBound_iff {K : ℝ} : IsBound K ↔ Grothe.IsGrothendieckBound K := Iff.rfl

/-- Every Grothendieck bound is nonnegative: for the `1 × 1` matrix `(1)`, `V ≥ 1` and `C ≥ 0`. -/
theorem bounds_bddBelow : BddBelow {K | IsBound K} := by
  refine ⟨0, fun K hK => ?_⟩
  by_contra hneg
  push_neg at hneg
  let A : Fin 1 → Fin 1 → ℂ := fun _ _ => 1
  have hv : 1 ≤ Grothe.vectorOpt A := by
    have h := Grothe.le_vectorOpt A (x := fun _ => EuclideanSpace.single () 1)
      (y := fun _ => EuclideanSpace.single () 1) (fun _ => by simp) (fun _ => by simp)
    simpa [A] using h
  have hc := Grothe.scalarOpt_nonneg A
  have := hK 1 1 A
  change Grothe.vectorOpt A ≤ K * Grothe.scalarOpt A at this
  nlinarith

/-- A Grothendieck bound below `1.404598149141` proves the upper-bound target. -/
theorem upperTarget_of_bound {K : ℝ} (h : Grothe.IsGrothendieckBound K)
    (hK : K < 1404598149141 / 1000000000000) : UpperTarget :=
  lt_of_le_of_lt (csInf_le bounds_bddBelow (isBound_iff.mpr h)) hK

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
  upperTarget_of_bound (fresh_upper_concrete_taylor hfirst hsecond hthird hclose) (by norm_num)

end Grothe.Statement
