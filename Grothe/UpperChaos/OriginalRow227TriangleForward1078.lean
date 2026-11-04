import Grothe.UpperChaos.OriginalRow227TriangleData1083
import Grothe.UpperChaos.OriginalRow227TriangleData1084
import Grothe.UpperChaos.OriginalRow227TriangleData1094
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1078
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_239, Icur := OriginalRow227TriangleData1083.coefficient78_238,
    output := OriginalRow227TriangleData1094.coefficient79_238, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_240, Icur := OriginalRow227TriangleData1083.coefficient78_239,
    output := OriginalRow227TriangleData1094.coefficient79_239, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_241, Icur := OriginalRow227TriangleData1083.coefficient78_240,
    output := OriginalRow227TriangleData1094.coefficient79_240, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_242, Icur := OriginalRow227TriangleData1083.coefficient78_241,
    output := OriginalRow227TriangleData1094.coefficient79_241, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_243, Icur := OriginalRow227TriangleData1083.coefficient78_242,
    output := OriginalRow227TriangleData1094.coefficient79_242, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_244, Icur := OriginalRow227TriangleData1083.coefficient78_243,
    output := OriginalRow227TriangleData1094.coefficient79_243, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_245, Icur := OriginalRow227TriangleData1083.coefficient78_244,
    output := OriginalRow227TriangleData1094.coefficient79_244, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_246, Icur := OriginalRow227TriangleData1083.coefficient78_245,
    output := OriginalRow227TriangleData1094.coefficient79_245, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_247, Icur := OriginalRow227TriangleData1083.coefficient78_246,
    output := OriginalRow227TriangleData1094.coefficient79_246, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_248, Icur := OriginalRow227TriangleData1083.coefficient78_247,
    output := OriginalRow227TriangleData1094.coefficient79_247, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_249, Icur := OriginalRow227TriangleData1083.coefficient78_248,
    output := OriginalRow227TriangleData1094.coefficient79_248, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_250, Icur := OriginalRow227TriangleData1083.coefficient78_249,
    output := OriginalRow227TriangleData1094.coefficient79_249, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_251, Icur := OriginalRow227TriangleData1083.coefficient78_250,
    output := OriginalRow227TriangleData1094.coefficient79_250, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_252, Icur := OriginalRow227TriangleData1083.coefficient78_251,
    output := OriginalRow227TriangleData1094.coefficient79_251, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_253, Icur := OriginalRow227TriangleData1083.coefficient78_252,
    output := OriginalRow227TriangleData1094.coefficient79_252, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_254, Icur := OriginalRow227TriangleData1083.coefficient78_253,
    output := OriginalRow227TriangleData1094.coefficient79_253, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_255, Icur := OriginalRow227TriangleData1083.coefficient78_254,
    output := OriginalRow227TriangleData1094.coefficient79_254, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_256, Icur := OriginalRow227TriangleData1083.coefficient78_255,
    output := OriginalRow227TriangleData1094.coefficient79_255, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_257, Icur := OriginalRow227TriangleData1083.coefficient78_256,
    output := OriginalRow227TriangleData1094.coefficient79_256, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_258, Icur := OriginalRow227TriangleData1083.coefficient78_257,
    output := OriginalRow227TriangleData1094.coefficient79_257, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_259, Icur := OriginalRow227TriangleData1083.coefficient78_258,
    output := OriginalRow227TriangleData1094.coefficient79_258, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_260, Icur := OriginalRow227TriangleData1083.coefficient78_259,
    output := OriginalRow227TriangleData1094.coefficient79_259, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_261, Icur := OriginalRow227TriangleData1083.coefficient78_260,
    output := OriginalRow227TriangleData1094.coefficient79_260, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_262, Icur := OriginalRow227TriangleData1083.coefficient78_261,
    output := OriginalRow227TriangleData1094.coefficient79_261, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_263, Icur := OriginalRow227TriangleData1083.coefficient78_262,
    output := OriginalRow227TriangleData1094.coefficient79_262, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_264, Icur := OriginalRow227TriangleData1083.coefficient78_263,
    output := OriginalRow227TriangleData1094.coefficient79_263, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_265, Icur := OriginalRow227TriangleData1083.coefficient78_264,
    output := OriginalRow227TriangleData1094.coefficient79_264, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_266, Icur := OriginalRow227TriangleData1083.coefficient78_265,
    output := OriginalRow227TriangleData1094.coefficient79_265, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_267, Icur := OriginalRow227TriangleData1083.coefficient78_266,
    output := OriginalRow227TriangleData1094.coefficient79_266, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1083.coefficient78_268, Icur := OriginalRow227TriangleData1083.coefficient78_267,
    output := OriginalRow227TriangleData1094.coefficient79_267, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_269, Icur := OriginalRow227TriangleData1083.coefficient78_268,
    output := OriginalRow227TriangleData1094.coefficient79_268, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_270, Icur := OriginalRow227TriangleData1084.coefficient78_269,
    output := OriginalRow227TriangleData1094.coefficient79_269, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1078

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1078.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
