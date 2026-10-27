import Grothe.UpperChaos.SmoothComm

/-! Fixed-chaos matrix action of the actual smoothing operator.
The finite saved-matrix entry formula and its interval certificate remain
separate inputs. -/

open MeasureTheory Finset
open scoped ComplexConjugate InnerProductSpace
namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

/-- A deliberately simple finite box containing every four-index of total
degree at most d. It is a proof index set, not a proposed numerical algorithm. -/
def chaosBox (d : ℕ) : Finset Idx2 :=
  ((range (d + 1)).product (range (d + 1))).product
    ((range (d + 1)).product (range (d + 1)))

def chaosShell (d : ℕ) : Finset Idx2 := (chaosBox d).filter (fun i => tdeg i = d)

theorem mem_chaosShell_of_degree (i : Idx2) (d : ℕ) (h : tdeg i = d) :
    i ∈ chaosShell d := by
  rcases i with ⟨⟨a, b⟩, ⟨c, e⟩⟩
  refine Finset.mem_filter.mpr ⟨?_, h⟩
  change ((a, b), (c, e)) ∈
    ((range (d + 1)).product (range (d + 1))).product
      ((range (d + 1)).product (range (d + 1)))
  apply Finset.mem_product.mpr
  constructor <;> apply Finset.mem_product.mpr <;> constructor <;>
    apply Finset.mem_range.mpr <;> dsimp only [tdeg] at h <;> omega

/-- The actual fixed-degree entry, not a saved numerical matrix. -/
def actualEntry (j i : Idx2) : ℂ := ⟪hvec2 j, smoothOp (hvec2 i)⟫_ℂ

/-- Every coefficient of the actual smoothed response is the finite matrix
product on its total-degree shell. No charge, approximation or matrix-entry
formula is assumed. -/
theorem fixed_shell_action (j : Idx2) (f : Lp ℂ 2 mu2) :
    ⟪hvec2 j, smoothOp f⟫_ℂ =
      ∑ i ∈ chaosShell (tdeg j), ⟪hvec2 i, f⟫_ℂ * actualEntry j i := by
  have hs := hasSum_inner_op smoothOp j f
  have hz : ∀ i ∉ chaosShell (tdeg j),
      ⟪hvec2 i, f⟫_ℂ * actualEntry j i = 0 := by
    intro i hi
    have hd : tdeg i ≠ tdeg j := fun he => hi (mem_chaosShell_of_degree i (tdeg j) he)
    simp only [actualEntry, inner_smoothOp_hvec2_eq_zero hd, mul_zero]
  have hf : HasSum (fun i : Idx2 => ⟪hvec2 i, f⟫_ℂ * actualEntry j i)
      (∑ i ∈ chaosShell (tdeg j), ⟪hvec2 i, f⟫_ℂ * actualEntry j i) :=
    hasSum_sum_of_ne_finset_zero hz
  exact hs.unique hf

/-- A candidate numerical matrix may be used only with a certified bound on
its actual operator-entry error. The inequality is for a single output mode;
it does not justify the precision or coverage of any saved matrix. -/
theorem finite_saved_matrix_error (j : Idx2) (f : Lp ℂ 2 mu2)
    (saved : Idx2 → Idx2 → ℂ) (eps : Idx2 → ℝ)
    (hentry : ∀ i ∈ chaosShell (tdeg j), ‖actualEntry j i - saved j i‖ ≤ eps i) :
    ‖⟪hvec2 j, smoothOp f⟫_ℂ -
      ∑ i ∈ chaosShell (tdeg j), ⟪hvec2 i, f⟫_ℂ * saved j i‖ ≤
      ∑ i ∈ chaosShell (tdeg j), ‖⟪hvec2 i, f⟫_ℂ‖ * eps i := by
  rw [fixed_shell_action, ← Finset.sum_sub_distrib]
  calc
    _ ≤ ∑ i ∈ chaosShell (tdeg j),
        ‖⟪hvec2 i, f⟫_ℂ * actualEntry j i - ⟪hvec2 i, f⟫_ℂ * saved j i‖ :=
      norm_sum_le _ _
    _ = ∑ i ∈ chaosShell (tdeg j), ‖⟪hvec2 i, f⟫_ℂ‖ * ‖actualEntry j i - saved j i‖ := by
      apply Finset.sum_congr rfl
      intro i _
      rw [← mul_sub, norm_mul]
    _ ≤ _ := by
      apply Finset.sum_le_sum
      intro i hi
      exact mul_le_mul_of_nonneg_left (hentry i hi) (norm_nonneg _)

end
end Grothe.UpperChaos.FixedChaosSmoothing
