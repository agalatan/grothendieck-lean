import Mathlib.Analysis.SpecialFunctions.Gamma.Basic

/-! # Polynomial-exponential tail integrals

The gamma integral and translation of Lebesgue measure give an exact finite
formula for a monomial against a positive-rate exponential on any half-line.
This is an analytical identity; it does not assert a numerical phase bound.

Agent-ID: codex-239c -/

namespace Grothe.UpperChaos.ExponentialTail

open scoped Nat
open MeasureTheory Set Real Finset

noncomputable section

/-- Integer Gamma moments at a positive exponential rate. -/
lemma exp_moment_zero (k : ℕ) {a : ℝ} (ha : 0 < a) :
    (∫ x : ℝ in Ioi 0, x ^ k * exp (-(a * x))) = (k.factorial : ℝ) / a ^ (k + 1) := by
  have hk : (0 : ℝ) < (k : ℝ) + 1 := by positivity
  have h := Real.integral_rpow_mul_exp_neg_mul_Ioi hk ha
  simp_rw [add_sub_cancel_right, rpow_natCast, Gamma_nat_eq_factorial, div_eq_mul_inv,
    one_mul, mul_comm, inv_rpow ha.le, ← rpow_natCast] at h
  norm_cast at h

lemma translate_Ioi (f : ℝ → ℝ) (L : ℝ) :
    (∫ x : ℝ in Ioi L, f x) = ∫ x : ℝ in Ioi 0, f (x + L) := by
  have h := (measurePreserving_add_right volume L).setIntegral_image_emb
    (Homeomorph.addRight L).isClosedEmbedding.measurableEmbedding f (Ioi (0 : ℝ))
  simpa only [Set.image_add_const_Ioi, zero_add] using h

/-- An exact finite expression for every positive-rate polynomial exponential tail. -/
theorem exp_moment_tail (n : ℕ) (L : ℝ) {a : ℝ} (ha : 0 < a) :
    (∫ s : ℝ in Ioi L, s ^ n * exp (-(a * s))) =
      exp (-(a * L)) * ∑ k ∈ range (n + 1),
        ((n.choose k : ℝ) * L ^ (n - k)) * ((k.factorial : ℝ) / a ^ (k + 1)) := by
  have hint (k : ℕ) : IntegrableOn (fun x : ℝ => x ^ k * exp (-(a * x))) (Ioi 0) :=
    .of_integral_ne_zero (by rw [exp_moment_zero k ha]; positivity)
  have hexp (x : ℝ) : exp (-(a * (x + L))) = exp (-(a * L)) * exp (-(a * x)) := by
    rw [← exp_add]
    congr 1
    ring
  have hexpand (x : ℝ) :
      (x + L) ^ n * exp (-(a * (x + L))) =
        exp (-(a * L)) * ∑ k ∈ range (n + 1),
          ((n.choose k : ℝ) * L ^ (n - k)) * (x ^ k * exp (-(a * x))) := by
    rw [add_pow, hexp, sum_mul, mul_sum]
    apply sum_congr rfl
    intro k hk
    ring
  rw [translate_Ioi]
  calc
    _ = ∫ x : ℝ in Ioi 0, exp (-(a * L)) * ∑ k ∈ range (n + 1),
        ((n.choose k : ℝ) * L ^ (n - k)) * (x ^ k * exp (-(a * x))) := by
          apply setIntegral_congr_fun measurableSet_Ioi
          intro x hx
          exact hexpand x
    _ = exp (-(a * L)) * ∑ k ∈ range (n + 1),
        ((n.choose k : ℝ) * L ^ (n - k)) * ((k.factorial : ℝ) / a ^ (k + 1)) := by
          rw [integral_const_mul, integral_finsetSum _ (fun k hk =>
            (hint k).const_mul ((n.choose k : ℝ) * L ^ (n - k)))]
          simp_rw [integral_const_mul, exp_moment_zero _ ha]

end
end Grothe.UpperChaos.ExponentialTail
