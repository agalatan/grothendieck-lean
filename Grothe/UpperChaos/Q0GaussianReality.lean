import Grothe.UpperChaos.ConcreteLinearEnergy
import Lean.Util.CollectAxioms

/-!
# Reality of the full Gaussian base-pair coefficients

Agent-ID: codex-2ca4.

The full Gaussian measure is invariant under conjugation. These identities
therefore apply to the original coefficients, without a domain truncation
or numerical premise.
The one-coordinate symmetry is proved from the existing planar Gaussian
representation, so no lower-bound cap module is imported.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0GaussianReality

noncomputable section

/-- Conjugation of both coordinates of the actual Gaussian source. -/
def conj2 (u : ℂ × ℂ) : ℂ × ℂ := (conj u.1, conj u.2)

theorem measurable_conj2 : Measurable conj2 :=
  (Complex.continuous_conj.measurable.comp measurable_fst).prodMk
    (Complex.continuous_conj.measurable.comp measurable_snd)

/-- Conjugation of the standard complex Gaussian follows by reflecting
the second real coordinate in its existing planar presentation. -/
theorem gaussC_map_conj : gaussC.map (fun z : ℂ => conj z) = gaussC := by
  have hflip :
      gauss2.map (Prod.map id (fun x : ℝ => -x)) = gauss2 := by
    rw [← Measure.map_prod_map _ _ measurable_id measurable_neg,
      Measure.map_id, gaussianReal_map_neg, neg_zero]
  have hF : (fun z : ℂ => conj z) ∘ F2 =
      F2 ∘ Prod.map id (fun x : ℝ => -x) := by
    funext p
    simp [F2, map_div₀]
  rw [gaussC_eq_map,
    Measure.map_map Complex.continuous_conj.measurable measurable_F2,
    hF, ← Measure.map_map measurable_F2 (measurable_id.prodMap measurable_neg),
    hflip]

/-- The full product Gaussian is invariant under simultaneous conjugation. -/
theorem map_conj2 : mu2.map conj2 = mu2 := by
  change (gaussC.prod gaussC).map
      (Prod.map (fun z : ℂ => conj z) (fun z : ℂ => conj z)) =
    gaussC.prod gaussC
  rw [← Measure.map_prod_map _ _ Complex.continuous_conj.measurable
    Complex.continuous_conj.measurable, gaussC_map_conj]

theorem measurePreserving_conj2 : MeasurePreserving conj2 mu2 mu2 :=
  ⟨measurable_conj2, map_conj2⟩

/-- Measurability suffices for this change of variables; the theorem also
respects the convention that a nonintegrable Bochner integral is zero. -/
theorem integral_conj2_eq (f : ℂ × ℂ → ℂ) (hf : Measurable f) :
    (∫ u, f (conj2 u) ∂mu2) = ∫ u, f u ∂mu2 := by
  have hm : AEStronglyMeasurable f (mu2.map conj2) := hf.aestronglyMeasurable
  have h := integral_map measurable_conj2.aemeasurable hm
  rw [map_conj2] at h
  exact h.symm

/-- The phase convention at zero also commutes with conjugation. -/
theorem ph_conj (z : ℂ) : Haag.ph (conj z) = conj (Haag.ph z) := by
  simp only [Haag.ph, map_div₀, Complex.norm_conj, Complex.conj_ofReal]

/-- The actual profile multiplier is real and depends only on the squared
norm of the first input. No profile or source estimate is assumed. -/
theorem F0_conj2 (u : ℂ × ℂ) : F0 (conj2 u) = conj (F0 u) := by
  unfold F0 conj2
  rw [← ph_conj]
  simp only [Complex.norm_conj, map_add, map_mul, Complex.conj_ofReal]

/-- A conjugation-covariant measurable integrand has real full expectation. -/
theorem integral_im_eq_zero_of_conj2 (f : ℂ × ℂ → ℂ) (hf : Measurable f)
    (hconj : ∀ u, f (conj2 u) = conj (f u)) :
    (∫ u, f u ∂mu2).im = 0 := by
  apply Complex.conj_eq_iff_im.mp
  rw [← integral_conj]
  calc
    (∫ u, conj (f u) ∂mu2) = ∫ u, f (conj2 u) ∂mu2 :=
      integral_congr_ae (Filter.Eventually.of_forall fun u => (hconj u).symm)
    _ = ∫ u, f u ∂mu2 := integral_conj2_eq f hf

/-- The full first base coefficient, before the frozen correction. -/
def firstGaussianCoefficient : ℂ := ∫ u : ℂ × ℂ, conj u.1 * F0 u ∂mu2

/-- The full second base coefficient, before the frozen correction. -/
def secondGaussianCoefficient : ℂ := ∫ u : ℂ × ℂ, conj u.2 * F0 u ∂mu2

