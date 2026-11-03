import Grothe.UpperChaos.ComplexHermite
import Mathlib.Algebra.Algebra.Bilinear
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.Module.Submodule.LinearMap
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Tactic.Ring

/-!
# A finite falling-factorial expansion of the production complex Hermite polynomials

Agent-ID: codex-2ca4.

The proof is finite algebra in the ring of linear endomorphisms of `CPoly`.
Multiplication by `X 0` commutes with negative partial differentiation in
`X 1`. Their binomial expansion is the production creation operator `A0`.
Falling factorials make terms with more differentiations than the degree
vanish, so the sum needs no auxiliary bound on the second Hermite index.

There is no exponential series, differentiation under an integral, or
interchange of physical and source integrals in this module.
-/

open MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos.HermiteFallingFactorial

noncomputable section

private def mulX0 : Module.End ℂ CPoly := LinearMap.mul ℂ CPoly (X 0)

private def negDeriv1 : Module.End ℂ CPoly :=
  -(pderiv (1 : Fin 2) : Derivation ℂ CPoly CPoly).toLinearMap

private theorem negDeriv1_commute_mulX0 : Commute negDeriv1 mulX0 := by
  change negDeriv1 * mulX0 = mulX0 * negDeriv1
  ext P
  change -(pderiv (1 : Fin 2) (X 0 * P)) = X 0 * (-(pderiv (1 : Fin 2) P))
  simp [pderiv_mul]

private theorem mulX0_pow_apply (n : ℕ) (P : CPoly) :
    (mulX0 ^ n) P = X 0 ^ n * P := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [pow_succ', Module.End.mul_apply, ih]
      change X 0 * (X 0 ^ n * P) = X 0 ^ (n + 1) * P
      rw [pow_succ']
      exact (mul_assoc _ _ _).symm

/-- Iterated negative differentiation of a pure conjugate-variable monomial.
The formula remains valid when `q < k`, since the falling factorial is zero. -/
private theorem negDeriv1_pow_X1 (q k : ℕ) :
    (negDeriv1 ^ k) (X 1 ^ q) =
      C ((-1 : ℂ) ^ k * (q.descFactorial k : ℂ)) * X 1 ^ (q - k) := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [pow_succ', Module.End.mul_apply, ih]
      change -(pderiv (1 : Fin 2)
        (C ((-1 : ℂ) ^ k * (q.descFactorial k : ℂ)) * X 1 ^ (q - k))) = _
      rw [pderiv_C_mul, pderiv_pow, pderiv_X_self, mul_one]
      simp only [Nat.descFactorial_succ, Nat.sub_sub, Nat.cast_mul,
        map_mul, map_pow, map_neg, map_one, map_natCast, pow_succ]
      ring

private theorem creation_pow_apply (p : ℕ) (P : CPoly) :
    ((negDeriv1 + mulX0) ^ p) P = A0^[p] P := by
  induction p with
  | zero => rfl
  | succ p ih =>
      rw [pow_succ', Module.End.mul_apply, ih, Function.iterate_succ_apply']
      change -(pderiv (1 : Fin 2) (A0^[p] P)) + X 0 * (A0^[p] P) =
        X 0 * (A0^[p] P) - pderiv (1 : Fin 2) (A0^[p] P)
      ring

private theorem creation_binomial_apply (p : ℕ) (P : CPoly) :
    ((negDeriv1 + mulX0) ^ p) P =
      ∑ k ∈ Finset.range (p + 1),
        p.choose k • (X 0 ^ (p - k) * (negDeriv1 ^ k) P) := by
  rw [negDeriv1_commute_mulX0.add_pow, LinearMap.sum_apply]
  apply Finset.sum_congr rfl
  intro k hk
  rw [(negDeriv1_commute_mulX0.pow_pow k (p - k)).eq]
  simp only [Module.End.mul_apply, Module.End.natCast_apply,
    map_nsmul, mulX0_pow_apply]

/-- The zeroth first-index row contains no contraction terms. -/
theorem H_zero_eq_X1_pow (q : ℕ) : H 0 q = (X 1 : CPoly) ^ q := by
  induction q with
  | zero => simp [H_zero_zero]
  | succ q ih =>
      rw [H_zero_succ, A1, pderiv0_H_zero, sub_zero, ih, pow_succ']

/-- The complete finite contraction formula for the production complex
Hermite polynomial. The summation range is independent of the second index. -/
theorem H_eq_fallingFactorial (p q : ℕ) :
    H p q = ∑ k ∈ Finset.range (p + 1),
      C ((-1 : ℂ) ^ k * (p.choose k : ℂ) * (q.descFactorial k : ℂ)) *
        X 0 ^ (p - k) * X 1 ^ (q - k) := by
  calc
    H p q = A0^[p] ((X 1 : CPoly) ^ q) := by
      change A0^[p] (H 0 q) = _
      rw [H_zero_eq_X1_pow]
    _ = ((negDeriv1 + mulX0) ^ p) (X 1 ^ q) :=
      (creation_pow_apply p _).symm
    _ = ∑ k ∈ Finset.range (p + 1),
        p.choose k • (X 0 ^ (p - k) * (negDeriv1 ^ k) (X 1 ^ q)) :=
      creation_binomial_apply p _
    _ = _ := by
      apply Finset.sum_congr rfl
      intro k hk
      rw [negDeriv1_pow_X1]
      simp only [nsmul_eq_mul, map_mul, map_pow, map_neg, map_one, map_natCast]
      ring

/-- The incoming Hermite factor as a finite ordinary monomial sum. -/
theorem ev_H_eq_fallingFactorial (z : ℂ) (p q : ℕ) :
    ev z (H p q) = ∑ k ∈ Finset.range (p + 1),
      ((-1 : ℂ) ^ k * (p.choose k : ℂ) * (q.descFactorial k : ℂ)) *
        z ^ (p - k) * conj z ^ (q - k) := by
  rw [H_eq_fallingFactorial]
  simp [ev, zv]

/-- The outgoing Hermite factor retains the same finite coefficients and
interchanges the physical monomial exponents by complex conjugation. -/
theorem conj_ev_H_eq_fallingFactorial (z : ℂ) (p q : ℕ) :
    conj (ev z (H p q)) = ∑ k ∈ Finset.range (p + 1),
      ((-1 : ℂ) ^ k * (p.choose k : ℂ) * (q.descFactorial k : ℂ)) *
        conj z ^ (p - k) * z ^ (q - k) := by
  rw [ev_H_eq_fallingFactorial]
  simp only [map_sum, map_mul, map_pow, map_neg, map_one, map_natCast,
    Complex.conj_conj]

end
end Grothe.UpperChaos.HermiteFallingFactorial
