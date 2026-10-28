import Grothe.UpperChaos.CompactTaylorBands

/-!
# Rational coefficient enclosures and finite band energies

Each normalized coefficient is enclosed by a rational center and radius.
Subtracting the stored Hermite coefficient gives a rational residual radius;
Parseval then bounds the entire band by the sum of their squares. No source
approximation error is included in this finite sum.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

/-- The stored coefficient, with the finite center's cutoff explicit. -/
def bandTargetQ {N : ℕ} (M : ℕ) (c : ℕ → ℕ → ℕ → ℚ) (i : GradedIdx N) : ℚ :=
  if i.1.val < M then c i.1 i.2.1 i.2.2 else 0

/-- A rational bound for a coefficient after subtracting the stored center. -/
def bandResidualRadiusQ {N : ℕ} (M : ℕ) (c : ℕ → ℕ → ℕ → ℚ)
    (center radius : GradedIdx N → ℚ) (i : GradedIdx N) : ℚ :=
  |center i - bandTargetQ M c i| + radius i

/-- The complete rational energy budget, restricted to the requested band. -/
def bandEnclosureEnergyQ (B : Set Idx2) [DecidablePred (· ∈ B)] (N M : ℕ)
    (c : ℕ → ℕ → ℕ → ℚ) (center radius : GradedIdx N → ℚ) : ℚ :=
  ∑ i : GradedIdx N, if gradedIdx i ∈ B then
    bandResidualRadiusQ M c center radius i ^ 2 else 0

theorem norm_sub_bandTarget_le {N : ℕ} (M : ℕ) (c : ℕ → ℕ → ℕ → ℚ)
    (center radius : GradedIdx N → ℚ) (i : GradedIdx N) (w : ℂ)
    (h : ‖w - (center i : ℂ)‖ ≤ (radius i : ℝ)) :
    ‖w - (if i.1.val < M then (c i.1 i.2.1 i.2.2 : ℂ) else 0)‖ ≤
      (bandResidualRadiusQ M c center radius i : ℝ) := by
  have htarget : (if i.1.val < M then (c i.1 i.2.1 i.2.2 : ℂ) else 0) =
      (bandTargetQ M c i : ℂ) := by
    unfold bandTargetQ
    split_ifs <;> simp
  rw [htarget]
  calc
    ‖w - (bandTargetQ M c i : ℂ)‖ ≤
        ‖w - (center i : ℂ)‖ + ‖(center i : ℂ) - (bandTargetQ M c i : ℂ)‖ :=
      norm_sub_le_norm_sub_add_norm_sub w (center i : ℂ) (bandTargetQ M c i : ℂ)
    _ ≤ (radius i : ℝ) + ‖(center i : ℂ) - (bandTargetQ M c i : ℂ)‖ :=
      add_le_add h le_rfl
    _ = (bandResidualRadiusQ M c center radius i : ℝ) := by
      rw [← Rat.cast_sub, Complex.norm_ratCast]
      simp only [bandResidualRadiusQ, Rat.cast_add, Rat.cast_abs]
      exact add_comm _ _

/-- Certified coefficient enclosures bound the actual projected energy.
The premise is needed only for modes in the band, with no extra sign premise
on the radii: nonnegativity follows from each norm enclosure. -/
theorem norm_projOn_sub_graded_sq_le_enclosure (B : Set Idx2)
    [DecidablePred (· ∈ B)] (F : Lp ℂ 2 mu2) (hF : ChargeOne F)
    (N M : ℕ) (c : ℕ → ℕ → ℕ → ℚ) (center radius : GradedIdx N → ℚ)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N)
    (hcoeff : ∀ i : GradedIdx N, gradedIdx i ∈ B →
      ‖⟪hvec2 (gradedIdx i), F⟫_ℂ - (center i : ℂ)‖ ≤ (radius i : ℝ)) :
    ‖projOn B (F - gradedHermite M c)‖ ^ 2 ≤
      (bandEnclosureEnergyQ B N M c center radius : ℝ) := by
  rw [norm_projOn_chargeOne_sub_graded_sq B F hF N M c hdegree]
  simp only [bandEnclosureEnergyQ, Rat.cast_sum]
  apply Finset.sum_le_sum
  intro i _hi
  by_cases hi : gradedIdx i ∈ B
  · simp only [hi, ite_true, Rat.cast_pow]
    have h := norm_sub_bandTarget_le M c center radius i _ (hcoeff i hi)
    exact (sq_le_sq₀ (norm_nonneg _) ((norm_nonneg _).trans h)).2 h
  · simp only [hi, ite_false, Rat.cast_zero, le_refl]

end
end Grothe.UpperChaos
