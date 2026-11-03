import Grothe.UpperChaos.Q0BasePairKernel
import Grothe.UpperChaos.RectanglePerturbation

/-!
# Arithmetic models for the common degree-one kernel factor

Direct cells multiply the damping, Gaussian and two inverse-denominator
models. Reciprocal cells first model the Gaussian divided by the denominator
squared, then include the auxiliary-coordinate Jacobian and charge the
analytic damping reserve. Every rounded product and the final outward
inflation are checked by finite rational arithmetic.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0BasePairCommonModel

open RectangleModelCheck RectanglePerturbation

/-- Rounded products in the direct chart. -/
structure DirectCertificate where
  dampedGaussian : Model
  dividedOnce : Model
  output : Model
  gaussianBudget : ℚ
  onceBudget : ℚ
  outputBudget : ℚ

def DirectCertificate.Verified (c : DirectCertificate)
    (damping gaussian inverse : Model) : Prop :=
  mulOK damping gaussian c.dampedGaussian c.gaussianBudget = true ∧
  mulOK c.dampedGaussian inverse c.dividedOnce c.onceBudget = true ∧
  mulOK c.dividedOnce inverse c.output c.outputBudget = true

instance (c : DirectCertificate) (damping gaussian inverse : Model) :
    Decidable (c.Verified damping gaussian inverse) := by
  unfold DirectCertificate.Verified
  infer_instance

theorem DirectCertificate.sound (c : DirectCertificate)
    (damping gaussian inverse : Model)
    (hc : c.Verified damping gaussian inverse)
    {x y d g i : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hd : Contains damping x y d) (hg : Contains gaussian x y g)
    (hi : Contains inverse x y i) :
    Contains c.output x y (d * g * i * i) := by
  rcases hc with ⟨hgaussian, honce, hout⟩
  have hgaussian' := mul_sound damping gaussian c.dampedGaussian c.gaussianBudget
    hgaussian hx hy hd hg
  have honce' := mul_sound c.dampedGaussian inverse c.dividedOnce c.onceBudget
    honce hx hy hgaussian' hi
  exact mul_sound c.dividedOnce inverse c.output c.outputBudget hout hx hy honce' hi

/-- The input Gaussian model is bound to the actual direct division argument;
the exponential product is then exactly the production common factor. -/
theorem DirectCertificate.direct_sound (c : DirectCertificate)
    (damping gaussian inverse : Model)
    (hc : c.Verified damping gaussian inverse)
    {x y η s k u : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hd : Contains damping x y (Real.exp (-(η^2 * u^2))))
    (hg : Contains gaussian x y (Real.exp (-s - u^2 * s / (1 + k^2 * u^2))))
    (hi : Contains inverse x y ((1 + k^2 * u^2)⁻¹)) :
    Contains c.output x y (Q0BasePairKernel.common η s k u) := by
  have h := c.sound damping gaussian inverse hc hx hy hd hg hi
  have hid : Real.exp (-(η^2 * u^2)) *
      Real.exp (-s - u^2 * s / (1 + k^2 * u^2)) *
      (1 + k^2 * u^2)⁻¹ * (1 + k^2 * u^2)⁻¹ =
      Q0BasePairKernel.common η s k u := by
    unfold Q0BasePairKernel.common
    rw [show -(η^2 * u^2) - s - u^2 * s / (1 + k^2 * u^2) =
      -(η^2 * u^2) + (-s - u^2 * s / (1 + k^2 * u^2)) by ring,
      Real.exp_add]
    simp only [div_eq_mul_inv, ← inv_pow]
    ring
  rwa [hid] at h

/-- Rounded products and outward damping inflation in the reciprocal chart.
`factor` models the nonnegative factor without the Jacobian, so its range
supplies the analytic damping error budget. -/
structure ReciprocalCertificate where
  dividedOnce : Model
  factor : Model
  auxSquare : Model
  undamped : Model
  output : Model
  onceBudget : ℚ
  factorBudget : ℚ
  squareBudget : ℚ
  undampedBudget : ℚ

