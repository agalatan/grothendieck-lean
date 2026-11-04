import Grothe.UpperChaos.OriginalRow227TriangleData2041
import Grothe.UpperChaos.OriginalRow227TriangleData2042
import Grothe.UpperChaos.OriginalRow227TriangleData2044
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2028
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_245, Icur := OriginalRow227TriangleData2041.coefficient212_244,
    output := OriginalRow227TriangleData2044.coefficient213_244, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_246, Icur := OriginalRow227TriangleData2041.coefficient212_245,
    output := OriginalRow227TriangleData2044.coefficient213_245, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_247, Icur := OriginalRow227TriangleData2041.coefficient212_246,
    output := OriginalRow227TriangleData2044.coefficient213_246, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_248, Icur := OriginalRow227TriangleData2041.coefficient212_247,
    output := OriginalRow227TriangleData2044.coefficient213_247, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_249, Icur := OriginalRow227TriangleData2041.coefficient212_248,
    output := OriginalRow227TriangleData2044.coefficient213_248, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_250, Icur := OriginalRow227TriangleData2041.coefficient212_249,
    output := OriginalRow227TriangleData2044.coefficient213_249, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_251, Icur := OriginalRow227TriangleData2041.coefficient212_250,
    output := OriginalRow227TriangleData2044.coefficient213_250, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_252, Icur := OriginalRow227TriangleData2041.coefficient212_251,
    output := OriginalRow227TriangleData2044.coefficient213_251, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_253, Icur := OriginalRow227TriangleData2041.coefficient212_252,
    output := OriginalRow227TriangleData2044.coefficient213_252, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_254, Icur := OriginalRow227TriangleData2041.coefficient212_253,
    output := OriginalRow227TriangleData2044.coefficient213_253, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_255, Icur := OriginalRow227TriangleData2041.coefficient212_254,
    output := OriginalRow227TriangleData2044.coefficient213_254, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_256, Icur := OriginalRow227TriangleData2041.coefficient212_255,
    output := OriginalRow227TriangleData2044.coefficient213_255, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_257, Icur := OriginalRow227TriangleData2041.coefficient212_256,
    output := OriginalRow227TriangleData2044.coefficient213_256, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_258, Icur := OriginalRow227TriangleData2041.coefficient212_257,
    output := OriginalRow227TriangleData2044.coefficient213_257, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_259, Icur := OriginalRow227TriangleData2041.coefficient212_258,
    output := OriginalRow227TriangleData2044.coefficient213_258, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_260, Icur := OriginalRow227TriangleData2041.coefficient212_259,
    output := OriginalRow227TriangleData2044.coefficient213_259, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_261, Icur := OriginalRow227TriangleData2041.coefficient212_260,
    output := OriginalRow227TriangleData2044.coefficient213_260, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_262, Icur := OriginalRow227TriangleData2041.coefficient212_261,
    output := OriginalRow227TriangleData2044.coefficient213_261, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_263, Icur := OriginalRow227TriangleData2041.coefficient212_262,
    output := OriginalRow227TriangleData2044.coefficient213_262, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_264, Icur := OriginalRow227TriangleData2041.coefficient212_263,
    output := OriginalRow227TriangleData2044.coefficient213_263, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_265, Icur := OriginalRow227TriangleData2041.coefficient212_264,
    output := OriginalRow227TriangleData2044.coefficient213_264, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_266, Icur := OriginalRow227TriangleData2041.coefficient212_265,
    output := OriginalRow227TriangleData2044.coefficient213_265, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_267, Icur := OriginalRow227TriangleData2041.coefficient212_266,
    output := OriginalRow227TriangleData2044.coefficient213_266, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_268, Icur := OriginalRow227TriangleData2041.coefficient212_267,
    output := OriginalRow227TriangleData2044.coefficient213_267, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_269, Icur := OriginalRow227TriangleData2041.coefficient212_268,
    output := OriginalRow227TriangleData2044.coefficient213_268, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_270, Icur := OriginalRow227TriangleData2041.coefficient212_269,
    output := OriginalRow227TriangleData2044.coefficient213_269, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_271, Icur := OriginalRow227TriangleData2041.coefficient212_270,
    output := OriginalRow227TriangleData2044.coefficient213_270, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_272, Icur := OriginalRow227TriangleData2041.coefficient212_271,
    output := OriginalRow227TriangleData2044.coefficient213_271, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_273, Icur := OriginalRow227TriangleData2041.coefficient212_272,
    output := OriginalRow227TriangleData2044.coefficient213_272, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2041.coefficient212_274, Icur := OriginalRow227TriangleData2041.coefficient212_273,
    output := OriginalRow227TriangleData2044.coefficient213_273, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2042.coefficient212_275, Icur := OriginalRow227TriangleData2041.coefficient212_274,
    output := OriginalRow227TriangleData2044.coefficient213_274, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root213,
    Inext := OriginalRow227TriangleData2042.coefficient212_276, Icur := OriginalRow227TriangleData2042.coefficient212_275,
    output := OriginalRow227TriangleData2044.coefficient213_275, hC := OriginalRow227TriangleRoots06.root213_pos, hAC := OriginalRow227TriangleRoots06.product213_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2028

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2028.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
