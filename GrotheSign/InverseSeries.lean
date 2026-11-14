import GrotheSign.LagrangeSubstitution
import Mathlib.RingTheory.PowerSeries.Expand

/-!
# Actual odd reversion and its coefficient formulas

The explicit Lagrange coefficients define a radial series. Its odd lift is proved equal to
Mathlib's compositional inverse, so the coefficient formulas are connected to actual reversion.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open PowerSeries

variable {R : Type*} [Field R]

/-- The odd series with radial coefficient series `F`. -/
noncomputable def oddLift (F : R⟦X⟧) : R⟦X⟧ := X * expand 2 (by decide) F

@[simp]
theorem constantCoeff_oddLift (F : R⟦X⟧) : constantCoeff (oddLift F) = 0 := by
  simp [oddLift]

@[simp]
theorem coeff_one_oddLift (F : R⟦X⟧) : coeff 1 (oddLift F) = constantCoeff F := by
  simp [oddLift, coeff_zero_eq_constantCoeff_apply]

@[simp]
theorem coeff_oddLift (F : R⟦X⟧) (k : ℕ) : coeff (2 * k + 1) (oddLift F) = coeff k F := by
  simp [oddLift]

/-- Expanding the variable commutes with the reciprocal of a unit power series. -/
theorem expand_inv (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) (p : ℕ) (hp : p ≠ 0) :
    expand p hp F⁻¹ = (expand p hp F)⁻¹ := by
  apply (PowerSeries.eq_inv_iff_mul_eq_one (by simpa using hF)).mpr
  rw [← map_mul, PowerSeries.inv_mul_cancel F hF, map_one]

/-- Mathlib's compositional inverse of the actual odd series. -/
noncomputable def inverseSeries (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) : R⟦X⟧ :=
  (oddLift F).substInvOfIsUnit (by
    rw [coeff_one_oddLift]
    exact isUnit_iff_ne_zero.mpr hF)

@[simp]
theorem constantCoeff_inverseSeries (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) :
    constantCoeff (inverseSeries F hF) = 0 := by
  simp [inverseSeries]

/-- The inverse composed after the forward odd series is the identity. -/
theorem inverseSeries_subst_oddLift (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) :
    (inverseSeries F hF).subst (oddLift F) = X := by
  exact (oddLift F).subst_substInvOfIsUnit_left (constantCoeff_oddLift F) _

/-- The forward odd series composed after the inverse is the identity. -/
theorem oddLift_subst_inverseSeries (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) :
    (oddLift F).subst (inverseSeries F hF) = X := by
  exact (oddLift F).subst_substInvOfIsUnit_right (constantCoeff_oddLift F) _

/-- The coefficient of a power of an odd lift, after removing its forced powers of `X`. -/
theorem coeff_pow_oddLift (F : R⟦X⟧) (m d : ℕ) :
    coeff (m + 2 * d) (oddLift F ^ m) = coeff d (F ^ m) := by
  rw [oddLift, mul_pow, ← map_pow, Nat.add_comm m (2 * d), coeff_X_pow_mul,
    coeff_expand_mul]

variable [CharZero R]

/-- The radial coefficient formula supplied by Lagrange inversion. -/
noncomputable def inverseRadial (F : R⟦X⟧) : R⟦X⟧ :=
  mk fun k ↦ coeff k (F⁻¹ ^ (2 * k + 1)) / (2 * (k : R) + 1)

omit [CharZero R] in
@[simp]
theorem coeff_inverseRadial (F : R⟦X⟧) (k : ℕ) :
    coeff k (inverseRadial F) = coeff k (F⁻¹ ^ (2 * k + 1)) / (2 * (k : R) + 1) := by
  simp [inverseRadial]

omit [CharZero R] in
@[simp]
theorem constantCoeff_inverseRadial (F : R⟦X⟧) :
    constantCoeff (inverseRadial F) = (constantCoeff F)⁻¹ := by
  rw [← coeff_zero_eq_constantCoeff_apply, coeff_inverseRadial]
  simp [coeff_zero_eq_constantCoeff_apply]

/-- The canonical profile whose coefficients are the negatives of the nonlinear inverse
coefficients when the forward series has constant coefficient one. -/
noncomputable def inverseProfile (F : R⟦X⟧) : R⟦X⟧ := 1 - inverseRadial F

omit [CharZero R] in
theorem inverseRadial_eq_one_sub_inverseProfile (F : R⟦X⟧) :
    inverseRadial F = 1 - inverseProfile F := by
  simp [inverseProfile]

omit [CharZero R] in
@[simp]
theorem constantCoeff_inverseProfile (F : R⟦X⟧) (hF : constantCoeff F = 1) :
    constantCoeff (inverseProfile F) = 0 := by
  simp [inverseProfile, hF]

