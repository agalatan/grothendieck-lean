import Grothe.UpperChaos.DampedMoments
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Data.Rat.BigOperators
import Mathlib.Data.Rat.Cast.Lemmas

/-!
# Finite algebra of the two-variable Gaussian invariants

For `U = |z|²`, `V = |w|²`, `W = Re(conj z * w)` and `D = Im(conj z * w)`,
every monomial `D^(2j) U^a V^b W^m` has an explicit finite expansion into complex
monomials. Together with the tilted complex Gaussian moments, this is a finite
exact evaluator; it does not require angular integration.
-/

open MeasureTheory ProbabilityTheory Complex Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- The rational coefficient in the two binomial expansions. -/
def invariantCoeff (j m s t : ℕ) : ℚ :=
  (-1 / 4) ^ j * (1 / 2) ^ m * (-1) ^ s *
    ((2 * j).choose s : ℚ) * (m.choose t : ℚ)

/-- A real monomial in the four simultaneous-rotation invariants. -/
def invariantMonomial (a b j m : ℕ) (u : ℂ × ℂ) : ℝ :=
  (conj u.1 * u.2).im ^ (2 * j) * Complex.normSq u.1 ^ a *
    Complex.normSq u.2 ^ b * (conj u.1 * u.2).re ^ m

/-- Exact finite evaluation. The guard retains precisely the balanced complex monomials. -/
def invariantMoment (rate : ℚ) (a b j m : ℕ) : ℚ :=
  ∑ s ∈ Finset.range (2 * j + 1), ∑ t ∈ Finset.range (m + 1),
    if 2 * j - s + (m - t) = s + t then
      invariantCoeff j m s t * ((a + s + t).factorial : ℚ) / rate ^ (a + s + t + 1) *
        ((b + s + t).factorial : ℚ) / rate ^ (b + s + t + 1)
    else 0

/-- Odd powers of `W` have no balanced complex monomial. -/
theorem invariantMoment_odd (rate : ℚ) (a b j k : ℕ) :
    invariantMoment rate a b j (2 * k + 1) = 0 := by
  unfold invariantMoment
  apply Finset.sum_eq_zero
  intro s hs
  apply Finset.sum_eq_zero
  intro t ht
  have hs' : s ≤ 2 * j := Nat.le_of_lt_succ (Finset.mem_range.mp hs)
  have ht' : t ≤ 2 * k + 1 := Nat.le_of_lt_succ (Finset.mem_range.mp ht)
  have h : 2 * j - s + (2 * k + 1 - t) ≠ s + t := by omega
  simp only [ite_eq_right h]

/-- Squaring the imaginary part removes the imaginary unit from the algebra. -/
lemma im_sq_eq_sub_conj (q : ℂ) :
    (q.im : ℂ) ^ 2 = (-1 / 4 : ℂ) * (q - conj q) ^ 2 := by
  apply Complex.ext
  · simp [pow_two, Complex.mul_re, Complex.mul_im]
    ring
  · simp [pow_two, Complex.mul_re, Complex.mul_im]

/-- The real part is the average of a number and its conjugate. -/
lemma re_eq_add_conj (q : ℂ) :
    (q.re : ℂ) = (1 / 2 : ℂ) * (q + conj q) := by
  apply Complex.ext
  · simp [Complex.mul_re]
    ring
  · simp [Complex.mul_im]

