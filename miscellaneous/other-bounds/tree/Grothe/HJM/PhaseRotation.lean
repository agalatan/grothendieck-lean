/- Intended path: Grothe/HJM/PhaseRotation.lean -/
import Grothe.HJM.Assembly
import Grothe.HJM.MixtureHead

/-!
# Phase rotations of the asymmetric branch

Before reflection symmetrization, a pair of charge-one Gaussian responses has
complex coefficients `aₙ = conj ⟪eₙ,F⟫ * ⟪eₙ,G⟫`. Multiplying the second
response by any `ζ` in the closed unit disk gives the real coefficient
`Re (ζ aₙ)` after symmetrization. Thus the imaginary coefficients remain a
usable degree of freedom in the six-branch HJM mixture. All kernels below are
realized by the original response pair; no numerical enclosure is assumed.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM

noncomputable section

/-- The signed coefficients after rotating the second response and reflecting. -/
def rotatedPairCoeff (ζ : ℂ) (F G : Lp ℂ 2 gaussC) (n : ℕ) : ℝ :=
  (ζ * scalarPairCoeff F G n).re

lemma rotatedPairCoeff_eq_symmetrized (ζ : ℂ) (F G : Lp ℂ 2 gaussC) (n : ℕ) :
    rotatedPairCoeff ζ F G n = symmetrizedPairCoeff F (ζ • G) n := by
  change (ζ * (conj (chargeOneCoeff F n) * chargeOneCoeff G n)).re =
    (conj (chargeOneCoeff F n) * chargeOneCoeff (ζ • G) n).re
  rw [show chargeOneCoeff (ζ • G) n = ζ * chargeOneCoeff G n by
    simp only [chargeOneCoeff, inner_smul_right]]
  apply congrArg Complex.re
  ring

/-- Phase rotation preserves absolute summability of the actual coefficients. -/
theorem rotatedPairCoeff_summable (ζ : ℂ) (F G : Lp ℂ 2 gaussC) :
    Summable fun n => |rotatedPairCoeff ζ F G n| := by
  simpa only [rotatedPairCoeff_eq_symmetrized] using
    symmetrizedPairCoeff_summable F (ζ • G)

/-- Rotation and reflection give a valid dominated radial kernel, including
the boundary of the correlation disk. `G` need not itself have charge one. -/
theorem rotatedPairCoeff_dominated {F G : ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) (hG1 : ∀ z, ‖G z‖ ≤ 1)
    (hF : MemLp F 2 gaussC) (hG : MemLp G 2 gaussC)
    (hcharge : ∀ c z, ‖c‖ = 1 → F (c * z) = c * F z)
    (ζ : ℂ) (hζ : ‖ζ‖ ≤ 1) :
    DominatedKernel (radialKernel (rotatedPairCoeff ζ (hF.toLp F) (hG.toLp G))) := by
  have hmul : ζ • G = (fun z => ζ * G z) := by
    funext z
    simp only [Pi.smul_apply, smul_eq_mul]
  have hGζ : MemLp (fun z => ζ * G z) 2 gaussC := by
    rw [← hmul]
    exact hG.const_smul ζ
  have hGζ1 (z : ℂ) : ‖ζ * G z‖ ≤ 1 := by
    rw [norm_mul]
    calc ‖ζ‖ * ‖G z‖ ≤ 1 * 1 := mul_le_mul hζ (hG1 z) (norm_nonneg _) zero_le_one
      _ = 1 := one_mul _
  have hGζlp : hGζ.toLp (fun z => ζ * G z) = ζ • hG.toLp G := by
    calc
      _ = (hG.const_smul ζ).toLp (ζ • G) := by
        apply MemLp.toLp_congr hGζ (hG.const_smul ζ)
        exact Filter.Eventually.of_forall fun z => by simp only [Pi.smul_apply, smul_eq_mul]
      _ = _ := MemLp.toLp_const_smul ζ hG
  have hdom := symmetrizedPairCoeff_dominated (G := fun z => ζ * G z)
    hFm (measurable_const.mul hGm)
    hF1 hGζ1 hF hGζ hcharge
  rw [hGζlp] at hdom
  have hcoeff : rotatedPairCoeff ζ (hF.toLp F) (hG.toLp G) =
      symmetrizedPairCoeff (hF.toLp F) (ζ • hG.toLp G) := by
    funext n
    exact rotatedPairCoeff_eq_symmetrized ζ _ _ n
  rwa [hcoeff]

namespace Origin

/-- The actual sixth-branch coefficients after a response rotation. -/
def rotatedCoeff (ζ : ℂ) : ℕ → ℝ := rotatedPairCoeff ζ FLp GLp

theorem rotatedCoeff_one (n : ℕ) : rotatedCoeff 1 n = coeff n := by
  simp [rotatedCoeff, rotatedPairCoeff, coeff, symmetrizedPairCoeff]

