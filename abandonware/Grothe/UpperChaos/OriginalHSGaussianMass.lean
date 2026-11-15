import Grothe.UpperChaos.DampedQuadraticKernel
import Grothe.UpperChaos.OriginalHSQuadraticForms

/-!
# Bipartite Gaussian mass from a checked parameter gate

Agent-ID: codex-2ca4.

The premise `gateOK g = true` supplies the two positivity hypotheses for the
matrix defined below, with entries `-a*R`, `n*sqrt(R*Q)`, `n*sqrt(R*P)`, and
`-a*sqrt(P*Q)`. The squared holomorphic kernel defined from that matrix, with
prefactor `n`, is integrable and has mass `n^2 / delta a n R P Q`.

No membership in a particular parameter table is required. The defined matrix
and kernel have not been identified with the historical operator `HS_{j,I}`.
That identity, polynomial insertion, the Fock coefficient identity, and the
numerical Hilbert--Schmidt tail estimates remain separate obligations.
-/

open MeasureTheory Grothe.LowerAnalytic

namespace Grothe.UpperChaos.OriginalHSGaussianMass

open OriginalHSCovariance OriginalHSParameterGates OriginalHSParameterSoundness
open OriginalHSQuadraticForms WeightedHSMass

noncomputable section

/-- The first diagonal entry of the weighted holomorphic coupling matrix. -/
def matrix00 (g : Gate) : ℝ :=
  -damping g.power * (g.r : ℝ)

/-- The first-row cross entry, with the second input-coordinate weight. -/
def matrix01 (g : Gate) (side : Fin 2) : ℝ :=
  nu g.power * Real.sqrt ((g.r : ℝ) * axisWeight g (2 * side.val + 1))

/-- The second-row cross entry, with the first input-coordinate weight. -/
def matrix10 (g : Gate) (side : Fin 2) : ℝ :=
  nu g.power * Real.sqrt ((g.r : ℝ) * axisWeight g (2 * side.val))

/-- The second diagonal entry, with both input-coordinate weights. -/
def matrix11 (g : Gate) (side : Fin 2) : ℝ :=
  -damping g.power * Real.sqrt
    (axisWeight g (2 * side.val) * axisWeight g (2 * side.val + 1))

/-- The squared holomorphic kernel for one physical pair of a checked gate. -/
def gateWeight (g : Gate) (side : Fin 2) : (ℂ × ℂ) × (ℂ × ℂ) → ℝ :=
  bipartiteWeight (nu g.power : ℂ)
    (matrix00 g) (matrix01 g side) (matrix10 g side) (matrix11 g side)

private theorem sqrt_shared (R P Q : ℝ) (hR : 0 ≤ R) (hP : 0 ≤ P) :
    Real.sqrt (R * P) * Real.sqrt (P * Q) = P * Real.sqrt (R * Q) := by
  rw [Real.sqrt_mul hR P, Real.sqrt_mul hP Q, Real.sqrt_mul hR Q]
  calc
    _ = (Real.sqrt P * Real.sqrt P) *
        (Real.sqrt R * Real.sqrt Q) := by ring
    _ = _ := by rw [Real.mul_self_sqrt hP]

private theorem matrix_leading_algebra (a n R P : ℝ) (hRP : 0 ≤ R * P) :
    1 - (-a * R) ^ 2 - (n * Real.sqrt (R * P)) ^ 2 =
      1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P := by
  rw [mul_pow, neg_sq, mul_pow, Real.sq_sqrt hRP]
  ring

private theorem matrix_trailing_algebra (a n R P Q : ℝ)
    (hRQ : 0 ≤ R * Q) (hPQ : 0 ≤ P * Q) :
    1 - (n * Real.sqrt (R * Q)) ^ 2 - (-a * Real.sqrt (P * Q)) ^ 2 =
      1 - n ^ 2 * R * Q - a ^ 2 * P * Q := by
  rw [mul_pow, Real.sq_sqrt hRQ, mul_pow, neg_sq, Real.sq_sqrt hPQ]
  ring

private theorem matrix_cross_algebra (a n R P Q : ℝ)
    (hR : 0 ≤ R) (hP : 0 ≤ P) :
    -((-a * R) * (n * Real.sqrt (R * Q)) +
      (n * Real.sqrt (R * P)) * (-a * Real.sqrt (P * Q))) =
      a * n * Real.sqrt (R * Q) * (R + P) := by
  calc
    _ = a * n * (R * Real.sqrt (R * Q) +
        Real.sqrt (R * P) * Real.sqrt (P * Q)) := by ring
    _ = a * n * (R * Real.sqrt (R * Q) + P * Real.sqrt (R * Q)) := by
      rw [sqrt_shared R P Q hR hP]
    _ = _ := by ring

