import Grothe.UpperChaos.OriginalRow227RatioData02
import Grothe.UpperChaos.OriginalRow227TriangleData0002
import Grothe.UpperChaos.OriginalRow227TriangleData0003
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero02
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[0]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root65,
    IU := OriginalRow227TriangleData0002.coefficient0_64, next := OriginalRow227TriangleData0002.coefficient0_65, hS := OriginalRow227TriangleRoots02.root65_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[1]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root66,
    IU := OriginalRow227TriangleData0002.coefficient0_65, next := OriginalRow227TriangleData0002.coefficient0_66, hS := OriginalRow227TriangleRoots02.root66_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[2]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root67,
    IU := OriginalRow227TriangleData0002.coefficient0_66, next := OriginalRow227TriangleData0002.coefficient0_67, hS := OriginalRow227TriangleRoots02.root67_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[3]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root68,
    IU := OriginalRow227TriangleData0002.coefficient0_67, next := OriginalRow227TriangleData0002.coefficient0_68, hS := OriginalRow227TriangleRoots02.root68_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[4]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root69,
    IU := OriginalRow227TriangleData0002.coefficient0_68, next := OriginalRow227TriangleData0002.coefficient0_69, hS := OriginalRow227TriangleRoots02.root69_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[5]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root70,
    IU := OriginalRow227TriangleData0002.coefficient0_69, next := OriginalRow227TriangleData0002.coefficient0_70, hS := OriginalRow227TriangleRoots02.root70_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[6]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root71,
    IU := OriginalRow227TriangleData0002.coefficient0_70, next := OriginalRow227TriangleData0002.coefficient0_71, hS := OriginalRow227TriangleRoots02.root71_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[7]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root72,
    IU := OriginalRow227TriangleData0002.coefficient0_71, next := OriginalRow227TriangleData0002.coefficient0_72, hS := OriginalRow227TriangleRoots02.root72_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[8]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root73,
    IU := OriginalRow227TriangleData0002.coefficient0_72, next := OriginalRow227TriangleData0002.coefficient0_73, hS := OriginalRow227TriangleRoots02.root73_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[9]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root74,
    IU := OriginalRow227TriangleData0002.coefficient0_73, next := OriginalRow227TriangleData0002.coefficient0_74, hS := OriginalRow227TriangleRoots02.root74_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[10]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root75,
    IU := OriginalRow227TriangleData0002.coefficient0_74, next := OriginalRow227TriangleData0002.coefficient0_75, hS := OriginalRow227TriangleRoots02.root75_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[11]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root76,
    IU := OriginalRow227TriangleData0002.coefficient0_75, next := OriginalRow227TriangleData0002.coefficient0_76, hS := OriginalRow227TriangleRoots02.root76_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[12]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root77,
    IU := OriginalRow227TriangleData0002.coefficient0_76, next := OriginalRow227TriangleData0002.coefficient0_77, hS := OriginalRow227TriangleRoots02.root77_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[13]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root78,
    IU := OriginalRow227TriangleData0002.coefficient0_77, next := OriginalRow227TriangleData0002.coefficient0_78, hS := OriginalRow227TriangleRoots02.root78_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[14]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root79,
    IU := OriginalRow227TriangleData0002.coefficient0_78, next := OriginalRow227TriangleData0002.coefficient0_79, hS := OriginalRow227TriangleRoots02.root79_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[15]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root80,
    IU := OriginalRow227TriangleData0002.coefficient0_79, next := OriginalRow227TriangleData0002.coefficient0_80, hS := OriginalRow227TriangleRoots02.root80_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[16]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root81,
    IU := OriginalRow227TriangleData0002.coefficient0_80, next := OriginalRow227TriangleData0002.coefficient0_81, hS := OriginalRow227TriangleRoots02.root81_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[17]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root82,
    IU := OriginalRow227TriangleData0002.coefficient0_81, next := OriginalRow227TriangleData0002.coefficient0_82, hS := OriginalRow227TriangleRoots02.root82_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[18]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root83,
    IU := OriginalRow227TriangleData0002.coefficient0_82, next := OriginalRow227TriangleData0002.coefficient0_83, hS := OriginalRow227TriangleRoots02.root83_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[19]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root84,
    IU := OriginalRow227TriangleData0002.coefficient0_83, next := OriginalRow227TriangleData0002.coefficient0_84, hS := OriginalRow227TriangleRoots02.root84_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[20]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root85,
    IU := OriginalRow227TriangleData0002.coefficient0_84, next := OriginalRow227TriangleData0002.coefficient0_85, hS := OriginalRow227TriangleRoots02.root85_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[21]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root86,
    IU := OriginalRow227TriangleData0002.coefficient0_85, next := OriginalRow227TriangleData0002.coefficient0_86, hS := OriginalRow227TriangleRoots02.root86_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[22]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root87,
    IU := OriginalRow227TriangleData0002.coefficient0_86, next := OriginalRow227TriangleData0002.coefficient0_87, hS := OriginalRow227TriangleRoots02.root87_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[23]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root88,
    IU := OriginalRow227TriangleData0002.coefficient0_87, next := OriginalRow227TriangleData0002.coefficient0_88, hS := OriginalRow227TriangleRoots02.root88_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[24]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root89,
    IU := OriginalRow227TriangleData0002.coefficient0_88, next := OriginalRow227TriangleData0002.coefficient0_89, hS := OriginalRow227TriangleRoots02.root89_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[25]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root90,
    IU := OriginalRow227TriangleData0002.coefficient0_89, next := OriginalRow227TriangleData0002.coefficient0_90, hS := OriginalRow227TriangleRoots02.root90_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[26]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root91,
    IU := OriginalRow227TriangleData0002.coefficient0_90, next := OriginalRow227TriangleData0002.coefficient0_91, hS := OriginalRow227TriangleRoots02.root91_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[27]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root92,
    IU := OriginalRow227TriangleData0002.coefficient0_91, next := OriginalRow227TriangleData0002.coefficient0_92, hS := OriginalRow227TriangleRoots02.root92_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[28]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root93,
    IU := OriginalRow227TriangleData0002.coefficient0_92, next := OriginalRow227TriangleData0002.coefficient0_93, hS := OriginalRow227TriangleRoots02.root93_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[29]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root94,
    IU := OriginalRow227TriangleData0002.coefficient0_93, next := OriginalRow227TriangleData0002.coefficient0_94, hS := OriginalRow227TriangleRoots02.root94_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[30]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root95,
    IU := OriginalRow227TriangleData0002.coefficient0_94, next := OriginalRow227TriangleData0002.coefficient0_95, hS := OriginalRow227TriangleRoots02.root95_pos },
  { IA := shift, IR := (OriginalRow227RatioData02.checkpoints[31]'(by rw [OriginalRow227RatioData02.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots02.root96,
    IU := OriginalRow227TriangleData0002.coefficient0_95, next := OriginalRow227TriangleData0003.coefficient0_96, hS := OriginalRow227TriangleRoots02.root96_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero02

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero02.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
