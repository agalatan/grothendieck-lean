import Grothe.UpperChaos.ShiftedDampedMoments

/-!
# A recurrence for shifted damped Wick moments

Pure finite binomial algebra. The positive rate retains the tilted Gaussian
mass; no new integration-by-parts premise or numerical assertion is needed.
Agent-ID: codex-37fb.
-/

open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

private def shiftedWickTerm (rate : ℝ) (μ : ℂ) (p q k : ℕ) : ℂ :=
  (p.choose k : ℂ) * (q.choose k : ℂ) * μ ^ (p - k) * conj μ ^ (q - k) *
    (k.factorial : ℂ) / (rate : ℂ) ^ (k + 1)

/-- One may sum through the full antiholomorphic degree because the other binomial coefficient vanishes. -/
theorem shiftedDampedMoment_sum_range_right (rate : ℝ) (μ : ℂ) (p q : ℕ) :
    shiftedDampedMoment rate μ p q =
      ∑ k ∈ Finset.range (q + 1),
        (p.choose k : ℂ) * (q.choose k : ℂ) * μ ^ (p - k) * conj μ ^ (q - k) *
          (k.factorial : ℂ) / (rate : ℂ) ^ (k + 1) := by
  change (∑ k ∈ Finset.range (min p q + 1), shiftedWickTerm rate μ p q k) =
    ∑ k ∈ Finset.range (q + 1), shiftedWickTerm rate μ p q k
  apply Finset.sum_subset
  · exact Finset.range_mono (Nat.add_le_add_right (Nat.min_le_right p q) 1)
  · intro k hkq hkmin
    have hp : p < k := by
      have hq := Finset.mem_range.mp hkq
      have hm : ¬k < min p q + 1 := by simpa only [Finset.mem_range] using hkmin
      omega
    simp only [shiftedWickTerm, Nat.choose_eq_zero_of_lt hp, Nat.cast_zero,
      zero_mul, zero_div]

private theorem shifted_choose_power (p k : ℕ) (μ : ℂ) :
    (p.choose (k + 1) : ℂ) * μ ^ (p - k) =
      μ * (p.choose (k + 1) : ℂ) * μ ^ (p - (k + 1)) := by
  by_cases hkp : k < p
  · have he : p - k = (p - (k + 1)) + 1 := by omega
    rw [he, pow_succ]
    ring
  · have hz : p.choose (k + 1) = 0 := Nat.choose_eq_zero_of_lt (by omega)
    simp only [hz, Nat.cast_zero, zero_mul, mul_zero]

private theorem shiftedWick_numerator_step (μ : ℂ) (p q k : ℕ) :
    ((p + 1).choose (k + 1) : ℂ) * ((q + 1).choose (k + 1) : ℂ) *
        μ ^ (p - k) * conj μ ^ (q - k) * ((k + 1).factorial : ℂ) =
      μ * (p.choose (k + 1) : ℂ) * ((q + 1).choose (k + 1) : ℂ) *
        μ ^ (p - (k + 1)) * conj μ ^ (q - k) * ((k + 1).factorial : ℂ) +
      (q + 1 : ℂ) * (p.choose k : ℂ) * (q.choose k : ℂ) *
        μ ^ (p - k) * conj μ ^ (q - k) * (k.factorial : ℂ) := by
  have hpascal : ((p + 1).choose (k + 1) : ℂ) =
      (p.choose k : ℂ) + (p.choose (k + 1) : ℂ) := by
    exact_mod_cast Nat.choose_succ_succ p k
  have hchoose : ((q + 1).choose (k + 1) : ℂ) * (k + 1 : ℂ) =
      (q + 1 : ℂ) * (q.choose k : ℂ) := by
    exact_mod_cast (Nat.add_one_mul_choose_eq q k).symm
  have hfact : ((k + 1).factorial : ℂ) = (k + 1 : ℂ) * (k.factorial : ℂ) := by
    exact_mod_cast Nat.factorial_succ k
  calc
    _ = ((p.choose (k + 1) : ℂ) * μ ^ (p - k)) *
        ((q + 1).choose (k + 1) : ℂ) * conj μ ^ (q - k) *
        ((k + 1 : ℂ) * (k.factorial : ℂ)) +
      (p.choose k : ℂ) * (((q + 1).choose (k + 1) : ℂ) * (k + 1 : ℂ)) *
        μ ^ (p - k) * conj μ ^ (q - k) * (k.factorial : ℂ) := by
      rw [hpascal, hfact]
      ring
    _ = _ := by
      rw [shifted_choose_power, hchoose, hfact]
      ring

