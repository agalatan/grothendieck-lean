import Grothe.UpperChaos.OriginalRow227TriangleData1286
import Grothe.UpperChaos.OriginalRow227TriangleData1287
import Grothe.UpperChaos.OriginalRow227TriangleData1296
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1280
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_226, Icur := OriginalRow227TriangleData1286.coefficient97_225,
    output := OriginalRow227TriangleData1296.coefficient98_225, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_227, Icur := OriginalRow227TriangleData1286.coefficient97_226,
    output := OriginalRow227TriangleData1296.coefficient98_226, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_228, Icur := OriginalRow227TriangleData1286.coefficient97_227,
    output := OriginalRow227TriangleData1296.coefficient98_227, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_229, Icur := OriginalRow227TriangleData1286.coefficient97_228,
    output := OriginalRow227TriangleData1296.coefficient98_228, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_230, Icur := OriginalRow227TriangleData1286.coefficient97_229,
    output := OriginalRow227TriangleData1296.coefficient98_229, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_231, Icur := OriginalRow227TriangleData1286.coefficient97_230,
    output := OriginalRow227TriangleData1296.coefficient98_230, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_232, Icur := OriginalRow227TriangleData1286.coefficient97_231,
    output := OriginalRow227TriangleData1296.coefficient98_231, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_233, Icur := OriginalRow227TriangleData1286.coefficient97_232,
    output := OriginalRow227TriangleData1296.coefficient98_232, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_234, Icur := OriginalRow227TriangleData1286.coefficient97_233,
    output := OriginalRow227TriangleData1296.coefficient98_233, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_235, Icur := OriginalRow227TriangleData1286.coefficient97_234,
    output := OriginalRow227TriangleData1296.coefficient98_234, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_236, Icur := OriginalRow227TriangleData1286.coefficient97_235,
    output := OriginalRow227TriangleData1296.coefficient98_235, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_237, Icur := OriginalRow227TriangleData1286.coefficient97_236,
    output := OriginalRow227TriangleData1296.coefficient98_236, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_238, Icur := OriginalRow227TriangleData1286.coefficient97_237,
    output := OriginalRow227TriangleData1296.coefficient98_237, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_239, Icur := OriginalRow227TriangleData1286.coefficient97_238,
    output := OriginalRow227TriangleData1296.coefficient98_238, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_240, Icur := OriginalRow227TriangleData1286.coefficient97_239,
    output := OriginalRow227TriangleData1296.coefficient98_239, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_241, Icur := OriginalRow227TriangleData1286.coefficient97_240,
    output := OriginalRow227TriangleData1296.coefficient98_240, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_242, Icur := OriginalRow227TriangleData1286.coefficient97_241,
    output := OriginalRow227TriangleData1296.coefficient98_241, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_243, Icur := OriginalRow227TriangleData1286.coefficient97_242,
    output := OriginalRow227TriangleData1296.coefficient98_242, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_244, Icur := OriginalRow227TriangleData1286.coefficient97_243,
    output := OriginalRow227TriangleData1296.coefficient98_243, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_245, Icur := OriginalRow227TriangleData1286.coefficient97_244,
    output := OriginalRow227TriangleData1296.coefficient98_244, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_246, Icur := OriginalRow227TriangleData1286.coefficient97_245,
    output := OriginalRow227TriangleData1296.coefficient98_245, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_247, Icur := OriginalRow227TriangleData1286.coefficient97_246,
    output := OriginalRow227TriangleData1296.coefficient98_246, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_248, Icur := OriginalRow227TriangleData1286.coefficient97_247,
    output := OriginalRow227TriangleData1296.coefficient98_247, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_249, Icur := OriginalRow227TriangleData1286.coefficient97_248,
    output := OriginalRow227TriangleData1296.coefficient98_248, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_250, Icur := OriginalRow227TriangleData1286.coefficient97_249,
    output := OriginalRow227TriangleData1296.coefficient98_249, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_251, Icur := OriginalRow227TriangleData1286.coefficient97_250,
    output := OriginalRow227TriangleData1296.coefficient98_250, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_252, Icur := OriginalRow227TriangleData1286.coefficient97_251,
    output := OriginalRow227TriangleData1296.coefficient98_251, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_253, Icur := OriginalRow227TriangleData1286.coefficient97_252,
    output := OriginalRow227TriangleData1296.coefficient98_252, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_254, Icur := OriginalRow227TriangleData1286.coefficient97_253,
    output := OriginalRow227TriangleData1296.coefficient98_253, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1286.coefficient97_255, Icur := OriginalRow227TriangleData1286.coefficient97_254,
    output := OriginalRow227TriangleData1296.coefficient98_254, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_256, Icur := OriginalRow227TriangleData1286.coefficient97_255,
    output := OriginalRow227TriangleData1296.coefficient98_255, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1287.coefficient97_257, Icur := OriginalRow227TriangleData1287.coefficient97_256,
    output := OriginalRow227TriangleData1296.coefficient98_256, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1280

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1280.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
