import Grothe.UpperChaos.OriginalRow227TriangleData0242
import Grothe.UpperChaos.OriginalRow227TriangleData0243
import Grothe.UpperChaos.OriginalRow227TriangleData0257
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0241
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_176, Icur := OriginalRow227TriangleData0242.coefficient15_175,
    output := OriginalRow227TriangleData0257.coefficient16_175, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_177, Icur := OriginalRow227TriangleData0242.coefficient15_176,
    output := OriginalRow227TriangleData0257.coefficient16_176, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_178, Icur := OriginalRow227TriangleData0242.coefficient15_177,
    output := OriginalRow227TriangleData0257.coefficient16_177, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_179, Icur := OriginalRow227TriangleData0242.coefficient15_178,
    output := OriginalRow227TriangleData0257.coefficient16_178, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_180, Icur := OriginalRow227TriangleData0242.coefficient15_179,
    output := OriginalRow227TriangleData0257.coefficient16_179, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_181, Icur := OriginalRow227TriangleData0242.coefficient15_180,
    output := OriginalRow227TriangleData0257.coefficient16_180, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_182, Icur := OriginalRow227TriangleData0242.coefficient15_181,
    output := OriginalRow227TriangleData0257.coefficient16_181, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_183, Icur := OriginalRow227TriangleData0242.coefficient15_182,
    output := OriginalRow227TriangleData0257.coefficient16_182, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_184, Icur := OriginalRow227TriangleData0242.coefficient15_183,
    output := OriginalRow227TriangleData0257.coefficient16_183, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_185, Icur := OriginalRow227TriangleData0242.coefficient15_184,
    output := OriginalRow227TriangleData0257.coefficient16_184, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_186, Icur := OriginalRow227TriangleData0242.coefficient15_185,
    output := OriginalRow227TriangleData0257.coefficient16_185, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_187, Icur := OriginalRow227TriangleData0242.coefficient15_186,
    output := OriginalRow227TriangleData0257.coefficient16_186, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_188, Icur := OriginalRow227TriangleData0242.coefficient15_187,
    output := OriginalRow227TriangleData0257.coefficient16_187, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_189, Icur := OriginalRow227TriangleData0242.coefficient15_188,
    output := OriginalRow227TriangleData0257.coefficient16_188, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_190, Icur := OriginalRow227TriangleData0242.coefficient15_189,
    output := OriginalRow227TriangleData0257.coefficient16_189, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_191, Icur := OriginalRow227TriangleData0242.coefficient15_190,
    output := OriginalRow227TriangleData0257.coefficient16_190, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_192, Icur := OriginalRow227TriangleData0242.coefficient15_191,
    output := OriginalRow227TriangleData0257.coefficient16_191, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_193, Icur := OriginalRow227TriangleData0242.coefficient15_192,
    output := OriginalRow227TriangleData0257.coefficient16_192, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_194, Icur := OriginalRow227TriangleData0242.coefficient15_193,
    output := OriginalRow227TriangleData0257.coefficient16_193, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_195, Icur := OriginalRow227TriangleData0242.coefficient15_194,
    output := OriginalRow227TriangleData0257.coefficient16_194, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_196, Icur := OriginalRow227TriangleData0242.coefficient15_195,
    output := OriginalRow227TriangleData0257.coefficient16_195, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_197, Icur := OriginalRow227TriangleData0242.coefficient15_196,
    output := OriginalRow227TriangleData0257.coefficient16_196, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_198, Icur := OriginalRow227TriangleData0242.coefficient15_197,
    output := OriginalRow227TriangleData0257.coefficient16_197, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_199, Icur := OriginalRow227TriangleData0242.coefficient15_198,
    output := OriginalRow227TriangleData0257.coefficient16_198, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_200, Icur := OriginalRow227TriangleData0242.coefficient15_199,
    output := OriginalRow227TriangleData0257.coefficient16_199, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_201, Icur := OriginalRow227TriangleData0242.coefficient15_200,
    output := OriginalRow227TriangleData0257.coefficient16_200, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_202, Icur := OriginalRow227TriangleData0242.coefficient15_201,
    output := OriginalRow227TriangleData0257.coefficient16_201, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_203, Icur := OriginalRow227TriangleData0242.coefficient15_202,
    output := OriginalRow227TriangleData0257.coefficient16_202, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_204, Icur := OriginalRow227TriangleData0242.coefficient15_203,
    output := OriginalRow227TriangleData0257.coefficient16_203, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0242.coefficient15_205, Icur := OriginalRow227TriangleData0242.coefficient15_204,
    output := OriginalRow227TriangleData0257.coefficient16_204, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0243.coefficient15_206, Icur := OriginalRow227TriangleData0242.coefficient15_205,
    output := OriginalRow227TriangleData0257.coefficient16_205, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0243.coefficient15_207, Icur := OriginalRow227TriangleData0243.coefficient15_206,
    output := OriginalRow227TriangleData0257.coefficient16_206, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0241

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0241.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
