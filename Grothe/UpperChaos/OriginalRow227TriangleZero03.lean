import Grothe.UpperChaos.OriginalRow227RatioData03
import Grothe.UpperChaos.OriginalRow227TriangleData0003
import Grothe.UpperChaos.OriginalRow227TriangleData0004
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero03
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[0]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root97,
    IU := OriginalRow227TriangleData0003.coefficient0_96, next := OriginalRow227TriangleData0003.coefficient0_97, hS := OriginalRow227TriangleRoots03.root97_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[1]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root98,
    IU := OriginalRow227TriangleData0003.coefficient0_97, next := OriginalRow227TriangleData0003.coefficient0_98, hS := OriginalRow227TriangleRoots03.root98_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[2]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root99,
    IU := OriginalRow227TriangleData0003.coefficient0_98, next := OriginalRow227TriangleData0003.coefficient0_99, hS := OriginalRow227TriangleRoots03.root99_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[3]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root100,
    IU := OriginalRow227TriangleData0003.coefficient0_99, next := OriginalRow227TriangleData0003.coefficient0_100, hS := OriginalRow227TriangleRoots03.root100_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[4]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root101,
    IU := OriginalRow227TriangleData0003.coefficient0_100, next := OriginalRow227TriangleData0003.coefficient0_101, hS := OriginalRow227TriangleRoots03.root101_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[5]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root102,
    IU := OriginalRow227TriangleData0003.coefficient0_101, next := OriginalRow227TriangleData0003.coefficient0_102, hS := OriginalRow227TriangleRoots03.root102_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[6]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root103,
    IU := OriginalRow227TriangleData0003.coefficient0_102, next := OriginalRow227TriangleData0003.coefficient0_103, hS := OriginalRow227TriangleRoots03.root103_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[7]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root104,
    IU := OriginalRow227TriangleData0003.coefficient0_103, next := OriginalRow227TriangleData0003.coefficient0_104, hS := OriginalRow227TriangleRoots03.root104_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[8]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root105,
    IU := OriginalRow227TriangleData0003.coefficient0_104, next := OriginalRow227TriangleData0003.coefficient0_105, hS := OriginalRow227TriangleRoots03.root105_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[9]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root106,
    IU := OriginalRow227TriangleData0003.coefficient0_105, next := OriginalRow227TriangleData0003.coefficient0_106, hS := OriginalRow227TriangleRoots03.root106_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[10]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root107,
    IU := OriginalRow227TriangleData0003.coefficient0_106, next := OriginalRow227TriangleData0003.coefficient0_107, hS := OriginalRow227TriangleRoots03.root107_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[11]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root108,
    IU := OriginalRow227TriangleData0003.coefficient0_107, next := OriginalRow227TriangleData0003.coefficient0_108, hS := OriginalRow227TriangleRoots03.root108_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[12]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root109,
    IU := OriginalRow227TriangleData0003.coefficient0_108, next := OriginalRow227TriangleData0003.coefficient0_109, hS := OriginalRow227TriangleRoots03.root109_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[13]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root110,
    IU := OriginalRow227TriangleData0003.coefficient0_109, next := OriginalRow227TriangleData0003.coefficient0_110, hS := OriginalRow227TriangleRoots03.root110_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[14]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root111,
    IU := OriginalRow227TriangleData0003.coefficient0_110, next := OriginalRow227TriangleData0003.coefficient0_111, hS := OriginalRow227TriangleRoots03.root111_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[15]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root112,
    IU := OriginalRow227TriangleData0003.coefficient0_111, next := OriginalRow227TriangleData0003.coefficient0_112, hS := OriginalRow227TriangleRoots03.root112_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[16]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root113,
    IU := OriginalRow227TriangleData0003.coefficient0_112, next := OriginalRow227TriangleData0003.coefficient0_113, hS := OriginalRow227TriangleRoots03.root113_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[17]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root114,
    IU := OriginalRow227TriangleData0003.coefficient0_113, next := OriginalRow227TriangleData0003.coefficient0_114, hS := OriginalRow227TriangleRoots03.root114_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[18]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root115,
    IU := OriginalRow227TriangleData0003.coefficient0_114, next := OriginalRow227TriangleData0003.coefficient0_115, hS := OriginalRow227TriangleRoots03.root115_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[19]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root116,
    IU := OriginalRow227TriangleData0003.coefficient0_115, next := OriginalRow227TriangleData0003.coefficient0_116, hS := OriginalRow227TriangleRoots03.root116_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[20]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root117,
    IU := OriginalRow227TriangleData0003.coefficient0_116, next := OriginalRow227TriangleData0003.coefficient0_117, hS := OriginalRow227TriangleRoots03.root117_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[21]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root118,
    IU := OriginalRow227TriangleData0003.coefficient0_117, next := OriginalRow227TriangleData0003.coefficient0_118, hS := OriginalRow227TriangleRoots03.root118_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[22]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root119,
    IU := OriginalRow227TriangleData0003.coefficient0_118, next := OriginalRow227TriangleData0003.coefficient0_119, hS := OriginalRow227TriangleRoots03.root119_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[23]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root120,
    IU := OriginalRow227TriangleData0003.coefficient0_119, next := OriginalRow227TriangleData0003.coefficient0_120, hS := OriginalRow227TriangleRoots03.root120_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[24]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root121,
    IU := OriginalRow227TriangleData0003.coefficient0_120, next := OriginalRow227TriangleData0003.coefficient0_121, hS := OriginalRow227TriangleRoots03.root121_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[25]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root122,
    IU := OriginalRow227TriangleData0003.coefficient0_121, next := OriginalRow227TriangleData0003.coefficient0_122, hS := OriginalRow227TriangleRoots03.root122_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[26]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root123,
    IU := OriginalRow227TriangleData0003.coefficient0_122, next := OriginalRow227TriangleData0003.coefficient0_123, hS := OriginalRow227TriangleRoots03.root123_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[27]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root124,
    IU := OriginalRow227TriangleData0003.coefficient0_123, next := OriginalRow227TriangleData0003.coefficient0_124, hS := OriginalRow227TriangleRoots03.root124_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[28]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root125,
    IU := OriginalRow227TriangleData0003.coefficient0_124, next := OriginalRow227TriangleData0003.coefficient0_125, hS := OriginalRow227TriangleRoots03.root125_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[29]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root126,
    IU := OriginalRow227TriangleData0003.coefficient0_125, next := OriginalRow227TriangleData0003.coefficient0_126, hS := OriginalRow227TriangleRoots03.root126_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[30]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root127,
    IU := OriginalRow227TriangleData0003.coefficient0_126, next := OriginalRow227TriangleData0003.coefficient0_127, hS := OriginalRow227TriangleRoots03.root127_pos },
  { IA := shift, IR := (OriginalRow227RatioData03.checkpoints[31]'(by rw [OriginalRow227RatioData03.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots03.root128,
    IU := OriginalRow227TriangleData0003.coefficient0_127, next := OriginalRow227TriangleData0004.coefficient0_128, hS := OriginalRow227TriangleRoots03.root128_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero03

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero03.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
