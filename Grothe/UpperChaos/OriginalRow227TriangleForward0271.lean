import Grothe.UpperChaos.OriginalRow227TriangleData0272
import Grothe.UpperChaos.OriginalRow227TriangleData0273
import Grothe.UpperChaos.OriginalRow227TriangleData0287
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0271
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_178, Icur := OriginalRow227TriangleData0272.coefficient17_177,
    output := OriginalRow227TriangleData0287.coefficient18_177, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_179, Icur := OriginalRow227TriangleData0272.coefficient17_178,
    output := OriginalRow227TriangleData0287.coefficient18_178, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_180, Icur := OriginalRow227TriangleData0272.coefficient17_179,
    output := OriginalRow227TriangleData0287.coefficient18_179, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_181, Icur := OriginalRow227TriangleData0272.coefficient17_180,
    output := OriginalRow227TriangleData0287.coefficient18_180, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_182, Icur := OriginalRow227TriangleData0272.coefficient17_181,
    output := OriginalRow227TriangleData0287.coefficient18_181, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_183, Icur := OriginalRow227TriangleData0272.coefficient17_182,
    output := OriginalRow227TriangleData0287.coefficient18_182, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_184, Icur := OriginalRow227TriangleData0272.coefficient17_183,
    output := OriginalRow227TriangleData0287.coefficient18_183, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_185, Icur := OriginalRow227TriangleData0272.coefficient17_184,
    output := OriginalRow227TriangleData0287.coefficient18_184, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_186, Icur := OriginalRow227TriangleData0272.coefficient17_185,
    output := OriginalRow227TriangleData0287.coefficient18_185, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_187, Icur := OriginalRow227TriangleData0272.coefficient17_186,
    output := OriginalRow227TriangleData0287.coefficient18_186, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_188, Icur := OriginalRow227TriangleData0272.coefficient17_187,
    output := OriginalRow227TriangleData0287.coefficient18_187, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_189, Icur := OriginalRow227TriangleData0272.coefficient17_188,
    output := OriginalRow227TriangleData0287.coefficient18_188, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_190, Icur := OriginalRow227TriangleData0272.coefficient17_189,
    output := OriginalRow227TriangleData0287.coefficient18_189, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_191, Icur := OriginalRow227TriangleData0272.coefficient17_190,
    output := OriginalRow227TriangleData0287.coefficient18_190, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_192, Icur := OriginalRow227TriangleData0272.coefficient17_191,
    output := OriginalRow227TriangleData0287.coefficient18_191, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_193, Icur := OriginalRow227TriangleData0272.coefficient17_192,
    output := OriginalRow227TriangleData0287.coefficient18_192, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_194, Icur := OriginalRow227TriangleData0272.coefficient17_193,
    output := OriginalRow227TriangleData0287.coefficient18_193, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_195, Icur := OriginalRow227TriangleData0272.coefficient17_194,
    output := OriginalRow227TriangleData0287.coefficient18_194, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_196, Icur := OriginalRow227TriangleData0272.coefficient17_195,
    output := OriginalRow227TriangleData0287.coefficient18_195, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_197, Icur := OriginalRow227TriangleData0272.coefficient17_196,
    output := OriginalRow227TriangleData0287.coefficient18_196, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_198, Icur := OriginalRow227TriangleData0272.coefficient17_197,
    output := OriginalRow227TriangleData0287.coefficient18_197, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_199, Icur := OriginalRow227TriangleData0272.coefficient17_198,
    output := OriginalRow227TriangleData0287.coefficient18_198, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_200, Icur := OriginalRow227TriangleData0272.coefficient17_199,
    output := OriginalRow227TriangleData0287.coefficient18_199, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_201, Icur := OriginalRow227TriangleData0272.coefficient17_200,
    output := OriginalRow227TriangleData0287.coefficient18_200, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_202, Icur := OriginalRow227TriangleData0272.coefficient17_201,
    output := OriginalRow227TriangleData0287.coefficient18_201, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_203, Icur := OriginalRow227TriangleData0272.coefficient17_202,
    output := OriginalRow227TriangleData0287.coefficient18_202, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_204, Icur := OriginalRow227TriangleData0272.coefficient17_203,
    output := OriginalRow227TriangleData0287.coefficient18_203, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_205, Icur := OriginalRow227TriangleData0272.coefficient17_204,
    output := OriginalRow227TriangleData0287.coefficient18_204, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_206, Icur := OriginalRow227TriangleData0272.coefficient17_205,
    output := OriginalRow227TriangleData0287.coefficient18_205, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_207, Icur := OriginalRow227TriangleData0272.coefficient17_206,
    output := OriginalRow227TriangleData0287.coefficient18_206, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0273.coefficient17_208, Icur := OriginalRow227TriangleData0272.coefficient17_207,
    output := OriginalRow227TriangleData0287.coefficient18_207, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0273.coefficient17_209, Icur := OriginalRow227TriangleData0273.coefficient17_208,
    output := OriginalRow227TriangleData0287.coefficient18_208, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0271

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0271.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
