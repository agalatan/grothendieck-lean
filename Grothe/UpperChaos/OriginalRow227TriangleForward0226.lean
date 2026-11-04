import Grothe.UpperChaos.OriginalRow227TriangleData0227
import Grothe.UpperChaos.OriginalRow227TriangleData0228
import Grothe.UpperChaos.OriginalRow227TriangleData0242
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0226
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_175, Icur := OriginalRow227TriangleData0227.coefficient14_174,
    output := OriginalRow227TriangleData0242.coefficient15_174, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_176, Icur := OriginalRow227TriangleData0227.coefficient14_175,
    output := OriginalRow227TriangleData0242.coefficient15_175, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_177, Icur := OriginalRow227TriangleData0227.coefficient14_176,
    output := OriginalRow227TriangleData0242.coefficient15_176, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_178, Icur := OriginalRow227TriangleData0227.coefficient14_177,
    output := OriginalRow227TriangleData0242.coefficient15_177, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_179, Icur := OriginalRow227TriangleData0227.coefficient14_178,
    output := OriginalRow227TriangleData0242.coefficient15_178, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_180, Icur := OriginalRow227TriangleData0227.coefficient14_179,
    output := OriginalRow227TriangleData0242.coefficient15_179, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_181, Icur := OriginalRow227TriangleData0227.coefficient14_180,
    output := OriginalRow227TriangleData0242.coefficient15_180, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_182, Icur := OriginalRow227TriangleData0227.coefficient14_181,
    output := OriginalRow227TriangleData0242.coefficient15_181, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_183, Icur := OriginalRow227TriangleData0227.coefficient14_182,
    output := OriginalRow227TriangleData0242.coefficient15_182, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_184, Icur := OriginalRow227TriangleData0227.coefficient14_183,
    output := OriginalRow227TriangleData0242.coefficient15_183, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_185, Icur := OriginalRow227TriangleData0227.coefficient14_184,
    output := OriginalRow227TriangleData0242.coefficient15_184, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_186, Icur := OriginalRow227TriangleData0227.coefficient14_185,
    output := OriginalRow227TriangleData0242.coefficient15_185, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_187, Icur := OriginalRow227TriangleData0227.coefficient14_186,
    output := OriginalRow227TriangleData0242.coefficient15_186, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_188, Icur := OriginalRow227TriangleData0227.coefficient14_187,
    output := OriginalRow227TriangleData0242.coefficient15_187, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_189, Icur := OriginalRow227TriangleData0227.coefficient14_188,
    output := OriginalRow227TriangleData0242.coefficient15_188, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_190, Icur := OriginalRow227TriangleData0227.coefficient14_189,
    output := OriginalRow227TriangleData0242.coefficient15_189, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_191, Icur := OriginalRow227TriangleData0227.coefficient14_190,
    output := OriginalRow227TriangleData0242.coefficient15_190, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_192, Icur := OriginalRow227TriangleData0227.coefficient14_191,
    output := OriginalRow227TriangleData0242.coefficient15_191, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_193, Icur := OriginalRow227TriangleData0227.coefficient14_192,
    output := OriginalRow227TriangleData0242.coefficient15_192, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_194, Icur := OriginalRow227TriangleData0227.coefficient14_193,
    output := OriginalRow227TriangleData0242.coefficient15_193, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_195, Icur := OriginalRow227TriangleData0227.coefficient14_194,
    output := OriginalRow227TriangleData0242.coefficient15_194, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_196, Icur := OriginalRow227TriangleData0227.coefficient14_195,
    output := OriginalRow227TriangleData0242.coefficient15_195, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_197, Icur := OriginalRow227TriangleData0227.coefficient14_196,
    output := OriginalRow227TriangleData0242.coefficient15_196, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_198, Icur := OriginalRow227TriangleData0227.coefficient14_197,
    output := OriginalRow227TriangleData0242.coefficient15_197, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_199, Icur := OriginalRow227TriangleData0227.coefficient14_198,
    output := OriginalRow227TriangleData0242.coefficient15_198, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_200, Icur := OriginalRow227TriangleData0227.coefficient14_199,
    output := OriginalRow227TriangleData0242.coefficient15_199, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_201, Icur := OriginalRow227TriangleData0227.coefficient14_200,
    output := OriginalRow227TriangleData0242.coefficient15_200, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_202, Icur := OriginalRow227TriangleData0227.coefficient14_201,
    output := OriginalRow227TriangleData0242.coefficient15_201, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_203, Icur := OriginalRow227TriangleData0227.coefficient14_202,
    output := OriginalRow227TriangleData0242.coefficient15_202, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0227.coefficient14_204, Icur := OriginalRow227TriangleData0227.coefficient14_203,
    output := OriginalRow227TriangleData0242.coefficient15_203, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_205, Icur := OriginalRow227TriangleData0227.coefficient14_204,
    output := OriginalRow227TriangleData0242.coefficient15_204, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0228.coefficient14_206, Icur := OriginalRow227TriangleData0228.coefficient14_205,
    output := OriginalRow227TriangleData0242.coefficient15_205, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0226

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0226.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
