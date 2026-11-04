import Grothe.UpperChaos.OriginalRow227TriangleData1578
import Grothe.UpperChaos.OriginalRow227TriangleData1579
import Grothe.UpperChaos.OriginalRow227TriangleData1586
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1570
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_194, Icur := OriginalRow227TriangleData1578.coefficient129_193,
    output := OriginalRow227TriangleData1586.coefficient130_193, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_195, Icur := OriginalRow227TriangleData1578.coefficient129_194,
    output := OriginalRow227TriangleData1586.coefficient130_194, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_196, Icur := OriginalRow227TriangleData1578.coefficient129_195,
    output := OriginalRow227TriangleData1586.coefficient130_195, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_197, Icur := OriginalRow227TriangleData1578.coefficient129_196,
    output := OriginalRow227TriangleData1586.coefficient130_196, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_198, Icur := OriginalRow227TriangleData1578.coefficient129_197,
    output := OriginalRow227TriangleData1586.coefficient130_197, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_199, Icur := OriginalRow227TriangleData1578.coefficient129_198,
    output := OriginalRow227TriangleData1586.coefficient130_198, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_200, Icur := OriginalRow227TriangleData1578.coefficient129_199,
    output := OriginalRow227TriangleData1586.coefficient130_199, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_201, Icur := OriginalRow227TriangleData1578.coefficient129_200,
    output := OriginalRow227TriangleData1586.coefficient130_200, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_202, Icur := OriginalRow227TriangleData1578.coefficient129_201,
    output := OriginalRow227TriangleData1586.coefficient130_201, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_203, Icur := OriginalRow227TriangleData1578.coefficient129_202,
    output := OriginalRow227TriangleData1586.coefficient130_202, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_204, Icur := OriginalRow227TriangleData1578.coefficient129_203,
    output := OriginalRow227TriangleData1586.coefficient130_203, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_205, Icur := OriginalRow227TriangleData1578.coefficient129_204,
    output := OriginalRow227TriangleData1586.coefficient130_204, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_206, Icur := OriginalRow227TriangleData1578.coefficient129_205,
    output := OriginalRow227TriangleData1586.coefficient130_205, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_207, Icur := OriginalRow227TriangleData1578.coefficient129_206,
    output := OriginalRow227TriangleData1586.coefficient130_206, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_208, Icur := OriginalRow227TriangleData1578.coefficient129_207,
    output := OriginalRow227TriangleData1586.coefficient130_207, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_209, Icur := OriginalRow227TriangleData1578.coefficient129_208,
    output := OriginalRow227TriangleData1586.coefficient130_208, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_210, Icur := OriginalRow227TriangleData1578.coefficient129_209,
    output := OriginalRow227TriangleData1586.coefficient130_209, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_211, Icur := OriginalRow227TriangleData1578.coefficient129_210,
    output := OriginalRow227TriangleData1586.coefficient130_210, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_212, Icur := OriginalRow227TriangleData1578.coefficient129_211,
    output := OriginalRow227TriangleData1586.coefficient130_211, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_213, Icur := OriginalRow227TriangleData1578.coefficient129_212,
    output := OriginalRow227TriangleData1586.coefficient130_212, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_214, Icur := OriginalRow227TriangleData1578.coefficient129_213,
    output := OriginalRow227TriangleData1586.coefficient130_213, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_215, Icur := OriginalRow227TriangleData1578.coefficient129_214,
    output := OriginalRow227TriangleData1586.coefficient130_214, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_216, Icur := OriginalRow227TriangleData1578.coefficient129_215,
    output := OriginalRow227TriangleData1586.coefficient130_215, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_217, Icur := OriginalRow227TriangleData1578.coefficient129_216,
    output := OriginalRow227TriangleData1586.coefficient130_216, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_218, Icur := OriginalRow227TriangleData1578.coefficient129_217,
    output := OriginalRow227TriangleData1586.coefficient130_217, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_219, Icur := OriginalRow227TriangleData1578.coefficient129_218,
    output := OriginalRow227TriangleData1586.coefficient130_218, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_220, Icur := OriginalRow227TriangleData1578.coefficient129_219,
    output := OriginalRow227TriangleData1586.coefficient130_219, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_221, Icur := OriginalRow227TriangleData1578.coefficient129_220,
    output := OriginalRow227TriangleData1586.coefficient130_220, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_222, Icur := OriginalRow227TriangleData1578.coefficient129_221,
    output := OriginalRow227TriangleData1586.coefficient130_221, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1578.coefficient129_223, Icur := OriginalRow227TriangleData1578.coefficient129_222,
    output := OriginalRow227TriangleData1586.coefficient130_222, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_224, Icur := OriginalRow227TriangleData1578.coefficient129_223,
    output := OriginalRow227TriangleData1586.coefficient130_223, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_225, Icur := OriginalRow227TriangleData1579.coefficient129_224,
    output := OriginalRow227TriangleData1586.coefficient130_224, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1570

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1570.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
