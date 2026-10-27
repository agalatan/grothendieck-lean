import Grothe.Upper.Haagerup

/-!
# The phase spectrum has infinite first degree moment

The exact recurrence gives `r_k ≥ 1/(4*k*(k+1))` for `k ≥ 1`.
Consequently the phase spectrum cannot have a summable degree-weighted tail.
This is the discrete obstruction behind the singular L² tangent of Gaussian
phase rounding; it does not give an obstruction to weighted phase errors.
-/

namespace Grothe.HaagerupPhaseGeometry

open Grothe Finset

noncomputable section

/-- An exact increasing lower certificate complementary to the decreasing
upper-tail certificate `haagG`. It holds at every index, not a checked prefix. -/
theorem scaled_lower (n : ℕ) :
    1 ≤ 4 * ((n : ℝ)+1) * (n+2) * (haagR (n+1) : ℝ) := by
  induction n with
  | zero => norm_num [haagR]
  | succ n ih =>
    have hr : 0 ≤ (haagR (n+1) : ℝ) := by exact_mod_cast (haagR_pos (n+1)).le
    have he : 4 * ((n : ℝ)+2) * (n+3) * (haagR (n+2) : ℝ) =
        4 * ((n : ℝ)+1) * (n+2) * (haagR (n+1) : ℝ) + (haagR (n+1) : ℝ) := by
      rw [show n+2 = (n+1)+1 by omega, haagR]
      push_cast
      field_simp
      ring
    push_cast
    nlinarith

/-- The lower bound needed for the harmonic divergence of the degree moment. -/
theorem harmonic_lower (n : ℕ) :
    Real.pi/16 * (1/((n : ℝ)+2)) ≤ (2*(n+1)+1) * haagCoeff (n+1) := by
  have h := scaled_lower n
  have hr : 0 ≤ (haagR (n+1) : ℝ) := by exact_mod_cast (haagR_pos (n+1)).le
  have h1 : 1/(4*((n : ℝ)+2)) ≤ ((n : ℝ)+1)*(haagR (n+1) : ℝ) := by
    apply (div_le_iff₀ (by positivity : (0 : ℝ) < 4*(n+2))).2
    nlinarith
  have h2 := mul_le_mul_of_nonneg_left h1 (show 0 ≤ Real.pi/4 by positivity)
  unfold haagCoeff
  have h3 : (Real.pi/4)*(1/(4*((n : ℝ)+2))) = Real.pi/16*(1/((n : ℝ)+2)) := by
    simp only [div_eq_mul_inv, mul_inv_rev]
    ring
  rw [h3] at h2
  nlinarith [mul_nonneg (show 0 ≤ Real.pi/4 by positivity) hr]

/-- A degree-weighted phase-spectrum error budget is infinite. In particular
it cannot justify a uniform unweighted L² derivative for coordinate motion. -/
theorem degree_moment_not_summable :
    ¬ Summable (fun k : ℕ => (2*(k : ℝ)+1)*haagCoeff k) := by
  intro hs
  have ht : Summable (fun n : ℕ => (2*((n+1 : ℕ) : ℝ)+1)*haagCoeff (n+1)) :=
    (summable_nat_add_iff 1).mpr hs
  have hb : Summable (fun n : ℕ => Real.pi/16*(1/((n : ℝ)+2))) := by
    apply Summable.of_nonneg_of_le (fun n => by positivity) (fun n => ?_) ht
    simpa using harmonic_lower n
  have hh := hb.mul_left (16/Real.pi)
  have hi : Summable (fun n : ℕ => 1/((n : ℝ)+2)) := by
    convert hh using 1
    funext n
    field_simp
  have hall : Summable (fun n : ℕ => 1/(n : ℝ)) := by
    apply (summable_nat_add_iff 2).mp
    simpa only [Nat.cast_add, Nat.cast_ofNat] using hi
  exact Real.not_summable_one_div_natCast hall

end
end Grothe.HaagerupPhaseGeometry
