import Mathlib.Tactic

/-!
# A certified Newton step for a factored quartic

For `z ≥ A ≥ b ≥ 0`, Newton's method for `(z² - A²)(z² - b²)` stays above `A`
and contracts its error by at most `3 / 4`. Division by zero fixes the only possible
degenerate point, `z = A = b`. The contraction factor is optimal.

Agent-ID: codex-c8a4
Refs #377
-/

namespace Grothe.LowerAnalytic.QuarticNewton

noncomputable section

/-- The quartic with nonnegative outer root `A` and inner root `b`. -/
def polynomial (A b z : ℝ) : ℝ := (z ^ 2 - A ^ 2) * (z ^ 2 - b ^ 2)

/-- The derivative of `polynomial A b`. -/
def denominator (A b z : ℝ) : ℝ := 2 * z * (2 * z ^ 2 - A ^ 2 - b ^ 2)

/-- The Newton step, with the usual real division convention at zero. -/
def step (A b z : ℝ) : ℝ := z - polynomial A b z / denominator A b z

private lemma square_bounds {A b z : ℝ} (hb : 0 ≤ b) (hbA : b ≤ A) (hAz : A ≤ z) :
    0 ≤ A ∧ 0 ≤ z ∧ 0 ≤ z ^ 2 - A ^ 2 ∧ 0 ≤ z ^ 2 - b ^ 2 := by
  have hA : 0 ≤ A := hb.trans hbA
  have hz : 0 ≤ z := hA.trans hAz
  refine ⟨hA, hz, ?_, ?_⟩ <;> nlinarith

/-- The Newton denominator is nonnegative above the outer root. -/
theorem denominator_nonneg {A b z : ℝ} (hb : 0 ≤ b) (hbA : b ≤ A) (hAz : A ≤ z) :
    0 ≤ denominator A b z := by
  obtain ⟨_, hz, hza, hzb⟩ := square_bounds hb hbA hAz
  unfold denominator
  exact mul_nonneg (mul_nonneg (by norm_num) hz) (by linarith)

/-- A zero denominator above the outer root occurs only at a repeated root. -/
theorem denominator_eq_zero_iff {A b z : ℝ}
    (hb : 0 ≤ b) (hbA : b ≤ A) (hAz : A ≤ z) :
    denominator A b z = 0 ↔ z = A ∧ A = b := by
  obtain ⟨hA, hz, hza, hzb⟩ := square_bounds hb hbA hAz
  constructor
  · intro hd
    unfold denominator at hd
    rcases mul_eq_zero.mp hd with hd | hd
    · have hz0 : z = 0 := (mul_eq_zero.mp hd).resolve_left (by norm_num)
      constructor <;> linarith
    · have hza0 : z ^ 2 = A ^ 2 := by linarith
      have hzb0 : z ^ 2 = b ^ 2 := by linarith
      constructor <;> nlinarith
  · rintro ⟨rfl, rfl⟩
    unfold denominator
    ring

/-- Newton's step stays above the root and removes at least one quarter of the error. -/
theorem step_bounds {A b z : ℝ} (hb : 0 ≤ b) (hbA : b ≤ A) (hAz : A ≤ z) :
    A ≤ step A b z ∧ step A b z - A ≤ (3 / 4 : ℝ) * (z - A) := by
  obtain ⟨hA, hz, hza, hzb⟩ := square_bounds hb hbA hAz
  by_cases hd : denominator A b z = 0
  · obtain ⟨rfl, rfl⟩ := (denominator_eq_zero_iff hb hbA hAz).mp hd
    simp [step, polynomial, denominator]
  · have hdpos : 0 < denominator A b z :=
      lt_of_le_of_ne (denominator_nonneg hb hbA hAz) (Ne.symm hd)
    have hfirst : polynomial A b z ≤ denominator A b z * (z - A) := by
      have hfac : 0 ≤ (z - A) ^ 2 * (3 * z ^ 2 + 2 * A * z - b ^ 2) := by
        apply mul_nonneg (sq_nonneg _)
        nlinarith [mul_nonneg hA hz]
      dsimp [polynomial, denominator]
      nlinarith [hfac]
    have hsecond : denominator A b z * (z - A) ≤ 4 * polynomial A b z := by
      have hAb : 0 ≤ A ^ 2 - b ^ 2 := by nlinarith
      have hzA : 0 ≤ z - A := sub_nonneg.mpr hAz
      have hfac : 0 ≤ 2 * (z - A) *
          ((z + 2 * A) * (A ^ 2 - b ^ 2) + 2 * A * (z ^ 2 - A ^ 2)) := by
        positivity
      dsimp [polynomial, denominator]
      nlinarith [hfac]
    have hup : polynomial A b z / denominator A b z ≤ z - A := by
      apply (div_le_iff₀ hdpos).2
      simpa [mul_comm] using hfirst
    have hlo : (z - A) / 4 ≤ polynomial A b z / denominator A b z := by
      apply (le_div_iff₀ hdpos).2
      nlinarith
    dsimp [step]
    constructor <;> linarith

