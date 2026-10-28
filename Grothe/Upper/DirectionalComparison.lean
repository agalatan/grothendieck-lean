import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# A directional correction for a finite kernel head

For a signed coefficient map `a`, keep the linear change of the block energies
inside that map before taking absolute values. Only the quadratic remainder
needs the column absolute sums. A certified approximation to the linear change
can be added to the reference head, with its enclosure error charged once.

This supplies an alternative certificate interface to the norm-only comparison.
It does not evaluate the Gaussian pairings or change the numerical endpoint.

Agent-ID: codex-7c2e
-/

namespace Grothe.Upper.DirectionalComparison

open Finset
open scoped InnerProductSpace

variable {ι κ : Type*} {V : ι → Type*}
  [∀ i, NormedAddCommGroup (V i)] [∀ i, InnerProductSpace ℂ (V i)]

noncomputable section

/-- A finite signed coefficient map applied to block energies. -/
def energyHead (S : Finset ι) (a : κ → ι → ℝ) (x : ∀ i, V i) (j : κ) : ℝ :=
  ∑ i ∈ S, a j i * ‖x i‖ ^ 2

/-- The exact first-order correction, retaining signs through the coefficient map. -/
def linearHead (S : Finset ι) (a : κ → ι → ℝ) (x y : ∀ i, V i) (j : κ) : ℝ :=
  ∑ i ∈ S, a j i * (2 * Complex.re ⟪x i, y i - x i⟫_ℂ)

/-- After the directional correction, the remaining energy change is exactly quadratic. -/
theorem quadratic_remainder (S : Finset ι) (a : κ → ι → ℝ)
    (x y : ∀ i, V i) (j : κ) :
    energyHead S a y j - energyHead S a x j - linearHead S a x y j =
      ∑ i ∈ S, a j i * ‖y i - x i‖ ^ 2 := by
  unfold energyHead linearHead
  rw [← sum_sub_distrib, ← sum_sub_distrib]
  apply sum_congr rfl
  intro i _
  have h := norm_add_sq (𝕜 := ℂ) (x i) (y i - x i)
  rw [add_sub_cancel] at h
  change ‖y i‖ ^ 2 = ‖x i‖ ^ 2 +
    2 * Complex.re ⟪x i, y i - x i⟫_ℂ + ‖y i - x i‖ ^ 2 at h
  rw [h]
  ring

/-- Column absolute sums are paid only on the squared approximation error. -/
theorem quadratic_remainder_le (S : Finset ι) (J : Finset κ)
    (a : κ → ι → ℝ) (w : ι → ℝ) (x y : ∀ i, V i)
    (hw : ∀ i ∈ S, ∑ j ∈ J, |a j i| ≤ w i) :
    ∑ j ∈ J, |energyHead S a y j - energyHead S a x j - linearHead S a x y j| ≤
      ∑ i ∈ S, w i * ‖y i - x i‖ ^ 2 := by
  simp_rw [quadratic_remainder]
  calc
    _ ≤ ∑ j ∈ J, ∑ i ∈ S, |a j i| * ‖y i - x i‖ ^ 2 := by
      apply sum_le_sum
      intro j _
      calc
        _ ≤ ∑ i ∈ S, |a j i * ‖y i - x i‖ ^ 2| :=
          abs_sum_le_sum_abs (fun i => a j i * ‖y i - x i‖ ^ 2) S
        _ = _ := by
          apply sum_congr rfl
          intro i _
          rw [abs_mul, abs_of_nonneg (sq_nonneg ‖y i - x i‖)]
    _ = ∑ i ∈ S, (∑ j ∈ J, |a j i|) * ‖y i - x i‖ ^ 2 := by
      rw [sum_comm]
      simp_rw [sum_mul]
    _ ≤ _ := sum_le_sum fun i hi =>
      mul_le_mul_of_nonneg_right (hw i hi) (sq_nonneg _)

/-- A certified linear correction is combined with the reference head before the
absolute values. No stability of the individual coefficient signs is required. -/
theorem corrected_head_le (S : Finset ι) (J : Finset κ)
    (a : κ → ι → ℝ) (w : ι → ℝ) (x y : ∀ i, V i)
    (b c : κ → ℝ) {η Q : ℝ}
    (hw : ∀ i ∈ S, ∑ j ∈ J, |a j i| ≤ w i)
    (hlinear : ∑ j ∈ J, |linearHead S a x y j - c j| ≤ η)
    (hquad : ∑ i ∈ S, w i * ‖y i - x i‖ ^ 2 ≤ Q) :
    ∑ j ∈ J, |energyHead S a y j - b j| ≤
      (∑ j ∈ J, |energyHead S a x j + c j - b j|) + η + Q := by
  have hrem := (quadratic_remainder_le S J a w x y hw).trans hquad
  have htri (u v z : ℝ) : |u + v + z| ≤ |u| + |v| + |z| :=
    (abs_add_le (u + v) z).trans (add_le_add (abs_add_le u v) le_rfl)
  calc
    _ ≤ ∑ j ∈ J, (|energyHead S a x j + c j - b j| +
        |linearHead S a x y j - c j| +
        |energyHead S a y j - energyHead S a x j - linearHead S a x y j|) := by
      apply sum_le_sum
      intro j _
      calc
        _ = |(energyHead S a x j + c j - b j) + (linearHead S a x y j - c j) +
            (energyHead S a y j - energyHead S a x j - linearHead S a x y j)| := by
          congr 1
          ring
        _ ≤ _ := htri _ _ _
    _ = (∑ j ∈ J, |energyHead S a x j + c j - b j|) +
        (∑ j ∈ J, |linearHead S a x y j - c j|) +
        ∑ j ∈ J, |energyHead S a y j - energyHead S a x j - linearHead S a x y j| := by
      rw [sum_add_distrib, sum_add_distrib]
    _ ≤ _ := add_le_add (add_le_add le_rfl hlinear) hrem

/-- Oppositely signed columns cancel before the head norm, for arbitrary complex
blocks. This also checks that `linearHead` keeps the signs of the coefficient map. -/
example (x y : ℂ) :
    linearHead ({true, false} : Finset Bool)
      (fun (_ : Unit) i => if i then (1 : ℝ) else -1)
      (fun _ => x) (fun _ => y) () = 0 := by
  simp [linearHead]

end

end Grothe.Upper.DirectionalComparison
