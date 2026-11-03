import Grothe.UpperChaos.OriginalHSGaussianMass

/-!
# Tensor product of the two checked physical-pair Gaussian kernels

Agent-ID: codex-2ca4. Source complete; not yet compiled.

The two physical-pair kernels use independent Gaussian sources. Their product
contains four output and four input complex source coordinates altogether,
grouped here by physical pair. The product of their squared norms is integrable
and has mass `nu^4 / (delta0 * delta1)` for every checked original gate.

This evaluates the full uninserted Gaussian tensor kernel. Polynomial insertion,
the Fock coefficient identity, and identification with the historical operator
remain separate obligations.
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

theorem pairDeterminant_pos (g : Gate) (hg : g ∈ gates) (side : Fin 2) :
    0 < pairDeterminant g side :=
  (pair_positive g hg side).determinant

/-- Both determinant factors are strictly positive from gate membership alone. -/
theorem tensor_determinant_pos (g : Gate) (hg : g ∈ gates) :
    0 < pairDeterminant g 0 * pairDeterminant g 1 :=
  mul_pos (pairDeterminant_pos g hg 0) (pairDeterminant_pos g hg 1)

/-- Genuine product integrability follows from the two physical-pair proofs. -/
theorem integrable_tensorWeight (g : Gate) (hg : g ∈ gates) :
    Integrable (tensorWeight g) tensorMeasure := by
  unfold tensorWeight tensorMeasure pairMeasure
  exact (integrable_gateWeight g hg 0).mul_prod (integrable_gateWeight g hg 1)

/-- The full uninserted Gaussian tensor mass is the product of the two
physical-pair masses. No polynomial or coefficient-series identity is assumed. -/
theorem integral_tensorWeight (g : Gate) (hg : g ∈ gates) :
    (∫ zw : PairSources × PairSources, tensorWeight g zw ∂tensorMeasure) =
      nu g.power ^ 4 / (pairDeterminant g 0 * pairDeterminant g 1) := by
  unfold tensorWeight tensorMeasure pairMeasure pairDeterminant
  rw [integral_prod_mul (μ := (gaussC.prod gaussC).prod (gaussC.prod gaussC))
      (ν := (gaussC.prod gaussC).prod (gaussC.prod gaussC))
      (gateWeight g 0) (gateWeight g 1),
    integral_gateWeight g hg 0, integral_gateWeight g hg 1,
    div_mul_div_comm]
  congr 1
  ring

end
end Grothe.UpperChaos.OriginalHSGaussianTensor
