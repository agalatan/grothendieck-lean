import Grothe.UpperChaos.OriginalRow227TriangleData1385
import Grothe.UpperChaos.OriginalRow227TriangleData1386
import Grothe.UpperChaos.OriginalRow227TriangleData1395
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1379
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_204, Icur := OriginalRow227TriangleData1385.coefficient107_203,
    output := OriginalRow227TriangleData1395.coefficient108_203, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_205, Icur := OriginalRow227TriangleData1385.coefficient107_204,
    output := OriginalRow227TriangleData1395.coefficient108_204, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_206, Icur := OriginalRow227TriangleData1385.coefficient107_205,
    output := OriginalRow227TriangleData1395.coefficient108_205, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_207, Icur := OriginalRow227TriangleData1385.coefficient107_206,
    output := OriginalRow227TriangleData1395.coefficient108_206, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_208, Icur := OriginalRow227TriangleData1385.coefficient107_207,
    output := OriginalRow227TriangleData1395.coefficient108_207, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_209, Icur := OriginalRow227TriangleData1385.coefficient107_208,
    output := OriginalRow227TriangleData1395.coefficient108_208, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_210, Icur := OriginalRow227TriangleData1385.coefficient107_209,
    output := OriginalRow227TriangleData1395.coefficient108_209, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_211, Icur := OriginalRow227TriangleData1385.coefficient107_210,
    output := OriginalRow227TriangleData1395.coefficient108_210, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_212, Icur := OriginalRow227TriangleData1385.coefficient107_211,
    output := OriginalRow227TriangleData1395.coefficient108_211, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_213, Icur := OriginalRow227TriangleData1385.coefficient107_212,
    output := OriginalRow227TriangleData1395.coefficient108_212, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_214, Icur := OriginalRow227TriangleData1385.coefficient107_213,
    output := OriginalRow227TriangleData1395.coefficient108_213, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_215, Icur := OriginalRow227TriangleData1385.coefficient107_214,
    output := OriginalRow227TriangleData1395.coefficient108_214, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_216, Icur := OriginalRow227TriangleData1385.coefficient107_215,
    output := OriginalRow227TriangleData1395.coefficient108_215, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_217, Icur := OriginalRow227TriangleData1385.coefficient107_216,
    output := OriginalRow227TriangleData1395.coefficient108_216, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_218, Icur := OriginalRow227TriangleData1385.coefficient107_217,
    output := OriginalRow227TriangleData1395.coefficient108_217, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_219, Icur := OriginalRow227TriangleData1385.coefficient107_218,
    output := OriginalRow227TriangleData1395.coefficient108_218, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_220, Icur := OriginalRow227TriangleData1385.coefficient107_219,
    output := OriginalRow227TriangleData1395.coefficient108_219, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_221, Icur := OriginalRow227TriangleData1385.coefficient107_220,
    output := OriginalRow227TriangleData1395.coefficient108_220, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_222, Icur := OriginalRow227TriangleData1385.coefficient107_221,
    output := OriginalRow227TriangleData1395.coefficient108_221, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_223, Icur := OriginalRow227TriangleData1385.coefficient107_222,
    output := OriginalRow227TriangleData1395.coefficient108_222, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_224, Icur := OriginalRow227TriangleData1385.coefficient107_223,
    output := OriginalRow227TriangleData1395.coefficient108_223, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_225, Icur := OriginalRow227TriangleData1385.coefficient107_224,
    output := OriginalRow227TriangleData1395.coefficient108_224, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_226, Icur := OriginalRow227TriangleData1385.coefficient107_225,
    output := OriginalRow227TriangleData1395.coefficient108_225, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_227, Icur := OriginalRow227TriangleData1385.coefficient107_226,
    output := OriginalRow227TriangleData1395.coefficient108_226, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_228, Icur := OriginalRow227TriangleData1385.coefficient107_227,
    output := OriginalRow227TriangleData1395.coefficient108_227, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_229, Icur := OriginalRow227TriangleData1385.coefficient107_228,
    output := OriginalRow227TriangleData1395.coefficient108_228, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_230, Icur := OriginalRow227TriangleData1385.coefficient107_229,
    output := OriginalRow227TriangleData1395.coefficient108_229, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_231, Icur := OriginalRow227TriangleData1385.coefficient107_230,
    output := OriginalRow227TriangleData1395.coefficient108_230, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_232, Icur := OriginalRow227TriangleData1385.coefficient107_231,
    output := OriginalRow227TriangleData1395.coefficient108_231, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1385.coefficient107_233, Icur := OriginalRow227TriangleData1385.coefficient107_232,
    output := OriginalRow227TriangleData1395.coefficient108_232, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1386.coefficient107_234, Icur := OriginalRow227TriangleData1385.coefficient107_233,
    output := OriginalRow227TriangleData1395.coefficient108_233, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1386.coefficient107_235, Icur := OriginalRow227TriangleData1386.coefficient107_234,
    output := OriginalRow227TriangleData1395.coefficient108_234, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1379

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1379.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
