import GrotheSign.HypergeometricSpecialization
import GrotheSign.HaagerupBaseCoefficients

/-!
# Finite-order inverse signs for every real dimension at least two

Triangularity propagates an initial sign certificate through order `K` without assumptions on
higher initial coefficients. The exact Haagerup computation through order eight therefore gives
unconditional finite-order statements for the whole hypergeometric parameter family.

Proof implementation: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

open Finset PowerSeries Set

/-- Preservation through a finite order only uses initial signs through that order. -/
theorem beta_preserves_inverse_nonneg_up_to (F₀ : ℝ⟦X⟧)
    (hF₀ : constantCoeff F₀ = 1) {c₀ : ℝ} (hc₀ : 0 < c₀) (K : ℕ)
    (hp₀ : ∀ k, 0 < k → k ≤ K → 0 ≤ coeff k (inverseProfile F₀)) :
    ∀ k, 0 < k → k ≤ K → ∀ c, c₀ ≤ c →
      0 ≤ coeff k (inverseProfile (betaFamily F₀ c₀ c)) := by
  intro k
  induction k using Nat.strong_induction_on with
  | h k ih =>
    intro hk hkK c hc
    apply nonneg_of_beta_ode k hc₀ hc
      (by simpa only [betaFamily_self F₀ hc₀] using hp₀ k hk hkK)
    · intro x hx
      exact hasDerivAt_inverseProfile_beta_equation F₀ hF₀ c₀ (hc₀.trans_le hx.1) k hk
    · intro x hx
      apply betaForcing_nonneg k _
        (constantCoeff_inverseProfile _ (by simpa only [constantCoeff_betaFamily] using hF₀))
        (hc₀.trans_le hx.1)
      intro i hi hik
      exact ih i hik hi (hik.le.trans hkK) x hx.1

/-- A weight-`k` ordered term depends only on coefficients of indices at most `k`. -/
theorem orderedFlowTerm_congr_coeff_le (k m : ℕ) (L : ℕ → ℝ) (P Q : ℝ⟦X⟧)
    (hPQ : ∀ i, i ≤ k → coeff i P = coeff i Q) :
    orderedFlowTerm k m L P = orderedFlowTerm k m L Q := by
  unfold orderedFlowTerm
  congr 1
  apply Finset.sum_congr rfl
  intro j hj
  congr 1
  apply Finset.prod_congr rfl
  intro a ha
  apply hPQ
  calc
    j a ≤ ∑ b ∈ range m, j b := Finset.single_le_sum (fun b _ ↦ Nat.zero_le (j b)) ha
    _ = k := (Finset.mem_finsuppAntidiag.mp hj).1

/-- A weight-`k` forcing term is unchanged by altering coefficients above `k`. -/
theorem betaForcing_congr_coeff_le (k : ℕ) (c : ℝ) (P Q : ℝ⟦X⟧)
    (hPQ : ∀ i, i ≤ k → coeff i P = coeff i Q) :
    betaForcing k c P = betaForcing k c Q := by
  unfold betaForcing
  exact Finset.sum_congr rfl (fun m _ ↦ orderedFlowTerm_congr_coeff_le k (2 + m) _ P Q hPQ)

/-- Strict forcing needs only the coefficients through its own weight. -/
theorem betaForcing_pos_of_coeff_le (k : ℕ) (hk : 2 ≤ k) (P : ℝ⟦X⟧)
    (hP : constantCoeff P = 0) {c : ℝ} (hc : 0 < c)
    (hp : ∀ i, 0 < i → i ≤ k → 0 ≤ coeff i P) (hp₁ : 0 < coeff 1 P) :
    0 < betaForcing k c P := by
  let Q : ℝ⟦X⟧ := mk (fun i ↦ if i ≤ k then coeff i P else 0)
  have hQP (i : ℕ) (hi : i ≤ k) : coeff i Q = coeff i P := by simp [Q, hi]
  have hQ : constantCoeff Q = 0 := by
    rw [← coeff_zero_eq_constantCoeff_apply, hQP 0 (Nat.zero_le k),
      coeff_zero_eq_constantCoeff_apply, hP]
  have hQp (i : ℕ) (hi : 0 < i) : 0 ≤ coeff i Q := by
    by_cases hik : i ≤ k
    · rw [hQP i hik]
      exact hp i hi hik
    · simp [Q, hik]
  have hQ₁ : 0 < coeff 1 Q := by rw [hQP 1 (by omega)]; exact hp₁
  have h := betaForcing_pos k hk Q hQ hc hQp hQ₁
  rwa [betaForcing_congr_coeff_le k c Q P hQP] at h

