import Grothe.UpperChaos.Q0BasePairRoot10Leaf1011Check026

/- Arithmetic is split across bounded checker modules. Literal data
and mathematical inputs are unchanged. RSS has not been measured. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf1011
open MeasureTheory LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
open LeanCertProductionProfile
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem pair_checked :
    pairCertificate.Verified sModel profileModel argumentModel commonModel := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simpa only [pairCertificate, div_one] using twiceRadial_checked
  · exact firstOutput_checked
  · simpa only [pairCertificate, div_one] using twiceProfile_checked
  · simpa only [pairCertificate, div_one] using negArgument_checked
  · have hone : oneModel = constant 1 := by
      simp only [oneModel, constant, IntervalRat.singleton, div_one]
    simpa only [pairCertificate, hone] using companionFactor_checked
  · exact companionNumerator_checked
  · exact companionOutput_checked

theorem common_verified :
    commonCertificate.Verified dampingModel gaussianModel inverseModel := by
  exact ⟨commonProduct1_checked, commonProduct2_checked, common_checked⟩

/-- Both actual signed kernels are enclosed, with no numerical hypotheses. -/
theorem pair_contains (x y : ℝ) (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    Contains firstOutputModel x y
      (Q0BasePairKernel.first (1 / 1000000000000000) (radial x) (q0Kappa (radial x)) (auxiliary y)) ∧
    Contains companionOutputModel x y
      (Q0BasePairKernel.companion (1 / 1000000000000000) (radial x) (q0Kappa (radial x)) (auxiliary y)) := by
  let s := radial x
  let u := auxiliary y
  let k := q0Kappa s
  have hs : Contains sModel x y s := by
    simpa only [s, radial, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using
      RectangleCoordinates.x_sound (5040787 / 200000) (4 / 15625) sModel (by decide +kernel) hx hy
  have haux : Contains auxModel x y u := by
    simpa only [u, auxiliary, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using
      RectangleCoordinates.y_sound (23 / 32) (1 / 32) auxModel (by decide +kernel) hx hy
  have hprofile : Contains profileModel x y k :=
    Q0BasePairRoot10Profile.profile_contains hx hy hs
  have hone : Contains oneModel x y (1 : ℝ) := by
    simpa [oneModel, constant, IntervalRat.singleton] using contains_constant 1 x y

  have haux2 : Contains aux2Model x y (u^2) := by
    simpa only [pow_two, div_eq_mul_inv] using mul_sound auxModel auxModel aux2Model (0 / 1) aux2_checked hx hy haux haux

  have hprofile2 : Contains profile2Model x y (k^2) := by
    simpa only [pow_two, div_eq_mul_inv] using mul_sound profileModel profileModel profile2Model (1463087 / 1461501637330902918203684832716283019655932542976) profile2_checked hx hy hprofile hprofile

  have hdenominatorProduct : Contains denominatorProductModel x y (k^2 * u^2) := by
    simpa only [pow_two, div_eq_mul_inv] using mul_sound profile2Model aux2Model denominatorProductModel (2702516700201 / 1461501637330902918203684832716283019655932542976) denominatorProduct_checked hx hy hprofile2 haux2

  have hdenominator : Contains denominatorModel x y ((1 + k^2 * u^2)) := by
    simpa only [sub_eq_add_neg] using add_sound oneModel denominatorProductModel denominatorModel (0 / 1) denominator_checked hx hy hone hdenominatorProduct

  have hinverse : Contains inverseModel x y ((1 + k^2 * u^2)⁻¹) :=
    RectangleReciprocalCertificate.sound denominatorModel inverseCertificate
      inverse_checked hx hy hdenominator

  have hargumentProduct : Contains argumentProductModel x y (u^2 * s) := by
    simpa only [pow_two, div_eq_mul_inv] using mul_sound aux2Model sModel argumentProductModel (1 / 730750818665451459101842416358141509827966271488) argumentProduct_checked hx hy haux2 hs

  have hargument : Contains argumentModel x y ((u^2 * s / (1 + k^2 * u^2))) := by
    simpa only [pow_two, div_eq_mul_inv] using mul_sound argumentProductModel inverseModel argumentModel (4571475866798003301341137537921 / 1461501637330902918203684832716283019655932542976) argument_checked hx hy hargumentProduct hinverse

  have hdampingArgument : Contains dampingArgumentModel x y (-(((1 / 1000000000000000) : ℝ)^2 * u^2)) := by
    convert scale_sound (-1 / 1000000000000000000000000000000) aux2Model dampingArgumentModel (1 / 1461501637330902918203684832716283019655932542976) dampingArgument_checked hx hy haux2 using 1
    push_cast
    ring

  have hdamping : Contains dampingModel x y (Real.exp (-(((1 / 1000000000000000) : ℝ)^2 * u^2))) :=
    RectangleExpCertificate.sound dampingArgumentModel dampingCertificate
      damping_checked Q0BasePairRoot10Scalars.exp_center18_mem hx hy hdampingArgument

  have hnegS : Contains negSModel x y (-s) := by
    convert scale_sound (-1 / 1) sModel negSModel (0 / 1) negS_checked hx hy hs using 1
    push_cast
    ring

  have hnegArgumentForGaussian : Contains negArgumentForGaussianModel x y (-(u^2 * s / (1 + k^2 * u^2))) := by
    convert scale_sound (-1 / 1) argumentModel negArgumentForGaussianModel (0 / 1) negArgumentForGaussian_checked hx hy hargument using 1
    push_cast
    ring

  have hgaussianArgument : Contains gaussianArgumentModel x y (-s - (u^2 * s / (1 + k^2 * u^2))) := by
    simpa only [sub_eq_add_neg] using add_sound negSModel negArgumentForGaussianModel gaussianArgumentModel (0 / 1) gaussianArgument_checked hx hy hnegS hnegArgumentForGaussian

  have hgaussian : Contains gaussianModel x y (Real.exp (-s - (u^2 * s / (1 + k^2 * u^2)))) :=
    RectangleExpCertificate.sound gaussianArgumentModel gaussianCertificate
      gaussian_checked Q0BasePairRoot10Scalars.exp_center19_mem hx hy hgaussianArgument

  have hcommon := commonCertificate.direct_sound
    dampingModel gaussianModel inverseModel common_verified hx hy hdamping hgaussian hinverse
  exact pairCertificate.direct_sound sModel profileModel argumentModel commonModel
    pair_checked hx hy hs hprofile hargument hcommon


def firstInterval : IntervalRat := Q0BasePairCellIntegral.modelIntegral (4 / 15625) (1 / 32) firstOutputModel
def companionInterval : IntervalRat :=
  Q0BasePairCellIntegral.modelIntegral (4 / 15625) (1 / 32) companionOutputModel

/-- Actual signed physical-cell integrals, with the auxiliary variable outermost. -/
theorem integrals_mem :
    (∫ u in ((11 / 16) : ℝ)..(3 / 4), ∫ s in ((25203679 / 1000000) : ℝ)..(25204191 / 1000000),
      Q0BasePairKernelContinuity.directFirst (1 / 1000000000000000) s u) ∈ firstInterval ∧
    (∫ u in ((11 / 16) : ℝ)..(3 / 4), ∫ s in ((25203679 / 1000000) : ℝ)..(25204191 / 1000000),
      Q0BasePairKernelContinuity.directCompanion (1 / 1000000000000000) s u) ∈ companionInterval := by
  have h := Q0BasePairCellIntegral.direct_pair_integral_mem (1 / 1000000000000000)
    (5040787 / 200000) (4 / 15625) (23 / 32) (1 / 32) firstOutputModel companionOutputModel
    (by decide +kernel) (by decide +kernel) (fun x y hx hy => by
      simpa only [Q0BasePairKernelContinuity.directFirst,
        Q0BasePairKernelContinuity.directCompanion, radial, auxiliary,
        Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using pair_contains x y hx hy)
  norm_num only [Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] at h
  convert h using 1 <;> norm_num [firstInterval, companionInterval]


end Grothe.UpperChaos.Q0BasePairRoot10Leaf1011
