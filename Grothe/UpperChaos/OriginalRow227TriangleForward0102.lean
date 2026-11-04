import Grothe.UpperChaos.OriginalRow227TriangleData0102
import Grothe.UpperChaos.OriginalRow227TriangleData0103
import Grothe.UpperChaos.OriginalRow227TriangleData0118
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0102
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_199, Icur := OriginalRow227TriangleData0102.coefficient6_198,
    output := OriginalRow227TriangleData0118.coefficient7_198, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_200, Icur := OriginalRow227TriangleData0102.coefficient6_199,
    output := OriginalRow227TriangleData0118.coefficient7_199, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_201, Icur := OriginalRow227TriangleData0102.coefficient6_200,
    output := OriginalRow227TriangleData0118.coefficient7_200, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_202, Icur := OriginalRow227TriangleData0102.coefficient6_201,
    output := OriginalRow227TriangleData0118.coefficient7_201, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_203, Icur := OriginalRow227TriangleData0102.coefficient6_202,
    output := OriginalRow227TriangleData0118.coefficient7_202, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_204, Icur := OriginalRow227TriangleData0102.coefficient6_203,
    output := OriginalRow227TriangleData0118.coefficient7_203, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_205, Icur := OriginalRow227TriangleData0102.coefficient6_204,
    output := OriginalRow227TriangleData0118.coefficient7_204, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_206, Icur := OriginalRow227TriangleData0102.coefficient6_205,
    output := OriginalRow227TriangleData0118.coefficient7_205, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_207, Icur := OriginalRow227TriangleData0102.coefficient6_206,
    output := OriginalRow227TriangleData0118.coefficient7_206, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_208, Icur := OriginalRow227TriangleData0102.coefficient6_207,
    output := OriginalRow227TriangleData0118.coefficient7_207, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_209, Icur := OriginalRow227TriangleData0102.coefficient6_208,
    output := OriginalRow227TriangleData0118.coefficient7_208, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_210, Icur := OriginalRow227TriangleData0102.coefficient6_209,
    output := OriginalRow227TriangleData0118.coefficient7_209, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_211, Icur := OriginalRow227TriangleData0102.coefficient6_210,
    output := OriginalRow227TriangleData0118.coefficient7_210, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_212, Icur := OriginalRow227TriangleData0102.coefficient6_211,
    output := OriginalRow227TriangleData0118.coefficient7_211, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_213, Icur := OriginalRow227TriangleData0102.coefficient6_212,
    output := OriginalRow227TriangleData0118.coefficient7_212, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_214, Icur := OriginalRow227TriangleData0102.coefficient6_213,
    output := OriginalRow227TriangleData0118.coefficient7_213, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_215, Icur := OriginalRow227TriangleData0102.coefficient6_214,
    output := OriginalRow227TriangleData0118.coefficient7_214, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_216, Icur := OriginalRow227TriangleData0102.coefficient6_215,
    output := OriginalRow227TriangleData0118.coefficient7_215, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_217, Icur := OriginalRow227TriangleData0102.coefficient6_216,
    output := OriginalRow227TriangleData0118.coefficient7_216, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_218, Icur := OriginalRow227TriangleData0102.coefficient6_217,
    output := OriginalRow227TriangleData0118.coefficient7_217, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_219, Icur := OriginalRow227TriangleData0102.coefficient6_218,
    output := OriginalRow227TriangleData0118.coefficient7_218, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_220, Icur := OriginalRow227TriangleData0102.coefficient6_219,
    output := OriginalRow227TriangleData0118.coefficient7_219, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_221, Icur := OriginalRow227TriangleData0102.coefficient6_220,
    output := OriginalRow227TriangleData0118.coefficient7_220, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_222, Icur := OriginalRow227TriangleData0102.coefficient6_221,
    output := OriginalRow227TriangleData0118.coefficient7_221, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_223, Icur := OriginalRow227TriangleData0102.coefficient6_222,
    output := OriginalRow227TriangleData0118.coefficient7_222, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_224, Icur := OriginalRow227TriangleData0102.coefficient6_223,
    output := OriginalRow227TriangleData0118.coefficient7_223, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_225, Icur := OriginalRow227TriangleData0102.coefficient6_224,
    output := OriginalRow227TriangleData0118.coefficient7_224, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_226, Icur := OriginalRow227TriangleData0102.coefficient6_225,
    output := OriginalRow227TriangleData0118.coefficient7_225, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_227, Icur := OriginalRow227TriangleData0102.coefficient6_226,
    output := OriginalRow227TriangleData0118.coefficient7_226, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0102.coefficient6_228, Icur := OriginalRow227TriangleData0102.coefficient6_227,
    output := OriginalRow227TriangleData0118.coefficient7_227, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_229, Icur := OriginalRow227TriangleData0102.coefficient6_228,
    output := OriginalRow227TriangleData0118.coefficient7_228, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_230, Icur := OriginalRow227TriangleData0103.coefficient6_229,
    output := OriginalRow227TriangleData0118.coefficient7_229, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0102

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0102.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