/-- A quarter-turn exposes the imaginary cross-coefficients. -/
theorem rotatedCoeff_I (n : ℕ) :
    rotatedCoeff Complex.I n = -(scalarPairCoeff FLp GLp n).im := by
  simp [rotatedCoeff, rotatedPairCoeff, Complex.mul_re]

theorem rotatedCoeff_summable (ζ : ℂ) : Summable fun n => |rotatedCoeff ζ n| :=
  rotatedPairCoeff_summable ζ FLp GLp

theorem rotatedCoeff_dominated (ζ : ℂ) (hζ : ‖ζ‖ ≤ 1) :
    DominatedKernel (radialKernel (rotatedCoeff ζ)) :=
  rotatedPairCoeff_dominated measurable_F measurable_G norm_F_le norm_G_le
    memLp_F memLp_G F_charge ζ hζ

end Origin

/-- The original five scalar branches and the rotated sixth branch. -/
def rotatedBranches (ζ : ℂ) (r : Fin 6) : ℕ → ℝ :=
  if r = 5 then Origin.rotatedCoeff ζ else hc r

theorem rotatedBranches_one (r : Fin 6) : rotatedBranches 1 r = hc r := by
  by_cases hr : r = 5
  · subst r
    funext n
    simp only [rotatedBranches, ite_true, Origin.rotatedCoeff_one]
    rfl
  · simp [rotatedBranches, hr]

theorem rotatedBranches_summable (ζ : ℂ) (r : Fin 6) :
    Summable fun n => |rotatedBranches ζ r n| := by
  by_cases hr : r = 5
  · subst r
    simpa [rotatedBranches] using Origin.rotatedCoeff_summable ζ
  · simpa [rotatedBranches, hr] using summable_hc r

theorem rotatedBranches_dominated (ζ : ℂ) (hζ : ‖ζ‖ ≤ 1) (r : Fin 6) :
    DominatedKernel (radialKernel (rotatedBranches ζ r)) := by
  by_cases hr : r = 5
  · subst r
    simpa [rotatedBranches] using Origin.rotatedCoeff_dominated ζ hζ
  · simpa [rotatedBranches, hr] using dominated_hc r

/-- The actual six-branch mixture after rotation of its asymmetric response. -/
def rotatedQhat (ζ : ℂ) (n : ℕ) : ℝ := ∑ r, wt r * rotatedBranches ζ r n

theorem rotatedQhat_one (n : ℕ) : rotatedQhat 1 n = qhat n := by
  simp only [rotatedQhat, qhat, rotatedBranches_one]

/-- Every point of the closed rotation disk gives a valid HJM-style upper
bound when its *full* signed coefficient score is positive. -/
theorem rotated_hjm_bound (ζ : ℂ) (hζ : ‖ζ‖ ≤ 1)
    (hres : ∑' n, |rotatedQhat ζ (n + 1)| < rotatedQhat ζ 0) :
    IsGrothendieckBound ((ScalarTailRefinement.selectorMass : ℝ) /
      (rotatedQhat ζ 0 - ∑' n, |rotatedQhat ζ (n + 1)|)) := by
  have hmass : (0 : ℝ) < ScalarTailRefinement.selectorMass := by
    norm_num [ScalarTailRefinement.selectorMass]
  simpa only [rotatedQhat] using
    (mixture_bound Finset.univ wt (rotatedBranches ζ)
      (fun r _ => rotatedBranches_summable ζ r)
      (fun r _ => rotatedBranches_dominated ζ hζ r)
      hmass (le_of_eq weights_mass) (by simpa only [rotatedQhat] using hres))

/-- A finite rotated head and weighted branch-tail budget give an explicit
upper bound without assuming the infinite coefficient score directly. -/
theorem rotated_hjm_bound_of_finite_head (ζ : ℂ) (hζ : ‖ζ‖ ≤ 1)
    (N : ℕ) (slope tail : ℝ) (hslope : slope ≤ rotatedQhat ζ 0)
    (htail : (∑ r, |wt r| * ∑' j, |rotatedBranches ζ r (j + (N + 1))|) ≤ tail)
    (hscore : (∑ j ∈ Finset.range N, |rotatedQhat ζ (j + 1)|) + tail < slope) :
    IsGrothendieckBound ((ScalarTailRefinement.selectorMass : ℝ) /
      (slope - (∑ j ∈ Finset.range N, |rotatedQhat ζ (j + 1)|) - tail)) := by
  have hmass : (0 : ℝ) < ScalarTailRefinement.selectorMass := by
    norm_num [ScalarTailRefinement.selectorMass]
  simpa only [rotatedQhat] using
    (mixture_bound_of_finite_head Finset.univ wt (rotatedBranches ζ)
      (fun r _ => rotatedBranches_summable ζ r)
      (fun r _ => rotatedBranches_dominated ζ hζ r)
      hmass (le_of_eq weights_mass) N slope tail
      (by simpa only [rotatedQhat] using hslope) htail
      (by simpa only [rotatedQhat] using hscore))

end
end Grothe.HJM
