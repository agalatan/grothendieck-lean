import Grothe.UpperChaos.OriginalRow227TriangleData0228
import Grothe.UpperChaos.OriginalRow227TriangleData0229
import Grothe.UpperChaos.OriginalRow227TriangleData0243
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0227
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_207, Icur := OriginalRow227TriangleData0228.coefficient14_206,
    output := OriginalRow227TriangleData0243.coefficient15_206, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_208, Icur := OriginalRow227TriangleData0228.coefficient14_207,
    output := OriginalRow227TriangleData0243.coefficient15_207, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_209, Icur := OriginalRow227TriangleData0228.coefficient14_208,
    output := OriginalRow227TriangleData0243.coefficient15_208, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_210, Icur := OriginalRow227TriangleData0228.coefficient14_209,
    output := OriginalRow227TriangleData0243.coefficient15_209, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_211, Icur := OriginalRow227TriangleData0228.coefficient14_210,
    output := OriginalRow227TriangleData0243.coefficient15_210, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_212, Icur := OriginalRow227TriangleData0228.coefficient14_211,
    output := OriginalRow227TriangleData0243.coefficient15_211, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_213, Icur := OriginalRow227TriangleData0228.coefficient14_212,
    output := OriginalRow227TriangleData0243.coefficient15_212, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_214, Icur := OriginalRow227TriangleData0228.coefficient14_213,
    output := OriginalRow227TriangleData0243.coefficient15_213, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_215, Icur := OriginalRow227TriangleData0228.coefficient14_214,
    output := OriginalRow227TriangleData0243.coefficient15_214, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_216, Icur := OriginalRow227TriangleData0228.coefficient14_215,
    output := OriginalRow227TriangleData0243.coefficient15_215, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_217, Icur := OriginalRow227TriangleData0228.coefficient14_216,
    output := OriginalRow227TriangleData0243.coefficient15_216, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_218, Icur := OriginalRow227TriangleData0228.coefficient14_217,
    output := OriginalRow227TriangleData0243.coefficient15_217, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_219, Icur := OriginalRow227TriangleData0228.coefficient14_218,
    output := OriginalRow227TriangleData0243.coefficient15_218, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_220, Icur := OriginalRow227TriangleData0228.coefficient14_219,
    output := OriginalRow227TriangleData0243.coefficient15_219, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_221, Icur := OriginalRow227TriangleData0228.coefficient14_220,
    output := OriginalRow227TriangleData0243.coefficient15_220, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_222, Icur := OriginalRow227TriangleData0228.coefficient14_221,
    output := OriginalRow227TriangleData0243.coefficient15_221, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_223, Icur := OriginalRow227TriangleData0228.coefficient14_222,
    output := OriginalRow227TriangleData0243.coefficient15_222, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_224, Icur := OriginalRow227TriangleData0228.coefficient14_223,
    output := OriginalRow227TriangleData0243.coefficient15_223, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_225, Icur := OriginalRow227TriangleData0228.coefficient14_224,
    output := OriginalRow227TriangleData0243.coefficient15_224, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_226, Icur := OriginalRow227TriangleData0228.coefficient14_225,
    output := OriginalRow227TriangleData0243.coefficient15_225, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_227, Icur := OriginalRow227TriangleData0228.coefficient14_226,
    output := OriginalRow227TriangleData0243.coefficient15_226, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_228, Icur := OriginalRow227TriangleData0228.coefficient14_227,
    output := OriginalRow227TriangleData0243.coefficient15_227, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_229, Icur := OriginalRow227TriangleData0228.coefficient14_228,
    output := OriginalRow227TriangleData0243.coefficient15_228, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_230, Icur := OriginalRow227TriangleData0228.coefficient14_229,
    output := OriginalRow227TriangleData0243.coefficient15_229, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_231, Icur := OriginalRow227TriangleData0228.coefficient14_230,
    output := OriginalRow227TriangleData0243.coefficient15_230, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_232, Icur := OriginalRow227TriangleData0228.coefficient14_231,
    output := OriginalRow227TriangleData0243.coefficient15_231, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_233, Icur := OriginalRow227TriangleData0228.coefficient14_232,
    output := OriginalRow227TriangleData0243.coefficient15_232, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_234, Icur := OriginalRow227TriangleData0228.coefficient14_233,
    output := OriginalRow227TriangleData0243.coefficient15_233, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_235, Icur := OriginalRow227TriangleData0228.coefficient14_234,
    output := OriginalRow227TriangleData0243.coefficient15_234, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_236, Icur := OriginalRow227TriangleData0228.coefficient14_235,
    output := OriginalRow227TriangleData0243.coefficient15_235, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0229.coefficient14_237, Icur := OriginalRow227TriangleData0228.coefficient14_236,
    output := OriginalRow227TriangleData0243.coefficient15_236, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0229.coefficient14_238, Icur := OriginalRow227TriangleData0229.coefficient14_237,
    output := OriginalRow227TriangleData0243.coefficient15_237, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0227

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0227.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
