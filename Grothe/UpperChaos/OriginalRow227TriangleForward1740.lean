import Grothe.UpperChaos.OriginalRow227TriangleData1749
import Grothe.UpperChaos.OriginalRow227TriangleData1750
import Grothe.UpperChaos.OriginalRow227TriangleData1756
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1740
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_185, Icur := OriginalRow227TriangleData1749.coefficient152_184,
    output := OriginalRow227TriangleData1756.coefficient153_184, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_186, Icur := OriginalRow227TriangleData1749.coefficient152_185,
    output := OriginalRow227TriangleData1756.coefficient153_185, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_187, Icur := OriginalRow227TriangleData1749.coefficient152_186,
    output := OriginalRow227TriangleData1756.coefficient153_186, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_188, Icur := OriginalRow227TriangleData1749.coefficient152_187,
    output := OriginalRow227TriangleData1756.coefficient153_187, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_189, Icur := OriginalRow227TriangleData1749.coefficient152_188,
    output := OriginalRow227TriangleData1756.coefficient153_188, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_190, Icur := OriginalRow227TriangleData1749.coefficient152_189,
    output := OriginalRow227TriangleData1756.coefficient153_189, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_191, Icur := OriginalRow227TriangleData1749.coefficient152_190,
    output := OriginalRow227TriangleData1756.coefficient153_190, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_192, Icur := OriginalRow227TriangleData1749.coefficient152_191,
    output := OriginalRow227TriangleData1756.coefficient153_191, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_193, Icur := OriginalRow227TriangleData1749.coefficient152_192,
    output := OriginalRow227TriangleData1756.coefficient153_192, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_194, Icur := OriginalRow227TriangleData1749.coefficient152_193,
    output := OriginalRow227TriangleData1756.coefficient153_193, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_195, Icur := OriginalRow227TriangleData1749.coefficient152_194,
    output := OriginalRow227TriangleData1756.coefficient153_194, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_196, Icur := OriginalRow227TriangleData1749.coefficient152_195,
    output := OriginalRow227TriangleData1756.coefficient153_195, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_197, Icur := OriginalRow227TriangleData1749.coefficient152_196,
    output := OriginalRow227TriangleData1756.coefficient153_196, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_198, Icur := OriginalRow227TriangleData1749.coefficient152_197,
    output := OriginalRow227TriangleData1756.coefficient153_197, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_199, Icur := OriginalRow227TriangleData1749.coefficient152_198,
    output := OriginalRow227TriangleData1756.coefficient153_198, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_200, Icur := OriginalRow227TriangleData1749.coefficient152_199,
    output := OriginalRow227TriangleData1756.coefficient153_199, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_201, Icur := OriginalRow227TriangleData1749.coefficient152_200,
    output := OriginalRow227TriangleData1756.coefficient153_200, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_202, Icur := OriginalRow227TriangleData1749.coefficient152_201,
    output := OriginalRow227TriangleData1756.coefficient153_201, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_203, Icur := OriginalRow227TriangleData1749.coefficient152_202,
    output := OriginalRow227TriangleData1756.coefficient153_202, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_204, Icur := OriginalRow227TriangleData1749.coefficient152_203,
    output := OriginalRow227TriangleData1756.coefficient153_203, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_205, Icur := OriginalRow227TriangleData1749.coefficient152_204,
    output := OriginalRow227TriangleData1756.coefficient153_204, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_206, Icur := OriginalRow227TriangleData1749.coefficient152_205,
    output := OriginalRow227TriangleData1756.coefficient153_205, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_207, Icur := OriginalRow227TriangleData1749.coefficient152_206,
    output := OriginalRow227TriangleData1756.coefficient153_206, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_208, Icur := OriginalRow227TriangleData1749.coefficient152_207,
    output := OriginalRow227TriangleData1756.coefficient153_207, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_209, Icur := OriginalRow227TriangleData1749.coefficient152_208,
    output := OriginalRow227TriangleData1756.coefficient153_208, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_210, Icur := OriginalRow227TriangleData1749.coefficient152_209,
    output := OriginalRow227TriangleData1756.coefficient153_209, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_211, Icur := OriginalRow227TriangleData1749.coefficient152_210,
    output := OriginalRow227TriangleData1756.coefficient153_210, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_212, Icur := OriginalRow227TriangleData1749.coefficient152_211,
    output := OriginalRow227TriangleData1756.coefficient153_211, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_213, Icur := OriginalRow227TriangleData1749.coefficient152_212,
    output := OriginalRow227TriangleData1756.coefficient153_212, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_214, Icur := OriginalRow227TriangleData1749.coefficient152_213,
    output := OriginalRow227TriangleData1756.coefficient153_213, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_215, Icur := OriginalRow227TriangleData1749.coefficient152_214,
    output := OriginalRow227TriangleData1756.coefficient153_214, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_216, Icur := OriginalRow227TriangleData1750.coefficient152_215,
    output := OriginalRow227TriangleData1756.coefficient153_215, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1740

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1740.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
