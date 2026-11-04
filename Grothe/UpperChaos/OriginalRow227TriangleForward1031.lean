import Grothe.UpperChaos.OriginalRow227TriangleData1035
import Grothe.UpperChaos.OriginalRow227TriangleData1036
import Grothe.UpperChaos.OriginalRow227TriangleData1047
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1031
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_171, Icur := OriginalRow227TriangleData1035.coefficient74_170,
    output := OriginalRow227TriangleData1047.coefficient75_170, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_172, Icur := OriginalRow227TriangleData1035.coefficient74_171,
    output := OriginalRow227TriangleData1047.coefficient75_171, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_173, Icur := OriginalRow227TriangleData1035.coefficient74_172,
    output := OriginalRow227TriangleData1047.coefficient75_172, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_174, Icur := OriginalRow227TriangleData1035.coefficient74_173,
    output := OriginalRow227TriangleData1047.coefficient75_173, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_175, Icur := OriginalRow227TriangleData1035.coefficient74_174,
    output := OriginalRow227TriangleData1047.coefficient75_174, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_176, Icur := OriginalRow227TriangleData1035.coefficient74_175,
    output := OriginalRow227TriangleData1047.coefficient75_175, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_177, Icur := OriginalRow227TriangleData1035.coefficient74_176,
    output := OriginalRow227TriangleData1047.coefficient75_176, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_178, Icur := OriginalRow227TriangleData1035.coefficient74_177,
    output := OriginalRow227TriangleData1047.coefficient75_177, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_179, Icur := OriginalRow227TriangleData1035.coefficient74_178,
    output := OriginalRow227TriangleData1047.coefficient75_178, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_180, Icur := OriginalRow227TriangleData1035.coefficient74_179,
    output := OriginalRow227TriangleData1047.coefficient75_179, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_181, Icur := OriginalRow227TriangleData1035.coefficient74_180,
    output := OriginalRow227TriangleData1047.coefficient75_180, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_182, Icur := OriginalRow227TriangleData1035.coefficient74_181,
    output := OriginalRow227TriangleData1047.coefficient75_181, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_183, Icur := OriginalRow227TriangleData1035.coefficient74_182,
    output := OriginalRow227TriangleData1047.coefficient75_182, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_184, Icur := OriginalRow227TriangleData1035.coefficient74_183,
    output := OriginalRow227TriangleData1047.coefficient75_183, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_185, Icur := OriginalRow227TriangleData1035.coefficient74_184,
    output := OriginalRow227TriangleData1047.coefficient75_184, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_186, Icur := OriginalRow227TriangleData1035.coefficient74_185,
    output := OriginalRow227TriangleData1047.coefficient75_185, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_187, Icur := OriginalRow227TriangleData1035.coefficient74_186,
    output := OriginalRow227TriangleData1047.coefficient75_186, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_188, Icur := OriginalRow227TriangleData1035.coefficient74_187,
    output := OriginalRow227TriangleData1047.coefficient75_187, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_189, Icur := OriginalRow227TriangleData1035.coefficient74_188,
    output := OriginalRow227TriangleData1047.coefficient75_188, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_190, Icur := OriginalRow227TriangleData1035.coefficient74_189,
    output := OriginalRow227TriangleData1047.coefficient75_189, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_191, Icur := OriginalRow227TriangleData1035.coefficient74_190,
    output := OriginalRow227TriangleData1047.coefficient75_190, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_192, Icur := OriginalRow227TriangleData1035.coefficient74_191,
    output := OriginalRow227TriangleData1047.coefficient75_191, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_193, Icur := OriginalRow227TriangleData1035.coefficient74_192,
    output := OriginalRow227TriangleData1047.coefficient75_192, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_194, Icur := OriginalRow227TriangleData1035.coefficient74_193,
    output := OriginalRow227TriangleData1047.coefficient75_193, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_195, Icur := OriginalRow227TriangleData1035.coefficient74_194,
    output := OriginalRow227TriangleData1047.coefficient75_194, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_196, Icur := OriginalRow227TriangleData1035.coefficient74_195,
    output := OriginalRow227TriangleData1047.coefficient75_195, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_197, Icur := OriginalRow227TriangleData1035.coefficient74_196,
    output := OriginalRow227TriangleData1047.coefficient75_196, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_198, Icur := OriginalRow227TriangleData1035.coefficient74_197,
    output := OriginalRow227TriangleData1047.coefficient75_197, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_199, Icur := OriginalRow227TriangleData1035.coefficient74_198,
    output := OriginalRow227TriangleData1047.coefficient75_198, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1035.coefficient74_200, Icur := OriginalRow227TriangleData1035.coefficient74_199,
    output := OriginalRow227TriangleData1047.coefficient75_199, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1036.coefficient74_201, Icur := OriginalRow227TriangleData1035.coefficient74_200,
    output := OriginalRow227TriangleData1047.coefficient75_200, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1036.coefficient74_202, Icur := OriginalRow227TriangleData1036.coefficient74_201,
    output := OriginalRow227TriangleData1047.coefficient75_201, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1031

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1031.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
