import Grothe.UpperChaos.OriginalRow227TriangleData1277
import Grothe.UpperChaos.OriginalRow227TriangleData1278
import Grothe.UpperChaos.OriginalRow227TriangleData1287
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1271
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_257, Icur := OriginalRow227TriangleData1277.coefficient96_256,
    output := OriginalRow227TriangleData1287.coefficient97_256, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_258, Icur := OriginalRow227TriangleData1277.coefficient96_257,
    output := OriginalRow227TriangleData1287.coefficient97_257, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_259, Icur := OriginalRow227TriangleData1277.coefficient96_258,
    output := OriginalRow227TriangleData1287.coefficient97_258, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_260, Icur := OriginalRow227TriangleData1277.coefficient96_259,
    output := OriginalRow227TriangleData1287.coefficient97_259, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_261, Icur := OriginalRow227TriangleData1277.coefficient96_260,
    output := OriginalRow227TriangleData1287.coefficient97_260, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_262, Icur := OriginalRow227TriangleData1277.coefficient96_261,
    output := OriginalRow227TriangleData1287.coefficient97_261, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_263, Icur := OriginalRow227TriangleData1277.coefficient96_262,
    output := OriginalRow227TriangleData1287.coefficient97_262, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_264, Icur := OriginalRow227TriangleData1277.coefficient96_263,
    output := OriginalRow227TriangleData1287.coefficient97_263, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_265, Icur := OriginalRow227TriangleData1277.coefficient96_264,
    output := OriginalRow227TriangleData1287.coefficient97_264, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_266, Icur := OriginalRow227TriangleData1277.coefficient96_265,
    output := OriginalRow227TriangleData1287.coefficient97_265, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_267, Icur := OriginalRow227TriangleData1277.coefficient96_266,
    output := OriginalRow227TriangleData1287.coefficient97_266, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_268, Icur := OriginalRow227TriangleData1277.coefficient96_267,
    output := OriginalRow227TriangleData1287.coefficient97_267, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_269, Icur := OriginalRow227TriangleData1277.coefficient96_268,
    output := OriginalRow227TriangleData1287.coefficient97_268, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_270, Icur := OriginalRow227TriangleData1277.coefficient96_269,
    output := OriginalRow227TriangleData1287.coefficient97_269, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_271, Icur := OriginalRow227TriangleData1277.coefficient96_270,
    output := OriginalRow227TriangleData1287.coefficient97_270, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_272, Icur := OriginalRow227TriangleData1277.coefficient96_271,
    output := OriginalRow227TriangleData1287.coefficient97_271, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_273, Icur := OriginalRow227TriangleData1277.coefficient96_272,
    output := OriginalRow227TriangleData1287.coefficient97_272, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_274, Icur := OriginalRow227TriangleData1277.coefficient96_273,
    output := OriginalRow227TriangleData1287.coefficient97_273, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_275, Icur := OriginalRow227TriangleData1277.coefficient96_274,
    output := OriginalRow227TriangleData1287.coefficient97_274, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_276, Icur := OriginalRow227TriangleData1277.coefficient96_275,
    output := OriginalRow227TriangleData1287.coefficient97_275, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_277, Icur := OriginalRow227TriangleData1277.coefficient96_276,
    output := OriginalRow227TriangleData1287.coefficient97_276, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_278, Icur := OriginalRow227TriangleData1277.coefficient96_277,
    output := OriginalRow227TriangleData1287.coefficient97_277, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_279, Icur := OriginalRow227TriangleData1277.coefficient96_278,
    output := OriginalRow227TriangleData1287.coefficient97_278, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_280, Icur := OriginalRow227TriangleData1277.coefficient96_279,
    output := OriginalRow227TriangleData1287.coefficient97_279, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_281, Icur := OriginalRow227TriangleData1277.coefficient96_280,
    output := OriginalRow227TriangleData1287.coefficient97_280, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_282, Icur := OriginalRow227TriangleData1277.coefficient96_281,
    output := OriginalRow227TriangleData1287.coefficient97_281, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_283, Icur := OriginalRow227TriangleData1277.coefficient96_282,
    output := OriginalRow227TriangleData1287.coefficient97_282, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_284, Icur := OriginalRow227TriangleData1277.coefficient96_283,
    output := OriginalRow227TriangleData1287.coefficient97_283, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_285, Icur := OriginalRow227TriangleData1277.coefficient96_284,
    output := OriginalRow227TriangleData1287.coefficient97_284, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1277.coefficient96_286, Icur := OriginalRow227TriangleData1277.coefficient96_285,
    output := OriginalRow227TriangleData1287.coefficient97_285, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1278.coefficient96_287, Icur := OriginalRow227TriangleData1277.coefficient96_286,
    output := OriginalRow227TriangleData1287.coefficient97_286, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1278.coefficient96_288, Icur := OriginalRow227TriangleData1278.coefficient96_287,
    output := OriginalRow227TriangleData1287.coefficient97_287, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1271

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1271.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