private theorem shiftedWickTerm_succ (rate : ℝ) (μ : ℂ) (p q k : ℕ)
    (hrate : 0 < rate) :
    shiftedWickTerm rate μ (p + 1) (q + 1) (k + 1) =
      μ * shiftedWickTerm rate μ p (q + 1) (k + 1) +
        ((q + 1 : ℂ) / (rate : ℂ)) * shiftedWickTerm rate μ p q k := by
  have hr : (rate : ℂ) ≠ 0 := by exact_mod_cast hrate.ne'
  simp only [shiftedWickTerm, Nat.succ_sub_succ]
  rw [shiftedWick_numerator_step, add_div]
  simp only [pow_succ]
  field_simp [hr]

private theorem shiftedWickTerm_zero (rate : ℝ) (μ : ℂ) (p q : ℕ) :
    shiftedWickTerm rate μ (p + 1) q 0 = μ * shiftedWickTerm rate μ p q 0 := by
  simp only [shiftedWickTerm, Nat.choose_zero_right, Nat.cast_one, Nat.sub_zero,
    pow_zero, Nat.factorial_zero, one_mul, mul_one, pow_succ]
  ring

/-- The shifted Wick recurrence, including the natural zero factor when `q=0`. -/
theorem shiftedDampedMoment_succ_left (rate : ℝ) (μ : ℂ) (p q : ℕ)
    (hrate : 0 < rate) :
    shiftedDampedMoment rate μ (p + 1) q =
      μ * shiftedDampedMoment rate μ p q +
        ((q : ℂ) / (rate : ℂ)) * shiftedDampedMoment rate μ p (q - 1) := by
  cases q with
  | zero =>
      rw [shiftedDampedMoment_sum_range_right rate μ (p + 1) 0,
        shiftedDampedMoment_sum_range_right rate μ p 0]
      simp only [Nat.cast_zero, zero_div, zero_mul, add_zero]
      change (∑ k ∈ Finset.range (0 + 1), shiftedWickTerm rate μ (p + 1) 0 k) =
        μ * (∑ k ∈ Finset.range (0 + 1), shiftedWickTerm rate μ p 0 k)
      simpa only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add] using
        shiftedWickTerm_zero rate μ p 0
  | succ q =>
      rw [shiftedDampedMoment_sum_range_right, shiftedDampedMoment_sum_range_right,
        shiftedDampedMoment_sum_range_right]
      simp only [Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one]
      change (∑ k ∈ Finset.range (q + 1 + 1), shiftedWickTerm rate μ (p + 1) (q + 1) k) =
        μ * (∑ k ∈ Finset.range (q + 1 + 1), shiftedWickTerm rate μ p (q + 1) k) +
          ((q + 1 : ℂ) / (rate : ℂ)) *
            (∑ k ∈ Finset.range (q + 1), shiftedWickTerm rate μ p q k)
      rw [Finset.sum_range_succ' (fun k => shiftedWickTerm rate μ (p + 1) (q + 1) k),
        Finset.sum_range_succ' (fun k => shiftedWickTerm rate μ p (q + 1) k)]
      simp_rw [shiftedWickTerm_succ rate μ p q _ hrate]
      rw [shiftedWickTerm_zero]
      simp only [Finset.sum_add_distrib, ← Finset.mul_sum]
      ring

/-- Completion of squares cancels the leading affine term for every mixed moment. -/
theorem shiftedDampedMoment_affine_step (α a t : ℝ) (z : ℂ) (p q : ℕ)
    (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    z * shiftedDampedMoment β μ p q +
      (a : ℂ) * shiftedDampedMoment β μ (p + 1) q =
        ((α : ℂ) * z / (β : ℂ)) * shiftedDampedMoment β μ p q +
          ((a : ℂ) * (q : ℂ) / (β : ℂ)) * shiftedDampedMoment β μ p (q - 1) := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  change z * shiftedDampedMoment β μ p q +
    (a : ℂ) * shiftedDampedMoment β μ (p + 1) q =
      ((α : ℂ) * z / (β : ℂ)) * shiftedDampedMoment β μ p q +
        ((a : ℂ) * (q : ℂ) / (β : ℂ)) * shiftedDampedMoment β μ p (q - 1)
  have hβ : 0 < β := add_pos_of_pos_of_nonneg hα (mul_nonneg (sq_nonneg a) ht.le)
  have hβC : (β : ℂ) ≠ 0 := by exact_mod_cast hβ.ne'
  have hlinear : z + (a : ℂ) * μ = (α : ℂ) * z / (β : ℂ) := by
    dsimp only [μ]
    push_cast
    field_simp [hβC]
    dsimp only [β]
    push_cast
    ring
  rw [shiftedDampedMoment_succ_left β μ p q hβ]
  calc
    _ = (z + (a : ℂ) * μ) * shiftedDampedMoment β μ p q +
        ((a : ℂ) * (q : ℂ) / (β : ℂ)) * shiftedDampedMoment β μ p (q - 1) := by ring
    _ = _ := by rw [hlinear]

end
end Grothe.UpperChaos
