import Grothe.UpperChaos.OriginalRow227TriangleData1520
import Grothe.UpperChaos.OriginalRow227TriangleData1521
import Grothe.UpperChaos.OriginalRow227TriangleData1529
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1513
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_187, Icur := OriginalRow227TriangleData1520.coefficient122_186,
    output := OriginalRow227TriangleData1529.coefficient123_186, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_188, Icur := OriginalRow227TriangleData1520.coefficient122_187,
    output := OriginalRow227TriangleData1529.coefficient123_187, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_189, Icur := OriginalRow227TriangleData1520.coefficient122_188,
    output := OriginalRow227TriangleData1529.coefficient123_188, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_190, Icur := OriginalRow227TriangleData1520.coefficient122_189,
    output := OriginalRow227TriangleData1529.coefficient123_189, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_191, Icur := OriginalRow227TriangleData1520.coefficient122_190,
    output := OriginalRow227TriangleData1529.coefficient123_190, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_192, Icur := OriginalRow227TriangleData1520.coefficient122_191,
    output := OriginalRow227TriangleData1529.coefficient123_191, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_193, Icur := OriginalRow227TriangleData1520.coefficient122_192,
    output := OriginalRow227TriangleData1529.coefficient123_192, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_194, Icur := OriginalRow227TriangleData1520.coefficient122_193,
    output := OriginalRow227TriangleData1529.coefficient123_193, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_195, Icur := OriginalRow227TriangleData1520.coefficient122_194,
    output := OriginalRow227TriangleData1529.coefficient123_194, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_196, Icur := OriginalRow227TriangleData1520.coefficient122_195,
    output := OriginalRow227TriangleData1529.coefficient123_195, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_197, Icur := OriginalRow227TriangleData1520.coefficient122_196,
    output := OriginalRow227TriangleData1529.coefficient123_196, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_198, Icur := OriginalRow227TriangleData1520.coefficient122_197,
    output := OriginalRow227TriangleData1529.coefficient123_197, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_199, Icur := OriginalRow227TriangleData1520.coefficient122_198,
    output := OriginalRow227TriangleData1529.coefficient123_198, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_200, Icur := OriginalRow227TriangleData1520.coefficient122_199,
    output := OriginalRow227TriangleData1529.coefficient123_199, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_201, Icur := OriginalRow227TriangleData1520.coefficient122_200,
    output := OriginalRow227TriangleData1529.coefficient123_200, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_202, Icur := OriginalRow227TriangleData1520.coefficient122_201,
    output := OriginalRow227TriangleData1529.coefficient123_201, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_203, Icur := OriginalRow227TriangleData1520.coefficient122_202,
    output := OriginalRow227TriangleData1529.coefficient123_202, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_204, Icur := OriginalRow227TriangleData1520.coefficient122_203,
    output := OriginalRow227TriangleData1529.coefficient123_203, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_205, Icur := OriginalRow227TriangleData1520.coefficient122_204,
    output := OriginalRow227TriangleData1529.coefficient123_204, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_206, Icur := OriginalRow227TriangleData1520.coefficient122_205,
    output := OriginalRow227TriangleData1529.coefficient123_205, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_207, Icur := OriginalRow227TriangleData1520.coefficient122_206,
    output := OriginalRow227TriangleData1529.coefficient123_206, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_208, Icur := OriginalRow227TriangleData1520.coefficient122_207,
    output := OriginalRow227TriangleData1529.coefficient123_207, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_209, Icur := OriginalRow227TriangleData1520.coefficient122_208,
    output := OriginalRow227TriangleData1529.coefficient123_208, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_210, Icur := OriginalRow227TriangleData1520.coefficient122_209,
    output := OriginalRow227TriangleData1529.coefficient123_209, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_211, Icur := OriginalRow227TriangleData1520.coefficient122_210,
    output := OriginalRow227TriangleData1529.coefficient123_210, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_212, Icur := OriginalRow227TriangleData1520.coefficient122_211,
    output := OriginalRow227TriangleData1529.coefficient123_211, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_213, Icur := OriginalRow227TriangleData1520.coefficient122_212,
    output := OriginalRow227TriangleData1529.coefficient123_212, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_214, Icur := OriginalRow227TriangleData1520.coefficient122_213,
    output := OriginalRow227TriangleData1529.coefficient123_213, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_215, Icur := OriginalRow227TriangleData1520.coefficient122_214,
    output := OriginalRow227TriangleData1529.coefficient123_214, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1520.coefficient122_216, Icur := OriginalRow227TriangleData1520.coefficient122_215,
    output := OriginalRow227TriangleData1529.coefficient123_215, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1521.coefficient122_217, Icur := OriginalRow227TriangleData1520.coefficient122_216,
    output := OriginalRow227TriangleData1529.coefficient123_216, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1521.coefficient122_218, Icur := OriginalRow227TriangleData1521.coefficient122_217,
    output := OriginalRow227TriangleData1529.coefficient123_217, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1513

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1513.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
