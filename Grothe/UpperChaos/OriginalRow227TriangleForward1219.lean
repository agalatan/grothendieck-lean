import Grothe.UpperChaos.OriginalRow227TriangleData1224
import Grothe.UpperChaos.OriginalRow227TriangleData1225
import Grothe.UpperChaos.OriginalRow227TriangleData1235
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1219
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_188, Icur := OriginalRow227TriangleData1224.coefficient91_187,
    output := OriginalRow227TriangleData1235.coefficient92_187, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_189, Icur := OriginalRow227TriangleData1224.coefficient91_188,
    output := OriginalRow227TriangleData1235.coefficient92_188, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_190, Icur := OriginalRow227TriangleData1224.coefficient91_189,
    output := OriginalRow227TriangleData1235.coefficient92_189, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_191, Icur := OriginalRow227TriangleData1224.coefficient91_190,
    output := OriginalRow227TriangleData1235.coefficient92_190, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_192, Icur := OriginalRow227TriangleData1224.coefficient91_191,
    output := OriginalRow227TriangleData1235.coefficient92_191, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_193, Icur := OriginalRow227TriangleData1224.coefficient91_192,
    output := OriginalRow227TriangleData1235.coefficient92_192, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_194, Icur := OriginalRow227TriangleData1224.coefficient91_193,
    output := OriginalRow227TriangleData1235.coefficient92_193, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_195, Icur := OriginalRow227TriangleData1224.coefficient91_194,
    output := OriginalRow227TriangleData1235.coefficient92_194, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_196, Icur := OriginalRow227TriangleData1224.coefficient91_195,
    output := OriginalRow227TriangleData1235.coefficient92_195, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_197, Icur := OriginalRow227TriangleData1224.coefficient91_196,
    output := OriginalRow227TriangleData1235.coefficient92_196, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_198, Icur := OriginalRow227TriangleData1224.coefficient91_197,
    output := OriginalRow227TriangleData1235.coefficient92_197, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_199, Icur := OriginalRow227TriangleData1224.coefficient91_198,
    output := OriginalRow227TriangleData1235.coefficient92_198, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_200, Icur := OriginalRow227TriangleData1224.coefficient91_199,
    output := OriginalRow227TriangleData1235.coefficient92_199, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_201, Icur := OriginalRow227TriangleData1224.coefficient91_200,
    output := OriginalRow227TriangleData1235.coefficient92_200, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_202, Icur := OriginalRow227TriangleData1224.coefficient91_201,
    output := OriginalRow227TriangleData1235.coefficient92_201, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_203, Icur := OriginalRow227TriangleData1224.coefficient91_202,
    output := OriginalRow227TriangleData1235.coefficient92_202, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_204, Icur := OriginalRow227TriangleData1224.coefficient91_203,
    output := OriginalRow227TriangleData1235.coefficient92_203, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_205, Icur := OriginalRow227TriangleData1224.coefficient91_204,
    output := OriginalRow227TriangleData1235.coefficient92_204, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_206, Icur := OriginalRow227TriangleData1224.coefficient91_205,
    output := OriginalRow227TriangleData1235.coefficient92_205, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_207, Icur := OriginalRow227TriangleData1224.coefficient91_206,
    output := OriginalRow227TriangleData1235.coefficient92_206, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_208, Icur := OriginalRow227TriangleData1224.coefficient91_207,
    output := OriginalRow227TriangleData1235.coefficient92_207, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_209, Icur := OriginalRow227TriangleData1224.coefficient91_208,
    output := OriginalRow227TriangleData1235.coefficient92_208, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_210, Icur := OriginalRow227TriangleData1224.coefficient91_209,
    output := OriginalRow227TriangleData1235.coefficient92_209, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_211, Icur := OriginalRow227TriangleData1224.coefficient91_210,
    output := OriginalRow227TriangleData1235.coefficient92_210, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_212, Icur := OriginalRow227TriangleData1224.coefficient91_211,
    output := OriginalRow227TriangleData1235.coefficient92_211, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_213, Icur := OriginalRow227TriangleData1224.coefficient91_212,
    output := OriginalRow227TriangleData1235.coefficient92_212, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_214, Icur := OriginalRow227TriangleData1224.coefficient91_213,
    output := OriginalRow227TriangleData1235.coefficient92_213, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_215, Icur := OriginalRow227TriangleData1224.coefficient91_214,
    output := OriginalRow227TriangleData1235.coefficient92_214, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_216, Icur := OriginalRow227TriangleData1224.coefficient91_215,
    output := OriginalRow227TriangleData1235.coefficient92_215, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_217, Icur := OriginalRow227TriangleData1224.coefficient91_216,
    output := OriginalRow227TriangleData1235.coefficient92_216, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1225.coefficient91_218, Icur := OriginalRow227TriangleData1224.coefficient91_217,
    output := OriginalRow227TriangleData1235.coefficient92_217, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1225.coefficient91_219, Icur := OriginalRow227TriangleData1225.coefficient91_218,
    output := OriginalRow227TriangleData1235.coefficient92_218, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1219

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1219.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
