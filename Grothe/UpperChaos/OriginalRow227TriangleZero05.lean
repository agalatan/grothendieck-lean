import Grothe.UpperChaos.OriginalRow227RatioData05
import Grothe.UpperChaos.OriginalRow227TriangleData0005
import Grothe.UpperChaos.OriginalRow227TriangleData0006
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero05
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[0]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root161,
    IU := OriginalRow227TriangleData0005.coefficient0_160, next := OriginalRow227TriangleData0005.coefficient0_161, hS := OriginalRow227TriangleRoots05.root161_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[1]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root162,
    IU := OriginalRow227TriangleData0005.coefficient0_161, next := OriginalRow227TriangleData0005.coefficient0_162, hS := OriginalRow227TriangleRoots05.root162_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[2]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root163,
    IU := OriginalRow227TriangleData0005.coefficient0_162, next := OriginalRow227TriangleData0005.coefficient0_163, hS := OriginalRow227TriangleRoots05.root163_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[3]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root164,
    IU := OriginalRow227TriangleData0005.coefficient0_163, next := OriginalRow227TriangleData0005.coefficient0_164, hS := OriginalRow227TriangleRoots05.root164_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[4]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root165,
    IU := OriginalRow227TriangleData0005.coefficient0_164, next := OriginalRow227TriangleData0005.coefficient0_165, hS := OriginalRow227TriangleRoots05.root165_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[5]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root166,
    IU := OriginalRow227TriangleData0005.coefficient0_165, next := OriginalRow227TriangleData0005.coefficient0_166, hS := OriginalRow227TriangleRoots05.root166_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[6]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root167,
    IU := OriginalRow227TriangleData0005.coefficient0_166, next := OriginalRow227TriangleData0005.coefficient0_167, hS := OriginalRow227TriangleRoots05.root167_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[7]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root168,
    IU := OriginalRow227TriangleData0005.coefficient0_167, next := OriginalRow227TriangleData0005.coefficient0_168, hS := OriginalRow227TriangleRoots05.root168_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[8]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root169,
    IU := OriginalRow227TriangleData0005.coefficient0_168, next := OriginalRow227TriangleData0005.coefficient0_169, hS := OriginalRow227TriangleRoots05.root169_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[9]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root170,
    IU := OriginalRow227TriangleData0005.coefficient0_169, next := OriginalRow227TriangleData0005.coefficient0_170, hS := OriginalRow227TriangleRoots05.root170_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[10]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root171,
    IU := OriginalRow227TriangleData0005.coefficient0_170, next := OriginalRow227TriangleData0005.coefficient0_171, hS := OriginalRow227TriangleRoots05.root171_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[11]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root172,
    IU := OriginalRow227TriangleData0005.coefficient0_171, next := OriginalRow227TriangleData0005.coefficient0_172, hS := OriginalRow227TriangleRoots05.root172_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[12]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root173,
    IU := OriginalRow227TriangleData0005.coefficient0_172, next := OriginalRow227TriangleData0005.coefficient0_173, hS := OriginalRow227TriangleRoots05.root173_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[13]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root174,
    IU := OriginalRow227TriangleData0005.coefficient0_173, next := OriginalRow227TriangleData0005.coefficient0_174, hS := OriginalRow227TriangleRoots05.root174_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[14]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root175,
    IU := OriginalRow227TriangleData0005.coefficient0_174, next := OriginalRow227TriangleData0005.coefficient0_175, hS := OriginalRow227TriangleRoots05.root175_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[15]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root176,
    IU := OriginalRow227TriangleData0005.coefficient0_175, next := OriginalRow227TriangleData0005.coefficient0_176, hS := OriginalRow227TriangleRoots05.root176_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[16]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root177,
    IU := OriginalRow227TriangleData0005.coefficient0_176, next := OriginalRow227TriangleData0005.coefficient0_177, hS := OriginalRow227TriangleRoots05.root177_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[17]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root178,
    IU := OriginalRow227TriangleData0005.coefficient0_177, next := OriginalRow227TriangleData0005.coefficient0_178, hS := OriginalRow227TriangleRoots05.root178_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[18]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root179,
    IU := OriginalRow227TriangleData0005.coefficient0_178, next := OriginalRow227TriangleData0005.coefficient0_179, hS := OriginalRow227TriangleRoots05.root179_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[19]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root180,
    IU := OriginalRow227TriangleData0005.coefficient0_179, next := OriginalRow227TriangleData0005.coefficient0_180, hS := OriginalRow227TriangleRoots05.root180_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[20]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root181,
    IU := OriginalRow227TriangleData0005.coefficient0_180, next := OriginalRow227TriangleData0005.coefficient0_181, hS := OriginalRow227TriangleRoots05.root181_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[21]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root182,
    IU := OriginalRow227TriangleData0005.coefficient0_181, next := OriginalRow227TriangleData0005.coefficient0_182, hS := OriginalRow227TriangleRoots05.root182_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[22]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root183,
    IU := OriginalRow227TriangleData0005.coefficient0_182, next := OriginalRow227TriangleData0005.coefficient0_183, hS := OriginalRow227TriangleRoots05.root183_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[23]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root184,
    IU := OriginalRow227TriangleData0005.coefficient0_183, next := OriginalRow227TriangleData0005.coefficient0_184, hS := OriginalRow227TriangleRoots05.root184_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[24]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root185,
    IU := OriginalRow227TriangleData0005.coefficient0_184, next := OriginalRow227TriangleData0005.coefficient0_185, hS := OriginalRow227TriangleRoots05.root185_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[25]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root186,
    IU := OriginalRow227TriangleData0005.coefficient0_185, next := OriginalRow227TriangleData0005.coefficient0_186, hS := OriginalRow227TriangleRoots05.root186_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[26]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root187,
    IU := OriginalRow227TriangleData0005.coefficient0_186, next := OriginalRow227TriangleData0005.coefficient0_187, hS := OriginalRow227TriangleRoots05.root187_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[27]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root188,
    IU := OriginalRow227TriangleData0005.coefficient0_187, next := OriginalRow227TriangleData0005.coefficient0_188, hS := OriginalRow227TriangleRoots05.root188_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[28]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root189,
    IU := OriginalRow227TriangleData0005.coefficient0_188, next := OriginalRow227TriangleData0005.coefficient0_189, hS := OriginalRow227TriangleRoots05.root189_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[29]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root190,
    IU := OriginalRow227TriangleData0005.coefficient0_189, next := OriginalRow227TriangleData0005.coefficient0_190, hS := OriginalRow227TriangleRoots05.root190_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[30]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root191,
    IU := OriginalRow227TriangleData0005.coefficient0_190, next := OriginalRow227TriangleData0005.coefficient0_191, hS := OriginalRow227TriangleRoots05.root191_pos },
  { IA := shift, IR := (OriginalRow227RatioData05.checkpoints[31]'(by rw [OriginalRow227RatioData05.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots05.root192,
    IU := OriginalRow227TriangleData0005.coefficient0_191, next := OriginalRow227TriangleData0006.coefficient0_192, hS := OriginalRow227TriangleRoots05.root192_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero05

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero05.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
