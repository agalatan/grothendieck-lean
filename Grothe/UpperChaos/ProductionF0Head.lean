import Grothe.UpperChaos.SelectedEnergyApprox
import Grothe.UpperChaos.SmoothComm
import Grothe.UpperChaos.ProductionF0Conditional
import Grothe.UpperChaos.ChargeBandParseval
import Lean.Util.CollectAxioms

set_option warningAsError true

/-! The actual finite Gaussian source, projected before numerical
approximation. The full energy head is not invariant under smoothing:
its condition is n+3m≤501. We use the larger total-degree projection,
which does commute with smoothing, and then project to the energy head.
Agent-ID: codex-7c2e. -/

open MeasureTheory Grothe.Upper
open scoped InnerProductSpace

namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

/-- Convert the complete bounded grade coordinates to the natural-index sums
used by the source and frozen-coefficient contracts. -/
theorem sum_bounded_graded_eq_range {M : Type*} [AddCommMonoid M]
    (N : ℕ) (F : ℕ → ℕ → ℕ → M) :
    (∑ q : Fin N, ∑ c : Fin (q.val + 2), ∑ d : Fin (q.val + 1), F q c d) =
      ∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1), F q c d := by
  rw [← Fin.sum_univ_eq_sum_range
    (fun q => ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), F q c d) N]
  apply Finset.sum_congr rfl
  intro q _
  rw [← Fin.sum_univ_eq_sum_range
    (fun c => ∑ d ∈ Finset.range (q.val + 1), F q c d) (q.val + 2)]
  apply Finset.sum_congr rfl
  intro c _
  exact Fin.sum_univ_eq_sum_range (fun d => F q c d) (q.val + 1)

/-- All modes of total degree at most 501, including the charge-one head. -/
def productionDegreeHead : Set Idx2 := {i | tdeg i ≤ 501}

/-- The actual finite F0 source; it is not a stored numerical center. -/
def productionF0Head : Lp ℂ 2 mu2 :=
  projOn productionDegreeHead (memLp_baseF0.toLp F0)

theorem energyHead_subset_degreeHead :
    energyHeadModes (headIdx 501) ⊆ productionDegreeHead := by
  intro i hi
  change bideg i ∈ headIdx 501 at hi
  rw [mem_headIdx] at hi
  dsimp [bideg] at hi
  change tdeg i ≤ 501
  dsimp [tdeg]
  omega

theorem energyHead_degreeProjection (f : Lp ℂ 2 mu2) :
    projOn (energyHeadModes (headIdx 501)) (projOn productionDegreeHead f) =
      projOn (energyHeadModes (headIdx 501)) f := by
  classical
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_projOn]
  by_cases hi : i ∈ energyHeadModes (headIdx 501)
  · simp only [hi, energyHead_subset_degreeHead hi, ite_true]
  · simp only [hi, ite_false]

theorem degreeProjection_gradedHermite (a : ℕ → ℕ → ℕ → ℚ) :
    projOn productionDegreeHead (gradedHermite 251 a) = gradedHermite 251 a := by
  classical
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_projOn, inner_hvec2_gradedHermite]
  by_cases hi : i.1.2 + i.2.2 < 251 ∧
      i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
  · have ht : i ∈ productionDegreeHead := by
      change tdeg i ≤ 501
      dsimp [tdeg]
      omega
    simp only [hi, ht, ite_true]
  · simp only [hi, ite_false]
    split_ifs <;> rfl

/-- The bound comes from F0 itself, independently of quadrature node mass. -/
theorem productionF0Head_norm : ‖productionF0Head‖ ≤ 1 := by
  exact ((modeSpace productionDegreeHead).norm_starProjection_apply_le
    (memLp_baseF0.toLp F0)).trans norm_baseF0_le_one

