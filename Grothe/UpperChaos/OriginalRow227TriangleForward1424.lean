import Grothe.UpperChaos.OriginalRow227TriangleData1431
import Grothe.UpperChaos.OriginalRow227TriangleData1432
import Grothe.UpperChaos.OriginalRow227TriangleData1440
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1424
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_209, Icur := OriginalRow227TriangleData1431.coefficient112_208,
    output := OriginalRow227TriangleData1440.coefficient113_208, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_210, Icur := OriginalRow227TriangleData1431.coefficient112_209,
    output := OriginalRow227TriangleData1440.coefficient113_209, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_211, Icur := OriginalRow227TriangleData1431.coefficient112_210,
    output := OriginalRow227TriangleData1440.coefficient113_210, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_212, Icur := OriginalRow227TriangleData1431.coefficient112_211,
    output := OriginalRow227TriangleData1440.coefficient113_211, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_213, Icur := OriginalRow227TriangleData1431.coefficient112_212,
    output := OriginalRow227TriangleData1440.coefficient113_212, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_214, Icur := OriginalRow227TriangleData1431.coefficient112_213,
    output := OriginalRow227TriangleData1440.coefficient113_213, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_215, Icur := OriginalRow227TriangleData1431.coefficient112_214,
    output := OriginalRow227TriangleData1440.coefficient113_214, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_216, Icur := OriginalRow227TriangleData1431.coefficient112_215,
    output := OriginalRow227TriangleData1440.coefficient113_215, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_217, Icur := OriginalRow227TriangleData1431.coefficient112_216,
    output := OriginalRow227TriangleData1440.coefficient113_216, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_218, Icur := OriginalRow227TriangleData1431.coefficient112_217,
    output := OriginalRow227TriangleData1440.coefficient113_217, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_219, Icur := OriginalRow227TriangleData1431.coefficient112_218,
    output := OriginalRow227TriangleData1440.coefficient113_218, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_220, Icur := OriginalRow227TriangleData1431.coefficient112_219,
    output := OriginalRow227TriangleData1440.coefficient113_219, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_221, Icur := OriginalRow227TriangleData1431.coefficient112_220,
    output := OriginalRow227TriangleData1440.coefficient113_220, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_222, Icur := OriginalRow227TriangleData1431.coefficient112_221,
    output := OriginalRow227TriangleData1440.coefficient113_221, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_223, Icur := OriginalRow227TriangleData1431.coefficient112_222,
    output := OriginalRow227TriangleData1440.coefficient113_222, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_224, Icur := OriginalRow227TriangleData1431.coefficient112_223,
    output := OriginalRow227TriangleData1440.coefficient113_223, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_225, Icur := OriginalRow227TriangleData1431.coefficient112_224,
    output := OriginalRow227TriangleData1440.coefficient113_224, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_226, Icur := OriginalRow227TriangleData1431.coefficient112_225,
    output := OriginalRow227TriangleData1440.coefficient113_225, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_227, Icur := OriginalRow227TriangleData1431.coefficient112_226,
    output := OriginalRow227TriangleData1440.coefficient113_226, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_228, Icur := OriginalRow227TriangleData1431.coefficient112_227,
    output := OriginalRow227TriangleData1440.coefficient113_227, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_229, Icur := OriginalRow227TriangleData1431.coefficient112_228,
    output := OriginalRow227TriangleData1440.coefficient113_228, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_230, Icur := OriginalRow227TriangleData1431.coefficient112_229,
    output := OriginalRow227TriangleData1440.coefficient113_229, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_231, Icur := OriginalRow227TriangleData1431.coefficient112_230,
    output := OriginalRow227TriangleData1440.coefficient113_230, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_232, Icur := OriginalRow227TriangleData1431.coefficient112_231,
    output := OriginalRow227TriangleData1440.coefficient113_231, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_233, Icur := OriginalRow227TriangleData1431.coefficient112_232,
    output := OriginalRow227TriangleData1440.coefficient113_232, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_234, Icur := OriginalRow227TriangleData1431.coefficient112_233,
    output := OriginalRow227TriangleData1440.coefficient113_233, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_235, Icur := OriginalRow227TriangleData1431.coefficient112_234,
    output := OriginalRow227TriangleData1440.coefficient113_234, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_236, Icur := OriginalRow227TriangleData1431.coefficient112_235,
    output := OriginalRow227TriangleData1440.coefficient113_235, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_237, Icur := OriginalRow227TriangleData1431.coefficient112_236,
    output := OriginalRow227TriangleData1440.coefficient113_236, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1431.coefficient112_238, Icur := OriginalRow227TriangleData1431.coefficient112_237,
    output := OriginalRow227TriangleData1440.coefficient113_237, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1432.coefficient112_239, Icur := OriginalRow227TriangleData1431.coefficient112_238,
    output := OriginalRow227TriangleData1440.coefficient113_238, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1432.coefficient112_240, Icur := OriginalRow227TriangleData1432.coefficient112_239,
    output := OriginalRow227TriangleData1440.coefficient113_239, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1424

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1424.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
