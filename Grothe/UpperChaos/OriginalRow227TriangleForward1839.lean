import Grothe.UpperChaos.OriginalRow227TriangleData1849
import Grothe.UpperChaos.OriginalRow227TriangleData1850
import Grothe.UpperChaos.OriginalRow227TriangleData1855
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1839
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_201, Icur := OriginalRow227TriangleData1849.coefficient168_200,
    output := OriginalRow227TriangleData1855.coefficient169_200, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_202, Icur := OriginalRow227TriangleData1849.coefficient168_201,
    output := OriginalRow227TriangleData1855.coefficient169_201, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_203, Icur := OriginalRow227TriangleData1849.coefficient168_202,
    output := OriginalRow227TriangleData1855.coefficient169_202, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_204, Icur := OriginalRow227TriangleData1849.coefficient168_203,
    output := OriginalRow227TriangleData1855.coefficient169_203, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_205, Icur := OriginalRow227TriangleData1849.coefficient168_204,
    output := OriginalRow227TriangleData1855.coefficient169_204, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_206, Icur := OriginalRow227TriangleData1849.coefficient168_205,
    output := OriginalRow227TriangleData1855.coefficient169_205, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_207, Icur := OriginalRow227TriangleData1849.coefficient168_206,
    output := OriginalRow227TriangleData1855.coefficient169_206, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_208, Icur := OriginalRow227TriangleData1849.coefficient168_207,
    output := OriginalRow227TriangleData1855.coefficient169_207, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_209, Icur := OriginalRow227TriangleData1849.coefficient168_208,
    output := OriginalRow227TriangleData1855.coefficient169_208, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_210, Icur := OriginalRow227TriangleData1849.coefficient168_209,
    output := OriginalRow227TriangleData1855.coefficient169_209, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_211, Icur := OriginalRow227TriangleData1849.coefficient168_210,
    output := OriginalRow227TriangleData1855.coefficient169_210, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_212, Icur := OriginalRow227TriangleData1849.coefficient168_211,
    output := OriginalRow227TriangleData1855.coefficient169_211, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_213, Icur := OriginalRow227TriangleData1849.coefficient168_212,
    output := OriginalRow227TriangleData1855.coefficient169_212, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_214, Icur := OriginalRow227TriangleData1849.coefficient168_213,
    output := OriginalRow227TriangleData1855.coefficient169_213, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_215, Icur := OriginalRow227TriangleData1849.coefficient168_214,
    output := OriginalRow227TriangleData1855.coefficient169_214, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_216, Icur := OriginalRow227TriangleData1849.coefficient168_215,
    output := OriginalRow227TriangleData1855.coefficient169_215, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_217, Icur := OriginalRow227TriangleData1849.coefficient168_216,
    output := OriginalRow227TriangleData1855.coefficient169_216, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_218, Icur := OriginalRow227TriangleData1849.coefficient168_217,
    output := OriginalRow227TriangleData1855.coefficient169_217, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_219, Icur := OriginalRow227TriangleData1849.coefficient168_218,
    output := OriginalRow227TriangleData1855.coefficient169_218, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_220, Icur := OriginalRow227TriangleData1849.coefficient168_219,
    output := OriginalRow227TriangleData1855.coefficient169_219, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_221, Icur := OriginalRow227TriangleData1849.coefficient168_220,
    output := OriginalRow227TriangleData1855.coefficient169_220, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_222, Icur := OriginalRow227TriangleData1849.coefficient168_221,
    output := OriginalRow227TriangleData1855.coefficient169_221, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_223, Icur := OriginalRow227TriangleData1849.coefficient168_222,
    output := OriginalRow227TriangleData1855.coefficient169_222, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_224, Icur := OriginalRow227TriangleData1849.coefficient168_223,
    output := OriginalRow227TriangleData1855.coefficient169_223, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_225, Icur := OriginalRow227TriangleData1849.coefficient168_224,
    output := OriginalRow227TriangleData1855.coefficient169_224, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_226, Icur := OriginalRow227TriangleData1849.coefficient168_225,
    output := OriginalRow227TriangleData1855.coefficient169_225, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_227, Icur := OriginalRow227TriangleData1849.coefficient168_226,
    output := OriginalRow227TriangleData1855.coefficient169_226, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_228, Icur := OriginalRow227TriangleData1849.coefficient168_227,
    output := OriginalRow227TriangleData1855.coefficient169_227, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_229, Icur := OriginalRow227TriangleData1849.coefficient168_228,
    output := OriginalRow227TriangleData1855.coefficient169_228, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1849.coefficient168_230, Icur := OriginalRow227TriangleData1849.coefficient168_229,
    output := OriginalRow227TriangleData1855.coefficient169_229, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1850.coefficient168_231, Icur := OriginalRow227TriangleData1849.coefficient168_230,
    output := OriginalRow227TriangleData1855.coefficient169_230, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root169,
    Inext := OriginalRow227TriangleData1850.coefficient168_232, Icur := OriginalRow227TriangleData1850.coefficient168_231,
    output := OriginalRow227TriangleData1855.coefficient169_231, hC := OriginalRow227TriangleRoots05.root169_pos, hAC := OriginalRow227TriangleRoots05.product169_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1839

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1839.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
