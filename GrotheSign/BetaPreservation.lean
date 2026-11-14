import GrotheSign.BetaFamily
import GrotheSign.InverseFlow
import GrotheSign.FlowExpansion
import GrotheSign.OrderedFlowBase

/-!
# Preservation of inverse coefficient signs under beta multipliers

The input is a normalized formal series whose odd lift has nonpositive nonlinear inverse
coefficients. Multiplying its `k`-th forward coefficient by `(c₀)_k / (c)_k` preserves those
signs for every real `c ≥ c₀ > 0`. The actual inverse is Mathlib's compositional inverse.

The initial sign theorem is an explicit input. In particular this module does not prove the
Haagerup base case or Hypothesis H, and has no dependency on the bound certificates.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset PowerSeries

/-- The nonlinear forcing at weight `k`, written as a finite sum of ordered contributions. -/
noncomputable def betaForcing (k : ℕ) (c : ℝ) (P : PowerSeries ℝ) : ℝ :=
  ∑ m ∈ range (k - 1), orderedFlowTerm k (2 + m) (fun i ↦ harmonicGenerator i c) P

theorem betaForcing_nonneg (k : ℕ) (P : PowerSeries ℝ) (hP : constantCoeff P = 0)
    {c : ℝ} (hc : 0 < c) (hp : ∀ i, 0 < i → i < k → 0 ≤ coeff i P) :
    0 ≤ betaForcing k c P := by
  apply Finset.sum_nonneg
  intro m _
  exact orderedFlowTerm_beta_nonneg k (2 + m) (by omega) P hP hc hp

/-- The actual inverse coefficients satisfy the triangular beta-preservation equation. -/
theorem hasDerivAt_inverseProfile_beta_equation (F₀ : PowerSeries ℝ)
    (hF₀ : constantCoeff F₀ = 1) (c₀ : ℝ) {c : ℝ} (hc : 0 < c)
    (k : ℕ) (hk : 0 < k) :
    HasDerivAt (fun x ↦ coeff k (inverseProfile (betaFamily F₀ c₀ x)))
      (-harmonicGenerator k c * coeff k (inverseProfile (betaFamily F₀ c₀ c)) +
        betaForcing k c (inverseProfile (betaFamily F₀ c₀ c))) c := by
  have hunit : constantCoeff F₀ ≠ 0 := by rw [hF₀]; norm_num
  have hfamily : constantCoeff (betaFamily F₀ c₀ c) = 1 := by simpa using hF₀
  have hprofile := constantCoeff_inverseProfile (betaFamily F₀ c₀ c) hfamily
  apply (hasDerivAt_coeff_inverseProfile_betaFamily F₀ hunit c₀ hc k hk).congr_deriv
  rw [inverse_flow_convolution _ (by rw [hfamily]; norm_num)]
  change inverseFlowConvolution k (fun i ↦ harmonicGenerator i c)
    (inverseProfile (betaFamily F₀ c₀ c)) = _
  rw [inverseFlowConvolution_eq_orderedFlow _ _ _ hprofile]
  exact orderedFlow_eq_diagonal_add k hk _ (harmonicGenerator_zero c) _

/-- Beta multipliers preserve nonnegative coefficients of the actual inverse profile. -/
theorem beta_preserves_inverse_nonneg (F₀ : PowerSeries ℝ) (hF₀ : constantCoeff F₀ = 1)
    {c₀ : ℝ} (hc₀ : 0 < c₀)
    (hp₀ : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile F₀)) :
    ∀ k, 0 < k → ∀ c, c₀ ≤ c → 0 ≤ coeff k (inverseProfile (betaFamily F₀ c₀ c)) := by
  apply triangular_beta_ode_nonneg
    (fun k c ↦ coeff k (inverseProfile (betaFamily F₀ c₀ c)))
    (fun k c ↦ betaForcing k c (inverseProfile (betaFamily F₀ c₀ c))) hc₀
  · intro k hk
    simpa only [betaFamily_self F₀ hc₀] using hp₀ k hk
  · intro k hk c hc
    exact hasDerivAt_inverseProfile_beta_equation F₀ hF₀ c₀ (hc₀.trans_le hc) k hk
  · intro k _ c hc hp
    apply betaForcing_nonneg k _ (constantCoeff_inverseProfile _ (by simpa using hF₀))
      (hc₀.trans_le hc)
    exact hp

/-- The nonlinear odd coefficients of Mathlib's actual inverse remain nonpositive. -/
theorem beta_preserves_inverseSeries_sign (F₀ : PowerSeries ℝ)
    (hF₀ : constantCoeff F₀ = 1) {c₀ : ℝ} (hc₀ : 0 < c₀)
    (hp₀ : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile F₀))
    (k : ℕ) (hk : 0 < k) {c : ℝ} (hc : c₀ ≤ c) :
    coeff (2 * k + 1) (inverseSeries (betaFamily F₀ c₀ c)
      (by rw [constantCoeff_betaFamily, hF₀]; norm_num)) ≤ 0 := by
  have hp := beta_preserves_inverse_nonneg F₀ hF₀ hc₀ hp₀ k hk c hc
  rw [coeff_inverseProfile_of_pos _ k hk] at hp
  rw [← oddLift_inverseRadial_eq_inverseSeries, coeff_oddLift]
  linarith

end GrotheSign
