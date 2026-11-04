import Grothe.UpperChaos.OriginalRow227TriangleData1092
import Grothe.UpperChaos.OriginalRow227TriangleData1093
import Grothe.UpperChaos.OriginalRow227TriangleData1103
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1087
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_176, Icur := OriginalRow227TriangleData1092.coefficient79_175,
    output := OriginalRow227TriangleData1103.coefficient80_175, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_177, Icur := OriginalRow227TriangleData1092.coefficient79_176,
    output := OriginalRow227TriangleData1103.coefficient80_176, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_178, Icur := OriginalRow227TriangleData1092.coefficient79_177,
    output := OriginalRow227TriangleData1103.coefficient80_177, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_179, Icur := OriginalRow227TriangleData1092.coefficient79_178,
    output := OriginalRow227TriangleData1103.coefficient80_178, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_180, Icur := OriginalRow227TriangleData1092.coefficient79_179,
    output := OriginalRow227TriangleData1103.coefficient80_179, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_181, Icur := OriginalRow227TriangleData1092.coefficient79_180,
    output := OriginalRow227TriangleData1103.coefficient80_180, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_182, Icur := OriginalRow227TriangleData1092.coefficient79_181,
    output := OriginalRow227TriangleData1103.coefficient80_181, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_183, Icur := OriginalRow227TriangleData1092.coefficient79_182,
    output := OriginalRow227TriangleData1103.coefficient80_182, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_184, Icur := OriginalRow227TriangleData1092.coefficient79_183,
    output := OriginalRow227TriangleData1103.coefficient80_183, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_185, Icur := OriginalRow227TriangleData1092.coefficient79_184,
    output := OriginalRow227TriangleData1103.coefficient80_184, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_186, Icur := OriginalRow227TriangleData1092.coefficient79_185,
    output := OriginalRow227TriangleData1103.coefficient80_185, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_187, Icur := OriginalRow227TriangleData1092.coefficient79_186,
    output := OriginalRow227TriangleData1103.coefficient80_186, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_188, Icur := OriginalRow227TriangleData1092.coefficient79_187,
    output := OriginalRow227TriangleData1103.coefficient80_187, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_189, Icur := OriginalRow227TriangleData1092.coefficient79_188,
    output := OriginalRow227TriangleData1103.coefficient80_188, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_190, Icur := OriginalRow227TriangleData1092.coefficient79_189,
    output := OriginalRow227TriangleData1103.coefficient80_189, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_191, Icur := OriginalRow227TriangleData1092.coefficient79_190,
    output := OriginalRow227TriangleData1103.coefficient80_190, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_192, Icur := OriginalRow227TriangleData1092.coefficient79_191,
    output := OriginalRow227TriangleData1103.coefficient80_191, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_193, Icur := OriginalRow227TriangleData1092.coefficient79_192,
    output := OriginalRow227TriangleData1103.coefficient80_192, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_194, Icur := OriginalRow227TriangleData1092.coefficient79_193,
    output := OriginalRow227TriangleData1103.coefficient80_193, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_195, Icur := OriginalRow227TriangleData1092.coefficient79_194,
    output := OriginalRow227TriangleData1103.coefficient80_194, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_196, Icur := OriginalRow227TriangleData1092.coefficient79_195,
    output := OriginalRow227TriangleData1103.coefficient80_195, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_197, Icur := OriginalRow227TriangleData1092.coefficient79_196,
    output := OriginalRow227TriangleData1103.coefficient80_196, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_198, Icur := OriginalRow227TriangleData1092.coefficient79_197,
    output := OriginalRow227TriangleData1103.coefficient80_197, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_199, Icur := OriginalRow227TriangleData1092.coefficient79_198,
    output := OriginalRow227TriangleData1103.coefficient80_198, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_200, Icur := OriginalRow227TriangleData1092.coefficient79_199,
    output := OriginalRow227TriangleData1103.coefficient80_199, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_201, Icur := OriginalRow227TriangleData1092.coefficient79_200,
    output := OriginalRow227TriangleData1103.coefficient80_200, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_202, Icur := OriginalRow227TriangleData1092.coefficient79_201,
    output := OriginalRow227TriangleData1103.coefficient80_201, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_203, Icur := OriginalRow227TriangleData1092.coefficient79_202,
    output := OriginalRow227TriangleData1103.coefficient80_202, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_204, Icur := OriginalRow227TriangleData1092.coefficient79_203,
    output := OriginalRow227TriangleData1103.coefficient80_203, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1092.coefficient79_205, Icur := OriginalRow227TriangleData1092.coefficient79_204,
    output := OriginalRow227TriangleData1103.coefficient80_204, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_206, Icur := OriginalRow227TriangleData1092.coefficient79_205,
    output := OriginalRow227TriangleData1103.coefficient80_205, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_207, Icur := OriginalRow227TriangleData1093.coefficient79_206,
    output := OriginalRow227TriangleData1103.coefficient80_206, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1087

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1087.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
