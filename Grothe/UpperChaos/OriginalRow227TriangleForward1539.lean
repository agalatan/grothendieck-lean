import Grothe.UpperChaos.OriginalRow227TriangleData1547
import Grothe.UpperChaos.OriginalRow227TriangleData1548
import Grothe.UpperChaos.OriginalRow227TriangleData1555
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1539
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_222, Icur := OriginalRow227TriangleData1547.coefficient125_221,
    output := OriginalRow227TriangleData1555.coefficient126_221, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_223, Icur := OriginalRow227TriangleData1547.coefficient125_222,
    output := OriginalRow227TriangleData1555.coefficient126_222, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_224, Icur := OriginalRow227TriangleData1547.coefficient125_223,
    output := OriginalRow227TriangleData1555.coefficient126_223, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_225, Icur := OriginalRow227TriangleData1547.coefficient125_224,
    output := OriginalRow227TriangleData1555.coefficient126_224, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_226, Icur := OriginalRow227TriangleData1547.coefficient125_225,
    output := OriginalRow227TriangleData1555.coefficient126_225, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_227, Icur := OriginalRow227TriangleData1547.coefficient125_226,
    output := OriginalRow227TriangleData1555.coefficient126_226, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_228, Icur := OriginalRow227TriangleData1547.coefficient125_227,
    output := OriginalRow227TriangleData1555.coefficient126_227, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_229, Icur := OriginalRow227TriangleData1547.coefficient125_228,
    output := OriginalRow227TriangleData1555.coefficient126_228, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_230, Icur := OriginalRow227TriangleData1547.coefficient125_229,
    output := OriginalRow227TriangleData1555.coefficient126_229, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_231, Icur := OriginalRow227TriangleData1547.coefficient125_230,
    output := OriginalRow227TriangleData1555.coefficient126_230, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_232, Icur := OriginalRow227TriangleData1547.coefficient125_231,
    output := OriginalRow227TriangleData1555.coefficient126_231, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_233, Icur := OriginalRow227TriangleData1547.coefficient125_232,
    output := OriginalRow227TriangleData1555.coefficient126_232, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_234, Icur := OriginalRow227TriangleData1547.coefficient125_233,
    output := OriginalRow227TriangleData1555.coefficient126_233, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_235, Icur := OriginalRow227TriangleData1547.coefficient125_234,
    output := OriginalRow227TriangleData1555.coefficient126_234, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_236, Icur := OriginalRow227TriangleData1547.coefficient125_235,
    output := OriginalRow227TriangleData1555.coefficient126_235, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_237, Icur := OriginalRow227TriangleData1547.coefficient125_236,
    output := OriginalRow227TriangleData1555.coefficient126_236, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_238, Icur := OriginalRow227TriangleData1547.coefficient125_237,
    output := OriginalRow227TriangleData1555.coefficient126_237, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_239, Icur := OriginalRow227TriangleData1547.coefficient125_238,
    output := OriginalRow227TriangleData1555.coefficient126_238, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_240, Icur := OriginalRow227TriangleData1547.coefficient125_239,
    output := OriginalRow227TriangleData1555.coefficient126_239, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_241, Icur := OriginalRow227TriangleData1547.coefficient125_240,
    output := OriginalRow227TriangleData1555.coefficient126_240, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_242, Icur := OriginalRow227TriangleData1547.coefficient125_241,
    output := OriginalRow227TriangleData1555.coefficient126_241, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_243, Icur := OriginalRow227TriangleData1547.coefficient125_242,
    output := OriginalRow227TriangleData1555.coefficient126_242, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_244, Icur := OriginalRow227TriangleData1547.coefficient125_243,
    output := OriginalRow227TriangleData1555.coefficient126_243, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_245, Icur := OriginalRow227TriangleData1547.coefficient125_244,
    output := OriginalRow227TriangleData1555.coefficient126_244, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_246, Icur := OriginalRow227TriangleData1547.coefficient125_245,
    output := OriginalRow227TriangleData1555.coefficient126_245, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_247, Icur := OriginalRow227TriangleData1547.coefficient125_246,
    output := OriginalRow227TriangleData1555.coefficient126_246, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_248, Icur := OriginalRow227TriangleData1547.coefficient125_247,
    output := OriginalRow227TriangleData1555.coefficient126_247, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_249, Icur := OriginalRow227TriangleData1547.coefficient125_248,
    output := OriginalRow227TriangleData1555.coefficient126_248, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_250, Icur := OriginalRow227TriangleData1547.coefficient125_249,
    output := OriginalRow227TriangleData1555.coefficient126_249, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1547.coefficient125_251, Icur := OriginalRow227TriangleData1547.coefficient125_250,
    output := OriginalRow227TriangleData1555.coefficient126_250, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1548.coefficient125_252, Icur := OriginalRow227TriangleData1547.coefficient125_251,
    output := OriginalRow227TriangleData1555.coefficient126_251, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1548.coefficient125_253, Icur := OriginalRow227TriangleData1548.coefficient125_252,
    output := OriginalRow227TriangleData1555.coefficient126_252, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1539

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1539.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
