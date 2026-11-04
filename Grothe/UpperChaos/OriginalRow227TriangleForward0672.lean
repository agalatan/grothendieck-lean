import Grothe.UpperChaos.OriginalRow227TriangleData0675
import Grothe.UpperChaos.OriginalRow227TriangleData0676
import Grothe.UpperChaos.OriginalRow227TriangleData0688
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0672
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_238, Icur := OriginalRow227TriangleData0675.coefficient45_237,
    output := OriginalRow227TriangleData0688.coefficient46_237, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_239, Icur := OriginalRow227TriangleData0675.coefficient45_238,
    output := OriginalRow227TriangleData0688.coefficient46_238, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_240, Icur := OriginalRow227TriangleData0675.coefficient45_239,
    output := OriginalRow227TriangleData0688.coefficient46_239, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_241, Icur := OriginalRow227TriangleData0675.coefficient45_240,
    output := OriginalRow227TriangleData0688.coefficient46_240, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_242, Icur := OriginalRow227TriangleData0675.coefficient45_241,
    output := OriginalRow227TriangleData0688.coefficient46_241, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_243, Icur := OriginalRow227TriangleData0675.coefficient45_242,
    output := OriginalRow227TriangleData0688.coefficient46_242, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_244, Icur := OriginalRow227TriangleData0675.coefficient45_243,
    output := OriginalRow227TriangleData0688.coefficient46_243, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_245, Icur := OriginalRow227TriangleData0675.coefficient45_244,
    output := OriginalRow227TriangleData0688.coefficient46_244, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_246, Icur := OriginalRow227TriangleData0675.coefficient45_245,
    output := OriginalRow227TriangleData0688.coefficient46_245, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_247, Icur := OriginalRow227TriangleData0675.coefficient45_246,
    output := OriginalRow227TriangleData0688.coefficient46_246, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_248, Icur := OriginalRow227TriangleData0675.coefficient45_247,
    output := OriginalRow227TriangleData0688.coefficient46_247, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_249, Icur := OriginalRow227TriangleData0675.coefficient45_248,
    output := OriginalRow227TriangleData0688.coefficient46_248, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_250, Icur := OriginalRow227TriangleData0675.coefficient45_249,
    output := OriginalRow227TriangleData0688.coefficient46_249, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_251, Icur := OriginalRow227TriangleData0675.coefficient45_250,
    output := OriginalRow227TriangleData0688.coefficient46_250, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_252, Icur := OriginalRow227TriangleData0675.coefficient45_251,
    output := OriginalRow227TriangleData0688.coefficient46_251, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_253, Icur := OriginalRow227TriangleData0675.coefficient45_252,
    output := OriginalRow227TriangleData0688.coefficient46_252, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_254, Icur := OriginalRow227TriangleData0675.coefficient45_253,
    output := OriginalRow227TriangleData0688.coefficient46_253, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_255, Icur := OriginalRow227TriangleData0675.coefficient45_254,
    output := OriginalRow227TriangleData0688.coefficient46_254, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_256, Icur := OriginalRow227TriangleData0675.coefficient45_255,
    output := OriginalRow227TriangleData0688.coefficient46_255, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_257, Icur := OriginalRow227TriangleData0675.coefficient45_256,
    output := OriginalRow227TriangleData0688.coefficient46_256, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_258, Icur := OriginalRow227TriangleData0675.coefficient45_257,
    output := OriginalRow227TriangleData0688.coefficient46_257, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_259, Icur := OriginalRow227TriangleData0675.coefficient45_258,
    output := OriginalRow227TriangleData0688.coefficient46_258, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_260, Icur := OriginalRow227TriangleData0675.coefficient45_259,
    output := OriginalRow227TriangleData0688.coefficient46_259, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_261, Icur := OriginalRow227TriangleData0675.coefficient45_260,
    output := OriginalRow227TriangleData0688.coefficient46_260, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_262, Icur := OriginalRow227TriangleData0675.coefficient45_261,
    output := OriginalRow227TriangleData0688.coefficient46_261, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_263, Icur := OriginalRow227TriangleData0675.coefficient45_262,
    output := OriginalRow227TriangleData0688.coefficient46_262, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_264, Icur := OriginalRow227TriangleData0675.coefficient45_263,
    output := OriginalRow227TriangleData0688.coefficient46_263, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_265, Icur := OriginalRow227TriangleData0675.coefficient45_264,
    output := OriginalRow227TriangleData0688.coefficient46_264, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_266, Icur := OriginalRow227TriangleData0675.coefficient45_265,
    output := OriginalRow227TriangleData0688.coefficient46_265, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0675.coefficient45_267, Icur := OriginalRow227TriangleData0675.coefficient45_266,
    output := OriginalRow227TriangleData0688.coefficient46_266, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0676.coefficient45_268, Icur := OriginalRow227TriangleData0675.coefficient45_267,
    output := OriginalRow227TriangleData0688.coefficient46_267, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0676.coefficient45_269, Icur := OriginalRow227TriangleData0676.coefficient45_268,
    output := OriginalRow227TriangleData0688.coefficient46_268, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0672

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0672.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
