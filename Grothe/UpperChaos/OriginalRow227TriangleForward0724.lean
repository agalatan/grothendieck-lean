import Grothe.UpperChaos.OriginalRow227TriangleData0727
import Grothe.UpperChaos.OriginalRow227TriangleData0728
import Grothe.UpperChaos.OriginalRow227TriangleData0740
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0724
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_242, Icur := OriginalRow227TriangleData0727.coefficient49_241,
    output := OriginalRow227TriangleData0740.coefficient50_241, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_243, Icur := OriginalRow227TriangleData0727.coefficient49_242,
    output := OriginalRow227TriangleData0740.coefficient50_242, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_244, Icur := OriginalRow227TriangleData0727.coefficient49_243,
    output := OriginalRow227TriangleData0740.coefficient50_243, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_245, Icur := OriginalRow227TriangleData0727.coefficient49_244,
    output := OriginalRow227TriangleData0740.coefficient50_244, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_246, Icur := OriginalRow227TriangleData0727.coefficient49_245,
    output := OriginalRow227TriangleData0740.coefficient50_245, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_247, Icur := OriginalRow227TriangleData0727.coefficient49_246,
    output := OriginalRow227TriangleData0740.coefficient50_246, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_248, Icur := OriginalRow227TriangleData0727.coefficient49_247,
    output := OriginalRow227TriangleData0740.coefficient50_247, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_249, Icur := OriginalRow227TriangleData0727.coefficient49_248,
    output := OriginalRow227TriangleData0740.coefficient50_248, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_250, Icur := OriginalRow227TriangleData0727.coefficient49_249,
    output := OriginalRow227TriangleData0740.coefficient50_249, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_251, Icur := OriginalRow227TriangleData0727.coefficient49_250,
    output := OriginalRow227TriangleData0740.coefficient50_250, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_252, Icur := OriginalRow227TriangleData0727.coefficient49_251,
    output := OriginalRow227TriangleData0740.coefficient50_251, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_253, Icur := OriginalRow227TriangleData0727.coefficient49_252,
    output := OriginalRow227TriangleData0740.coefficient50_252, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_254, Icur := OriginalRow227TriangleData0727.coefficient49_253,
    output := OriginalRow227TriangleData0740.coefficient50_253, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_255, Icur := OriginalRow227TriangleData0727.coefficient49_254,
    output := OriginalRow227TriangleData0740.coefficient50_254, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_256, Icur := OriginalRow227TriangleData0727.coefficient49_255,
    output := OriginalRow227TriangleData0740.coefficient50_255, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_257, Icur := OriginalRow227TriangleData0727.coefficient49_256,
    output := OriginalRow227TriangleData0740.coefficient50_256, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_258, Icur := OriginalRow227TriangleData0727.coefficient49_257,
    output := OriginalRow227TriangleData0740.coefficient50_257, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_259, Icur := OriginalRow227TriangleData0727.coefficient49_258,
    output := OriginalRow227TriangleData0740.coefficient50_258, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_260, Icur := OriginalRow227TriangleData0727.coefficient49_259,
    output := OriginalRow227TriangleData0740.coefficient50_259, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_261, Icur := OriginalRow227TriangleData0727.coefficient49_260,
    output := OriginalRow227TriangleData0740.coefficient50_260, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_262, Icur := OriginalRow227TriangleData0727.coefficient49_261,
    output := OriginalRow227TriangleData0740.coefficient50_261, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_263, Icur := OriginalRow227TriangleData0727.coefficient49_262,
    output := OriginalRow227TriangleData0740.coefficient50_262, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_264, Icur := OriginalRow227TriangleData0727.coefficient49_263,
    output := OriginalRow227TriangleData0740.coefficient50_263, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_265, Icur := OriginalRow227TriangleData0727.coefficient49_264,
    output := OriginalRow227TriangleData0740.coefficient50_264, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_266, Icur := OriginalRow227TriangleData0727.coefficient49_265,
    output := OriginalRow227TriangleData0740.coefficient50_265, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_267, Icur := OriginalRow227TriangleData0727.coefficient49_266,
    output := OriginalRow227TriangleData0740.coefficient50_266, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_268, Icur := OriginalRow227TriangleData0727.coefficient49_267,
    output := OriginalRow227TriangleData0740.coefficient50_267, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_269, Icur := OriginalRow227TriangleData0727.coefficient49_268,
    output := OriginalRow227TriangleData0740.coefficient50_268, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_270, Icur := OriginalRow227TriangleData0727.coefficient49_269,
    output := OriginalRow227TriangleData0740.coefficient50_269, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_271, Icur := OriginalRow227TriangleData0727.coefficient49_270,
    output := OriginalRow227TriangleData0740.coefficient50_270, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0728.coefficient49_272, Icur := OriginalRow227TriangleData0727.coefficient49_271,
    output := OriginalRow227TriangleData0740.coefficient50_271, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0728.coefficient49_273, Icur := OriginalRow227TriangleData0728.coefficient49_272,
    output := OriginalRow227TriangleData0740.coefficient50_272, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0724

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0724.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
