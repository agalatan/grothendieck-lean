import GrotheSign.BetaPreservation
import Mathlib.Data.Finsupp.Indicator

/-!
# Strict signs after a positive beta-parameter increment

A strictly positive first inverse-profile coefficient remains positive. At every higher weight
`k`, the ordered assignment consisting of `k` labels equal to one contributes a strictly positive
term to the forcing. The other terms are nonnegative by general beta preservation.

Proof implementation: codex-1a87. Refs #365.
-/

set_option warningAsError true

namespace GrotheSign

open Finset PowerSeries Set

/-- Nonnegative forcing preserves a strictly positive initial value. -/
theorem pos_of_beta_ode_of_initial (k : ℕ) {c₀ c₁ : ℝ}
    (hc₀ : 0 < c₀) (hc₁ : c₀ ≤ c₁)
    {p f : ℝ → ℝ} (hp₀ : 0 < p c₀)
    (hd : ∀ c ∈ Icc c₀ c₁,
      HasDerivAt p (-harmonicGenerator k c * p c + f c) c)
    (hf : ∀ c ∈ Icc c₀ c₁, 0 ≤ f c) : 0 < p c₁ := by
  have hm := monotoneOn_betaPochhammer_mul k hc₀ hd hf
  have hw : 0 < betaPochhammer k c₁ * p c₁ :=
    (mul_pos (betaPochhammer_pos k hc₀) hp₀).trans_le
      (hm ⟨le_rfl, hc₁⟩ ⟨hc₁, le_rfl⟩ hc₁)
  exact pos_of_mul_pos_right hw (betaPochhammer_pos k (hc₀.trans_le hc₁)).le

/-- A positive first inverse coefficient stays positive throughout the beta family. -/
theorem beta_first_inverse_pos (F₀ : PowerSeries ℝ) (hF₀ : constantCoeff F₀ = 1)
    {c₀ : ℝ} (hc₀ : 0 < c₀) (hp₁ : 0 < coeff 1 (inverseProfile F₀))
    {c : ℝ} (hc : c₀ ≤ c) :
    0 < coeff 1 (inverseProfile (betaFamily F₀ c₀ c)) := by
  apply pos_of_beta_ode_of_initial 1 hc₀ hc
    (by simpa only [betaFamily_self F₀ hc₀] using hp₁)
  · intro x hx
    exact hasDerivAt_inverseProfile_beta_equation F₀ hF₀ c₀
      (hc₀.trans_le hx.1) 1 zero_lt_one
  · intro x _
    simp [betaForcing]

/-- The all-one assignment makes the order-`k` contribution at weight `k` strictly positive. -/
theorem orderedFlowTerm_beta_pos_of_first (k : ℕ) (hk : 2 ≤ k) (P : PowerSeries ℝ)
    (hP : constantCoeff P = 0) {c : ℝ} (hc : 0 < c)
    (hp : ∀ i, 0 < i → 0 ≤ coeff i P) (hp₁ : 0 < coeff 1 P) :
    0 < orderedFlowTerm k k (fun i ↦ harmonicGenerator i c) P := by
  let j₁ : ℕ →₀ ℕ := Finsupp.indicator (range k) (fun _ _ ↦ 1)
  have hone (a : ℕ) (ha : a ∈ range k) : j₁ a = 1 :=
    Finsupp.indicator_of_mem ha _
  have hj₁ : j₁ ∈ finsuppAntidiag (range k) k := by
    rw [mem_finsuppAntidiag]
    constructor
    · calc
        ∑ a ∈ range k, j₁ a = ∑ _a ∈ range k, (1 : ℕ) :=
          Finset.sum_congr rfl hone
        _ = k := by simp
    · exact Finsupp.support_indicator_subset (s := range k) (f := fun _ _ ↦ (1 : ℕ))
  have ht : 2 ≤ (range k).card := by simpa using hk
  unfold orderedFlowTerm
  apply mul_pos (by positivity)
  apply Finset.sum_pos'
  · intro j _
    by_cases hpos : ∀ a ∈ range k, 0 < j a
    · have hg : 0 < labeledFlowCoefficient (range k) j (fun i ↦ harmonicGenerator i c) := by
        rw [labeledFlowCoefficient_eq_generatorCoefficient _ _ _ (harmonicGenerator_zero c) ht]
        exact betaGeneratorCoefficient_pos _ _ hc ht hpos
      exact mul_nonneg hg.le (Finset.prod_nonneg (fun a ha ↦ hp (j a) (hpos a ha)))
    · push Not at hpos
      obtain ⟨a, ha, hzero⟩ := hpos
      have hja : j a = 0 := by omega
      have hz : ∏ b ∈ range k, coeff (j b) P = 0 :=
        Finset.prod_eq_zero ha (by simpa [hja, coeff_zero_eq_constantCoeff] using hP)
      rw [hz, mul_zero]
  · refine ⟨j₁, hj₁, ?_⟩
    have hg : 0 < labeledFlowCoefficient (range k) j₁ (fun i ↦ harmonicGenerator i c) := by
      rw [labeledFlowCoefficient_eq_generatorCoefficient _ _ _ (harmonicGenerator_zero c) ht]
      apply betaGeneratorCoefficient_pos _ _ hc ht
      intro a ha
      rw [hone a ha]
      exact zero_lt_one
    apply mul_pos hg (Finset.prod_pos ?_)
    intro a ha
    simpa only [hone a ha] using hp₁

