import Grothe.UpperChaos.DampedMoments
import Mathlib.Data.Nat.Choose.Sum
import Grothe.UpperChaos.DiagonalSum

/-!
# Shifted damped complex Gaussian moments

Every mixed polynomial moment of `z + μ` after a positive radial Gaussian tilt
has a finite Wick formula. The Gaussian is not renormalized after damping:
the zeroth moment is `1 / rate`. All positive rates are allowed, including rates
below one for which the extra exponential itself need not be bounded.

Agent-ID: codex-37fb
-/

open MeasureTheory ProbabilityTheory Real Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- The two binomial coefficients and the powers of the deterministic complex shift. -/
def shiftedDampedCoeff (μ : ℂ) (p q a b : ℕ) : ℂ :=
  (p.choose a : ℂ) * (q.choose b : ℂ) * μ ^ (p - a) * conj μ ^ (q - b)

/-- The finite shifted Gaussian moment evaluator; its mass is `rate⁻¹`. -/
def shiftedDampedMoment (rate : ℝ) (μ : ℂ) (p q : ℕ) : ℂ :=
  ∑ k ∈ Finset.range (min p q + 1),
    (p.choose k : ℂ) * (q.choose k : ℂ) * μ ^ (p - k) * conj μ ^ (q - k) *
      (k.factorial : ℂ) / (rate : ℂ) ^ (k + 1)

private def shiftedDampedTerm (rate : ℝ) (μ : ℂ) (p q a b : ℕ) (z : ℂ) : ℂ :=
  shiftedDampedCoeff μ p q a b *
    (z ^ a * conj z ^ b * (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ))

/-- The finite pointwise binomial expansion before the Gaussian moment is taken. -/
theorem shifted_damped_expansion (rate : ℝ) (μ : ℂ) (p q : ℕ) (z : ℂ) :
    (z + μ) ^ p * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) =
    ∑ a ∈ Finset.range (p + 1), ∑ b ∈ Finset.range (q + 1),
      shiftedDampedCoeff μ p q a b *
        (z ^ a * conj z ^ b * (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) := by
  rw [map_add, add_pow z μ p, add_pow (conj z) (conj μ) q]
  simp only [Finset.sum_mul, Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro a ha
  apply Finset.sum_congr rfl
  intro b hb
  unfold shiftedDampedCoeff
  ring

private theorem integrable_shiftedDampedTerm (μ : ℂ) (p q a b : ℕ)
    {rate : ℝ} (hrate : 0 < rate) :
    Integrable (shiftedDampedTerm rate μ p q a b) gaussC :=
  (integrable_monomial_damped a b hrate).const_mul _

/-- Shifted mixed monomials remain integrable after every positive Gaussian tilt. -/
theorem integrable_shifted_monomial_damped (p q : ℕ) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    Integrable (fun z : ℂ => (z + μ) ^ p * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) gaussC := by
  have hi : Integrable (fun z : ℂ => ∑ a ∈ Finset.range (p + 1),
      ∑ b ∈ Finset.range (q + 1), shiftedDampedTerm rate μ p q a b z) gaussC :=
    integrable_finsetSum _ fun a _ =>
      integrable_finsetSum _ fun b _ => integrable_shiftedDampedTerm μ p q a b hrate
  have he : (fun z : ℂ => (z + μ) ^ p * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) =
      fun z => ∑ a ∈ Finset.range (p + 1), ∑ b ∈ Finset.range (q + 1),
        shiftedDampedTerm rate μ p q a b z := by
    funext z
    exact shifted_damped_expansion rate μ p q z
  rw [← he] at hi
  exact hi

private theorem integral_shiftedDampedTerm (μ : ℂ) (p q a b : ℕ)
    {rate : ℝ} (hrate : 0 < rate) :
    (∫ z, shiftedDampedTerm rate μ p q a b z ∂gaussC) =
      if a = b then shiftedDampedCoeff μ p q a b *
        (a.factorial : ℂ) / (rate : ℂ) ^ (a + 1) else 0 := by
  simp only [shiftedDampedTerm]
  rw [integral_const_mul, integral_moment_damped a b hrate]
  by_cases hab : a = b
  · simp only [hab, ite_true]
    ring
  · simp only [hab, ite_false, mul_zero]

/-- The double binomial sum retains only equal holomorphic and antiholomorphic powers. -/
theorem integral_shifted_moment_damped_double (p q : ℕ) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    (∫ z, (z + μ) ^ p * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
      ∑ a ∈ Finset.range (p + 1), ∑ b ∈ Finset.range (q + 1),
        if a = b then shiftedDampedCoeff μ p q a b *
          (a.factorial : ℂ) / (rate : ℂ) ^ (a + 1) else 0 := by
  have he : (fun z : ℂ => (z + μ) ^ p * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) =
      fun z => ∑ a ∈ Finset.range (p + 1), ∑ b ∈ Finset.range (q + 1),
        shiftedDampedTerm rate μ p q a b z := by
    funext z
    exact shifted_damped_expansion rate μ p q z
  rw [he]
  rw [integral_finsetSum _ fun a _ =>
    integrable_finsetSum _ fun b _ => integrable_shiftedDampedTerm μ p q a b hrate]
  simp_rw [integral_finsetSum _ fun b _ => integrable_shiftedDampedTerm μ p q _ b hrate,
    integral_shiftedDampedTerm μ p q _ _ hrate]

/-- Exact finite Wick formula for an arbitrary complex shift and positive damping rate. -/
theorem integral_shifted_moment_damped (p q : ℕ) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    (∫ z, (z + μ) ^ p * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
      shiftedDampedMoment rate μ p q := by
  rw [integral_shifted_moment_damped_double p q μ hrate]
  simpa only [shiftedDampedMoment, shiftedDampedCoeff] using
    (sum_diagonal_range p q (fun a b => shiftedDampedCoeff μ p q a b *
      (a.factorial : ℂ) / (rate : ℂ) ^ (a + 1)))

/-- The damping keeps its unnormalized Gaussian mass, independently of the shift. -/
theorem shiftedDampedMoment_zero_zero (rate : ℝ) (μ : ℂ) :
    shiftedDampedMoment rate μ 0 0 = (rate : ℂ)⁻¹ := by
  simp [shiftedDampedMoment]

end
end Grothe.UpperChaos
