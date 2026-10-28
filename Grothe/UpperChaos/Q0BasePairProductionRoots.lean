import Grothe.UpperChaos.Q0BasePairProductionBridge
import Grothe.UpperChaos.Q0BasePairRoot2Integral
import Grothe.UpperChaos.Q0BasePairRoot6Integral
import Grothe.UpperChaos.Q0BasePairRoot7Integral
import Grothe.UpperChaos.Q0BasePairRoot10Integral
import Grothe.UpperChaos.Q0BasePairRoot11Integral

/-!
# Production-kernel enclosures on five complete retained roots

Agent-ID: codex-2ca4.

Every conclusion uses the actual retained production kernels at Taylor
index zero, the canonical fixed radial roots, and the original interval
sums. There are no source-model, leaf-enclosure, or numerical premises.
No source-omission reserve or Gaussian normalization is charged here.
-/

open LeanCert.Core

namespace Grothe.UpperChaos.Q0BasePairProductionRoots

open AdaptiveRetainedCoefficient Q0BasePairKernelContinuity
open LeanCertProductionPanel Q0CompanionBaseQuadrature

private theorem finiteLaplaceEta_eq :
    finiteLaplaceEta = (1 / 1000000000000000 : ℝ) := by
  norm_num [finiteLaplaceEta]

/-- Both production kernel integrals on the whole direct root of strip 1. -/
theorem root2_integrals_mem :
    (regularRoot 1).integral (regularKernel q0Index 0) ∈
        Q0BasePairRoot2Integral.firstInterval ∧
      (regularRoot 1).integral (regularKernel companionIndex 0) ∈
        Q0BasePairRoot2Integral.companionInterval := by
  have h := Q0BasePairProductionBridge.direct_integral_pair
    (regularRoot 1) (regularRoot_valid 1)
    (by decide +kernel) (by decide +kernel)
  rw [h.1, h.2, finiteLaplaceEta_eq]
  exact Q0BasePairRoot2Integral.fixed_root_integrals_mem

/-- Both production kernel integrals on the whole direct root of strip 3. -/
theorem root6_integrals_mem :
    (regularRoot 3).integral (regularKernel q0Index 0) ∈
        Q0BasePairRoot6Integral.firstInterval ∧
      (regularRoot 3).integral (regularKernel companionIndex 0) ∈
        Q0BasePairRoot6Integral.companionInterval := by
  have h := Q0BasePairProductionBridge.direct_integral_pair
    (regularRoot 3) (regularRoot_valid 3)
    (by decide +kernel) (by decide +kernel)
  rw [h.1, h.2, finiteLaplaceEta_eq]
  exact Q0BasePairRoot6Integral.fixed_root_integrals_mem

/-- Both production kernel integrals on the whole reciprocal root of strip 3. -/
theorem root7_integrals_mem :
    (reciprocalRoot 3).integral (reciprocalRealKernel q0Index 0) ∈
        Q0BasePairRoot7Integral.firstInterval ∧
      (reciprocalRoot 3).integral (reciprocalRealKernel companionIndex 0) ∈
        Q0BasePairRoot7Integral.companionInterval := by
  have h := Q0BasePairProductionBridge.reciprocal_integral_pair
    (reciprocalRoot 3) (reciprocalRoot_valid 3)
    (by decide +kernel) (by decide +kernel)
  rw [h.1, h.2, finiteLaplaceEta_eq]
  exact Q0BasePairRoot7Integral.fixed_root_integrals_mem

/-- Both production kernel integrals on the whole direct root of strip 5. -/
theorem root10_integrals_mem :
    (regularRoot 5).integral (regularKernel q0Index 0) ∈
        Q0BasePairRoot10Integral.firstInterval ∧
      (regularRoot 5).integral (regularKernel companionIndex 0) ∈
        Q0BasePairRoot10Integral.companionInterval := by
  have h := Q0BasePairProductionBridge.direct_integral_pair
    (regularRoot 5) (regularRoot_valid 5)
    (by decide +kernel) (by decide +kernel)
  rw [h.1, h.2, finiteLaplaceEta_eq]
  exact Q0BasePairRoot10Integral.fixed_root_integrals_mem

/-- Both production kernel integrals on the whole reciprocal root of strip 5. -/
theorem root11_integrals_mem :
    (reciprocalRoot 5).integral (reciprocalRealKernel q0Index 0) ∈
        Q0BasePairRoot11Integral.firstInterval ∧
      (reciprocalRoot 5).integral (reciprocalRealKernel companionIndex 0) ∈
        Q0BasePairRoot11Integral.companionInterval := by
  have h := Q0BasePairProductionBridge.reciprocal_integral_pair
    (reciprocalRoot 5) (reciprocalRoot_valid 5)
    (by decide +kernel) (by decide +kernel)
  rw [h.1, h.2]
  have hi := Q0BasePairRoot11Integral.integrals_mem finiteLaplaceEta
  rw [Q0BasePairRoot11Integral.root_eq_fixed] at hi
  have hfirst :
      (fun s x => Q0BasePairKernel.reciprocalFirst finiteLaplaceEta s
        (LeanCertProductionProfile.q0Kappa s) x) = reciprocalFirst finiteLaplaceEta := by
    funext s x
    rfl
  have hcompanion :
      (fun s x => Q0BasePairKernel.reciprocalCompanion finiteLaplaceEta s
        (LeanCertProductionProfile.q0Kappa s) x) = reciprocalCompanion finiteLaplaceEta := by
    funext s x
    rfl
  simpa only [hfirst, hcompanion] using hi

end Grothe.UpperChaos.Q0BasePairProductionRoots
