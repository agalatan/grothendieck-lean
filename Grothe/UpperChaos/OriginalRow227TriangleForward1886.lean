import Grothe.UpperChaos.OriginalRow227TriangleData1897
import Grothe.UpperChaos.OriginalRow227TriangleData1898
import Grothe.UpperChaos.OriginalRow227TriangleData1902
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1886
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_178, Icur := OriginalRow227TriangleData1897.coefficient177_177,
    output := OriginalRow227TriangleData1902.coefficient178_177, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_179, Icur := OriginalRow227TriangleData1897.coefficient177_178,
    output := OriginalRow227TriangleData1902.coefficient178_178, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_180, Icur := OriginalRow227TriangleData1897.coefficient177_179,
    output := OriginalRow227TriangleData1902.coefficient178_179, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_181, Icur := OriginalRow227TriangleData1897.coefficient177_180,
    output := OriginalRow227TriangleData1902.coefficient178_180, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_182, Icur := OriginalRow227TriangleData1897.coefficient177_181,
    output := OriginalRow227TriangleData1902.coefficient178_181, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_183, Icur := OriginalRow227TriangleData1897.coefficient177_182,
    output := OriginalRow227TriangleData1902.coefficient178_182, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_184, Icur := OriginalRow227TriangleData1897.coefficient177_183,
    output := OriginalRow227TriangleData1902.coefficient178_183, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_185, Icur := OriginalRow227TriangleData1897.coefficient177_184,
    output := OriginalRow227TriangleData1902.coefficient178_184, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_186, Icur := OriginalRow227TriangleData1897.coefficient177_185,
    output := OriginalRow227TriangleData1902.coefficient178_185, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_187, Icur := OriginalRow227TriangleData1897.coefficient177_186,
    output := OriginalRow227TriangleData1902.coefficient178_186, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_188, Icur := OriginalRow227TriangleData1897.coefficient177_187,
    output := OriginalRow227TriangleData1902.coefficient178_187, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_189, Icur := OriginalRow227TriangleData1897.coefficient177_188,
    output := OriginalRow227TriangleData1902.coefficient178_188, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_190, Icur := OriginalRow227TriangleData1897.coefficient177_189,
    output := OriginalRow227TriangleData1902.coefficient178_189, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_191, Icur := OriginalRow227TriangleData1897.coefficient177_190,
    output := OriginalRow227TriangleData1902.coefficient178_190, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_192, Icur := OriginalRow227TriangleData1897.coefficient177_191,
    output := OriginalRow227TriangleData1902.coefficient178_191, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_193, Icur := OriginalRow227TriangleData1897.coefficient177_192,
    output := OriginalRow227TriangleData1902.coefficient178_192, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_194, Icur := OriginalRow227TriangleData1897.coefficient177_193,
    output := OriginalRow227TriangleData1902.coefficient178_193, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_195, Icur := OriginalRow227TriangleData1897.coefficient177_194,
    output := OriginalRow227TriangleData1902.coefficient178_194, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_196, Icur := OriginalRow227TriangleData1897.coefficient177_195,
    output := OriginalRow227TriangleData1902.coefficient178_195, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_197, Icur := OriginalRow227TriangleData1897.coefficient177_196,
    output := OriginalRow227TriangleData1902.coefficient178_196, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_198, Icur := OriginalRow227TriangleData1897.coefficient177_197,
    output := OriginalRow227TriangleData1902.coefficient178_197, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_199, Icur := OriginalRow227TriangleData1897.coefficient177_198,
    output := OriginalRow227TriangleData1902.coefficient178_198, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_200, Icur := OriginalRow227TriangleData1897.coefficient177_199,
    output := OriginalRow227TriangleData1902.coefficient178_199, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_201, Icur := OriginalRow227TriangleData1897.coefficient177_200,
    output := OriginalRow227TriangleData1902.coefficient178_200, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_202, Icur := OriginalRow227TriangleData1897.coefficient177_201,
    output := OriginalRow227TriangleData1902.coefficient178_201, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_203, Icur := OriginalRow227TriangleData1897.coefficient177_202,
    output := OriginalRow227TriangleData1902.coefficient178_202, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_204, Icur := OriginalRow227TriangleData1897.coefficient177_203,
    output := OriginalRow227TriangleData1902.coefficient178_203, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_205, Icur := OriginalRow227TriangleData1897.coefficient177_204,
    output := OriginalRow227TriangleData1902.coefficient178_204, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_206, Icur := OriginalRow227TriangleData1897.coefficient177_205,
    output := OriginalRow227TriangleData1902.coefficient178_205, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1897.coefficient177_207, Icur := OriginalRow227TriangleData1897.coefficient177_206,
    output := OriginalRow227TriangleData1902.coefficient178_206, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1898.coefficient177_208, Icur := OriginalRow227TriangleData1897.coefficient177_207,
    output := OriginalRow227TriangleData1902.coefficient178_207, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1898.coefficient177_209, Icur := OriginalRow227TriangleData1898.coefficient177_208,
    output := OriginalRow227TriangleData1902.coefficient178_208, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1886

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1886.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
