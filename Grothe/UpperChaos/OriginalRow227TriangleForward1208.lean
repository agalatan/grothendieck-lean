import Grothe.UpperChaos.OriginalRow227TriangleData1213
import Grothe.UpperChaos.OriginalRow227TriangleData1214
import Grothe.UpperChaos.OriginalRow227TriangleData1224
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1208
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_187, Icur := OriginalRow227TriangleData1213.coefficient90_186,
    output := OriginalRow227TriangleData1224.coefficient91_186, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_188, Icur := OriginalRow227TriangleData1213.coefficient90_187,
    output := OriginalRow227TriangleData1224.coefficient91_187, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_189, Icur := OriginalRow227TriangleData1213.coefficient90_188,
    output := OriginalRow227TriangleData1224.coefficient91_188, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_190, Icur := OriginalRow227TriangleData1213.coefficient90_189,
    output := OriginalRow227TriangleData1224.coefficient91_189, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_191, Icur := OriginalRow227TriangleData1213.coefficient90_190,
    output := OriginalRow227TriangleData1224.coefficient91_190, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_192, Icur := OriginalRow227TriangleData1213.coefficient90_191,
    output := OriginalRow227TriangleData1224.coefficient91_191, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_193, Icur := OriginalRow227TriangleData1213.coefficient90_192,
    output := OriginalRow227TriangleData1224.coefficient91_192, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_194, Icur := OriginalRow227TriangleData1213.coefficient90_193,
    output := OriginalRow227TriangleData1224.coefficient91_193, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_195, Icur := OriginalRow227TriangleData1213.coefficient90_194,
    output := OriginalRow227TriangleData1224.coefficient91_194, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_196, Icur := OriginalRow227TriangleData1213.coefficient90_195,
    output := OriginalRow227TriangleData1224.coefficient91_195, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_197, Icur := OriginalRow227TriangleData1213.coefficient90_196,
    output := OriginalRow227TriangleData1224.coefficient91_196, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_198, Icur := OriginalRow227TriangleData1213.coefficient90_197,
    output := OriginalRow227TriangleData1224.coefficient91_197, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_199, Icur := OriginalRow227TriangleData1213.coefficient90_198,
    output := OriginalRow227TriangleData1224.coefficient91_198, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_200, Icur := OriginalRow227TriangleData1213.coefficient90_199,
    output := OriginalRow227TriangleData1224.coefficient91_199, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_201, Icur := OriginalRow227TriangleData1213.coefficient90_200,
    output := OriginalRow227TriangleData1224.coefficient91_200, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_202, Icur := OriginalRow227TriangleData1213.coefficient90_201,
    output := OriginalRow227TriangleData1224.coefficient91_201, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_203, Icur := OriginalRow227TriangleData1213.coefficient90_202,
    output := OriginalRow227TriangleData1224.coefficient91_202, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_204, Icur := OriginalRow227TriangleData1213.coefficient90_203,
    output := OriginalRow227TriangleData1224.coefficient91_203, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_205, Icur := OriginalRow227TriangleData1213.coefficient90_204,
    output := OriginalRow227TriangleData1224.coefficient91_204, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_206, Icur := OriginalRow227TriangleData1213.coefficient90_205,
    output := OriginalRow227TriangleData1224.coefficient91_205, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_207, Icur := OriginalRow227TriangleData1213.coefficient90_206,
    output := OriginalRow227TriangleData1224.coefficient91_206, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_208, Icur := OriginalRow227TriangleData1213.coefficient90_207,
    output := OriginalRow227TriangleData1224.coefficient91_207, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_209, Icur := OriginalRow227TriangleData1213.coefficient90_208,
    output := OriginalRow227TriangleData1224.coefficient91_208, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_210, Icur := OriginalRow227TriangleData1213.coefficient90_209,
    output := OriginalRow227TriangleData1224.coefficient91_209, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_211, Icur := OriginalRow227TriangleData1213.coefficient90_210,
    output := OriginalRow227TriangleData1224.coefficient91_210, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_212, Icur := OriginalRow227TriangleData1213.coefficient90_211,
    output := OriginalRow227TriangleData1224.coefficient91_211, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_213, Icur := OriginalRow227TriangleData1213.coefficient90_212,
    output := OriginalRow227TriangleData1224.coefficient91_212, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_214, Icur := OriginalRow227TriangleData1213.coefficient90_213,
    output := OriginalRow227TriangleData1224.coefficient91_213, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_215, Icur := OriginalRow227TriangleData1213.coefficient90_214,
    output := OriginalRow227TriangleData1224.coefficient91_214, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1213.coefficient90_216, Icur := OriginalRow227TriangleData1213.coefficient90_215,
    output := OriginalRow227TriangleData1224.coefficient91_215, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_217, Icur := OriginalRow227TriangleData1213.coefficient90_216,
    output := OriginalRow227TriangleData1224.coefficient91_216, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_218, Icur := OriginalRow227TriangleData1214.coefficient90_217,
    output := OriginalRow227TriangleData1224.coefficient91_217, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1208

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1208.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
