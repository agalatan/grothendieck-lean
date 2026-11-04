import Grothe.UpperChaos.OriginalRow227TriangleData1964
import Grothe.UpperChaos.OriginalRow227TriangleData1965
import Grothe.UpperChaos.OriginalRow227TriangleData1968
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1952
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_192, Icur := OriginalRow227TriangleData1964.coefficient191_191,
    output := OriginalRow227TriangleData1968.coefficient192_191, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_193, Icur := OriginalRow227TriangleData1964.coefficient191_192,
    output := OriginalRow227TriangleData1968.coefficient192_192, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_194, Icur := OriginalRow227TriangleData1964.coefficient191_193,
    output := OriginalRow227TriangleData1968.coefficient192_193, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_195, Icur := OriginalRow227TriangleData1964.coefficient191_194,
    output := OriginalRow227TriangleData1968.coefficient192_194, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_196, Icur := OriginalRow227TriangleData1964.coefficient191_195,
    output := OriginalRow227TriangleData1968.coefficient192_195, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_197, Icur := OriginalRow227TriangleData1964.coefficient191_196,
    output := OriginalRow227TriangleData1968.coefficient192_196, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_198, Icur := OriginalRow227TriangleData1964.coefficient191_197,
    output := OriginalRow227TriangleData1968.coefficient192_197, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_199, Icur := OriginalRow227TriangleData1964.coefficient191_198,
    output := OriginalRow227TriangleData1968.coefficient192_198, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_200, Icur := OriginalRow227TriangleData1964.coefficient191_199,
    output := OriginalRow227TriangleData1968.coefficient192_199, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_201, Icur := OriginalRow227TriangleData1964.coefficient191_200,
    output := OriginalRow227TriangleData1968.coefficient192_200, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_202, Icur := OriginalRow227TriangleData1964.coefficient191_201,
    output := OriginalRow227TriangleData1968.coefficient192_201, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_203, Icur := OriginalRow227TriangleData1964.coefficient191_202,
    output := OriginalRow227TriangleData1968.coefficient192_202, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_204, Icur := OriginalRow227TriangleData1964.coefficient191_203,
    output := OriginalRow227TriangleData1968.coefficient192_203, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_205, Icur := OriginalRow227TriangleData1964.coefficient191_204,
    output := OriginalRow227TriangleData1968.coefficient192_204, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_206, Icur := OriginalRow227TriangleData1964.coefficient191_205,
    output := OriginalRow227TriangleData1968.coefficient192_205, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_207, Icur := OriginalRow227TriangleData1964.coefficient191_206,
    output := OriginalRow227TriangleData1968.coefficient192_206, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_208, Icur := OriginalRow227TriangleData1964.coefficient191_207,
    output := OriginalRow227TriangleData1968.coefficient192_207, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_209, Icur := OriginalRow227TriangleData1964.coefficient191_208,
    output := OriginalRow227TriangleData1968.coefficient192_208, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_210, Icur := OriginalRow227TriangleData1964.coefficient191_209,
    output := OriginalRow227TriangleData1968.coefficient192_209, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_211, Icur := OriginalRow227TriangleData1964.coefficient191_210,
    output := OriginalRow227TriangleData1968.coefficient192_210, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_212, Icur := OriginalRow227TriangleData1964.coefficient191_211,
    output := OriginalRow227TriangleData1968.coefficient192_211, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_213, Icur := OriginalRow227TriangleData1964.coefficient191_212,
    output := OriginalRow227TriangleData1968.coefficient192_212, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_214, Icur := OriginalRow227TriangleData1964.coefficient191_213,
    output := OriginalRow227TriangleData1968.coefficient192_213, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_215, Icur := OriginalRow227TriangleData1964.coefficient191_214,
    output := OriginalRow227TriangleData1968.coefficient192_214, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_216, Icur := OriginalRow227TriangleData1964.coefficient191_215,
    output := OriginalRow227TriangleData1968.coefficient192_215, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_217, Icur := OriginalRow227TriangleData1964.coefficient191_216,
    output := OriginalRow227TriangleData1968.coefficient192_216, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_218, Icur := OriginalRow227TriangleData1964.coefficient191_217,
    output := OriginalRow227TriangleData1968.coefficient192_217, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_219, Icur := OriginalRow227TriangleData1964.coefficient191_218,
    output := OriginalRow227TriangleData1968.coefficient192_218, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_220, Icur := OriginalRow227TriangleData1964.coefficient191_219,
    output := OriginalRow227TriangleData1968.coefficient192_219, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1964.coefficient191_221, Icur := OriginalRow227TriangleData1964.coefficient191_220,
    output := OriginalRow227TriangleData1968.coefficient192_220, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_222, Icur := OriginalRow227TriangleData1964.coefficient191_221,
    output := OriginalRow227TriangleData1968.coefficient192_221, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_223, Icur := OriginalRow227TriangleData1965.coefficient191_222,
    output := OriginalRow227TriangleData1968.coefficient192_222, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1952

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1952.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
