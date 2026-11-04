import Grothe.UpperChaos.OriginalRow227TriangleData1169
import Grothe.UpperChaos.OriginalRow227TriangleData1170
import Grothe.UpperChaos.OriginalRow227TriangleData1180
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1164
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_183, Icur := OriginalRow227TriangleData1169.coefficient86_182,
    output := OriginalRow227TriangleData1180.coefficient87_182, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_184, Icur := OriginalRow227TriangleData1169.coefficient86_183,
    output := OriginalRow227TriangleData1180.coefficient87_183, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_185, Icur := OriginalRow227TriangleData1169.coefficient86_184,
    output := OriginalRow227TriangleData1180.coefficient87_184, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_186, Icur := OriginalRow227TriangleData1169.coefficient86_185,
    output := OriginalRow227TriangleData1180.coefficient87_185, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_187, Icur := OriginalRow227TriangleData1169.coefficient86_186,
    output := OriginalRow227TriangleData1180.coefficient87_186, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_188, Icur := OriginalRow227TriangleData1169.coefficient86_187,
    output := OriginalRow227TriangleData1180.coefficient87_187, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_189, Icur := OriginalRow227TriangleData1169.coefficient86_188,
    output := OriginalRow227TriangleData1180.coefficient87_188, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_190, Icur := OriginalRow227TriangleData1169.coefficient86_189,
    output := OriginalRow227TriangleData1180.coefficient87_189, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_191, Icur := OriginalRow227TriangleData1169.coefficient86_190,
    output := OriginalRow227TriangleData1180.coefficient87_190, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_192, Icur := OriginalRow227TriangleData1169.coefficient86_191,
    output := OriginalRow227TriangleData1180.coefficient87_191, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_193, Icur := OriginalRow227TriangleData1169.coefficient86_192,
    output := OriginalRow227TriangleData1180.coefficient87_192, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_194, Icur := OriginalRow227TriangleData1169.coefficient86_193,
    output := OriginalRow227TriangleData1180.coefficient87_193, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_195, Icur := OriginalRow227TriangleData1169.coefficient86_194,
    output := OriginalRow227TriangleData1180.coefficient87_194, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_196, Icur := OriginalRow227TriangleData1169.coefficient86_195,
    output := OriginalRow227TriangleData1180.coefficient87_195, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_197, Icur := OriginalRow227TriangleData1169.coefficient86_196,
    output := OriginalRow227TriangleData1180.coefficient87_196, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_198, Icur := OriginalRow227TriangleData1169.coefficient86_197,
    output := OriginalRow227TriangleData1180.coefficient87_197, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_199, Icur := OriginalRow227TriangleData1169.coefficient86_198,
    output := OriginalRow227TriangleData1180.coefficient87_198, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_200, Icur := OriginalRow227TriangleData1169.coefficient86_199,
    output := OriginalRow227TriangleData1180.coefficient87_199, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_201, Icur := OriginalRow227TriangleData1169.coefficient86_200,
    output := OriginalRow227TriangleData1180.coefficient87_200, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_202, Icur := OriginalRow227TriangleData1169.coefficient86_201,
    output := OriginalRow227TriangleData1180.coefficient87_201, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_203, Icur := OriginalRow227TriangleData1169.coefficient86_202,
    output := OriginalRow227TriangleData1180.coefficient87_202, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_204, Icur := OriginalRow227TriangleData1169.coefficient86_203,
    output := OriginalRow227TriangleData1180.coefficient87_203, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_205, Icur := OriginalRow227TriangleData1169.coefficient86_204,
    output := OriginalRow227TriangleData1180.coefficient87_204, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_206, Icur := OriginalRow227TriangleData1169.coefficient86_205,
    output := OriginalRow227TriangleData1180.coefficient87_205, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_207, Icur := OriginalRow227TriangleData1169.coefficient86_206,
    output := OriginalRow227TriangleData1180.coefficient87_206, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_208, Icur := OriginalRow227TriangleData1169.coefficient86_207,
    output := OriginalRow227TriangleData1180.coefficient87_207, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_209, Icur := OriginalRow227TriangleData1169.coefficient86_208,
    output := OriginalRow227TriangleData1180.coefficient87_208, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_210, Icur := OriginalRow227TriangleData1169.coefficient86_209,
    output := OriginalRow227TriangleData1180.coefficient87_209, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_211, Icur := OriginalRow227TriangleData1169.coefficient86_210,
    output := OriginalRow227TriangleData1180.coefficient87_210, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1169.coefficient86_212, Icur := OriginalRow227TriangleData1169.coefficient86_211,
    output := OriginalRow227TriangleData1180.coefficient87_211, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_213, Icur := OriginalRow227TriangleData1169.coefficient86_212,
    output := OriginalRow227TriangleData1180.coefficient87_212, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_214, Icur := OriginalRow227TriangleData1170.coefficient86_213,
    output := OriginalRow227TriangleData1180.coefficient87_213, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1164

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1164.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