theorem firstGaussianCoefficient_im : firstGaussianCoefficient.im = 0 := by
  apply integral_im_eq_zero_of_conj2
    (fun u : ℂ × ℂ => conj u.1 * F0 u)
    ((Complex.continuous_conj.measurable.comp measurable_fst).mul measurable_F0)
  intro u
  change conj (conj u.1) * F0 (conj2 u) = conj (conj u.1 * F0 u)
  rw [F0_conj2, map_mul]

theorem secondGaussianCoefficient_im : secondGaussianCoefficient.im = 0 := by
  apply integral_im_eq_zero_of_conj2
    (fun u : ℂ × ℂ => conj u.2 * F0 u)
    ((Complex.continuous_conj.measurable.comp measurable_snd).mul measurable_F0)
  intro u
  change conj (conj u.2) * F0 (conj2 u) = conj (conj u.2 * F0 u)
  rw [F0_conj2, map_mul]

/-- This elementary transfer retains the sign of the real coefficient. -/
theorem norm_sub_rat_of_im_zero (z : ℂ) (hz : z.im = 0) (q : ℚ) :
    ‖z - (q : ℂ)‖ = |z.re - (q : ℝ)| := by
  have heq : z - (q : ℂ) = (((z.re - (q : ℝ) : ℝ)) : ℂ) := by
    apply Complex.ext <;> simp [hz]
  rw [heq, Complex.norm_real, Real.norm_eq_abs]

theorem norm_firstGaussianCoefficient_sub_rat (q : ℚ) :
    ‖firstGaussianCoefficient - (q : ℂ)‖ =
      |firstGaussianCoefficient.re - (q : ℝ)| :=
  norm_sub_rat_of_im_zero _ firstGaussianCoefficient_im q

theorem norm_secondGaussianCoefficient_sub_rat (q : ℚ) :
    ‖secondGaussianCoefficient - (q : ℂ)‖ =
      |secondGaussianCoefficient.re - (q : ℝ)| :=
  norm_sub_rat_of_im_zero _ secondGaussianCoefficient_im q

/-- Direct statement for the integral appearing in the production energy. -/
theorem norm_first_gaussian_integral_sub_rat (q : ℚ) :
    ‖(∫ u : ℂ × ℂ, conj u.1 * F0 u ∂mu2) - (q : ℂ)‖ =
      |(∫ u : ℂ × ℂ, conj u.1 * F0 u ∂mu2).re - (q : ℝ)| :=
  norm_firstGaussianCoefficient_sub_rat q

theorem norm_second_gaussian_integral_sub_rat (q : ℚ) :
    ‖(∫ u : ℂ × ℂ, conj u.2 * F0 u ∂mu2) - (q : ℂ)‖ =
      |(∫ u : ℂ × ℂ, conj u.2 * F0 u ∂mu2).re - (q : ℝ)| :=
  norm_secondGaussianCoefficient_sub_rat q

open FixedChaosSmoothing

/-- The frozen corrections are rational, so the actual first production
coefficient has zero imaginary part too. -/
theorem productionLinearFirst_im : productionLinearFirst.im = 0 := by
  simp only [productionLinearFirst, Complex.add_im, Complex.ratCast_im, add_zero]
  exact firstGaussianCoefficient_im

theorem productionLinearSecond_im : productionLinearSecond.im = 0 := by
  simp only [productionLinearSecond, Complex.add_im, Complex.ratCast_im, add_zero]
  exact secondGaussianCoefficient_im

theorem norm_productionLinearFirst_sub_rat (q : ℚ) :
    ‖productionLinearFirst - (q : ℂ)‖ = |productionLinearFirst.re - (q : ℝ)| :=
  norm_sub_rat_of_im_zero _ productionLinearFirst_im q

theorem norm_productionLinearSecond_sub_rat (q : ℚ) :
    ‖productionLinearSecond - (q : ℂ)‖ = |productionLinearSecond.re - (q : ℝ)| :=
  norm_sub_rat_of_im_zero _ productionLinearSecond_im q

end
end Grothe.UpperChaos.Q0GaussianReality

open Lean Elab Command

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0GaussianReality.firstGaussianCoefficient_im,
      ``Grothe.UpperChaos.Q0GaussianReality.secondGaussianCoefficient_im,
      ``Grothe.UpperChaos.Q0GaussianReality.norm_first_gaussian_integral_sub_rat,
      ``Grothe.UpperChaos.Q0GaussianReality.norm_second_gaussian_integral_sub_rat,
      ``Grothe.UpperChaos.Q0GaussianReality.productionLinearFirst_im,
      ``Grothe.UpperChaos.Q0GaussianReality.productionLinearSecond_im] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"{target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"Unexpected dependency {dependency} in {target}"