omit [CharZero R] in
theorem coeff_inverseProfile_of_pos (F : R⟦X⟧) (k : ℕ) (hk : 0 < k) :
    coeff k (inverseProfile F) = -coeff k (inverseRadial F) := by
  simp [inverseProfile, hk.ne']

private theorem coeff_inverseSeries_succ (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) (n : ℕ) :
    coeff (n + 1) (inverseSeries F hF) =
      coeff n (expand 2 (by decide) (F⁻¹ ^ (n + 1))) / ((n : R) + 1) := by
  have h := Lagrange.lagrange_power (expand 2 (by decide) F) (inverseSeries F hF)
    (by simpa using hF) (inverseSeries_subst_oddLift F hF) (n + 1) 1 (by omega)
  simp only [pow_one, Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one, one_mul] at h
  rw [← expand_inv F hF 2 (by decide), ← map_pow] at h
  have hn : (n : R) + 1 ≠ 0 := by
    exact_mod_cast (show n + 1 ≠ 0 by omega)
  apply (eq_div_iff hn).mpr
  simpa [mul_comm] using h

/-- The Lagrange coefficient series is the actual compositional inverse, including all even
coefficients and the constant coefficient. -/
theorem oddLift_inverseRadial_eq_inverseSeries (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) :
    oddLift (inverseRadial F) = inverseSeries F hF := by
  ext n
  cases n with
  | zero => simp [coeff_zero_eq_constantCoeff_apply]
  | succ n =>
    rw [coeff_inverseSeries_succ, oddLift, coeff_succ_X_mul]
    by_cases hn : 2 ∣ n
    · obtain ⟨k, rfl⟩ := hn
      rw [coeff_expand_mul, coeff_expand_mul, coeff_inverseRadial]
      push_cast
      rfl
    · rw [coeff_expand_of_not_dvd 2 (by decide) _ hn,
        coeff_expand_of_not_dvd 2 (by decide) _ hn, zero_div]

/-- The explicit radial inverse satisfies the right inverse equation. -/
theorem oddLift_subst_inverseRadial (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) :
    (oddLift F).subst (oddLift (inverseRadial F)) = X := by
  rw [oddLift_inverseRadial_eq_inverseSeries F hF]
  exact oddLift_subst_inverseSeries F hF

/-- The explicit radial inverse satisfies the left inverse equation. -/
theorem inverseRadial_subst_oddLift (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) :
    (oddLift (inverseRadial F)).subst (oddLift F) = X := by
  rw [oddLift_inverseRadial_eq_inverseSeries F hF]
  exact inverseSeries_subst_oddLift F hF

/-- Reversing the inverse pair expresses each forward coefficient in the inverse radial series. -/
theorem forward_coeff_eq_inverse_power (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) (i : ℕ) :
    (2 * (i : R) + 1) * coeff i F =
      coeff i ((inverseRadial F)⁻¹ ^ (2 * i + 1)) := by
  have hG : constantCoeff (inverseRadial F) ≠ 0 := by simpa using inv_ne_zero hF
  have h := Lagrange.lagrange_power (expand 2 (by decide) (inverseRadial F)) (oddLift F)
    (by simpa using hG) (oddLift_subst_inverseRadial F hF) (2 * i + 1) 1 (by omega)
  rw [pow_one, coeff_oddLift, Nat.add_sub_cancel, Nat.cast_one, one_mul,
    ← expand_inv (inverseRadial F) hG 2 (by decide), ← map_pow, coeff_expand_mul] at h
  simpa using h

/-- The power-coefficient transport identity used in the infinitesimal inverse flow. -/
theorem inverse_power_coeff_transport (F : R⟦X⟧) (hF : constantCoeff F ≠ 0)
    (k i : ℕ) (hik : i ≤ k) :
    (i + 1 : R) * coeff (k - i) (F⁻¹ ^ (2 * k + 2)) =
      (k + 1 : R) * coeff (k - i) (inverseRadial F ^ (2 * i + 2)) := by
  have h := Lagrange.lagrange_power (expand 2 (by decide) F) (oddLift (inverseRadial F))
    (by simpa using hF) (inverseRadial_subst_oddLift F hF)
    (2 * k + 2) (2 * i + 2) (by omega)
  have hleft : coeff (2 * k + 2) (oddLift (inverseRadial F) ^ (2 * i + 2)) =
      coeff (k - i) (inverseRadial F ^ (2 * i + 2)) := by
    rw [show 2 * k + 2 = (2 * i + 2) + 2 * (k - i) by omega, coeff_pow_oddLift]
  rw [hleft, ← expand_inv F hF 2 (by decide), ← map_pow,
    show 2 * k + 2 - (2 * i + 2) = 2 * (k - i) by omega, coeff_expand_mul] at h
  push_cast at h
  linear_combination -h / 2

end GrotheSign
