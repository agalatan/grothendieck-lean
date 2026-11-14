import GrotheSign.BetaFamily
import Mathlib.Analysis.SpecialFunctions.OrdinaryHypergeometric

/-!
# The hypergeometric family underlying the rounding kernels

The radial formal series uses Mathlib's coefficients of `₂F₁(1/2, 1/2; c; u)` directly. Its odd
lift is therefore the normalized forward kernel `t * ₂F₁(1/2, 1/2; c; t²)`. The beta-family
identity and first actual inverse coefficient are finite algebraic identities.

Proof implementation: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

open PowerSeries

/-- The formal radial series of `₂F₁(1/2, 1/2; c; u)`, with Mathlib's exact coefficients. -/
noncomputable def hypergeometricRadial (c : ℝ) : ℝ⟦X⟧ :=
  mk (ordinaryHypergeometricCoefficient (1 / 2 : ℝ) (1 / 2) c)

theorem coeff_hypergeometricRadial (c : ℝ) (k : ℕ) :
    coeff k (hypergeometricRadial c) =
      ((ascPochhammer ℝ k).eval (1 / 2 : ℝ)) ^ 2 /
        ((ascPochhammer ℝ k).eval c * k.factorial) := by
  simp only [hypergeometricRadial, coeff_mk, ordinaryHypergeometricCoefficient,
    div_eq_mul_inv, mul_inv_rev, pow_two]
  ring

@[simp] theorem constantCoeff_hypergeometricRadial (c : ℝ) :
    constantCoeff (hypergeometricRadial c) = 1 := by
  rw [← coeff_zero_eq_constantCoeff_apply, coeff_hypergeometricRadial]
  simp

theorem coeff_hypergeometricRadial_pos {c : ℝ} (hc : 0 < c) (k : ℕ) :
    0 < coeff k (hypergeometricRadial c) := by
  rw [coeff_hypergeometricRadial]
  exact div_pos (sq_pos_of_pos (ascPochhammer_pos k (1 / 2 : ℝ) (by norm_num)))
    (mul_pos (ascPochhammer_pos k c hc) (Nat.cast_pos.mpr (Nat.factorial_pos k)))

/-- The coefficient family is exactly the beta transform of any earlier positive parameter. -/
theorem betaFamily_hypergeometricRadial {c₀ c : ℝ} (hc₀ : 0 < c₀) (hc : 0 < c) :
    betaFamily (hypergeometricRadial c₀) c₀ c = hypergeometricRadial c := by
  ext k
  rw [coeff_betaFamily, coeff_hypergeometricRadial, coeff_hypergeometricRadial]
  unfold betaMultiplier betaPochhammer
  have h₀ : (ascPochhammer ℝ k).eval c₀ ≠ 0 := (ascPochhammer_pos k c₀ hc₀).ne'
  have h : (ascPochhammer ℝ k).eval c ≠ 0 := (ascPochhammer_pos k c hc).ne'
  have hf : (k.factorial : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero k)
  field_simp [h₀, h, hf]

/-- The first coefficient of the inverse profile equals the first forward radial coefficient
for a normalized forward series. -/
theorem coeff_one_inverseProfile_of_constantCoeff_one (F : ℝ⟦X⟧)
    (hF : constantCoeff F = 1) : coeff 1 (inverseProfile F) = coeff 1 F := by
  have hunit : constantCoeff F ≠ 0 := by rw [hF]; norm_num
  have hi : coeff 1 F⁻¹ = -coeff 1 F := by
    have h := congrArg (coeff 1) (PowerSeries.mul_inv_cancel F hunit)
    rw [coeff_one_mul, constantCoeff_inv, hF] at h
    norm_num at h
    linarith
  rw [coeff_inverseProfile_of_pos F 1 zero_lt_one, coeff_inverseRadial, coeff_one_pow,
    constantCoeff_inv, hF, hi]
  simp only [inv_one, one_pow, mul_one]
  ring

theorem coeff_one_hypergeometricRadial (c : ℝ) :
    coeff 1 (hypergeometricRadial c) = 1 / (4 * c) := by
  norm_num [hypergeometricRadial, ordinaryHypergeometricCoefficient, ascPochhammer_one,
    div_eq_mul_inv, mul_inv_rev]
  ring

/-- The first coefficient is computed from the actual inverse, not an independent recurrence. -/
theorem coeff_one_inverseProfile_hypergeometricRadial (c : ℝ) :
    coeff 1 (inverseProfile (hypergeometricRadial c)) = 1 / (4 * c) := by
  rw [coeff_one_inverseProfile_of_constantCoeff_one _ (constantCoeff_hypergeometricRadial c),
    coeff_one_hypergeometricRadial]

theorem coeff_one_inverseProfile_hypergeometricRadial_two :
    coeff 1 (inverseProfile (hypergeometricRadial 2)) = 1 / 8 := by
  rw [coeff_one_inverseProfile_hypergeometricRadial]
  norm_num

/-- The finite hypergeometric coefficient recurrence. -/
theorem coeff_hypergeometricRadial_succ {c : ℝ} (hc : 0 < c) (k : ℕ) :
    coeff (k + 1) (hypergeometricRadial c) =
      coeff k (hypergeometricRadial c) * ((k : ℝ) + 1 / 2) ^ 2 /
        ((c + k) * ((k : ℝ) + 1)) := by
  rw [coeff_hypergeometricRadial, coeff_hypergeometricRadial,
    ascPochhammer_succ_eval, ascPochhammer_succ_eval, Nat.factorial_succ]
  push_cast
  have h : (ascPochhammer ℝ k).eval c ≠ 0 := (ascPochhammer_pos k c hc).ne'
  have hf : (k.factorial : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero k)
  have hck : c + (k : ℝ) ≠ 0 := ne_of_gt (add_pos_of_pos_of_nonneg hc (Nat.cast_nonneg k))
  have hk : (k : ℝ) + 1 ≠ 0 := by positivity
  field_simp [h, hf, hck, hk]
  ring

end GrotheSign