def ReciprocalCertificate.Verified (c : ReciprocalCertificate) (η : ℚ)
    (aux gaussian inverse : Model) : Prop :=
  mulOK gaussian inverse c.dividedOnce c.onceBudget = true ∧
  mulOK c.dividedOnce inverse c.factor c.factorBudget = true ∧
  mulOK aux aux c.auxSquare c.squareBudget = true ∧
  mulOK c.auxSquare c.factor c.undamped c.undampedBudget = true ∧
  inflateOK c.undamped c.output (η^2 * rangeAbs c.factor) = true

instance (c : ReciprocalCertificate) (η : ℚ) (aux gaussian inverse : Model) :
    Decidable (c.Verified η aux gaussian inverse) := by
  unfold ReciprocalCertificate.Verified
  infer_instance

/-- The omitted reciprocal damping is restored by the proved analytic
perturbation theorem, after the Jacobian has been included. -/
theorem ReciprocalCertificate.sound (c : ReciprocalCertificate) (η : ℚ)
    (aux gaussian inverse : Model)
    (hc : c.Verified η aux gaussian inverse)
    {x y v g i : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hv : Contains aux x y v) (hg : Contains gaussian x y g)
    (hi : Contains inverse x y i) (hg0 : 0 ≤ g) :
    Contains c.output x y
      (v^2 * Real.exp (-((η : ℝ)^2 / v^2)) * (g * i * i)) := by
  rcases hc with ⟨honce, hfactor, hsquare, hundamped, hinflate⟩
  have honce' := mul_sound gaussian inverse c.dividedOnce c.onceBudget
    honce hx hy hg hi
  have hfactor' := mul_sound c.dividedOnce inverse c.factor c.factorBudget
    hfactor hx hy honce' hi
  have hsquare' : Contains c.auxSquare x y (v^2) := by
    simpa only [pow_two] using
      mul_sound aux aux c.auxSquare c.squareBudget hsquare hx hy hv hv
  have hundamped' := mul_sound c.auxSquare c.factor c.undamped c.undampedBudget
    hundamped hx hy hsquare' hfactor'
  have hA : 0 ≤ g * i * i := by
    simpa only [mul_assoc, ← pow_two] using mul_nonneg hg0 (sq_nonneg i)
  exact reciprocal_damping_output_of_model η hinflate hx hy hA hfactor' hundamped'

/-- Bind the reciprocal arithmetic and analytic reserve to the actual common
kernel. No division by the auxiliary coordinate is needed in the models,
and the statement also holds at its algebraic endpoint `v = 0`. -/
theorem ReciprocalCertificate.reciprocal_sound (c : ReciprocalCertificate) (η : ℚ)
    (aux gaussian inverse : Model)
    (hc : c.Verified η aux gaussian inverse)
    {x y s k v : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hv : Contains aux x y v)
    (hg : Contains gaussian x y (Real.exp (-s - s / (v^2 + k^2))))
    (hi : Contains inverse x y ((v^2 + k^2)⁻¹)) :
    Contains c.output x y (Q0BasePairKernel.reciprocalCommon η s k v) := by
  have h := c.sound η aux gaussian inverse hc hx hy hv hg hi (Real.exp_pos _).le
  have hid : v^2 * Real.exp (-((η : ℝ)^2 / v^2)) *
      (Real.exp (-s - s / (v^2 + k^2)) * (v^2 + k^2)⁻¹ * (v^2 + k^2)⁻¹) =
      Q0BasePairKernel.reciprocalCommon η s k v := by
    unfold Q0BasePairKernel.reciprocalCommon
    rw [show -((η : ℝ)^2 / v^2) - s - s / (v^2 + k^2) =
      -((η : ℝ)^2 / v^2) + (-s - s / (v^2 + k^2)) by ring, Real.exp_add]
    simp only [div_eq_mul_inv, ← inv_pow]
    ring
  rwa [hid] at h

end Grothe.UpperChaos.Q0BasePairCommonModel
