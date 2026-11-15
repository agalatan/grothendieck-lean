import Grothe.UpperChaos.Q0BasePairKernel
import Grothe.UpperChaos.RectangleModelCheck

/-!
# Rounded model assembly for the shared degree-one base pair

Each leaf supplies proved models for the radial variable, the profile, the
division argument, and the shared kernel factor. This certificate checks only
the final arithmetic, including the sign of the companion numerator. The same
seven checks apply to direct and reciprocal cells.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0BasePairModelAssembly

open RectangleModelCheck

/-- Rounded intermediate models and their exact coefficient residual budgets.
Input models are passed separately so they need not be duplicated in each
certificate. -/
structure Certificate where
  twiceRadial : Model
  firstOutput : Model
  twiceProfile : Model
  negArgument : Model
  companionFactor : Model
  companionNumerator : Model
  companionOutput : Model
  twiceRadialBudget : ℚ
  firstBudget : ℚ
  twiceProfileBudget : ℚ
  negArgumentBudget : ℚ
  factorBudget : ℚ
  numeratorBudget : ℚ
  companionBudget : ℚ

/-- Every intermediate model is checked against the preceding operation;
neither the generator's rounding rule nor an intermediate range is trusted. -/
def Certificate.Verified (c : Certificate)
    (radial profile argument commonModel : Model) : Prop :=
  scaleOK 2 radial c.twiceRadial c.twiceRadialBudget = true ∧
  mulOK c.twiceRadial commonModel c.firstOutput c.firstBudget = true ∧
  scaleOK 2 profile c.twiceProfile c.twiceProfileBudget = true ∧
  scaleOK (-1) argument c.negArgument c.negArgumentBudget = true ∧
  addOK (constant 1) c.negArgument c.companionFactor c.factorBudget = true ∧
  mulOK c.twiceProfile c.companionFactor c.companionNumerator c.numeratorBudget = true ∧
  mulOK c.companionNumerator commonModel c.companionOutput c.companionBudget = true

instance (c : Certificate) (radial profile argument commonModel : Model) :
    Decidable (c.Verified radial profile argument commonModel) := by
  unfold Certificate.Verified
  infer_instance

/-- The companion model encloses the signed quantity, including cells where
`1 - a` changes sign. -/
theorem Certificate.sound (c : Certificate)
    (radial profile argument commonModel : Model)
    (hc : c.Verified radial profile argument commonModel)
    {x y s k a b : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hs : Contains radial x y s) (hk : Contains profile x y k)
    (ha : Contains argument x y a) (hb : Contains commonModel x y b) :
    Contains c.firstOutput x y (2 * s * b) ∧
      Contains c.companionOutput x y (2 * k * (1 - a) * b) := by
  rcases hc with ⟨hs2, hf, hk2, hneg, hfactor, hnum, hcomp⟩
  have hs2' : Contains c.twiceRadial x y (2 * s) := by
    simpa using scale_sound 2 radial c.twiceRadial c.twiceRadialBudget hs2 hx hy hs
  have hk2' : Contains c.twiceProfile x y (2 * k) := by
    simpa using scale_sound 2 profile c.twiceProfile c.twiceProfileBudget hk2 hx hy hk
  have hneg' : Contains c.negArgument x y (-a) := by
    simpa using scale_sound (-1) argument c.negArgument c.negArgumentBudget hneg hx hy ha
  have hone : Contains (constant 1) x y (1 : ℝ) := by
    simpa using contains_constant 1 x y
  have hfactor' : Contains c.companionFactor x y (1 - a) := by
    simpa only [sub_eq_add_neg] using
      add_sound (constant 1) c.negArgument c.companionFactor c.factorBudget
        hfactor hx hy hone hneg'
  have hnum' : Contains c.companionNumerator x y (2 * k * (1 - a)) :=
    mul_sound c.twiceProfile c.companionFactor c.companionNumerator c.numeratorBudget
      hnum hx hy hk2' hfactor'
  exact ⟨mul_sound c.twiceRadial commonModel c.firstOutput c.firstBudget hf hx hy hs2' hb,
    mul_sound c.companionNumerator commonModel c.companionOutput c.companionBudget
      hcomp hx hy hnum' hb⟩

/-- Bind the checked arithmetic to the actual direct kernels. The caller proves
the model for the division argument and the shared exponential factor. -/
theorem Certificate.direct_sound (c : Certificate)
    (radial profile argument commonModel : Model)
    (hc : c.Verified radial profile argument commonModel)
    {x y η s k u : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hs : Contains radial x y s) (hk : Contains profile x y k)
    (ha : Contains argument x y (u^2 * s / (1 + k^2 * u^2)))
    (hb : Contains commonModel x y (Q0BasePairKernel.common η s k u)) :
    Contains c.firstOutput x y (Q0BasePairKernel.first η s k u) ∧
      Contains c.companionOutput x y (Q0BasePairKernel.companion η s k u) := by
  exact c.sound radial profile argument commonModel hc hx hy hs hk ha hb

/-- Bind the same checked arithmetic to the actual reciprocal kernels, whose
shared factor already includes the change-of-variables Jacobian. -/
theorem Certificate.reciprocal_sound (c : Certificate)
    (radial profile argument commonModel : Model)
    (hc : c.Verified radial profile argument commonModel)
    {x y η s k v : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hs : Contains radial x y s) (hk : Contains profile x y k)
    (ha : Contains argument x y (s / (v^2 + k^2)))
    (hb : Contains commonModel x y (Q0BasePairKernel.reciprocalCommon η s k v)) :
    Contains c.firstOutput x y (Q0BasePairKernel.reciprocalFirst η s k v) ∧
      Contains c.companionOutput x y (Q0BasePairKernel.reciprocalCompanion η s k v) := by
  exact c.sound radial profile argument commonModel hc hx hy hs hk ha hb

end Grothe.UpperChaos.Q0BasePairModelAssembly
