import GrotheSign.BetaFlow
import GrotheSign.BetaCoefficientDerivative

/-!
# The actual beta-multiplied forward series and inverse coefficient derivatives

The family is defined coefficientwise by `(c₀)_k / (c)_k`. Its inverse profile is the actual
compositional inverse profile from `InverseSeries`, and its derivative is the finite convolution
used in the beta-preservation argument.

Proof implementation: codex-1a87. Refs #365.
-/

set_option warningAsError true

namespace GrotheSign

open PowerSeries Finset

/-- Apply each finite beta multiplier to the corresponding forward coefficient. -/
noncomputable def betaFamily (F₀ : ℝ⟦X⟧) (c₀ c : ℝ) : ℝ⟦X⟧ :=
  mk (fun k ↦ coeff k F₀ * betaMultiplier c₀ k c)

/-- The diagonal velocity of the forward beta flow at parameter `c`. -/
noncomputable def betaVelocity (F : ℝ⟦X⟧) (c : ℝ) : ℝ⟦X⟧ :=
  mk (fun k ↦ -harmonicGenerator k c * coeff k F)

@[simp] theorem coeff_betaFamily (F₀ : ℝ⟦X⟧) (c₀ c : ℝ) (k : ℕ) :
    coeff k (betaFamily F₀ c₀ c) = coeff k F₀ * betaMultiplier c₀ k c := by
  simp [betaFamily]

@[simp] theorem coeff_betaVelocity (F : ℝ⟦X⟧) (c : ℝ) (k : ℕ) :
    coeff k (betaVelocity F c) = -harmonicGenerator k c * coeff k F := by
  simp [betaVelocity]

@[simp] theorem constantCoeff_betaFamily (F₀ : ℝ⟦X⟧) (c₀ c : ℝ) :
    constantCoeff (betaFamily F₀ c₀ c) = constantCoeff F₀ := by
  rw [← coeff_zero_eq_constantCoeff_apply, coeff_betaFamily]
  simp [betaMultiplier, coeff_zero_eq_constantCoeff_apply]

/-- The family agrees with its initial series at its positive initial parameter. -/
theorem betaFamily_self (F₀ : ℝ⟦X⟧) {c₀ : ℝ} (hc₀ : 0 < c₀) :
    betaFamily F₀ c₀ c₀ = F₀ := by
  ext k
  simp [betaMultiplier, (betaPochhammer_pos k hc₀).ne']

/-- Every forward coefficient satisfies its exact harmonic-generator equation. -/
theorem hasCoeffDerivAt_betaFamily (F₀ : ℝ⟦X⟧) (c₀ : ℝ) {c : ℝ} (hc : 0 < c) :
    HasCoeffDerivAt (betaFamily F₀ c₀) (betaVelocity (betaFamily F₀ c₀ c) c) c := by
  intro k
  have hd : HasDerivAt (fun x ↦ coeff k F₀ * betaMultiplier c₀ k x)
      (coeff k F₀ * (-harmonicGenerator k c * betaMultiplier c₀ k c)) c :=
    (hasDerivAt_betaMultiplier c₀ k hc).const_mul (coeff k F₀)
  have he : coeff k F₀ * (-harmonicGenerator k c * betaMultiplier c₀ k c) =
      -harmonicGenerator k c * (coeff k F₀ * betaMultiplier c₀ k c) := by ring
  simpa only [coeff_betaFamily, coeff_betaVelocity] using hd.congr_deriv he

/-- Multiplication by the forward velocity gives exactly the finite inverse-flow convolution. -/
theorem coeff_inv_pow_mul_betaVelocity (F : ℝ⟦X⟧) (c : ℝ) (N k : ℕ) :
    coeff k (F⁻¹ ^ N * betaVelocity F c) =
      -∑ i ∈ range (k + 1),
        harmonicGenerator i c * coeff i F * coeff (k - i) (F⁻¹ ^ N) := by
  rw [mul_comm, coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
    ← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro i _
  rw [coeff_betaVelocity]
  ring

/-- The actual inverse profile of the beta family has the finite convolution derivative. -/
theorem hasDerivAt_coeff_inverseProfile_betaFamily (F₀ : ℝ⟦X⟧)
    (hF₀ : constantCoeff F₀ ≠ 0) (c₀ : ℝ) {c : ℝ} (hc : 0 < c) (k : ℕ) (hk : 0 < k) :
    HasDerivAt (fun x ↦ coeff k (inverseProfile (betaFamily F₀ c₀ x)))
      (-∑ i ∈ range (k + 1), harmonicGenerator i c * coeff i (betaFamily F₀ c₀ c) *
        coeff (k - i) ((betaFamily F₀ c₀ c)⁻¹ ^ (2 * k + 2))) c := by
  have hd := hasDerivAt_coeff_inverseProfile (hasCoeffDerivAt_betaFamily F₀ c₀ hc)
    (by simpa only [constantCoeff_betaFamily] using hF₀) k hk
  simpa only [coeff_inv_pow_mul_betaVelocity] using hd

end GrotheSign
