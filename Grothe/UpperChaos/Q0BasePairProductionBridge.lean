import Grothe.UpperChaos.Q0BasePairKernelContinuity
import Grothe.UpperChaos.AdaptiveRetainedCoefficient

/-!
# The actual base-pair kernels and the compiled retained kernels

The two formulas arise from the same production quadrature. Equality on the
physical half-plane is obtained without recomputing the general source
compiler: both equalities factor through the existing production kernel.
Continuity supplies the boundary at zero. Reciprocal formulas include the
change-of-variables Jacobian. Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0BasePairProductionBridge

open Set LeanCertProductionPanel Q0CompanionBaseQuadrature
open Q0BasePairKernelContinuity AdaptiveRetainedCoefficient
open RationalUnitRealKernelContinuity

private theorem on_positive (η s u : ℝ) (hs : 0 ≤ s) (hu : 0 < u) :
    unitRealKernel q0Index 0 η s u = directFirst η s u ∧
      unitRealKernel companionIndex 0 η s u = directCompanion η s u := by
  constructor
  · apply Complex.ofReal_injective
    exact (taylorQuadratureKernel_unit_eq_realKernel q0Index 0 η u s hu hs).symm.trans
      (Q0BasePairKernel.first_eq_production η u s hu hs)
  · apply Complex.ofReal_injective
    exact (taylorQuadratureKernel_unit_eq_realKernel companionIndex 0 η u s hu hs).symm.trans
      (Q0BasePairKernel.companion_eq_production η u s hu hs)

private theorem extend_nonnegative (f g : ℝ → ℝ) (hf : Continuous f) (hg : Continuous g)
    (hpos : ∀ u, 0 < u → f u = g u) (u : ℝ) (hu : 0 ≤ u) : f u = g u := by
  have heq : Set.EqOn f g (Ioi 0) := fun u hu => hpos u hu
  apply heq.closure hf hg
  simpa only [closure_Ioi, mem_Ici] using hu

private theorem continuous_slice (F : ℝ → ℝ → ℝ)
    (hF : Continuous (Function.uncurry F)) (s : ℝ) : Continuous (F s) :=
  hF.comp (continuous_const.prodMk continuous_id)

/-- The production compiler and the direct pair agree even at auxiliary zero. -/
theorem direct_pair (η s u : ℝ) (hs : 0 ≤ s) (hu : 0 ≤ u) :
    unitRealKernel q0Index 0 η s u = directFirst η s u ∧
      unitRealKernel companionIndex 0 η s u = directCompanion η s u := by
  constructor
  · exact extend_nonnegative (fun u => unitRealKernel q0Index 0 η s u)
      (fun u => directFirst η s u)
      (continuous_slice (unitRealKernel q0Index 0 η) (continuous_unitRealKernel q0Index 0 η) s)
      (continuous_slice (directFirst η) (continuous_direct_pair η).1 s)
      (fun u hu => (on_positive η s u hs hu).1) u hu
  · exact extend_nonnegative (fun u => unitRealKernel companionIndex 0 η s u)
      (fun u => directCompanion η s u)
      (continuous_slice (unitRealKernel companionIndex 0 η)
        (continuous_unitRealKernel companionIndex 0 η) s)
      (continuous_slice (directCompanion η) (continuous_direct_pair η).2 s)
      (fun u hu => (on_positive η s u hs hu).2) u hu

/-- The reciprocal pair is exactly the compiled kernel after substitution,
including its Jacobian, on every positive auxiliary coordinate. -/
theorem reciprocal_pair (s x : ℝ) (hs : 0 ≤ s) (hx : 0 < x) :
    reciprocalRealKernel q0Index 0 s x = reciprocalFirst finiteLaplaceEta s x ∧
      reciprocalRealKernel companionIndex 0 s x = reciprocalCompanion finiteLaplaceEta s x := by
  have h := direct_pair finiteLaplaceEta s x⁻¹ hs (inv_nonneg.mpr hx.le)
  constructor
  · rw [reciprocalRealKernel, regularKernel, h.1]
    simpa only [directFirst, reciprocalFirst, inv_pow] using
      Q0BasePairKernel.reciprocal_first finiteLaplaceEta s (LeanCertProductionProfile.q0Kappa s) x hx.ne'
  · rw [reciprocalRealKernel, regularKernel, h.2]
    simpa only [directCompanion, reciprocalCompanion, inv_pow] using
      Q0BasePairKernel.reciprocal_companion finiteLaplaceEta s (LeanCertProductionProfile.q0Kappa s) x hx.ne'

/-- Whole direct-cell integrals use the production assembly's kernel. -/
theorem direct_integral_pair (r : AdaptiveRectanglePartition.Rect) (hr : r.Valid)
    (hs : 0 ≤ r.sLo) (hu : 0 ≤ r.auxLo) :
    r.integral (regularKernel q0Index 0) = r.integral (directFirst finiteLaplaceEta) ∧
      r.integral (regularKernel companionIndex 0) =
        r.integral (directCompanion finiteLaplaceEta) := by
  constructor
  · apply r.integral_congr hr
    intro p hp
    exact (direct_pair finiteLaplaceEta p.1 p.2
      ((Rat.cast_nonneg.mpr hs).trans hp.1.1)
      ((Rat.cast_nonneg.mpr hu).trans hp.2.1)).1
  · apply r.integral_congr hr
    intro p hp
    exact (direct_pair finiteLaplaceEta p.1 p.2
      ((Rat.cast_nonneg.mpr hs).trans hp.1.1)
      ((Rat.cast_nonneg.mpr hu).trans hp.2.1)).2

/-- Whole reciprocal-cell integrals include the exact substitution Jacobian. -/
theorem reciprocal_integral_pair (r : AdaptiveRectanglePartition.Rect) (hr : r.Valid)
    (hs : 0 ≤ r.sLo) (hu : 0 < r.auxLo) :
    r.integral (reciprocalRealKernel q0Index 0) =
        r.integral (reciprocalFirst finiteLaplaceEta) ∧
      r.integral (reciprocalRealKernel companionIndex 0) =
        r.integral (reciprocalCompanion finiteLaplaceEta) := by
  constructor
  · apply r.integral_congr hr
    intro p hp
    exact (reciprocal_pair p.1 p.2 ((Rat.cast_nonneg.mpr hs).trans hp.1.1)
      ((Rat.cast_pos.mpr hu).trans_le hp.2.1)).1
  · apply r.integral_congr hr
    intro p hp
    exact (reciprocal_pair p.1 p.2 ((Rat.cast_nonneg.mpr hs).trans hp.1.1)
      ((Rat.cast_pos.mpr hu).trans_le hp.2.1)).2

end Grothe.UpperChaos.Q0BasePairProductionBridge
