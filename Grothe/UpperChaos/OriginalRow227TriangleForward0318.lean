import Grothe.UpperChaos.OriginalRow227TriangleData0319
import Grothe.UpperChaos.OriginalRow227TriangleData0320
import Grothe.UpperChaos.OriginalRow227TriangleData0334
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0318
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_245, Icur := OriginalRow227TriangleData0319.coefficient20_244,
    output := OriginalRow227TriangleData0334.coefficient21_244, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_246, Icur := OriginalRow227TriangleData0319.coefficient20_245,
    output := OriginalRow227TriangleData0334.coefficient21_245, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_247, Icur := OriginalRow227TriangleData0319.coefficient20_246,
    output := OriginalRow227TriangleData0334.coefficient21_246, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_248, Icur := OriginalRow227TriangleData0319.coefficient20_247,
    output := OriginalRow227TriangleData0334.coefficient21_247, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_249, Icur := OriginalRow227TriangleData0319.coefficient20_248,
    output := OriginalRow227TriangleData0334.coefficient21_248, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_250, Icur := OriginalRow227TriangleData0319.coefficient20_249,
    output := OriginalRow227TriangleData0334.coefficient21_249, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_251, Icur := OriginalRow227TriangleData0319.coefficient20_250,
    output := OriginalRow227TriangleData0334.coefficient21_250, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_252, Icur := OriginalRow227TriangleData0319.coefficient20_251,
    output := OriginalRow227TriangleData0334.coefficient21_251, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_253, Icur := OriginalRow227TriangleData0319.coefficient20_252,
    output := OriginalRow227TriangleData0334.coefficient21_252, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_254, Icur := OriginalRow227TriangleData0319.coefficient20_253,
    output := OriginalRow227TriangleData0334.coefficient21_253, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_255, Icur := OriginalRow227TriangleData0319.coefficient20_254,
    output := OriginalRow227TriangleData0334.coefficient21_254, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_256, Icur := OriginalRow227TriangleData0319.coefficient20_255,
    output := OriginalRow227TriangleData0334.coefficient21_255, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_257, Icur := OriginalRow227TriangleData0319.coefficient20_256,
    output := OriginalRow227TriangleData0334.coefficient21_256, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_258, Icur := OriginalRow227TriangleData0319.coefficient20_257,
    output := OriginalRow227TriangleData0334.coefficient21_257, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_259, Icur := OriginalRow227TriangleData0319.coefficient20_258,
    output := OriginalRow227TriangleData0334.coefficient21_258, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_260, Icur := OriginalRow227TriangleData0319.coefficient20_259,
    output := OriginalRow227TriangleData0334.coefficient21_259, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_261, Icur := OriginalRow227TriangleData0319.coefficient20_260,
    output := OriginalRow227TriangleData0334.coefficient21_260, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_262, Icur := OriginalRow227TriangleData0319.coefficient20_261,
    output := OriginalRow227TriangleData0334.coefficient21_261, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_263, Icur := OriginalRow227TriangleData0319.coefficient20_262,
    output := OriginalRow227TriangleData0334.coefficient21_262, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_264, Icur := OriginalRow227TriangleData0319.coefficient20_263,
    output := OriginalRow227TriangleData0334.coefficient21_263, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_265, Icur := OriginalRow227TriangleData0319.coefficient20_264,
    output := OriginalRow227TriangleData0334.coefficient21_264, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_266, Icur := OriginalRow227TriangleData0319.coefficient20_265,
    output := OriginalRow227TriangleData0334.coefficient21_265, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_267, Icur := OriginalRow227TriangleData0319.coefficient20_266,
    output := OriginalRow227TriangleData0334.coefficient21_266, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_268, Icur := OriginalRow227TriangleData0319.coefficient20_267,
    output := OriginalRow227TriangleData0334.coefficient21_267, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_269, Icur := OriginalRow227TriangleData0319.coefficient20_268,
    output := OriginalRow227TriangleData0334.coefficient21_268, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_270, Icur := OriginalRow227TriangleData0319.coefficient20_269,
    output := OriginalRow227TriangleData0334.coefficient21_269, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_271, Icur := OriginalRow227TriangleData0319.coefficient20_270,
    output := OriginalRow227TriangleData0334.coefficient21_270, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_272, Icur := OriginalRow227TriangleData0319.coefficient20_271,
    output := OriginalRow227TriangleData0334.coefficient21_271, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_273, Icur := OriginalRow227TriangleData0319.coefficient20_272,
    output := OriginalRow227TriangleData0334.coefficient21_272, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_274, Icur := OriginalRow227TriangleData0319.coefficient20_273,
    output := OriginalRow227TriangleData0334.coefficient21_273, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0320.coefficient20_275, Icur := OriginalRow227TriangleData0319.coefficient20_274,
    output := OriginalRow227TriangleData0334.coefficient21_274, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0320.coefficient20_276, Icur := OriginalRow227TriangleData0320.coefficient20_275,
    output := OriginalRow227TriangleData0334.coefficient21_275, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0318

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0318.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
