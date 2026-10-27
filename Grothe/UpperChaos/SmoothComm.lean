import Grothe.UpperChaos.OUOp
import Grothe.UpperChaos.BandProj

/-!
# The smoothing of the rounding preserves the total degree

On the triple product `((x, Z), W)`, the pairs `(x, ρ(Mx + NZ) + σW)` and `(x, M(ρx + σW) + NZ)` have the same
Gaussian law (`law_comm`): both have covariance `[[I, ρM], [ρM, I]]`, since `M² + N² = I` and `ρ² + σ² = 1`.
Hence the smoothing `S` commutes with the Ornstein–Uhlenbeck smoothing `T_ρ` (`smoothOp_ouOp_comm`). As `T_ρ` has
eigenvalue `ρ^{|i|}` on the Hermite mode `i`, `S` has no matrix elements between different total degrees
(`inner_smoothOp_hvec2_eq_zero`), so it commutes with every projection onto a set of total degrees
(`projOn_smoothOp_comm`). In particular `‖P_I S g‖ = ‖S P_I g‖ ≤ ‖P_I g‖`.
-/

open MeasureTheory ProbabilityTheory Complex
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

open HardyReal

noncomputable section

/-- `((x, Z), W) ↦ (x, ρ(Mx + NZ) + σW)`. -/
def pA (ρ : ℝ) : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  (ContinuousLinearMap.fst ℝ (ℂ × ℂ) (ℂ × ℂ) ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod
    (ouCLM ρ ∘L ((smoothCLM ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod (ContinuousLinearMap.snd ℝ _ (ℂ × ℂ))))

/-- `((x, W), Z) ↦ (x, M(ρx + σW) + NZ)`. -/
def pB (ρ : ℝ) : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  (ContinuousLinearMap.fst ℝ (ℂ × ℂ) (ℂ × ℂ) ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod
    (smoothCLM ∘L ((ouCLM ρ ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod (ContinuousLinearMap.snd ℝ _ (ℂ × ℂ))))

/-- The covariance identity behind `law_comm`. -/
lemma cov_comm {ρ σ : ℝ} (hσ : σ ^ 2 = 1 - ρ ^ 2) (α : Fin 4 → ℝ) :
    (α 0 + ρ * (m00 * α 2 + m01 * α 3)) ^ 2 + (α 1 + ρ * (m01 * α 2 + m11 * α 3)) ^ 2
      + (ρ * (n00 * α 2 + n01 * α 3)) ^ 2 + (ρ * (n01 * α 2 + n11 * α 3)) ^ 2
      + (σ * α 2) ^ 2 + (σ * α 3) ^ 2 =
    (α 0 + ρ * (m00 * α 2 + m01 * α 3)) ^ 2 + (α 1 + ρ * (m01 * α 2 + m11 * α 3)) ^ 2
      + (σ * (m00 * α 2 + m01 * α 3)) ^ 2 + (σ * (m01 * α 2 + m11 * α 3)) ^ 2
      + (n00 * α 2 + n01 * α 3) ^ 2 + (n01 * α 2 + n11 * α 3) ^ 2 := by
  have e : (m00 * α 2 + m01 * α 3) ^ 2 + (m01 * α 2 + m11 * α 3) ^ 2 + (n00 * α 2 + n01 * α 3) ^ 2
      + (n01 * α 2 + n11 * α 3) ^ 2 = α 2 ^ 2 + α 3 ^ 2 := by
    linear_combination α 2 ^ 2 * mn_00 + 2 * α 2 * α 3 * mn_01 + α 3 ^ 2 * mn_11
  linear_combination (α 2 ^ 2 + α 3 ^ 2 - (m00 * α 2 + m01 * α 3) ^ 2 - (m01 * α 2 + m11 * α 3) ^ 2) * hσ
    - (1 - ρ ^ 2) * e

end

end Grothe.UpperChaos
