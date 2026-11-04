import Grothe.UpperChaos.ProductionF0Source
import Grothe.UpperChaos.ConcreteLinearEnergy
import Grothe.UpperChaos.ProductionSmoothingApprox
import Grothe.UpperChaos.SelectedEnergyApprox
import Lean.Util.CollectAxioms

set_option warningAsError true

/-! Exact attachment of a retained F0 coefficient family to the actual
production response. The numerical F0 source is an explicit parameter, not
identified with a Taylor center. All equalities add the actual frozen
correction once, before smoothing. Agent-ID: codex-7c2e. -/

open MeasureTheory Grothe.Upper
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

/-- The correction has exactly 91 grades; the retained F0 head has 251. -/
def retainedProductionCoeff (a0 : ℕ → ℕ → ℕ → ℚ) (q c d : ℕ) : ℚ :=
  a0 q c d + if q < 91 then frozenCorrectionCoeff q c d else 0

/-- No approximation or equality to a saved matrix is needed to insert the
actual finite correction into the degree-501 retained source. -/
theorem retainedProduction_eq (a0 : ℕ → ℕ → ℕ → ℚ) :
    gradedHermite 251 (retainedProductionCoeff a0) =
      gradedHermite 251 a0 + frozenCorrection := by
  unfold retainedProductionCoeff
  rw [gradedHermite_add]
  rw [← gradedHermite_extend 91 251 (by norm_num) frozenCorrectionCoeff]
  rfl

/-- The frozen correction cancels exactly from the approximation residual. -/
theorem productionRaw_sub_retained (a0 : ℕ → ℕ → ℕ → ℚ) :
    productionRaw - gradedHermite 251 (retainedProductionCoeff a0) =
      (chargeFn_F0 phiBound).memLp.toLp F0 - gradedHermite 251 a0 := by
  rw [retainedProduction_eq, productionRaw]
  abel

/-- Every retained production coefficient uses the actual Gaussian integral
and the concrete frozen lookup, including zero extension in grades 91--250. -/
theorem inner_productionRaw_graded (q : Fin 251)
    (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
    ⟪hvec2 (gradedMode q c d), productionRaw⟫_ℂ =
      baseGradedCoefficient q c d +
        ((if q.val < 91 then frozenCorrectionCoeff q c d else 0 : ℚ) : ℂ) := by
  have hd := d.isLt
  have hc := c.isLt
  have hanti : q.val - d.val + d.val = q.val := by omega
  have hholo : q.val + 1 - c.val + c.val = q.val + 1 := by omega
  rw [productionRaw, inner_add_right]
  have hbase := inner_toLp2 (memLp_hfun2 (gradedMode q c d))
    (chargeFn_F0 phiBound).memLp
  change ⟪hvec2 (gradedMode q c d), (chargeFn_F0 phiBound).memLp.toLp F0⟫_ℂ =
    baseGradedCoefficient q c d at hbase
  rw [hbase, frozenCorrection, inner_hvec2_gradedHermite]
  simp only [gradedMode, hanti, hholo, and_true]
  split_ifs <;> simp

/-- The exact rational matrix approximation applied to the retained source. -/
def retainedSmoothed (a0 : ℕ → ℕ → ℕ → ℚ) : Lp ℂ 2 mu2 :=
  gradedHermite 251 (PolynomialEntries.productionSmoothedCoeff
    (retainedProductionCoeff a0))

/-- The actual response residual separates into the F0 residual and the
already-proved rational smoothing error. This is an equality, with no
numerical evaluator or source-identification premise. -/
theorem response_sub_retainedSmoothed (a0 : ℕ → ℕ → ℕ → ℚ) :
    (memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn) - retainedSmoothed a0 =
      smoothOp ((chargeFn_F0 phiBound).memLp.toLp F0 - gradedHermite 251 a0) +
      (smoothOp (gradedHermite 251 (retainedProductionCoeff a0)) -
        retainedSmoothed a0) := by
  rw [toLp_Xfun_eq_smooth_productionRaw,
    ← productionRaw_sub_retained a0, map_sub]
  abel

/-- The full-head residual uses the existing 4e-15 relative smoothing
reserve; numerical approximation of F0 remains visible in the first term. -/
theorem projected_response_error (a0 : ℕ → ℕ → ℕ → ℚ) :
    ‖projOn (energyHeadModes (headIdx 501))
      ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn) - retainedSmoothed a0)‖ ≤
      ‖projOn (energyHeadModes (headIdx 501))
        (smoothOp ((chargeFn_F0 phiBound).memLp.toLp F0 - gradedHermite 251 a0))‖ +
      (4 / 1000000000000000 : ℝ) *
        ‖gradedHermite 251 (retainedProductionCoeff a0)‖ := by
  rw [response_sub_retainedSmoothed, map_add]
  apply (norm_add_le _ _).trans
  refine add_le_add le_rfl ?_
  have hp := (modeSpace (energyHeadModes (headIdx 501))).norm_starProjection_apply_le
    (smoothOp (gradedHermite 251 (retainedProductionCoeff a0)) - retainedSmoothed a0)
  exact hp.trans (PolynomialEntries.production_smoothing_error 251 (by omega)
    (retainedProductionCoeff a0))

end
end Grothe.UpperChaos.FixedChaosSmoothing

/-! Imported production proof dependencies are audited explicitly.
The existing phi/rounding leaves below are not a Gaussian error certificate. -/
run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.inner_productionRaw_graded, ``Grothe.UpperChaos.FixedChaosSmoothing.projected_response_error] do
    let dependencies ← Lean.collectAxioms target
    Lean.logInfo m!"Production source audit {target}: {dependencies}"
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do
      throwError m!"Unexpected axioms in {target}: {unexpected}"
