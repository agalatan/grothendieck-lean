import Grothe.UpperChaos.OriginalRow227TriangleData1335
import Grothe.UpperChaos.OriginalRow227TriangleData1336
import Grothe.UpperChaos.OriginalRow227TriangleData1345
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1329
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_199, Icur := OriginalRow227TriangleData1335.coefficient102_198,
    output := OriginalRow227TriangleData1345.coefficient103_198, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_200, Icur := OriginalRow227TriangleData1335.coefficient102_199,
    output := OriginalRow227TriangleData1345.coefficient103_199, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_201, Icur := OriginalRow227TriangleData1335.coefficient102_200,
    output := OriginalRow227TriangleData1345.coefficient103_200, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_202, Icur := OriginalRow227TriangleData1335.coefficient102_201,
    output := OriginalRow227TriangleData1345.coefficient103_201, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_203, Icur := OriginalRow227TriangleData1335.coefficient102_202,
    output := OriginalRow227TriangleData1345.coefficient103_202, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_204, Icur := OriginalRow227TriangleData1335.coefficient102_203,
    output := OriginalRow227TriangleData1345.coefficient103_203, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_205, Icur := OriginalRow227TriangleData1335.coefficient102_204,
    output := OriginalRow227TriangleData1345.coefficient103_204, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_206, Icur := OriginalRow227TriangleData1335.coefficient102_205,
    output := OriginalRow227TriangleData1345.coefficient103_205, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_207, Icur := OriginalRow227TriangleData1335.coefficient102_206,
    output := OriginalRow227TriangleData1345.coefficient103_206, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_208, Icur := OriginalRow227TriangleData1335.coefficient102_207,
    output := OriginalRow227TriangleData1345.coefficient103_207, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_209, Icur := OriginalRow227TriangleData1335.coefficient102_208,
    output := OriginalRow227TriangleData1345.coefficient103_208, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_210, Icur := OriginalRow227TriangleData1335.coefficient102_209,
    output := OriginalRow227TriangleData1345.coefficient103_209, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_211, Icur := OriginalRow227TriangleData1335.coefficient102_210,
    output := OriginalRow227TriangleData1345.coefficient103_210, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_212, Icur := OriginalRow227TriangleData1335.coefficient102_211,
    output := OriginalRow227TriangleData1345.coefficient103_211, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_213, Icur := OriginalRow227TriangleData1335.coefficient102_212,
    output := OriginalRow227TriangleData1345.coefficient103_212, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_214, Icur := OriginalRow227TriangleData1335.coefficient102_213,
    output := OriginalRow227TriangleData1345.coefficient103_213, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_215, Icur := OriginalRow227TriangleData1335.coefficient102_214,
    output := OriginalRow227TriangleData1345.coefficient103_214, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_216, Icur := OriginalRow227TriangleData1335.coefficient102_215,
    output := OriginalRow227TriangleData1345.coefficient103_215, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_217, Icur := OriginalRow227TriangleData1335.coefficient102_216,
    output := OriginalRow227TriangleData1345.coefficient103_216, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_218, Icur := OriginalRow227TriangleData1335.coefficient102_217,
    output := OriginalRow227TriangleData1345.coefficient103_217, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_219, Icur := OriginalRow227TriangleData1335.coefficient102_218,
    output := OriginalRow227TriangleData1345.coefficient103_218, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_220, Icur := OriginalRow227TriangleData1335.coefficient102_219,
    output := OriginalRow227TriangleData1345.coefficient103_219, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_221, Icur := OriginalRow227TriangleData1335.coefficient102_220,
    output := OriginalRow227TriangleData1345.coefficient103_220, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_222, Icur := OriginalRow227TriangleData1335.coefficient102_221,
    output := OriginalRow227TriangleData1345.coefficient103_221, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_223, Icur := OriginalRow227TriangleData1335.coefficient102_222,
    output := OriginalRow227TriangleData1345.coefficient103_222, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_224, Icur := OriginalRow227TriangleData1335.coefficient102_223,
    output := OriginalRow227TriangleData1345.coefficient103_223, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_225, Icur := OriginalRow227TriangleData1335.coefficient102_224,
    output := OriginalRow227TriangleData1345.coefficient103_224, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_226, Icur := OriginalRow227TriangleData1335.coefficient102_225,
    output := OriginalRow227TriangleData1345.coefficient103_225, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_227, Icur := OriginalRow227TriangleData1335.coefficient102_226,
    output := OriginalRow227TriangleData1345.coefficient103_226, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1335.coefficient102_228, Icur := OriginalRow227TriangleData1335.coefficient102_227,
    output := OriginalRow227TriangleData1345.coefficient103_227, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1336.coefficient102_229, Icur := OriginalRow227TriangleData1335.coefficient102_228,
    output := OriginalRow227TriangleData1345.coefficient103_228, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1336.coefficient102_230, Icur := OriginalRow227TriangleData1336.coefficient102_229,
    output := OriginalRow227TriangleData1345.coefficient103_229, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1329

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1329.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
