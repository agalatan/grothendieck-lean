import Grothe.UpperChaos.OriginalRow227TriangleData1595
import Grothe.UpperChaos.OriginalRow227TriangleData1596
import Grothe.UpperChaos.OriginalRow227TriangleData1603
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1587
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_228, Icur := OriginalRow227TriangleData1595.coefficient131_227,
    output := OriginalRow227TriangleData1603.coefficient132_227, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_229, Icur := OriginalRow227TriangleData1595.coefficient131_228,
    output := OriginalRow227TriangleData1603.coefficient132_228, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_230, Icur := OriginalRow227TriangleData1595.coefficient131_229,
    output := OriginalRow227TriangleData1603.coefficient132_229, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_231, Icur := OriginalRow227TriangleData1595.coefficient131_230,
    output := OriginalRow227TriangleData1603.coefficient132_230, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_232, Icur := OriginalRow227TriangleData1595.coefficient131_231,
    output := OriginalRow227TriangleData1603.coefficient132_231, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_233, Icur := OriginalRow227TriangleData1595.coefficient131_232,
    output := OriginalRow227TriangleData1603.coefficient132_232, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_234, Icur := OriginalRow227TriangleData1595.coefficient131_233,
    output := OriginalRow227TriangleData1603.coefficient132_233, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_235, Icur := OriginalRow227TriangleData1595.coefficient131_234,
    output := OriginalRow227TriangleData1603.coefficient132_234, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_236, Icur := OriginalRow227TriangleData1595.coefficient131_235,
    output := OriginalRow227TriangleData1603.coefficient132_235, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_237, Icur := OriginalRow227TriangleData1595.coefficient131_236,
    output := OriginalRow227TriangleData1603.coefficient132_236, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_238, Icur := OriginalRow227TriangleData1595.coefficient131_237,
    output := OriginalRow227TriangleData1603.coefficient132_237, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_239, Icur := OriginalRow227TriangleData1595.coefficient131_238,
    output := OriginalRow227TriangleData1603.coefficient132_238, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_240, Icur := OriginalRow227TriangleData1595.coefficient131_239,
    output := OriginalRow227TriangleData1603.coefficient132_239, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_241, Icur := OriginalRow227TriangleData1595.coefficient131_240,
    output := OriginalRow227TriangleData1603.coefficient132_240, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_242, Icur := OriginalRow227TriangleData1595.coefficient131_241,
    output := OriginalRow227TriangleData1603.coefficient132_241, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_243, Icur := OriginalRow227TriangleData1595.coefficient131_242,
    output := OriginalRow227TriangleData1603.coefficient132_242, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_244, Icur := OriginalRow227TriangleData1595.coefficient131_243,
    output := OriginalRow227TriangleData1603.coefficient132_243, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_245, Icur := OriginalRow227TriangleData1595.coefficient131_244,
    output := OriginalRow227TriangleData1603.coefficient132_244, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_246, Icur := OriginalRow227TriangleData1595.coefficient131_245,
    output := OriginalRow227TriangleData1603.coefficient132_245, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_247, Icur := OriginalRow227TriangleData1595.coefficient131_246,
    output := OriginalRow227TriangleData1603.coefficient132_246, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_248, Icur := OriginalRow227TriangleData1595.coefficient131_247,
    output := OriginalRow227TriangleData1603.coefficient132_247, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_249, Icur := OriginalRow227TriangleData1595.coefficient131_248,
    output := OriginalRow227TriangleData1603.coefficient132_248, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_250, Icur := OriginalRow227TriangleData1595.coefficient131_249,
    output := OriginalRow227TriangleData1603.coefficient132_249, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_251, Icur := OriginalRow227TriangleData1595.coefficient131_250,
    output := OriginalRow227TriangleData1603.coefficient132_250, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_252, Icur := OriginalRow227TriangleData1595.coefficient131_251,
    output := OriginalRow227TriangleData1603.coefficient132_251, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_253, Icur := OriginalRow227TriangleData1595.coefficient131_252,
    output := OriginalRow227TriangleData1603.coefficient132_252, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_254, Icur := OriginalRow227TriangleData1595.coefficient131_253,
    output := OriginalRow227TriangleData1603.coefficient132_253, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_255, Icur := OriginalRow227TriangleData1595.coefficient131_254,
    output := OriginalRow227TriangleData1603.coefficient132_254, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_256, Icur := OriginalRow227TriangleData1595.coefficient131_255,
    output := OriginalRow227TriangleData1603.coefficient132_255, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1595.coefficient131_257, Icur := OriginalRow227TriangleData1595.coefficient131_256,
    output := OriginalRow227TriangleData1603.coefficient132_256, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1596.coefficient131_258, Icur := OriginalRow227TriangleData1595.coefficient131_257,
    output := OriginalRow227TriangleData1603.coefficient132_257, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root132,
    Inext := OriginalRow227TriangleData1596.coefficient131_259, Icur := OriginalRow227TriangleData1596.coefficient131_258,
    output := OriginalRow227TriangleData1603.coefficient132_258, hC := OriginalRow227TriangleRoots04.root132_pos, hAC := OriginalRow227TriangleRoots04.product132_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1587

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1587.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
