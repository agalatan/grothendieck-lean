import Grothe.UpperChaos.OriginalRow227TriangleData1972
import Grothe.UpperChaos.OriginalRow227TriangleData1973
import Grothe.UpperChaos.OriginalRow227TriangleData1976
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1960
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_194, Icur := OriginalRow227TriangleData1972.coefficient193_193,
    output := OriginalRow227TriangleData1976.coefficient194_193, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_195, Icur := OriginalRow227TriangleData1972.coefficient193_194,
    output := OriginalRow227TriangleData1976.coefficient194_194, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_196, Icur := OriginalRow227TriangleData1972.coefficient193_195,
    output := OriginalRow227TriangleData1976.coefficient194_195, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_197, Icur := OriginalRow227TriangleData1972.coefficient193_196,
    output := OriginalRow227TriangleData1976.coefficient194_196, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_198, Icur := OriginalRow227TriangleData1972.coefficient193_197,
    output := OriginalRow227TriangleData1976.coefficient194_197, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_199, Icur := OriginalRow227TriangleData1972.coefficient193_198,
    output := OriginalRow227TriangleData1976.coefficient194_198, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_200, Icur := OriginalRow227TriangleData1972.coefficient193_199,
    output := OriginalRow227TriangleData1976.coefficient194_199, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_201, Icur := OriginalRow227TriangleData1972.coefficient193_200,
    output := OriginalRow227TriangleData1976.coefficient194_200, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_202, Icur := OriginalRow227TriangleData1972.coefficient193_201,
    output := OriginalRow227TriangleData1976.coefficient194_201, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_203, Icur := OriginalRow227TriangleData1972.coefficient193_202,
    output := OriginalRow227TriangleData1976.coefficient194_202, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_204, Icur := OriginalRow227TriangleData1972.coefficient193_203,
    output := OriginalRow227TriangleData1976.coefficient194_203, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_205, Icur := OriginalRow227TriangleData1972.coefficient193_204,
    output := OriginalRow227TriangleData1976.coefficient194_204, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_206, Icur := OriginalRow227TriangleData1972.coefficient193_205,
    output := OriginalRow227TriangleData1976.coefficient194_205, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_207, Icur := OriginalRow227TriangleData1972.coefficient193_206,
    output := OriginalRow227TriangleData1976.coefficient194_206, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_208, Icur := OriginalRow227TriangleData1972.coefficient193_207,
    output := OriginalRow227TriangleData1976.coefficient194_207, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_209, Icur := OriginalRow227TriangleData1972.coefficient193_208,
    output := OriginalRow227TriangleData1976.coefficient194_208, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_210, Icur := OriginalRow227TriangleData1972.coefficient193_209,
    output := OriginalRow227TriangleData1976.coefficient194_209, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_211, Icur := OriginalRow227TriangleData1972.coefficient193_210,
    output := OriginalRow227TriangleData1976.coefficient194_210, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_212, Icur := OriginalRow227TriangleData1972.coefficient193_211,
    output := OriginalRow227TriangleData1976.coefficient194_211, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_213, Icur := OriginalRow227TriangleData1972.coefficient193_212,
    output := OriginalRow227TriangleData1976.coefficient194_212, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_214, Icur := OriginalRow227TriangleData1972.coefficient193_213,
    output := OriginalRow227TriangleData1976.coefficient194_213, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_215, Icur := OriginalRow227TriangleData1972.coefficient193_214,
    output := OriginalRow227TriangleData1976.coefficient194_214, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_216, Icur := OriginalRow227TriangleData1972.coefficient193_215,
    output := OriginalRow227TriangleData1976.coefficient194_215, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_217, Icur := OriginalRow227TriangleData1972.coefficient193_216,
    output := OriginalRow227TriangleData1976.coefficient194_216, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_218, Icur := OriginalRow227TriangleData1972.coefficient193_217,
    output := OriginalRow227TriangleData1976.coefficient194_217, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_219, Icur := OriginalRow227TriangleData1972.coefficient193_218,
    output := OriginalRow227TriangleData1976.coefficient194_218, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_220, Icur := OriginalRow227TriangleData1972.coefficient193_219,
    output := OriginalRow227TriangleData1976.coefficient194_219, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_221, Icur := OriginalRow227TriangleData1972.coefficient193_220,
    output := OriginalRow227TriangleData1976.coefficient194_220, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_222, Icur := OriginalRow227TriangleData1972.coefficient193_221,
    output := OriginalRow227TriangleData1976.coefficient194_221, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1972.coefficient193_223, Icur := OriginalRow227TriangleData1972.coefficient193_222,
    output := OriginalRow227TriangleData1976.coefficient194_222, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1973.coefficient193_224, Icur := OriginalRow227TriangleData1972.coefficient193_223,
    output := OriginalRow227TriangleData1976.coefficient194_223, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1973.coefficient193_225, Icur := OriginalRow227TriangleData1973.coefficient193_224,
    output := OriginalRow227TriangleData1976.coefficient194_224, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1960

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1960.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
