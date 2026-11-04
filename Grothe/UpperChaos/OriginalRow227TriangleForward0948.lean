import Grothe.UpperChaos.OriginalRow227TriangleData0952
import Grothe.UpperChaos.OriginalRow227TriangleData0953
import Grothe.UpperChaos.OriginalRow227TriangleData0964
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0948
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_196, Icur := OriginalRow227TriangleData0952.coefficient67_195,
    output := OriginalRow227TriangleData0964.coefficient68_195, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_197, Icur := OriginalRow227TriangleData0952.coefficient67_196,
    output := OriginalRow227TriangleData0964.coefficient68_196, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_198, Icur := OriginalRow227TriangleData0952.coefficient67_197,
    output := OriginalRow227TriangleData0964.coefficient68_197, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_199, Icur := OriginalRow227TriangleData0952.coefficient67_198,
    output := OriginalRow227TriangleData0964.coefficient68_198, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_200, Icur := OriginalRow227TriangleData0952.coefficient67_199,
    output := OriginalRow227TriangleData0964.coefficient68_199, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_201, Icur := OriginalRow227TriangleData0952.coefficient67_200,
    output := OriginalRow227TriangleData0964.coefficient68_200, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_202, Icur := OriginalRow227TriangleData0952.coefficient67_201,
    output := OriginalRow227TriangleData0964.coefficient68_201, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_203, Icur := OriginalRow227TriangleData0952.coefficient67_202,
    output := OriginalRow227TriangleData0964.coefficient68_202, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_204, Icur := OriginalRow227TriangleData0952.coefficient67_203,
    output := OriginalRow227TriangleData0964.coefficient68_203, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_205, Icur := OriginalRow227TriangleData0952.coefficient67_204,
    output := OriginalRow227TriangleData0964.coefficient68_204, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_206, Icur := OriginalRow227TriangleData0952.coefficient67_205,
    output := OriginalRow227TriangleData0964.coefficient68_205, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_207, Icur := OriginalRow227TriangleData0952.coefficient67_206,
    output := OriginalRow227TriangleData0964.coefficient68_206, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_208, Icur := OriginalRow227TriangleData0952.coefficient67_207,
    output := OriginalRow227TriangleData0964.coefficient68_207, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_209, Icur := OriginalRow227TriangleData0952.coefficient67_208,
    output := OriginalRow227TriangleData0964.coefficient68_208, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_210, Icur := OriginalRow227TriangleData0952.coefficient67_209,
    output := OriginalRow227TriangleData0964.coefficient68_209, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_211, Icur := OriginalRow227TriangleData0952.coefficient67_210,
    output := OriginalRow227TriangleData0964.coefficient68_210, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_212, Icur := OriginalRow227TriangleData0952.coefficient67_211,
    output := OriginalRow227TriangleData0964.coefficient68_211, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_213, Icur := OriginalRow227TriangleData0952.coefficient67_212,
    output := OriginalRow227TriangleData0964.coefficient68_212, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_214, Icur := OriginalRow227TriangleData0952.coefficient67_213,
    output := OriginalRow227TriangleData0964.coefficient68_213, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_215, Icur := OriginalRow227TriangleData0952.coefficient67_214,
    output := OriginalRow227TriangleData0964.coefficient68_214, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_216, Icur := OriginalRow227TriangleData0952.coefficient67_215,
    output := OriginalRow227TriangleData0964.coefficient68_215, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_217, Icur := OriginalRow227TriangleData0952.coefficient67_216,
    output := OriginalRow227TriangleData0964.coefficient68_216, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_218, Icur := OriginalRow227TriangleData0952.coefficient67_217,
    output := OriginalRow227TriangleData0964.coefficient68_217, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_219, Icur := OriginalRow227TriangleData0952.coefficient67_218,
    output := OriginalRow227TriangleData0964.coefficient68_218, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_220, Icur := OriginalRow227TriangleData0952.coefficient67_219,
    output := OriginalRow227TriangleData0964.coefficient68_219, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_221, Icur := OriginalRow227TriangleData0952.coefficient67_220,
    output := OriginalRow227TriangleData0964.coefficient68_220, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_222, Icur := OriginalRow227TriangleData0952.coefficient67_221,
    output := OriginalRow227TriangleData0964.coefficient68_221, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_223, Icur := OriginalRow227TriangleData0952.coefficient67_222,
    output := OriginalRow227TriangleData0964.coefficient68_222, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_224, Icur := OriginalRow227TriangleData0952.coefficient67_223,
    output := OriginalRow227TriangleData0964.coefficient68_223, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0952.coefficient67_225, Icur := OriginalRow227TriangleData0952.coefficient67_224,
    output := OriginalRow227TriangleData0964.coefficient68_224, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_226, Icur := OriginalRow227TriangleData0952.coefficient67_225,
    output := OriginalRow227TriangleData0964.coefficient68_225, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_227, Icur := OriginalRow227TriangleData0953.coefficient67_226,
    output := OriginalRow227TriangleData0964.coefficient68_226, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0948

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0948.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
