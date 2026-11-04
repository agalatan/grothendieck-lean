import Grothe.UpperChaos.OriginalRow227TriangleData0509
import Grothe.UpperChaos.OriginalRow227TriangleData0510
import Grothe.UpperChaos.OriginalRow227TriangleData0523
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0507
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_258, Icur := OriginalRow227TriangleData0509.coefficient33_257,
    output := OriginalRow227TriangleData0523.coefficient34_257, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_259, Icur := OriginalRow227TriangleData0509.coefficient33_258,
    output := OriginalRow227TriangleData0523.coefficient34_258, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_260, Icur := OriginalRow227TriangleData0509.coefficient33_259,
    output := OriginalRow227TriangleData0523.coefficient34_259, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_261, Icur := OriginalRow227TriangleData0509.coefficient33_260,
    output := OriginalRow227TriangleData0523.coefficient34_260, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_262, Icur := OriginalRow227TriangleData0509.coefficient33_261,
    output := OriginalRow227TriangleData0523.coefficient34_261, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_263, Icur := OriginalRow227TriangleData0509.coefficient33_262,
    output := OriginalRow227TriangleData0523.coefficient34_262, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_264, Icur := OriginalRow227TriangleData0509.coefficient33_263,
    output := OriginalRow227TriangleData0523.coefficient34_263, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_265, Icur := OriginalRow227TriangleData0509.coefficient33_264,
    output := OriginalRow227TriangleData0523.coefficient34_264, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_266, Icur := OriginalRow227TriangleData0509.coefficient33_265,
    output := OriginalRow227TriangleData0523.coefficient34_265, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_267, Icur := OriginalRow227TriangleData0509.coefficient33_266,
    output := OriginalRow227TriangleData0523.coefficient34_266, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_268, Icur := OriginalRow227TriangleData0509.coefficient33_267,
    output := OriginalRow227TriangleData0523.coefficient34_267, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_269, Icur := OriginalRow227TriangleData0509.coefficient33_268,
    output := OriginalRow227TriangleData0523.coefficient34_268, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_270, Icur := OriginalRow227TriangleData0509.coefficient33_269,
    output := OriginalRow227TriangleData0523.coefficient34_269, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_271, Icur := OriginalRow227TriangleData0509.coefficient33_270,
    output := OriginalRow227TriangleData0523.coefficient34_270, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_272, Icur := OriginalRow227TriangleData0509.coefficient33_271,
    output := OriginalRow227TriangleData0523.coefficient34_271, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_273, Icur := OriginalRow227TriangleData0509.coefficient33_272,
    output := OriginalRow227TriangleData0523.coefficient34_272, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_274, Icur := OriginalRow227TriangleData0509.coefficient33_273,
    output := OriginalRow227TriangleData0523.coefficient34_273, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_275, Icur := OriginalRow227TriangleData0509.coefficient33_274,
    output := OriginalRow227TriangleData0523.coefficient34_274, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_276, Icur := OriginalRow227TriangleData0509.coefficient33_275,
    output := OriginalRow227TriangleData0523.coefficient34_275, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_277, Icur := OriginalRow227TriangleData0509.coefficient33_276,
    output := OriginalRow227TriangleData0523.coefficient34_276, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_278, Icur := OriginalRow227TriangleData0509.coefficient33_277,
    output := OriginalRow227TriangleData0523.coefficient34_277, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_279, Icur := OriginalRow227TriangleData0509.coefficient33_278,
    output := OriginalRow227TriangleData0523.coefficient34_278, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_280, Icur := OriginalRow227TriangleData0509.coefficient33_279,
    output := OriginalRow227TriangleData0523.coefficient34_279, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_281, Icur := OriginalRow227TriangleData0509.coefficient33_280,
    output := OriginalRow227TriangleData0523.coefficient34_280, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_282, Icur := OriginalRow227TriangleData0509.coefficient33_281,
    output := OriginalRow227TriangleData0523.coefficient34_281, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_283, Icur := OriginalRow227TriangleData0509.coefficient33_282,
    output := OriginalRow227TriangleData0523.coefficient34_282, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_284, Icur := OriginalRow227TriangleData0509.coefficient33_283,
    output := OriginalRow227TriangleData0523.coefficient34_283, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_285, Icur := OriginalRow227TriangleData0509.coefficient33_284,
    output := OriginalRow227TriangleData0523.coefficient34_284, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_286, Icur := OriginalRow227TriangleData0509.coefficient33_285,
    output := OriginalRow227TriangleData0523.coefficient34_285, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0509.coefficient33_287, Icur := OriginalRow227TriangleData0509.coefficient33_286,
    output := OriginalRow227TriangleData0523.coefficient34_286, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0510.coefficient33_288, Icur := OriginalRow227TriangleData0509.coefficient33_287,
    output := OriginalRow227TriangleData0523.coefficient34_287, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0510.coefficient33_289, Icur := OriginalRow227TriangleData0510.coefficient33_288,
    output := OriginalRow227TriangleData0523.coefficient34_288, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0507

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0507.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
