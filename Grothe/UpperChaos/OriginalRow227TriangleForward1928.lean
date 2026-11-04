import Grothe.UpperChaos.OriginalRow227TriangleData1939
import Grothe.UpperChaos.OriginalRow227TriangleData1940
import Grothe.UpperChaos.OriginalRow227TriangleData1944
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1928
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_250, Icur := OriginalRow227TriangleData1939.coefficient185_249,
    output := OriginalRow227TriangleData1944.coefficient186_249, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_251, Icur := OriginalRow227TriangleData1939.coefficient185_250,
    output := OriginalRow227TriangleData1944.coefficient186_250, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_252, Icur := OriginalRow227TriangleData1939.coefficient185_251,
    output := OriginalRow227TriangleData1944.coefficient186_251, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_253, Icur := OriginalRow227TriangleData1939.coefficient185_252,
    output := OriginalRow227TriangleData1944.coefficient186_252, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_254, Icur := OriginalRow227TriangleData1939.coefficient185_253,
    output := OriginalRow227TriangleData1944.coefficient186_253, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_255, Icur := OriginalRow227TriangleData1939.coefficient185_254,
    output := OriginalRow227TriangleData1944.coefficient186_254, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_256, Icur := OriginalRow227TriangleData1939.coefficient185_255,
    output := OriginalRow227TriangleData1944.coefficient186_255, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_257, Icur := OriginalRow227TriangleData1939.coefficient185_256,
    output := OriginalRow227TriangleData1944.coefficient186_256, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_258, Icur := OriginalRow227TriangleData1939.coefficient185_257,
    output := OriginalRow227TriangleData1944.coefficient186_257, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_259, Icur := OriginalRow227TriangleData1939.coefficient185_258,
    output := OriginalRow227TriangleData1944.coefficient186_258, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_260, Icur := OriginalRow227TriangleData1939.coefficient185_259,
    output := OriginalRow227TriangleData1944.coefficient186_259, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_261, Icur := OriginalRow227TriangleData1939.coefficient185_260,
    output := OriginalRow227TriangleData1944.coefficient186_260, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_262, Icur := OriginalRow227TriangleData1939.coefficient185_261,
    output := OriginalRow227TriangleData1944.coefficient186_261, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_263, Icur := OriginalRow227TriangleData1939.coefficient185_262,
    output := OriginalRow227TriangleData1944.coefficient186_262, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_264, Icur := OriginalRow227TriangleData1939.coefficient185_263,
    output := OriginalRow227TriangleData1944.coefficient186_263, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_265, Icur := OriginalRow227TriangleData1939.coefficient185_264,
    output := OriginalRow227TriangleData1944.coefficient186_264, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_266, Icur := OriginalRow227TriangleData1939.coefficient185_265,
    output := OriginalRow227TriangleData1944.coefficient186_265, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_267, Icur := OriginalRow227TriangleData1939.coefficient185_266,
    output := OriginalRow227TriangleData1944.coefficient186_266, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_268, Icur := OriginalRow227TriangleData1939.coefficient185_267,
    output := OriginalRow227TriangleData1944.coefficient186_267, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_269, Icur := OriginalRow227TriangleData1939.coefficient185_268,
    output := OriginalRow227TriangleData1944.coefficient186_268, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_270, Icur := OriginalRow227TriangleData1939.coefficient185_269,
    output := OriginalRow227TriangleData1944.coefficient186_269, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_271, Icur := OriginalRow227TriangleData1939.coefficient185_270,
    output := OriginalRow227TriangleData1944.coefficient186_270, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_272, Icur := OriginalRow227TriangleData1939.coefficient185_271,
    output := OriginalRow227TriangleData1944.coefficient186_271, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_273, Icur := OriginalRow227TriangleData1939.coefficient185_272,
    output := OriginalRow227TriangleData1944.coefficient186_272, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_274, Icur := OriginalRow227TriangleData1939.coefficient185_273,
    output := OriginalRow227TriangleData1944.coefficient186_273, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_275, Icur := OriginalRow227TriangleData1939.coefficient185_274,
    output := OriginalRow227TriangleData1944.coefficient186_274, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_276, Icur := OriginalRow227TriangleData1939.coefficient185_275,
    output := OriginalRow227TriangleData1944.coefficient186_275, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_277, Icur := OriginalRow227TriangleData1939.coefficient185_276,
    output := OriginalRow227TriangleData1944.coefficient186_276, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_278, Icur := OriginalRow227TriangleData1939.coefficient185_277,
    output := OriginalRow227TriangleData1944.coefficient186_277, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_279, Icur := OriginalRow227TriangleData1939.coefficient185_278,
    output := OriginalRow227TriangleData1944.coefficient186_278, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1940.coefficient185_280, Icur := OriginalRow227TriangleData1939.coefficient185_279,
    output := OriginalRow227TriangleData1944.coefficient186_279, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1940.coefficient185_281, Icur := OriginalRow227TriangleData1940.coefficient185_280,
    output := OriginalRow227TriangleData1944.coefficient186_280, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1928

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1928.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
