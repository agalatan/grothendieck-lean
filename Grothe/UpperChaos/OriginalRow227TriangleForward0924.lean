import Grothe.UpperChaos.OriginalRow227TriangleData0928
import Grothe.UpperChaos.OriginalRow227TriangleData0929
import Grothe.UpperChaos.OriginalRow227TriangleData0940
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0924
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_194, Icur := OriginalRow227TriangleData0928.coefficient65_193,
    output := OriginalRow227TriangleData0940.coefficient66_193, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_195, Icur := OriginalRow227TriangleData0928.coefficient65_194,
    output := OriginalRow227TriangleData0940.coefficient66_194, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_196, Icur := OriginalRow227TriangleData0928.coefficient65_195,
    output := OriginalRow227TriangleData0940.coefficient66_195, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_197, Icur := OriginalRow227TriangleData0928.coefficient65_196,
    output := OriginalRow227TriangleData0940.coefficient66_196, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_198, Icur := OriginalRow227TriangleData0928.coefficient65_197,
    output := OriginalRow227TriangleData0940.coefficient66_197, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_199, Icur := OriginalRow227TriangleData0928.coefficient65_198,
    output := OriginalRow227TriangleData0940.coefficient66_198, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_200, Icur := OriginalRow227TriangleData0928.coefficient65_199,
    output := OriginalRow227TriangleData0940.coefficient66_199, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_201, Icur := OriginalRow227TriangleData0928.coefficient65_200,
    output := OriginalRow227TriangleData0940.coefficient66_200, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_202, Icur := OriginalRow227TriangleData0928.coefficient65_201,
    output := OriginalRow227TriangleData0940.coefficient66_201, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_203, Icur := OriginalRow227TriangleData0928.coefficient65_202,
    output := OriginalRow227TriangleData0940.coefficient66_202, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_204, Icur := OriginalRow227TriangleData0928.coefficient65_203,
    output := OriginalRow227TriangleData0940.coefficient66_203, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_205, Icur := OriginalRow227TriangleData0928.coefficient65_204,
    output := OriginalRow227TriangleData0940.coefficient66_204, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_206, Icur := OriginalRow227TriangleData0928.coefficient65_205,
    output := OriginalRow227TriangleData0940.coefficient66_205, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_207, Icur := OriginalRow227TriangleData0928.coefficient65_206,
    output := OriginalRow227TriangleData0940.coefficient66_206, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_208, Icur := OriginalRow227TriangleData0928.coefficient65_207,
    output := OriginalRow227TriangleData0940.coefficient66_207, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_209, Icur := OriginalRow227TriangleData0928.coefficient65_208,
    output := OriginalRow227TriangleData0940.coefficient66_208, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_210, Icur := OriginalRow227TriangleData0928.coefficient65_209,
    output := OriginalRow227TriangleData0940.coefficient66_209, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_211, Icur := OriginalRow227TriangleData0928.coefficient65_210,
    output := OriginalRow227TriangleData0940.coefficient66_210, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_212, Icur := OriginalRow227TriangleData0928.coefficient65_211,
    output := OriginalRow227TriangleData0940.coefficient66_211, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_213, Icur := OriginalRow227TriangleData0928.coefficient65_212,
    output := OriginalRow227TriangleData0940.coefficient66_212, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_214, Icur := OriginalRow227TriangleData0928.coefficient65_213,
    output := OriginalRow227TriangleData0940.coefficient66_213, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_215, Icur := OriginalRow227TriangleData0928.coefficient65_214,
    output := OriginalRow227TriangleData0940.coefficient66_214, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_216, Icur := OriginalRow227TriangleData0928.coefficient65_215,
    output := OriginalRow227TriangleData0940.coefficient66_215, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_217, Icur := OriginalRow227TriangleData0928.coefficient65_216,
    output := OriginalRow227TriangleData0940.coefficient66_216, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_218, Icur := OriginalRow227TriangleData0928.coefficient65_217,
    output := OriginalRow227TriangleData0940.coefficient66_217, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_219, Icur := OriginalRow227TriangleData0928.coefficient65_218,
    output := OriginalRow227TriangleData0940.coefficient66_218, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_220, Icur := OriginalRow227TriangleData0928.coefficient65_219,
    output := OriginalRow227TriangleData0940.coefficient66_219, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_221, Icur := OriginalRow227TriangleData0928.coefficient65_220,
    output := OriginalRow227TriangleData0940.coefficient66_220, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_222, Icur := OriginalRow227TriangleData0928.coefficient65_221,
    output := OriginalRow227TriangleData0940.coefficient66_221, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0928.coefficient65_223, Icur := OriginalRow227TriangleData0928.coefficient65_222,
    output := OriginalRow227TriangleData0940.coefficient66_222, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_224, Icur := OriginalRow227TriangleData0928.coefficient65_223,
    output := OriginalRow227TriangleData0940.coefficient66_223, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_225, Icur := OriginalRow227TriangleData0929.coefficient65_224,
    output := OriginalRow227TriangleData0940.coefficient66_224, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0924

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0924.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
