import Grothe.UpperChaos.FixedChaosLinear
import Grothe.UpperChaos.TaylorCenterFunctions

/-!
# The actual linear energies of the frozen production truncation

The first two bidegree energies are exactly squares of two Gaussian integrals
of the production base response, with the finite correction added by exact
coefficient lookup. This is an identity for the actual `Xfun`, not an assertion
that a stored energy entry equals the integral.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.FixedChaosSmoothing

noncomputable section

/-- The actual unsmoothed production truncation as an `L²` vector. -/
def productionRaw : Lp ℂ 2 mu2 :=
  (chargeFn_F0 phiBound).memLp.toLp F0 + frozenCorrection

/-- The first coordinate coefficient, including its exact frozen correction. -/
def productionLinearFirst : ℂ :=
  (∫ u : ℂ × ℂ, conj u.1 * F0 u ∂mu2) + (frozenCorrectionCoeff 0 0 0 : ℂ)

/-- The second coordinate coefficient, including its exact frozen correction. -/
def productionLinearSecond : ℂ :=
  (∫ u : ℂ × ℂ, conj u.2 * F0 u ∂mu2) + (frozenCorrectionCoeff 0 1 0 : ℂ)

theorem toLp_Xfun_eq_smooth_productionRaw :
    (memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
      (Xfun frozenCorrectionFn) = smoothOp productionRaw := by
  change (memLp_smoothFn (chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).meas
    (chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).memLp).toLp
      (smoothFn (fun u => F0 u + frozenCorrectionFn u)) = smoothOp productionRaw
  rw [← smoothOp_toLp' (chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).meas
    (chargeFn_F0v phiBound chargeFn_frozenCorrectionFn).memLp]
  apply congrArg (fun f : Lp ℂ 2 mu2 => smoothOp f)
  calc
    _ = (chargeFn_F0 phiBound).memLp.toLp F0 +
        chargeFn_frozenCorrectionFn.memLp.toLp frozenCorrectionFn :=
      MemLp.toLp_add (chargeFn_F0 phiBound).memLp chargeFn_frozenCorrectionFn.memLp
    _ = productionRaw := by
      rw [toLp_frozenCorrectionFn]
      rfl

theorem chargeOne_productionRaw : ChargeOne productionRaw := by
  intro i hi
  rw [productionRaw, inner_add_right,
    chargeOne_toLp (chargeFn_F0 phiBound).memLp (chargeFn_F0 phiBound).rot i hi,
    frozenCorrection, inner_gradedHermite_eq_zero_of_charge 91 frozenCorrectionCoeff i hi]
  exact add_zero 0

theorem inner_productionRaw_first :
    ⟪hvec2 (linearMode 0), productionRaw⟫_ℂ = productionLinearFirst := by
  rw [productionRaw, inner_add_right]
  have hbase := inner_toLp2 (memLp_hfun2 (linearMode 0)) (chargeFn_F0 phiBound).memLp
  change ⟪hvec2 (linearMode 0), (chargeFn_F0 phiBound).memLp.toLp F0⟫_ℂ = _ at hbase
  simp only [hfun2_linearMode_zero] at hbase
  rw [hbase, frozenCorrection, inner_hvec2_gradedHermite]
  simp [linearMode, productionLinearFirst]

theorem inner_productionRaw_second :
    ⟪hvec2 (linearMode 2), productionRaw⟫_ℂ = productionLinearSecond := by
  rw [productionRaw, inner_add_right]
  have hbase := inner_toLp2 (memLp_hfun2 (linearMode 2)) (chargeFn_F0 phiBound).memLp
  change ⟪hvec2 (linearMode 2), (chargeFn_F0 phiBound).memLp.toLp F0⟫_ℂ = _ at hbase
  simp only [hfun2_linearMode_two] at hbase
  rw [hbase, frozenCorrection, inner_hvec2_gradedHermite]
  simp [linearMode, productionLinearSecond]

private theorem inner_productionRaw_conj_first :
    ⟪hvec2 (linearMode 1), productionRaw⟫_ℂ = 0 :=
  chargeOne_productionRaw _ (by decide)

private theorem inner_productionRaw_conj_second :
    ⟪hvec2 (linearMode 3), productionRaw⟫_ℂ = 0 :=
  chargeOne_productionRaw _ (by decide)

/-- Exact first bidegree energy of the actual production truncation. -/
theorem energy_Xfun_one_zero :
    energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
      (Xfun frozenCorrectionFn)) (1, 0) =
      ‖(m00 : ℂ) * productionLinearFirst + (m01 : ℂ) * productionLinearSecond‖ ^ 2 := by
  rw [toLp_Xfun_eq_smooth_productionRaw, energy_smoothOp_one_zero,
    inner_productionRaw_first, inner_productionRaw_second,
    inner_productionRaw_conj_first, inner_productionRaw_conj_second]
  simp

/-- Exact second bidegree energy of the actual production truncation. -/
theorem energy_Xfun_zero_one :
    energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
      (Xfun frozenCorrectionFn)) (0, 1) =
      ‖(m01 : ℂ) * productionLinearFirst + (m11 : ℂ) * productionLinearSecond‖ ^ 2 := by
  rw [toLp_Xfun_eq_smooth_productionRaw, energy_smoothOp_zero_one,
    inner_productionRaw_first, inner_productionRaw_second,
    inner_productionRaw_conj_first, inner_productionRaw_conj_second]
  simp

end
end Grothe.UpperChaos.FixedChaosSmoothing
