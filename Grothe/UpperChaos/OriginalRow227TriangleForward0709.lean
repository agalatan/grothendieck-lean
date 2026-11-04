import Grothe.UpperChaos.OriginalRow227TriangleData0712
import Grothe.UpperChaos.OriginalRow227TriangleData0713
import Grothe.UpperChaos.OriginalRow227TriangleData0725
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0709
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_177, Icur := OriginalRow227TriangleData0712.coefficient48_176,
    output := OriginalRow227TriangleData0725.coefficient49_176, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_178, Icur := OriginalRow227TriangleData0712.coefficient48_177,
    output := OriginalRow227TriangleData0725.coefficient49_177, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_179, Icur := OriginalRow227TriangleData0712.coefficient48_178,
    output := OriginalRow227TriangleData0725.coefficient49_178, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_180, Icur := OriginalRow227TriangleData0712.coefficient48_179,
    output := OriginalRow227TriangleData0725.coefficient49_179, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_181, Icur := OriginalRow227TriangleData0712.coefficient48_180,
    output := OriginalRow227TriangleData0725.coefficient49_180, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_182, Icur := OriginalRow227TriangleData0712.coefficient48_181,
    output := OriginalRow227TriangleData0725.coefficient49_181, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_183, Icur := OriginalRow227TriangleData0712.coefficient48_182,
    output := OriginalRow227TriangleData0725.coefficient49_182, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_184, Icur := OriginalRow227TriangleData0712.coefficient48_183,
    output := OriginalRow227TriangleData0725.coefficient49_183, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_185, Icur := OriginalRow227TriangleData0712.coefficient48_184,
    output := OriginalRow227TriangleData0725.coefficient49_184, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_186, Icur := OriginalRow227TriangleData0712.coefficient48_185,
    output := OriginalRow227TriangleData0725.coefficient49_185, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_187, Icur := OriginalRow227TriangleData0712.coefficient48_186,
    output := OriginalRow227TriangleData0725.coefficient49_186, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_188, Icur := OriginalRow227TriangleData0712.coefficient48_187,
    output := OriginalRow227TriangleData0725.coefficient49_187, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_189, Icur := OriginalRow227TriangleData0712.coefficient48_188,
    output := OriginalRow227TriangleData0725.coefficient49_188, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_190, Icur := OriginalRow227TriangleData0712.coefficient48_189,
    output := OriginalRow227TriangleData0725.coefficient49_189, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_191, Icur := OriginalRow227TriangleData0712.coefficient48_190,
    output := OriginalRow227TriangleData0725.coefficient49_190, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_192, Icur := OriginalRow227TriangleData0712.coefficient48_191,
    output := OriginalRow227TriangleData0725.coefficient49_191, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_193, Icur := OriginalRow227TriangleData0712.coefficient48_192,
    output := OriginalRow227TriangleData0725.coefficient49_192, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_194, Icur := OriginalRow227TriangleData0712.coefficient48_193,
    output := OriginalRow227TriangleData0725.coefficient49_193, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_195, Icur := OriginalRow227TriangleData0712.coefficient48_194,
    output := OriginalRow227TriangleData0725.coefficient49_194, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_196, Icur := OriginalRow227TriangleData0712.coefficient48_195,
    output := OriginalRow227TriangleData0725.coefficient49_195, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_197, Icur := OriginalRow227TriangleData0712.coefficient48_196,
    output := OriginalRow227TriangleData0725.coefficient49_196, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_198, Icur := OriginalRow227TriangleData0712.coefficient48_197,
    output := OriginalRow227TriangleData0725.coefficient49_197, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_199, Icur := OriginalRow227TriangleData0712.coefficient48_198,
    output := OriginalRow227TriangleData0725.coefficient49_198, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_200, Icur := OriginalRow227TriangleData0712.coefficient48_199,
    output := OriginalRow227TriangleData0725.coefficient49_199, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_201, Icur := OriginalRow227TriangleData0712.coefficient48_200,
    output := OriginalRow227TriangleData0725.coefficient49_200, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_202, Icur := OriginalRow227TriangleData0712.coefficient48_201,
    output := OriginalRow227TriangleData0725.coefficient49_201, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_203, Icur := OriginalRow227TriangleData0712.coefficient48_202,
    output := OriginalRow227TriangleData0725.coefficient49_202, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_204, Icur := OriginalRow227TriangleData0712.coefficient48_203,
    output := OriginalRow227TriangleData0725.coefficient49_203, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_205, Icur := OriginalRow227TriangleData0712.coefficient48_204,
    output := OriginalRow227TriangleData0725.coefficient49_204, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_206, Icur := OriginalRow227TriangleData0712.coefficient48_205,
    output := OriginalRow227TriangleData0725.coefficient49_205, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0713.coefficient48_207, Icur := OriginalRow227TriangleData0712.coefficient48_206,
    output := OriginalRow227TriangleData0725.coefficient49_206, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0713.coefficient48_208, Icur := OriginalRow227TriangleData0713.coefficient48_207,
    output := OriginalRow227TriangleData0725.coefficient49_207, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0709

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0709.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
