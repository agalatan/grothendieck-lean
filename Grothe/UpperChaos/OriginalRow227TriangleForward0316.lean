import Grothe.UpperChaos.OriginalRow227TriangleData0317
import Grothe.UpperChaos.OriginalRow227TriangleData0318
import Grothe.UpperChaos.OriginalRow227TriangleData0332
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0316
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_181, Icur := OriginalRow227TriangleData0317.coefficient20_180,
    output := OriginalRow227TriangleData0332.coefficient21_180, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_182, Icur := OriginalRow227TriangleData0317.coefficient20_181,
    output := OriginalRow227TriangleData0332.coefficient21_181, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_183, Icur := OriginalRow227TriangleData0317.coefficient20_182,
    output := OriginalRow227TriangleData0332.coefficient21_182, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_184, Icur := OriginalRow227TriangleData0317.coefficient20_183,
    output := OriginalRow227TriangleData0332.coefficient21_183, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_185, Icur := OriginalRow227TriangleData0317.coefficient20_184,
    output := OriginalRow227TriangleData0332.coefficient21_184, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_186, Icur := OriginalRow227TriangleData0317.coefficient20_185,
    output := OriginalRow227TriangleData0332.coefficient21_185, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_187, Icur := OriginalRow227TriangleData0317.coefficient20_186,
    output := OriginalRow227TriangleData0332.coefficient21_186, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_188, Icur := OriginalRow227TriangleData0317.coefficient20_187,
    output := OriginalRow227TriangleData0332.coefficient21_187, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_189, Icur := OriginalRow227TriangleData0317.coefficient20_188,
    output := OriginalRow227TriangleData0332.coefficient21_188, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_190, Icur := OriginalRow227TriangleData0317.coefficient20_189,
    output := OriginalRow227TriangleData0332.coefficient21_189, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_191, Icur := OriginalRow227TriangleData0317.coefficient20_190,
    output := OriginalRow227TriangleData0332.coefficient21_190, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_192, Icur := OriginalRow227TriangleData0317.coefficient20_191,
    output := OriginalRow227TriangleData0332.coefficient21_191, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_193, Icur := OriginalRow227TriangleData0317.coefficient20_192,
    output := OriginalRow227TriangleData0332.coefficient21_192, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_194, Icur := OriginalRow227TriangleData0317.coefficient20_193,
    output := OriginalRow227TriangleData0332.coefficient21_193, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_195, Icur := OriginalRow227TriangleData0317.coefficient20_194,
    output := OriginalRow227TriangleData0332.coefficient21_194, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_196, Icur := OriginalRow227TriangleData0317.coefficient20_195,
    output := OriginalRow227TriangleData0332.coefficient21_195, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_197, Icur := OriginalRow227TriangleData0317.coefficient20_196,
    output := OriginalRow227TriangleData0332.coefficient21_196, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_198, Icur := OriginalRow227TriangleData0317.coefficient20_197,
    output := OriginalRow227TriangleData0332.coefficient21_197, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_199, Icur := OriginalRow227TriangleData0317.coefficient20_198,
    output := OriginalRow227TriangleData0332.coefficient21_198, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_200, Icur := OriginalRow227TriangleData0317.coefficient20_199,
    output := OriginalRow227TriangleData0332.coefficient21_199, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_201, Icur := OriginalRow227TriangleData0317.coefficient20_200,
    output := OriginalRow227TriangleData0332.coefficient21_200, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_202, Icur := OriginalRow227TriangleData0317.coefficient20_201,
    output := OriginalRow227TriangleData0332.coefficient21_201, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_203, Icur := OriginalRow227TriangleData0317.coefficient20_202,
    output := OriginalRow227TriangleData0332.coefficient21_202, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_204, Icur := OriginalRow227TriangleData0317.coefficient20_203,
    output := OriginalRow227TriangleData0332.coefficient21_203, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_205, Icur := OriginalRow227TriangleData0317.coefficient20_204,
    output := OriginalRow227TriangleData0332.coefficient21_204, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_206, Icur := OriginalRow227TriangleData0317.coefficient20_205,
    output := OriginalRow227TriangleData0332.coefficient21_205, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_207, Icur := OriginalRow227TriangleData0317.coefficient20_206,
    output := OriginalRow227TriangleData0332.coefficient21_206, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_208, Icur := OriginalRow227TriangleData0317.coefficient20_207,
    output := OriginalRow227TriangleData0332.coefficient21_207, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_209, Icur := OriginalRow227TriangleData0317.coefficient20_208,
    output := OriginalRow227TriangleData0332.coefficient21_208, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_210, Icur := OriginalRow227TriangleData0317.coefficient20_209,
    output := OriginalRow227TriangleData0332.coefficient21_209, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_211, Icur := OriginalRow227TriangleData0317.coefficient20_210,
    output := OriginalRow227TriangleData0332.coefficient21_210, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_212, Icur := OriginalRow227TriangleData0318.coefficient20_211,
    output := OriginalRow227TriangleData0332.coefficient21_211, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0316

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0316.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
