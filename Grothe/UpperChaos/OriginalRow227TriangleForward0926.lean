import Grothe.UpperChaos.OriginalRow227TriangleData0930
import Grothe.UpperChaos.OriginalRow227TriangleData0931
import Grothe.UpperChaos.OriginalRow227TriangleData0942
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0926
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_258, Icur := OriginalRow227TriangleData0930.coefficient65_257,
    output := OriginalRow227TriangleData0942.coefficient66_257, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_259, Icur := OriginalRow227TriangleData0930.coefficient65_258,
    output := OriginalRow227TriangleData0942.coefficient66_258, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_260, Icur := OriginalRow227TriangleData0930.coefficient65_259,
    output := OriginalRow227TriangleData0942.coefficient66_259, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_261, Icur := OriginalRow227TriangleData0930.coefficient65_260,
    output := OriginalRow227TriangleData0942.coefficient66_260, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_262, Icur := OriginalRow227TriangleData0930.coefficient65_261,
    output := OriginalRow227TriangleData0942.coefficient66_261, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_263, Icur := OriginalRow227TriangleData0930.coefficient65_262,
    output := OriginalRow227TriangleData0942.coefficient66_262, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_264, Icur := OriginalRow227TriangleData0930.coefficient65_263,
    output := OriginalRow227TriangleData0942.coefficient66_263, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_265, Icur := OriginalRow227TriangleData0930.coefficient65_264,
    output := OriginalRow227TriangleData0942.coefficient66_264, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_266, Icur := OriginalRow227TriangleData0930.coefficient65_265,
    output := OriginalRow227TriangleData0942.coefficient66_265, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_267, Icur := OriginalRow227TriangleData0930.coefficient65_266,
    output := OriginalRow227TriangleData0942.coefficient66_266, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_268, Icur := OriginalRow227TriangleData0930.coefficient65_267,
    output := OriginalRow227TriangleData0942.coefficient66_267, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_269, Icur := OriginalRow227TriangleData0930.coefficient65_268,
    output := OriginalRow227TriangleData0942.coefficient66_268, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_270, Icur := OriginalRow227TriangleData0930.coefficient65_269,
    output := OriginalRow227TriangleData0942.coefficient66_269, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_271, Icur := OriginalRow227TriangleData0930.coefficient65_270,
    output := OriginalRow227TriangleData0942.coefficient66_270, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_272, Icur := OriginalRow227TriangleData0930.coefficient65_271,
    output := OriginalRow227TriangleData0942.coefficient66_271, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_273, Icur := OriginalRow227TriangleData0930.coefficient65_272,
    output := OriginalRow227TriangleData0942.coefficient66_272, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_274, Icur := OriginalRow227TriangleData0930.coefficient65_273,
    output := OriginalRow227TriangleData0942.coefficient66_273, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_275, Icur := OriginalRow227TriangleData0930.coefficient65_274,
    output := OriginalRow227TriangleData0942.coefficient66_274, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_276, Icur := OriginalRow227TriangleData0930.coefficient65_275,
    output := OriginalRow227TriangleData0942.coefficient66_275, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_277, Icur := OriginalRow227TriangleData0930.coefficient65_276,
    output := OriginalRow227TriangleData0942.coefficient66_276, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_278, Icur := OriginalRow227TriangleData0930.coefficient65_277,
    output := OriginalRow227TriangleData0942.coefficient66_277, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_279, Icur := OriginalRow227TriangleData0930.coefficient65_278,
    output := OriginalRow227TriangleData0942.coefficient66_278, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_280, Icur := OriginalRow227TriangleData0930.coefficient65_279,
    output := OriginalRow227TriangleData0942.coefficient66_279, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_281, Icur := OriginalRow227TriangleData0930.coefficient65_280,
    output := OriginalRow227TriangleData0942.coefficient66_280, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_282, Icur := OriginalRow227TriangleData0930.coefficient65_281,
    output := OriginalRow227TriangleData0942.coefficient66_281, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_283, Icur := OriginalRow227TriangleData0930.coefficient65_282,
    output := OriginalRow227TriangleData0942.coefficient66_282, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_284, Icur := OriginalRow227TriangleData0930.coefficient65_283,
    output := OriginalRow227TriangleData0942.coefficient66_283, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_285, Icur := OriginalRow227TriangleData0930.coefficient65_284,
    output := OriginalRow227TriangleData0942.coefficient66_284, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_286, Icur := OriginalRow227TriangleData0930.coefficient65_285,
    output := OriginalRow227TriangleData0942.coefficient66_285, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_287, Icur := OriginalRow227TriangleData0930.coefficient65_286,
    output := OriginalRow227TriangleData0942.coefficient66_286, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_288, Icur := OriginalRow227TriangleData0930.coefficient65_287,
    output := OriginalRow227TriangleData0942.coefficient66_287, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_289, Icur := OriginalRow227TriangleData0931.coefficient65_288,
    output := OriginalRow227TriangleData0942.coefficient66_288, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0926

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0926.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
