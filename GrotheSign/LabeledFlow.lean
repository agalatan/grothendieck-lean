import GrotheSign.FlowCoefficients

/-!
# Labeled convolution coefficients

The two binomial expansions in the inverse-flow equation give rising and falling factorials.
Their product reduces to the alternating coefficient handled by the positivity identity.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset

variable {ι : Type*} [DecidableEq ι]

/-- Labeled coefficient before simplifying the two binomial factorials. -/
noncomputable def labeledFlowCoefficient (t : Finset ι) (j : ι → ℕ) (L : ℕ → ℝ) : ℝ :=
  -((labelSum j t : ℝ) + 1) * ∑ u ∈ t.powerset,
    L (labelSum j u) / ((2 * (labelSum j u : ℝ) + 1) * ((labelSum j u : ℝ) + 1)) *
      (ascPochhammer ℝ u.card).eval (2 * (labelSum j u : ℝ) + 1) *
      (-1 : ℝ) ^ (t.card - u.card) *
      (descPochhammer ℝ (t.card - u.card)).eval (2 * (labelSum j u : ℝ) + 2)

/-- Cancellation of the positive scalar prefactors in a nonempty block of labels. -/
theorem inverseFlow_normalization (i m q : ℕ) (hm : 2 ≤ m) (hq : 1 ≤ q) (hqm : q ≤ m) :
    (ascPochhammer ℝ q).eval (2 * (i : ℝ) + 1) *
        (descPochhammer ℝ (m - q)).eval (2 * (i : ℝ) + 2) /
        ((2 * (i : ℝ) + 1) * ((i : ℝ) + 1)) =
      2 * (descPochhammer ℝ (m - 2)).eval (2 * (i : ℝ) + q) := by
  have hi : (i : ℝ) + 1 ≠ 0 := ne_of_gt (by positivity)
  have hi' : 2 * (i : ℝ) + 1 ≠ 0 := ne_of_gt (by positivity)
  have hq' : q - 1 + 1 = q := by omega
  conv_lhs => lhs; lhs; rw [← hq', ascPochhammer_succ_left]
  simp only [Polynomial.eval_mul, Polynomial.eval_X, Polynomial.eval_comp,
    Polynomial.eval_add, Polynomial.eval_one]
  have hx : 2 * (i : ℝ) + 1 + 1 = 2 * (i : ℝ) + 2 := by ring
  rw [hx, mul_assoc, inverseFlow_factor_identity _ hm hq hqm]
  have hx' : 2 * (i : ℝ) + 2 + q - 2 = 2 * (i : ℝ) + q := by ring
  rw [hx']
  field_simp

/-- Every nonlinear labeled binomial convolution coefficient has the alternating form. -/
theorem labeledFlowCoefficient_eq_generatorCoefficient (t : Finset ι) (j : ι → ℕ)
    (L : ℕ → ℝ) (hL : L 0 = 0) (ht : 2 ≤ t.card) :
    labeledFlowCoefficient t j L = generatorCoefficient t j L := by
  unfold labeledFlowCoefficient generatorCoefficient
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro u hu
  by_cases hempty : u = ∅
  · subst u
    simp [labelSum, hL]
  · have hq : 1 ≤ u.card := Finset.one_le_card.mpr (Finset.nonempty_iff_ne_empty.mpr hempty)
    have hqm : u.card ≤ t.card := Finset.card_le_card (Finset.mem_powerset.mp hu)
    have hid := inverseFlow_normalization (labelSum j u) t.card u.card ht hq hqm
    calc
      _ = -((labelSum j t : ℝ) + 1) * L (labelSum j u) *
          (-1 : ℝ) ^ (t.card - u.card) *
          ((ascPochhammer ℝ u.card).eval (2 * (labelSum j u : ℝ) + 1) *
            (descPochhammer ℝ (t.card - u.card)).eval (2 * (labelSum j u : ℝ) + 2) /
            ((2 * (labelSum j u : ℝ) + 1) * ((labelSum j u : ℝ) + 1))) := by ring
      _ = _ := by rw [hid]; ring

/-- At a singleton label the convolution is exactly the diagonal term. -/
theorem labeledFlowCoefficient_singleton (a : ι) (j : ι → ℕ) (L : ℕ → ℝ)
    (hL : L 0 = 0) : labeledFlowCoefficient {a} j L = -L (j a) := by
  have hi : (j a : ℝ) + 1 ≠ 0 := ne_of_gt (by positivity)
  have hi' : 2 * (j a : ℝ) + 1 ≠ 0 := ne_of_gt (by positivity)
  have hpower : ({a} : Finset ι).powerset = {∅, {a}} := by
    change (insert a (∅ : Finset ι)).powerset = _
    rw [Finset.powerset_insert]
    simp
  rw [labeledFlowCoefficient, hpower]
  simp [labelSum, hL]
  field_simp
  ring

end GrotheSign
