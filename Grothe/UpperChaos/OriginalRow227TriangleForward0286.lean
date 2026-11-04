import Grothe.UpperChaos.OriginalRow227TriangleData0287
import Grothe.UpperChaos.OriginalRow227TriangleData0288
import Grothe.UpperChaos.OriginalRow227TriangleData0302
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0286
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_179, Icur := OriginalRow227TriangleData0287.coefficient18_178,
    output := OriginalRow227TriangleData0302.coefficient19_178, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_180, Icur := OriginalRow227TriangleData0287.coefficient18_179,
    output := OriginalRow227TriangleData0302.coefficient19_179, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_181, Icur := OriginalRow227TriangleData0287.coefficient18_180,
    output := OriginalRow227TriangleData0302.coefficient19_180, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_182, Icur := OriginalRow227TriangleData0287.coefficient18_181,
    output := OriginalRow227TriangleData0302.coefficient19_181, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_183, Icur := OriginalRow227TriangleData0287.coefficient18_182,
    output := OriginalRow227TriangleData0302.coefficient19_182, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_184, Icur := OriginalRow227TriangleData0287.coefficient18_183,
    output := OriginalRow227TriangleData0302.coefficient19_183, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_185, Icur := OriginalRow227TriangleData0287.coefficient18_184,
    output := OriginalRow227TriangleData0302.coefficient19_184, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_186, Icur := OriginalRow227TriangleData0287.coefficient18_185,
    output := OriginalRow227TriangleData0302.coefficient19_185, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_187, Icur := OriginalRow227TriangleData0287.coefficient18_186,
    output := OriginalRow227TriangleData0302.coefficient19_186, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_188, Icur := OriginalRow227TriangleData0287.coefficient18_187,
    output := OriginalRow227TriangleData0302.coefficient19_187, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_189, Icur := OriginalRow227TriangleData0287.coefficient18_188,
    output := OriginalRow227TriangleData0302.coefficient19_188, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_190, Icur := OriginalRow227TriangleData0287.coefficient18_189,
    output := OriginalRow227TriangleData0302.coefficient19_189, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_191, Icur := OriginalRow227TriangleData0287.coefficient18_190,
    output := OriginalRow227TriangleData0302.coefficient19_190, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_192, Icur := OriginalRow227TriangleData0287.coefficient18_191,
    output := OriginalRow227TriangleData0302.coefficient19_191, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_193, Icur := OriginalRow227TriangleData0287.coefficient18_192,
    output := OriginalRow227TriangleData0302.coefficient19_192, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_194, Icur := OriginalRow227TriangleData0287.coefficient18_193,
    output := OriginalRow227TriangleData0302.coefficient19_193, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_195, Icur := OriginalRow227TriangleData0287.coefficient18_194,
    output := OriginalRow227TriangleData0302.coefficient19_194, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_196, Icur := OriginalRow227TriangleData0287.coefficient18_195,
    output := OriginalRow227TriangleData0302.coefficient19_195, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_197, Icur := OriginalRow227TriangleData0287.coefficient18_196,
    output := OriginalRow227TriangleData0302.coefficient19_196, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_198, Icur := OriginalRow227TriangleData0287.coefficient18_197,
    output := OriginalRow227TriangleData0302.coefficient19_197, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_199, Icur := OriginalRow227TriangleData0287.coefficient18_198,
    output := OriginalRow227TriangleData0302.coefficient19_198, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_200, Icur := OriginalRow227TriangleData0287.coefficient18_199,
    output := OriginalRow227TriangleData0302.coefficient19_199, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_201, Icur := OriginalRow227TriangleData0287.coefficient18_200,
    output := OriginalRow227TriangleData0302.coefficient19_200, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_202, Icur := OriginalRow227TriangleData0287.coefficient18_201,
    output := OriginalRow227TriangleData0302.coefficient19_201, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_203, Icur := OriginalRow227TriangleData0287.coefficient18_202,
    output := OriginalRow227TriangleData0302.coefficient19_202, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_204, Icur := OriginalRow227TriangleData0287.coefficient18_203,
    output := OriginalRow227TriangleData0302.coefficient19_203, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_205, Icur := OriginalRow227TriangleData0287.coefficient18_204,
    output := OriginalRow227TriangleData0302.coefficient19_204, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_206, Icur := OriginalRow227TriangleData0287.coefficient18_205,
    output := OriginalRow227TriangleData0302.coefficient19_205, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_207, Icur := OriginalRow227TriangleData0287.coefficient18_206,
    output := OriginalRow227TriangleData0302.coefficient19_206, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0287.coefficient18_208, Icur := OriginalRow227TriangleData0287.coefficient18_207,
    output := OriginalRow227TriangleData0302.coefficient19_207, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0288.coefficient18_209, Icur := OriginalRow227TriangleData0287.coefficient18_208,
    output := OriginalRow227TriangleData0302.coefficient19_208, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0288.coefficient18_210, Icur := OriginalRow227TriangleData0288.coefficient18_209,
    output := OriginalRow227TriangleData0302.coefficient19_209, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0286

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0286.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
