import Grothe.UpperChaos.OriginalRow227TriangleData1486
import Grothe.UpperChaos.OriginalRow227TriangleData1487
import Grothe.UpperChaos.OriginalRow227TriangleData1495
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1479
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_247, Icur := OriginalRow227TriangleData1486.coefficient118_246,
    output := OriginalRow227TriangleData1495.coefficient119_246, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_248, Icur := OriginalRow227TriangleData1486.coefficient118_247,
    output := OriginalRow227TriangleData1495.coefficient119_247, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_249, Icur := OriginalRow227TriangleData1486.coefficient118_248,
    output := OriginalRow227TriangleData1495.coefficient119_248, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_250, Icur := OriginalRow227TriangleData1486.coefficient118_249,
    output := OriginalRow227TriangleData1495.coefficient119_249, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_251, Icur := OriginalRow227TriangleData1486.coefficient118_250,
    output := OriginalRow227TriangleData1495.coefficient119_250, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_252, Icur := OriginalRow227TriangleData1486.coefficient118_251,
    output := OriginalRow227TriangleData1495.coefficient119_251, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_253, Icur := OriginalRow227TriangleData1486.coefficient118_252,
    output := OriginalRow227TriangleData1495.coefficient119_252, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_254, Icur := OriginalRow227TriangleData1486.coefficient118_253,
    output := OriginalRow227TriangleData1495.coefficient119_253, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_255, Icur := OriginalRow227TriangleData1486.coefficient118_254,
    output := OriginalRow227TriangleData1495.coefficient119_254, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_256, Icur := OriginalRow227TriangleData1486.coefficient118_255,
    output := OriginalRow227TriangleData1495.coefficient119_255, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_257, Icur := OriginalRow227TriangleData1486.coefficient118_256,
    output := OriginalRow227TriangleData1495.coefficient119_256, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_258, Icur := OriginalRow227TriangleData1486.coefficient118_257,
    output := OriginalRow227TriangleData1495.coefficient119_257, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_259, Icur := OriginalRow227TriangleData1486.coefficient118_258,
    output := OriginalRow227TriangleData1495.coefficient119_258, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_260, Icur := OriginalRow227TriangleData1486.coefficient118_259,
    output := OriginalRow227TriangleData1495.coefficient119_259, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_261, Icur := OriginalRow227TriangleData1486.coefficient118_260,
    output := OriginalRow227TriangleData1495.coefficient119_260, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_262, Icur := OriginalRow227TriangleData1486.coefficient118_261,
    output := OriginalRow227TriangleData1495.coefficient119_261, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_263, Icur := OriginalRow227TriangleData1486.coefficient118_262,
    output := OriginalRow227TriangleData1495.coefficient119_262, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_264, Icur := OriginalRow227TriangleData1486.coefficient118_263,
    output := OriginalRow227TriangleData1495.coefficient119_263, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_265, Icur := OriginalRow227TriangleData1486.coefficient118_264,
    output := OriginalRow227TriangleData1495.coefficient119_264, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_266, Icur := OriginalRow227TriangleData1486.coefficient118_265,
    output := OriginalRow227TriangleData1495.coefficient119_265, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_267, Icur := OriginalRow227TriangleData1486.coefficient118_266,
    output := OriginalRow227TriangleData1495.coefficient119_266, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_268, Icur := OriginalRow227TriangleData1486.coefficient118_267,
    output := OriginalRow227TriangleData1495.coefficient119_267, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_269, Icur := OriginalRow227TriangleData1486.coefficient118_268,
    output := OriginalRow227TriangleData1495.coefficient119_268, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_270, Icur := OriginalRow227TriangleData1486.coefficient118_269,
    output := OriginalRow227TriangleData1495.coefficient119_269, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_271, Icur := OriginalRow227TriangleData1486.coefficient118_270,
    output := OriginalRow227TriangleData1495.coefficient119_270, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_272, Icur := OriginalRow227TriangleData1486.coefficient118_271,
    output := OriginalRow227TriangleData1495.coefficient119_271, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_273, Icur := OriginalRow227TriangleData1486.coefficient118_272,
    output := OriginalRow227TriangleData1495.coefficient119_272, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_274, Icur := OriginalRow227TriangleData1486.coefficient118_273,
    output := OriginalRow227TriangleData1495.coefficient119_273, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_275, Icur := OriginalRow227TriangleData1486.coefficient118_274,
    output := OriginalRow227TriangleData1495.coefficient119_274, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1486.coefficient118_276, Icur := OriginalRow227TriangleData1486.coefficient118_275,
    output := OriginalRow227TriangleData1495.coefficient119_275, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_277, Icur := OriginalRow227TriangleData1486.coefficient118_276,
    output := OriginalRow227TriangleData1495.coefficient119_276, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_278, Icur := OriginalRow227TriangleData1487.coefficient118_277,
    output := OriginalRow227TriangleData1495.coefficient119_277, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1479

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1479.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
