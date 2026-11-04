import Grothe.UpperChaos.OriginalRow227TriangleData0362
import Grothe.UpperChaos.OriginalRow227TriangleData0363
import Grothe.UpperChaos.OriginalRow227TriangleData0377
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0361
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_184, Icur := OriginalRow227TriangleData0362.coefficient23_183,
    output := OriginalRow227TriangleData0377.coefficient24_183, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_185, Icur := OriginalRow227TriangleData0362.coefficient23_184,
    output := OriginalRow227TriangleData0377.coefficient24_184, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_186, Icur := OriginalRow227TriangleData0362.coefficient23_185,
    output := OriginalRow227TriangleData0377.coefficient24_185, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_187, Icur := OriginalRow227TriangleData0362.coefficient23_186,
    output := OriginalRow227TriangleData0377.coefficient24_186, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_188, Icur := OriginalRow227TriangleData0362.coefficient23_187,
    output := OriginalRow227TriangleData0377.coefficient24_187, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_189, Icur := OriginalRow227TriangleData0362.coefficient23_188,
    output := OriginalRow227TriangleData0377.coefficient24_188, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_190, Icur := OriginalRow227TriangleData0362.coefficient23_189,
    output := OriginalRow227TriangleData0377.coefficient24_189, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_191, Icur := OriginalRow227TriangleData0362.coefficient23_190,
    output := OriginalRow227TriangleData0377.coefficient24_190, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_192, Icur := OriginalRow227TriangleData0362.coefficient23_191,
    output := OriginalRow227TriangleData0377.coefficient24_191, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_193, Icur := OriginalRow227TriangleData0362.coefficient23_192,
    output := OriginalRow227TriangleData0377.coefficient24_192, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_194, Icur := OriginalRow227TriangleData0362.coefficient23_193,
    output := OriginalRow227TriangleData0377.coefficient24_193, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_195, Icur := OriginalRow227TriangleData0362.coefficient23_194,
    output := OriginalRow227TriangleData0377.coefficient24_194, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_196, Icur := OriginalRow227TriangleData0362.coefficient23_195,
    output := OriginalRow227TriangleData0377.coefficient24_195, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_197, Icur := OriginalRow227TriangleData0362.coefficient23_196,
    output := OriginalRow227TriangleData0377.coefficient24_196, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_198, Icur := OriginalRow227TriangleData0362.coefficient23_197,
    output := OriginalRow227TriangleData0377.coefficient24_197, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_199, Icur := OriginalRow227TriangleData0362.coefficient23_198,
    output := OriginalRow227TriangleData0377.coefficient24_198, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_200, Icur := OriginalRow227TriangleData0362.coefficient23_199,
    output := OriginalRow227TriangleData0377.coefficient24_199, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_201, Icur := OriginalRow227TriangleData0362.coefficient23_200,
    output := OriginalRow227TriangleData0377.coefficient24_200, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_202, Icur := OriginalRow227TriangleData0362.coefficient23_201,
    output := OriginalRow227TriangleData0377.coefficient24_201, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_203, Icur := OriginalRow227TriangleData0362.coefficient23_202,
    output := OriginalRow227TriangleData0377.coefficient24_202, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_204, Icur := OriginalRow227TriangleData0362.coefficient23_203,
    output := OriginalRow227TriangleData0377.coefficient24_203, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_205, Icur := OriginalRow227TriangleData0362.coefficient23_204,
    output := OriginalRow227TriangleData0377.coefficient24_204, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_206, Icur := OriginalRow227TriangleData0362.coefficient23_205,
    output := OriginalRow227TriangleData0377.coefficient24_205, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_207, Icur := OriginalRow227TriangleData0362.coefficient23_206,
    output := OriginalRow227TriangleData0377.coefficient24_206, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_208, Icur := OriginalRow227TriangleData0362.coefficient23_207,
    output := OriginalRow227TriangleData0377.coefficient24_207, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_209, Icur := OriginalRow227TriangleData0362.coefficient23_208,
    output := OriginalRow227TriangleData0377.coefficient24_208, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_210, Icur := OriginalRow227TriangleData0362.coefficient23_209,
    output := OriginalRow227TriangleData0377.coefficient24_209, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_211, Icur := OriginalRow227TriangleData0362.coefficient23_210,
    output := OriginalRow227TriangleData0377.coefficient24_210, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_212, Icur := OriginalRow227TriangleData0362.coefficient23_211,
    output := OriginalRow227TriangleData0377.coefficient24_211, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0362.coefficient23_213, Icur := OriginalRow227TriangleData0362.coefficient23_212,
    output := OriginalRow227TriangleData0377.coefficient24_212, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0363.coefficient23_214, Icur := OriginalRow227TriangleData0362.coefficient23_213,
    output := OriginalRow227TriangleData0377.coefficient24_213, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0363.coefficient23_215, Icur := OriginalRow227TriangleData0363.coefficient23_214,
    output := OriginalRow227TriangleData0377.coefficient24_214, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0361

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0361.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
