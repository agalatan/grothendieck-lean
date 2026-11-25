import Grothe.UpperSelector.Phase
import Mathlib.Analysis.Real.Pi.Bounds

/-!
# Integer lower bounds for the scalar phase masses

All outer weights are rounded down twice. The first integer recurrence keeps extra
precision and the second division supplies the smaller scale used in the mixture.
The inequality uses the proved lower bound on π and the exact scalar phase recurrence.
-/

set_option warningAsError true

namespace Haagerup.AngularSelector

/-- The lower approximation at the working scale `S`. -/
def phaseMassCount (S : ℕ) : ℕ → ℕ
  | 0 => (314159265358979323846 * S) / (4 * 10 ^ 20)
  | k + 1 => phaseMassCount S k * (2 * k + 1) ^ 2 / (4 * (k + 1) * (k + 2))

theorem phaseMassCount_le (S k : ℕ) : (phaseMassCount S k : ℝ) ≤ S * haagCoeff k := by
  induction k with
  | zero =>
    have h := Nat.div_mul_le_self (314159265358979323846 * S) (4 * 10 ^ 20)
    have h' : ((314159265358979323846 * S / (4 * 10 ^ 20) : ℕ) : ℝ) * (4 * 10 ^ 20) ≤
        314159265358979323846 * (S : ℝ) := by exact_mod_cast h
    have hpi : (314159265358979323846 : ℝ) / 10 ^ 20 ≤ Real.pi := by
      have := Real.pi_gt_d20
      linarith
    change ((314159265358979323846 * S / (4 * 10 ^ 20) : ℕ) : ℝ) ≤ _
    simp only [haagCoeff, haagR, Rat.cast_one, mul_one]
    calc
      _ ≤ (S : ℝ) * (314159265358979323846 / 10 ^ 20 / 4) := by linarith
      _ ≤ _ := by gcongr
  | succ k ih =>
    let a := (2 * k + 1) ^ 2
    let b := 4 * (k + 1) * (k + 2)
    have hb : (0 : ℝ) < b := by dsimp [b]; positivity
    have hle : ((phaseMassCount S k * a / b : ℕ) : ℝ) * (b : ℝ) ≤
        (phaseMassCount S k : ℝ) * (a : ℝ) := by exact_mod_cast Nat.div_mul_le_self _ _
    have hr : haagCoeff (k + 1) = haagCoeff k * (a : ℝ) / (b : ℝ) := by
      simp only [haagCoeff, haagR, Rat.cast_mul, Rat.cast_div, Rat.cast_natCast, a, b]
      ring
    change ((phaseMassCount S k * a / b : ℕ) : ℝ) ≤ _
    rw [hr, mul_div_assoc', le_div_iff₀ hb, ← mul_assoc]
    exact hle.trans (mul_le_mul_of_nonneg_right ih (Nat.cast_nonneg _))

/-- The integer numerator retained at scale `B`, using internal scale `B * H`. -/
def phaseMassWeight (B H k : ℕ) := phaseMassCount (B * H) k / H

theorem phaseMassWeight_le {B H : ℕ} (hB : 0 < B) (hH : 0 < H) (k : ℕ) :
    (phaseMassWeight B H k : ℝ) / B ≤ haagCoeff k := by
  have hle : (phaseMassWeight B H k : ℝ) * (H : ℝ) ≤ phaseMassCount (B * H) k := by
    exact_mod_cast Nat.div_mul_le_self (phaseMassCount (B * H) k) H
  have h := hle.trans (phaseMassCount_le (B * H) k)
  push_cast at h
  rw [div_le_iff₀ (by exact_mod_cast hB)]
  exact le_of_mul_le_mul_right (by nlinarith only [h] :
    (phaseMassWeight B H k : ℝ) * H ≤ haagCoeff k * B * H) (by exact_mod_cast hH)

end Haagerup.AngularSelector
