import Grothe.UpperChaos.OriginalRow227TriangleData0465
import Grothe.UpperChaos.OriginalRow227TriangleData0466
import Grothe.UpperChaos.OriginalRow227TriangleData0479
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0463
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_191, Icur := OriginalRow227TriangleData0465.coefficient30_190,
    output := OriginalRow227TriangleData0479.coefficient31_190, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_192, Icur := OriginalRow227TriangleData0465.coefficient30_191,
    output := OriginalRow227TriangleData0479.coefficient31_191, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_193, Icur := OriginalRow227TriangleData0465.coefficient30_192,
    output := OriginalRow227TriangleData0479.coefficient31_192, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_194, Icur := OriginalRow227TriangleData0465.coefficient30_193,
    output := OriginalRow227TriangleData0479.coefficient31_193, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_195, Icur := OriginalRow227TriangleData0465.coefficient30_194,
    output := OriginalRow227TriangleData0479.coefficient31_194, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_196, Icur := OriginalRow227TriangleData0465.coefficient30_195,
    output := OriginalRow227TriangleData0479.coefficient31_195, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_197, Icur := OriginalRow227TriangleData0465.coefficient30_196,
    output := OriginalRow227TriangleData0479.coefficient31_196, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_198, Icur := OriginalRow227TriangleData0465.coefficient30_197,
    output := OriginalRow227TriangleData0479.coefficient31_197, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_199, Icur := OriginalRow227TriangleData0465.coefficient30_198,
    output := OriginalRow227TriangleData0479.coefficient31_198, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_200, Icur := OriginalRow227TriangleData0465.coefficient30_199,
    output := OriginalRow227TriangleData0479.coefficient31_199, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_201, Icur := OriginalRow227TriangleData0465.coefficient30_200,
    output := OriginalRow227TriangleData0479.coefficient31_200, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_202, Icur := OriginalRow227TriangleData0465.coefficient30_201,
    output := OriginalRow227TriangleData0479.coefficient31_201, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_203, Icur := OriginalRow227TriangleData0465.coefficient30_202,
    output := OriginalRow227TriangleData0479.coefficient31_202, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_204, Icur := OriginalRow227TriangleData0465.coefficient30_203,
    output := OriginalRow227TriangleData0479.coefficient31_203, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_205, Icur := OriginalRow227TriangleData0465.coefficient30_204,
    output := OriginalRow227TriangleData0479.coefficient31_204, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_206, Icur := OriginalRow227TriangleData0465.coefficient30_205,
    output := OriginalRow227TriangleData0479.coefficient31_205, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_207, Icur := OriginalRow227TriangleData0465.coefficient30_206,
    output := OriginalRow227TriangleData0479.coefficient31_206, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_208, Icur := OriginalRow227TriangleData0465.coefficient30_207,
    output := OriginalRow227TriangleData0479.coefficient31_207, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_209, Icur := OriginalRow227TriangleData0465.coefficient30_208,
    output := OriginalRow227TriangleData0479.coefficient31_208, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_210, Icur := OriginalRow227TriangleData0465.coefficient30_209,
    output := OriginalRow227TriangleData0479.coefficient31_209, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_211, Icur := OriginalRow227TriangleData0465.coefficient30_210,
    output := OriginalRow227TriangleData0479.coefficient31_210, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_212, Icur := OriginalRow227TriangleData0465.coefficient30_211,
    output := OriginalRow227TriangleData0479.coefficient31_211, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_213, Icur := OriginalRow227TriangleData0465.coefficient30_212,
    output := OriginalRow227TriangleData0479.coefficient31_212, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_214, Icur := OriginalRow227TriangleData0465.coefficient30_213,
    output := OriginalRow227TriangleData0479.coefficient31_213, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_215, Icur := OriginalRow227TriangleData0465.coefficient30_214,
    output := OriginalRow227TriangleData0479.coefficient31_214, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_216, Icur := OriginalRow227TriangleData0465.coefficient30_215,
    output := OriginalRow227TriangleData0479.coefficient31_215, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_217, Icur := OriginalRow227TriangleData0465.coefficient30_216,
    output := OriginalRow227TriangleData0479.coefficient31_216, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_218, Icur := OriginalRow227TriangleData0465.coefficient30_217,
    output := OriginalRow227TriangleData0479.coefficient31_217, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_219, Icur := OriginalRow227TriangleData0465.coefficient30_218,
    output := OriginalRow227TriangleData0479.coefficient31_218, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_220, Icur := OriginalRow227TriangleData0465.coefficient30_219,
    output := OriginalRow227TriangleData0479.coefficient31_219, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0466.coefficient30_221, Icur := OriginalRow227TriangleData0465.coefficient30_220,
    output := OriginalRow227TriangleData0479.coefficient31_220, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0466.coefficient30_222, Icur := OriginalRow227TriangleData0466.coefficient30_221,
    output := OriginalRow227TriangleData0479.coefficient31_221, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0463

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0463.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
