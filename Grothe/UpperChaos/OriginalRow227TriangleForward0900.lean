import Grothe.UpperChaos.OriginalRow227TriangleData0904
import Grothe.UpperChaos.OriginalRow227TriangleData0905
import Grothe.UpperChaos.OriginalRow227TriangleData0916
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0900
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_192, Icur := OriginalRow227TriangleData0904.coefficient63_191,
    output := OriginalRow227TriangleData0916.coefficient64_191, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_193, Icur := OriginalRow227TriangleData0904.coefficient63_192,
    output := OriginalRow227TriangleData0916.coefficient64_192, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_194, Icur := OriginalRow227TriangleData0904.coefficient63_193,
    output := OriginalRow227TriangleData0916.coefficient64_193, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_195, Icur := OriginalRow227TriangleData0904.coefficient63_194,
    output := OriginalRow227TriangleData0916.coefficient64_194, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_196, Icur := OriginalRow227TriangleData0904.coefficient63_195,
    output := OriginalRow227TriangleData0916.coefficient64_195, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_197, Icur := OriginalRow227TriangleData0904.coefficient63_196,
    output := OriginalRow227TriangleData0916.coefficient64_196, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_198, Icur := OriginalRow227TriangleData0904.coefficient63_197,
    output := OriginalRow227TriangleData0916.coefficient64_197, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_199, Icur := OriginalRow227TriangleData0904.coefficient63_198,
    output := OriginalRow227TriangleData0916.coefficient64_198, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_200, Icur := OriginalRow227TriangleData0904.coefficient63_199,
    output := OriginalRow227TriangleData0916.coefficient64_199, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_201, Icur := OriginalRow227TriangleData0904.coefficient63_200,
    output := OriginalRow227TriangleData0916.coefficient64_200, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_202, Icur := OriginalRow227TriangleData0904.coefficient63_201,
    output := OriginalRow227TriangleData0916.coefficient64_201, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_203, Icur := OriginalRow227TriangleData0904.coefficient63_202,
    output := OriginalRow227TriangleData0916.coefficient64_202, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_204, Icur := OriginalRow227TriangleData0904.coefficient63_203,
    output := OriginalRow227TriangleData0916.coefficient64_203, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_205, Icur := OriginalRow227TriangleData0904.coefficient63_204,
    output := OriginalRow227TriangleData0916.coefficient64_204, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_206, Icur := OriginalRow227TriangleData0904.coefficient63_205,
    output := OriginalRow227TriangleData0916.coefficient64_205, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_207, Icur := OriginalRow227TriangleData0904.coefficient63_206,
    output := OriginalRow227TriangleData0916.coefficient64_206, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_208, Icur := OriginalRow227TriangleData0904.coefficient63_207,
    output := OriginalRow227TriangleData0916.coefficient64_207, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_209, Icur := OriginalRow227TriangleData0904.coefficient63_208,
    output := OriginalRow227TriangleData0916.coefficient64_208, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_210, Icur := OriginalRow227TriangleData0904.coefficient63_209,
    output := OriginalRow227TriangleData0916.coefficient64_209, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_211, Icur := OriginalRow227TriangleData0904.coefficient63_210,
    output := OriginalRow227TriangleData0916.coefficient64_210, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_212, Icur := OriginalRow227TriangleData0904.coefficient63_211,
    output := OriginalRow227TriangleData0916.coefficient64_211, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_213, Icur := OriginalRow227TriangleData0904.coefficient63_212,
    output := OriginalRow227TriangleData0916.coefficient64_212, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_214, Icur := OriginalRow227TriangleData0904.coefficient63_213,
    output := OriginalRow227TriangleData0916.coefficient64_213, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_215, Icur := OriginalRow227TriangleData0904.coefficient63_214,
    output := OriginalRow227TriangleData0916.coefficient64_214, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_216, Icur := OriginalRow227TriangleData0904.coefficient63_215,
    output := OriginalRow227TriangleData0916.coefficient64_215, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_217, Icur := OriginalRow227TriangleData0904.coefficient63_216,
    output := OriginalRow227TriangleData0916.coefficient64_216, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_218, Icur := OriginalRow227TriangleData0904.coefficient63_217,
    output := OriginalRow227TriangleData0916.coefficient64_217, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_219, Icur := OriginalRow227TriangleData0904.coefficient63_218,
    output := OriginalRow227TriangleData0916.coefficient64_218, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_220, Icur := OriginalRow227TriangleData0904.coefficient63_219,
    output := OriginalRow227TriangleData0916.coefficient64_219, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_221, Icur := OriginalRow227TriangleData0904.coefficient63_220,
    output := OriginalRow227TriangleData0916.coefficient64_220, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0905.coefficient63_222, Icur := OriginalRow227TriangleData0904.coefficient63_221,
    output := OriginalRow227TriangleData0916.coefficient64_221, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0905.coefficient63_223, Icur := OriginalRow227TriangleData0905.coefficient63_222,
    output := OriginalRow227TriangleData0916.coefficient64_222, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0900

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0900.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
