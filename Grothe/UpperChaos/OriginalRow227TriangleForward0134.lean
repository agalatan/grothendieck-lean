import Grothe.UpperChaos.OriginalRow227TriangleData0134
import Grothe.UpperChaos.OriginalRow227TriangleData0135
import Grothe.UpperChaos.OriginalRow227TriangleData0150
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0134
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_201, Icur := OriginalRow227TriangleData0134.coefficient8_200,
    output := OriginalRow227TriangleData0150.coefficient9_200, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_202, Icur := OriginalRow227TriangleData0134.coefficient8_201,
    output := OriginalRow227TriangleData0150.coefficient9_201, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_203, Icur := OriginalRow227TriangleData0134.coefficient8_202,
    output := OriginalRow227TriangleData0150.coefficient9_202, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_204, Icur := OriginalRow227TriangleData0134.coefficient8_203,
    output := OriginalRow227TriangleData0150.coefficient9_203, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_205, Icur := OriginalRow227TriangleData0134.coefficient8_204,
    output := OriginalRow227TriangleData0150.coefficient9_204, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_206, Icur := OriginalRow227TriangleData0134.coefficient8_205,
    output := OriginalRow227TriangleData0150.coefficient9_205, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_207, Icur := OriginalRow227TriangleData0134.coefficient8_206,
    output := OriginalRow227TriangleData0150.coefficient9_206, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_208, Icur := OriginalRow227TriangleData0134.coefficient8_207,
    output := OriginalRow227TriangleData0150.coefficient9_207, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_209, Icur := OriginalRow227TriangleData0134.coefficient8_208,
    output := OriginalRow227TriangleData0150.coefficient9_208, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_210, Icur := OriginalRow227TriangleData0134.coefficient8_209,
    output := OriginalRow227TriangleData0150.coefficient9_209, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_211, Icur := OriginalRow227TriangleData0134.coefficient8_210,
    output := OriginalRow227TriangleData0150.coefficient9_210, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_212, Icur := OriginalRow227TriangleData0134.coefficient8_211,
    output := OriginalRow227TriangleData0150.coefficient9_211, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_213, Icur := OriginalRow227TriangleData0134.coefficient8_212,
    output := OriginalRow227TriangleData0150.coefficient9_212, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_214, Icur := OriginalRow227TriangleData0134.coefficient8_213,
    output := OriginalRow227TriangleData0150.coefficient9_213, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_215, Icur := OriginalRow227TriangleData0134.coefficient8_214,
    output := OriginalRow227TriangleData0150.coefficient9_214, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_216, Icur := OriginalRow227TriangleData0134.coefficient8_215,
    output := OriginalRow227TriangleData0150.coefficient9_215, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_217, Icur := OriginalRow227TriangleData0134.coefficient8_216,
    output := OriginalRow227TriangleData0150.coefficient9_216, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_218, Icur := OriginalRow227TriangleData0134.coefficient8_217,
    output := OriginalRow227TriangleData0150.coefficient9_217, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_219, Icur := OriginalRow227TriangleData0134.coefficient8_218,
    output := OriginalRow227TriangleData0150.coefficient9_218, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_220, Icur := OriginalRow227TriangleData0134.coefficient8_219,
    output := OriginalRow227TriangleData0150.coefficient9_219, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_221, Icur := OriginalRow227TriangleData0134.coefficient8_220,
    output := OriginalRow227TriangleData0150.coefficient9_220, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_222, Icur := OriginalRow227TriangleData0134.coefficient8_221,
    output := OriginalRow227TriangleData0150.coefficient9_221, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_223, Icur := OriginalRow227TriangleData0134.coefficient8_222,
    output := OriginalRow227TriangleData0150.coefficient9_222, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_224, Icur := OriginalRow227TriangleData0134.coefficient8_223,
    output := OriginalRow227TriangleData0150.coefficient9_223, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_225, Icur := OriginalRow227TriangleData0134.coefficient8_224,
    output := OriginalRow227TriangleData0150.coefficient9_224, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_226, Icur := OriginalRow227TriangleData0134.coefficient8_225,
    output := OriginalRow227TriangleData0150.coefficient9_225, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_227, Icur := OriginalRow227TriangleData0134.coefficient8_226,
    output := OriginalRow227TriangleData0150.coefficient9_226, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_228, Icur := OriginalRow227TriangleData0134.coefficient8_227,
    output := OriginalRow227TriangleData0150.coefficient9_227, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_229, Icur := OriginalRow227TriangleData0134.coefficient8_228,
    output := OriginalRow227TriangleData0150.coefficient9_228, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0134.coefficient8_230, Icur := OriginalRow227TriangleData0134.coefficient8_229,
    output := OriginalRow227TriangleData0150.coefficient9_229, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_231, Icur := OriginalRow227TriangleData0134.coefficient8_230,
    output := OriginalRow227TriangleData0150.coefficient9_230, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_232, Icur := OriginalRow227TriangleData0135.coefficient8_231,
    output := OriginalRow227TriangleData0150.coefficient9_231, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0134

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0134.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
