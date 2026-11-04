import Grothe.UpperChaos.OriginalRow227TriangleData1149
import Grothe.UpperChaos.OriginalRow227TriangleData1150
import Grothe.UpperChaos.OriginalRow227TriangleData1160
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1144
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_245, Icur := OriginalRow227TriangleData1149.coefficient84_244,
    output := OriginalRow227TriangleData1160.coefficient85_244, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_246, Icur := OriginalRow227TriangleData1149.coefficient84_245,
    output := OriginalRow227TriangleData1160.coefficient85_245, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_247, Icur := OriginalRow227TriangleData1149.coefficient84_246,
    output := OriginalRow227TriangleData1160.coefficient85_246, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_248, Icur := OriginalRow227TriangleData1149.coefficient84_247,
    output := OriginalRow227TriangleData1160.coefficient85_247, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_249, Icur := OriginalRow227TriangleData1149.coefficient84_248,
    output := OriginalRow227TriangleData1160.coefficient85_248, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_250, Icur := OriginalRow227TriangleData1149.coefficient84_249,
    output := OriginalRow227TriangleData1160.coefficient85_249, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_251, Icur := OriginalRow227TriangleData1149.coefficient84_250,
    output := OriginalRow227TriangleData1160.coefficient85_250, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_252, Icur := OriginalRow227TriangleData1149.coefficient84_251,
    output := OriginalRow227TriangleData1160.coefficient85_251, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_253, Icur := OriginalRow227TriangleData1149.coefficient84_252,
    output := OriginalRow227TriangleData1160.coefficient85_252, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_254, Icur := OriginalRow227TriangleData1149.coefficient84_253,
    output := OriginalRow227TriangleData1160.coefficient85_253, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_255, Icur := OriginalRow227TriangleData1149.coefficient84_254,
    output := OriginalRow227TriangleData1160.coefficient85_254, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_256, Icur := OriginalRow227TriangleData1149.coefficient84_255,
    output := OriginalRow227TriangleData1160.coefficient85_255, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_257, Icur := OriginalRow227TriangleData1149.coefficient84_256,
    output := OriginalRow227TriangleData1160.coefficient85_256, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_258, Icur := OriginalRow227TriangleData1149.coefficient84_257,
    output := OriginalRow227TriangleData1160.coefficient85_257, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_259, Icur := OriginalRow227TriangleData1149.coefficient84_258,
    output := OriginalRow227TriangleData1160.coefficient85_258, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_260, Icur := OriginalRow227TriangleData1149.coefficient84_259,
    output := OriginalRow227TriangleData1160.coefficient85_259, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_261, Icur := OriginalRow227TriangleData1149.coefficient84_260,
    output := OriginalRow227TriangleData1160.coefficient85_260, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_262, Icur := OriginalRow227TriangleData1149.coefficient84_261,
    output := OriginalRow227TriangleData1160.coefficient85_261, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_263, Icur := OriginalRow227TriangleData1149.coefficient84_262,
    output := OriginalRow227TriangleData1160.coefficient85_262, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_264, Icur := OriginalRow227TriangleData1149.coefficient84_263,
    output := OriginalRow227TriangleData1160.coefficient85_263, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_265, Icur := OriginalRow227TriangleData1149.coefficient84_264,
    output := OriginalRow227TriangleData1160.coefficient85_264, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_266, Icur := OriginalRow227TriangleData1149.coefficient84_265,
    output := OriginalRow227TriangleData1160.coefficient85_265, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_267, Icur := OriginalRow227TriangleData1149.coefficient84_266,
    output := OriginalRow227TriangleData1160.coefficient85_266, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_268, Icur := OriginalRow227TriangleData1149.coefficient84_267,
    output := OriginalRow227TriangleData1160.coefficient85_267, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_269, Icur := OriginalRow227TriangleData1149.coefficient84_268,
    output := OriginalRow227TriangleData1160.coefficient85_268, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_270, Icur := OriginalRow227TriangleData1149.coefficient84_269,
    output := OriginalRow227TriangleData1160.coefficient85_269, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_271, Icur := OriginalRow227TriangleData1149.coefficient84_270,
    output := OriginalRow227TriangleData1160.coefficient85_270, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_272, Icur := OriginalRow227TriangleData1149.coefficient84_271,
    output := OriginalRow227TriangleData1160.coefficient85_271, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_273, Icur := OriginalRow227TriangleData1149.coefficient84_272,
    output := OriginalRow227TriangleData1160.coefficient85_272, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1149.coefficient84_274, Icur := OriginalRow227TriangleData1149.coefficient84_273,
    output := OriginalRow227TriangleData1160.coefficient85_273, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_275, Icur := OriginalRow227TriangleData1149.coefficient84_274,
    output := OriginalRow227TriangleData1160.coefficient85_274, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_276, Icur := OriginalRow227TriangleData1150.coefficient84_275,
    output := OriginalRow227TriangleData1160.coefficient85_275, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1144

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1144.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
