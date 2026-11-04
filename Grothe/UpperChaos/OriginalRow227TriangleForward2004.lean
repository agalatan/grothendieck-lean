import Grothe.UpperChaos.OriginalRow227TriangleData2017
import Grothe.UpperChaos.OriginalRow227TriangleData2018
import Grothe.UpperChaos.OriginalRow227TriangleData2020
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2004
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_237, Icur := OriginalRow227TriangleData2017.coefficient204_236,
    output := OriginalRow227TriangleData2020.coefficient205_236, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_238, Icur := OriginalRow227TriangleData2017.coefficient204_237,
    output := OriginalRow227TriangleData2020.coefficient205_237, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_239, Icur := OriginalRow227TriangleData2017.coefficient204_238,
    output := OriginalRow227TriangleData2020.coefficient205_238, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_240, Icur := OriginalRow227TriangleData2017.coefficient204_239,
    output := OriginalRow227TriangleData2020.coefficient205_239, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_241, Icur := OriginalRow227TriangleData2017.coefficient204_240,
    output := OriginalRow227TriangleData2020.coefficient205_240, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_242, Icur := OriginalRow227TriangleData2017.coefficient204_241,
    output := OriginalRow227TriangleData2020.coefficient205_241, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_243, Icur := OriginalRow227TriangleData2017.coefficient204_242,
    output := OriginalRow227TriangleData2020.coefficient205_242, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_244, Icur := OriginalRow227TriangleData2017.coefficient204_243,
    output := OriginalRow227TriangleData2020.coefficient205_243, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_245, Icur := OriginalRow227TriangleData2017.coefficient204_244,
    output := OriginalRow227TriangleData2020.coefficient205_244, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_246, Icur := OriginalRow227TriangleData2017.coefficient204_245,
    output := OriginalRow227TriangleData2020.coefficient205_245, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_247, Icur := OriginalRow227TriangleData2017.coefficient204_246,
    output := OriginalRow227TriangleData2020.coefficient205_246, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_248, Icur := OriginalRow227TriangleData2017.coefficient204_247,
    output := OriginalRow227TriangleData2020.coefficient205_247, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_249, Icur := OriginalRow227TriangleData2017.coefficient204_248,
    output := OriginalRow227TriangleData2020.coefficient205_248, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_250, Icur := OriginalRow227TriangleData2017.coefficient204_249,
    output := OriginalRow227TriangleData2020.coefficient205_249, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_251, Icur := OriginalRow227TriangleData2017.coefficient204_250,
    output := OriginalRow227TriangleData2020.coefficient205_250, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_252, Icur := OriginalRow227TriangleData2017.coefficient204_251,
    output := OriginalRow227TriangleData2020.coefficient205_251, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_253, Icur := OriginalRow227TriangleData2017.coefficient204_252,
    output := OriginalRow227TriangleData2020.coefficient205_252, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_254, Icur := OriginalRow227TriangleData2017.coefficient204_253,
    output := OriginalRow227TriangleData2020.coefficient205_253, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_255, Icur := OriginalRow227TriangleData2017.coefficient204_254,
    output := OriginalRow227TriangleData2020.coefficient205_254, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_256, Icur := OriginalRow227TriangleData2017.coefficient204_255,
    output := OriginalRow227TriangleData2020.coefficient205_255, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_257, Icur := OriginalRow227TriangleData2017.coefficient204_256,
    output := OriginalRow227TriangleData2020.coefficient205_256, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_258, Icur := OriginalRow227TriangleData2017.coefficient204_257,
    output := OriginalRow227TriangleData2020.coefficient205_257, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_259, Icur := OriginalRow227TriangleData2017.coefficient204_258,
    output := OriginalRow227TriangleData2020.coefficient205_258, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_260, Icur := OriginalRow227TriangleData2017.coefficient204_259,
    output := OriginalRow227TriangleData2020.coefficient205_259, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_261, Icur := OriginalRow227TriangleData2017.coefficient204_260,
    output := OriginalRow227TriangleData2020.coefficient205_260, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_262, Icur := OriginalRow227TriangleData2017.coefficient204_261,
    output := OriginalRow227TriangleData2020.coefficient205_261, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_263, Icur := OriginalRow227TriangleData2017.coefficient204_262,
    output := OriginalRow227TriangleData2020.coefficient205_262, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_264, Icur := OriginalRow227TriangleData2017.coefficient204_263,
    output := OriginalRow227TriangleData2020.coefficient205_263, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_265, Icur := OriginalRow227TriangleData2017.coefficient204_264,
    output := OriginalRow227TriangleData2020.coefficient205_264, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2017.coefficient204_266, Icur := OriginalRow227TriangleData2017.coefficient204_265,
    output := OriginalRow227TriangleData2020.coefficient205_265, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2018.coefficient204_267, Icur := OriginalRow227TriangleData2017.coefficient204_266,
    output := OriginalRow227TriangleData2020.coefficient205_266, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root205,
    Inext := OriginalRow227TriangleData2018.coefficient204_268, Icur := OriginalRow227TriangleData2018.coefficient204_267,
    output := OriginalRow227TriangleData2020.coefficient205_267, hC := OriginalRow227TriangleRoots06.root205_pos, hAC := OriginalRow227TriangleRoots06.product205_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2004

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2004.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
