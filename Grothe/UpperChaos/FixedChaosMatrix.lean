import Grothe.UpperChaos.FixedChaosRecurrence

/-!
# Finite recurrence for the actual production smoothing matrix

The recurrence uses only three entries of the production matrix and natural
integer arithmetic. It applies at every degree, without a noise matrix or an
assumed numerical matrix-entry formula.
Agent-ID: codex-7c2e
-/

open MvPolynomial

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- Unnormalized joint Hermite moments, evaluated by lowering an input degree.
The same finite arithmetic can be interpreted over rationals or complex numbers. -/
def matrixRecurrence {R : Type*} [Semiring R] (u v w : R) : Idx2 → Idx2 → R
  | ((p + 1, q), (r, s)), ((a, b), (c, d)) =>
      u * a * matrixRecurrence u v w ((p, q), (r, s)) ((a - 1, b), (c, d)) +
      v * c * matrixRecurrence u v w ((p, q), (r, s)) ((a, b), (c - 1, d))
  | ((0, q + 1), (r, s)), ((a, b), (c, d)) =>
      u * b * matrixRecurrence u v w ((0, q), (r, s)) ((a, b - 1), (c, d)) +
      v * d * matrixRecurrence u v w ((0, q), (r, s)) ((a, b), (c, d - 1))
  | ((0, 0), (r + 1, s)), ((a, b), (c, d)) =>
      v * a * matrixRecurrence u v w ((0, 0), (r, s)) ((a - 1, b), (c, d)) +
      w * c * matrixRecurrence u v w ((0, 0), (r, s)) ((a, b), (c - 1, d))
  | ((0, 0), (0, s + 1)), ((a, b), (c, d)) =>
      v * b * matrixRecurrence u v w ((0, 0), (0, s)) ((a, b - 1), (c, d)) +
      w * d * matrixRecurrence u v w ((0, 0), (0, s)) ((a, b), (c, d - 1))
  | ((0, 0), (0, 0)), i => if i = ((0, 0), (0, 0)) then 1 else 0
termination_by j _ => tdeg j
decreasing_by
  all_goals simp_wf
  all_goals simp only [tdeg]
  all_goals omega

noncomputable section

private theorem pderiv0_H (a b : ℕ) : pderiv 0 (H a b) = a • H (a - 1) b := by
  cases a with
  | zero => simp [pderiv0_H_zero]
  | succ a => simpa using pderiv0_H_succ a b

private theorem pderiv1_H (a b : ℕ) : pderiv 1 (H a b) = b • H a (b - 1) := by
  cases b with
  | zero => simp [pderiv1_H_zero]
  | succ b => simpa using pderiv1_H_succ a b

private theorem pairing_nsmul_third (f g h k : CPoly) (n : ℕ) :
    pairing f g (n • h) k = (n : ℂ) * pairing f g h k := by
  unfold pairing outputPair
  rw [map_nsmul, smul_mul_assoc, mul_smul_comm, map_nsmul, nsmul_eq_mul]

private theorem pairing_nsmul_fourth (f g h k : CPoly) (n : ℕ) :
    pairing f g h (n • k) = (n : ℂ) * pairing f g h k := by
  unfold pairing outputPair
  rw [map_nsmul, mul_smul_comm, mul_smul_comm, map_nsmul, nsmul_eq_mul]

/-- The finite recurrence computes the actual unnormalized Gaussian pairing. -/
theorem pairing_H_eq_matrixRecurrence (j i : Idx2) :
    pairing (H j.1.1 j.1.2) (H j.2.1 j.2.2) (H i.1.1 i.1.2) (H i.2.1 i.2.2) =
      matrixRecurrence (m00 : ℂ) (m01 : ℂ) (m11 : ℂ) j i := by
  rcases j with ⟨⟨p, q⟩, r, s⟩
  rcases i with ⟨⟨a, b⟩, c, d⟩
  cases p with
  | succ p =>
    simp only [H_succ_left, pairing_A0_first, pderiv0_H,
      pairing_nsmul_third, pairing_nsmul_fourth, matrixRecurrence]
    rw [pairing_H_eq_matrixRecurrence ((p, q), (r, s)) ((a - 1, b), (c, d)),
      pairing_H_eq_matrixRecurrence ((p, q), (r, s)) ((a, b), (c - 1, d))]
    ring
  | zero =>
    cases q with
    | succ q =>
      simp only [H_zero_succ, pairing_A1_first, pderiv1_H,
        pairing_nsmul_third, pairing_nsmul_fourth, matrixRecurrence]
      rw [pairing_H_eq_matrixRecurrence ((0, q), (r, s)) ((a, b - 1), (c, d)),
        pairing_H_eq_matrixRecurrence ((0, q), (r, s)) ((a, b), (c, d - 1))]
      ring
    | zero =>
      cases r with
      | succ r =>
        simp only [H_succ_left, pairing_A0_second, pderiv0_H,
          pairing_nsmul_third, pairing_nsmul_fourth, matrixRecurrence]
        rw [pairing_H_eq_matrixRecurrence ((0, 0), (r, s)) ((a - 1, b), (c, d)),
          pairing_H_eq_matrixRecurrence ((0, 0), (r, s)) ((a, b), (c - 1, d))]
        ring
      | zero =>
        cases s with
        | succ s =>
          simp only [H_zero_succ, pairing_A1_second, pderiv1_H,
            pairing_nsmul_third, pairing_nsmul_fourth, matrixRecurrence]
          rw [pairing_H_eq_matrixRecurrence ((0, 0), (0, s)) ((a, b - 1), (c, d)),
            pairing_H_eq_matrixRecurrence ((0, 0), (0, s)) ((a, b), (c, d - 1))]
          ring
        | zero =>
          simpa only [H_zero_zero, matrixRecurrence] using pairing_one_one ((a, b), (c, d))
termination_by tdeg j
decreasing_by
  all_goals simp only [tdeg]
  all_goals omega

/-- Every normalized production smoothing entry is given by finite arithmetic. -/
theorem actualEntry_eq_matrixRecurrence (j i : Idx2) :
    actualEntry j i = (nrm2 j : ℂ) * (nrm2 i : ℂ) *
      matrixRecurrence (m00 : ℂ) (m01 : ℂ) (m11 : ℂ) j i := by
  rw [actualEntry_eq_pairing, pairing_H_eq_matrixRecurrence]

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_eq_matrixRecurrence' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_eq_matrixRecurrence
