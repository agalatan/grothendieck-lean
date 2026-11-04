import Grothe.UpperChaos.OriginalRow227TriangleData1315
import Grothe.UpperChaos.OriginalRow227TriangleData1316
import Grothe.UpperChaos.OriginalRow227TriangleData1325
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1309
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_197, Icur := OriginalRow227TriangleData1315.coefficient100_196,
    output := OriginalRow227TriangleData1325.coefficient101_196, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_198, Icur := OriginalRow227TriangleData1315.coefficient100_197,
    output := OriginalRow227TriangleData1325.coefficient101_197, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_199, Icur := OriginalRow227TriangleData1315.coefficient100_198,
    output := OriginalRow227TriangleData1325.coefficient101_198, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_200, Icur := OriginalRow227TriangleData1315.coefficient100_199,
    output := OriginalRow227TriangleData1325.coefficient101_199, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_201, Icur := OriginalRow227TriangleData1315.coefficient100_200,
    output := OriginalRow227TriangleData1325.coefficient101_200, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_202, Icur := OriginalRow227TriangleData1315.coefficient100_201,
    output := OriginalRow227TriangleData1325.coefficient101_201, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_203, Icur := OriginalRow227TriangleData1315.coefficient100_202,
    output := OriginalRow227TriangleData1325.coefficient101_202, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_204, Icur := OriginalRow227TriangleData1315.coefficient100_203,
    output := OriginalRow227TriangleData1325.coefficient101_203, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_205, Icur := OriginalRow227TriangleData1315.coefficient100_204,
    output := OriginalRow227TriangleData1325.coefficient101_204, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_206, Icur := OriginalRow227TriangleData1315.coefficient100_205,
    output := OriginalRow227TriangleData1325.coefficient101_205, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_207, Icur := OriginalRow227TriangleData1315.coefficient100_206,
    output := OriginalRow227TriangleData1325.coefficient101_206, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_208, Icur := OriginalRow227TriangleData1315.coefficient100_207,
    output := OriginalRow227TriangleData1325.coefficient101_207, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_209, Icur := OriginalRow227TriangleData1315.coefficient100_208,
    output := OriginalRow227TriangleData1325.coefficient101_208, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_210, Icur := OriginalRow227TriangleData1315.coefficient100_209,
    output := OriginalRow227TriangleData1325.coefficient101_209, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_211, Icur := OriginalRow227TriangleData1315.coefficient100_210,
    output := OriginalRow227TriangleData1325.coefficient101_210, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_212, Icur := OriginalRow227TriangleData1315.coefficient100_211,
    output := OriginalRow227TriangleData1325.coefficient101_211, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_213, Icur := OriginalRow227TriangleData1315.coefficient100_212,
    output := OriginalRow227TriangleData1325.coefficient101_212, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_214, Icur := OriginalRow227TriangleData1315.coefficient100_213,
    output := OriginalRow227TriangleData1325.coefficient101_213, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_215, Icur := OriginalRow227TriangleData1315.coefficient100_214,
    output := OriginalRow227TriangleData1325.coefficient101_214, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_216, Icur := OriginalRow227TriangleData1315.coefficient100_215,
    output := OriginalRow227TriangleData1325.coefficient101_215, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_217, Icur := OriginalRow227TriangleData1315.coefficient100_216,
    output := OriginalRow227TriangleData1325.coefficient101_216, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_218, Icur := OriginalRow227TriangleData1315.coefficient100_217,
    output := OriginalRow227TriangleData1325.coefficient101_217, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_219, Icur := OriginalRow227TriangleData1315.coefficient100_218,
    output := OriginalRow227TriangleData1325.coefficient101_218, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_220, Icur := OriginalRow227TriangleData1315.coefficient100_219,
    output := OriginalRow227TriangleData1325.coefficient101_219, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_221, Icur := OriginalRow227TriangleData1315.coefficient100_220,
    output := OriginalRow227TriangleData1325.coefficient101_220, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_222, Icur := OriginalRow227TriangleData1315.coefficient100_221,
    output := OriginalRow227TriangleData1325.coefficient101_221, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_223, Icur := OriginalRow227TriangleData1315.coefficient100_222,
    output := OriginalRow227TriangleData1325.coefficient101_222, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_224, Icur := OriginalRow227TriangleData1315.coefficient100_223,
    output := OriginalRow227TriangleData1325.coefficient101_223, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_225, Icur := OriginalRow227TriangleData1315.coefficient100_224,
    output := OriginalRow227TriangleData1325.coefficient101_224, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1315.coefficient100_226, Icur := OriginalRow227TriangleData1315.coefficient100_225,
    output := OriginalRow227TriangleData1325.coefficient101_225, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1316.coefficient100_227, Icur := OriginalRow227TriangleData1315.coefficient100_226,
    output := OriginalRow227TriangleData1325.coefficient101_226, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1316.coefficient100_228, Icur := OriginalRow227TriangleData1316.coefficient100_227,
    output := OriginalRow227TriangleData1325.coefficient101_227, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1309

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1309.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
