import GrotheSign.HypergeometricFamily
import GrotheSign.BetaStrict

/-!
# Hypergeometric specialization of beta preservation

These interfaces isolate the Haagerup base sign theorem at `c = 2` as an explicit premise.
They propagate it to every real `c ≥ 2`, equivalently every real dimension `n ≥ 2` under
`c = (n + 2) / 2`. Strict signs hold when the parameter increases strictly.

Proof implementation: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

open PowerSeries

/-- The base signs imply all inverse-profile signs throughout the hypergeometric family. -/
theorem hypergeometric_inverseProfile_nonneg_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {c : ℝ} (hc : 2 ≤ c) (k : ℕ) (hk : 0 < k) :
    0 ≤ coeff k (inverseProfile (hypergeometricRadial c)) := by
  have h := beta_preserves_inverse_nonneg (hypergeometricRadial 2)
    (constantCoeff_hypergeometricRadial 2) (by norm_num) hbase k hk c hc
  simpa only [betaFamily_hypergeometricRadial (c₀ := 2)
    (by norm_num) (by linarith : 0 < c)] using h

/-- The exact positive first coefficient makes every profile coefficient positive for `c > 2`. -/
theorem hypergeometric_inverseProfile_pos_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {c : ℝ} (hc : 2 < c) (k : ℕ) (hk : 0 < k) :
    0 < coeff k (inverseProfile (hypergeometricRadial c)) := by
  have hp₁ : 0 < coeff 1 (inverseProfile (hypergeometricRadial 2)) := by
    rw [coeff_one_inverseProfile_hypergeometricRadial_two]
    norm_num
  have h := beta_preserves_inverse_pos (hypergeometricRadial 2)
    (constantCoeff_hypergeometricRadial 2) (by norm_num) hbase hp₁ k hk c hc
  simpa only [betaFamily_hypergeometricRadial (c₀ := 2)
    (by norm_num) (by linarith : 0 < c)] using h

/-- Nonlinear odd coefficients of the actual compositional inverse are nonpositive. -/
theorem hypergeometric_inverseSeries_sign_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {c : ℝ} (hc : 2 ≤ c) (k : ℕ) (hk : 0 < k) :
    coeff (2 * k + 1) (inverseSeries (hypergeometricRadial c) (by simp)) ≤ 0 := by
  have hp := hypergeometric_inverseProfile_nonneg_of_base hbase hc k hk
  rw [coeff_inverseProfile_of_pos _ k hk] at hp
  rw [← oddLift_inverseRadial_eq_inverseSeries, coeff_oddLift]
  linarith

/-- Nonlinear odd coefficients of the actual compositional inverse are negative for `c > 2`. -/
theorem hypergeometric_inverseSeries_strict_sign_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {c : ℝ} (hc : 2 < c) (k : ℕ) (hk : 0 < k) :
    coeff (2 * k + 1) (inverseSeries (hypergeometricRadial c) (by simp)) < 0 := by
  have hp := hypergeometric_inverseProfile_pos_of_base hbase hc k hk
  rw [coeff_inverseProfile_of_pos _ k hk] at hp
  rw [← oddLift_inverseRadial_eq_inverseSeries, coeff_oddLift]
  linarith

/-- The real dimension parameter gives the full nonnegative profile sign statement. -/
theorem hypergeometric_dimension_inverseProfile_nonneg_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {n : ℝ} (hn : 2 ≤ n) (k : ℕ) (hk : 0 < k) :
    0 ≤ coeff k (inverseProfile (hypergeometricRadial ((n + 2) / 2))) :=
  hypergeometric_inverseProfile_nonneg_of_base hbase (by linarith) k hk

/-- Strict profile signs hold for every real dimension greater than two. -/
theorem hypergeometric_dimension_inverseProfile_pos_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {n : ℝ} (hn : 2 < n) (k : ℕ) (hk : 0 < k) :
    0 < coeff k (inverseProfile (hypergeometricRadial ((n + 2) / 2))) :=
  hypergeometric_inverseProfile_pos_of_base hbase (by linarith) k hk

/-- The actual inverse of the dimension-parameter kernel has nonpositive nonlinear odd
coefficients. -/
theorem hypergeometric_dimension_inverseSeries_sign_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {n : ℝ} (hn : 2 ≤ n) (k : ℕ) (hk : 0 < k) :
    coeff (2 * k + 1)
      (inverseSeries (hypergeometricRadial ((n + 2) / 2)) (by simp)) ≤ 0 :=
  hypergeometric_inverseSeries_sign_of_base hbase (by linarith) k hk

/-- The actual inverse has strictly negative nonlinear odd coefficients for real dimension
`n > 2`. -/
theorem hypergeometric_dimension_inverseSeries_strict_sign_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {n : ℝ} (hn : 2 < n) (k : ℕ) (hk : 0 < k) :
    coeff (2 * k + 1)
      (inverseSeries (hypergeometricRadial ((n + 2) / 2)) (by simp)) < 0 :=
  hypergeometric_inverseSeries_strict_sign_of_base hbase (by linarith) k hk

end GrotheSign
