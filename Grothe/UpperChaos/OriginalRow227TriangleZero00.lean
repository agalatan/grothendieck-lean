import Grothe.UpperChaos.OriginalRow227RatioData00
import Grothe.UpperChaos.OriginalRow227TriangleData0000
import Grothe.UpperChaos.OriginalRow227TriangleData0001
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero00
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[0]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root1,
    IU := OriginalRow227TriangleData0000.coefficient0_0, next := OriginalRow227TriangleData0000.coefficient0_1, hS := OriginalRow227TriangleRoots00.root1_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[1]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root2,
    IU := OriginalRow227TriangleData0000.coefficient0_1, next := OriginalRow227TriangleData0000.coefficient0_2, hS := OriginalRow227TriangleRoots00.root2_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[2]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root3,
    IU := OriginalRow227TriangleData0000.coefficient0_2, next := OriginalRow227TriangleData0000.coefficient0_3, hS := OriginalRow227TriangleRoots00.root3_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[3]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root4,
    IU := OriginalRow227TriangleData0000.coefficient0_3, next := OriginalRow227TriangleData0000.coefficient0_4, hS := OriginalRow227TriangleRoots00.root4_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[4]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root5,
    IU := OriginalRow227TriangleData0000.coefficient0_4, next := OriginalRow227TriangleData0000.coefficient0_5, hS := OriginalRow227TriangleRoots00.root5_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[5]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root6,
    IU := OriginalRow227TriangleData0000.coefficient0_5, next := OriginalRow227TriangleData0000.coefficient0_6, hS := OriginalRow227TriangleRoots00.root6_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[6]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root7,
    IU := OriginalRow227TriangleData0000.coefficient0_6, next := OriginalRow227TriangleData0000.coefficient0_7, hS := OriginalRow227TriangleRoots00.root7_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[7]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root8,
    IU := OriginalRow227TriangleData0000.coefficient0_7, next := OriginalRow227TriangleData0000.coefficient0_8, hS := OriginalRow227TriangleRoots00.root8_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[8]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root9,
    IU := OriginalRow227TriangleData0000.coefficient0_8, next := OriginalRow227TriangleData0000.coefficient0_9, hS := OriginalRow227TriangleRoots00.root9_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[9]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root10,
    IU := OriginalRow227TriangleData0000.coefficient0_9, next := OriginalRow227TriangleData0000.coefficient0_10, hS := OriginalRow227TriangleRoots00.root10_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[10]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root11,
    IU := OriginalRow227TriangleData0000.coefficient0_10, next := OriginalRow227TriangleData0000.coefficient0_11, hS := OriginalRow227TriangleRoots00.root11_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[11]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root12,
    IU := OriginalRow227TriangleData0000.coefficient0_11, next := OriginalRow227TriangleData0000.coefficient0_12, hS := OriginalRow227TriangleRoots00.root12_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[12]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root13,
    IU := OriginalRow227TriangleData0000.coefficient0_12, next := OriginalRow227TriangleData0000.coefficient0_13, hS := OriginalRow227TriangleRoots00.root13_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[13]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root14,
    IU := OriginalRow227TriangleData0000.coefficient0_13, next := OriginalRow227TriangleData0000.coefficient0_14, hS := OriginalRow227TriangleRoots00.root14_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[14]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root15,
    IU := OriginalRow227TriangleData0000.coefficient0_14, next := OriginalRow227TriangleData0000.coefficient0_15, hS := OriginalRow227TriangleRoots00.root15_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[15]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root16,
    IU := OriginalRow227TriangleData0000.coefficient0_15, next := OriginalRow227TriangleData0000.coefficient0_16, hS := OriginalRow227TriangleRoots00.root16_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[16]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root17,
    IU := OriginalRow227TriangleData0000.coefficient0_16, next := OriginalRow227TriangleData0000.coefficient0_17, hS := OriginalRow227TriangleRoots00.root17_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[17]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root18,
    IU := OriginalRow227TriangleData0000.coefficient0_17, next := OriginalRow227TriangleData0000.coefficient0_18, hS := OriginalRow227TriangleRoots00.root18_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[18]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root19,
    IU := OriginalRow227TriangleData0000.coefficient0_18, next := OriginalRow227TriangleData0000.coefficient0_19, hS := OriginalRow227TriangleRoots00.root19_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[19]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root20,
    IU := OriginalRow227TriangleData0000.coefficient0_19, next := OriginalRow227TriangleData0000.coefficient0_20, hS := OriginalRow227TriangleRoots00.root20_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[20]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root21,
    IU := OriginalRow227TriangleData0000.coefficient0_20, next := OriginalRow227TriangleData0000.coefficient0_21, hS := OriginalRow227TriangleRoots00.root21_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[21]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root22,
    IU := OriginalRow227TriangleData0000.coefficient0_21, next := OriginalRow227TriangleData0000.coefficient0_22, hS := OriginalRow227TriangleRoots00.root22_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[22]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root23,
    IU := OriginalRow227TriangleData0000.coefficient0_22, next := OriginalRow227TriangleData0000.coefficient0_23, hS := OriginalRow227TriangleRoots00.root23_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[23]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root24,
    IU := OriginalRow227TriangleData0000.coefficient0_23, next := OriginalRow227TriangleData0000.coefficient0_24, hS := OriginalRow227TriangleRoots00.root24_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[24]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root25,
    IU := OriginalRow227TriangleData0000.coefficient0_24, next := OriginalRow227TriangleData0000.coefficient0_25, hS := OriginalRow227TriangleRoots00.root25_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[25]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root26,
    IU := OriginalRow227TriangleData0000.coefficient0_25, next := OriginalRow227TriangleData0000.coefficient0_26, hS := OriginalRow227TriangleRoots00.root26_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[26]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root27,
    IU := OriginalRow227TriangleData0000.coefficient0_26, next := OriginalRow227TriangleData0000.coefficient0_27, hS := OriginalRow227TriangleRoots00.root27_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[27]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root28,
    IU := OriginalRow227TriangleData0000.coefficient0_27, next := OriginalRow227TriangleData0000.coefficient0_28, hS := OriginalRow227TriangleRoots00.root28_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[28]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root29,
    IU := OriginalRow227TriangleData0000.coefficient0_28, next := OriginalRow227TriangleData0000.coefficient0_29, hS := OriginalRow227TriangleRoots00.root29_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[29]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root30,
    IU := OriginalRow227TriangleData0000.coefficient0_29, next := OriginalRow227TriangleData0000.coefficient0_30, hS := OriginalRow227TriangleRoots00.root30_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[30]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root31,
    IU := OriginalRow227TriangleData0000.coefficient0_30, next := OriginalRow227TriangleData0000.coefficient0_31, hS := OriginalRow227TriangleRoots00.root31_pos },
  { IA := shift, IR := (OriginalRow227RatioData00.checkpoints[31]'(by rw [OriginalRow227RatioData00.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots00.root32,
    IU := OriginalRow227TriangleData0000.coefficient0_31, next := OriginalRow227TriangleData0001.coefficient0_32, hS := OriginalRow227TriangleRoots00.root32_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero00

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero00.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
