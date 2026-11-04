import Grothe.UpperChaos.OriginalRow227TriangleData1265
import Grothe.UpperChaos.OriginalRow227TriangleData1266
import Grothe.UpperChaos.OriginalRow227TriangleData1275
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1259
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_192, Icur := OriginalRow227TriangleData1265.coefficient95_191,
    output := OriginalRow227TriangleData1275.coefficient96_191, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_193, Icur := OriginalRow227TriangleData1265.coefficient95_192,
    output := OriginalRow227TriangleData1275.coefficient96_192, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_194, Icur := OriginalRow227TriangleData1265.coefficient95_193,
    output := OriginalRow227TriangleData1275.coefficient96_193, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_195, Icur := OriginalRow227TriangleData1265.coefficient95_194,
    output := OriginalRow227TriangleData1275.coefficient96_194, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_196, Icur := OriginalRow227TriangleData1265.coefficient95_195,
    output := OriginalRow227TriangleData1275.coefficient96_195, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_197, Icur := OriginalRow227TriangleData1265.coefficient95_196,
    output := OriginalRow227TriangleData1275.coefficient96_196, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_198, Icur := OriginalRow227TriangleData1265.coefficient95_197,
    output := OriginalRow227TriangleData1275.coefficient96_197, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_199, Icur := OriginalRow227TriangleData1265.coefficient95_198,
    output := OriginalRow227TriangleData1275.coefficient96_198, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_200, Icur := OriginalRow227TriangleData1265.coefficient95_199,
    output := OriginalRow227TriangleData1275.coefficient96_199, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_201, Icur := OriginalRow227TriangleData1265.coefficient95_200,
    output := OriginalRow227TriangleData1275.coefficient96_200, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_202, Icur := OriginalRow227TriangleData1265.coefficient95_201,
    output := OriginalRow227TriangleData1275.coefficient96_201, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_203, Icur := OriginalRow227TriangleData1265.coefficient95_202,
    output := OriginalRow227TriangleData1275.coefficient96_202, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_204, Icur := OriginalRow227TriangleData1265.coefficient95_203,
    output := OriginalRow227TriangleData1275.coefficient96_203, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_205, Icur := OriginalRow227TriangleData1265.coefficient95_204,
    output := OriginalRow227TriangleData1275.coefficient96_204, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_206, Icur := OriginalRow227TriangleData1265.coefficient95_205,
    output := OriginalRow227TriangleData1275.coefficient96_205, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_207, Icur := OriginalRow227TriangleData1265.coefficient95_206,
    output := OriginalRow227TriangleData1275.coefficient96_206, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_208, Icur := OriginalRow227TriangleData1265.coefficient95_207,
    output := OriginalRow227TriangleData1275.coefficient96_207, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_209, Icur := OriginalRow227TriangleData1265.coefficient95_208,
    output := OriginalRow227TriangleData1275.coefficient96_208, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_210, Icur := OriginalRow227TriangleData1265.coefficient95_209,
    output := OriginalRow227TriangleData1275.coefficient96_209, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_211, Icur := OriginalRow227TriangleData1265.coefficient95_210,
    output := OriginalRow227TriangleData1275.coefficient96_210, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_212, Icur := OriginalRow227TriangleData1265.coefficient95_211,
    output := OriginalRow227TriangleData1275.coefficient96_211, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_213, Icur := OriginalRow227TriangleData1265.coefficient95_212,
    output := OriginalRow227TriangleData1275.coefficient96_212, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_214, Icur := OriginalRow227TriangleData1265.coefficient95_213,
    output := OriginalRow227TriangleData1275.coefficient96_213, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_215, Icur := OriginalRow227TriangleData1265.coefficient95_214,
    output := OriginalRow227TriangleData1275.coefficient96_214, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_216, Icur := OriginalRow227TriangleData1265.coefficient95_215,
    output := OriginalRow227TriangleData1275.coefficient96_215, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_217, Icur := OriginalRow227TriangleData1265.coefficient95_216,
    output := OriginalRow227TriangleData1275.coefficient96_216, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_218, Icur := OriginalRow227TriangleData1265.coefficient95_217,
    output := OriginalRow227TriangleData1275.coefficient96_217, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_219, Icur := OriginalRow227TriangleData1265.coefficient95_218,
    output := OriginalRow227TriangleData1275.coefficient96_218, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_220, Icur := OriginalRow227TriangleData1265.coefficient95_219,
    output := OriginalRow227TriangleData1275.coefficient96_219, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1265.coefficient95_221, Icur := OriginalRow227TriangleData1265.coefficient95_220,
    output := OriginalRow227TriangleData1275.coefficient96_220, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1266.coefficient95_222, Icur := OriginalRow227TriangleData1265.coefficient95_221,
    output := OriginalRow227TriangleData1275.coefficient96_221, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1266.coefficient95_223, Icur := OriginalRow227TriangleData1266.coefficient95_222,
    output := OriginalRow227TriangleData1275.coefficient96_222, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1259

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1259.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
