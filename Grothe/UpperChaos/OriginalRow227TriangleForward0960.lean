import Grothe.UpperChaos.OriginalRow227TriangleData0964
import Grothe.UpperChaos.OriginalRow227TriangleData0965
import Grothe.UpperChaos.OriginalRow227TriangleData0976
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0960
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_197, Icur := OriginalRow227TriangleData0964.coefficient68_196,
    output := OriginalRow227TriangleData0976.coefficient69_196, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_198, Icur := OriginalRow227TriangleData0964.coefficient68_197,
    output := OriginalRow227TriangleData0976.coefficient69_197, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_199, Icur := OriginalRow227TriangleData0964.coefficient68_198,
    output := OriginalRow227TriangleData0976.coefficient69_198, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_200, Icur := OriginalRow227TriangleData0964.coefficient68_199,
    output := OriginalRow227TriangleData0976.coefficient69_199, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_201, Icur := OriginalRow227TriangleData0964.coefficient68_200,
    output := OriginalRow227TriangleData0976.coefficient69_200, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_202, Icur := OriginalRow227TriangleData0964.coefficient68_201,
    output := OriginalRow227TriangleData0976.coefficient69_201, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_203, Icur := OriginalRow227TriangleData0964.coefficient68_202,
    output := OriginalRow227TriangleData0976.coefficient69_202, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_204, Icur := OriginalRow227TriangleData0964.coefficient68_203,
    output := OriginalRow227TriangleData0976.coefficient69_203, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_205, Icur := OriginalRow227TriangleData0964.coefficient68_204,
    output := OriginalRow227TriangleData0976.coefficient69_204, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_206, Icur := OriginalRow227TriangleData0964.coefficient68_205,
    output := OriginalRow227TriangleData0976.coefficient69_205, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_207, Icur := OriginalRow227TriangleData0964.coefficient68_206,
    output := OriginalRow227TriangleData0976.coefficient69_206, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_208, Icur := OriginalRow227TriangleData0964.coefficient68_207,
    output := OriginalRow227TriangleData0976.coefficient69_207, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_209, Icur := OriginalRow227TriangleData0964.coefficient68_208,
    output := OriginalRow227TriangleData0976.coefficient69_208, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_210, Icur := OriginalRow227TriangleData0964.coefficient68_209,
    output := OriginalRow227TriangleData0976.coefficient69_209, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_211, Icur := OriginalRow227TriangleData0964.coefficient68_210,
    output := OriginalRow227TriangleData0976.coefficient69_210, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_212, Icur := OriginalRow227TriangleData0964.coefficient68_211,
    output := OriginalRow227TriangleData0976.coefficient69_211, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_213, Icur := OriginalRow227TriangleData0964.coefficient68_212,
    output := OriginalRow227TriangleData0976.coefficient69_212, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_214, Icur := OriginalRow227TriangleData0964.coefficient68_213,
    output := OriginalRow227TriangleData0976.coefficient69_213, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_215, Icur := OriginalRow227TriangleData0964.coefficient68_214,
    output := OriginalRow227TriangleData0976.coefficient69_214, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_216, Icur := OriginalRow227TriangleData0964.coefficient68_215,
    output := OriginalRow227TriangleData0976.coefficient69_215, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_217, Icur := OriginalRow227TriangleData0964.coefficient68_216,
    output := OriginalRow227TriangleData0976.coefficient69_216, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_218, Icur := OriginalRow227TriangleData0964.coefficient68_217,
    output := OriginalRow227TriangleData0976.coefficient69_217, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_219, Icur := OriginalRow227TriangleData0964.coefficient68_218,
    output := OriginalRow227TriangleData0976.coefficient69_218, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_220, Icur := OriginalRow227TriangleData0964.coefficient68_219,
    output := OriginalRow227TriangleData0976.coefficient69_219, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_221, Icur := OriginalRow227TriangleData0964.coefficient68_220,
    output := OriginalRow227TriangleData0976.coefficient69_220, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_222, Icur := OriginalRow227TriangleData0964.coefficient68_221,
    output := OriginalRow227TriangleData0976.coefficient69_221, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_223, Icur := OriginalRow227TriangleData0964.coefficient68_222,
    output := OriginalRow227TriangleData0976.coefficient69_222, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_224, Icur := OriginalRow227TriangleData0964.coefficient68_223,
    output := OriginalRow227TriangleData0976.coefficient69_223, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_225, Icur := OriginalRow227TriangleData0964.coefficient68_224,
    output := OriginalRow227TriangleData0976.coefficient69_224, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_226, Icur := OriginalRow227TriangleData0964.coefficient68_225,
    output := OriginalRow227TriangleData0976.coefficient69_225, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0965.coefficient68_227, Icur := OriginalRow227TriangleData0964.coefficient68_226,
    output := OriginalRow227TriangleData0976.coefficient69_226, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0965.coefficient68_228, Icur := OriginalRow227TriangleData0965.coefficient68_227,
    output := OriginalRow227TriangleData0976.coefficient69_227, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0960

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0960.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
