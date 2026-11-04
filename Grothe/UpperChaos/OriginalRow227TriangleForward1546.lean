import Grothe.UpperChaos.OriginalRow227TriangleData1554
import Grothe.UpperChaos.OriginalRow227TriangleData1555
import Grothe.UpperChaos.OriginalRow227TriangleData1562
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1546
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_191, Icur := OriginalRow227TriangleData1554.coefficient126_190,
    output := OriginalRow227TriangleData1562.coefficient127_190, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_192, Icur := OriginalRow227TriangleData1554.coefficient126_191,
    output := OriginalRow227TriangleData1562.coefficient127_191, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_193, Icur := OriginalRow227TriangleData1554.coefficient126_192,
    output := OriginalRow227TriangleData1562.coefficient127_192, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_194, Icur := OriginalRow227TriangleData1554.coefficient126_193,
    output := OriginalRow227TriangleData1562.coefficient127_193, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_195, Icur := OriginalRow227TriangleData1554.coefficient126_194,
    output := OriginalRow227TriangleData1562.coefficient127_194, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_196, Icur := OriginalRow227TriangleData1554.coefficient126_195,
    output := OriginalRow227TriangleData1562.coefficient127_195, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_197, Icur := OriginalRow227TriangleData1554.coefficient126_196,
    output := OriginalRow227TriangleData1562.coefficient127_196, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_198, Icur := OriginalRow227TriangleData1554.coefficient126_197,
    output := OriginalRow227TriangleData1562.coefficient127_197, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_199, Icur := OriginalRow227TriangleData1554.coefficient126_198,
    output := OriginalRow227TriangleData1562.coefficient127_198, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_200, Icur := OriginalRow227TriangleData1554.coefficient126_199,
    output := OriginalRow227TriangleData1562.coefficient127_199, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_201, Icur := OriginalRow227TriangleData1554.coefficient126_200,
    output := OriginalRow227TriangleData1562.coefficient127_200, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_202, Icur := OriginalRow227TriangleData1554.coefficient126_201,
    output := OriginalRow227TriangleData1562.coefficient127_201, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_203, Icur := OriginalRow227TriangleData1554.coefficient126_202,
    output := OriginalRow227TriangleData1562.coefficient127_202, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_204, Icur := OriginalRow227TriangleData1554.coefficient126_203,
    output := OriginalRow227TriangleData1562.coefficient127_203, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_205, Icur := OriginalRow227TriangleData1554.coefficient126_204,
    output := OriginalRow227TriangleData1562.coefficient127_204, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_206, Icur := OriginalRow227TriangleData1554.coefficient126_205,
    output := OriginalRow227TriangleData1562.coefficient127_205, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_207, Icur := OriginalRow227TriangleData1554.coefficient126_206,
    output := OriginalRow227TriangleData1562.coefficient127_206, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_208, Icur := OriginalRow227TriangleData1554.coefficient126_207,
    output := OriginalRow227TriangleData1562.coefficient127_207, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_209, Icur := OriginalRow227TriangleData1554.coefficient126_208,
    output := OriginalRow227TriangleData1562.coefficient127_208, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_210, Icur := OriginalRow227TriangleData1554.coefficient126_209,
    output := OriginalRow227TriangleData1562.coefficient127_209, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_211, Icur := OriginalRow227TriangleData1554.coefficient126_210,
    output := OriginalRow227TriangleData1562.coefficient127_210, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_212, Icur := OriginalRow227TriangleData1554.coefficient126_211,
    output := OriginalRow227TriangleData1562.coefficient127_211, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_213, Icur := OriginalRow227TriangleData1554.coefficient126_212,
    output := OriginalRow227TriangleData1562.coefficient127_212, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_214, Icur := OriginalRow227TriangleData1554.coefficient126_213,
    output := OriginalRow227TriangleData1562.coefficient127_213, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_215, Icur := OriginalRow227TriangleData1554.coefficient126_214,
    output := OriginalRow227TriangleData1562.coefficient127_214, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_216, Icur := OriginalRow227TriangleData1554.coefficient126_215,
    output := OriginalRow227TriangleData1562.coefficient127_215, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_217, Icur := OriginalRow227TriangleData1554.coefficient126_216,
    output := OriginalRow227TriangleData1562.coefficient127_216, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_218, Icur := OriginalRow227TriangleData1554.coefficient126_217,
    output := OriginalRow227TriangleData1562.coefficient127_217, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_219, Icur := OriginalRow227TriangleData1554.coefficient126_218,
    output := OriginalRow227TriangleData1562.coefficient127_218, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1554.coefficient126_220, Icur := OriginalRow227TriangleData1554.coefficient126_219,
    output := OriginalRow227TriangleData1562.coefficient127_219, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1555.coefficient126_221, Icur := OriginalRow227TriangleData1554.coefficient126_220,
    output := OriginalRow227TriangleData1562.coefficient127_220, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1555.coefficient126_222, Icur := OriginalRow227TriangleData1555.coefficient126_221,
    output := OriginalRow227TriangleData1562.coefficient127_221, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1546

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1546.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
