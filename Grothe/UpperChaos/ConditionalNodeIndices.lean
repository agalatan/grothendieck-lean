import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic

/-!
# The conditional modes selected by the degree-501 contraction

`contract_primary_blocks.py` selects by `(c,d)`, rather than taking a prefix
of the larger degree-531 conditional table. The row coordinates are the
charge `k` and the conditional first index `c`.

Agent-ID: codex-7c2e
-/

namespace Grothe.UpperChaos.ConditionalNodeIndices

open Finset

set_option maxRecDepth 4096

/-- The actual contraction's row domain: `k=0` starts at `c=1`. -/
@[irreducible] def rows : Finset (ℕ × ℕ) :=
  ((range 252) ×ˢ (range 252)).filter fun kc => 1 ≤ kc.1 + kc.2 ∧ kc.1 + kc.2 ≤ 251

/-- The historical pair lookup, with the subtraction guarded by `rows`. -/
def mode (kc : ℕ × ℕ) : ℕ × ℕ := (kc.2, kc.2 + kc.1 - 1)

/-- Canonical modes actually needed for degree 501. -/
@[irreducible] def modes : Finset (ℕ × ℕ) :=
  ((range 251).sigma fun d => range (d + 2)).image fun dc => (dc.2, dc.1)

theorem mem_rows (k c : ℕ) :
    (k, c) ∈ rows ↔ 1 ≤ c + k ∧ c + k ≤ 251 := by
  simp only [rows, mem_filter, mem_product, mem_range]
  omega

theorem mem_modes (c d : ℕ) : (c, d) ∈ modes ↔ d ≤ 250 ∧ c ≤ d + 1 := by
  simp only [modes, mem_image, mem_sigma, mem_range, Prod.mk.injEq]
  constructor
  · rintro ⟨⟨d', c'⟩, ⟨hd, hc⟩, h⟩
    simp only at h hd hc
    omega
  · rintro ⟨hd, hc⟩
    exact ⟨⟨d, c⟩, ⟨by change d < 251; omega,
      by change c < d + 2; omega⟩, rfl, rfl⟩

/-- No selected pair is counted twice when charge rows are assembled. -/
theorem mode_injective : Set.InjOn mode (rows : Set (ℕ × ℕ)) := by
  rintro ⟨k, c⟩ hk ⟨l, d⟩ hl h
  have hk' := (mem_rows k c).mp hk
  have hl' := (mem_rows l d).mp hl
  simp only [mode, Prod.mk.injEq] at h ⊢
  omega

/-- Exactly the selected pair set, preserving pair lookup semantics. -/
theorem image_rows : rows.image mode = modes := by
  ext ⟨c, d⟩
  simp only [mem_image, mem_modes]
  constructor
  · rintro ⟨⟨k, c'⟩, hk, he⟩
    have hk' := (mem_rows k c').mp hk
    simp only [mode, Prod.mk.injEq] at he
    omega
  · rintro ⟨hd, hc⟩
    refine ⟨(d + 1 - c, c), (mem_rows _ _).mpr ?_, ?_⟩
    · omega
    · apply Prod.ext
      · rfl
      · dsimp [mode]
        omega

/-- The original contraction selects 31,877 distinct conditional modes. -/
theorem card_modes : modes.card = 31877 := by
  have hinj : Function.Injective (fun dc : Σ _ : ℕ, ℕ => (dc.2, dc.1)) := by
    rintro ⟨d, c⟩ ⟨e, f⟩ h
    simp only [Prod.mk.injEq] at h
    rcases h with ⟨rfl, rfl⟩
    rfl
  rw [modes, card_image_of_injective _ hinj, card_sigma]
  simp only [card_range, sum_add_distrib, sum_range_id, sum_const, nsmul_eq_mul,
    card_range]
  norm_num

/-- Every chosen pair lies in the degree-531 storage rectangle and its
canonical half. This is containment, not a prefix claim. -/
theorem storage_bounds {c d : ℕ} (h : (c, d) ∈ modes) :
    c ≤ 266 ∧ d ≤ 265 ∧ c ≤ d + 1 ∧ c + d ≤ 531 := by
  have h' := (mem_modes c d).mp h
  omega

end Grothe.UpperChaos.ConditionalNodeIndices

/-- info: 'Grothe.UpperChaos.ConditionalNodeIndices.image_rows' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNodeIndices.image_rows

/-- info: 'Grothe.UpperChaos.ConditionalNodeIndices.card_modes' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNodeIndices.card_modes
