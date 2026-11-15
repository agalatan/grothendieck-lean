import Grothe.UpperChaos.OriginalHSGaussianMass

/-!
# Tensor product of the two checked physical-pair Gaussian kernels

Agent-ID: codex-2ca4.

The two physical-pair kernels use independent Gaussian sources. Their product
contains four output and four input complex source coordinates altogether,
grouped here by physical pair. The product of their squared norms is integrable
and has mass `nu^4 / (delta0 * delta1)` from `gateOK g = true` alone.

This evaluates the defined uninserted Gaussian tensor kernel. Identification
with the historical operator `HS_{j,I}`, polynomial insertion, the Fock
coefficient identity, and numerical tail estimates remain separate obligations.
-/

open MeasureTheory Grothe.LowerAnalytic

namespace Grothe.UpperChaos.OriginalHSGaussianTensor

open OriginalHSCovariance OriginalHSParameterGates OriginalHSParameterSoundness
open OriginalHSQuadraticForms OriginalHSGaussianMass

noncomputable section

/-- Two output and two input complex source variables for one physical pair. -/
abbrev PairSources := (ℂ × ℂ) × (ℂ × ℂ)

/-- The four independent standard complex Gaussians of one physical pair. -/
def pairMeasure : Measure PairSources :=
  (gaussC.prod gaussC).prod (gaussC.prod gaussC)

/-- Independent copies of the physical-pair source measures. -/
def tensorMeasure : Measure (PairSources × PairSources) :=
  pairMeasure.prod pairMeasure

/-- The checked determinant for one physical pair. -/
def pairDeterminant (g : Gate) (side : Fin 2) : ℝ :=
  delta (damping g.power) (nu g.power) (g.r : ℝ)
    (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1))

/-- The product of the squared kernels of physical pairs zero and one. -/
def tensorWeight (g : Gate) (zw : PairSources × PairSources) : ℝ :=
  gateWeight g 0 zw.1 * gateWeight g 1 zw.2

/-- Product integrability follows from the two physical-pair proofs. -/
theorem integrable_tensorWeight (g : Gate) (h : gateOK g = true) :
    Integrable (tensorWeight g) tensorMeasure := by
  unfold tensorWeight tensorMeasure pairMeasure
  exact (integrable_gateWeight g h 0).mul_prod (integrable_gateWeight g h 1)

/-- The full uninserted Gaussian tensor mass is the product of the two
physical-pair masses. No polynomial or coefficient-series identity is assumed. -/
theorem integral_tensorWeight (g : Gate) (h : gateOK g = true) :
    (∫ zw : PairSources × PairSources, tensorWeight g zw ∂tensorMeasure) =
      nu g.power ^ 4 / (pairDeterminant g 0 * pairDeterminant g 1) := by
  unfold tensorWeight tensorMeasure pairMeasure pairDeterminant
  rw [integral_prod_mul (μ := (gaussC.prod gaussC).prod (gaussC.prod gaussC))
      (ν := (gaussC.prod gaussC).prod (gaussC.prod gaussC))
      (gateWeight g 0) (gateWeight g 1),
    integral_gateWeight g h 0, integral_gateWeight g h 1,
    div_mul_div_comm]
  congr 1
  ring

end
end Grothe.UpperChaos.OriginalHSGaussianTensor
