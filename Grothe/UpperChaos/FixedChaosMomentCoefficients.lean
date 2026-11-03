import Grothe.UpperChaos.FixedChaosMatrixFactorization

/-! Polynomial coefficient semantics for the two-variable moment recurrence.
Agent-ID: codex-7c2e -/

open MvPolynomial

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

noncomputable section

variable {R : Type*} [CommSemiring R]

/-- Exponents of the two independent holomorphic variables. -/
def momentIndex (p r : ℕ) : Fin 2 →₀ ℕ :=
  Finsupp.single 0 p + Finsupp.single 1 r

/-- The two linear output coordinates raised to their specified degrees. -/
def momentPower (u v w : R) (a c : ℕ) : MvPolynomial (Fin 2) R :=
  (C u * X 0 + C v * X 1) ^ a * (C v * X 0 + C w * X 1) ^ c

/-- Extract the coefficient with its two input factorials. -/
def momentCoefficient (u v w : R) (p r a c : ℕ) : R :=
  (p.factorial : R) * (r.factorial : R) *
    (momentPower u v w a c).coeff (momentIndex p r)

private theorem momentIndex_add_first (p r : ℕ) :
    momentIndex p r + Finsupp.single 0 1 = momentIndex (p + 1) r := by
  ext k
  fin_cases k <;> simp [momentIndex]

private theorem momentIndex_add_second (p r : ℕ) :
    momentIndex p r + Finsupp.single 1 1 = momentIndex p (r + 1) := by
  ext k
  fin_cases k <;> simp [momentIndex]

private theorem coeff_pderiv_first (P : MvPolynomial (Fin 2) R) (p r : ℕ) :
    (pderiv 0 P).coeff (momentIndex p r) =
      P.coeff (momentIndex (p + 1) r) * (p + 1 : R) := by
  rw [coeff_pderiv, momentIndex_add_first]
  simp [momentIndex]

private theorem coeff_pderiv_second (P : MvPolynomial (Fin 2) R) (p r : ℕ) :
    (pderiv 1 P).coeff (momentIndex p r) =
      P.coeff (momentIndex p (r + 1)) * (r + 1 : R) := by
  rw [coeff_pderiv, momentIndex_add_second]
  simp [momentIndex]

/-- Differentiating the first variable lowers either output degree. -/
theorem pderiv_first_momentPower (u v w : R) (a c : ℕ) :
    pderiv 0 (momentPower u v w a c) =
      C (u * a) * momentPower u v w (a - 1) c +
        C (v * c) * momentPower u v w a (c - 1) := by
  simp [momentPower]
  ring

/-- Differentiating the second variable lowers either output degree. -/
theorem pderiv_second_momentPower (u v w : R) (a c : ℕ) :
    pderiv 1 (momentPower u v w a c) =
      C (v * a) * momentPower u v w (a - 1) c +
        C (w * c) * momentPower u v w a (c - 1) := by
  simp [momentPower]
  ring

theorem momentCoefficient_succ_first (u v w : R) (p r a c : ℕ) :
    momentCoefficient u v w (p + 1) r a c =
      u * a * momentCoefficient u v w p r (a - 1) c +
        v * c * momentCoefficient u v w p r a (c - 1) := by
  calc
    _ = (p.factorial : R) * (r.factorial : R) *
        (pderiv 0 (momentPower u v w a c)).coeff (momentIndex p r) := by
      rw [coeff_pderiv_first]
      simp only [momentCoefficient, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add,
        Nat.cast_one]
      ring
    _ = _ := by
      rw [pderiv_first_momentPower, AddMonoidAlgebra.coeff_add, Finsupp.add_apply,
        coeff_C_mul, coeff_C_mul]
      unfold momentCoefficient
      ring

theorem momentCoefficient_succ_second (u v w : R) (p r a c : ℕ) :
    momentCoefficient u v w p (r + 1) a c =
      v * a * momentCoefficient u v w p r (a - 1) c +
        w * c * momentCoefficient u v w p r a (c - 1) := by
  calc
    _ = (p.factorial : R) * (r.factorial : R) *
        (pderiv 1 (momentPower u v w a c)).coeff (momentIndex p r) := by
      rw [coeff_pderiv_second]
      simp only [momentCoefficient, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add,
        Nat.cast_one]
      ring
    _ = _ := by
      rw [pderiv_second_momentPower, AddMonoidAlgebra.coeff_add, Finsupp.add_apply,
        coeff_C_mul, coeff_C_mul]
      unfold momentCoefficient
      ring

theorem momentCoefficient_zero (u v w : R) (a c : ℕ) :
    momentCoefficient u v w 0 0 a c = if (a, c) = (0, 0) then 1 else 0 := by
  simp only [momentCoefficient, Nat.factorial_zero, Nat.cast_one, one_mul,
    momentIndex, Finsupp.single_zero, zero_add]
  change constantCoeff (momentPower u v w a c) = _
  simp only [momentPower, map_mul, map_pow, map_add, constantCoeff_C,
    constantCoeff_X, mul_zero, add_zero]
  by_cases ha : a = 0 <;> by_cases hc : c = 0 <;> simp [ha, hc]

/-- The checked Gaussian moment recurrence is coefficient extraction from two
powers of linear forms, with exactly the two input factorials. -/
theorem matrixMoment2_eq_coefficient (u v w : R) (p r a c : ℕ) :
    matrixMoment2 u v w (p, r) (a, c) =
      (p.factorial : R) * (r.factorial : R) *
        (momentPower u v w a c).coeff (momentIndex p r) := by
  change matrixMoment2 u v w (p, r) (a, c) = momentCoefficient u v w p r a c
  cases p with
  | succ p =>
    rw [matrixMoment2, momentCoefficient_succ_first,
      matrixMoment2_eq_coefficient u v w p r (a - 1) c,
      matrixMoment2_eq_coefficient u v w p r a (c - 1)]
    rfl
  | zero =>
    cases r with
    | succ r =>
      rw [matrixMoment2, momentCoefficient_succ_second,
        matrixMoment2_eq_coefficient u v w 0 r (a - 1) c,
        matrixMoment2_eq_coefficient u v w 0 r a (c - 1)]
      rfl
    | zero => rw [matrixMoment2, momentCoefficient_zero]
termination_by p + r
decreasing_by
  all_goals omega

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.matrixMoment2_eq_coefficient' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.matrixMoment2_eq_coefficient
