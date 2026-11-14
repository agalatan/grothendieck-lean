import GrotheSign.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Tactic

/-!
# Weighted splitting of a finite power-series coefficient

A label assignment is split into its restrictions to a subset and its complement. Weighting
by the sum of the labels in the subset then gives the corresponding weighted convolution.
Every sum is finite; no convergence hypothesis on the power series is needed.

Agent-ID: codex-1a87. Refs #365.
-/

set_option warningAsError true

namespace GrotheSign

open Finset PowerSeries

variable {ι : Type*} [DecidableEq ι]

omit [DecidableEq ι] in
private theorem coefficientSplit_zero_outside {g : ι →₀ ℕ} {s : Finset ι}
    (hg : g.support ⊆ s) {a : ι} (ha : a ∉ s) : g a = 0 := by
  exact Finsupp.notMem_support_iff.mp (fun h ↦ ha (hg h))

private theorem coefficientSplit_restrict_mem {t u : Finset ι} (hu : u ⊆ t)
    {j : ι →₀ ℕ} {k : ℕ} (hj : j ∈ finsuppAntidiag t k) :
    labelSum j u ≤ k ∧
      j.filter (· ∈ u) ∈ finsuppAntidiag u (labelSum j u) ∧
      j.filter (· ∉ u) ∈ finsuppAntidiag (t \ u) (k - labelSum j u) := by
  rw [mem_finsuppAntidiag] at hj
  have hsum : (∑ a ∈ t \ u, j a) + labelSum j u = k := by
    simpa only [labelSum] using (Finset.sum_sdiff hu (f := fun a ↦ j a)).trans hj.1
  refine ⟨by omega, ?_, ?_⟩
  · rw [mem_finsuppAntidiag]
    constructor
    · exact Finset.sum_congr rfl (fun a ha ↦ Finsupp.filter_apply_pos _ _ ha)
    · intro a ha
      exact (Finset.mem_filter.mp ha).2
  · rw [mem_finsuppAntidiag]
    constructor
    · calc
        (∑ a ∈ t \ u, (j.filter (· ∉ u)) a) = ∑ a ∈ t \ u, j a :=
          Finset.sum_congr rfl (fun a ha ↦
            Finsupp.filter_apply_pos _ _ (Finset.mem_sdiff.mp ha).2)
        _ = k - labelSum j u := by omega
    · intro a ha
      obtain ⟨haj, hau⟩ := Finset.mem_filter.mp ha
      exact Finset.mem_sdiff.mpr ⟨hj.2 haj, hau⟩

private theorem coefficientSplit_add_data {t u : Finset ι} (hu : u ⊆ t)
    {i k : ℕ} (hi : i ≤ k) {g h : ι →₀ ℕ}
    (hg : g ∈ finsuppAntidiag u i) (hh : h ∈ finsuppAntidiag (t \ u) (k - i)) :
    g + h ∈ finsuppAntidiag t k ∧ labelSum (g + h) u = i ∧
      (g + h).filter (· ∈ u) = g ∧ (g + h).filter (· ∉ u) = h := by
  rw [mem_finsuppAntidiag] at hg hh
  have hgu : ∑ a ∈ t, g a = ∑ a ∈ u, g a :=
    (Finset.sum_subset hu (fun a _ ha ↦ coefficientSplit_zero_outside hg.2 ha)).symm
  have hht : ∑ a ∈ t, h a = ∑ a ∈ t \ u, h a :=
    (Finset.sum_subset Finset.sdiff_subset
      (fun a _ ha ↦ coefficientSplit_zero_outside hh.2 ha)).symm
  have hhu (a : ι) (ha : a ∈ u) : h a = 0 :=
    coefficientSplit_zero_outside hh.2 (fun h ↦ (Finset.mem_sdiff.mp h).2 ha)
  have hgn (a : ι) (ha : a ∉ u) : g a = 0 :=
    coefficientSplit_zero_outside hg.2 ha
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [mem_finsuppAntidiag]
    constructor
    · change (∑ a ∈ t, (g a + h a)) = k
      rw [Finset.sum_add_distrib, hgu, hht, hg.1, hh.1]
      omega
    · intro a ha
      by_contra hat
      have hga : g a = 0 := hgn a (fun hau ↦ hat (hu hau))
      have hha : h a = 0 :=
        coefficientSplit_zero_outside hh.2 (fun hau ↦ hat (Finset.mem_sdiff.mp hau).1)
      simp only [Finsupp.mem_support_iff, Finsupp.add_apply, hga, hha,
        Nat.zero_add, ne_eq, not_true_eq_false] at ha
  · calc
      labelSum (g + h) u = ∑ a ∈ u, g a := by
        exact Finset.sum_congr rfl (fun a ha ↦ by simp only [Finsupp.add_apply, hhu a ha,
          Nat.add_zero])
      _ = i := hg.1
  · ext a
    by_cases ha : a ∈ u
    · simp only [Finsupp.filter_apply, ha, ite_true, Finsupp.add_apply, hhu a ha,
        Nat.add_zero]
    · simp only [Finsupp.filter_apply, ha, ite_false, hgn a ha]
  · ext a
    by_cases ha : a ∈ u
    · simp only [Finsupp.filter_apply, ha, not_true_eq_false, ite_false, hhu a ha]
    · simp only [Finsupp.filter_apply, ha, not_false_eq_true, ite_true,
        Finsupp.add_apply, hgn a ha, Nat.zero_add]