/-- A positive first coefficient and nonnegative remaining coefficients make higher forcing
positive. -/
theorem betaForcing_pos (k : ℕ) (hk : 2 ≤ k) (P : PowerSeries ℝ)
    (hP : constantCoeff P = 0) {c : ℝ} (hc : 0 < c)
    (hp : ∀ i, 0 < i → 0 ≤ coeff i P) (hp₁ : 0 < coeff 1 P) :
    0 < betaForcing k c P := by
  unfold betaForcing
  apply Finset.sum_pos'
  · intro m _
    exact orderedFlowTerm_beta_nonneg k (2 + m) (by omega) P hP hc
      (fun i hi _ ↦ hp i hi)
  · refine ⟨k - 2, Finset.mem_range.mpr (by omega), ?_⟩
    rw [show 2 + (k - 2) = k by omega]
    exact orderedFlowTerm_beta_pos_of_first k hk P hP hc hp hp₁

/-- A positive first initial inverse coefficient makes every nonlinear inverse-profile coefficient
strictly positive after any positive increase in the beta parameter. -/
theorem beta_preserves_inverse_pos (F₀ : PowerSeries ℝ) (hF₀ : constantCoeff F₀ = 1)
    {c₀ : ℝ} (hc₀ : 0 < c₀)
    (hp₀ : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile F₀))
    (hp₁ : 0 < coeff 1 (inverseProfile F₀)) :
    ∀ k, 0 < k → ∀ c, c₀ < c → 0 < coeff k (inverseProfile (betaFamily F₀ c₀ c)) := by
  intro k hk c hc
  by_cases hk₁ : k = 1
  · subst k
    exact beta_first_inverse_pos F₀ hF₀ hc₀ hp₁ hc.le
  · have hk₂ : 2 ≤ k := by omega
    apply pos_of_beta_ode k hc₀ hc
      (by simpa only [betaFamily_self F₀ hc₀] using hp₀ k hk)
    · intro x hx
      exact hasDerivAt_inverseProfile_beta_equation F₀ hF₀ c₀ (hc₀.trans_le hx.1) k hk
    · intro x hx
      apply betaForcing_pos k hk₂ _
        (constantCoeff_inverseProfile _ (by simpa only [constantCoeff_betaFamily] using hF₀))
        (hc₀.trans_le hx.1.le)
      · intro i hi
        exact beta_preserves_inverse_nonneg F₀ hF₀ hc₀ hp₀ i hi x hx.1.le
      · exact beta_first_inverse_pos F₀ hF₀ hc₀ hp₁ hx.1.le

/-- The nonlinear odd coefficients of Mathlib's actual inverse become strictly negative. -/
theorem beta_preserves_inverseSeries_strict_sign (F₀ : PowerSeries ℝ)
    (hF₀ : constantCoeff F₀ = 1) {c₀ : ℝ} (hc₀ : 0 < c₀)
    (hp₀ : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile F₀))
    (hp₁ : 0 < coeff 1 (inverseProfile F₀)) (k : ℕ) (hk : 0 < k)
    {c : ℝ} (hc : c₀ < c) :
    coeff (2 * k + 1) (inverseSeries (betaFamily F₀ c₀ c)
      (by rw [constantCoeff_betaFamily, hF₀]; norm_num)) < 0 := by
  have hp := beta_preserves_inverse_pos F₀ hF₀ hc₀ hp₀ hp₁ k hk c hc
  rw [coeff_inverseProfile_of_pos _ k hk] at hp
  rw [← oddLift_inverseRadial_eq_inverseSeries, coeff_oddLift]
  linarith

end GrotheSign
