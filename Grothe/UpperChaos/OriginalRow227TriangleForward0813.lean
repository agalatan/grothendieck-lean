import Grothe.UpperChaos.OriginalRow227TriangleData0816
import Grothe.UpperChaos.OriginalRow227TriangleData0817
import Grothe.UpperChaos.OriginalRow227TriangleData0829
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0813
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_185, Icur := OriginalRow227TriangleData0816.coefficient56_184,
    output := OriginalRow227TriangleData0829.coefficient57_184, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_186, Icur := OriginalRow227TriangleData0816.coefficient56_185,
    output := OriginalRow227TriangleData0829.coefficient57_185, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_187, Icur := OriginalRow227TriangleData0816.coefficient56_186,
    output := OriginalRow227TriangleData0829.coefficient57_186, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_188, Icur := OriginalRow227TriangleData0816.coefficient56_187,
    output := OriginalRow227TriangleData0829.coefficient57_187, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_189, Icur := OriginalRow227TriangleData0816.coefficient56_188,
    output := OriginalRow227TriangleData0829.coefficient57_188, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_190, Icur := OriginalRow227TriangleData0816.coefficient56_189,
    output := OriginalRow227TriangleData0829.coefficient57_189, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_191, Icur := OriginalRow227TriangleData0816.coefficient56_190,
    output := OriginalRow227TriangleData0829.coefficient57_190, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_192, Icur := OriginalRow227TriangleData0816.coefficient56_191,
    output := OriginalRow227TriangleData0829.coefficient57_191, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_193, Icur := OriginalRow227TriangleData0816.coefficient56_192,
    output := OriginalRow227TriangleData0829.coefficient57_192, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_194, Icur := OriginalRow227TriangleData0816.coefficient56_193,
    output := OriginalRow227TriangleData0829.coefficient57_193, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_195, Icur := OriginalRow227TriangleData0816.coefficient56_194,
    output := OriginalRow227TriangleData0829.coefficient57_194, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_196, Icur := OriginalRow227TriangleData0816.coefficient56_195,
    output := OriginalRow227TriangleData0829.coefficient57_195, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_197, Icur := OriginalRow227TriangleData0816.coefficient56_196,
    output := OriginalRow227TriangleData0829.coefficient57_196, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_198, Icur := OriginalRow227TriangleData0816.coefficient56_197,
    output := OriginalRow227TriangleData0829.coefficient57_197, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_199, Icur := OriginalRow227TriangleData0816.coefficient56_198,
    output := OriginalRow227TriangleData0829.coefficient57_198, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_200, Icur := OriginalRow227TriangleData0816.coefficient56_199,
    output := OriginalRow227TriangleData0829.coefficient57_199, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_201, Icur := OriginalRow227TriangleData0816.coefficient56_200,
    output := OriginalRow227TriangleData0829.coefficient57_200, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_202, Icur := OriginalRow227TriangleData0816.coefficient56_201,
    output := OriginalRow227TriangleData0829.coefficient57_201, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_203, Icur := OriginalRow227TriangleData0816.coefficient56_202,
    output := OriginalRow227TriangleData0829.coefficient57_202, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_204, Icur := OriginalRow227TriangleData0816.coefficient56_203,
    output := OriginalRow227TriangleData0829.coefficient57_203, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_205, Icur := OriginalRow227TriangleData0816.coefficient56_204,
    output := OriginalRow227TriangleData0829.coefficient57_204, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_206, Icur := OriginalRow227TriangleData0816.coefficient56_205,
    output := OriginalRow227TriangleData0829.coefficient57_205, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_207, Icur := OriginalRow227TriangleData0816.coefficient56_206,
    output := OriginalRow227TriangleData0829.coefficient57_206, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_208, Icur := OriginalRow227TriangleData0816.coefficient56_207,
    output := OriginalRow227TriangleData0829.coefficient57_207, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_209, Icur := OriginalRow227TriangleData0816.coefficient56_208,
    output := OriginalRow227TriangleData0829.coefficient57_208, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_210, Icur := OriginalRow227TriangleData0816.coefficient56_209,
    output := OriginalRow227TriangleData0829.coefficient57_209, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_211, Icur := OriginalRow227TriangleData0816.coefficient56_210,
    output := OriginalRow227TriangleData0829.coefficient57_210, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_212, Icur := OriginalRow227TriangleData0816.coefficient56_211,
    output := OriginalRow227TriangleData0829.coefficient57_211, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_213, Icur := OriginalRow227TriangleData0816.coefficient56_212,
    output := OriginalRow227TriangleData0829.coefficient57_212, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0816.coefficient56_214, Icur := OriginalRow227TriangleData0816.coefficient56_213,
    output := OriginalRow227TriangleData0829.coefficient57_213, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_215, Icur := OriginalRow227TriangleData0816.coefficient56_214,
    output := OriginalRow227TriangleData0829.coefficient57_214, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_216, Icur := OriginalRow227TriangleData0817.coefficient56_215,
    output := OriginalRow227TriangleData0829.coefficient57_215, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0813

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0813.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