/-- Splitting a finite label assignment gives a weighted convolution of its two restrictions. -/
theorem coefficientSplit_sum (t u : Finset ι) (hu : u ⊆ t)
    (p A : ℕ → ℝ) (k : ℕ) :
    (∑ j ∈ finsuppAntidiag t k, A (labelSum j u) * ∏ a ∈ t, p (j a)) =
      ∑ i ∈ range (k + 1), ∑ g ∈ finsuppAntidiag u i,
        ∑ h ∈ finsuppAntidiag (t \ u) (k - i),
          A i * (∏ a ∈ u, p (g a)) * ∏ a ∈ t \ u, p (h a) := by
  classical
  let S : Finset (Σ _ : ℕ, (ι →₀ ℕ) × (ι →₀ ℕ)) :=
    (range (k + 1)).sigma fun i ↦
      (finsuppAntidiag u i).product (finsuppAntidiag (t \ u) (k - i))
  let split : (ι →₀ ℕ) → Σ _ : ℕ, (ι →₀ ℕ) × (ι →₀ ℕ) :=
    fun j ↦ ⟨labelSum j u, j.filter (· ∈ u), j.filter (· ∉ u)⟩
  have hsplit (j : ι →₀ ℕ) (hj : j ∈ finsuppAntidiag t k) : split j ∈ S := by
    obtain ⟨hle, hleft, hright⟩ := coefficientSplit_restrict_mem hu hj
    dsimp only [split, S]
    exact Finset.mem_sigma.mpr ⟨Finset.mem_range.mpr (Nat.lt_succ_of_le hle),
      Finset.mem_product.mpr ⟨hleft, hright⟩⟩
  have hadd (x : Σ _ : ℕ, (ι →₀ ℕ) × (ι →₀ ℕ)) (hx : x ∈ S) :
      x.2.1 + x.2.2 ∈ finsuppAntidiag t k := by
    obtain ⟨hi, hgh⟩ := Finset.mem_sigma.mp hx
    obtain ⟨hg, hh⟩ := Finset.mem_product.mp hgh
    exact (coefficientSplit_add_data hu (by simpa only [mem_range, Nat.lt_succ_iff]
      using hi) hg hh).1
  calc
    _ = ∑ x ∈ S, A x.1 * (∏ a ∈ u, p (x.2.1 a)) *
        ∏ a ∈ t \ u, p (x.2.2 a) := by
      apply Finset.sum_nbij' split (fun x ↦ x.2.1 + x.2.2) hsplit hadd
      · intro j _
        exact Finsupp.filter_add_filter_not j (· ∈ u)
      · rintro ⟨i, g, h⟩ hx
        obtain ⟨hi, hgh⟩ := Finset.mem_sigma.mp hx
        obtain ⟨hg, hh⟩ := Finset.mem_product.mp hgh
        obtain ⟨_, hs, hl, hr⟩ := coefficientSplit_add_data hu
          (by simpa only [mem_range, Nat.lt_succ_iff] using hi) hg hh
        change (⟨labelSum (g + h) u, (g + h).filter (· ∈ u),
          (g + h).filter (· ∉ u)⟩ : Σ _ : ℕ, (ι →₀ ℕ) × (ι →₀ ℕ)) = ⟨i, g, h⟩
        rw [hs, hl, hr]
      · intro j _
        have hl : (∏ a ∈ u, p ((j.filter (· ∈ u)) a)) = ∏ a ∈ u, p (j a) :=
          Finset.prod_congr rfl (fun a ha ↦ congrArg p (Finsupp.filter_apply_pos _ _ ha))
        have hr : (∏ a ∈ t \ u, p ((j.filter (· ∉ u)) a)) = ∏ a ∈ t \ u, p (j a) :=
          Finset.prod_congr rfl (fun a ha ↦
            congrArg p (Finsupp.filter_apply_pos _ _ (Finset.mem_sdiff.mp ha).2))
        change A (labelSum j u) * (∏ a ∈ t, p (j a)) =
          A (labelSum j u) * (∏ a ∈ u, p ((j.filter (· ∈ u)) a)) *
            ∏ a ∈ t \ u, p ((j.filter (· ∉ u)) a)
        rw [hl, hr, ← Finset.prod_sdiff hu]
        ring
    _ = _ := by
      rw [Finset.sum_sigma]
      apply Finset.sum_congr rfl
      intro i _
      exact Finset.sum_product _ _ (fun gh : (ι →₀ ℕ) × (ι →₀ ℕ) ↦
        A i * (∏ a ∈ u, p (gh.1 a)) * ∏ a ∈ t \ u, p (gh.2 a))

set_option maxHeartbeats 800000 in
/-- A weight depending on the subtotal over `u` becomes the same weight in the convolution
of the coefficients of `P ^ u.card` and `P ^ (t.card - u.card)`. -/
theorem coefficient_weighted_split (t u : Finset ι) (hu : u ⊆ t)
    (P : PowerSeries ℝ) (A : ℕ → ℝ) (k : ℕ) :
    (∑ j ∈ finsuppAntidiag t k,
      A (labelSum j u) * ∏ a ∈ t, coeff (j a) P) =
      ∑ i ∈ range (k + 1),
        A i * coeff i (P ^ u.card) * coeff (k - i) (P ^ (t.card - u.card)) := by
  have hc (s : Finset ι) (n : ℕ) :
      coeff n (P ^ s.card) =
        ∑ j ∈ finsuppAntidiag s n, ∏ a ∈ s, coeff (j a) P := by
    simpa only [Finset.prod_const] using PowerSeries.coeff_prod (fun _ : ι ↦ P) n s
  rw [coefficientSplit_sum t u hu (fun n ↦ coeff n P) A k]
  apply Finset.sum_congr rfl
  intro i _
  rw [← Finset.card_sdiff_of_subset hu, hc u i, hc (t \ u) (k - i),
    mul_assoc, Finset.sum_mul_sum]
  simp only [Finset.mul_sum, mul_assoc]

end GrotheSign
