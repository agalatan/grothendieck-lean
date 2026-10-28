import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Complex.Basic
import Mathlib.Tactic

/-! The actual triangular coordinate selection used by the degree-501
canonical reconstruction duplicates each eligible source coordinate at
most once, and every exact reflection factor is at most one. This proves
the 10/7 reconstruction allowance without counting grades or modes.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open Finset
namespace Grothe.UpperChaos.CanonicalReconstructionNorm
noncomputable section

/-- Production coordinates in one complete charge-one grade. -/
def grade (q : ℕ) : Finset (ℕ × ℕ) := range (q + 2) ×ˢ range (q + 1)

def canonical (q : ℕ) : Finset (ℕ × ℕ) :=
  (grade q).filter fun i => i.1 ≤ i.2 + 1

def reflected (q : ℕ) : Finset (ℕ × ℕ) :=
  (grade q).filter fun i => i.2 + 1 < i.1

/-- The same partner used by the actual production reflection identity. -/
def partner (i : ℕ × ℕ) : ℕ × ℕ := (i.2 + 1, i.1 - 1)

lemma mem_reflected {q : ℕ} {i : ℕ × ℕ} :
    i ∈ reflected q ↔ i.1 < q + 2 ∧ i.2 < q + 1 ∧ i.2 + 1 < i.1 := by
  simp only [reflected, grade, mem_filter, mem_product, mem_range]
  tauto

lemma mem_canonical {q : ℕ} {i : ℕ × ℕ} :
    i ∈ canonical q ↔ i.1 < q + 2 ∧ i.2 < q + 1 ∧ i.1 ≤ i.2 + 1 := by
  simp only [canonical, grade, mem_filter, mem_product, mem_range]
  tauto

theorem partner_mem_canonical {q : ℕ} {i : ℕ × ℕ} (hi : i ∈ reflected q) :
    partner i ∈ canonical q := by
  rw [mem_reflected] at hi
  rw [mem_canonical]
  dsimp [partner]
  omega

/-- No two reflected modes reuse the same canonical coordinate. -/
theorem partner_injective_on_reflected (q : ℕ) :
    Set.InjOn partner (reflected q) := by
  intro i hi j hj heq
  have hi' := mem_reflected.mp hi
  have hj' := mem_reflected.mp hj
  have he1 := congrArg Prod.fst heq
  have he2 := congrArg Prod.snd heq
  dsimp [partner] at he1 he2
  apply Prod.ext <;> omega

def factor (i : ℕ × ℕ) : ℝ := Real.sqrt ((i.2 + 1 : ℝ) / i.1)

theorem factor_le_one {q : ℕ} {i : ℕ × ℕ} (hi : i ∈ reflected q) :
    factor i ≤ 1 := by
  have hs := (mem_reflected.mp hi).2.2
  have hc : (0 : ℝ) < i.1 := by exact_mod_cast (by omega : 0 < i.1)
  have hcd : (i.2 : ℝ) + 1 ≤ i.1 := by exact_mod_cast hs.le
  have hf : (i.2 + 1 : ℝ) / i.1 ≤ 1 := (div_le_one hc).mpr hcd
  have hsq := Real.sq_sqrt (show 0 ≤ (i.2 + 1 : ℝ) / i.1 by positivity)
  have hnonneg := Real.sqrt_nonneg ((i.2 + 1 : ℝ) / i.1)
  dsimp [factor]
  nlinarith

/-- A reflected error vector has no more energy than the canonical entries
it selects. The sum is over distinct coordinates, with no prefix assumption. -/
theorem reflected_energy_le (q : ℕ) (e : ℕ × ℕ → ℂ) :
    (∑ i ∈ reflected q, ‖(factor i : ℂ) * e (partner i)‖ ^ 2) ≤
      ∑ i ∈ canonical q, ‖e i‖ ^ 2 := by
  calc
    _ ≤ ∑ i ∈ reflected q, ‖e (partner i)‖ ^ 2 := by
      apply sum_le_sum
      intro i hi
      have hf0 : 0 ≤ factor i := Real.sqrt_nonneg _
      have hn : ‖(factor i : ℂ) * e (partner i)‖ ≤ ‖e (partner i)‖ := by
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hf0]
        exact mul_le_of_le_one_left (norm_nonneg _) (factor_le_one hi)
      exact pow_le_pow_left₀ (norm_nonneg _) hn 2
    _ = ∑ i ∈ (reflected q).image partner, ‖e i‖ ^ 2 := by
      rw [sum_image (partner_injective_on_reflected q)]
    _ ≤ _ := by
      apply sum_le_sum_of_subset_of_nonneg
      · intro i hi
        obtain ⟨j, hj, rfl⟩ := mem_image.mp hi
        exact partner_mem_canonical hj
      · intro i _ _
        exact sq_nonneg _

