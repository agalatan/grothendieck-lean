import Grothe.UpperChaos.OriginalRow227TriangleData1287
import Grothe.UpperChaos.OriginalRow227TriangleData1288
import Grothe.UpperChaos.OriginalRow227TriangleData1297
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1281
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_258, Icur := OriginalRow227TriangleData1287.coefficient97_257,
    output := OriginalRow227TriangleData1297.coefficient98_257, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_259, Icur := OriginalRow227TriangleData1287.coefficient97_258,
    output := OriginalRow227TriangleData1297.coefficient98_258, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_260, Icur := OriginalRow227TriangleData1287.coefficient97_259,
    output := OriginalRow227TriangleData1297.coefficient98_259, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_261, Icur := OriginalRow227TriangleData1287.coefficient97_260,
    output := OriginalRow227TriangleData1297.coefficient98_260, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_262, Icur := OriginalRow227TriangleData1287.coefficient97_261,
    output := OriginalRow227TriangleData1297.coefficient98_261, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_263, Icur := OriginalRow227TriangleData1287.coefficient97_262,
    output := OriginalRow227TriangleData1297.coefficient98_262, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_264, Icur := OriginalRow227TriangleData1287.coefficient97_263,
    output := OriginalRow227TriangleData1297.coefficient98_263, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_265, Icur := OriginalRow227TriangleData1287.coefficient97_264,
    output := OriginalRow227TriangleData1297.coefficient98_264, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_266, Icur := OriginalRow227TriangleData1287.coefficient97_265,
    output := OriginalRow227TriangleData1297.coefficient98_265, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_267, Icur := OriginalRow227TriangleData1287.coefficient97_266,
    output := OriginalRow227TriangleData1297.coefficient98_266, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_268, Icur := OriginalRow227TriangleData1287.coefficient97_267,
    output := OriginalRow227TriangleData1297.coefficient98_267, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_269, Icur := OriginalRow227TriangleData1287.coefficient97_268,
    output := OriginalRow227TriangleData1297.coefficient98_268, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_270, Icur := OriginalRow227TriangleData1287.coefficient97_269,
    output := OriginalRow227TriangleData1297.coefficient98_269, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_271, Icur := OriginalRow227TriangleData1287.coefficient97_270,
    output := OriginalRow227TriangleData1297.coefficient98_270, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_272, Icur := OriginalRow227TriangleData1287.coefficient97_271,
    output := OriginalRow227TriangleData1297.coefficient98_271, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_273, Icur := OriginalRow227TriangleData1287.coefficient97_272,
    output := OriginalRow227TriangleData1297.coefficient98_272, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_274, Icur := OriginalRow227TriangleData1287.coefficient97_273,
    output := OriginalRow227TriangleData1297.coefficient98_273, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_275, Icur := OriginalRow227TriangleData1287.coefficient97_274,
    output := OriginalRow227TriangleData1297.coefficient98_274, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_276, Icur := OriginalRow227TriangleData1287.coefficient97_275,
    output := OriginalRow227TriangleData1297.coefficient98_275, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_277, Icur := OriginalRow227TriangleData1287.coefficient97_276,
    output := OriginalRow227TriangleData1297.coefficient98_276, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_278, Icur := OriginalRow227TriangleData1287.coefficient97_277,
    output := OriginalRow227TriangleData1297.coefficient98_277, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_279, Icur := OriginalRow227TriangleData1287.coefficient97_278,
    output := OriginalRow227TriangleData1297.coefficient98_278, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_280, Icur := OriginalRow227TriangleData1287.coefficient97_279,
    output := OriginalRow227TriangleData1297.coefficient98_279, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_281, Icur := OriginalRow227TriangleData1287.coefficient97_280,
    output := OriginalRow227TriangleData1297.coefficient98_280, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_282, Icur := OriginalRow227TriangleData1287.coefficient97_281,
    output := OriginalRow227TriangleData1297.coefficient98_281, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_283, Icur := OriginalRow227TriangleData1287.coefficient97_282,
    output := OriginalRow227TriangleData1297.coefficient98_282, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_284, Icur := OriginalRow227TriangleData1287.coefficient97_283,
    output := OriginalRow227TriangleData1297.coefficient98_283, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_285, Icur := OriginalRow227TriangleData1287.coefficient97_284,
    output := OriginalRow227TriangleData1297.coefficient98_284, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_286, Icur := OriginalRow227TriangleData1287.coefficient97_285,
    output := OriginalRow227TriangleData1297.coefficient98_285, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_287, Icur := OriginalRow227TriangleData1287.coefficient97_286,
    output := OriginalRow227TriangleData1297.coefficient98_286, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1288.coefficient97_288, Icur := OriginalRow227TriangleData1287.coefficient97_287,
    output := OriginalRow227TriangleData1297.coefficient98_287, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1288.coefficient97_289, Icur := OriginalRow227TriangleData1288.coefficient97_288,
    output := OriginalRow227TriangleData1297.coefficient98_288, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1281

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1281.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
