import Grothe.UpperChaos.OriginalRow227TriangleData1403
import Grothe.UpperChaos.OriginalRow227TriangleData1404
import Grothe.UpperChaos.OriginalRow227TriangleData1412
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1396
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_174, Icur := OriginalRow227TriangleData1403.coefficient109_173,
    output := OriginalRow227TriangleData1412.coefficient110_173, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_175, Icur := OriginalRow227TriangleData1403.coefficient109_174,
    output := OriginalRow227TriangleData1412.coefficient110_174, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_176, Icur := OriginalRow227TriangleData1403.coefficient109_175,
    output := OriginalRow227TriangleData1412.coefficient110_175, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_177, Icur := OriginalRow227TriangleData1403.coefficient109_176,
    output := OriginalRow227TriangleData1412.coefficient110_176, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_178, Icur := OriginalRow227TriangleData1403.coefficient109_177,
    output := OriginalRow227TriangleData1412.coefficient110_177, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_179, Icur := OriginalRow227TriangleData1403.coefficient109_178,
    output := OriginalRow227TriangleData1412.coefficient110_178, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_180, Icur := OriginalRow227TriangleData1403.coefficient109_179,
    output := OriginalRow227TriangleData1412.coefficient110_179, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_181, Icur := OriginalRow227TriangleData1403.coefficient109_180,
    output := OriginalRow227TriangleData1412.coefficient110_180, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_182, Icur := OriginalRow227TriangleData1403.coefficient109_181,
    output := OriginalRow227TriangleData1412.coefficient110_181, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_183, Icur := OriginalRow227TriangleData1403.coefficient109_182,
    output := OriginalRow227TriangleData1412.coefficient110_182, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_184, Icur := OriginalRow227TriangleData1403.coefficient109_183,
    output := OriginalRow227TriangleData1412.coefficient110_183, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_185, Icur := OriginalRow227TriangleData1403.coefficient109_184,
    output := OriginalRow227TriangleData1412.coefficient110_184, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_186, Icur := OriginalRow227TriangleData1403.coefficient109_185,
    output := OriginalRow227TriangleData1412.coefficient110_185, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_187, Icur := OriginalRow227TriangleData1403.coefficient109_186,
    output := OriginalRow227TriangleData1412.coefficient110_186, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_188, Icur := OriginalRow227TriangleData1403.coefficient109_187,
    output := OriginalRow227TriangleData1412.coefficient110_187, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_189, Icur := OriginalRow227TriangleData1403.coefficient109_188,
    output := OriginalRow227TriangleData1412.coefficient110_188, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_190, Icur := OriginalRow227TriangleData1403.coefficient109_189,
    output := OriginalRow227TriangleData1412.coefficient110_189, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_191, Icur := OriginalRow227TriangleData1403.coefficient109_190,
    output := OriginalRow227TriangleData1412.coefficient110_190, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_192, Icur := OriginalRow227TriangleData1403.coefficient109_191,
    output := OriginalRow227TriangleData1412.coefficient110_191, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_193, Icur := OriginalRow227TriangleData1403.coefficient109_192,
    output := OriginalRow227TriangleData1412.coefficient110_192, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_194, Icur := OriginalRow227TriangleData1403.coefficient109_193,
    output := OriginalRow227TriangleData1412.coefficient110_193, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_195, Icur := OriginalRow227TriangleData1403.coefficient109_194,
    output := OriginalRow227TriangleData1412.coefficient110_194, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_196, Icur := OriginalRow227TriangleData1403.coefficient109_195,
    output := OriginalRow227TriangleData1412.coefficient110_195, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_197, Icur := OriginalRow227TriangleData1403.coefficient109_196,
    output := OriginalRow227TriangleData1412.coefficient110_196, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_198, Icur := OriginalRow227TriangleData1403.coefficient109_197,
    output := OriginalRow227TriangleData1412.coefficient110_197, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_199, Icur := OriginalRow227TriangleData1403.coefficient109_198,
    output := OriginalRow227TriangleData1412.coefficient110_198, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_200, Icur := OriginalRow227TriangleData1403.coefficient109_199,
    output := OriginalRow227TriangleData1412.coefficient110_199, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_201, Icur := OriginalRow227TriangleData1403.coefficient109_200,
    output := OriginalRow227TriangleData1412.coefficient110_200, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_202, Icur := OriginalRow227TriangleData1403.coefficient109_201,
    output := OriginalRow227TriangleData1412.coefficient110_201, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1403.coefficient109_203, Icur := OriginalRow227TriangleData1403.coefficient109_202,
    output := OriginalRow227TriangleData1412.coefficient110_202, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_204, Icur := OriginalRow227TriangleData1403.coefficient109_203,
    output := OriginalRow227TriangleData1412.coefficient110_203, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_205, Icur := OriginalRow227TriangleData1404.coefficient109_204,
    output := OriginalRow227TriangleData1412.coefficient110_204, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1396

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1396.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
