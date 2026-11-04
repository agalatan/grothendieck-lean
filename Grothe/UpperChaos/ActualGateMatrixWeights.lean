import Grothe.UpperChaos.ActualTaylorFiniteCoefficients
import Grothe.UpperChaos.OriginalHSQuadraticForms

/-!
# Exact gate weights for the actual Hermite matrix

Agent-ID: codex-2ca4.

Squaring the source scaling removes all square roots and gives precisely the
real energy weight. This module concerns the actual physical matrix entries;
it does not assume or claim their identification with coherent coefficients.
-/

namespace Grothe.UpperChaos.ActualGateMatrixWeights

open Grothe.LowerAnalytic ActualTaylorFiniteCoefficients
open OriginalHSParameterGates OriginalHSParameterSoundness OriginalHSQuadraticForms

noncomputable section

def sourceWeight (g : Gate) (m n : Idx2) : ℝ :=
  Real.sqrt (g.r : ℝ) ^ (m.1.1 + m.1.2 + m.2.1 + m.2.2) *
    Real.sqrt (axisWeight g 0) ^ n.1.1 *
    Real.sqrt (axisWeight g 1) ^ n.1.2 *
    Real.sqrt (axisWeight g 2) ^ n.2.1 *
    Real.sqrt (axisWeight g 3) ^ n.2.2

def energyWeight (g : Gate) (m n : Idx2) : ℝ :=
  (g.r : ℝ) ^ (m.1.1 + m.1.2 + m.2.1 + m.2.2) *
    axisWeight g 0 ^ n.1.1 * axisWeight g 1 ^ n.1.2 *
    axisWeight g 2 ^ n.2.1 * axisWeight g 3 ^ n.2.2

theorem sourceWeight_nonneg (g : Gate) (m n : Idx2) :
    0 ≤ sourceWeight g m n := by
  unfold sourceWeight
  positivity

private theorem sqrt_pow_sq {x : ℝ} (hx : 0 ≤ x) (k : ℕ) :
    (Real.sqrt x ^ k) ^ 2 = x ^ k := by
  rw [← pow_mul, Nat.mul_comm k 2, pow_mul, Real.sq_sqrt hx]

theorem sourceWeight_sq (g : Gate) (hg : gateOK g = true) (m n : Idx2) :
    sourceWeight g m n ^ 2 = energyWeight g m n := by
  simp only [sourceWeight, energyWeight, mul_pow,
    sqrt_pow_sq (radial_pos g hg).le,
    sqrt_pow_sq (axisWeight_pos g hg 0).le,
    sqrt_pow_sq (axisWeight_pos g hg 1).le,
    sqrt_pow_sq (axisWeight_pos g hg 2).le,
    sqrt_pow_sq (axisWeight_pos g hg 3).le]

def weightedMatrixEntry (g : Gate) (m n : Idx2) : ℂ :=
  (sourceWeight g m n : ℂ) * matrixEntry g.power m n

/-- Source scaling gives the gate's real energy weights with no loss factor. -/
theorem norm_weightedMatrixEntry_sq (g : Gate) (hg : gateOK g = true)
    (m n : Idx2) :
    ‖weightedMatrixEntry g m n‖ ^ 2 =
      energyWeight g m n * ‖matrixEntry g.power m n‖ ^ 2 := by
  rw [weightedMatrixEntry, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (sourceWeight_nonneg g m n), mul_pow, sourceWeight_sq g hg]

/-- Finite actual matrix energy retains the original outgoing and axis weights. -/
theorem finite_weightedMatrixEntry_energy (g : Gate) (hg : gateOK g = true)
    (s : Finset (Idx2 × Idx2)) :
    (∑ mn ∈ s, ‖weightedMatrixEntry g mn.1 mn.2‖ ^ 2) =
      ∑ mn ∈ s, energyWeight g mn.1 mn.2 * ‖matrixEntry g.power mn.1 mn.2‖ ^ 2 := by
  apply Finset.sum_congr rfl
  intro mn _
  exact norm_weightedMatrixEntry_sq g hg mn.1 mn.2

end
end Grothe.UpperChaos.ActualGateMatrixWeights
