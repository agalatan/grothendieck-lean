import Grothe.UpperChaos.OriginalRow227TriangleData1563
import Grothe.UpperChaos.OriginalRow227TriangleData1564
import Grothe.UpperChaos.OriginalRow227TriangleData1571
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1555
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_224, Icur := OriginalRow227TriangleData1563.coefficient127_223,
    output := OriginalRow227TriangleData1571.coefficient128_223, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_225, Icur := OriginalRow227TriangleData1563.coefficient127_224,
    output := OriginalRow227TriangleData1571.coefficient128_224, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_226, Icur := OriginalRow227TriangleData1563.coefficient127_225,
    output := OriginalRow227TriangleData1571.coefficient128_225, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_227, Icur := OriginalRow227TriangleData1563.coefficient127_226,
    output := OriginalRow227TriangleData1571.coefficient128_226, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_228, Icur := OriginalRow227TriangleData1563.coefficient127_227,
    output := OriginalRow227TriangleData1571.coefficient128_227, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_229, Icur := OriginalRow227TriangleData1563.coefficient127_228,
    output := OriginalRow227TriangleData1571.coefficient128_228, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_230, Icur := OriginalRow227TriangleData1563.coefficient127_229,
    output := OriginalRow227TriangleData1571.coefficient128_229, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_231, Icur := OriginalRow227TriangleData1563.coefficient127_230,
    output := OriginalRow227TriangleData1571.coefficient128_230, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_232, Icur := OriginalRow227TriangleData1563.coefficient127_231,
    output := OriginalRow227TriangleData1571.coefficient128_231, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_233, Icur := OriginalRow227TriangleData1563.coefficient127_232,
    output := OriginalRow227TriangleData1571.coefficient128_232, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_234, Icur := OriginalRow227TriangleData1563.coefficient127_233,
    output := OriginalRow227TriangleData1571.coefficient128_233, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_235, Icur := OriginalRow227TriangleData1563.coefficient127_234,
    output := OriginalRow227TriangleData1571.coefficient128_234, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_236, Icur := OriginalRow227TriangleData1563.coefficient127_235,
    output := OriginalRow227TriangleData1571.coefficient128_235, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_237, Icur := OriginalRow227TriangleData1563.coefficient127_236,
    output := OriginalRow227TriangleData1571.coefficient128_236, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_238, Icur := OriginalRow227TriangleData1563.coefficient127_237,
    output := OriginalRow227TriangleData1571.coefficient128_237, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_239, Icur := OriginalRow227TriangleData1563.coefficient127_238,
    output := OriginalRow227TriangleData1571.coefficient128_238, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_240, Icur := OriginalRow227TriangleData1563.coefficient127_239,
    output := OriginalRow227TriangleData1571.coefficient128_239, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_241, Icur := OriginalRow227TriangleData1563.coefficient127_240,
    output := OriginalRow227TriangleData1571.coefficient128_240, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_242, Icur := OriginalRow227TriangleData1563.coefficient127_241,
    output := OriginalRow227TriangleData1571.coefficient128_241, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_243, Icur := OriginalRow227TriangleData1563.coefficient127_242,
    output := OriginalRow227TriangleData1571.coefficient128_242, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_244, Icur := OriginalRow227TriangleData1563.coefficient127_243,
    output := OriginalRow227TriangleData1571.coefficient128_243, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_245, Icur := OriginalRow227TriangleData1563.coefficient127_244,
    output := OriginalRow227TriangleData1571.coefficient128_244, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_246, Icur := OriginalRow227TriangleData1563.coefficient127_245,
    output := OriginalRow227TriangleData1571.coefficient128_245, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_247, Icur := OriginalRow227TriangleData1563.coefficient127_246,
    output := OriginalRow227TriangleData1571.coefficient128_246, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_248, Icur := OriginalRow227TriangleData1563.coefficient127_247,
    output := OriginalRow227TriangleData1571.coefficient128_247, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_249, Icur := OriginalRow227TriangleData1563.coefficient127_248,
    output := OriginalRow227TriangleData1571.coefficient128_248, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_250, Icur := OriginalRow227TriangleData1563.coefficient127_249,
    output := OriginalRow227TriangleData1571.coefficient128_249, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_251, Icur := OriginalRow227TriangleData1563.coefficient127_250,
    output := OriginalRow227TriangleData1571.coefficient128_250, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_252, Icur := OriginalRow227TriangleData1563.coefficient127_251,
    output := OriginalRow227TriangleData1571.coefficient128_251, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1563.coefficient127_253, Icur := OriginalRow227TriangleData1563.coefficient127_252,
    output := OriginalRow227TriangleData1571.coefficient128_252, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1564.coefficient127_254, Icur := OriginalRow227TriangleData1563.coefficient127_253,
    output := OriginalRow227TriangleData1571.coefficient128_253, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1564.coefficient127_255, Icur := OriginalRow227TriangleData1564.coefficient127_254,
    output := OriginalRow227TriangleData1571.coefficient128_254, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1555

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1555.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
