import Grothe.UpperChaos.FixedChaosMomentSum

/-! Common-denominator integer evaluation of the two-variable moment.
Agent-ID: codex-7c2e -/

open Finset

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- An integer numerator evaluated without intermediate rational reductions.
The two degree sums are required to agree in its interpretation theorem. -/
def matrixMomentNumerator (U V W p r a c : ℕ) : ℕ :=
  p.factorial * r.factorial *
    ∑ k ∈ Icc (p - c) (min a p), matrixMomentSummand U V W p a c k

/-- Scaling all three matrix entries scales the moment by its input degree.
This identity does not require matched input and output degrees. -/
theorem matrixMoment2_scale {R : Type*} [CommSemiring R]
    (t u v w : R) (p r a c : ℕ) :
    matrixMoment2 (t * u) (t * v) (t * w) (p, r) (a, c) =
      t ^ (p + r) * matrixMoment2 u v w (p, r) (a, c) := by
  cases p with
  | succ p =>
    simp only [matrixMoment2]
    rw [matrixMoment2_scale t u v w p r (a - 1) c,
      matrixMoment2_scale t u v w p r a (c - 1)]
    rw [show p + 1 + r = (p + r) + 1 by omega, pow_succ]
    ring
  | zero =>
    cases r with
    | succ r =>
      simp only [matrixMoment2]
      rw [matrixMoment2_scale t u v w 0 r (a - 1) c,
        matrixMoment2_scale t u v w 0 r a (c - 1)]
      simp only [Nat.zero_add, pow_succ]
      ring
    | zero => simp [matrixMoment2]
termination_by p + r
decreasing_by
  all_goals omega

/-- The integer numerator has its literal semiring interpretation whenever
the two degree sums agree. -/
theorem matrixMoment2_natCast {R : Type*} [CommSemiring R]
    (U V W p r a c : ℕ) (hdegree : p + r = a + c) :
    matrixMoment2 (U : R) (V : R) (W : R) (p, r) (a, c) =
      (matrixMomentNumerator U V W p r a c : R) := by
  rw [matrixMoment2_eq_sum, matrixMoment2Sum, ite_eq_left hdegree]
  simp only [matrixMomentNumerator, matrixMomentSummand, Nat.cast_mul,
    Nat.cast_sum, Nat.cast_pow, Nat.cast_id]

/-- One common denominator can be taken outside the complete moment. -/
theorem matrixMoment2_div (u v w D : ℚ) (p r a c : ℕ) :
    matrixMoment2 (u / D) (v / D) (w / D) (p, r) (a, c) =
      matrixMoment2 u v w (p, r) (a, c) / D ^ (p + r) := by
  simpa only [div_eq_mul_inv, inv_pow, mul_comm] using
    matrixMoment2_scale (D⁻¹) u v w p r a c

/-- Rational moment evaluation uses one natural-number numerator and one
denominator power. No rational gcd is needed inside the finite sum. -/
theorem matrixMoment2_common_denominator (U V W : ℕ) (D : ℚ)
    (p r a c : ℕ) (hdegree : p + r = a + c) :
    matrixMoment2 ((U : ℚ) / D) ((V : ℚ) / D) ((W : ℚ) / D) (p, r) (a, c) =
      (matrixMomentNumerator U V W p r a c : ℚ) / D ^ (a + c) := by
  rw [matrixMoment2_div, matrixMoment2_natCast U V W p r a c hdegree, hdegree]

theorem matrixMoment2_common_denominator_degree (U V W : ℕ) (D : ℚ)
    (p r a c n : ℕ) (hdegree : p + r = a + c) (hn : a + c = n) :
    matrixMoment2 ((U : ℚ) / D) ((V : ℚ) / D) ((W : ℚ) / D) (p, r) (a, c) =
      (matrixMomentNumerator U V W p r a c : ℚ) / D ^ n := by
  rw [matrixMoment2_common_denominator U V W D p r a c hdegree, hn]

end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.matrixMoment2_common_denominator' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.matrixMoment2_common_denominator
