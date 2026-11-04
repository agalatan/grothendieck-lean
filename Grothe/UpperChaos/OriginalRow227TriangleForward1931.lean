import Grothe.UpperChaos.OriginalRow227TriangleData1942
import Grothe.UpperChaos.OriginalRow227TriangleData1943
import Grothe.UpperChaos.OriginalRow227TriangleData1947
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1931
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_187, Icur := OriginalRow227TriangleData1942.coefficient186_186,
    output := OriginalRow227TriangleData1947.coefficient187_186, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_188, Icur := OriginalRow227TriangleData1942.coefficient186_187,
    output := OriginalRow227TriangleData1947.coefficient187_187, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_189, Icur := OriginalRow227TriangleData1942.coefficient186_188,
    output := OriginalRow227TriangleData1947.coefficient187_188, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_190, Icur := OriginalRow227TriangleData1942.coefficient186_189,
    output := OriginalRow227TriangleData1947.coefficient187_189, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_191, Icur := OriginalRow227TriangleData1942.coefficient186_190,
    output := OriginalRow227TriangleData1947.coefficient187_190, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_192, Icur := OriginalRow227TriangleData1942.coefficient186_191,
    output := OriginalRow227TriangleData1947.coefficient187_191, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_193, Icur := OriginalRow227TriangleData1942.coefficient186_192,
    output := OriginalRow227TriangleData1947.coefficient187_192, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_194, Icur := OriginalRow227TriangleData1942.coefficient186_193,
    output := OriginalRow227TriangleData1947.coefficient187_193, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_195, Icur := OriginalRow227TriangleData1942.coefficient186_194,
    output := OriginalRow227TriangleData1947.coefficient187_194, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_196, Icur := OriginalRow227TriangleData1942.coefficient186_195,
    output := OriginalRow227TriangleData1947.coefficient187_195, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_197, Icur := OriginalRow227TriangleData1942.coefficient186_196,
    output := OriginalRow227TriangleData1947.coefficient187_196, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_198, Icur := OriginalRow227TriangleData1942.coefficient186_197,
    output := OriginalRow227TriangleData1947.coefficient187_197, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_199, Icur := OriginalRow227TriangleData1942.coefficient186_198,
    output := OriginalRow227TriangleData1947.coefficient187_198, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_200, Icur := OriginalRow227TriangleData1942.coefficient186_199,
    output := OriginalRow227TriangleData1947.coefficient187_199, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_201, Icur := OriginalRow227TriangleData1942.coefficient186_200,
    output := OriginalRow227TriangleData1947.coefficient187_200, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_202, Icur := OriginalRow227TriangleData1942.coefficient186_201,
    output := OriginalRow227TriangleData1947.coefficient187_201, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_203, Icur := OriginalRow227TriangleData1942.coefficient186_202,
    output := OriginalRow227TriangleData1947.coefficient187_202, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_204, Icur := OriginalRow227TriangleData1942.coefficient186_203,
    output := OriginalRow227TriangleData1947.coefficient187_203, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_205, Icur := OriginalRow227TriangleData1942.coefficient186_204,
    output := OriginalRow227TriangleData1947.coefficient187_204, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_206, Icur := OriginalRow227TriangleData1942.coefficient186_205,
    output := OriginalRow227TriangleData1947.coefficient187_205, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_207, Icur := OriginalRow227TriangleData1942.coefficient186_206,
    output := OriginalRow227TriangleData1947.coefficient187_206, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_208, Icur := OriginalRow227TriangleData1942.coefficient186_207,
    output := OriginalRow227TriangleData1947.coefficient187_207, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_209, Icur := OriginalRow227TriangleData1942.coefficient186_208,
    output := OriginalRow227TriangleData1947.coefficient187_208, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_210, Icur := OriginalRow227TriangleData1942.coefficient186_209,
    output := OriginalRow227TriangleData1947.coefficient187_209, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_211, Icur := OriginalRow227TriangleData1942.coefficient186_210,
    output := OriginalRow227TriangleData1947.coefficient187_210, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_212, Icur := OriginalRow227TriangleData1942.coefficient186_211,
    output := OriginalRow227TriangleData1947.coefficient187_211, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_213, Icur := OriginalRow227TriangleData1942.coefficient186_212,
    output := OriginalRow227TriangleData1947.coefficient187_212, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_214, Icur := OriginalRow227TriangleData1942.coefficient186_213,
    output := OriginalRow227TriangleData1947.coefficient187_213, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_215, Icur := OriginalRow227TriangleData1942.coefficient186_214,
    output := OriginalRow227TriangleData1947.coefficient187_214, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1942.coefficient186_216, Icur := OriginalRow227TriangleData1942.coefficient186_215,
    output := OriginalRow227TriangleData1947.coefficient187_215, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1943.coefficient186_217, Icur := OriginalRow227TriangleData1942.coefficient186_216,
    output := OriginalRow227TriangleData1947.coefficient187_216, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1943.coefficient186_218, Icur := OriginalRow227TriangleData1943.coefficient186_217,
    output := OriginalRow227TriangleData1947.coefficient187_217, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1931

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1931.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
