import Grothe.UpperChaos.OriginalRow227TriangleData0976
import Grothe.UpperChaos.OriginalRow227TriangleData0977
import Grothe.UpperChaos.OriginalRow227TriangleData0988
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0972
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_198, Icur := OriginalRow227TriangleData0976.coefficient69_197,
    output := OriginalRow227TriangleData0988.coefficient70_197, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_199, Icur := OriginalRow227TriangleData0976.coefficient69_198,
    output := OriginalRow227TriangleData0988.coefficient70_198, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_200, Icur := OriginalRow227TriangleData0976.coefficient69_199,
    output := OriginalRow227TriangleData0988.coefficient70_199, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_201, Icur := OriginalRow227TriangleData0976.coefficient69_200,
    output := OriginalRow227TriangleData0988.coefficient70_200, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_202, Icur := OriginalRow227TriangleData0976.coefficient69_201,
    output := OriginalRow227TriangleData0988.coefficient70_201, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_203, Icur := OriginalRow227TriangleData0976.coefficient69_202,
    output := OriginalRow227TriangleData0988.coefficient70_202, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_204, Icur := OriginalRow227TriangleData0976.coefficient69_203,
    output := OriginalRow227TriangleData0988.coefficient70_203, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_205, Icur := OriginalRow227TriangleData0976.coefficient69_204,
    output := OriginalRow227TriangleData0988.coefficient70_204, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_206, Icur := OriginalRow227TriangleData0976.coefficient69_205,
    output := OriginalRow227TriangleData0988.coefficient70_205, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_207, Icur := OriginalRow227TriangleData0976.coefficient69_206,
    output := OriginalRow227TriangleData0988.coefficient70_206, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_208, Icur := OriginalRow227TriangleData0976.coefficient69_207,
    output := OriginalRow227TriangleData0988.coefficient70_207, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_209, Icur := OriginalRow227TriangleData0976.coefficient69_208,
    output := OriginalRow227TriangleData0988.coefficient70_208, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_210, Icur := OriginalRow227TriangleData0976.coefficient69_209,
    output := OriginalRow227TriangleData0988.coefficient70_209, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_211, Icur := OriginalRow227TriangleData0976.coefficient69_210,
    output := OriginalRow227TriangleData0988.coefficient70_210, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_212, Icur := OriginalRow227TriangleData0976.coefficient69_211,
    output := OriginalRow227TriangleData0988.coefficient70_211, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_213, Icur := OriginalRow227TriangleData0976.coefficient69_212,
    output := OriginalRow227TriangleData0988.coefficient70_212, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_214, Icur := OriginalRow227TriangleData0976.coefficient69_213,
    output := OriginalRow227TriangleData0988.coefficient70_213, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_215, Icur := OriginalRow227TriangleData0976.coefficient69_214,
    output := OriginalRow227TriangleData0988.coefficient70_214, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_216, Icur := OriginalRow227TriangleData0976.coefficient69_215,
    output := OriginalRow227TriangleData0988.coefficient70_215, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_217, Icur := OriginalRow227TriangleData0976.coefficient69_216,
    output := OriginalRow227TriangleData0988.coefficient70_216, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_218, Icur := OriginalRow227TriangleData0976.coefficient69_217,
    output := OriginalRow227TriangleData0988.coefficient70_217, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_219, Icur := OriginalRow227TriangleData0976.coefficient69_218,
    output := OriginalRow227TriangleData0988.coefficient70_218, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_220, Icur := OriginalRow227TriangleData0976.coefficient69_219,
    output := OriginalRow227TriangleData0988.coefficient70_219, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_221, Icur := OriginalRow227TriangleData0976.coefficient69_220,
    output := OriginalRow227TriangleData0988.coefficient70_220, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_222, Icur := OriginalRow227TriangleData0976.coefficient69_221,
    output := OriginalRow227TriangleData0988.coefficient70_221, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_223, Icur := OriginalRow227TriangleData0976.coefficient69_222,
    output := OriginalRow227TriangleData0988.coefficient70_222, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_224, Icur := OriginalRow227TriangleData0976.coefficient69_223,
    output := OriginalRow227TriangleData0988.coefficient70_223, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_225, Icur := OriginalRow227TriangleData0976.coefficient69_224,
    output := OriginalRow227TriangleData0988.coefficient70_224, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_226, Icur := OriginalRow227TriangleData0976.coefficient69_225,
    output := OriginalRow227TriangleData0988.coefficient70_225, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_227, Icur := OriginalRow227TriangleData0976.coefficient69_226,
    output := OriginalRow227TriangleData0988.coefficient70_226, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_228, Icur := OriginalRow227TriangleData0976.coefficient69_227,
    output := OriginalRow227TriangleData0988.coefficient70_227, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_229, Icur := OriginalRow227TriangleData0977.coefficient69_228,
    output := OriginalRow227TriangleData0988.coefficient70_228, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0972

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0972.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
