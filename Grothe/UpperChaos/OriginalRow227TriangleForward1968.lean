import Grothe.UpperChaos.OriginalRow227TriangleData1980
import Grothe.UpperChaos.OriginalRow227TriangleData1981
import Grothe.UpperChaos.OriginalRow227TriangleData1984
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1968
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_196, Icur := OriginalRow227TriangleData1980.coefficient195_195,
    output := OriginalRow227TriangleData1984.coefficient196_195, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_197, Icur := OriginalRow227TriangleData1980.coefficient195_196,
    output := OriginalRow227TriangleData1984.coefficient196_196, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_198, Icur := OriginalRow227TriangleData1980.coefficient195_197,
    output := OriginalRow227TriangleData1984.coefficient196_197, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_199, Icur := OriginalRow227TriangleData1980.coefficient195_198,
    output := OriginalRow227TriangleData1984.coefficient196_198, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_200, Icur := OriginalRow227TriangleData1980.coefficient195_199,
    output := OriginalRow227TriangleData1984.coefficient196_199, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_201, Icur := OriginalRow227TriangleData1980.coefficient195_200,
    output := OriginalRow227TriangleData1984.coefficient196_200, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_202, Icur := OriginalRow227TriangleData1980.coefficient195_201,
    output := OriginalRow227TriangleData1984.coefficient196_201, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_203, Icur := OriginalRow227TriangleData1980.coefficient195_202,
    output := OriginalRow227TriangleData1984.coefficient196_202, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_204, Icur := OriginalRow227TriangleData1980.coefficient195_203,
    output := OriginalRow227TriangleData1984.coefficient196_203, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_205, Icur := OriginalRow227TriangleData1980.coefficient195_204,
    output := OriginalRow227TriangleData1984.coefficient196_204, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_206, Icur := OriginalRow227TriangleData1980.coefficient195_205,
    output := OriginalRow227TriangleData1984.coefficient196_205, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_207, Icur := OriginalRow227TriangleData1980.coefficient195_206,
    output := OriginalRow227TriangleData1984.coefficient196_206, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_208, Icur := OriginalRow227TriangleData1980.coefficient195_207,
    output := OriginalRow227TriangleData1984.coefficient196_207, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_209, Icur := OriginalRow227TriangleData1980.coefficient195_208,
    output := OriginalRow227TriangleData1984.coefficient196_208, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_210, Icur := OriginalRow227TriangleData1980.coefficient195_209,
    output := OriginalRow227TriangleData1984.coefficient196_209, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_211, Icur := OriginalRow227TriangleData1980.coefficient195_210,
    output := OriginalRow227TriangleData1984.coefficient196_210, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_212, Icur := OriginalRow227TriangleData1980.coefficient195_211,
    output := OriginalRow227TriangleData1984.coefficient196_211, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_213, Icur := OriginalRow227TriangleData1980.coefficient195_212,
    output := OriginalRow227TriangleData1984.coefficient196_212, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_214, Icur := OriginalRow227TriangleData1980.coefficient195_213,
    output := OriginalRow227TriangleData1984.coefficient196_213, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_215, Icur := OriginalRow227TriangleData1980.coefficient195_214,
    output := OriginalRow227TriangleData1984.coefficient196_214, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_216, Icur := OriginalRow227TriangleData1980.coefficient195_215,
    output := OriginalRow227TriangleData1984.coefficient196_215, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_217, Icur := OriginalRow227TriangleData1980.coefficient195_216,
    output := OriginalRow227TriangleData1984.coefficient196_216, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_218, Icur := OriginalRow227TriangleData1980.coefficient195_217,
    output := OriginalRow227TriangleData1984.coefficient196_217, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_219, Icur := OriginalRow227TriangleData1980.coefficient195_218,
    output := OriginalRow227TriangleData1984.coefficient196_218, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_220, Icur := OriginalRow227TriangleData1980.coefficient195_219,
    output := OriginalRow227TriangleData1984.coefficient196_219, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_221, Icur := OriginalRow227TriangleData1980.coefficient195_220,
    output := OriginalRow227TriangleData1984.coefficient196_220, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_222, Icur := OriginalRow227TriangleData1980.coefficient195_221,
    output := OriginalRow227TriangleData1984.coefficient196_221, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_223, Icur := OriginalRow227TriangleData1980.coefficient195_222,
    output := OriginalRow227TriangleData1984.coefficient196_222, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_224, Icur := OriginalRow227TriangleData1980.coefficient195_223,
    output := OriginalRow227TriangleData1984.coefficient196_223, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1980.coefficient195_225, Icur := OriginalRow227TriangleData1980.coefficient195_224,
    output := OriginalRow227TriangleData1984.coefficient196_224, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_226, Icur := OriginalRow227TriangleData1980.coefficient195_225,
    output := OriginalRow227TriangleData1984.coefficient196_225, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_227, Icur := OriginalRow227TriangleData1981.coefficient195_226,
    output := OriginalRow227TriangleData1984.coefficient196_226, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1968

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1968.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