/-- A finite expansion of `Im(q)^(2j) Re(q)^m` in `q` and `conj q`. -/
theorem im_pow_mul_re_pow (q : ℂ) (j m : ℕ) :
    (q.im : ℂ) ^ (2 * j) * (q.re : ℂ) ^ m =
      ∑ s ∈ Finset.range (2 * j + 1), ∑ t ∈ Finset.range (m + 1),
        (invariantCoeff j m s t : ℂ) *
          q ^ (s + t) * conj q ^ (2 * j - s + (m - t)) := by
  rw [pow_mul, im_sq_eq_sub_conj, mul_pow, re_eq_add_conj, mul_pow,
    ← pow_mul, sub_pow, add_pow]
  simp only [Finset.mul_sum, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro s hs
  apply Finset.sum_congr rfl
  intro t ht
  have hsign : (-1 : ℂ) ^ (s + 2 * j) = (-1) ^ s := by
    simp [pow_add, pow_mul]
  rw [hsign]
  simp only [invariantCoeff]
  push_cast
  simp only [pow_add]
  ring

/-- The complex-monomial expansion of one invariant monomial. All sums are finite. -/
theorem invariant_monomial_expansion (z w : ℂ) (a b j m : ℕ) :
    ((conj z * w).im : ℂ) ^ (2 * j) * (Complex.normSq z : ℂ) ^ a *
        (Complex.normSq w : ℂ) ^ b * ((conj z * w).re : ℂ) ^ m =
      ∑ s ∈ Finset.range (2 * j + 1), ∑ t ∈ Finset.range (m + 1),
        (invariantCoeff j m s t : ℂ) *
          z ^ (a + (2 * j - s) + (m - t)) * conj z ^ (a + s + t) *
          w ^ (b + s + t) * conj w ^ (b + (2 * j - s) + (m - t)) := by
  calc
    _ = (Complex.normSq z : ℂ) ^ a * (Complex.normSq w : ℂ) ^ b *
        (((conj z * w).im : ℂ) ^ (2 * j) * ((conj z * w).re : ℂ) ^ m) := by ring
    _ = _ := by
      rw [im_pow_mul_re_pow]
      simp only [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro s hs
      apply Finset.sum_congr rfl
      intro t ht
      rw [Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_conj_mul_self]
      simp only [map_mul, starRingEnd_self_apply, mul_pow, pow_add]
      ring

private def invariantTerm (rate : ℝ) (a b j m s t : ℕ) (u : ℂ × ℂ) : ℂ :=
  (invariantCoeff j m s t : ℂ) *
    (u.1 ^ (a + (2 * j - s) + (m - t)) * conj u.1 ^ (a + s + t) *
      u.2 ^ (b + s + t) * conj u.2 ^ (b + (2 * j - s) + (m - t)) *
      (Real.exp (-(rate - 1) * Complex.normSq u.1 -
        (rate - 1) * Complex.normSq u.2) : ℂ))

private lemma invariant_damped_expansion (rate : ℝ) (a b j m : ℕ) (u : ℂ × ℂ) :
    ((invariantMonomial a b j m u *
      Real.exp (-(rate - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) : ℝ) : ℂ) =
      ∑ s ∈ Finset.range (2 * j + 1), ∑ t ∈ Finset.range (m + 1),
        invariantTerm rate a b j m s t u := by
  simp only [invariantMonomial, Complex.ofReal_mul, Complex.ofReal_pow]
  rw [invariant_monomial_expansion]
  simp only [Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro s hs
  apply Finset.sum_congr rfl
  intro t ht
  have he : -(rate - 1) * (Complex.normSq u.1 + Complex.normSq u.2) =
      -(rate - 1) * Complex.normSq u.1 - (rate - 1) * Complex.normSq u.2 := by ring
  rw [he]
  simp only [invariantTerm]
  ring

private lemma integrable_invariantTerm {rate : ℝ} (hrate : 0 < rate)
    (a b j m s t : ℕ) : Integrable (invariantTerm rate a b j m s t) (gaussC.prod gaussC) :=
  (integrable_monomial_damped_prod _ _ _ _ hrate hrate).const_mul _

/-- Invariant monomials are integrable after every positive Gaussian tilt. -/
theorem integrable_invariant_monomial_damped (a b j m : ℕ) {rate : ℝ} (hrate : 0 < rate) :
    Integrable (fun u : ℂ × ℂ => invariantMonomial a b j m u *
      Real.exp (-(rate - 1) * (Complex.normSq u.1 + Complex.normSq u.2)))
      (gaussC.prod gaussC) := by
  have hi : Integrable (fun u : ℂ × ℂ => ∑ s ∈ Finset.range (2 * j + 1),
      ∑ t ∈ Finset.range (m + 1), invariantTerm rate a b j m s t u) (gaussC.prod gaussC) :=
    integrable_finsetSum _ fun s _ =>
      integrable_finsetSum _ fun t _ => integrable_invariantTerm hrate a b j m s t
  have he := funext (invariant_damped_expansion rate a b j m)
  rw [← he] at hi
  have hi' := hi.re
  change Integrable (fun u : ℂ × ℂ => ((invariantMonomial a b j m u *
    Real.exp (-(rate - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) : ℝ) : ℂ).re)
    (gaussC.prod gaussC) at hi'
  simpa only [Complex.ofReal_re] using hi'

private lemma integral_invariantTerm (a b j m s t : ℕ) {rate : ℚ} (hrate : 0 < rate) :
    (∫ u, invariantTerm (rate : ℝ) a b j m s t u ∂gaussC.prod gaussC) =
      ((if 2 * j - s + (m - t) = s + t then
        invariantCoeff j m s t * ((a + s + t).factorial : ℚ) / rate ^ (a + s + t + 1) *
          ((b + s + t).factorial : ℚ) / rate ^ (b + s + t + 1)
      else 0 : ℚ) : ℂ) := by
  have hp : (0 : ℝ) < rate := by exact_mod_cast hrate
  simp only [invariantTerm]
  rw [integral_const_mul, integral_moment_damped_prod _ _ _ _ hp hp]
  by_cases h : 2 * j - s + (m - t) = s + t
  · have ha : a + (2 * j - s) + (m - t) = a + s + t := by omega
    have hb : b + (2 * j - s) + (m - t) = b + s + t := by omega
    simp only [ha, hb, ite_eq_left h]
    push_cast
    ring
  · have ha : a + (2 * j - s) + (m - t) ≠ a + s + t := by omega
    simp only [ite_eq_right ha, ite_eq_right h, zero_mul, mul_zero, Rat.cast_zero]

/-- **An exact finite formula for every damped invariant monomial.** -/
theorem integral_invariant_monomial_damped (a b j m : ℕ) {rate : ℚ} (hrate : 0 < rate) :
    (∫ u : ℂ × ℂ, invariantMonomial a b j m u *
      Real.exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2))
        ∂gaussC.prod gaussC) = (invariantMoment rate a b j m : ℝ) := by
  have hp : (0 : ℝ) < rate := by exact_mod_cast hrate
  apply Complex.ofReal_injective
  rw [← integral_complex_ofReal]
  simp_rw [invariant_damped_expansion]
  rw [integral_finsetSum _ fun s _ =>
    integrable_finsetSum _ fun t _ => integrable_invariantTerm hp a b j m s t]
  simp_rw [integral_finsetSum _ fun t _ => integrable_invariantTerm hp a b j m _ t,
    integral_invariantTerm a b j m _ _ hrate]
  simp only [invariantMoment]
  push_cast
  rfl

end

end Grothe.UpperChaos
