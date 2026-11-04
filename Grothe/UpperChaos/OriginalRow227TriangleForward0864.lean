import Grothe.UpperChaos.OriginalRow227TriangleData0868
import Grothe.UpperChaos.OriginalRow227TriangleData0869
import Grothe.UpperChaos.OriginalRow227TriangleData0880
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0864
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_189, Icur := OriginalRow227TriangleData0868.coefficient60_188,
    output := OriginalRow227TriangleData0880.coefficient61_188, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_190, Icur := OriginalRow227TriangleData0868.coefficient60_189,
    output := OriginalRow227TriangleData0880.coefficient61_189, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_191, Icur := OriginalRow227TriangleData0868.coefficient60_190,
    output := OriginalRow227TriangleData0880.coefficient61_190, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_192, Icur := OriginalRow227TriangleData0868.coefficient60_191,
    output := OriginalRow227TriangleData0880.coefficient61_191, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_193, Icur := OriginalRow227TriangleData0868.coefficient60_192,
    output := OriginalRow227TriangleData0880.coefficient61_192, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_194, Icur := OriginalRow227TriangleData0868.coefficient60_193,
    output := OriginalRow227TriangleData0880.coefficient61_193, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_195, Icur := OriginalRow227TriangleData0868.coefficient60_194,
    output := OriginalRow227TriangleData0880.coefficient61_194, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_196, Icur := OriginalRow227TriangleData0868.coefficient60_195,
    output := OriginalRow227TriangleData0880.coefficient61_195, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_197, Icur := OriginalRow227TriangleData0868.coefficient60_196,
    output := OriginalRow227TriangleData0880.coefficient61_196, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_198, Icur := OriginalRow227TriangleData0868.coefficient60_197,
    output := OriginalRow227TriangleData0880.coefficient61_197, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_199, Icur := OriginalRow227TriangleData0868.coefficient60_198,
    output := OriginalRow227TriangleData0880.coefficient61_198, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_200, Icur := OriginalRow227TriangleData0868.coefficient60_199,
    output := OriginalRow227TriangleData0880.coefficient61_199, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_201, Icur := OriginalRow227TriangleData0868.coefficient60_200,
    output := OriginalRow227TriangleData0880.coefficient61_200, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_202, Icur := OriginalRow227TriangleData0868.coefficient60_201,
    output := OriginalRow227TriangleData0880.coefficient61_201, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_203, Icur := OriginalRow227TriangleData0868.coefficient60_202,
    output := OriginalRow227TriangleData0880.coefficient61_202, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_204, Icur := OriginalRow227TriangleData0868.coefficient60_203,
    output := OriginalRow227TriangleData0880.coefficient61_203, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_205, Icur := OriginalRow227TriangleData0868.coefficient60_204,
    output := OriginalRow227TriangleData0880.coefficient61_204, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_206, Icur := OriginalRow227TriangleData0868.coefficient60_205,
    output := OriginalRow227TriangleData0880.coefficient61_205, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_207, Icur := OriginalRow227TriangleData0868.coefficient60_206,
    output := OriginalRow227TriangleData0880.coefficient61_206, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_208, Icur := OriginalRow227TriangleData0868.coefficient60_207,
    output := OriginalRow227TriangleData0880.coefficient61_207, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_209, Icur := OriginalRow227TriangleData0868.coefficient60_208,
    output := OriginalRow227TriangleData0880.coefficient61_208, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_210, Icur := OriginalRow227TriangleData0868.coefficient60_209,
    output := OriginalRow227TriangleData0880.coefficient61_209, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_211, Icur := OriginalRow227TriangleData0868.coefficient60_210,
    output := OriginalRow227TriangleData0880.coefficient61_210, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_212, Icur := OriginalRow227TriangleData0868.coefficient60_211,
    output := OriginalRow227TriangleData0880.coefficient61_211, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_213, Icur := OriginalRow227TriangleData0868.coefficient60_212,
    output := OriginalRow227TriangleData0880.coefficient61_212, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_214, Icur := OriginalRow227TriangleData0868.coefficient60_213,
    output := OriginalRow227TriangleData0880.coefficient61_213, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_215, Icur := OriginalRow227TriangleData0868.coefficient60_214,
    output := OriginalRow227TriangleData0880.coefficient61_214, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_216, Icur := OriginalRow227TriangleData0868.coefficient60_215,
    output := OriginalRow227TriangleData0880.coefficient61_215, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_217, Icur := OriginalRow227TriangleData0868.coefficient60_216,
    output := OriginalRow227TriangleData0880.coefficient61_216, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0868.coefficient60_218, Icur := OriginalRow227TriangleData0868.coefficient60_217,
    output := OriginalRow227TriangleData0880.coefficient61_217, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0869.coefficient60_219, Icur := OriginalRow227TriangleData0868.coefficient60_218,
    output := OriginalRow227TriangleData0880.coefficient61_218, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0869.coefficient60_220, Icur := OriginalRow227TriangleData0869.coefficient60_219,
    output := OriginalRow227TriangleData0880.coefficient61_219, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0864

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0864.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
