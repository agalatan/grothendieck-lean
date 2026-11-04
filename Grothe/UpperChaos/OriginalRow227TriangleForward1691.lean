import Grothe.UpperChaos.OriginalRow227TriangleData1700
import Grothe.UpperChaos.OriginalRow227TriangleData1701
import Grothe.UpperChaos.OriginalRow227TriangleData1707
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1691
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_178, Icur := OriginalRow227TriangleData1700.coefficient145_177,
    output := OriginalRow227TriangleData1707.coefficient146_177, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_179, Icur := OriginalRow227TriangleData1700.coefficient145_178,
    output := OriginalRow227TriangleData1707.coefficient146_178, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_180, Icur := OriginalRow227TriangleData1700.coefficient145_179,
    output := OriginalRow227TriangleData1707.coefficient146_179, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_181, Icur := OriginalRow227TriangleData1700.coefficient145_180,
    output := OriginalRow227TriangleData1707.coefficient146_180, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_182, Icur := OriginalRow227TriangleData1700.coefficient145_181,
    output := OriginalRow227TriangleData1707.coefficient146_181, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_183, Icur := OriginalRow227TriangleData1700.coefficient145_182,
    output := OriginalRow227TriangleData1707.coefficient146_182, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_184, Icur := OriginalRow227TriangleData1700.coefficient145_183,
    output := OriginalRow227TriangleData1707.coefficient146_183, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_185, Icur := OriginalRow227TriangleData1700.coefficient145_184,
    output := OriginalRow227TriangleData1707.coefficient146_184, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_186, Icur := OriginalRow227TriangleData1700.coefficient145_185,
    output := OriginalRow227TriangleData1707.coefficient146_185, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_187, Icur := OriginalRow227TriangleData1700.coefficient145_186,
    output := OriginalRow227TriangleData1707.coefficient146_186, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_188, Icur := OriginalRow227TriangleData1700.coefficient145_187,
    output := OriginalRow227TriangleData1707.coefficient146_187, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_189, Icur := OriginalRow227TriangleData1700.coefficient145_188,
    output := OriginalRow227TriangleData1707.coefficient146_188, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_190, Icur := OriginalRow227TriangleData1700.coefficient145_189,
    output := OriginalRow227TriangleData1707.coefficient146_189, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_191, Icur := OriginalRow227TriangleData1700.coefficient145_190,
    output := OriginalRow227TriangleData1707.coefficient146_190, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_192, Icur := OriginalRow227TriangleData1700.coefficient145_191,
    output := OriginalRow227TriangleData1707.coefficient146_191, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_193, Icur := OriginalRow227TriangleData1700.coefficient145_192,
    output := OriginalRow227TriangleData1707.coefficient146_192, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_194, Icur := OriginalRow227TriangleData1700.coefficient145_193,
    output := OriginalRow227TriangleData1707.coefficient146_193, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_195, Icur := OriginalRow227TriangleData1700.coefficient145_194,
    output := OriginalRow227TriangleData1707.coefficient146_194, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_196, Icur := OriginalRow227TriangleData1700.coefficient145_195,
    output := OriginalRow227TriangleData1707.coefficient146_195, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_197, Icur := OriginalRow227TriangleData1700.coefficient145_196,
    output := OriginalRow227TriangleData1707.coefficient146_196, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_198, Icur := OriginalRow227TriangleData1700.coefficient145_197,
    output := OriginalRow227TriangleData1707.coefficient146_197, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_199, Icur := OriginalRow227TriangleData1700.coefficient145_198,
    output := OriginalRow227TriangleData1707.coefficient146_198, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_200, Icur := OriginalRow227TriangleData1700.coefficient145_199,
    output := OriginalRow227TriangleData1707.coefficient146_199, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_201, Icur := OriginalRow227TriangleData1700.coefficient145_200,
    output := OriginalRow227TriangleData1707.coefficient146_200, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_202, Icur := OriginalRow227TriangleData1700.coefficient145_201,
    output := OriginalRow227TriangleData1707.coefficient146_201, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_203, Icur := OriginalRow227TriangleData1700.coefficient145_202,
    output := OriginalRow227TriangleData1707.coefficient146_202, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_204, Icur := OriginalRow227TriangleData1700.coefficient145_203,
    output := OriginalRow227TriangleData1707.coefficient146_203, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_205, Icur := OriginalRow227TriangleData1700.coefficient145_204,
    output := OriginalRow227TriangleData1707.coefficient146_204, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_206, Icur := OriginalRow227TriangleData1700.coefficient145_205,
    output := OriginalRow227TriangleData1707.coefficient146_205, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1700.coefficient145_207, Icur := OriginalRow227TriangleData1700.coefficient145_206,
    output := OriginalRow227TriangleData1707.coefficient146_206, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1701.coefficient145_208, Icur := OriginalRow227TriangleData1700.coefficient145_207,
    output := OriginalRow227TriangleData1707.coefficient146_207, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1701.coefficient145_209, Icur := OriginalRow227TriangleData1701.coefficient145_208,
    output := OriginalRow227TriangleData1707.coefficient146_208, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1691

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1691.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
