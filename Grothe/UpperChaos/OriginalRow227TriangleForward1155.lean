import Grothe.UpperChaos.OriginalRow227TriangleData1160
import Grothe.UpperChaos.OriginalRow227TriangleData1161
import Grothe.UpperChaos.OriginalRow227TriangleData1171
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1155
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_246, Icur := OriginalRow227TriangleData1160.coefficient85_245,
    output := OriginalRow227TriangleData1171.coefficient86_245, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_247, Icur := OriginalRow227TriangleData1160.coefficient85_246,
    output := OriginalRow227TriangleData1171.coefficient86_246, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_248, Icur := OriginalRow227TriangleData1160.coefficient85_247,
    output := OriginalRow227TriangleData1171.coefficient86_247, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_249, Icur := OriginalRow227TriangleData1160.coefficient85_248,
    output := OriginalRow227TriangleData1171.coefficient86_248, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_250, Icur := OriginalRow227TriangleData1160.coefficient85_249,
    output := OriginalRow227TriangleData1171.coefficient86_249, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_251, Icur := OriginalRow227TriangleData1160.coefficient85_250,
    output := OriginalRow227TriangleData1171.coefficient86_250, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_252, Icur := OriginalRow227TriangleData1160.coefficient85_251,
    output := OriginalRow227TriangleData1171.coefficient86_251, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_253, Icur := OriginalRow227TriangleData1160.coefficient85_252,
    output := OriginalRow227TriangleData1171.coefficient86_252, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_254, Icur := OriginalRow227TriangleData1160.coefficient85_253,
    output := OriginalRow227TriangleData1171.coefficient86_253, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_255, Icur := OriginalRow227TriangleData1160.coefficient85_254,
    output := OriginalRow227TriangleData1171.coefficient86_254, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_256, Icur := OriginalRow227TriangleData1160.coefficient85_255,
    output := OriginalRow227TriangleData1171.coefficient86_255, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_257, Icur := OriginalRow227TriangleData1160.coefficient85_256,
    output := OriginalRow227TriangleData1171.coefficient86_256, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_258, Icur := OriginalRow227TriangleData1160.coefficient85_257,
    output := OriginalRow227TriangleData1171.coefficient86_257, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_259, Icur := OriginalRow227TriangleData1160.coefficient85_258,
    output := OriginalRow227TriangleData1171.coefficient86_258, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_260, Icur := OriginalRow227TriangleData1160.coefficient85_259,
    output := OriginalRow227TriangleData1171.coefficient86_259, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_261, Icur := OriginalRow227TriangleData1160.coefficient85_260,
    output := OriginalRow227TriangleData1171.coefficient86_260, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_262, Icur := OriginalRow227TriangleData1160.coefficient85_261,
    output := OriginalRow227TriangleData1171.coefficient86_261, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_263, Icur := OriginalRow227TriangleData1160.coefficient85_262,
    output := OriginalRow227TriangleData1171.coefficient86_262, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_264, Icur := OriginalRow227TriangleData1160.coefficient85_263,
    output := OriginalRow227TriangleData1171.coefficient86_263, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_265, Icur := OriginalRow227TriangleData1160.coefficient85_264,
    output := OriginalRow227TriangleData1171.coefficient86_264, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_266, Icur := OriginalRow227TriangleData1160.coefficient85_265,
    output := OriginalRow227TriangleData1171.coefficient86_265, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_267, Icur := OriginalRow227TriangleData1160.coefficient85_266,
    output := OriginalRow227TriangleData1171.coefficient86_266, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_268, Icur := OriginalRow227TriangleData1160.coefficient85_267,
    output := OriginalRow227TriangleData1171.coefficient86_267, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_269, Icur := OriginalRow227TriangleData1160.coefficient85_268,
    output := OriginalRow227TriangleData1171.coefficient86_268, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_270, Icur := OriginalRow227TriangleData1160.coefficient85_269,
    output := OriginalRow227TriangleData1171.coefficient86_269, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_271, Icur := OriginalRow227TriangleData1160.coefficient85_270,
    output := OriginalRow227TriangleData1171.coefficient86_270, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_272, Icur := OriginalRow227TriangleData1160.coefficient85_271,
    output := OriginalRow227TriangleData1171.coefficient86_271, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_273, Icur := OriginalRow227TriangleData1160.coefficient85_272,
    output := OriginalRow227TriangleData1171.coefficient86_272, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_274, Icur := OriginalRow227TriangleData1160.coefficient85_273,
    output := OriginalRow227TriangleData1171.coefficient86_273, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1160.coefficient85_275, Icur := OriginalRow227TriangleData1160.coefficient85_274,
    output := OriginalRow227TriangleData1171.coefficient86_274, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1161.coefficient85_276, Icur := OriginalRow227TriangleData1160.coefficient85_275,
    output := OriginalRow227TriangleData1171.coefficient86_275, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1161.coefficient85_277, Icur := OriginalRow227TriangleData1161.coefficient85_276,
    output := OriginalRow227TriangleData1171.coefficient86_276, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1155

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1155.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
