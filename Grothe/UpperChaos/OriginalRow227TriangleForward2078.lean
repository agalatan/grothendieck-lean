import Grothe.UpperChaos.OriginalRow227TriangleData2092
import Grothe.UpperChaos.OriginalRow227TriangleData2093
import Grothe.UpperChaos.OriginalRow227TriangleData2094
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2078
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_235, Icur := OriginalRow227TriangleData2092.coefficient234_234,
    output := OriginalRow227TriangleData2094.coefficient235_234, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_236, Icur := OriginalRow227TriangleData2092.coefficient234_235,
    output := OriginalRow227TriangleData2094.coefficient235_235, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_237, Icur := OriginalRow227TriangleData2092.coefficient234_236,
    output := OriginalRow227TriangleData2094.coefficient235_236, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_238, Icur := OriginalRow227TriangleData2092.coefficient234_237,
    output := OriginalRow227TriangleData2094.coefficient235_237, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_239, Icur := OriginalRow227TriangleData2092.coefficient234_238,
    output := OriginalRow227TriangleData2094.coefficient235_238, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_240, Icur := OriginalRow227TriangleData2092.coefficient234_239,
    output := OriginalRow227TriangleData2094.coefficient235_239, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_241, Icur := OriginalRow227TriangleData2092.coefficient234_240,
    output := OriginalRow227TriangleData2094.coefficient235_240, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_242, Icur := OriginalRow227TriangleData2092.coefficient234_241,
    output := OriginalRow227TriangleData2094.coefficient235_241, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_243, Icur := OriginalRow227TriangleData2092.coefficient234_242,
    output := OriginalRow227TriangleData2094.coefficient235_242, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_244, Icur := OriginalRow227TriangleData2092.coefficient234_243,
    output := OriginalRow227TriangleData2094.coefficient235_243, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_245, Icur := OriginalRow227TriangleData2092.coefficient234_244,
    output := OriginalRow227TriangleData2094.coefficient235_244, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_246, Icur := OriginalRow227TriangleData2092.coefficient234_245,
    output := OriginalRow227TriangleData2094.coefficient235_245, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_247, Icur := OriginalRow227TriangleData2092.coefficient234_246,
    output := OriginalRow227TriangleData2094.coefficient235_246, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_248, Icur := OriginalRow227TriangleData2092.coefficient234_247,
    output := OriginalRow227TriangleData2094.coefficient235_247, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_249, Icur := OriginalRow227TriangleData2092.coefficient234_248,
    output := OriginalRow227TriangleData2094.coefficient235_248, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_250, Icur := OriginalRow227TriangleData2092.coefficient234_249,
    output := OriginalRow227TriangleData2094.coefficient235_249, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_251, Icur := OriginalRow227TriangleData2092.coefficient234_250,
    output := OriginalRow227TriangleData2094.coefficient235_250, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_252, Icur := OriginalRow227TriangleData2092.coefficient234_251,
    output := OriginalRow227TriangleData2094.coefficient235_251, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_253, Icur := OriginalRow227TriangleData2092.coefficient234_252,
    output := OriginalRow227TriangleData2094.coefficient235_252, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_254, Icur := OriginalRow227TriangleData2092.coefficient234_253,
    output := OriginalRow227TriangleData2094.coefficient235_253, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_255, Icur := OriginalRow227TriangleData2092.coefficient234_254,
    output := OriginalRow227TriangleData2094.coefficient235_254, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_256, Icur := OriginalRow227TriangleData2092.coefficient234_255,
    output := OriginalRow227TriangleData2094.coefficient235_255, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_257, Icur := OriginalRow227TriangleData2092.coefficient234_256,
    output := OriginalRow227TriangleData2094.coefficient235_256, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_258, Icur := OriginalRow227TriangleData2092.coefficient234_257,
    output := OriginalRow227TriangleData2094.coefficient235_257, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_259, Icur := OriginalRow227TriangleData2092.coefficient234_258,
    output := OriginalRow227TriangleData2094.coefficient235_258, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_260, Icur := OriginalRow227TriangleData2092.coefficient234_259,
    output := OriginalRow227TriangleData2094.coefficient235_259, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_261, Icur := OriginalRow227TriangleData2092.coefficient234_260,
    output := OriginalRow227TriangleData2094.coefficient235_260, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_262, Icur := OriginalRow227TriangleData2092.coefficient234_261,
    output := OriginalRow227TriangleData2094.coefficient235_261, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_263, Icur := OriginalRow227TriangleData2092.coefficient234_262,
    output := OriginalRow227TriangleData2094.coefficient235_262, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2092.coefficient234_264, Icur := OriginalRow227TriangleData2092.coefficient234_263,
    output := OriginalRow227TriangleData2094.coefficient235_263, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2093.coefficient234_265, Icur := OriginalRow227TriangleData2092.coefficient234_264,
    output := OriginalRow227TriangleData2094.coefficient235_264, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2093.coefficient234_266, Icur := OriginalRow227TriangleData2093.coefficient234_265,
    output := OriginalRow227TriangleData2094.coefficient235_265, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2078

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2078.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
