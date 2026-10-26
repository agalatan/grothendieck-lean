import Grothe.Upper.Haagerup

/-!
# Decreasing differences of the Haagerup coefficients

The normalized coefficients tend to zero and have nonnegative decreasing first
differences. The latter property follows directly from their rational recurrence:
the difference is the coefficient times a positive decreasing rational factor.
-/

namespace Grothe.HaagerupConvex

noncomputable section

/-- The normalized Haagerup coefficient, viewed as a real number. -/
def r (k : ℕ) : ℝ := haagR k

/-- Its forward difference. -/
def delta (k : ℕ) : ℝ := r k - r (k + 1)

lemma r_nonneg (k : ℕ) : 0 ≤ r k := by
  unfold r
  exact_mod_cast (haagR_pos k).le

lemma r_succ_le (k : ℕ) : r (k + 1) ≤ r k := by
  unfold r
  rw [haagR]
  have hp : (0 : ℝ) < haagR k := by exact_mod_cast haagR_pos k
  have hn : (0 : ℝ) ≤ k := Nat.cast_nonneg k
  push_cast
  apply (div_le_iff₀ (by positivity : 0 < 4 * ((k : ℝ) + 1) * ((k : ℝ) + 2))).2
  nlinarith [mul_nonneg hp.le hn]

/-- The first difference as a rational multiple of the coefficient. -/
lemma delta_eq (k : ℕ) :
    delta k = r k * (2 * (k : ℝ) + 7 / 4) / (((k : ℝ) + 1) * ((k : ℝ) + 2)) := by
  unfold delta r
  rw [haagR]
  push_cast
  have h1 : (k : ℝ) + 1 ≠ 0 := by positivity
  have h2 : (k : ℝ) + 2 ≠ 0 := by positivity
  field_simp [h1, h2]
  ring

lemma delta_nonneg (k : ℕ) : 0 ≤ delta k := sub_nonneg.mpr (r_succ_le k)

private def ratio (k : ℕ) : ℝ :=
  (2 * (k : ℝ) + 7 / 4) / (((k : ℝ) + 1) * ((k : ℝ) + 2))

private lemma ratio_nonneg (k : ℕ) : 0 ≤ ratio k := by
  unfold ratio
  positivity

private lemma ratio_succ_le (k : ℕ) : ratio (k + 1) ≤ ratio k := by
  unfold ratio
  push_cast
  rw [div_le_div_iff₀ (by positivity) (by positivity)]
  have hk : (0 : ℝ) ≤ k := Nat.cast_nonneg k
  nlinarith [sq_nonneg (k : ℝ)]

/-- Discrete convexity: the nonnegative forward differences decrease. -/
lemma delta_succ_le (k : ℕ) : delta (k + 1) ≤ delta k := by
  rw [delta_eq, delta_eq]
  simpa only [ratio, mul_div_assoc] using
    mul_le_mul (r_succ_le k) (ratio_succ_le k) (ratio_nonneg _) (r_nonneg _)

lemma summable_r : Summable r := by
  have h := summable_haagCoeff.mul_left (4 / Real.pi)
  apply h.congr
  intro k
  rw [abs_of_nonneg (haagCoeff_nonneg k), haagCoeff]
  unfold r
  field_simp [Real.pi_ne_zero]

lemma tendsto_r_zero : Filter.Tendsto r Filter.atTop (nhds 0) :=
  summable_r.tendsto_atTop_zero

end
end Grothe.HaagerupConvex
