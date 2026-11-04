import Grothe.UpperChaos.OriginalRow227TriangleData0022
import Grothe.UpperChaos.OriginalRow227TriangleData0023
import Grothe.UpperChaos.OriginalRow227TriangleData0038
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0022
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_194, Icur := OriginalRow227TriangleData0022.coefficient1_193,
    output := OriginalRow227TriangleData0038.coefficient2_193, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_195, Icur := OriginalRow227TriangleData0022.coefficient1_194,
    output := OriginalRow227TriangleData0038.coefficient2_194, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_196, Icur := OriginalRow227TriangleData0022.coefficient1_195,
    output := OriginalRow227TriangleData0038.coefficient2_195, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_197, Icur := OriginalRow227TriangleData0022.coefficient1_196,
    output := OriginalRow227TriangleData0038.coefficient2_196, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_198, Icur := OriginalRow227TriangleData0022.coefficient1_197,
    output := OriginalRow227TriangleData0038.coefficient2_197, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_199, Icur := OriginalRow227TriangleData0022.coefficient1_198,
    output := OriginalRow227TriangleData0038.coefficient2_198, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_200, Icur := OriginalRow227TriangleData0022.coefficient1_199,
    output := OriginalRow227TriangleData0038.coefficient2_199, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_201, Icur := OriginalRow227TriangleData0022.coefficient1_200,
    output := OriginalRow227TriangleData0038.coefficient2_200, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_202, Icur := OriginalRow227TriangleData0022.coefficient1_201,
    output := OriginalRow227TriangleData0038.coefficient2_201, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_203, Icur := OriginalRow227TriangleData0022.coefficient1_202,
    output := OriginalRow227TriangleData0038.coefficient2_202, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_204, Icur := OriginalRow227TriangleData0022.coefficient1_203,
    output := OriginalRow227TriangleData0038.coefficient2_203, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_205, Icur := OriginalRow227TriangleData0022.coefficient1_204,
    output := OriginalRow227TriangleData0038.coefficient2_204, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_206, Icur := OriginalRow227TriangleData0022.coefficient1_205,
    output := OriginalRow227TriangleData0038.coefficient2_205, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_207, Icur := OriginalRow227TriangleData0022.coefficient1_206,
    output := OriginalRow227TriangleData0038.coefficient2_206, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_208, Icur := OriginalRow227TriangleData0022.coefficient1_207,
    output := OriginalRow227TriangleData0038.coefficient2_207, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_209, Icur := OriginalRow227TriangleData0022.coefficient1_208,
    output := OriginalRow227TriangleData0038.coefficient2_208, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_210, Icur := OriginalRow227TriangleData0022.coefficient1_209,
    output := OriginalRow227TriangleData0038.coefficient2_209, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_211, Icur := OriginalRow227TriangleData0022.coefficient1_210,
    output := OriginalRow227TriangleData0038.coefficient2_210, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_212, Icur := OriginalRow227TriangleData0022.coefficient1_211,
    output := OriginalRow227TriangleData0038.coefficient2_211, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_213, Icur := OriginalRow227TriangleData0022.coefficient1_212,
    output := OriginalRow227TriangleData0038.coefficient2_212, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_214, Icur := OriginalRow227TriangleData0022.coefficient1_213,
    output := OriginalRow227TriangleData0038.coefficient2_213, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_215, Icur := OriginalRow227TriangleData0022.coefficient1_214,
    output := OriginalRow227TriangleData0038.coefficient2_214, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_216, Icur := OriginalRow227TriangleData0022.coefficient1_215,
    output := OriginalRow227TriangleData0038.coefficient2_215, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_217, Icur := OriginalRow227TriangleData0022.coefficient1_216,
    output := OriginalRow227TriangleData0038.coefficient2_216, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_218, Icur := OriginalRow227TriangleData0022.coefficient1_217,
    output := OriginalRow227TriangleData0038.coefficient2_217, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_219, Icur := OriginalRow227TriangleData0022.coefficient1_218,
    output := OriginalRow227TriangleData0038.coefficient2_218, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_220, Icur := OriginalRow227TriangleData0022.coefficient1_219,
    output := OriginalRow227TriangleData0038.coefficient2_219, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_221, Icur := OriginalRow227TriangleData0022.coefficient1_220,
    output := OriginalRow227TriangleData0038.coefficient2_220, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_222, Icur := OriginalRow227TriangleData0022.coefficient1_221,
    output := OriginalRow227TriangleData0038.coefficient2_221, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_223, Icur := OriginalRow227TriangleData0022.coefficient1_222,
    output := OriginalRow227TriangleData0038.coefficient2_222, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_224, Icur := OriginalRow227TriangleData0022.coefficient1_223,
    output := OriginalRow227TriangleData0038.coefficient2_223, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_225, Icur := OriginalRow227TriangleData0023.coefficient1_224,
    output := OriginalRow227TriangleData0038.coefficient2_224, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0022

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0022.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
