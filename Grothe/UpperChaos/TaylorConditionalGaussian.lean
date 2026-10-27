import Grothe.UpperChaos.GradedHermitePhaseSlice
import Grothe.UpperChaos.ConditionalGaussianPolynomial

/-!
# Exact conditional integration of the production Taylor source

Each finite Hermite center and the full inherited phase polynomial enter
through their existing `CPoly` slice. The first-coordinate Gaussian damping
is retained explicitly. Only the auxiliary parameter must be positive;
there is no profile lower bound or numerical approximation hypothesis.

Agent-ID: codex-2ca4
-/

open MeasureTheory Grothe.LowerAnalytic Grothe.Haag
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

private theorem taylorSource_kernel_eq (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (z : ℂ) :
    let ε : ℝ := Grothe.Upper.phaseEpsQ
    let α : ℝ := 1 + (j : ℝ) * ε
    let κ : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2)
    let P : CPoly := taylorSourceSlice phaseTerms j N a z
    (fun w : ℂ => taylorInnerSource j (gradedHermiteFn N a) (z, w) *
      phaseLaplaceKernel (basePhaseArgument (z, w)) t) =
        fun w : ℂ => (Real.exp (-(j : ℝ) * ε * Complex.normSq z) : ℂ) *
          (ev w P * phaseLaplaceKernel (z + (κ : ℂ) * w) t *
            (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)) := by
  dsimp only
  funext w
  rw [taylorInnerSource_gradedHermite_eq_slice]
  simp only [basePhaseArgument]
  ring

private theorem taylor_source_rate_pos (j : ℕ) :
    0 < 1 + (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) := by
  have hε : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by
    norm_num [Grothe.Upper.phaseEpsQ]
  positivity

/-- Every actual Taylor-source slice against the affine phase kernel is integrable. -/
theorem integrable_taylorInnerSource_conditional (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (z : ℂ) (ht : 0 < t) :
    Integrable (fun w : ℂ => taylorInnerSource j (gradedHermiteFn N a) (z, w) *
      phaseLaplaceKernel (basePhaseArgument (z, w)) t) gaussC := by
  rw [taylorSource_kernel_eq]
  exact (integrable_affine_phaseLaplace_polynomial
    (taylorSourceSlice phaseTerms j N a z)
    (1 + (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ))
    (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2))
    t z (taylor_source_rate_pos j) ht).const_mul _

/-- Finite conditional Wick evaluator for the actual source at a fixed first coordinate. -/
def taylorConditionalWick (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (z : ℂ) : ℂ :=
    let ε : ℝ := Grothe.Upper.phaseEpsQ
    let α : ℝ := 1 + (j : ℝ) * ε
    let κ : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2)
    let β : ℝ := α + κ ^ 2 * t
    let μ : ℂ := -((κ * t / β : ℝ) : ℂ) * z
    let P : CPoly := taylorSourceSlice phaseTerms j N a z
    (Real.exp (-(j : ℝ) * ε * Complex.normSq z) : ℂ) *
          (((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ) *
            ∑ s ∈ P.support, P.coeff s *
              (z * shiftedDampedMoment β μ (s 0) (s 1) +
                (κ : ℂ) * shiftedDampedMoment β μ (s 0 + 1) (s 1)))

/-- The production conditional integral is the exact finite shifted Wick sum. -/
theorem integral_taylorInnerSource_conditional (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (z : ℂ) (ht : 0 < t) :
    (∫ w : ℂ, taylorInnerSource j (gradedHermiteFn N a) (z, w) *
      phaseLaplaceKernel (basePhaseArgument (z, w)) t ∂gaussC) =
        taylorConditionalWick j N a t z := by
  dsimp only [taylorConditionalWick]
  rw [taylorSource_kernel_eq, integral_const_mul]
  rw [integral_affine_phaseLaplace_polynomial _ _ _ _ _ (taylor_source_rate_pos j) ht]

end
end Grothe.UpperChaos
