import Grothe.Haagerup.Phase
import Grothe.UpperChaos.HermiteBasis
import Grothe.UpperChaos.HermiteExpansion
import Grothe.UpperChaos.PhaseCombinatorics
import Grothe.UpperChaos.PhaseMoments
import Grothe.Upper.Haagerup
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.RingTheory.Polynomial.Pochhammer

/-!
# Hermite coefficients of Gaussian phase

The charge-one Hermite expansion integrates to a finite Gamma sum. Its
Pochhammer evaluation and the Hermite normalization recover Haagerup's coefficients.
-/

open Polynomial Finset MeasureTheory Grothe.UpperChaos Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.Haag

noncomputable section

lemma Gamma_three_halves : Real.Gamma (3 / 2) = Real.sqrt Real.pi / 2 := by
  rw [show (3 / 2 : ℝ) = 1 / 2 + 1 by norm_num, Real.Gamma_add_one (by norm_num),
    Real.Gamma_one_half_eq]
  ring

lemma pochhammer_sq (k : ℕ) :
    ((ascPochhammer ℝ k).eval (1 / 2)) ^ 2 =
      (haagR k : ℝ) * ((k + 1).factorial * k.factorial : ℕ) := by
  induction k with
  | zero => norm_num [haagR]
  | succ k ih =>
    rw [ascPochhammer_succ_eval, mul_pow, ih, haagR]
    rw [Nat.factorial_succ (k + 1), Nat.factorial_succ k]
    push_cast
    have h1 : (k : ℝ) + 1 ≠ 0 := by positivity
    have h2 : (k : ℝ) + 2 ≠ 0 := by positivity
    field_simp
    ring

lemma phase_moment_sq (k : ℕ) :
    ((-1 : ℝ) ^ k * Real.Gamma (3 / 2) * (ascPochhammer ℝ k).eval (1 / 2)) ^ 2 =
      haagCoeff k * ((k + 1).factorial * k.factorial : ℕ) := by
  rw [mul_pow, mul_pow, ← pow_mul, mul_comm k 2, pow_mul]
  norm_num only [neg_one_sq, one_pow, one_mul]
  rw [pochhammer_sq, Gamma_three_halves, div_pow, Real.sq_sqrt Real.pi_pos.le]
  unfold haagCoeff
  ring

lemma normalized_phase_moment_sq (k : ℕ) :
    (UpperChaos.nrm (k + 1) k *
      ((-1 : ℝ) ^ k * Real.Gamma (3 / 2) * (ascPochhammer ℝ k).eval (1 / 2))) ^ 2 =
      haagCoeff k := by
  rw [mul_pow, phase_moment_sq]
  calc
    _ = haagCoeff k * (UpperChaos.nrm (k + 1) k * UpperChaos.nrm (k + 1) k *
      ((k + 1).factorial * k.factorial : ℕ)) := by ring
    _ = _ := by rw [UpperChaos.nrm_sq_mul, mul_one]

/-- The unnormalized charge-one Hermite coefficient of phase. -/
theorem integral_H_phase (k : ℕ) :
    ∫ z, conj (ev z (H (k + 1) k)) * ph z ∂gaussC =
      (((-1 : ℝ) ^ k * Real.Gamma (3 / 2) * (ascPochhammer ℝ k).eval (1 / 2) : ℝ) : ℂ) := by
  let a (j : ℕ) : ℝ := (-1 : ℝ) ^ j * ((k + 1).choose j : ℝ) *
    (k.choose j : ℝ) * (j.factorial : ℝ)
  have he : (fun z => conj (ev z (H (k + 1) k)) * ph z) =
      fun z => ∑ j ∈ range (k + 1), (a j : ℂ) *
        (conj (z ^ (k - j + 1) * conj z ^ (k - j)) * (z / (‖z‖ : ℂ))) := by
    funext z
    rw [ev_H_charge_one, map_sum, Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro j hj
    have he : k + 1 - j = k - j + 1 := by have := mem_range.mp hj; omega
    simp only [he, map_mul, map_pow, map_neg, map_one,
      map_natCast, Complex.conj_conj, ph, a]
    push_cast
    ring
  rw [he, integral_finsetSum _ (fun j _ =>
    (integrable_conj_monomial_mul_div_norm (k - j)).const_mul (a j : ℂ))]
  simp_rw [integral_const_mul, integral_conj_monomial_mul_div_norm]
  calc
    (∑ j ∈ range (k + 1), (a j : ℂ) * (Real.Gamma ((k - j : ℕ) + 3 / 2) : ℂ)) =
        ((∑ j ∈ range (k + 1), a j * Real.Gamma ((k : ℝ) + 3 / 2 - j)) : ℝ) := by
      push_cast
      apply Finset.sum_congr rfl
      intro j hj
      have hjk : j ≤ k := by have := mem_range.mp hj; omega
      rw [show ((k - j : ℕ) : ℝ) + 3 / 2 = (k : ℝ) + 3 / 2 - j by
        rw [Nat.cast_sub hjk]; ring]
    _ = _ := by
      rw [show (∑ j ∈ range (k + 1), a j * Real.Gamma ((k : ℝ) + 3 / 2 - j)) =
          (-1 : ℝ) ^ k * Real.Gamma (3 / 2) * (ascPochhammer ℝ k).eval (1 / 2) from
        PhaseCombinatorics.phase_coefficient k]

/-- The phase energies are precisely Haagerup's positive coefficients. -/
theorem phase_energy (k : ℕ) :
    ‖⟪hvec (k + 1, k), phaseLp⟫_ℂ‖ ^ 2 = haagCoeff k := by
  rw [hvec, phaseLp, UpperChaos.inner_toLp]
  simp only [hfun, map_mul, Complex.conj_ofReal]
  simp_rw [mul_assoc]
  rw [integral_const_mul, integral_H_phase, ← Complex.ofReal_mul,
    Complex.norm_real, Real.norm_eq_abs, sq_abs]
  exact normalized_phase_moment_sq k

end
end Grothe.Haag
