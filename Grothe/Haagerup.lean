import Mathlib

/-!
# Haagerup's coefficients and the corrected Wallis estimate

Haagerup's phase-correlation function has the expansion
`𝔥(z) = ∑ₙ hₙ z |z|^{2n}` with
`hₙ = π/(4(n+1)) · binom(2n,n)² / 16ⁿ`.

This file proves the elementary bound

  `hₙ < 1 / (4 (n + 1/4) (n + 1))`,

via the auxiliary sequence `bₙ = π (n + 1/4) pₙ²`, `pₙ = binom(2n,n)/4ⁿ`, which is strictly
increasing with limit `1`.  The limit is obtained from Mathlib's Wallis product.
-/

namespace Grothe

open Real Filter Topology

noncomputable section

/-- `pc n = binom(2n, n) / 4^n`. -/
def pc (n : ℕ) : ℝ := (Nat.centralBinom n : ℝ) / 4 ^ n

/-- Haagerup's coefficients `h n = π/(4(n+1)) · binom(2n,n)²/16^n`. -/
def h (n : ℕ) : ℝ := Real.pi / (4 * (n + 1)) * (Nat.centralBinom n : ℝ) ^ 2 / 16 ^ n

lemma pc_pos (n : ℕ) : 0 < pc n := by
  unfold pc
  have := Nat.centralBinom_pos n
  positivity

lemma h_eq (n : ℕ) : h n = Real.pi / (4 * (n + 1)) * pc n ^ 2 := by
  unfold h pc
  have : (16 : ℝ) ^ n = (4 ^ n) ^ 2 := by rw [← pow_mul, mul_comm, pow_mul]; norm_num
  rw [this, div_pow]
  field_simp

lemma h_pos (n : ℕ) : 0 < h n := by
  rw [h_eq]; have := pc_pos n; positivity

lemma h_nonneg (n : ℕ) : 0 ≤ h n := (h_pos n).le

lemma pc_succ (n : ℕ) : pc (n + 1) = pc n * ((2 * n + 1) / (2 * n + 2)) := by
  unfold pc
  have key := Nat.succ_mul_centralBinom_succ n
  have hcast : ((n + 1 : ℕ) : ℝ) * (Nat.centralBinom (n + 1) : ℝ) =
      2 * (2 * n + 1) * (Nat.centralBinom n : ℝ) := by exact_mod_cast key
  have hn : ((n : ℝ) + 1) ≠ 0 := by positivity
  rw [pow_succ]
  field_simp
  push_cast at hcast
  nlinarith [hcast]

/-- `b n = π (n + 1/4) pc n ^ 2`; it is strictly increasing with limit `1`, hence `b n < 1`. -/
def b (n : ℕ) : ℝ := Real.pi * (n + 1 / 4) * pc n ^ 2

lemma b_succ_gt (n : ℕ) : b n < b (n + 1) := by
  unfold b
  rw [pc_succ, mul_pow]
  have hp := pc_pos n
  have hpi := Real.pi_pos
  have hpos : 0 < Real.pi * pc n ^ 2 := by positivity
  -- reduce to `(4n+5)(2n+1)^2 > (4n+1)(2n+2)^2`, whose difference is exactly `1`.
  have h2 : (0 : ℝ) < 2 * n + 2 := by positivity
  rw [div_pow]
  rw [show Real.pi * ((n : ℝ) + 1 / 4) * pc n ^ 2 = (Real.pi * pc n ^ 2) * (n + 1 / 4) by ring,
    show Real.pi * (((n + 1 : ℕ) : ℝ) + 1 / 4) * (pc n ^ 2 * ((2 * n + 1) ^ 2 / (2 * n + 2) ^ 2))
      = (Real.pi * pc n ^ 2) * ((((n + 1 : ℕ) : ℝ) + 1 / 4) * ((2 * n + 1) ^ 2 / (2 * n + 2) ^ 2)) by ring]
  apply mul_lt_mul_of_pos_left _ hpos
  push_cast
  rw [mul_div_assoc', lt_div_iff₀ (by positivity)]
  nlinarith

lemma b_strictMono : StrictMono b := strictMono_nat_of_lt_succ b_succ_gt

/-- `pc n ^ 2 = 1 / ((2n+1) W n)` where `W` is Mathlib's Wallis product. -/
lemma pc_sq_eq (n : ℕ) : pc n ^ 2 = 1 / ((2 * n + 1) * Real.Wallis.W n) := by
  induction n with
  | zero =>
    simp [pc, Real.Wallis.W]
  | succ n ih =>
    rw [pc_succ, mul_pow, ih, Real.Wallis.W_succ]
    have := Real.Wallis.W_pos n
    push_cast
    field_simp
    ring

lemma b_eq (n : ℕ) : b n = Real.pi * (n + 1 / 4) / ((2 * n + 1) * Real.Wallis.W n) := by
  rw [b, pc_sq_eq]; ring

lemma tendsto_b : Tendsto b atTop (𝓝 1) := by
  have hW := Real.Wallis.tendsto_W_nhds_pi_div_two
  -- b n = (π/2) / W n * ((2n + 1/2)/(2n+1)), and (2n+1/2)/(2n+1) = 1 - (1/2)/(2n+1) → 1.
  have h1 : Tendsto (fun n : ℕ => (Real.pi / 2) / Real.Wallis.W n) atTop (𝓝 ((Real.pi / 2) / (Real.pi / 2))) :=
    tendsto_const_nhds.div hW (ne_of_gt Real.pi_div_two_pos)
  have h2 : Tendsto (fun n : ℕ => (1 : ℝ) - (1 / 2) / (2 * (n : ℝ) + 1)) atTop (𝓝 (1 - 0)) := by
    apply tendsto_const_nhds.sub
    apply Tendsto.div_atTop tendsto_const_nhds
    apply Filter.tendsto_atTop_add_const_right
    exact Tendsto.const_mul_atTop (by norm_num) tendsto_natCast_atTop_atTop
  have h3 := h1.mul h2
  rw [div_self (ne_of_gt Real.pi_div_two_pos), sub_zero, one_mul] at h3
  refine h3.congr fun n => ?_
  rw [b_eq]
  have := Real.Wallis.W_pos n
  have h4 : (2 * (n : ℝ) + 1) ≠ 0 := by positivity
  field_simp
  ring

lemma b_le_one (n : ℕ) : b n ≤ 1 := b_strictMono.monotone.ge_of_tendsto tendsto_b n

lemma b_lt_one (n : ℕ) : b n < 1 := lt_of_lt_of_le (b_succ_gt n) (b_le_one (n + 1))

/-- The corrected Wallis estimate:
`h n < 1 / (4 (n + 1/4) (n + 1))`. -/
theorem h_lt (n : ℕ) : h n < 1 / (4 * (n + 1 / 4) * (n + 1)) := by
  have hb := b_lt_one n
  unfold b at hb
  rw [h_eq]
  have hq : (0 : ℝ) < n + 1 / 4 := by positivity
  have hn : (0 : ℝ) < n + 1 := by positivity
  rw [div_mul_eq_mul_div, div_lt_div_iff₀ (by positivity) (by positivity)]
  nlinarith

/-- Consequence: `h n ≤ 1 / (4 n (n+1))` for `n ≥ 1`. -/
theorem h_le_classical (n : ℕ) (hn : 1 ≤ n) : h n ≤ 1 / (4 * n * (n + 1)) := by
  refine (h_lt n).le.trans ?_
  have hn' : (1 : ℝ) ≤ n := by exact_mod_cast hn
  apply one_div_le_one_div_of_le
  · positivity
  · nlinarith

end

end Grothe
