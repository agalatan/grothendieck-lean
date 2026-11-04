import Grothe.UpperChaos.OriginalRow227RatioData08
import Grothe.UpperChaos.OriginalRow227TriangleData0008
import Grothe.UpperChaos.OriginalRow227TriangleData0009
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero08
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[0]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root257,
    IU := OriginalRow227TriangleData0008.coefficient0_256, next := OriginalRow227TriangleData0008.coefficient0_257, hS := OriginalRow227TriangleRoots08.root257_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[1]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root258,
    IU := OriginalRow227TriangleData0008.coefficient0_257, next := OriginalRow227TriangleData0008.coefficient0_258, hS := OriginalRow227TriangleRoots08.root258_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[2]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root259,
    IU := OriginalRow227TriangleData0008.coefficient0_258, next := OriginalRow227TriangleData0008.coefficient0_259, hS := OriginalRow227TriangleRoots08.root259_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[3]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root260,
    IU := OriginalRow227TriangleData0008.coefficient0_259, next := OriginalRow227TriangleData0008.coefficient0_260, hS := OriginalRow227TriangleRoots08.root260_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[4]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root261,
    IU := OriginalRow227TriangleData0008.coefficient0_260, next := OriginalRow227TriangleData0008.coefficient0_261, hS := OriginalRow227TriangleRoots08.root261_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[5]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root262,
    IU := OriginalRow227TriangleData0008.coefficient0_261, next := OriginalRow227TriangleData0008.coefficient0_262, hS := OriginalRow227TriangleRoots08.root262_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[6]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root263,
    IU := OriginalRow227TriangleData0008.coefficient0_262, next := OriginalRow227TriangleData0008.coefficient0_263, hS := OriginalRow227TriangleRoots08.root263_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[7]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root264,
    IU := OriginalRow227TriangleData0008.coefficient0_263, next := OriginalRow227TriangleData0008.coefficient0_264, hS := OriginalRow227TriangleRoots08.root264_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[8]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root265,
    IU := OriginalRow227TriangleData0008.coefficient0_264, next := OriginalRow227TriangleData0008.coefficient0_265, hS := OriginalRow227TriangleRoots08.root265_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[9]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root266,
    IU := OriginalRow227TriangleData0008.coefficient0_265, next := OriginalRow227TriangleData0008.coefficient0_266, hS := OriginalRow227TriangleRoots08.root266_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[10]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root267,
    IU := OriginalRow227TriangleData0008.coefficient0_266, next := OriginalRow227TriangleData0008.coefficient0_267, hS := OriginalRow227TriangleRoots08.root267_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[11]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root268,
    IU := OriginalRow227TriangleData0008.coefficient0_267, next := OriginalRow227TriangleData0008.coefficient0_268, hS := OriginalRow227TriangleRoots08.root268_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[12]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root269,
    IU := OriginalRow227TriangleData0008.coefficient0_268, next := OriginalRow227TriangleData0008.coefficient0_269, hS := OriginalRow227TriangleRoots08.root269_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[13]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root270,
    IU := OriginalRow227TriangleData0008.coefficient0_269, next := OriginalRow227TriangleData0008.coefficient0_270, hS := OriginalRow227TriangleRoots08.root270_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[14]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root271,
    IU := OriginalRow227TriangleData0008.coefficient0_270, next := OriginalRow227TriangleData0008.coefficient0_271, hS := OriginalRow227TriangleRoots08.root271_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[15]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root272,
    IU := OriginalRow227TriangleData0008.coefficient0_271, next := OriginalRow227TriangleData0008.coefficient0_272, hS := OriginalRow227TriangleRoots08.root272_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[16]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root273,
    IU := OriginalRow227TriangleData0008.coefficient0_272, next := OriginalRow227TriangleData0008.coefficient0_273, hS := OriginalRow227TriangleRoots08.root273_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[17]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root274,
    IU := OriginalRow227TriangleData0008.coefficient0_273, next := OriginalRow227TriangleData0008.coefficient0_274, hS := OriginalRow227TriangleRoots08.root274_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[18]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root275,
    IU := OriginalRow227TriangleData0008.coefficient0_274, next := OriginalRow227TriangleData0008.coefficient0_275, hS := OriginalRow227TriangleRoots08.root275_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[19]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root276,
    IU := OriginalRow227TriangleData0008.coefficient0_275, next := OriginalRow227TriangleData0008.coefficient0_276, hS := OriginalRow227TriangleRoots08.root276_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[20]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root277,
    IU := OriginalRow227TriangleData0008.coefficient0_276, next := OriginalRow227TriangleData0008.coefficient0_277, hS := OriginalRow227TriangleRoots08.root277_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[21]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root278,
    IU := OriginalRow227TriangleData0008.coefficient0_277, next := OriginalRow227TriangleData0008.coefficient0_278, hS := OriginalRow227TriangleRoots08.root278_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[22]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root279,
    IU := OriginalRow227TriangleData0008.coefficient0_278, next := OriginalRow227TriangleData0008.coefficient0_279, hS := OriginalRow227TriangleRoots08.root279_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[23]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root280,
    IU := OriginalRow227TriangleData0008.coefficient0_279, next := OriginalRow227TriangleData0008.coefficient0_280, hS := OriginalRow227TriangleRoots08.root280_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[24]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root281,
    IU := OriginalRow227TriangleData0008.coefficient0_280, next := OriginalRow227TriangleData0008.coefficient0_281, hS := OriginalRow227TriangleRoots08.root281_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[25]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root282,
    IU := OriginalRow227TriangleData0008.coefficient0_281, next := OriginalRow227TriangleData0008.coefficient0_282, hS := OriginalRow227TriangleRoots08.root282_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[26]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root283,
    IU := OriginalRow227TriangleData0008.coefficient0_282, next := OriginalRow227TriangleData0008.coefficient0_283, hS := OriginalRow227TriangleRoots08.root283_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[27]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root284,
    IU := OriginalRow227TriangleData0008.coefficient0_283, next := OriginalRow227TriangleData0008.coefficient0_284, hS := OriginalRow227TriangleRoots08.root284_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[28]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root285,
    IU := OriginalRow227TriangleData0008.coefficient0_284, next := OriginalRow227TriangleData0008.coefficient0_285, hS := OriginalRow227TriangleRoots08.root285_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[29]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root286,
    IU := OriginalRow227TriangleData0008.coefficient0_285, next := OriginalRow227TriangleData0008.coefficient0_286, hS := OriginalRow227TriangleRoots08.root286_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[30]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root287,
    IU := OriginalRow227TriangleData0008.coefficient0_286, next := OriginalRow227TriangleData0008.coefficient0_287, hS := OriginalRow227TriangleRoots08.root287_pos },
  { IA := shift, IR := (OriginalRow227RatioData08.checkpoints[31]'(by rw [OriginalRow227RatioData08.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots08.root288,
    IU := OriginalRow227TriangleData0008.coefficient0_287, next := OriginalRow227TriangleData0009.coefficient0_288, hS := OriginalRow227TriangleRoots08.root288_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero08

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero08.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
