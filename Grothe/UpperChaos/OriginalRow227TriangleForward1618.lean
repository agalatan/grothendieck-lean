import Grothe.UpperChaos.OriginalRow227TriangleData1626
import Grothe.UpperChaos.OriginalRow227TriangleData1627
import Grothe.UpperChaos.OriginalRow227TriangleData1634
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1618
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_200, Icur := OriginalRow227TriangleData1626.coefficient135_199,
    output := OriginalRow227TriangleData1634.coefficient136_199, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_201, Icur := OriginalRow227TriangleData1626.coefficient135_200,
    output := OriginalRow227TriangleData1634.coefficient136_200, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_202, Icur := OriginalRow227TriangleData1626.coefficient135_201,
    output := OriginalRow227TriangleData1634.coefficient136_201, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_203, Icur := OriginalRow227TriangleData1626.coefficient135_202,
    output := OriginalRow227TriangleData1634.coefficient136_202, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_204, Icur := OriginalRow227TriangleData1626.coefficient135_203,
    output := OriginalRow227TriangleData1634.coefficient136_203, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_205, Icur := OriginalRow227TriangleData1626.coefficient135_204,
    output := OriginalRow227TriangleData1634.coefficient136_204, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_206, Icur := OriginalRow227TriangleData1626.coefficient135_205,
    output := OriginalRow227TriangleData1634.coefficient136_205, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_207, Icur := OriginalRow227TriangleData1626.coefficient135_206,
    output := OriginalRow227TriangleData1634.coefficient136_206, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_208, Icur := OriginalRow227TriangleData1626.coefficient135_207,
    output := OriginalRow227TriangleData1634.coefficient136_207, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_209, Icur := OriginalRow227TriangleData1626.coefficient135_208,
    output := OriginalRow227TriangleData1634.coefficient136_208, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_210, Icur := OriginalRow227TriangleData1626.coefficient135_209,
    output := OriginalRow227TriangleData1634.coefficient136_209, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_211, Icur := OriginalRow227TriangleData1626.coefficient135_210,
    output := OriginalRow227TriangleData1634.coefficient136_210, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_212, Icur := OriginalRow227TriangleData1626.coefficient135_211,
    output := OriginalRow227TriangleData1634.coefficient136_211, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_213, Icur := OriginalRow227TriangleData1626.coefficient135_212,
    output := OriginalRow227TriangleData1634.coefficient136_212, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_214, Icur := OriginalRow227TriangleData1626.coefficient135_213,
    output := OriginalRow227TriangleData1634.coefficient136_213, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_215, Icur := OriginalRow227TriangleData1626.coefficient135_214,
    output := OriginalRow227TriangleData1634.coefficient136_214, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_216, Icur := OriginalRow227TriangleData1626.coefficient135_215,
    output := OriginalRow227TriangleData1634.coefficient136_215, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_217, Icur := OriginalRow227TriangleData1626.coefficient135_216,
    output := OriginalRow227TriangleData1634.coefficient136_216, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_218, Icur := OriginalRow227TriangleData1626.coefficient135_217,
    output := OriginalRow227TriangleData1634.coefficient136_217, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_219, Icur := OriginalRow227TriangleData1626.coefficient135_218,
    output := OriginalRow227TriangleData1634.coefficient136_218, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_220, Icur := OriginalRow227TriangleData1626.coefficient135_219,
    output := OriginalRow227TriangleData1634.coefficient136_219, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_221, Icur := OriginalRow227TriangleData1626.coefficient135_220,
    output := OriginalRow227TriangleData1634.coefficient136_220, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_222, Icur := OriginalRow227TriangleData1626.coefficient135_221,
    output := OriginalRow227TriangleData1634.coefficient136_221, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_223, Icur := OriginalRow227TriangleData1626.coefficient135_222,
    output := OriginalRow227TriangleData1634.coefficient136_222, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_224, Icur := OriginalRow227TriangleData1626.coefficient135_223,
    output := OriginalRow227TriangleData1634.coefficient136_223, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_225, Icur := OriginalRow227TriangleData1626.coefficient135_224,
    output := OriginalRow227TriangleData1634.coefficient136_224, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_226, Icur := OriginalRow227TriangleData1626.coefficient135_225,
    output := OriginalRow227TriangleData1634.coefficient136_225, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_227, Icur := OriginalRow227TriangleData1626.coefficient135_226,
    output := OriginalRow227TriangleData1634.coefficient136_226, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_228, Icur := OriginalRow227TriangleData1626.coefficient135_227,
    output := OriginalRow227TriangleData1634.coefficient136_227, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1626.coefficient135_229, Icur := OriginalRow227TriangleData1626.coefficient135_228,
    output := OriginalRow227TriangleData1634.coefficient136_228, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1627.coefficient135_230, Icur := OriginalRow227TriangleData1626.coefficient135_229,
    output := OriginalRow227TriangleData1634.coefficient136_229, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1627.coefficient135_231, Icur := OriginalRow227TriangleData1627.coefficient135_230,
    output := OriginalRow227TriangleData1634.coefficient136_230, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1618

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1618.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