/-- The first entry of `I-BᵀB` is the checked leading rate. -/
theorem matrix_leadingRate_eq (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    1 - matrix00 g ^ 2 - matrix10 g side ^ 2 = leadingRate g side := by
  exact matrix_leading_algebra (damping g.power) (nu g.power)
    (g.r : ℝ) (axisWeight g (2 * side.val))
    (mul_pos (radial_pos g h) (axisWeight_pos g h _)).le

/-- The second entry of `I-BᵀB` is the checked trailing rate. -/
theorem matrix_trailingRate_eq (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    1 - matrix01 g side ^ 2 - matrix11 g side ^ 2 = trailingRate g side := by
  exact matrix_trailing_algebra (damping g.power) (nu g.power) (g.r : ℝ)
    (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1))
    (radicand_pos g h side).le
    (mul_pos (axisWeight_pos g h _) (axisWeight_pos g h _)).le

/-- The off-diagonal entry of `I-BᵀB` has the checked positive-sign convention. -/
theorem matrix_crossRate_eq (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    -(matrix00 g * matrix01 g side + matrix10 g side * matrix11 g side) =
      crossRate g side := by
  exact matrix_cross_algebra (damping g.power) (nu g.power) (g.r : ℝ)
    (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1))
    (radial_pos g h).le (axisWeight_pos g h _).le

/-- The determinant used by Gaussian integration is the checked scalar `delta`. -/
theorem matrix_determinant_eq (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    (1 - matrix00 g ^ 2 - matrix10 g side ^ 2) *
        (1 - matrix01 g side ^ 2 - matrix11 g side ^ 2) -
      (matrix00 g * matrix01 g side + matrix10 g side * matrix11 g side) ^ 2 =
      delta (damping g.power) (nu g.power) (g.r : ℝ)
        (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) := by
  have hcross :
      (matrix00 g * matrix01 g side + matrix10 g side * matrix11 g side) ^ 2 =
        crossRate g side ^ 2 := by
    rw [← matrix_crossRate_eq g h side, neg_sq]
  rw [matrix_leadingRate_eq g h side, matrix_trailingRate_eq g h side, hcross]
  exact actual_block_det (damping g.power) (nu g.power) (g.r : ℝ)
    (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1))
    (radicand_pos g h side).le

private theorem matrix_conditions (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    (0 < 1 - matrix00 g ^ 2 - matrix10 g side ^ 2) ∧
      (0 < (1 - matrix00 g ^ 2 - matrix10 g side ^ 2) *
          (1 - matrix01 g side ^ 2 - matrix11 g side ^ 2) -
        (matrix00 g * matrix01 g side + matrix10 g side * matrix11 g side) ^ 2) := by
  constructor
  · rw [matrix_leadingRate_eq g h side]
    exact leadingRate_pos g h side
  · rw [matrix_determinant_eq g h side]
    exact (pair_positive g h side).determinant

/-- Every checked gate yields an integrable squared bipartite Gaussian kernel. -/
theorem integrable_gateWeight (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    Integrable (gateWeight g side)
      ((gaussC.prod gaussC).prod (gaussC.prod gaussC)) := by
  have hm := matrix_conditions g h side
  exact integrable_bipartiteWeight (nu g.power : ℂ)
    (matrix00 g) (matrix01 g side) (matrix10 g side) (matrix11 g side) hm.1 hm.2

/-- The Gaussian mass of the defined kernel for each checked pair is `nu² / delta`.
This does not assert a polynomial-inserted mass or a Fock coefficient identity. -/
theorem integral_gateWeight (g : Gate) (h : gateOK g = true) (side : Fin 2) :
    (∫ zw : (ℂ × ℂ) × (ℂ × ℂ), gateWeight g side zw
      ∂(gaussC.prod gaussC).prod (gaussC.prod gaussC)) =
      nu g.power ^ 2 /
        delta (damping g.power) (nu g.power) (g.r : ℝ)
          (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) := by
  have hm := matrix_conditions g h side
  simpa only [gateWeight, matrix_determinant_eq g h side,
    Complex.norm_real, Real.norm_eq_abs, sq_abs, div_eq_mul_inv] using
    integral_bipartiteWeight (nu g.power : ℂ)
      (matrix00 g) (matrix01 g side) (matrix10 g side) (matrix11 g side) hm.1 hm.2

end
end Grothe.UpperChaos.OriginalHSGaussianMass