/-- The step also decreases its input. -/
theorem step_le {A b z : ℝ} (hb : 0 ≤ b) (hbA : b ≤ A) (hAz : A ≤ z) :
    step A b z ≤ z := by
  have h := (step_bounds hb hbA hAz).2
  linarith

/-- At the zero quartic, the contraction is exactly three quarters, including at zero. -/
theorem step_zero_zero (z : ℝ) : step 0 0 z = (3 / 4 : ℝ) * z := by
  by_cases hz : z = 0
  · simp [hz, step, polynomial, denominator]
  · unfold step polynomial denominator
    field_simp
    ring

/-- `3 / 4` is the least universal error factor for this Newton map. -/
theorem contraction_factor_iff (C : ℝ) :
    (∀ A b z : ℝ, 0 ≤ b → b ≤ A → A ≤ z →
      step A b z - A ≤ C * (z - A)) ↔ (3 / 4 : ℝ) ≤ C := by
  constructor
  · intro h
    simpa [step_zero_zero] using h 0 0 1 (by norm_num) (by norm_num) (by norm_num)
  · intro hC A b z hb hbA hAz
    exact (step_bounds hb hbA hAz).2.trans (mul_le_mul_of_nonneg_right hC (sub_nonneg.mpr hAz))

/-- Newton iterates remain a recurrence, rather than expanded rational expressions. -/
def iterate (A b z : ℝ) : ℕ → ℝ
  | 0 => z
  | n + 1 => step A b (iterate A b z n)

/-- Every iterate stays above the root, and the error has a geometric bound. -/
theorem iterate_bounds {A b z : ℝ} (hb : 0 ≤ b) (hbA : b ≤ A) (hAz : A ≤ z) (n : ℕ) :
    A ≤ iterate A b z n ∧
      iterate A b z n - A ≤ (3 / 4 : ℝ) ^ n * (z - A) := by
  induction n with
  | zero => simpa [iterate] using And.intro hAz (le_refl (z - A))
  | succ n ih =>
    have hs := step_bounds hb hbA ih.1
    refine ⟨hs.1, ?_⟩
    calc
      iterate A b z (n + 1) - A ≤ (3 / 4 : ℝ) * (iterate A b z n - A) := hs.2
      _ ≤ (3 / 4 : ℝ) * ((3 / 4 : ℝ) ^ n * (z - A)) :=
        mul_le_mul_of_nonneg_left ih.2 (by norm_num)
      _ = (3 / 4 : ℝ) ^ (n + 1) * (z - A) := by rw [pow_succ]; ring

/-- The iterates decrease monotonically. -/
theorem iterate_antitone {A b z : ℝ} (hb : 0 ≤ b) (hbA : b ≤ A) (hAz : A ≤ z) :
    Antitone (iterate A b z) := by
  apply antitone_nat_of_succ_le
  intro n
  exact step_le hb hbA (iterate_bounds hb hbA hAz n).1

end

end Grothe.LowerAnalytic.QuarticNewton
