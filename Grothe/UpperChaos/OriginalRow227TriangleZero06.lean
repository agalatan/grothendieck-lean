import Grothe.UpperChaos.OriginalRow227RatioData06
import Grothe.UpperChaos.OriginalRow227TriangleData0006
import Grothe.UpperChaos.OriginalRow227TriangleData0007
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero06
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[0]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root193,
    IU := OriginalRow227TriangleData0006.coefficient0_192, next := OriginalRow227TriangleData0006.coefficient0_193, hS := OriginalRow227TriangleRoots06.root193_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[1]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root194,
    IU := OriginalRow227TriangleData0006.coefficient0_193, next := OriginalRow227TriangleData0006.coefficient0_194, hS := OriginalRow227TriangleRoots06.root194_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[2]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root195,
    IU := OriginalRow227TriangleData0006.coefficient0_194, next := OriginalRow227TriangleData0006.coefficient0_195, hS := OriginalRow227TriangleRoots06.root195_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[3]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root196,
    IU := OriginalRow227TriangleData0006.coefficient0_195, next := OriginalRow227TriangleData0006.coefficient0_196, hS := OriginalRow227TriangleRoots06.root196_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[4]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root197,
    IU := OriginalRow227TriangleData0006.coefficient0_196, next := OriginalRow227TriangleData0006.coefficient0_197, hS := OriginalRow227TriangleRoots06.root197_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[5]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root198,
    IU := OriginalRow227TriangleData0006.coefficient0_197, next := OriginalRow227TriangleData0006.coefficient0_198, hS := OriginalRow227TriangleRoots06.root198_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[6]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root199,
    IU := OriginalRow227TriangleData0006.coefficient0_198, next := OriginalRow227TriangleData0006.coefficient0_199, hS := OriginalRow227TriangleRoots06.root199_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[7]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root200,
    IU := OriginalRow227TriangleData0006.coefficient0_199, next := OriginalRow227TriangleData0006.coefficient0_200, hS := OriginalRow227TriangleRoots06.root200_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[8]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root201,
    IU := OriginalRow227TriangleData0006.coefficient0_200, next := OriginalRow227TriangleData0006.coefficient0_201, hS := OriginalRow227TriangleRoots06.root201_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[9]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root202,
    IU := OriginalRow227TriangleData0006.coefficient0_201, next := OriginalRow227TriangleData0006.coefficient0_202, hS := OriginalRow227TriangleRoots06.root202_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[10]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root203,
    IU := OriginalRow227TriangleData0006.coefficient0_202, next := OriginalRow227TriangleData0006.coefficient0_203, hS := OriginalRow227TriangleRoots06.root203_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[11]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root204,
    IU := OriginalRow227TriangleData0006.coefficient0_203, next := OriginalRow227TriangleData0006.coefficient0_204, hS := OriginalRow227TriangleRoots06.root204_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[12]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root205,
    IU := OriginalRow227TriangleData0006.coefficient0_204, next := OriginalRow227TriangleData0006.coefficient0_205, hS := OriginalRow227TriangleRoots06.root205_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[13]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root206,
    IU := OriginalRow227TriangleData0006.coefficient0_205, next := OriginalRow227TriangleData0006.coefficient0_206, hS := OriginalRow227TriangleRoots06.root206_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[14]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root207,
    IU := OriginalRow227TriangleData0006.coefficient0_206, next := OriginalRow227TriangleData0006.coefficient0_207, hS := OriginalRow227TriangleRoots06.root207_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[15]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root208,
    IU := OriginalRow227TriangleData0006.coefficient0_207, next := OriginalRow227TriangleData0006.coefficient0_208, hS := OriginalRow227TriangleRoots06.root208_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[16]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root209,
    IU := OriginalRow227TriangleData0006.coefficient0_208, next := OriginalRow227TriangleData0006.coefficient0_209, hS := OriginalRow227TriangleRoots06.root209_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[17]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root210,
    IU := OriginalRow227TriangleData0006.coefficient0_209, next := OriginalRow227TriangleData0006.coefficient0_210, hS := OriginalRow227TriangleRoots06.root210_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[18]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root211,
    IU := OriginalRow227TriangleData0006.coefficient0_210, next := OriginalRow227TriangleData0006.coefficient0_211, hS := OriginalRow227TriangleRoots06.root211_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[19]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root212,
    IU := OriginalRow227TriangleData0006.coefficient0_211, next := OriginalRow227TriangleData0006.coefficient0_212, hS := OriginalRow227TriangleRoots06.root212_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[20]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root213,
    IU := OriginalRow227TriangleData0006.coefficient0_212, next := OriginalRow227TriangleData0006.coefficient0_213, hS := OriginalRow227TriangleRoots06.root213_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[21]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root214,
    IU := OriginalRow227TriangleData0006.coefficient0_213, next := OriginalRow227TriangleData0006.coefficient0_214, hS := OriginalRow227TriangleRoots06.root214_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[22]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root215,
    IU := OriginalRow227TriangleData0006.coefficient0_214, next := OriginalRow227TriangleData0006.coefficient0_215, hS := OriginalRow227TriangleRoots06.root215_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[23]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root216,
    IU := OriginalRow227TriangleData0006.coefficient0_215, next := OriginalRow227TriangleData0006.coefficient0_216, hS := OriginalRow227TriangleRoots06.root216_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[24]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root217,
    IU := OriginalRow227TriangleData0006.coefficient0_216, next := OriginalRow227TriangleData0006.coefficient0_217, hS := OriginalRow227TriangleRoots06.root217_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[25]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root218,
    IU := OriginalRow227TriangleData0006.coefficient0_217, next := OriginalRow227TriangleData0006.coefficient0_218, hS := OriginalRow227TriangleRoots06.root218_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[26]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root219,
    IU := OriginalRow227TriangleData0006.coefficient0_218, next := OriginalRow227TriangleData0006.coefficient0_219, hS := OriginalRow227TriangleRoots06.root219_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[27]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root220,
    IU := OriginalRow227TriangleData0006.coefficient0_219, next := OriginalRow227TriangleData0006.coefficient0_220, hS := OriginalRow227TriangleRoots06.root220_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[28]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root221,
    IU := OriginalRow227TriangleData0006.coefficient0_220, next := OriginalRow227TriangleData0006.coefficient0_221, hS := OriginalRow227TriangleRoots06.root221_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[29]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root222,
    IU := OriginalRow227TriangleData0006.coefficient0_221, next := OriginalRow227TriangleData0006.coefficient0_222, hS := OriginalRow227TriangleRoots06.root222_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[30]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root223,
    IU := OriginalRow227TriangleData0006.coefficient0_222, next := OriginalRow227TriangleData0006.coefficient0_223, hS := OriginalRow227TriangleRoots06.root223_pos },
  { IA := shift, IR := (OriginalRow227RatioData06.checkpoints[31]'(by rw [OriginalRow227RatioData06.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots06.root224,
    IU := OriginalRow227TriangleData0006.coefficient0_223, next := OriginalRow227TriangleData0007.coefficient0_224, hS := OriginalRow227TriangleRoots06.root224_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero06

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero06.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