/-- Finite-order strict preservation also needs no signs beyond the requested order. -/
theorem beta_preserves_inverse_pos_up_to (F₀ : ℝ⟦X⟧)
    (hF₀ : constantCoeff F₀ = 1) {c₀ : ℝ} (hc₀ : 0 < c₀) (K : ℕ)
    (hp₀ : ∀ k, 0 < k → k ≤ K → 0 ≤ coeff k (inverseProfile F₀))
    (hp₁ : 0 < coeff 1 (inverseProfile F₀)) :
    ∀ k, 0 < k → k ≤ K → ∀ c, c₀ < c →
      0 < coeff k (inverseProfile (betaFamily F₀ c₀ c)) := by
  intro k hk hkK c hc
  by_cases hk₁ : k = 1
  · subst k
    exact beta_first_inverse_pos F₀ hF₀ hc₀ hp₁ hc.le
  · have hk₂ : 2 ≤ k := by omega
    apply pos_of_beta_ode k hc₀ hc
      (by simpa only [betaFamily_self F₀ hc₀] using hp₀ k hk hkK)
    · intro x hx
      exact hasDerivAt_inverseProfile_beta_equation F₀ hF₀ c₀ (hc₀.trans_le hx.1) k hk
    · intro x hx
      apply betaForcing_pos_of_coeff_le k hk₂ _
        (constantCoeff_inverseProfile _ (by simpa only [constantCoeff_betaFamily] using hF₀))
        (hc₀.trans_le hx.1.le)
      · intro i hi hik
        exact beta_preserves_inverse_nonneg_up_to F₀ hF₀ hc₀ K hp₀ i hi
          (hik.trans hkK) x hx.1.le
      · exact beta_first_inverse_pos F₀ hF₀ hc₀ hp₁ hx.1.le

/-- Every positive inverse-profile coefficient through weight eight is nonnegative for `c ≥ 2`. -/
theorem hypergeometric_inverseProfile_nonneg_first_eight {c : ℝ} (hc : 2 ≤ c)
    (k : ℕ) (hk : 0 < k) (hk8 : k ≤ 8) :
    0 ≤ coeff k (inverseProfile (hypergeometricRadial c)) := by
  have h := beta_preserves_inverse_nonneg_up_to (hypergeometricRadial 2)
    (constantCoeff_hypergeometricRadial 2) (by norm_num) 8
    haagerup_base_nonneg_first_eight k hk hk8 c hc
  simpa only [betaFamily_hypergeometricRadial (c₀ := 2)
    (by norm_num) (by linarith : 0 < c)] using h

/-- The same eight coefficients are strictly positive for `c > 2`. -/
theorem hypergeometric_inverseProfile_pos_first_eight {c : ℝ} (hc : 2 < c)
    (k : ℕ) (hk : 0 < k) (hk8 : k ≤ 8) :
    0 < coeff k (inverseProfile (hypergeometricRadial c)) := by
  have hp₁ : 0 < coeff 1 (inverseProfile (hypergeometricRadial 2)) := by
    rw [coeff_one_inverseProfile_hypergeometricRadial_two]
    norm_num
  have h := beta_preserves_inverse_pos_up_to (hypergeometricRadial 2)
    (constantCoeff_hypergeometricRadial 2) (by norm_num) 8
    haagerup_base_nonneg_first_eight hp₁ k hk hk8 c hc
  simpa only [betaFamily_hypergeometricRadial (c₀ := 2)
    (by norm_num) (by linarith : 0 < c)] using h

/-- Unconditional nonlinear odd inverse signs through degree seventeen for every real `n ≥ 2`. -/
theorem hypergeometric_dimension_inverseSeries_sign_first_eight {n : ℝ} (hn : 2 ≤ n)
    (k : ℕ) (hk : 0 < k) (hk8 : k ≤ 8) :
    coeff (2 * k + 1)
      (inverseSeries (hypergeometricRadial ((n + 2) / 2)) (by simp)) ≤ 0 := by
  have hp := hypergeometric_inverseProfile_nonneg_first_eight (by linarith : 2 ≤ (n + 2) / 2)
    k hk hk8
  rw [coeff_inverseProfile_of_pos _ k hk] at hp
  rw [← oddLift_inverseRadial_eq_inverseSeries, coeff_oddLift]
  linarith

/-- The nonlinear odd inverse coefficients through degree seventeen are negative for real
`n > 2`. -/
theorem hypergeometric_dimension_inverseSeries_strict_sign_first_eight {n : ℝ} (hn : 2 < n)
    (k : ℕ) (hk : 0 < k) (hk8 : k ≤ 8) :
    coeff (2 * k + 1)
      (inverseSeries (hypergeometricRadial ((n + 2) / 2)) (by simp)) < 0 := by
  have hp := hypergeometric_inverseProfile_pos_first_eight (by linarith : 2 < (n + 2) / 2)
    k hk hk8
  rw [coeff_inverseProfile_of_pos _ k hk] at hp
  rw [← oddLift_inverseRadial_eq_inverseSeries, coeff_oddLift]
  linarith

end GrotheSign
