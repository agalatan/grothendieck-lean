import Grothe.UpperChaos.OriginalRow227TriangleData1295
import Grothe.UpperChaos.OriginalRow227TriangleData1296
import Grothe.UpperChaos.OriginalRow227TriangleData1305
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1289
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_195, Icur := OriginalRow227TriangleData1295.coefficient98_194,
    output := OriginalRow227TriangleData1305.coefficient99_194, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_196, Icur := OriginalRow227TriangleData1295.coefficient98_195,
    output := OriginalRow227TriangleData1305.coefficient99_195, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_197, Icur := OriginalRow227TriangleData1295.coefficient98_196,
    output := OriginalRow227TriangleData1305.coefficient99_196, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_198, Icur := OriginalRow227TriangleData1295.coefficient98_197,
    output := OriginalRow227TriangleData1305.coefficient99_197, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_199, Icur := OriginalRow227TriangleData1295.coefficient98_198,
    output := OriginalRow227TriangleData1305.coefficient99_198, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_200, Icur := OriginalRow227TriangleData1295.coefficient98_199,
    output := OriginalRow227TriangleData1305.coefficient99_199, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_201, Icur := OriginalRow227TriangleData1295.coefficient98_200,
    output := OriginalRow227TriangleData1305.coefficient99_200, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_202, Icur := OriginalRow227TriangleData1295.coefficient98_201,
    output := OriginalRow227TriangleData1305.coefficient99_201, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_203, Icur := OriginalRow227TriangleData1295.coefficient98_202,
    output := OriginalRow227TriangleData1305.coefficient99_202, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_204, Icur := OriginalRow227TriangleData1295.coefficient98_203,
    output := OriginalRow227TriangleData1305.coefficient99_203, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_205, Icur := OriginalRow227TriangleData1295.coefficient98_204,
    output := OriginalRow227TriangleData1305.coefficient99_204, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_206, Icur := OriginalRow227TriangleData1295.coefficient98_205,
    output := OriginalRow227TriangleData1305.coefficient99_205, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_207, Icur := OriginalRow227TriangleData1295.coefficient98_206,
    output := OriginalRow227TriangleData1305.coefficient99_206, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_208, Icur := OriginalRow227TriangleData1295.coefficient98_207,
    output := OriginalRow227TriangleData1305.coefficient99_207, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_209, Icur := OriginalRow227TriangleData1295.coefficient98_208,
    output := OriginalRow227TriangleData1305.coefficient99_208, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_210, Icur := OriginalRow227TriangleData1295.coefficient98_209,
    output := OriginalRow227TriangleData1305.coefficient99_209, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_211, Icur := OriginalRow227TriangleData1295.coefficient98_210,
    output := OriginalRow227TriangleData1305.coefficient99_210, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_212, Icur := OriginalRow227TriangleData1295.coefficient98_211,
    output := OriginalRow227TriangleData1305.coefficient99_211, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_213, Icur := OriginalRow227TriangleData1295.coefficient98_212,
    output := OriginalRow227TriangleData1305.coefficient99_212, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_214, Icur := OriginalRow227TriangleData1295.coefficient98_213,
    output := OriginalRow227TriangleData1305.coefficient99_213, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_215, Icur := OriginalRow227TriangleData1295.coefficient98_214,
    output := OriginalRow227TriangleData1305.coefficient99_214, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_216, Icur := OriginalRow227TriangleData1295.coefficient98_215,
    output := OriginalRow227TriangleData1305.coefficient99_215, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_217, Icur := OriginalRow227TriangleData1295.coefficient98_216,
    output := OriginalRow227TriangleData1305.coefficient99_216, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_218, Icur := OriginalRow227TriangleData1295.coefficient98_217,
    output := OriginalRow227TriangleData1305.coefficient99_217, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_219, Icur := OriginalRow227TriangleData1295.coefficient98_218,
    output := OriginalRow227TriangleData1305.coefficient99_218, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_220, Icur := OriginalRow227TriangleData1295.coefficient98_219,
    output := OriginalRow227TriangleData1305.coefficient99_219, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_221, Icur := OriginalRow227TriangleData1295.coefficient98_220,
    output := OriginalRow227TriangleData1305.coefficient99_220, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_222, Icur := OriginalRow227TriangleData1295.coefficient98_221,
    output := OriginalRow227TriangleData1305.coefficient99_221, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_223, Icur := OriginalRow227TriangleData1295.coefficient98_222,
    output := OriginalRow227TriangleData1305.coefficient99_222, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_224, Icur := OriginalRow227TriangleData1295.coefficient98_223,
    output := OriginalRow227TriangleData1305.coefficient99_223, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_225, Icur := OriginalRow227TriangleData1295.coefficient98_224,
    output := OriginalRow227TriangleData1305.coefficient99_224, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_226, Icur := OriginalRow227TriangleData1296.coefficient98_225,
    output := OriginalRow227TriangleData1305.coefficient99_225, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1289

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1289.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
