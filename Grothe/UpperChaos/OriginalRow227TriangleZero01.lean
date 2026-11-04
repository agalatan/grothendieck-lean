import Grothe.UpperChaos.OriginalRow227RatioData01
import Grothe.UpperChaos.OriginalRow227TriangleData0001
import Grothe.UpperChaos.OriginalRow227TriangleData0002
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero01
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[0]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root33,
    IU := OriginalRow227TriangleData0001.coefficient0_32, next := OriginalRow227TriangleData0001.coefficient0_33, hS := OriginalRow227TriangleRoots01.root33_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[1]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root34,
    IU := OriginalRow227TriangleData0001.coefficient0_33, next := OriginalRow227TriangleData0001.coefficient0_34, hS := OriginalRow227TriangleRoots01.root34_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[2]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root35,
    IU := OriginalRow227TriangleData0001.coefficient0_34, next := OriginalRow227TriangleData0001.coefficient0_35, hS := OriginalRow227TriangleRoots01.root35_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[3]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root36,
    IU := OriginalRow227TriangleData0001.coefficient0_35, next := OriginalRow227TriangleData0001.coefficient0_36, hS := OriginalRow227TriangleRoots01.root36_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[4]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root37,
    IU := OriginalRow227TriangleData0001.coefficient0_36, next := OriginalRow227TriangleData0001.coefficient0_37, hS := OriginalRow227TriangleRoots01.root37_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[5]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root38,
    IU := OriginalRow227TriangleData0001.coefficient0_37, next := OriginalRow227TriangleData0001.coefficient0_38, hS := OriginalRow227TriangleRoots01.root38_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[6]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root39,
    IU := OriginalRow227TriangleData0001.coefficient0_38, next := OriginalRow227TriangleData0001.coefficient0_39, hS := OriginalRow227TriangleRoots01.root39_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[7]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root40,
    IU := OriginalRow227TriangleData0001.coefficient0_39, next := OriginalRow227TriangleData0001.coefficient0_40, hS := OriginalRow227TriangleRoots01.root40_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[8]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root41,
    IU := OriginalRow227TriangleData0001.coefficient0_40, next := OriginalRow227TriangleData0001.coefficient0_41, hS := OriginalRow227TriangleRoots01.root41_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[9]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root42,
    IU := OriginalRow227TriangleData0001.coefficient0_41, next := OriginalRow227TriangleData0001.coefficient0_42, hS := OriginalRow227TriangleRoots01.root42_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[10]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root43,
    IU := OriginalRow227TriangleData0001.coefficient0_42, next := OriginalRow227TriangleData0001.coefficient0_43, hS := OriginalRow227TriangleRoots01.root43_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[11]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root44,
    IU := OriginalRow227TriangleData0001.coefficient0_43, next := OriginalRow227TriangleData0001.coefficient0_44, hS := OriginalRow227TriangleRoots01.root44_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[12]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root45,
    IU := OriginalRow227TriangleData0001.coefficient0_44, next := OriginalRow227TriangleData0001.coefficient0_45, hS := OriginalRow227TriangleRoots01.root45_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[13]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root46,
    IU := OriginalRow227TriangleData0001.coefficient0_45, next := OriginalRow227TriangleData0001.coefficient0_46, hS := OriginalRow227TriangleRoots01.root46_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[14]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root47,
    IU := OriginalRow227TriangleData0001.coefficient0_46, next := OriginalRow227TriangleData0001.coefficient0_47, hS := OriginalRow227TriangleRoots01.root47_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[15]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root48,
    IU := OriginalRow227TriangleData0001.coefficient0_47, next := OriginalRow227TriangleData0001.coefficient0_48, hS := OriginalRow227TriangleRoots01.root48_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[16]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root49,
    IU := OriginalRow227TriangleData0001.coefficient0_48, next := OriginalRow227TriangleData0001.coefficient0_49, hS := OriginalRow227TriangleRoots01.root49_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[17]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root50,
    IU := OriginalRow227TriangleData0001.coefficient0_49, next := OriginalRow227TriangleData0001.coefficient0_50, hS := OriginalRow227TriangleRoots01.root50_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[18]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root51,
    IU := OriginalRow227TriangleData0001.coefficient0_50, next := OriginalRow227TriangleData0001.coefficient0_51, hS := OriginalRow227TriangleRoots01.root51_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[19]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root52,
    IU := OriginalRow227TriangleData0001.coefficient0_51, next := OriginalRow227TriangleData0001.coefficient0_52, hS := OriginalRow227TriangleRoots01.root52_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[20]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root53,
    IU := OriginalRow227TriangleData0001.coefficient0_52, next := OriginalRow227TriangleData0001.coefficient0_53, hS := OriginalRow227TriangleRoots01.root53_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[21]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root54,
    IU := OriginalRow227TriangleData0001.coefficient0_53, next := OriginalRow227TriangleData0001.coefficient0_54, hS := OriginalRow227TriangleRoots01.root54_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[22]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root55,
    IU := OriginalRow227TriangleData0001.coefficient0_54, next := OriginalRow227TriangleData0001.coefficient0_55, hS := OriginalRow227TriangleRoots01.root55_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[23]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root56,
    IU := OriginalRow227TriangleData0001.coefficient0_55, next := OriginalRow227TriangleData0001.coefficient0_56, hS := OriginalRow227TriangleRoots01.root56_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[24]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root57,
    IU := OriginalRow227TriangleData0001.coefficient0_56, next := OriginalRow227TriangleData0001.coefficient0_57, hS := OriginalRow227TriangleRoots01.root57_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[25]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root58,
    IU := OriginalRow227TriangleData0001.coefficient0_57, next := OriginalRow227TriangleData0001.coefficient0_58, hS := OriginalRow227TriangleRoots01.root58_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[26]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root59,
    IU := OriginalRow227TriangleData0001.coefficient0_58, next := OriginalRow227TriangleData0001.coefficient0_59, hS := OriginalRow227TriangleRoots01.root59_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[27]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root60,
    IU := OriginalRow227TriangleData0001.coefficient0_59, next := OriginalRow227TriangleData0001.coefficient0_60, hS := OriginalRow227TriangleRoots01.root60_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[28]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root61,
    IU := OriginalRow227TriangleData0001.coefficient0_60, next := OriginalRow227TriangleData0001.coefficient0_61, hS := OriginalRow227TriangleRoots01.root61_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[29]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root62,
    IU := OriginalRow227TriangleData0001.coefficient0_61, next := OriginalRow227TriangleData0001.coefficient0_62, hS := OriginalRow227TriangleRoots01.root62_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[30]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root63,
    IU := OriginalRow227TriangleData0001.coefficient0_62, next := OriginalRow227TriangleData0001.coefficient0_63, hS := OriginalRow227TriangleRoots01.root63_pos },
  { IA := shift, IR := (OriginalRow227RatioData01.checkpoints[31]'(by rw [OriginalRow227RatioData01.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots01.root64,
    IU := OriginalRow227TriangleData0001.coefficient0_63, next := OriginalRow227TriangleData0002.coefficient0_64, hS := OriginalRow227TriangleRoots01.root64_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero01

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero01.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
