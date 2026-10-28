import Grothe.UpperChaos.HermiteBasis
import Mathlib.Tactic.Ring

/-! Zero-row Hermite normalization. This does not assert any Gaussian
integral or conditional coefficient equality. -/
open MvPolynomial
open scoped ComplexConjugate
namespace Grothe.UpperChaos.HermiteZeroRow
noncomputable section

theorem H_zero_eq (d : ℕ) : H 0 d = (MvPolynomial.X 1 : CPoly) ^ d := by
  induction d with
  | zero => simp [H_zero_zero]
  | succ d ih =>
    rw [H_zero_succ, A1, pderiv0_H_zero, sub_zero, ih, pow_succ, mul_comm]

theorem ev_H_zero (d : ℕ) (z : ℂ) : ev z (H 0 d) = conj z ^ d := by
  rw [H_zero_eq]
  simp [ev, zv]

theorem conj_hfun_zero (d : ℕ) (z : ℂ) :
    conj (hfun (0, d) z) = z ^ d / (Real.sqrt (d.factorial : ℝ) : ℂ) := by
  simp [hfun, nrm, ev_H_zero, div_eq_mul_inv, mul_comm]

end
end Grothe.UpperChaos.HermiteZeroRow
#print axioms Grothe.UpperChaos.HermiteZeroRow.conj_hfun_zero
