import Grothe.UpperChaos.OriginalRow227RatioData07
import Grothe.UpperChaos.OriginalRow227TriangleData0007
import Grothe.UpperChaos.OriginalRow227TriangleData0008
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero07
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[0]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root225,
    IU := OriginalRow227TriangleData0007.coefficient0_224, next := OriginalRow227TriangleData0007.coefficient0_225, hS := OriginalRow227TriangleRoots07.root225_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[1]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root226,
    IU := OriginalRow227TriangleData0007.coefficient0_225, next := OriginalRow227TriangleData0007.coefficient0_226, hS := OriginalRow227TriangleRoots07.root226_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[2]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root227,
    IU := OriginalRow227TriangleData0007.coefficient0_226, next := OriginalRow227TriangleData0007.coefficient0_227, hS := OriginalRow227TriangleRoots07.root227_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[3]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root228,
    IU := OriginalRow227TriangleData0007.coefficient0_227, next := OriginalRow227TriangleData0007.coefficient0_228, hS := OriginalRow227TriangleRoots07.root228_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[4]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root229,
    IU := OriginalRow227TriangleData0007.coefficient0_228, next := OriginalRow227TriangleData0007.coefficient0_229, hS := OriginalRow227TriangleRoots07.root229_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[5]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root230,
    IU := OriginalRow227TriangleData0007.coefficient0_229, next := OriginalRow227TriangleData0007.coefficient0_230, hS := OriginalRow227TriangleRoots07.root230_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[6]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root231,
    IU := OriginalRow227TriangleData0007.coefficient0_230, next := OriginalRow227TriangleData0007.coefficient0_231, hS := OriginalRow227TriangleRoots07.root231_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[7]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root232,
    IU := OriginalRow227TriangleData0007.coefficient0_231, next := OriginalRow227TriangleData0007.coefficient0_232, hS := OriginalRow227TriangleRoots07.root232_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[8]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root233,
    IU := OriginalRow227TriangleData0007.coefficient0_232, next := OriginalRow227TriangleData0007.coefficient0_233, hS := OriginalRow227TriangleRoots07.root233_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[9]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root234,
    IU := OriginalRow227TriangleData0007.coefficient0_233, next := OriginalRow227TriangleData0007.coefficient0_234, hS := OriginalRow227TriangleRoots07.root234_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[10]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root235,
    IU := OriginalRow227TriangleData0007.coefficient0_234, next := OriginalRow227TriangleData0007.coefficient0_235, hS := OriginalRow227TriangleRoots07.root235_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[11]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root236,
    IU := OriginalRow227TriangleData0007.coefficient0_235, next := OriginalRow227TriangleData0007.coefficient0_236, hS := OriginalRow227TriangleRoots07.root236_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[12]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root237,
    IU := OriginalRow227TriangleData0007.coefficient0_236, next := OriginalRow227TriangleData0007.coefficient0_237, hS := OriginalRow227TriangleRoots07.root237_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[13]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root238,
    IU := OriginalRow227TriangleData0007.coefficient0_237, next := OriginalRow227TriangleData0007.coefficient0_238, hS := OriginalRow227TriangleRoots07.root238_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[14]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root239,
    IU := OriginalRow227TriangleData0007.coefficient0_238, next := OriginalRow227TriangleData0007.coefficient0_239, hS := OriginalRow227TriangleRoots07.root239_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[15]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root240,
    IU := OriginalRow227TriangleData0007.coefficient0_239, next := OriginalRow227TriangleData0007.coefficient0_240, hS := OriginalRow227TriangleRoots07.root240_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[16]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root241,
    IU := OriginalRow227TriangleData0007.coefficient0_240, next := OriginalRow227TriangleData0007.coefficient0_241, hS := OriginalRow227TriangleRoots07.root241_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[17]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root242,
    IU := OriginalRow227TriangleData0007.coefficient0_241, next := OriginalRow227TriangleData0007.coefficient0_242, hS := OriginalRow227TriangleRoots07.root242_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[18]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root243,
    IU := OriginalRow227TriangleData0007.coefficient0_242, next := OriginalRow227TriangleData0007.coefficient0_243, hS := OriginalRow227TriangleRoots07.root243_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[19]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root244,
    IU := OriginalRow227TriangleData0007.coefficient0_243, next := OriginalRow227TriangleData0007.coefficient0_244, hS := OriginalRow227TriangleRoots07.root244_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[20]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root245,
    IU := OriginalRow227TriangleData0007.coefficient0_244, next := OriginalRow227TriangleData0007.coefficient0_245, hS := OriginalRow227TriangleRoots07.root245_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[21]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root246,
    IU := OriginalRow227TriangleData0007.coefficient0_245, next := OriginalRow227TriangleData0007.coefficient0_246, hS := OriginalRow227TriangleRoots07.root246_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[22]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root247,
    IU := OriginalRow227TriangleData0007.coefficient0_246, next := OriginalRow227TriangleData0007.coefficient0_247, hS := OriginalRow227TriangleRoots07.root247_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[23]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root248,
    IU := OriginalRow227TriangleData0007.coefficient0_247, next := OriginalRow227TriangleData0007.coefficient0_248, hS := OriginalRow227TriangleRoots07.root248_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[24]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root249,
    IU := OriginalRow227TriangleData0007.coefficient0_248, next := OriginalRow227TriangleData0007.coefficient0_249, hS := OriginalRow227TriangleRoots07.root249_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[25]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root250,
    IU := OriginalRow227TriangleData0007.coefficient0_249, next := OriginalRow227TriangleData0007.coefficient0_250, hS := OriginalRow227TriangleRoots07.root250_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[26]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root251,
    IU := OriginalRow227TriangleData0007.coefficient0_250, next := OriginalRow227TriangleData0007.coefficient0_251, hS := OriginalRow227TriangleRoots07.root251_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[27]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root252,
    IU := OriginalRow227TriangleData0007.coefficient0_251, next := OriginalRow227TriangleData0007.coefficient0_252, hS := OriginalRow227TriangleRoots07.root252_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[28]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root253,
    IU := OriginalRow227TriangleData0007.coefficient0_252, next := OriginalRow227TriangleData0007.coefficient0_253, hS := OriginalRow227TriangleRoots07.root253_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[29]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root254,
    IU := OriginalRow227TriangleData0007.coefficient0_253, next := OriginalRow227TriangleData0007.coefficient0_254, hS := OriginalRow227TriangleRoots07.root254_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[30]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root255,
    IU := OriginalRow227TriangleData0007.coefficient0_254, next := OriginalRow227TriangleData0007.coefficient0_255, hS := OriginalRow227TriangleRoots07.root255_pos },
  { IA := shift, IR := (OriginalRow227RatioData07.checkpoints[31]'(by rw [OriginalRow227RatioData07.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots07.root256,
    IU := OriginalRow227TriangleData0007.coefficient0_255, next := OriginalRow227TriangleData0008.coefficient0_256, hS := OriginalRow227TriangleRoots07.root256_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero07

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero07.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
