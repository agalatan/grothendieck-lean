import GrotheSign.Positivity

/-!
# Finite coefficients of inverse flows

The alternating labeled expression is linear in the forward coefficient generator. For the
Euler resolvent it agrees with the positive integral coefficient proved in `Positivity`.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset

variable {ι : Type*} [DecidableEq ι]

private theorem descPochhammer_eval_mul (x : ℝ) (a b : ℕ) :
    (descPochhammer ℝ a).eval x * (descPochhammer ℝ b).eval (x - a) =
      (descPochhammer ℝ (a + b)).eval x := by
  have h := congrArg (Polynomial.eval x) (descPochhammer_mul ℝ a b)
  simpa only [Polynomial.eval_mul, Polynomial.eval_comp, Polynomial.eval_sub,
    Polynomial.eval_X, Polynomial.eval_natCast] using h

private theorem ascPochhammer_eval_as_desc (x : ℝ) (a : ℕ) :
    (ascPochhammer ℝ a).eval x = (descPochhammer ℝ a).eval (x + a - 1) := by
  rw [descPochhammer_eval_eq_ascPochhammer]
  congr 1
  ring

/-- The rising and falling factors in the inverse-flow convolution join without division. -/
theorem inverseFlow_factor_identity (x : ℝ) {m q : ℕ}
    (hm : 2 ≤ m) (hq : 1 ≤ q) (hqm : q ≤ m) :
    (ascPochhammer ℝ (q - 1)).eval x * (descPochhammer ℝ (m - q)).eval x =
      x * (descPochhammer ℝ (m - 2)).eval (x + q - 2) := by
  obtain ⟨d, rfl⟩ := Nat.exists_eq_add_of_le hqm
  rcases q with _ | q
  · omega
  rcases q with _ | q
  · have hd : 1 ≤ d := by omega
    obtain ⟨e, rfl⟩ := Nat.exists_eq_add_of_le hd
    simp only [Nat.add_sub_cancel_left, Nat.succ_sub_one]
    have hm' : 1 + (1 + e) - 2 = e := by omega
    rw [hm']
    simp only [ascPochhammer_zero, Polynomial.eval_one, one_mul]
    rw [show 1 + e = e + 1 by omega, descPochhammer_succ_left]
    simp only [Polynomial.eval_mul, Polynomial.eval_X, Polynomial.eval_comp,
      Polynomial.eval_sub, Polynomial.eval_one]
    congr 2
    ring
  · have hsub : q + 1 + 1 + d - 2 = q + d := by omega
    simp only [Nat.add_sub_cancel_left, Nat.succ_sub_one]
    rw [hsub, ascPochhammer_succ_left]
    simp only [Polynomial.eval_mul, Polynomial.eval_X, Polynomial.eval_comp,
      Polynomial.eval_add, Polynomial.eval_one]
    rw [ascPochhammer_eval_as_desc]
    have hx : x + 1 + q - 1 = x + q := by ring
    rw [hx, mul_assoc]
    have hmul := descPochhammer_eval_mul (x + q) q d
    rw [add_sub_cancel_right] at hmul
    rw [hmul]
    congr 2
    push_cast
    ring

/-- The alternating labeled expression associated with a forward coefficient generator. -/
noncomputable def generatorCoefficient (t : Finset ι) (j : ι → ℕ) (L : ℕ → ℝ) : ℝ :=
  -2 * ((labelSum j t : ℝ) + 1) *
    ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) * L (labelSum j u) *
      (descPochhammer ℝ (t.card - 2)).eval (2 * (labelSum j u : ℝ) + u.card)

/-- The constant generator contributes zero at every nonlinear labeled degree. -/
theorem generatorCoefficient_one (t : Finset ι) (j : ι → ℕ) (ht : 2 ≤ t.card) :
    generatorCoefficient t j (fun _ ↦ 1) = 0 := by
  have h := alternatingSum_falling_eq_zero t (fun a ↦ 2 * (j a : ℝ) + 1)
    (r := t.card - 2) (by omega)
  have heval (u : Finset ι) :
      (∑ a ∈ u, (2 * (j a : ℝ) + 1)) = 2 * (labelSum j u : ℝ) + u.card := by
    simp [labelSum, Finset.sum_add_distrib, Finset.mul_sum]
  simp only [heval] at h
  simp [generatorCoefficient, h]

/-- Removing the constant part of `k / (s + k)` gives the positive resolvent coefficient. -/
theorem generatorCoefficient_resolvent (t : Finset ι) (j : ι → ℕ) {s : ℝ}
    (hs : 0 < s) (ht : 2 ≤ t.card) :
    generatorCoefficient t j (fun k ↦ (k : ℝ) / (s + k)) =
      resolventCoefficient t j s := by
  have hzero := generatorCoefficient_one t j ht
  have hid (u : Finset ι) :
      (labelSum j u : ℝ) / (s + labelSum j u) =
        1 - s / (s + labelSum j u) := by
    have hden : s + (labelSum j u : ℝ) ≠ 0 := ne_of_gt (by positivity)
    field_simp
    ring
  unfold generatorCoefficient at hzero ⊢
  simp only [mul_one] at hzero
  simp_rw [hid, mul_sub, mul_one, sub_mul]
  rw [Finset.sum_sub_distrib]
  unfold resolventCoefficient resolventSum
  rw [mul_sub, hzero, zero_sub]
  simp only [Finset.mul_sum]
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro u _
  ring

/-- Every nonlinear labeled coefficient of an Euler-resolvent generator is positive. -/
theorem generatorCoefficient_resolvent_pos (t : Finset ι) (j : ι → ℕ) {s : ℝ}
    (hs : 0 < s) (ht : 2 ≤ t.card) (hj : ∀ a ∈ t, 0 < j a) :
    0 < generatorCoefficient t j (fun k ↦ (k : ℝ) / (s + k)) := by
  rw [generatorCoefficient_resolvent t j hs ht]
  exact resolventCoefficient_pos t j hs ht hj

omit [DecidableEq ι] in
/-- Scaling a forward generator scales every labeled coefficient. -/
theorem generatorCoefficient_mul (t : Finset ι) (j : ι → ℕ) (L : ℕ → ℝ) (a : ℝ) :
    generatorCoefficient t j (fun k ↦ a * L k) = a * generatorCoefficient t j L := by
  unfold generatorCoefficient
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro u _
  ring

omit [DecidableEq ι] in
/-- Finite sums of generators give finite sums of labeled coefficients. -/
theorem generatorCoefficient_sum {κ : Type*} (t : Finset ι) (j : ι → ℕ)
    (v : Finset κ) (L : κ → ℕ → ℝ) :
    generatorCoefficient t j (fun k ↦ ∑ a ∈ v, L a k) =
      ∑ a ∈ v, generatorCoefficient t j (L a) := by
  unfold generatorCoefficient
  simp only [Finset.mul_sum, Finset.sum_mul]
  rw [Finset.sum_comm]

end GrotheSign
