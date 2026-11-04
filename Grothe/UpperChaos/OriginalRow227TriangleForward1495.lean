import Grothe.UpperChaos.OriginalRow227TriangleData1502
import Grothe.UpperChaos.OriginalRow227TriangleData1503
import Grothe.UpperChaos.OriginalRow227TriangleData1511
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1495
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_185, Icur := OriginalRow227TriangleData1502.coefficient120_184,
    output := OriginalRow227TriangleData1511.coefficient121_184, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_186, Icur := OriginalRow227TriangleData1502.coefficient120_185,
    output := OriginalRow227TriangleData1511.coefficient121_185, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_187, Icur := OriginalRow227TriangleData1502.coefficient120_186,
    output := OriginalRow227TriangleData1511.coefficient121_186, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_188, Icur := OriginalRow227TriangleData1502.coefficient120_187,
    output := OriginalRow227TriangleData1511.coefficient121_187, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_189, Icur := OriginalRow227TriangleData1502.coefficient120_188,
    output := OriginalRow227TriangleData1511.coefficient121_188, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_190, Icur := OriginalRow227TriangleData1502.coefficient120_189,
    output := OriginalRow227TriangleData1511.coefficient121_189, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_191, Icur := OriginalRow227TriangleData1502.coefficient120_190,
    output := OriginalRow227TriangleData1511.coefficient121_190, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_192, Icur := OriginalRow227TriangleData1502.coefficient120_191,
    output := OriginalRow227TriangleData1511.coefficient121_191, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_193, Icur := OriginalRow227TriangleData1502.coefficient120_192,
    output := OriginalRow227TriangleData1511.coefficient121_192, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_194, Icur := OriginalRow227TriangleData1502.coefficient120_193,
    output := OriginalRow227TriangleData1511.coefficient121_193, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_195, Icur := OriginalRow227TriangleData1502.coefficient120_194,
    output := OriginalRow227TriangleData1511.coefficient121_194, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_196, Icur := OriginalRow227TriangleData1502.coefficient120_195,
    output := OriginalRow227TriangleData1511.coefficient121_195, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_197, Icur := OriginalRow227TriangleData1502.coefficient120_196,
    output := OriginalRow227TriangleData1511.coefficient121_196, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_198, Icur := OriginalRow227TriangleData1502.coefficient120_197,
    output := OriginalRow227TriangleData1511.coefficient121_197, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_199, Icur := OriginalRow227TriangleData1502.coefficient120_198,
    output := OriginalRow227TriangleData1511.coefficient121_198, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_200, Icur := OriginalRow227TriangleData1502.coefficient120_199,
    output := OriginalRow227TriangleData1511.coefficient121_199, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_201, Icur := OriginalRow227TriangleData1502.coefficient120_200,
    output := OriginalRow227TriangleData1511.coefficient121_200, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_202, Icur := OriginalRow227TriangleData1502.coefficient120_201,
    output := OriginalRow227TriangleData1511.coefficient121_201, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_203, Icur := OriginalRow227TriangleData1502.coefficient120_202,
    output := OriginalRow227TriangleData1511.coefficient121_202, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_204, Icur := OriginalRow227TriangleData1502.coefficient120_203,
    output := OriginalRow227TriangleData1511.coefficient121_203, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_205, Icur := OriginalRow227TriangleData1502.coefficient120_204,
    output := OriginalRow227TriangleData1511.coefficient121_204, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_206, Icur := OriginalRow227TriangleData1502.coefficient120_205,
    output := OriginalRow227TriangleData1511.coefficient121_205, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_207, Icur := OriginalRow227TriangleData1502.coefficient120_206,
    output := OriginalRow227TriangleData1511.coefficient121_206, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_208, Icur := OriginalRow227TriangleData1502.coefficient120_207,
    output := OriginalRow227TriangleData1511.coefficient121_207, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_209, Icur := OriginalRow227TriangleData1502.coefficient120_208,
    output := OriginalRow227TriangleData1511.coefficient121_208, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_210, Icur := OriginalRow227TriangleData1502.coefficient120_209,
    output := OriginalRow227TriangleData1511.coefficient121_209, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_211, Icur := OriginalRow227TriangleData1502.coefficient120_210,
    output := OriginalRow227TriangleData1511.coefficient121_210, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_212, Icur := OriginalRow227TriangleData1502.coefficient120_211,
    output := OriginalRow227TriangleData1511.coefficient121_211, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_213, Icur := OriginalRow227TriangleData1502.coefficient120_212,
    output := OriginalRow227TriangleData1511.coefficient121_212, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1502.coefficient120_214, Icur := OriginalRow227TriangleData1502.coefficient120_213,
    output := OriginalRow227TriangleData1511.coefficient121_213, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1503.coefficient120_215, Icur := OriginalRow227TriangleData1502.coefficient120_214,
    output := OriginalRow227TriangleData1511.coefficient121_214, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1503.coefficient120_216, Icur := OriginalRow227TriangleData1503.coefficient120_215,
    output := OriginalRow227TriangleData1511.coefficient121_215, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1495

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1495.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
