import Grothe.UpperChaos.OriginalRow227TriangleData2094
import Grothe.UpperChaos.OriginalRow227TriangleData2095
import Grothe.UpperChaos.OriginalRow227TriangleData2096
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2080
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_236, Icur := OriginalRow227TriangleData2094.coefficient235_235,
    output := OriginalRow227TriangleData2096.coefficient236_235, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_237, Icur := OriginalRow227TriangleData2094.coefficient235_236,
    output := OriginalRow227TriangleData2096.coefficient236_236, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_238, Icur := OriginalRow227TriangleData2094.coefficient235_237,
    output := OriginalRow227TriangleData2096.coefficient236_237, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_239, Icur := OriginalRow227TriangleData2094.coefficient235_238,
    output := OriginalRow227TriangleData2096.coefficient236_238, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_240, Icur := OriginalRow227TriangleData2094.coefficient235_239,
    output := OriginalRow227TriangleData2096.coefficient236_239, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_241, Icur := OriginalRow227TriangleData2094.coefficient235_240,
    output := OriginalRow227TriangleData2096.coefficient236_240, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_242, Icur := OriginalRow227TriangleData2094.coefficient235_241,
    output := OriginalRow227TriangleData2096.coefficient236_241, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_243, Icur := OriginalRow227TriangleData2094.coefficient235_242,
    output := OriginalRow227TriangleData2096.coefficient236_242, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_244, Icur := OriginalRow227TriangleData2094.coefficient235_243,
    output := OriginalRow227TriangleData2096.coefficient236_243, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_245, Icur := OriginalRow227TriangleData2094.coefficient235_244,
    output := OriginalRow227TriangleData2096.coefficient236_244, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_246, Icur := OriginalRow227TriangleData2094.coefficient235_245,
    output := OriginalRow227TriangleData2096.coefficient236_245, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_247, Icur := OriginalRow227TriangleData2094.coefficient235_246,
    output := OriginalRow227TriangleData2096.coefficient236_246, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_248, Icur := OriginalRow227TriangleData2094.coefficient235_247,
    output := OriginalRow227TriangleData2096.coefficient236_247, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_249, Icur := OriginalRow227TriangleData2094.coefficient235_248,
    output := OriginalRow227TriangleData2096.coefficient236_248, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_250, Icur := OriginalRow227TriangleData2094.coefficient235_249,
    output := OriginalRow227TriangleData2096.coefficient236_249, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_251, Icur := OriginalRow227TriangleData2094.coefficient235_250,
    output := OriginalRow227TriangleData2096.coefficient236_250, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_252, Icur := OriginalRow227TriangleData2094.coefficient235_251,
    output := OriginalRow227TriangleData2096.coefficient236_251, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_253, Icur := OriginalRow227TriangleData2094.coefficient235_252,
    output := OriginalRow227TriangleData2096.coefficient236_252, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_254, Icur := OriginalRow227TriangleData2094.coefficient235_253,
    output := OriginalRow227TriangleData2096.coefficient236_253, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_255, Icur := OriginalRow227TriangleData2094.coefficient235_254,
    output := OriginalRow227TriangleData2096.coefficient236_254, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_256, Icur := OriginalRow227TriangleData2094.coefficient235_255,
    output := OriginalRow227TriangleData2096.coefficient236_255, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_257, Icur := OriginalRow227TriangleData2094.coefficient235_256,
    output := OriginalRow227TriangleData2096.coefficient236_256, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_258, Icur := OriginalRow227TriangleData2094.coefficient235_257,
    output := OriginalRow227TriangleData2096.coefficient236_257, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_259, Icur := OriginalRow227TriangleData2094.coefficient235_258,
    output := OriginalRow227TriangleData2096.coefficient236_258, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_260, Icur := OriginalRow227TriangleData2094.coefficient235_259,
    output := OriginalRow227TriangleData2096.coefficient236_259, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_261, Icur := OriginalRow227TriangleData2094.coefficient235_260,
    output := OriginalRow227TriangleData2096.coefficient236_260, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_262, Icur := OriginalRow227TriangleData2094.coefficient235_261,
    output := OriginalRow227TriangleData2096.coefficient236_261, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_263, Icur := OriginalRow227TriangleData2094.coefficient235_262,
    output := OriginalRow227TriangleData2096.coefficient236_262, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_264, Icur := OriginalRow227TriangleData2094.coefficient235_263,
    output := OriginalRow227TriangleData2096.coefficient236_263, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2094.coefficient235_265, Icur := OriginalRow227TriangleData2094.coefficient235_264,
    output := OriginalRow227TriangleData2096.coefficient236_264, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots07.root236,
    Inext := OriginalRow227TriangleData2095.coefficient235_266, Icur := OriginalRow227TriangleData2094.coefficient235_265,
    output := OriginalRow227TriangleData2096.coefficient236_265, hC := OriginalRow227TriangleRoots07.root236_pos, hAC := OriginalRow227TriangleRoots07.product236_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2080

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2080.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
