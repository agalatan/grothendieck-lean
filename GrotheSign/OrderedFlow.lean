import GrotheSign.LabeledFlow
import GrotheSign.BetaCoefficients
import Mathlib.RingTheory.PowerSeries.Basic

/-!
# Ordered-composition expansion of the inverse flow

An order-`m` contribution is divided by `m!`. Repeated labels therefore receive their ordinary
monomial multiplicities automatically. Nonlinear terms at weight `k` involve only lower positive
indices, because every contributing label is positive.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset PowerSeries

/-- The contribution from `m` ordered labels of total weight `k`. -/
noncomputable def orderedFlowTerm (k m : ℕ) (L : ℕ → ℝ) (P : PowerSeries ℝ) : ℝ :=
  1 / (m.factorial : ℝ) * ∑ j ∈ Finset.finsuppAntidiag (range m) k,
    labeledFlowCoefficient (range m) j L * ∏ a ∈ range m, coeff (j a) P

/-- Finite polynomial obtained by summing the ordered labeled contributions. -/
noncomputable def orderedFlow (k : ℕ) (L : ℕ → ℝ) (P : PowerSeries ℝ) : ℝ :=
  ∑ m ∈ range (k + 1), orderedFlowTerm k m L P

private theorem label_lt_total {ι : Type*} [DecidableEq ι] (t : Finset ι) (j : ι → ℕ)
    (ht : 2 ≤ t.card) (hj : ∀ a ∈ t, 0 < j a) {a : ι} (ha : a ∈ t) :
    j a < labelSum j t := by
  have he : (t.erase a).Nonempty := Finset.card_pos.mp (by
    rw [Finset.card_erase_of_mem ha]
    omega)
  have hp : 0 < ∑ b ∈ t.erase a, j b :=
    Finset.sum_pos (fun b hb ↦ hj b (Finset.mem_of_mem_erase hb)) he
  have hs := Finset.sum_erase_add t j ha
  unfold labelSum
  omega

/-- Nonlinear beta terms are nonnegative whenever the lower inverse coefficients are. -/
theorem orderedFlowTerm_beta_nonneg (k m : ℕ) (hm : 2 ≤ m) (P : PowerSeries ℝ)
    (hP : constantCoeff P = 0) {c : ℝ} (hc : 0 < c)
    (hp : ∀ i, 0 < i → i < k → 0 ≤ coeff i P) :
    0 ≤ orderedFlowTerm k m (fun i ↦ harmonicGenerator i c) P := by
  unfold orderedFlowTerm
  apply mul_nonneg (by positivity)
  apply Finset.sum_nonneg
  intro j hj
  have hsum : labelSum j (range m) = k := (Finset.mem_finsuppAntidiag.mp hj).1
  by_cases hpos : ∀ a ∈ range m, 0 < j a
  · have ht : 2 ≤ (range m).card := by simpa using hm
    have hg : 0 < labeledFlowCoefficient (range m) j (fun i ↦ harmonicGenerator i c) := by
      rw [labeledFlowCoefficient_eq_generatorCoefficient _ _ _ (harmonicGenerator_zero c) ht]
      exact betaGeneratorCoefficient_pos _ _ hc ht hpos
    apply mul_nonneg hg.le
    apply Finset.prod_nonneg
    intro a ha
    exact hp (j a) (hpos a ha) (hsum ▸ label_lt_total _ _ ht hpos ha)
  · push Not at hpos
    obtain ⟨a, ha, hzero⟩ := hpos
    have hja : j a = 0 := by omega
    have hz : ∏ b ∈ range m, coeff (j b) P = 0 :=
      Finset.prod_eq_zero ha (by simpa [hja, coeff_zero_eq_constantCoeff] using hP)
    rw [hz, mul_zero]

end GrotheSign
