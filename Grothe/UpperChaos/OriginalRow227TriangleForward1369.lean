import Grothe.UpperChaos.OriginalRow227TriangleData1375
import Grothe.UpperChaos.OriginalRow227TriangleData1376
import Grothe.UpperChaos.OriginalRow227TriangleData1385
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1369
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_203, Icur := OriginalRow227TriangleData1375.coefficient106_202,
    output := OriginalRow227TriangleData1385.coefficient107_202, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_204, Icur := OriginalRow227TriangleData1375.coefficient106_203,
    output := OriginalRow227TriangleData1385.coefficient107_203, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_205, Icur := OriginalRow227TriangleData1375.coefficient106_204,
    output := OriginalRow227TriangleData1385.coefficient107_204, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_206, Icur := OriginalRow227TriangleData1375.coefficient106_205,
    output := OriginalRow227TriangleData1385.coefficient107_205, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_207, Icur := OriginalRow227TriangleData1375.coefficient106_206,
    output := OriginalRow227TriangleData1385.coefficient107_206, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_208, Icur := OriginalRow227TriangleData1375.coefficient106_207,
    output := OriginalRow227TriangleData1385.coefficient107_207, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_209, Icur := OriginalRow227TriangleData1375.coefficient106_208,
    output := OriginalRow227TriangleData1385.coefficient107_208, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_210, Icur := OriginalRow227TriangleData1375.coefficient106_209,
    output := OriginalRow227TriangleData1385.coefficient107_209, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_211, Icur := OriginalRow227TriangleData1375.coefficient106_210,
    output := OriginalRow227TriangleData1385.coefficient107_210, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_212, Icur := OriginalRow227TriangleData1375.coefficient106_211,
    output := OriginalRow227TriangleData1385.coefficient107_211, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_213, Icur := OriginalRow227TriangleData1375.coefficient106_212,
    output := OriginalRow227TriangleData1385.coefficient107_212, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_214, Icur := OriginalRow227TriangleData1375.coefficient106_213,
    output := OriginalRow227TriangleData1385.coefficient107_213, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_215, Icur := OriginalRow227TriangleData1375.coefficient106_214,
    output := OriginalRow227TriangleData1385.coefficient107_214, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_216, Icur := OriginalRow227TriangleData1375.coefficient106_215,
    output := OriginalRow227TriangleData1385.coefficient107_215, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_217, Icur := OriginalRow227TriangleData1375.coefficient106_216,
    output := OriginalRow227TriangleData1385.coefficient107_216, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_218, Icur := OriginalRow227TriangleData1375.coefficient106_217,
    output := OriginalRow227TriangleData1385.coefficient107_217, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_219, Icur := OriginalRow227TriangleData1375.coefficient106_218,
    output := OriginalRow227TriangleData1385.coefficient107_218, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_220, Icur := OriginalRow227TriangleData1375.coefficient106_219,
    output := OriginalRow227TriangleData1385.coefficient107_219, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_221, Icur := OriginalRow227TriangleData1375.coefficient106_220,
    output := OriginalRow227TriangleData1385.coefficient107_220, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_222, Icur := OriginalRow227TriangleData1375.coefficient106_221,
    output := OriginalRow227TriangleData1385.coefficient107_221, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_223, Icur := OriginalRow227TriangleData1375.coefficient106_222,
    output := OriginalRow227TriangleData1385.coefficient107_222, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_224, Icur := OriginalRow227TriangleData1375.coefficient106_223,
    output := OriginalRow227TriangleData1385.coefficient107_223, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_225, Icur := OriginalRow227TriangleData1375.coefficient106_224,
    output := OriginalRow227TriangleData1385.coefficient107_224, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_226, Icur := OriginalRow227TriangleData1375.coefficient106_225,
    output := OriginalRow227TriangleData1385.coefficient107_225, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_227, Icur := OriginalRow227TriangleData1375.coefficient106_226,
    output := OriginalRow227TriangleData1385.coefficient107_226, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_228, Icur := OriginalRow227TriangleData1375.coefficient106_227,
    output := OriginalRow227TriangleData1385.coefficient107_227, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_229, Icur := OriginalRow227TriangleData1375.coefficient106_228,
    output := OriginalRow227TriangleData1385.coefficient107_228, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_230, Icur := OriginalRow227TriangleData1375.coefficient106_229,
    output := OriginalRow227TriangleData1385.coefficient107_229, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_231, Icur := OriginalRow227TriangleData1375.coefficient106_230,
    output := OriginalRow227TriangleData1385.coefficient107_230, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_232, Icur := OriginalRow227TriangleData1375.coefficient106_231,
    output := OriginalRow227TriangleData1385.coefficient107_231, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1376.coefficient106_233, Icur := OriginalRow227TriangleData1375.coefficient106_232,
    output := OriginalRow227TriangleData1385.coefficient107_232, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1376.coefficient106_234, Icur := OriginalRow227TriangleData1376.coefficient106_233,
    output := OriginalRow227TriangleData1385.coefficient107_233, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1369

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1369.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
