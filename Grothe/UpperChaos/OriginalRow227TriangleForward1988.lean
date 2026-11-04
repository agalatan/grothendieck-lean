import Grothe.UpperChaos.OriginalRow227TriangleData2000
import Grothe.UpperChaos.OriginalRow227TriangleData2001
import Grothe.UpperChaos.OriginalRow227TriangleData2004
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1988
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_201, Icur := OriginalRow227TriangleData2000.coefficient200_200,
    output := OriginalRow227TriangleData2004.coefficient201_200, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_202, Icur := OriginalRow227TriangleData2000.coefficient200_201,
    output := OriginalRow227TriangleData2004.coefficient201_201, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_203, Icur := OriginalRow227TriangleData2000.coefficient200_202,
    output := OriginalRow227TriangleData2004.coefficient201_202, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_204, Icur := OriginalRow227TriangleData2000.coefficient200_203,
    output := OriginalRow227TriangleData2004.coefficient201_203, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_205, Icur := OriginalRow227TriangleData2000.coefficient200_204,
    output := OriginalRow227TriangleData2004.coefficient201_204, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_206, Icur := OriginalRow227TriangleData2000.coefficient200_205,
    output := OriginalRow227TriangleData2004.coefficient201_205, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_207, Icur := OriginalRow227TriangleData2000.coefficient200_206,
    output := OriginalRow227TriangleData2004.coefficient201_206, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_208, Icur := OriginalRow227TriangleData2000.coefficient200_207,
    output := OriginalRow227TriangleData2004.coefficient201_207, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_209, Icur := OriginalRow227TriangleData2000.coefficient200_208,
    output := OriginalRow227TriangleData2004.coefficient201_208, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_210, Icur := OriginalRow227TriangleData2000.coefficient200_209,
    output := OriginalRow227TriangleData2004.coefficient201_209, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_211, Icur := OriginalRow227TriangleData2000.coefficient200_210,
    output := OriginalRow227TriangleData2004.coefficient201_210, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_212, Icur := OriginalRow227TriangleData2000.coefficient200_211,
    output := OriginalRow227TriangleData2004.coefficient201_211, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_213, Icur := OriginalRow227TriangleData2000.coefficient200_212,
    output := OriginalRow227TriangleData2004.coefficient201_212, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_214, Icur := OriginalRow227TriangleData2000.coefficient200_213,
    output := OriginalRow227TriangleData2004.coefficient201_213, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_215, Icur := OriginalRow227TriangleData2000.coefficient200_214,
    output := OriginalRow227TriangleData2004.coefficient201_214, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_216, Icur := OriginalRow227TriangleData2000.coefficient200_215,
    output := OriginalRow227TriangleData2004.coefficient201_215, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_217, Icur := OriginalRow227TriangleData2000.coefficient200_216,
    output := OriginalRow227TriangleData2004.coefficient201_216, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_218, Icur := OriginalRow227TriangleData2000.coefficient200_217,
    output := OriginalRow227TriangleData2004.coefficient201_217, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_219, Icur := OriginalRow227TriangleData2000.coefficient200_218,
    output := OriginalRow227TriangleData2004.coefficient201_218, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_220, Icur := OriginalRow227TriangleData2000.coefficient200_219,
    output := OriginalRow227TriangleData2004.coefficient201_219, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_221, Icur := OriginalRow227TriangleData2000.coefficient200_220,
    output := OriginalRow227TriangleData2004.coefficient201_220, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_222, Icur := OriginalRow227TriangleData2000.coefficient200_221,
    output := OriginalRow227TriangleData2004.coefficient201_221, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_223, Icur := OriginalRow227TriangleData2000.coefficient200_222,
    output := OriginalRow227TriangleData2004.coefficient201_222, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_224, Icur := OriginalRow227TriangleData2000.coefficient200_223,
    output := OriginalRow227TriangleData2004.coefficient201_223, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_225, Icur := OriginalRow227TriangleData2000.coefficient200_224,
    output := OriginalRow227TriangleData2004.coefficient201_224, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_226, Icur := OriginalRow227TriangleData2000.coefficient200_225,
    output := OriginalRow227TriangleData2004.coefficient201_225, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_227, Icur := OriginalRow227TriangleData2000.coefficient200_226,
    output := OriginalRow227TriangleData2004.coefficient201_226, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_228, Icur := OriginalRow227TriangleData2000.coefficient200_227,
    output := OriginalRow227TriangleData2004.coefficient201_227, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_229, Icur := OriginalRow227TriangleData2000.coefficient200_228,
    output := OriginalRow227TriangleData2004.coefficient201_228, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2000.coefficient200_230, Icur := OriginalRow227TriangleData2000.coefficient200_229,
    output := OriginalRow227TriangleData2004.coefficient201_229, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2001.coefficient200_231, Icur := OriginalRow227TriangleData2000.coefficient200_230,
    output := OriginalRow227TriangleData2004.coefficient201_230, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root201,
    Inext := OriginalRow227TriangleData2001.coefficient200_232, Icur := OriginalRow227TriangleData2001.coefficient200_231,
    output := OriginalRow227TriangleData2004.coefficient201_231, hC := OriginalRow227TriangleRoots06.root201_pos, hAC := OriginalRow227TriangleRoots06.product201_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1988

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1988.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