/-- Squared reconstruction norm: the canonical and reflected branches are
disjoint output coordinates, so their energies add. -/
theorem reconstruction_energy_le (q : ℕ) (e : ℕ × ℕ → ℂ) :
    (∑ i ∈ canonical q, ‖e i‖ ^ 2) +
      (∑ i ∈ reflected q, ‖(factor i : ℂ) * e (partner i)‖ ^ 2) ≤
        2 * ∑ i ∈ canonical q, ‖e i‖ ^ 2 := by
  linarith [reflected_energy_le q e]

/-- The inherited 10/7 allowance exceeds sqrt(2). -/
theorem reconstruction_norm_le (q : ℕ) (e : ℕ × ℕ → ℂ) :
    Real.sqrt ((∑ i ∈ canonical q, ‖e i‖ ^ 2) +
      (∑ i ∈ reflected q, ‖(factor i : ℂ) * e (partner i)‖ ^ 2)) ≤
        (10 / 7 : ℝ) * Real.sqrt (∑ i ∈ canonical q, ‖e i‖ ^ 2) := by
  have ha : 0 ≤ ∑ i ∈ canonical q, ‖e i‖ ^ 2 := sum_nonneg (fun _ _ => sq_nonneg _)
  have hb : 0 ≤ ∑ i ∈ reflected q, ‖(factor i : ℂ) * e (partner i)‖ ^ 2 :=
    sum_nonneg (fun _ _ => sq_nonneg _)
  apply (sq_le_sq₀ (Real.sqrt_nonneg _)
    (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))).mp
  rw [mul_pow, Real.sq_sqrt (add_nonneg ha hb), Real.sq_sqrt ha]
  nlinarith [reconstruction_energy_le q e]

/-- The same allowance holds for all 251 orthogonal grades together.
No factor equal to the number of grades is introduced. -/
theorem full_head_reconstruction_norm_le (e : ℕ → ℕ × ℕ → ℂ) :
    Real.sqrt (∑ q ∈ range 251,
      ((∑ i ∈ canonical q, ‖e q i‖ ^ 2) +
      (∑ i ∈ reflected q, ‖(factor i : ℂ) * e q (partner i)‖ ^ 2))) ≤
      (10 / 7 : ℝ) *
        Real.sqrt (∑ q ∈ range 251, ∑ i ∈ canonical q, ‖e q i‖ ^ 2) := by
  have ha (q : ℕ) : 0 ≤ ∑ i ∈ canonical q, ‖e q i‖ ^ 2 :=
    sum_nonneg (fun _ _ => sq_nonneg _)
  have hb (q : ℕ) : 0 ≤ ∑ i ∈ reflected q, ‖(factor i : ℂ) * e q (partner i)‖ ^ 2 :=
    sum_nonneg (fun _ _ => sq_nonneg _)
  have hsum : (∑ q ∈ range 251,
      ((∑ i ∈ canonical q, ‖e q i‖ ^ 2) +
      (∑ i ∈ reflected q, ‖(factor i : ℂ) * e q (partner i)‖ ^ 2))) ≤
      2 * ∑ q ∈ range 251, ∑ i ∈ canonical q, ‖e q i‖ ^ 2 := by
    rw [mul_sum]
    apply sum_le_sum
    intro q _
    exact reconstruction_energy_le q (e q)
  have ha0 : 0 ≤ ∑ q ∈ range 251, ∑ i ∈ canonical q, ‖e q i‖ ^ 2 :=
    sum_nonneg (fun q _ => ha q)
  have ht0 : 0 ≤ ∑ q ∈ range 251,
      ((∑ i ∈ canonical q, ‖e q i‖ ^ 2) +
      (∑ i ∈ reflected q, ‖(factor i : ℂ) * e q (partner i)‖ ^ 2)) :=
    by
      apply sum_nonneg
      intro q _
      exact add_nonneg (ha q) (hb q)
  apply (sq_le_sq₀ (Real.sqrt_nonneg _)
    (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))).mp
  rw [mul_pow, Real.sq_sqrt ht0, Real.sq_sqrt ha0]
  nlinarith

end
end Grothe.UpperChaos.CanonicalReconstructionNorm

/-- info: 'Grothe.UpperChaos.CanonicalReconstructionNorm.reconstruction_norm_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.CanonicalReconstructionNorm.reconstruction_norm_le

/-- info: 'Grothe.UpperChaos.CanonicalReconstructionNorm.full_head_reconstruction_norm_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.CanonicalReconstructionNorm.full_head_reconstruction_norm_le
