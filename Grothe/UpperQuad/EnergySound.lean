import Grothe.UpperChaos.EnergyBlock
import Grothe.UpperChaos.GradedHermite

/-!
# The bidegree energies of a graded Hermite vector as finite sums

For `gradedHermite N a` (coefficients `a q c d` on the charge-one modes `gradedMode q c d`,
`q < N`, `c ≤ q + 1`, `d ≤ q`) the energy of the bidegree `(2q + 1 − m, m)` is the finite sum
`Σ_{c + d = m} (a q c d)²` over the pairs of the grade `q` (`Energy2.energy`, `EnergyBlock`);
this is the quantity the kernel's `gradeEnergies` encloses (`GrotheQuadKernel.Rotate`).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open Grothe.UpperChaos
open scoped InnerProductSpace

/-- One fibre sum: for a fixed `β`, exactly one `α` satisfies `α + β = q + 1`. -/
lemma sum_fin_ite_add_eq (n q β : ℕ) (v : ℝ) :
    (∑ α : Fin (n + 1), if α.val + β = q + 1 then v else 0) =
      if β ≤ q + 1 ∧ q + 1 - β ≤ n then v else 0 := by
  split_ifs with h
  · rw [Finset.sum_eq_single ⟨q + 1 - β, by omega⟩]
    · simp only [Nat.sub_add_cancel h.1, ↓reduceIte]
    · intro α _ hne
      have : ¬ α.val + β = q + 1 := by
        intro hα
        apply hne
        ext
        simp only
        omega
      simp only [this, ↓reduceIte]
    · intro habs
      exact absurd (Finset.mem_univ _) habs
  · apply Finset.sum_eq_zero
    intro α _
    have : ¬ α.val + β = q + 1 := by
      intro hα
      apply h
      constructor <;> omega
    simp only [this, ↓reduceIte]

/-- `energy (gradedHermite N a) (2q+1−m, m) = Σ_{c ≤ q+1, c ≤ m, m−c ≤ q} (a q c (m−c))²`. -/
theorem energy_gradedHermite (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (q m : ℕ) (hq : q < N)
    (hm : m ≤ 2 * q + 1) :
    energy (gradedHermite N a) (2 * q + 1 - m, m) =
      ∑ c ∈ Finset.range (q + 2), if c ≤ m ∧ m - c ≤ q then (a q c (m - c) : ℝ) ^ 2 else 0 := by
  rw [← norm_energyBlock_sq, EuclideanSpace.norm_sq_eq]
  change (∑ i : Fin (2 * q + 1 - m + 1) × Fin (m + 1),
    ‖⟪hvec2 ((blockEquiv (2 * q + 1 - m, m)) i).1, gradedHermite N a⟫_ℂ‖ ^ 2) = _
  have hterm : ∀ i : Fin (2 * q + 1 - m + 1) × Fin (m + 1),
      ‖⟪hvec2 ((blockEquiv (2 * q + 1 - m, m)) i).1, gradedHermite N a⟫_ℂ‖ ^ 2 =
        if i.1.val + i.2.val = q + 1 then (a q i.2.val (m - i.2.val) : ℝ) ^ 2 else 0 := by
    intro i
    have hi : ((blockEquiv (2 * q + 1 - m, m)) i).1 =
        ((i.1.val, 2 * q + 1 - m - i.1.val), (i.2.val, m - i.2.val)) := rfl
    have hα := i.1.isLt
    have hβ := i.2.isLt
    rw [hi, inner_hvec2_gradedHermite]
    simp only
    by_cases h : i.1.val + i.2.val = q + 1
    · have h2 : i.1.val + i.2.val = 2 * q + 1 - m - i.1.val + (m - i.2.val) + 1 := by omega
      have h3 : 2 * q + 1 - m - i.1.val + (m - i.2.val) = q := by omega
      simp only [h2, h3, hq, and_self, ↓reduceIte, Complex.norm_ratCast, sq_abs]
    · have h2 : ¬ (i.1.val + i.2.val = 2 * q + 1 - m - i.1.val + (m - i.2.val) + 1) := by omega
      simp only [h2, and_false, ↓reduceIte, h, norm_zero, ne_eq, OfNat.ofNat_ne_zero,
        not_false_eq_true, zero_pow]
  simp only [hterm]
  rw [Fintype.sum_prod_type, Finset.sum_comm]
  simp only [sum_fin_ite_add_eq]
  rw [Fin.sum_univ_eq_sum_range
    (fun c => if c ≤ q + 1 ∧ q + 1 - c ≤ 2 * q + 1 - m then (a q c (m - c) : ℝ) ^ 2 else 0) (m + 1)]
  rw [← Finset.sum_filter, ← Finset.sum_filter]
  congr 1
  ext c
  simp only [Finset.mem_filter, Finset.mem_range]
  omega

/-- No charge-one mode has an even total degree: the energy of `gradedHermite N a` vanishes at
every bidegree `(n, m)` with `n + m` even. -/
theorem energy_gradedHermite_even (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (n m : ℕ) (h : (n + m) % 2 = 0) :
    energy (gradedHermite N a) (n, m) = 0 := by
  rw [← norm_energyBlock_sq, EuclideanSpace.norm_sq_eq]
  change (∑ i : Fin (n + 1) × Fin (m + 1),
    ‖⟪hvec2 ((blockEquiv (n, m)) i).1, gradedHermite N a⟫_ℂ‖ ^ 2) = _
  apply Finset.sum_eq_zero
  intro i _
  have hi : ((blockEquiv (n, m)) i).1 = ((i.1.val, n - i.1.val), (i.2.val, m - i.2.val)) := rfl
  have hα := i.1.isLt
  have hβ := i.2.isLt
  rw [hi, inner_hvec2_gradedHermite]
  simp only
  have h2 : ¬ (i.1.val + i.2.val = n - i.1.val + (m - i.2.val) + 1) := by omega
  simp [h2]

end Grothe.UpperQuad
