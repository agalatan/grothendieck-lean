import Grothe.UpperChaos.OriginalRow227TriangleData1125
import Grothe.UpperChaos.OriginalRow227TriangleData1126
import Grothe.UpperChaos.OriginalRow227TriangleData1136
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1120
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_179, Icur := OriginalRow227TriangleData1125.coefficient82_178,
    output := OriginalRow227TriangleData1136.coefficient83_178, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_180, Icur := OriginalRow227TriangleData1125.coefficient82_179,
    output := OriginalRow227TriangleData1136.coefficient83_179, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_181, Icur := OriginalRow227TriangleData1125.coefficient82_180,
    output := OriginalRow227TriangleData1136.coefficient83_180, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_182, Icur := OriginalRow227TriangleData1125.coefficient82_181,
    output := OriginalRow227TriangleData1136.coefficient83_181, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_183, Icur := OriginalRow227TriangleData1125.coefficient82_182,
    output := OriginalRow227TriangleData1136.coefficient83_182, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_184, Icur := OriginalRow227TriangleData1125.coefficient82_183,
    output := OriginalRow227TriangleData1136.coefficient83_183, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_185, Icur := OriginalRow227TriangleData1125.coefficient82_184,
    output := OriginalRow227TriangleData1136.coefficient83_184, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_186, Icur := OriginalRow227TriangleData1125.coefficient82_185,
    output := OriginalRow227TriangleData1136.coefficient83_185, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_187, Icur := OriginalRow227TriangleData1125.coefficient82_186,
    output := OriginalRow227TriangleData1136.coefficient83_186, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_188, Icur := OriginalRow227TriangleData1125.coefficient82_187,
    output := OriginalRow227TriangleData1136.coefficient83_187, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_189, Icur := OriginalRow227TriangleData1125.coefficient82_188,
    output := OriginalRow227TriangleData1136.coefficient83_188, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_190, Icur := OriginalRow227TriangleData1125.coefficient82_189,
    output := OriginalRow227TriangleData1136.coefficient83_189, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_191, Icur := OriginalRow227TriangleData1125.coefficient82_190,
    output := OriginalRow227TriangleData1136.coefficient83_190, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_192, Icur := OriginalRow227TriangleData1125.coefficient82_191,
    output := OriginalRow227TriangleData1136.coefficient83_191, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_193, Icur := OriginalRow227TriangleData1125.coefficient82_192,
    output := OriginalRow227TriangleData1136.coefficient83_192, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_194, Icur := OriginalRow227TriangleData1125.coefficient82_193,
    output := OriginalRow227TriangleData1136.coefficient83_193, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_195, Icur := OriginalRow227TriangleData1125.coefficient82_194,
    output := OriginalRow227TriangleData1136.coefficient83_194, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_196, Icur := OriginalRow227TriangleData1125.coefficient82_195,
    output := OriginalRow227TriangleData1136.coefficient83_195, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_197, Icur := OriginalRow227TriangleData1125.coefficient82_196,
    output := OriginalRow227TriangleData1136.coefficient83_196, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_198, Icur := OriginalRow227TriangleData1125.coefficient82_197,
    output := OriginalRow227TriangleData1136.coefficient83_197, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_199, Icur := OriginalRow227TriangleData1125.coefficient82_198,
    output := OriginalRow227TriangleData1136.coefficient83_198, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_200, Icur := OriginalRow227TriangleData1125.coefficient82_199,
    output := OriginalRow227TriangleData1136.coefficient83_199, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_201, Icur := OriginalRow227TriangleData1125.coefficient82_200,
    output := OriginalRow227TriangleData1136.coefficient83_200, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_202, Icur := OriginalRow227TriangleData1125.coefficient82_201,
    output := OriginalRow227TriangleData1136.coefficient83_201, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_203, Icur := OriginalRow227TriangleData1125.coefficient82_202,
    output := OriginalRow227TriangleData1136.coefficient83_202, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_204, Icur := OriginalRow227TriangleData1125.coefficient82_203,
    output := OriginalRow227TriangleData1136.coefficient83_203, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_205, Icur := OriginalRow227TriangleData1125.coefficient82_204,
    output := OriginalRow227TriangleData1136.coefficient83_204, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_206, Icur := OriginalRow227TriangleData1125.coefficient82_205,
    output := OriginalRow227TriangleData1136.coefficient83_205, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_207, Icur := OriginalRow227TriangleData1125.coefficient82_206,
    output := OriginalRow227TriangleData1136.coefficient83_206, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1125.coefficient82_208, Icur := OriginalRow227TriangleData1125.coefficient82_207,
    output := OriginalRow227TriangleData1136.coefficient83_207, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1126.coefficient82_209, Icur := OriginalRow227TriangleData1125.coefficient82_208,
    output := OriginalRow227TriangleData1136.coefficient83_208, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1126.coefficient82_210, Icur := OriginalRow227TriangleData1126.coefficient82_209,
    output := OriginalRow227TriangleData1136.coefficient83_209, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1120

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1120.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
