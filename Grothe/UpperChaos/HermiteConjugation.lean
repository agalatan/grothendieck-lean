import Grothe.UpperChaos.ComplexHermite

/-! Complex conjugation swaps the indices of the Hermite polynomials.
Agent-ID: codex-cf82. -/
open MvPolynomial
open scoped ComplexConjugate
namespace Grothe.UpperChaos
noncomputable section

/-- Conjugation swaps the creation operators. -/
lemma conjP_A0 (P : CPoly) : conjP (A0 P) = A1 (conjP P) := by
  have hd : conjP (pderiv 1 P) = pderiv 0 (conjP P) := by
    simpa using (pderiv_conjP (0 : Fin 2) P).symm
  simp [A0, A1, conjP_X, hd]

lemma conjP_A1 (P : CPoly) : conjP (A1 P) = A0 (conjP P) := by
  have hd : conjP (pderiv 0 P) = pderiv 1 (conjP P) := by
    simpa using (pderiv_conjP (1 : Fin 2) P).symm
  simp [A0, A1, conjP_X, hd]

/-- The creation operators commute, so H admits a right-index recurrence. -/
lemma A0_A1_comm (P : CPoly) : A0 (A1 P) = A1 (A0 P) := by
  simp [A0, A1, Derivation.leibniz, pderiv_X, pderiv_comm] <;> ring

lemma H_succ_right (p q : ℕ) : H p (q + 1) = A1 (H p q) := by
  induction p with
  | zero => exact H_zero_succ q
  | succ p ih =>
      rw [H_succ_left, ih, H_succ_left, A0_A1_comm]

/-- The actual polynomial conjugation swaps both Hermite indices. -/
theorem conjP_H_swap (p q : ℕ) : conjP (H p q) = H q p := by
  induction p with
  | zero =>
      induction q with
      | zero => simp [H_zero_zero]
      | succ q ih => rw [H_zero_succ, conjP_A1, ih, H_succ_left]
  | succ p ih => rw [H_succ_left, conjP_A0, ih, H_succ_right]

/-- Evaluation gives exactly the conjugate index swap needed by the source. -/
theorem conj_ev_H_swap (z : ℂ) (p q : ℕ) :
    conj (ev z (H p q)) = ev z (H q p) := by
  rw [← ev_conjP, conjP_H_swap]

end
end Grothe.UpperChaos
