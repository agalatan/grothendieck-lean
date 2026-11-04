import Grothe.UpperChaos.OriginalRow227TriangleData0829
import Grothe.UpperChaos.OriginalRow227TriangleData0830
import Grothe.UpperChaos.OriginalRow227TriangleData0842
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0826
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_186, Icur := OriginalRow227TriangleData0829.coefficient57_185,
    output := OriginalRow227TriangleData0842.coefficient58_185, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_187, Icur := OriginalRow227TriangleData0829.coefficient57_186,
    output := OriginalRow227TriangleData0842.coefficient58_186, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_188, Icur := OriginalRow227TriangleData0829.coefficient57_187,
    output := OriginalRow227TriangleData0842.coefficient58_187, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_189, Icur := OriginalRow227TriangleData0829.coefficient57_188,
    output := OriginalRow227TriangleData0842.coefficient58_188, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_190, Icur := OriginalRow227TriangleData0829.coefficient57_189,
    output := OriginalRow227TriangleData0842.coefficient58_189, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_191, Icur := OriginalRow227TriangleData0829.coefficient57_190,
    output := OriginalRow227TriangleData0842.coefficient58_190, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_192, Icur := OriginalRow227TriangleData0829.coefficient57_191,
    output := OriginalRow227TriangleData0842.coefficient58_191, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_193, Icur := OriginalRow227TriangleData0829.coefficient57_192,
    output := OriginalRow227TriangleData0842.coefficient58_192, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_194, Icur := OriginalRow227TriangleData0829.coefficient57_193,
    output := OriginalRow227TriangleData0842.coefficient58_193, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_195, Icur := OriginalRow227TriangleData0829.coefficient57_194,
    output := OriginalRow227TriangleData0842.coefficient58_194, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_196, Icur := OriginalRow227TriangleData0829.coefficient57_195,
    output := OriginalRow227TriangleData0842.coefficient58_195, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_197, Icur := OriginalRow227TriangleData0829.coefficient57_196,
    output := OriginalRow227TriangleData0842.coefficient58_196, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_198, Icur := OriginalRow227TriangleData0829.coefficient57_197,
    output := OriginalRow227TriangleData0842.coefficient58_197, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_199, Icur := OriginalRow227TriangleData0829.coefficient57_198,
    output := OriginalRow227TriangleData0842.coefficient58_198, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_200, Icur := OriginalRow227TriangleData0829.coefficient57_199,
    output := OriginalRow227TriangleData0842.coefficient58_199, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_201, Icur := OriginalRow227TriangleData0829.coefficient57_200,
    output := OriginalRow227TriangleData0842.coefficient58_200, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_202, Icur := OriginalRow227TriangleData0829.coefficient57_201,
    output := OriginalRow227TriangleData0842.coefficient58_201, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_203, Icur := OriginalRow227TriangleData0829.coefficient57_202,
    output := OriginalRow227TriangleData0842.coefficient58_202, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_204, Icur := OriginalRow227TriangleData0829.coefficient57_203,
    output := OriginalRow227TriangleData0842.coefficient58_203, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_205, Icur := OriginalRow227TriangleData0829.coefficient57_204,
    output := OriginalRow227TriangleData0842.coefficient58_204, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_206, Icur := OriginalRow227TriangleData0829.coefficient57_205,
    output := OriginalRow227TriangleData0842.coefficient58_205, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_207, Icur := OriginalRow227TriangleData0829.coefficient57_206,
    output := OriginalRow227TriangleData0842.coefficient58_206, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_208, Icur := OriginalRow227TriangleData0829.coefficient57_207,
    output := OriginalRow227TriangleData0842.coefficient58_207, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_209, Icur := OriginalRow227TriangleData0829.coefficient57_208,
    output := OriginalRow227TriangleData0842.coefficient58_208, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_210, Icur := OriginalRow227TriangleData0829.coefficient57_209,
    output := OriginalRow227TriangleData0842.coefficient58_209, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_211, Icur := OriginalRow227TriangleData0829.coefficient57_210,
    output := OriginalRow227TriangleData0842.coefficient58_210, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_212, Icur := OriginalRow227TriangleData0829.coefficient57_211,
    output := OriginalRow227TriangleData0842.coefficient58_211, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_213, Icur := OriginalRow227TriangleData0829.coefficient57_212,
    output := OriginalRow227TriangleData0842.coefficient58_212, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_214, Icur := OriginalRow227TriangleData0829.coefficient57_213,
    output := OriginalRow227TriangleData0842.coefficient58_213, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0829.coefficient57_215, Icur := OriginalRow227TriangleData0829.coefficient57_214,
    output := OriginalRow227TriangleData0842.coefficient58_214, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0830.coefficient57_216, Icur := OriginalRow227TriangleData0829.coefficient57_215,
    output := OriginalRow227TriangleData0842.coefficient58_215, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0830.coefficient57_217, Icur := OriginalRow227TriangleData0830.coefficient57_216,
    output := OriginalRow227TriangleData0842.coefficient58_216, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0826

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0826.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
