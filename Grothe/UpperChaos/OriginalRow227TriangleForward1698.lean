import Grothe.UpperChaos.OriginalRow227TriangleData1707
import Grothe.UpperChaos.OriginalRow227TriangleData1708
import Grothe.UpperChaos.OriginalRow227TriangleData1714
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1698
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_179, Icur := OriginalRow227TriangleData1707.coefficient146_178,
    output := OriginalRow227TriangleData1714.coefficient147_178, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_180, Icur := OriginalRow227TriangleData1707.coefficient146_179,
    output := OriginalRow227TriangleData1714.coefficient147_179, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_181, Icur := OriginalRow227TriangleData1707.coefficient146_180,
    output := OriginalRow227TriangleData1714.coefficient147_180, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_182, Icur := OriginalRow227TriangleData1707.coefficient146_181,
    output := OriginalRow227TriangleData1714.coefficient147_181, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_183, Icur := OriginalRow227TriangleData1707.coefficient146_182,
    output := OriginalRow227TriangleData1714.coefficient147_182, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_184, Icur := OriginalRow227TriangleData1707.coefficient146_183,
    output := OriginalRow227TriangleData1714.coefficient147_183, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_185, Icur := OriginalRow227TriangleData1707.coefficient146_184,
    output := OriginalRow227TriangleData1714.coefficient147_184, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_186, Icur := OriginalRow227TriangleData1707.coefficient146_185,
    output := OriginalRow227TriangleData1714.coefficient147_185, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_187, Icur := OriginalRow227TriangleData1707.coefficient146_186,
    output := OriginalRow227TriangleData1714.coefficient147_186, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_188, Icur := OriginalRow227TriangleData1707.coefficient146_187,
    output := OriginalRow227TriangleData1714.coefficient147_187, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_189, Icur := OriginalRow227TriangleData1707.coefficient146_188,
    output := OriginalRow227TriangleData1714.coefficient147_188, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_190, Icur := OriginalRow227TriangleData1707.coefficient146_189,
    output := OriginalRow227TriangleData1714.coefficient147_189, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_191, Icur := OriginalRow227TriangleData1707.coefficient146_190,
    output := OriginalRow227TriangleData1714.coefficient147_190, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_192, Icur := OriginalRow227TriangleData1707.coefficient146_191,
    output := OriginalRow227TriangleData1714.coefficient147_191, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_193, Icur := OriginalRow227TriangleData1707.coefficient146_192,
    output := OriginalRow227TriangleData1714.coefficient147_192, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_194, Icur := OriginalRow227TriangleData1707.coefficient146_193,
    output := OriginalRow227TriangleData1714.coefficient147_193, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_195, Icur := OriginalRow227TriangleData1707.coefficient146_194,
    output := OriginalRow227TriangleData1714.coefficient147_194, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_196, Icur := OriginalRow227TriangleData1707.coefficient146_195,
    output := OriginalRow227TriangleData1714.coefficient147_195, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_197, Icur := OriginalRow227TriangleData1707.coefficient146_196,
    output := OriginalRow227TriangleData1714.coefficient147_196, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_198, Icur := OriginalRow227TriangleData1707.coefficient146_197,
    output := OriginalRow227TriangleData1714.coefficient147_197, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_199, Icur := OriginalRow227TriangleData1707.coefficient146_198,
    output := OriginalRow227TriangleData1714.coefficient147_198, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_200, Icur := OriginalRow227TriangleData1707.coefficient146_199,
    output := OriginalRow227TriangleData1714.coefficient147_199, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_201, Icur := OriginalRow227TriangleData1707.coefficient146_200,
    output := OriginalRow227TriangleData1714.coefficient147_200, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_202, Icur := OriginalRow227TriangleData1707.coefficient146_201,
    output := OriginalRow227TriangleData1714.coefficient147_201, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_203, Icur := OriginalRow227TriangleData1707.coefficient146_202,
    output := OriginalRow227TriangleData1714.coefficient147_202, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_204, Icur := OriginalRow227TriangleData1707.coefficient146_203,
    output := OriginalRow227TriangleData1714.coefficient147_203, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_205, Icur := OriginalRow227TriangleData1707.coefficient146_204,
    output := OriginalRow227TriangleData1714.coefficient147_204, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_206, Icur := OriginalRow227TriangleData1707.coefficient146_205,
    output := OriginalRow227TriangleData1714.coefficient147_205, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_207, Icur := OriginalRow227TriangleData1707.coefficient146_206,
    output := OriginalRow227TriangleData1714.coefficient147_206, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_208, Icur := OriginalRow227TriangleData1707.coefficient146_207,
    output := OriginalRow227TriangleData1714.coefficient147_207, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1708.coefficient146_209, Icur := OriginalRow227TriangleData1707.coefficient146_208,
    output := OriginalRow227TriangleData1714.coefficient147_208, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1708.coefficient146_210, Icur := OriginalRow227TriangleData1708.coefficient146_209,
    output := OriginalRow227TriangleData1714.coefficient147_209, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1698

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1698.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
