import Grothe.UpperChaos.OriginalRow227TriangleData1494
import Grothe.UpperChaos.OriginalRow227TriangleData1495
import Grothe.UpperChaos.OriginalRow227TriangleData1503
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1487
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_216, Icur := OriginalRow227TriangleData1494.coefficient119_215,
    output := OriginalRow227TriangleData1503.coefficient120_215, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_217, Icur := OriginalRow227TriangleData1494.coefficient119_216,
    output := OriginalRow227TriangleData1503.coefficient120_216, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_218, Icur := OriginalRow227TriangleData1494.coefficient119_217,
    output := OriginalRow227TriangleData1503.coefficient120_217, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_219, Icur := OriginalRow227TriangleData1494.coefficient119_218,
    output := OriginalRow227TriangleData1503.coefficient120_218, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_220, Icur := OriginalRow227TriangleData1494.coefficient119_219,
    output := OriginalRow227TriangleData1503.coefficient120_219, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_221, Icur := OriginalRow227TriangleData1494.coefficient119_220,
    output := OriginalRow227TriangleData1503.coefficient120_220, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_222, Icur := OriginalRow227TriangleData1494.coefficient119_221,
    output := OriginalRow227TriangleData1503.coefficient120_221, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_223, Icur := OriginalRow227TriangleData1494.coefficient119_222,
    output := OriginalRow227TriangleData1503.coefficient120_222, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_224, Icur := OriginalRow227TriangleData1494.coefficient119_223,
    output := OriginalRow227TriangleData1503.coefficient120_223, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_225, Icur := OriginalRow227TriangleData1494.coefficient119_224,
    output := OriginalRow227TriangleData1503.coefficient120_224, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_226, Icur := OriginalRow227TriangleData1494.coefficient119_225,
    output := OriginalRow227TriangleData1503.coefficient120_225, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_227, Icur := OriginalRow227TriangleData1494.coefficient119_226,
    output := OriginalRow227TriangleData1503.coefficient120_226, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_228, Icur := OriginalRow227TriangleData1494.coefficient119_227,
    output := OriginalRow227TriangleData1503.coefficient120_227, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_229, Icur := OriginalRow227TriangleData1494.coefficient119_228,
    output := OriginalRow227TriangleData1503.coefficient120_228, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_230, Icur := OriginalRow227TriangleData1494.coefficient119_229,
    output := OriginalRow227TriangleData1503.coefficient120_229, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_231, Icur := OriginalRow227TriangleData1494.coefficient119_230,
    output := OriginalRow227TriangleData1503.coefficient120_230, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_232, Icur := OriginalRow227TriangleData1494.coefficient119_231,
    output := OriginalRow227TriangleData1503.coefficient120_231, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_233, Icur := OriginalRow227TriangleData1494.coefficient119_232,
    output := OriginalRow227TriangleData1503.coefficient120_232, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_234, Icur := OriginalRow227TriangleData1494.coefficient119_233,
    output := OriginalRow227TriangleData1503.coefficient120_233, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_235, Icur := OriginalRow227TriangleData1494.coefficient119_234,
    output := OriginalRow227TriangleData1503.coefficient120_234, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_236, Icur := OriginalRow227TriangleData1494.coefficient119_235,
    output := OriginalRow227TriangleData1503.coefficient120_235, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_237, Icur := OriginalRow227TriangleData1494.coefficient119_236,
    output := OriginalRow227TriangleData1503.coefficient120_236, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_238, Icur := OriginalRow227TriangleData1494.coefficient119_237,
    output := OriginalRow227TriangleData1503.coefficient120_237, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_239, Icur := OriginalRow227TriangleData1494.coefficient119_238,
    output := OriginalRow227TriangleData1503.coefficient120_238, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_240, Icur := OriginalRow227TriangleData1494.coefficient119_239,
    output := OriginalRow227TriangleData1503.coefficient120_239, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_241, Icur := OriginalRow227TriangleData1494.coefficient119_240,
    output := OriginalRow227TriangleData1503.coefficient120_240, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_242, Icur := OriginalRow227TriangleData1494.coefficient119_241,
    output := OriginalRow227TriangleData1503.coefficient120_241, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_243, Icur := OriginalRow227TriangleData1494.coefficient119_242,
    output := OriginalRow227TriangleData1503.coefficient120_242, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_244, Icur := OriginalRow227TriangleData1494.coefficient119_243,
    output := OriginalRow227TriangleData1503.coefficient120_243, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1494.coefficient119_245, Icur := OriginalRow227TriangleData1494.coefficient119_244,
    output := OriginalRow227TriangleData1503.coefficient120_244, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1495.coefficient119_246, Icur := OriginalRow227TriangleData1494.coefficient119_245,
    output := OriginalRow227TriangleData1503.coefficient120_245, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1495.coefficient119_247, Icur := OriginalRow227TriangleData1495.coefficient119_246,
    output := OriginalRow227TriangleData1503.coefficient120_246, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1487

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1487.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
