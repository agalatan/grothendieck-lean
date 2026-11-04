import Grothe.UpperChaos.OriginalRow227TriangleData0549
import Grothe.UpperChaos.OriginalRow227TriangleData0550
import Grothe.UpperChaos.OriginalRow227TriangleData0563
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0547
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_197, Icur := OriginalRow227TriangleData0549.coefficient36_196,
    output := OriginalRow227TriangleData0563.coefficient37_196, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_198, Icur := OriginalRow227TriangleData0549.coefficient36_197,
    output := OriginalRow227TriangleData0563.coefficient37_197, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_199, Icur := OriginalRow227TriangleData0549.coefficient36_198,
    output := OriginalRow227TriangleData0563.coefficient37_198, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_200, Icur := OriginalRow227TriangleData0549.coefficient36_199,
    output := OriginalRow227TriangleData0563.coefficient37_199, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_201, Icur := OriginalRow227TriangleData0549.coefficient36_200,
    output := OriginalRow227TriangleData0563.coefficient37_200, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_202, Icur := OriginalRow227TriangleData0549.coefficient36_201,
    output := OriginalRow227TriangleData0563.coefficient37_201, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_203, Icur := OriginalRow227TriangleData0549.coefficient36_202,
    output := OriginalRow227TriangleData0563.coefficient37_202, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_204, Icur := OriginalRow227TriangleData0549.coefficient36_203,
    output := OriginalRow227TriangleData0563.coefficient37_203, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_205, Icur := OriginalRow227TriangleData0549.coefficient36_204,
    output := OriginalRow227TriangleData0563.coefficient37_204, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_206, Icur := OriginalRow227TriangleData0549.coefficient36_205,
    output := OriginalRow227TriangleData0563.coefficient37_205, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_207, Icur := OriginalRow227TriangleData0549.coefficient36_206,
    output := OriginalRow227TriangleData0563.coefficient37_206, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_208, Icur := OriginalRow227TriangleData0549.coefficient36_207,
    output := OriginalRow227TriangleData0563.coefficient37_207, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_209, Icur := OriginalRow227TriangleData0549.coefficient36_208,
    output := OriginalRow227TriangleData0563.coefficient37_208, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_210, Icur := OriginalRow227TriangleData0549.coefficient36_209,
    output := OriginalRow227TriangleData0563.coefficient37_209, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_211, Icur := OriginalRow227TriangleData0549.coefficient36_210,
    output := OriginalRow227TriangleData0563.coefficient37_210, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_212, Icur := OriginalRow227TriangleData0549.coefficient36_211,
    output := OriginalRow227TriangleData0563.coefficient37_211, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_213, Icur := OriginalRow227TriangleData0549.coefficient36_212,
    output := OriginalRow227TriangleData0563.coefficient37_212, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_214, Icur := OriginalRow227TriangleData0549.coefficient36_213,
    output := OriginalRow227TriangleData0563.coefficient37_213, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_215, Icur := OriginalRow227TriangleData0549.coefficient36_214,
    output := OriginalRow227TriangleData0563.coefficient37_214, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_216, Icur := OriginalRow227TriangleData0549.coefficient36_215,
    output := OriginalRow227TriangleData0563.coefficient37_215, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_217, Icur := OriginalRow227TriangleData0549.coefficient36_216,
    output := OriginalRow227TriangleData0563.coefficient37_216, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_218, Icur := OriginalRow227TriangleData0549.coefficient36_217,
    output := OriginalRow227TriangleData0563.coefficient37_217, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_219, Icur := OriginalRow227TriangleData0549.coefficient36_218,
    output := OriginalRow227TriangleData0563.coefficient37_218, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_220, Icur := OriginalRow227TriangleData0549.coefficient36_219,
    output := OriginalRow227TriangleData0563.coefficient37_219, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_221, Icur := OriginalRow227TriangleData0549.coefficient36_220,
    output := OriginalRow227TriangleData0563.coefficient37_220, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_222, Icur := OriginalRow227TriangleData0549.coefficient36_221,
    output := OriginalRow227TriangleData0563.coefficient37_221, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_223, Icur := OriginalRow227TriangleData0549.coefficient36_222,
    output := OriginalRow227TriangleData0563.coefficient37_222, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_224, Icur := OriginalRow227TriangleData0549.coefficient36_223,
    output := OriginalRow227TriangleData0563.coefficient37_223, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_225, Icur := OriginalRow227TriangleData0549.coefficient36_224,
    output := OriginalRow227TriangleData0563.coefficient37_224, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_226, Icur := OriginalRow227TriangleData0549.coefficient36_225,
    output := OriginalRow227TriangleData0563.coefficient37_225, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0550.coefficient36_227, Icur := OriginalRow227TriangleData0549.coefficient36_226,
    output := OriginalRow227TriangleData0563.coefficient37_226, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0550.coefficient36_228, Icur := OriginalRow227TriangleData0550.coefficient36_227,
    output := OriginalRow227TriangleData0563.coefficient37_227, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0547

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0547.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
