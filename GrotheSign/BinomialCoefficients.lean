import GrotheSign.IntegrandIdentity
import GrotheSign.LagrangeSubstitution

/-!
# Finite binomial expansions at a zero-constant series

These expansions express the inverse-flow convolution as a polynomial in finitely many inverse
coefficients. All substitutions below have zero constant coefficient.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset PowerSeries

/-- Substitution by a series with zero constant coefficient has a finite coefficient formula. -/
theorem coeff_subst_finite_of_constantCoeff_zero (H P : PowerSeries ℝ)
    (hP : constantCoeff P = 0) (n : ℕ) :
    coeff n (H.subst P) =
      ∑ q ∈ range (n + 1), coeff q H * coeff n (P ^ q) := by
  obtain ⟨Q, rfl⟩ := PowerSeries.X_dvd_iff.mpr hP
  simpa only [mul_one] using Lagrange.coeff_subst_mul_finite H Q 1 n

/-- The binomial expansion at `-P`, including its exact falling-factorial normalization. -/
theorem coeff_binomial_subst_neg (P : PowerSeries ℝ) (hP : constantCoeff P = 0)
    (a : ℝ) (n : ℕ) :
    coeff n ((binomialSeries ℝ a).subst (-P)) =
      ∑ q ∈ range (n + 1), (-1 : ℝ) ^ q *
        (descPochhammer ℝ q).eval a / q.factorial * coeff n (P ^ q) := by
  rw [coeff_subst_finite_of_constantCoeff_zero _ _ (by simp [hP])]
  apply Finset.sum_congr rfl
  intro q _
  have hn : (-P) ^ q = C ((-1 : ℝ) ^ q) * P ^ q := by
    rw [neg_pow, map_pow, map_neg, map_one]
  rw [binomialSeries_coeff, smul_eq_mul, mul_one, hn, coeff_C_mul,
    desc_eval_eq_factorial_mul_choose]
  have hq : (q.factorial : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero q)
  field_simp

/-- Substitution of a nonnegative integer binomial series is an ordinary power. -/
theorem binomial_subst_nat (P : PowerSeries ℝ) (hP : constantCoeff P = 0) (a : ℕ) :
    (binomialSeries ℝ (a : ℝ)).subst (-P) = (1 - P) ^ a := by
  have hp : HasSubst (-P) := HasSubst.of_constantCoeff_zero' (by simp [hP])
  have h1 : (1 : PowerSeries ℝ).subst (-P) = 1 := by
    simpa only [map_one] using (PowerSeries.subst_C (a := -P) (1 : ℝ))
  rw [binomialSeries_nat, subst_pow hp, subst_add hp, h1, subst_X hp]
  rfl

/-- The negative integer binomial expansion is the corresponding reciprocal power. -/
theorem binomial_subst_neg_nat (P : PowerSeries ℝ) (hP : constantCoeff P = 0) (a : ℕ) :
    (binomialSeries ℝ (-(a : ℝ))).subst (-P) = (1 - P)⁻¹ ^ a := by
  have hp : HasSubst (-P) := HasSubst.of_constantCoeff_zero' (by simp [hP])
  have hb : constantCoeff ((1 - P) ^ a) ≠ 0 := by simp [hP]
  rw [PowerSeries.inv_pow, PowerSeries.eq_inv_iff_mul_eq_one hb]
  rw [← binomial_subst_nat P hP a, ← subst_mul hp, ← binomialSeries_add]
  simpa only [neg_add_cancel, binomialSeries_zero, map_one] using
    (PowerSeries.subst_C (a := -P) (1 : ℝ))

/-- Finite coefficient expansion of a power of `1-P`. -/
theorem coeff_one_sub_pow (P : PowerSeries ℝ) (hP : constantCoeff P = 0) (a n : ℕ) :
    coeff n ((1 - P) ^ a) =
      ∑ q ∈ range (n + 1), (-1 : ℝ) ^ q *
        (descPochhammer ℝ q).eval (a : ℝ) / q.factorial * coeff n (P ^ q) := by
  rw [← binomial_subst_nat P hP a]
  exact coeff_binomial_subst_neg P hP a n

/-- Finite coefficient expansion of a reciprocal power of `1-P`. -/
theorem coeff_one_sub_inv_pow (P : PowerSeries ℝ) (hP : constantCoeff P = 0) (a n : ℕ) :
    coeff n ((1 - P)⁻¹ ^ a) =
      ∑ q ∈ range (n + 1), (ascPochhammer ℝ q).eval (a : ℝ) / q.factorial *
        coeff n (P ^ q) := by
  rw [← binomial_subst_neg_nat P hP a, coeff_binomial_subst_neg P hP]
  apply Finset.sum_congr rfl
  intro q _
  have h := ascPochhammer_eval_neg_eq_descPochhammer ℝ (-(a : ℝ)) q
  simp only [neg_neg] at h
  rw [← h]

end GrotheSign
