import Grothe.UpperChaos.ComplexHermite
import Mathlib.Data.Nat.Choose.Sum

/-!
# Finite expansion of the complex Hermite polynomials

Multiplication by `z` commutes with differentiation in `z̄`. The binomial theorem for these
operators gives the explicit finite expansion of `H p q`, without analytic hypotheses.
-/

open MvPolynomial Finset
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

private def mulX0 : Module.End ℂ CPoly := LinearMap.mul ℂ CPoly (X 0)
private def derivX1 : Module.End ℂ CPoly := (pderiv 1).toLinearMap

private lemma mulX0_apply (f : CPoly) : mulX0 f = X 0 * f := rfl
private lemma derivX1_apply (f : CPoly) : derivX1 f = pderiv 1 f := rfl

private lemma mulX0_pow (n : ℕ) (f : CPoly) : (mulX0 ^ n) f = X 0 ^ n * f := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ', Module.End.mul_apply, ih]
    change X 0 * (X 0 ^ n * f) = _
    rw [pow_succ']; ring

private lemma derivX1_pow (j q : ℕ) :
    (derivX1 ^ j) (X 1 ^ q) = C (q.descFactorial j : ℂ) * X 1 ^ (q - j) := by
  induction j with
  | zero => simp
  | succ j ih =>
    rw [pow_succ', Module.End.mul_apply, ih]
    change pderiv 1 (C (q.descFactorial j : ℂ) * X 1 ^ (q - j)) = _
    rw [pderiv_C_mul, pderiv_pow, pderiv_X_self, mul_one, Nat.descFactorial_succ]
    simp only [Nat.cast_mul, map_mul, map_natCast]
    rw [Nat.sub_sub]
    ring

private lemma neg_derivX1_pow (j : ℕ) (f : CPoly) :
    ((-derivX1) ^ j) f = (-1 : ℂ) ^ j • (derivX1 ^ j) f := by
  induction j with
  | zero => simp
  | succ j ih =>
    rw [pow_succ', Module.End.mul_apply, ih]
    simp only [LinearMap.neg_apply, map_smul, pow_succ', Module.End.mul_apply,
      neg_mul, one_mul, neg_smul, smul_neg]

private lemma derivX1_commute_mulX0 : Commute (-derivX1) mulX0 := by
  apply LinearMap.ext
  intro f
  simp only [Module.End.mul_apply, LinearMap.neg_apply, mulX0_apply, derivX1_apply,
    pderiv_mul, pderiv_X_of_ne (by decide : (0 : Fin 2) ≠ 1), zero_mul, zero_add, mul_neg]

private lemma A1_iter_one (q : ℕ) : A1^[q] 1 = (X 1 : CPoly) ^ q := by
  induction q with
  | zero => simp
  | succ q ih =>
    rw [Function.iterate_succ_apply', ih]
    simp [A1, pow_succ']

/-- The finite complex Hermite polynomial expansion. Terms beyond `q` vanish through `choose`. -/
theorem H_expansion (p q : ℕ) :
    H p q = ∑ j ∈ range (p + 1),
      C ((-1 : ℂ) ^ j * (p.choose j : ℂ) * (q.choose j : ℂ) * (j.factorial : ℂ)) *
        X 0 ^ (p - j) * X 1 ^ (q - j) := by
  have he : H p q = ((-derivX1 + mulX0) ^ p) (X 1 ^ q) := by
    rw [Module.End.pow_apply]
    have ha : ⇑(-derivX1 + mulX0) = A0 := by
      funext f
      change -pderiv 1 f + X 0 * f = X 0 * f - pderiv 1 f
      abel
    rw [ha, ← A1_iter_one, H]
  rw [he, derivX1_commute_mulX0.add_pow, LinearMap.sum_apply]
  apply Finset.sum_congr rfl
  intro j hj
  rw [(derivX1_commute_mulX0.pow_pow j (p - j)).eq]
  simp only [Module.End.mul_apply, Module.End.natCast_apply, map_nsmul]
  simp only [mulX0_pow, neg_derivX1_pow, derivX1_pow, smul_eq_C_mul, nsmul_eq_mul,
    Nat.descFactorial_eq_factorial_mul_choose, Nat.cast_mul, map_mul, map_pow, map_neg,
    map_one, map_natCast]
  ring

/-- Evaluation of the finite complex Hermite polynomial expansion. -/
theorem ev_H_expansion (p q : ℕ) (z : ℂ) :
    ev z (H p q) = ∑ j ∈ range (p + 1),
      (-1 : ℂ) ^ j * (p.choose j : ℂ) * (q.choose j : ℂ) * (j.factorial : ℂ) *
        z ^ (p - j) * conj z ^ (q - j) := by
  rw [H_expansion]
  simp [ev, zv]

/-- The charge-one expansion, with its identically zero final term removed. -/
theorem ev_H_charge_one (k : ℕ) (z : ℂ) :
    ev z (H (k + 1) k) = ∑ j ∈ range (k + 1),
      (-1 : ℂ) ^ j * ((k + 1).choose j : ℂ) * (k.choose j : ℂ) * (j.factorial : ℂ) *
        z ^ (k + 1 - j) * conj z ^ (k - j) := by
  rw [ev_H_expansion, Finset.sum_range_succ]
  simp

end

end Grothe.UpperChaos
