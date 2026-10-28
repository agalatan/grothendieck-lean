import Grothe.UpperChaos.GroupedRounder
import Grothe.UpperChaos.ThirdCenterKernelEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Proposed actual endpoint audit after the complete third-center replacement.
Draft/unverified: this module must be checked with all source and grade proofs.
The endpoint still has other finite native leaves and analytic hypotheses.
Agent-ID: codex-8c4d. -/
open Lean Elab Command
run_cmd do
  let standard : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let strictTargets : Array Name := #[
    ``Grothe.UpperChaos.ThirdCenterKernelEnergy.size_check,
    ``Grothe.UpperChaos.ThirdCenterKernelEnergy.energy_check,
    ``Grothe.UpperChaos.thirdCenter_source_check,
    ``Grothe.UpperChaos.thirdCenter_energy_check]
  for target in strictTargets do
    let axs ← Lean.collectAxioms target
    logInfo m!"Strict third-center audit {target}: {axs.qsort Name.lt}"
    for ax in axs do
      unless standard.contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
  let remainingNative : Array Name := #[
    `Grothe.Upper.comparison_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.firstCenter_band_energy_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_region_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phase_moment2_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phase_moment4_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phase_moment6_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.rounding_energy_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.secondCenter_band_energy_check._native.native_decide.ax_1_1,
    `Grothe.head_check._native.native_decide.ax_1_1]
  let endpoint := ``Grothe.UpperChaos.fresh_upper_concrete_taylor
  let axs ← Lean.collectAxioms endpoint
  logInfo m!"Fresh actual endpoint audit {endpoint}: {axs.qsort Name.lt}"
  let retired : Array Name := #[
    `Grothe.UpperChaos.thirdCenter_decode_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.thirdCenter_energy_check._native.native_decide.ax_1_1]
  for ax in axs do
    if retired.contains ax then
      throwError m!"Actual endpoint still depends on retired third-center native leaf {ax}"
    unless standard.contains ax || remainingNative.contains ax do
      throwError m!"Actual endpoint {endpoint} has unexpected axiom {ax}"
