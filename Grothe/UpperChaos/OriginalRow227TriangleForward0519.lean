import Grothe.UpperChaos.OriginalRow227TriangleData0521
import Grothe.UpperChaos.OriginalRow227TriangleData0522
import Grothe.UpperChaos.OriginalRow227TriangleData0535
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0519
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_195, Icur := OriginalRow227TriangleData0521.coefficient34_194,
    output := OriginalRow227TriangleData0535.coefficient35_194, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_196, Icur := OriginalRow227TriangleData0521.coefficient34_195,
    output := OriginalRow227TriangleData0535.coefficient35_195, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_197, Icur := OriginalRow227TriangleData0521.coefficient34_196,
    output := OriginalRow227TriangleData0535.coefficient35_196, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_198, Icur := OriginalRow227TriangleData0521.coefficient34_197,
    output := OriginalRow227TriangleData0535.coefficient35_197, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_199, Icur := OriginalRow227TriangleData0521.coefficient34_198,
    output := OriginalRow227TriangleData0535.coefficient35_198, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_200, Icur := OriginalRow227TriangleData0521.coefficient34_199,
    output := OriginalRow227TriangleData0535.coefficient35_199, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_201, Icur := OriginalRow227TriangleData0521.coefficient34_200,
    output := OriginalRow227TriangleData0535.coefficient35_200, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_202, Icur := OriginalRow227TriangleData0521.coefficient34_201,
    output := OriginalRow227TriangleData0535.coefficient35_201, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_203, Icur := OriginalRow227TriangleData0521.coefficient34_202,
    output := OriginalRow227TriangleData0535.coefficient35_202, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_204, Icur := OriginalRow227TriangleData0521.coefficient34_203,
    output := OriginalRow227TriangleData0535.coefficient35_203, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_205, Icur := OriginalRow227TriangleData0521.coefficient34_204,
    output := OriginalRow227TriangleData0535.coefficient35_204, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_206, Icur := OriginalRow227TriangleData0521.coefficient34_205,
    output := OriginalRow227TriangleData0535.coefficient35_205, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_207, Icur := OriginalRow227TriangleData0521.coefficient34_206,
    output := OriginalRow227TriangleData0535.coefficient35_206, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_208, Icur := OriginalRow227TriangleData0521.coefficient34_207,
    output := OriginalRow227TriangleData0535.coefficient35_207, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_209, Icur := OriginalRow227TriangleData0521.coefficient34_208,
    output := OriginalRow227TriangleData0535.coefficient35_208, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_210, Icur := OriginalRow227TriangleData0521.coefficient34_209,
    output := OriginalRow227TriangleData0535.coefficient35_209, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_211, Icur := OriginalRow227TriangleData0521.coefficient34_210,
    output := OriginalRow227TriangleData0535.coefficient35_210, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_212, Icur := OriginalRow227TriangleData0521.coefficient34_211,
    output := OriginalRow227TriangleData0535.coefficient35_211, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_213, Icur := OriginalRow227TriangleData0521.coefficient34_212,
    output := OriginalRow227TriangleData0535.coefficient35_212, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_214, Icur := OriginalRow227TriangleData0521.coefficient34_213,
    output := OriginalRow227TriangleData0535.coefficient35_213, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_215, Icur := OriginalRow227TriangleData0521.coefficient34_214,
    output := OriginalRow227TriangleData0535.coefficient35_214, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_216, Icur := OriginalRow227TriangleData0521.coefficient34_215,
    output := OriginalRow227TriangleData0535.coefficient35_215, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_217, Icur := OriginalRow227TriangleData0521.coefficient34_216,
    output := OriginalRow227TriangleData0535.coefficient35_216, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_218, Icur := OriginalRow227TriangleData0521.coefficient34_217,
    output := OriginalRow227TriangleData0535.coefficient35_217, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_219, Icur := OriginalRow227TriangleData0521.coefficient34_218,
    output := OriginalRow227TriangleData0535.coefficient35_218, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_220, Icur := OriginalRow227TriangleData0521.coefficient34_219,
    output := OriginalRow227TriangleData0535.coefficient35_219, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_221, Icur := OriginalRow227TriangleData0521.coefficient34_220,
    output := OriginalRow227TriangleData0535.coefficient35_220, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_222, Icur := OriginalRow227TriangleData0521.coefficient34_221,
    output := OriginalRow227TriangleData0535.coefficient35_221, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_223, Icur := OriginalRow227TriangleData0521.coefficient34_222,
    output := OriginalRow227TriangleData0535.coefficient35_222, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0521.coefficient34_224, Icur := OriginalRow227TriangleData0521.coefficient34_223,
    output := OriginalRow227TriangleData0535.coefficient35_223, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0522.coefficient34_225, Icur := OriginalRow227TriangleData0521.coefficient34_224,
    output := OriginalRow227TriangleData0535.coefficient35_224, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0522.coefficient34_226, Icur := OriginalRow227TriangleData0522.coefficient34_225,
    output := OriginalRow227TriangleData0535.coefficient35_225, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0519

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0519.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
