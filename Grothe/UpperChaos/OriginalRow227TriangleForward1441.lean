import Grothe.UpperChaos.OriginalRow227TriangleData1448
import Grothe.UpperChaos.OriginalRow227TriangleData1449
import Grothe.UpperChaos.OriginalRow227TriangleData1457
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1441
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_179, Icur := OriginalRow227TriangleData1448.coefficient114_178,
    output := OriginalRow227TriangleData1457.coefficient115_178, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_180, Icur := OriginalRow227TriangleData1448.coefficient114_179,
    output := OriginalRow227TriangleData1457.coefficient115_179, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_181, Icur := OriginalRow227TriangleData1448.coefficient114_180,
    output := OriginalRow227TriangleData1457.coefficient115_180, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_182, Icur := OriginalRow227TriangleData1448.coefficient114_181,
    output := OriginalRow227TriangleData1457.coefficient115_181, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_183, Icur := OriginalRow227TriangleData1448.coefficient114_182,
    output := OriginalRow227TriangleData1457.coefficient115_182, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_184, Icur := OriginalRow227TriangleData1448.coefficient114_183,
    output := OriginalRow227TriangleData1457.coefficient115_183, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_185, Icur := OriginalRow227TriangleData1448.coefficient114_184,
    output := OriginalRow227TriangleData1457.coefficient115_184, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_186, Icur := OriginalRow227TriangleData1448.coefficient114_185,
    output := OriginalRow227TriangleData1457.coefficient115_185, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_187, Icur := OriginalRow227TriangleData1448.coefficient114_186,
    output := OriginalRow227TriangleData1457.coefficient115_186, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_188, Icur := OriginalRow227TriangleData1448.coefficient114_187,
    output := OriginalRow227TriangleData1457.coefficient115_187, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_189, Icur := OriginalRow227TriangleData1448.coefficient114_188,
    output := OriginalRow227TriangleData1457.coefficient115_188, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_190, Icur := OriginalRow227TriangleData1448.coefficient114_189,
    output := OriginalRow227TriangleData1457.coefficient115_189, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_191, Icur := OriginalRow227TriangleData1448.coefficient114_190,
    output := OriginalRow227TriangleData1457.coefficient115_190, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_192, Icur := OriginalRow227TriangleData1448.coefficient114_191,
    output := OriginalRow227TriangleData1457.coefficient115_191, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_193, Icur := OriginalRow227TriangleData1448.coefficient114_192,
    output := OriginalRow227TriangleData1457.coefficient115_192, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_194, Icur := OriginalRow227TriangleData1448.coefficient114_193,
    output := OriginalRow227TriangleData1457.coefficient115_193, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_195, Icur := OriginalRow227TriangleData1448.coefficient114_194,
    output := OriginalRow227TriangleData1457.coefficient115_194, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_196, Icur := OriginalRow227TriangleData1448.coefficient114_195,
    output := OriginalRow227TriangleData1457.coefficient115_195, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_197, Icur := OriginalRow227TriangleData1448.coefficient114_196,
    output := OriginalRow227TriangleData1457.coefficient115_196, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_198, Icur := OriginalRow227TriangleData1448.coefficient114_197,
    output := OriginalRow227TriangleData1457.coefficient115_197, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_199, Icur := OriginalRow227TriangleData1448.coefficient114_198,
    output := OriginalRow227TriangleData1457.coefficient115_198, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_200, Icur := OriginalRow227TriangleData1448.coefficient114_199,
    output := OriginalRow227TriangleData1457.coefficient115_199, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_201, Icur := OriginalRow227TriangleData1448.coefficient114_200,
    output := OriginalRow227TriangleData1457.coefficient115_200, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_202, Icur := OriginalRow227TriangleData1448.coefficient114_201,
    output := OriginalRow227TriangleData1457.coefficient115_201, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_203, Icur := OriginalRow227TriangleData1448.coefficient114_202,
    output := OriginalRow227TriangleData1457.coefficient115_202, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_204, Icur := OriginalRow227TriangleData1448.coefficient114_203,
    output := OriginalRow227TriangleData1457.coefficient115_203, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_205, Icur := OriginalRow227TriangleData1448.coefficient114_204,
    output := OriginalRow227TriangleData1457.coefficient115_204, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_206, Icur := OriginalRow227TriangleData1448.coefficient114_205,
    output := OriginalRow227TriangleData1457.coefficient115_205, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_207, Icur := OriginalRow227TriangleData1448.coefficient114_206,
    output := OriginalRow227TriangleData1457.coefficient115_206, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_208, Icur := OriginalRow227TriangleData1448.coefficient114_207,
    output := OriginalRow227TriangleData1457.coefficient115_207, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1449.coefficient114_209, Icur := OriginalRow227TriangleData1448.coefficient114_208,
    output := OriginalRow227TriangleData1457.coefficient115_208, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1449.coefficient114_210, Icur := OriginalRow227TriangleData1449.coefficient114_209,
    output := OriginalRow227TriangleData1457.coefficient115_209, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1441

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1441.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
