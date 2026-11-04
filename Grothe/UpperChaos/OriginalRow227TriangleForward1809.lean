import Grothe.UpperChaos.OriginalRow227TriangleData1819
import Grothe.UpperChaos.OriginalRow227TriangleData1820
import Grothe.UpperChaos.OriginalRow227TriangleData1825
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1809
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_196, Icur := OriginalRow227TriangleData1819.coefficient163_195,
    output := OriginalRow227TriangleData1825.coefficient164_195, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_197, Icur := OriginalRow227TriangleData1819.coefficient163_196,
    output := OriginalRow227TriangleData1825.coefficient164_196, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_198, Icur := OriginalRow227TriangleData1819.coefficient163_197,
    output := OriginalRow227TriangleData1825.coefficient164_197, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_199, Icur := OriginalRow227TriangleData1819.coefficient163_198,
    output := OriginalRow227TriangleData1825.coefficient164_198, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_200, Icur := OriginalRow227TriangleData1819.coefficient163_199,
    output := OriginalRow227TriangleData1825.coefficient164_199, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_201, Icur := OriginalRow227TriangleData1819.coefficient163_200,
    output := OriginalRow227TriangleData1825.coefficient164_200, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_202, Icur := OriginalRow227TriangleData1819.coefficient163_201,
    output := OriginalRow227TriangleData1825.coefficient164_201, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_203, Icur := OriginalRow227TriangleData1819.coefficient163_202,
    output := OriginalRow227TriangleData1825.coefficient164_202, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_204, Icur := OriginalRow227TriangleData1819.coefficient163_203,
    output := OriginalRow227TriangleData1825.coefficient164_203, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_205, Icur := OriginalRow227TriangleData1819.coefficient163_204,
    output := OriginalRow227TriangleData1825.coefficient164_204, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_206, Icur := OriginalRow227TriangleData1819.coefficient163_205,
    output := OriginalRow227TriangleData1825.coefficient164_205, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_207, Icur := OriginalRow227TriangleData1819.coefficient163_206,
    output := OriginalRow227TriangleData1825.coefficient164_206, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_208, Icur := OriginalRow227TriangleData1819.coefficient163_207,
    output := OriginalRow227TriangleData1825.coefficient164_207, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_209, Icur := OriginalRow227TriangleData1819.coefficient163_208,
    output := OriginalRow227TriangleData1825.coefficient164_208, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_210, Icur := OriginalRow227TriangleData1819.coefficient163_209,
    output := OriginalRow227TriangleData1825.coefficient164_209, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_211, Icur := OriginalRow227TriangleData1819.coefficient163_210,
    output := OriginalRow227TriangleData1825.coefficient164_210, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_212, Icur := OriginalRow227TriangleData1819.coefficient163_211,
    output := OriginalRow227TriangleData1825.coefficient164_211, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_213, Icur := OriginalRow227TriangleData1819.coefficient163_212,
    output := OriginalRow227TriangleData1825.coefficient164_212, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_214, Icur := OriginalRow227TriangleData1819.coefficient163_213,
    output := OriginalRow227TriangleData1825.coefficient164_213, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_215, Icur := OriginalRow227TriangleData1819.coefficient163_214,
    output := OriginalRow227TriangleData1825.coefficient164_214, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_216, Icur := OriginalRow227TriangleData1819.coefficient163_215,
    output := OriginalRow227TriangleData1825.coefficient164_215, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_217, Icur := OriginalRow227TriangleData1819.coefficient163_216,
    output := OriginalRow227TriangleData1825.coefficient164_216, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_218, Icur := OriginalRow227TriangleData1819.coefficient163_217,
    output := OriginalRow227TriangleData1825.coefficient164_217, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_219, Icur := OriginalRow227TriangleData1819.coefficient163_218,
    output := OriginalRow227TriangleData1825.coefficient164_218, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_220, Icur := OriginalRow227TriangleData1819.coefficient163_219,
    output := OriginalRow227TriangleData1825.coefficient164_219, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_221, Icur := OriginalRow227TriangleData1819.coefficient163_220,
    output := OriginalRow227TriangleData1825.coefficient164_220, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_222, Icur := OriginalRow227TriangleData1819.coefficient163_221,
    output := OriginalRow227TriangleData1825.coefficient164_221, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_223, Icur := OriginalRow227TriangleData1819.coefficient163_222,
    output := OriginalRow227TriangleData1825.coefficient164_222, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_224, Icur := OriginalRow227TriangleData1819.coefficient163_223,
    output := OriginalRow227TriangleData1825.coefficient164_223, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_225, Icur := OriginalRow227TriangleData1819.coefficient163_224,
    output := OriginalRow227TriangleData1825.coefficient164_224, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1820.coefficient163_226, Icur := OriginalRow227TriangleData1819.coefficient163_225,
    output := OriginalRow227TriangleData1825.coefficient164_225, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1820.coefficient163_227, Icur := OriginalRow227TriangleData1820.coefficient163_226,
    output := OriginalRow227TriangleData1825.coefficient164_226, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1809

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1809.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
