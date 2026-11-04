import Grothe.UpperChaos.OriginalRow227RatioData04
import Grothe.UpperChaos.OriginalRow227TriangleData0004
import Grothe.UpperChaos.OriginalRow227TriangleData0005
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero04
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[0]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root129,
    IU := OriginalRow227TriangleData0004.coefficient0_128, next := OriginalRow227TriangleData0004.coefficient0_129, hS := OriginalRow227TriangleRoots04.root129_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[1]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root130,
    IU := OriginalRow227TriangleData0004.coefficient0_129, next := OriginalRow227TriangleData0004.coefficient0_130, hS := OriginalRow227TriangleRoots04.root130_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[2]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root131,
    IU := OriginalRow227TriangleData0004.coefficient0_130, next := OriginalRow227TriangleData0004.coefficient0_131, hS := OriginalRow227TriangleRoots04.root131_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[3]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root132,
    IU := OriginalRow227TriangleData0004.coefficient0_131, next := OriginalRow227TriangleData0004.coefficient0_132, hS := OriginalRow227TriangleRoots04.root132_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[4]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root133,
    IU := OriginalRow227TriangleData0004.coefficient0_132, next := OriginalRow227TriangleData0004.coefficient0_133, hS := OriginalRow227TriangleRoots04.root133_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[5]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root134,
    IU := OriginalRow227TriangleData0004.coefficient0_133, next := OriginalRow227TriangleData0004.coefficient0_134, hS := OriginalRow227TriangleRoots04.root134_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[6]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root135,
    IU := OriginalRow227TriangleData0004.coefficient0_134, next := OriginalRow227TriangleData0004.coefficient0_135, hS := OriginalRow227TriangleRoots04.root135_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[7]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root136,
    IU := OriginalRow227TriangleData0004.coefficient0_135, next := OriginalRow227TriangleData0004.coefficient0_136, hS := OriginalRow227TriangleRoots04.root136_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[8]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root137,
    IU := OriginalRow227TriangleData0004.coefficient0_136, next := OriginalRow227TriangleData0004.coefficient0_137, hS := OriginalRow227TriangleRoots04.root137_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[9]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root138,
    IU := OriginalRow227TriangleData0004.coefficient0_137, next := OriginalRow227TriangleData0004.coefficient0_138, hS := OriginalRow227TriangleRoots04.root138_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[10]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root139,
    IU := OriginalRow227TriangleData0004.coefficient0_138, next := OriginalRow227TriangleData0004.coefficient0_139, hS := OriginalRow227TriangleRoots04.root139_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[11]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root140,
    IU := OriginalRow227TriangleData0004.coefficient0_139, next := OriginalRow227TriangleData0004.coefficient0_140, hS := OriginalRow227TriangleRoots04.root140_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[12]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root141,
    IU := OriginalRow227TriangleData0004.coefficient0_140, next := OriginalRow227TriangleData0004.coefficient0_141, hS := OriginalRow227TriangleRoots04.root141_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[13]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root142,
    IU := OriginalRow227TriangleData0004.coefficient0_141, next := OriginalRow227TriangleData0004.coefficient0_142, hS := OriginalRow227TriangleRoots04.root142_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[14]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root143,
    IU := OriginalRow227TriangleData0004.coefficient0_142, next := OriginalRow227TriangleData0004.coefficient0_143, hS := OriginalRow227TriangleRoots04.root143_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[15]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root144,
    IU := OriginalRow227TriangleData0004.coefficient0_143, next := OriginalRow227TriangleData0004.coefficient0_144, hS := OriginalRow227TriangleRoots04.root144_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[16]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root145,
    IU := OriginalRow227TriangleData0004.coefficient0_144, next := OriginalRow227TriangleData0004.coefficient0_145, hS := OriginalRow227TriangleRoots04.root145_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[17]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root146,
    IU := OriginalRow227TriangleData0004.coefficient0_145, next := OriginalRow227TriangleData0004.coefficient0_146, hS := OriginalRow227TriangleRoots04.root146_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[18]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root147,
    IU := OriginalRow227TriangleData0004.coefficient0_146, next := OriginalRow227TriangleData0004.coefficient0_147, hS := OriginalRow227TriangleRoots04.root147_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[19]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root148,
    IU := OriginalRow227TriangleData0004.coefficient0_147, next := OriginalRow227TriangleData0004.coefficient0_148, hS := OriginalRow227TriangleRoots04.root148_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[20]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root149,
    IU := OriginalRow227TriangleData0004.coefficient0_148, next := OriginalRow227TriangleData0004.coefficient0_149, hS := OriginalRow227TriangleRoots04.root149_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[21]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root150,
    IU := OriginalRow227TriangleData0004.coefficient0_149, next := OriginalRow227TriangleData0004.coefficient0_150, hS := OriginalRow227TriangleRoots04.root150_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[22]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root151,
    IU := OriginalRow227TriangleData0004.coefficient0_150, next := OriginalRow227TriangleData0004.coefficient0_151, hS := OriginalRow227TriangleRoots04.root151_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[23]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root152,
    IU := OriginalRow227TriangleData0004.coefficient0_151, next := OriginalRow227TriangleData0004.coefficient0_152, hS := OriginalRow227TriangleRoots04.root152_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[24]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root153,
    IU := OriginalRow227TriangleData0004.coefficient0_152, next := OriginalRow227TriangleData0004.coefficient0_153, hS := OriginalRow227TriangleRoots04.root153_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[25]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root154,
    IU := OriginalRow227TriangleData0004.coefficient0_153, next := OriginalRow227TriangleData0004.coefficient0_154, hS := OriginalRow227TriangleRoots04.root154_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[26]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root155,
    IU := OriginalRow227TriangleData0004.coefficient0_154, next := OriginalRow227TriangleData0004.coefficient0_155, hS := OriginalRow227TriangleRoots04.root155_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[27]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root156,
    IU := OriginalRow227TriangleData0004.coefficient0_155, next := OriginalRow227TriangleData0004.coefficient0_156, hS := OriginalRow227TriangleRoots04.root156_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[28]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root157,
    IU := OriginalRow227TriangleData0004.coefficient0_156, next := OriginalRow227TriangleData0004.coefficient0_157, hS := OriginalRow227TriangleRoots04.root157_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[29]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root158,
    IU := OriginalRow227TriangleData0004.coefficient0_157, next := OriginalRow227TriangleData0004.coefficient0_158, hS := OriginalRow227TriangleRoots04.root158_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[30]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root159,
    IU := OriginalRow227TriangleData0004.coefficient0_158, next := OriginalRow227TriangleData0004.coefficient0_159, hS := OriginalRow227TriangleRoots04.root159_pos },
  { IA := shift, IR := (OriginalRow227RatioData04.checkpoints[31]'(by rw [OriginalRow227RatioData04.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots04.root160,
    IU := OriginalRow227TriangleData0004.coefficient0_159, next := OriginalRow227TriangleData0005.coefficient0_160, hS := OriginalRow227TriangleRoots04.root160_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero04

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero04.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