/-- Every one of the 251 actual source grades retains its Gaussian coefficient. -/
theorem inner_productionF0Head_graded (q : Fin 251)
    (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
    ⟪hvec2 (gradedMode q c d), productionF0Head⟫_ℂ =
      baseGradedCoefficient q c d := by
  have hm : gradedMode q c d ∈ productionDegreeHead := by
    change tdeg (gradedMode q c d) ≤ 501
    have hd : tdeg (gradedMode q c d) = 2 * (q : ℕ) + 1 := by
      simpa only [tdeg, gradedIdx, bideg, Nat.add_assoc] using
        (gradedIdx_total_degree (N := 251) ⟨q, c, d⟩)
    have hq := q.isLt
    omega
  rw [productionF0Head, inner_projOn, ite_eq_left hm]
  exact inner_toLp2 (memLp_hfun2 (gradedMode q c d)) memLp_baseF0

/-- The full retained-source error is exactly the sum of errors in the
actual Gaussian coefficients. Every complete grade is included; no table,
matrix-identification or approximation hypothesis is used in this identity. -/
theorem norm_productionF0Head_sub_sq (a0 : ℕ → ℕ → ℕ → ℚ) :
    ‖productionF0Head - gradedHermite 251 a0‖ ^ 2 =
      ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1),
          ‖baseGradedCoefficient q c d - (a0 q c d : ℂ)‖ ^ 2 := by
  classical
  have hbase : ChargeOne (memLp_baseF0.toLp F0) :=
    chargeOne_toLp memLp_baseF0 (fun c u hc => F0_rot2 hc u)
  have hresidual : ChargeOne (memLp_baseF0.toLp F0 - gradedHermite 251 a0) := by
    intro i hi
    rw [inner_sub_right, hbase i hi,
      inner_gradedHermite_eq_zero_of_charge 251 a0 i hi, sub_self]
  have hdegree (i : Idx2) (hi : i ∈ productionDegreeHead) :
      (bideg i).1 + (bideg i).2 < 2 * 251 := by
    change tdeg i ≤ 501 at hi
    dsimp only [tdeg, bideg] at hi ⊢
    omega
  have hs : (gradedSupport 251).filter (· ∈ productionDegreeHead) =
      gradedSupport 251 := by
    apply Finset.filter_eq_self.mpr
    intro i hi
    have hd := gradedSupport_total_degree_lt hi
    change tdeg i ≤ 501
    dsimp only [tdeg, bideg] at hd ⊢
    omega
  have hinner (q : Fin 251) (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
      ⟪hvec2 (gradedMode q c d),
        memLp_baseF0.toLp F0 - gradedHermite 251 a0⟫_ℂ =
          baseGradedCoefficient q c d - (a0 q c d : ℂ) := by
    have hc := c.isLt
    have hd := d.isLt
    have hanti : q.val - d.val + d.val = q.val := by omega
    have hholo : q.val + 1 - c.val + c.val = q.val + 1 := by omega
    have hb : ⟪hvec2 (gradedMode q c d), memLp_baseF0.toLp F0⟫_ℂ =
        baseGradedCoefficient q c d :=
      inner_toLp2 (memLp_hfun2 (gradedMode q c d)) memLp_baseF0
    rw [inner_sub_right, hb, inner_hvec2_gradedHermite]
    simp [gradedMode, hanti, hholo, q.isLt]
  have h := norm_projOn_chargeOne_sq_coefficients productionDegreeHead 251
    (memLp_baseF0.toLp F0 - gradedHermite 251 a0) hresidual hdegree
  rw [map_sub, degreeProjection_gradedHermite, hs, sum_gradedSupport] at h
  have hfinite : ‖productionF0Head - gradedHermite 251 a0‖ ^ 2 =
      ∑ q : Fin 251, ∑ c : Fin (q.val + 2), ∑ d : Fin (q.val + 1),
        ‖baseGradedCoefficient q c d - (a0 q c d : ℂ)‖ ^ 2 := by
    simpa only [productionF0Head, hinner] using h
  exact hfinite.trans (sum_bounded_graded_eq_range 251
    (fun q c d => ‖baseGradedCoefficient q c d - (a0 q c d : ℂ)‖ ^ 2))

/-- Total-degree truncation loses nothing in the actual selected response.
In particular, no commutation with the non-rectangular energy head is assumed. -/
theorem selected_smoothing_residual (a0 : ℕ → ℕ → ℕ → ℚ) :
    projOn (energyHeadModes (headIdx 501))
      (smoothOp ((chargeFn_F0 phiBound).memLp.toLp F0 - gradedHermite 251 a0)) =
    projOn (energyHeadModes (headIdx 501))
      (smoothOp (productionF0Head - gradedHermite 251 a0)) := by
  have hc (f : Lp ℂ 2 mu2) :
      projOn productionDegreeHead (smoothOp f) =
        smoothOp (projOn productionDegreeHead f) := by
    apply projOn_smoothOp_comm
    intro i j hij
    change (tdeg i ≤ 501 ↔ tdeg j ≤ 501)
    rw [hij]
  have heq : productionF0Head - gradedHermite 251 a0 =
      projOn productionDegreeHead
        ((chargeFn_F0 phiBound).memLp.toLp F0 - gradedHermite 251 a0) := by
    rw [map_sub, degreeProjection_gradedHermite]
    rfl
  rw [heq, ← hc, energyHead_degreeProjection]

/-- Source approximation controls the selected smoothed residual by
contraction; the 251 orthogonal grades incur no multiplicative count. -/
theorem selected_smoothing_residual_le (a0 : ℕ → ℕ → ℕ → ℚ) :
    ‖projOn (energyHeadModes (headIdx 501))
      (smoothOp ((chargeFn_F0 phiBound).memLp.toLp F0 - gradedHermite 251 a0))‖ ≤
        ‖productionF0Head - gradedHermite 251 a0‖ := by
  rw [selected_smoothing_residual]
  exact ((modeSpace (energyHeadModes (headIdx 501))).norm_starProjection_apply_le
    (smoothOp (productionF0Head - gradedHermite 251 a0))).trans (norm_smoothOp_le _)

end
end Grothe.UpperChaos.FixedChaosSmoothing

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.productionF0Head_norm,
      ``Grothe.UpperChaos.FixedChaosSmoothing.inner_productionF0Head_graded,
      ``Grothe.UpperChaos.FixedChaosSmoothing.norm_productionF0Head_sub_sq] do
    let dependencies ← Lean.collectAxioms target
    Lean.logInfo m!"Actual retained F0 source identity audit {target}: {dependencies}"
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected retained F0 axioms: {unexpected}"

/-! Imported production proof dependencies are audited explicitly.
The existing phi/rounding leaves below are not a Gaussian error certificate. -/
run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.selected_smoothing_residual_le] do
    let dependencies ← Lean.collectAxioms target
    Lean.logInfo m!"Production source audit {target}: {dependencies}"
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do
      throwError m!"Unexpected axioms in {target}: {unexpected}"
