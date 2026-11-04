import Grothe.UpperChaos.OriginalRow227TriangleData1807
import Grothe.UpperChaos.OriginalRow227TriangleData1808
import Grothe.UpperChaos.OriginalRow227TriangleData1813
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1797
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_194, Icur := OriginalRow227TriangleData1807.coefficient161_193,
    output := OriginalRow227TriangleData1813.coefficient162_193, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_195, Icur := OriginalRow227TriangleData1807.coefficient161_194,
    output := OriginalRow227TriangleData1813.coefficient162_194, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_196, Icur := OriginalRow227TriangleData1807.coefficient161_195,
    output := OriginalRow227TriangleData1813.coefficient162_195, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_197, Icur := OriginalRow227TriangleData1807.coefficient161_196,
    output := OriginalRow227TriangleData1813.coefficient162_196, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_198, Icur := OriginalRow227TriangleData1807.coefficient161_197,
    output := OriginalRow227TriangleData1813.coefficient162_197, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_199, Icur := OriginalRow227TriangleData1807.coefficient161_198,
    output := OriginalRow227TriangleData1813.coefficient162_198, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_200, Icur := OriginalRow227TriangleData1807.coefficient161_199,
    output := OriginalRow227TriangleData1813.coefficient162_199, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_201, Icur := OriginalRow227TriangleData1807.coefficient161_200,
    output := OriginalRow227TriangleData1813.coefficient162_200, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_202, Icur := OriginalRow227TriangleData1807.coefficient161_201,
    output := OriginalRow227TriangleData1813.coefficient162_201, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_203, Icur := OriginalRow227TriangleData1807.coefficient161_202,
    output := OriginalRow227TriangleData1813.coefficient162_202, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_204, Icur := OriginalRow227TriangleData1807.coefficient161_203,
    output := OriginalRow227TriangleData1813.coefficient162_203, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_205, Icur := OriginalRow227TriangleData1807.coefficient161_204,
    output := OriginalRow227TriangleData1813.coefficient162_204, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_206, Icur := OriginalRow227TriangleData1807.coefficient161_205,
    output := OriginalRow227TriangleData1813.coefficient162_205, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_207, Icur := OriginalRow227TriangleData1807.coefficient161_206,
    output := OriginalRow227TriangleData1813.coefficient162_206, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_208, Icur := OriginalRow227TriangleData1807.coefficient161_207,
    output := OriginalRow227TriangleData1813.coefficient162_207, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_209, Icur := OriginalRow227TriangleData1807.coefficient161_208,
    output := OriginalRow227TriangleData1813.coefficient162_208, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_210, Icur := OriginalRow227TriangleData1807.coefficient161_209,
    output := OriginalRow227TriangleData1813.coefficient162_209, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_211, Icur := OriginalRow227TriangleData1807.coefficient161_210,
    output := OriginalRow227TriangleData1813.coefficient162_210, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_212, Icur := OriginalRow227TriangleData1807.coefficient161_211,
    output := OriginalRow227TriangleData1813.coefficient162_211, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_213, Icur := OriginalRow227TriangleData1807.coefficient161_212,
    output := OriginalRow227TriangleData1813.coefficient162_212, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_214, Icur := OriginalRow227TriangleData1807.coefficient161_213,
    output := OriginalRow227TriangleData1813.coefficient162_213, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_215, Icur := OriginalRow227TriangleData1807.coefficient161_214,
    output := OriginalRow227TriangleData1813.coefficient162_214, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_216, Icur := OriginalRow227TriangleData1807.coefficient161_215,
    output := OriginalRow227TriangleData1813.coefficient162_215, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_217, Icur := OriginalRow227TriangleData1807.coefficient161_216,
    output := OriginalRow227TriangleData1813.coefficient162_216, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_218, Icur := OriginalRow227TriangleData1807.coefficient161_217,
    output := OriginalRow227TriangleData1813.coefficient162_217, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_219, Icur := OriginalRow227TriangleData1807.coefficient161_218,
    output := OriginalRow227TriangleData1813.coefficient162_218, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_220, Icur := OriginalRow227TriangleData1807.coefficient161_219,
    output := OriginalRow227TriangleData1813.coefficient162_219, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_221, Icur := OriginalRow227TriangleData1807.coefficient161_220,
    output := OriginalRow227TriangleData1813.coefficient162_220, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_222, Icur := OriginalRow227TriangleData1807.coefficient161_221,
    output := OriginalRow227TriangleData1813.coefficient162_221, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1807.coefficient161_223, Icur := OriginalRow227TriangleData1807.coefficient161_222,
    output := OriginalRow227TriangleData1813.coefficient162_222, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1808.coefficient161_224, Icur := OriginalRow227TriangleData1807.coefficient161_223,
    output := OriginalRow227TriangleData1813.coefficient162_223, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1808.coefficient161_225, Icur := OriginalRow227TriangleData1808.coefficient161_224,
    output := OriginalRow227TriangleData1813.coefficient162_224, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1797

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1797.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
