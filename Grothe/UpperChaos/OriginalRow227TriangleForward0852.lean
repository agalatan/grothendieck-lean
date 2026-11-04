import Grothe.UpperChaos.OriginalRow227TriangleData0855
import Grothe.UpperChaos.OriginalRow227TriangleData0856
import Grothe.UpperChaos.OriginalRow227TriangleData0868
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0852
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_188, Icur := OriginalRow227TriangleData0855.coefficient59_187,
    output := OriginalRow227TriangleData0868.coefficient60_187, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_189, Icur := OriginalRow227TriangleData0855.coefficient59_188,
    output := OriginalRow227TriangleData0868.coefficient60_188, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_190, Icur := OriginalRow227TriangleData0855.coefficient59_189,
    output := OriginalRow227TriangleData0868.coefficient60_189, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_191, Icur := OriginalRow227TriangleData0855.coefficient59_190,
    output := OriginalRow227TriangleData0868.coefficient60_190, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_192, Icur := OriginalRow227TriangleData0855.coefficient59_191,
    output := OriginalRow227TriangleData0868.coefficient60_191, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_193, Icur := OriginalRow227TriangleData0855.coefficient59_192,
    output := OriginalRow227TriangleData0868.coefficient60_192, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_194, Icur := OriginalRow227TriangleData0855.coefficient59_193,
    output := OriginalRow227TriangleData0868.coefficient60_193, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_195, Icur := OriginalRow227TriangleData0855.coefficient59_194,
    output := OriginalRow227TriangleData0868.coefficient60_194, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_196, Icur := OriginalRow227TriangleData0855.coefficient59_195,
    output := OriginalRow227TriangleData0868.coefficient60_195, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_197, Icur := OriginalRow227TriangleData0855.coefficient59_196,
    output := OriginalRow227TriangleData0868.coefficient60_196, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_198, Icur := OriginalRow227TriangleData0855.coefficient59_197,
    output := OriginalRow227TriangleData0868.coefficient60_197, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_199, Icur := OriginalRow227TriangleData0855.coefficient59_198,
    output := OriginalRow227TriangleData0868.coefficient60_198, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_200, Icur := OriginalRow227TriangleData0855.coefficient59_199,
    output := OriginalRow227TriangleData0868.coefficient60_199, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_201, Icur := OriginalRow227TriangleData0855.coefficient59_200,
    output := OriginalRow227TriangleData0868.coefficient60_200, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_202, Icur := OriginalRow227TriangleData0855.coefficient59_201,
    output := OriginalRow227TriangleData0868.coefficient60_201, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_203, Icur := OriginalRow227TriangleData0855.coefficient59_202,
    output := OriginalRow227TriangleData0868.coefficient60_202, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_204, Icur := OriginalRow227TriangleData0855.coefficient59_203,
    output := OriginalRow227TriangleData0868.coefficient60_203, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_205, Icur := OriginalRow227TriangleData0855.coefficient59_204,
    output := OriginalRow227TriangleData0868.coefficient60_204, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_206, Icur := OriginalRow227TriangleData0855.coefficient59_205,
    output := OriginalRow227TriangleData0868.coefficient60_205, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_207, Icur := OriginalRow227TriangleData0855.coefficient59_206,
    output := OriginalRow227TriangleData0868.coefficient60_206, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_208, Icur := OriginalRow227TriangleData0855.coefficient59_207,
    output := OriginalRow227TriangleData0868.coefficient60_207, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_209, Icur := OriginalRow227TriangleData0855.coefficient59_208,
    output := OriginalRow227TriangleData0868.coefficient60_208, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_210, Icur := OriginalRow227TriangleData0855.coefficient59_209,
    output := OriginalRow227TriangleData0868.coefficient60_209, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_211, Icur := OriginalRow227TriangleData0855.coefficient59_210,
    output := OriginalRow227TriangleData0868.coefficient60_210, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_212, Icur := OriginalRow227TriangleData0855.coefficient59_211,
    output := OriginalRow227TriangleData0868.coefficient60_211, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_213, Icur := OriginalRow227TriangleData0855.coefficient59_212,
    output := OriginalRow227TriangleData0868.coefficient60_212, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_214, Icur := OriginalRow227TriangleData0855.coefficient59_213,
    output := OriginalRow227TriangleData0868.coefficient60_213, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_215, Icur := OriginalRow227TriangleData0855.coefficient59_214,
    output := OriginalRow227TriangleData0868.coefficient60_214, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_216, Icur := OriginalRow227TriangleData0855.coefficient59_215,
    output := OriginalRow227TriangleData0868.coefficient60_215, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_217, Icur := OriginalRow227TriangleData0855.coefficient59_216,
    output := OriginalRow227TriangleData0868.coefficient60_216, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0856.coefficient59_218, Icur := OriginalRow227TriangleData0855.coefficient59_217,
    output := OriginalRow227TriangleData0868.coefficient60_217, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0856.coefficient59_219, Icur := OriginalRow227TriangleData0856.coefficient59_218,
    output := OriginalRow227TriangleData0868.coefficient60_218, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0852

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0852.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
