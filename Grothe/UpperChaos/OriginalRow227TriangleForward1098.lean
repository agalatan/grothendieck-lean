import Grothe.UpperChaos.OriginalRow227TriangleData1103
import Grothe.UpperChaos.OriginalRow227TriangleData1104
import Grothe.UpperChaos.OriginalRow227TriangleData1114
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1098
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_177, Icur := OriginalRow227TriangleData1103.coefficient80_176,
    output := OriginalRow227TriangleData1114.coefficient81_176, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_178, Icur := OriginalRow227TriangleData1103.coefficient80_177,
    output := OriginalRow227TriangleData1114.coefficient81_177, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_179, Icur := OriginalRow227TriangleData1103.coefficient80_178,
    output := OriginalRow227TriangleData1114.coefficient81_178, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_180, Icur := OriginalRow227TriangleData1103.coefficient80_179,
    output := OriginalRow227TriangleData1114.coefficient81_179, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_181, Icur := OriginalRow227TriangleData1103.coefficient80_180,
    output := OriginalRow227TriangleData1114.coefficient81_180, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_182, Icur := OriginalRow227TriangleData1103.coefficient80_181,
    output := OriginalRow227TriangleData1114.coefficient81_181, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_183, Icur := OriginalRow227TriangleData1103.coefficient80_182,
    output := OriginalRow227TriangleData1114.coefficient81_182, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_184, Icur := OriginalRow227TriangleData1103.coefficient80_183,
    output := OriginalRow227TriangleData1114.coefficient81_183, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_185, Icur := OriginalRow227TriangleData1103.coefficient80_184,
    output := OriginalRow227TriangleData1114.coefficient81_184, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_186, Icur := OriginalRow227TriangleData1103.coefficient80_185,
    output := OriginalRow227TriangleData1114.coefficient81_185, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_187, Icur := OriginalRow227TriangleData1103.coefficient80_186,
    output := OriginalRow227TriangleData1114.coefficient81_186, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_188, Icur := OriginalRow227TriangleData1103.coefficient80_187,
    output := OriginalRow227TriangleData1114.coefficient81_187, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_189, Icur := OriginalRow227TriangleData1103.coefficient80_188,
    output := OriginalRow227TriangleData1114.coefficient81_188, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_190, Icur := OriginalRow227TriangleData1103.coefficient80_189,
    output := OriginalRow227TriangleData1114.coefficient81_189, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_191, Icur := OriginalRow227TriangleData1103.coefficient80_190,
    output := OriginalRow227TriangleData1114.coefficient81_190, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_192, Icur := OriginalRow227TriangleData1103.coefficient80_191,
    output := OriginalRow227TriangleData1114.coefficient81_191, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_193, Icur := OriginalRow227TriangleData1103.coefficient80_192,
    output := OriginalRow227TriangleData1114.coefficient81_192, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_194, Icur := OriginalRow227TriangleData1103.coefficient80_193,
    output := OriginalRow227TriangleData1114.coefficient81_193, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_195, Icur := OriginalRow227TriangleData1103.coefficient80_194,
    output := OriginalRow227TriangleData1114.coefficient81_194, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_196, Icur := OriginalRow227TriangleData1103.coefficient80_195,
    output := OriginalRow227TriangleData1114.coefficient81_195, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_197, Icur := OriginalRow227TriangleData1103.coefficient80_196,
    output := OriginalRow227TriangleData1114.coefficient81_196, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_198, Icur := OriginalRow227TriangleData1103.coefficient80_197,
    output := OriginalRow227TriangleData1114.coefficient81_197, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_199, Icur := OriginalRow227TriangleData1103.coefficient80_198,
    output := OriginalRow227TriangleData1114.coefficient81_198, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_200, Icur := OriginalRow227TriangleData1103.coefficient80_199,
    output := OriginalRow227TriangleData1114.coefficient81_199, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_201, Icur := OriginalRow227TriangleData1103.coefficient80_200,
    output := OriginalRow227TriangleData1114.coefficient81_200, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_202, Icur := OriginalRow227TriangleData1103.coefficient80_201,
    output := OriginalRow227TriangleData1114.coefficient81_201, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_203, Icur := OriginalRow227TriangleData1103.coefficient80_202,
    output := OriginalRow227TriangleData1114.coefficient81_202, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_204, Icur := OriginalRow227TriangleData1103.coefficient80_203,
    output := OriginalRow227TriangleData1114.coefficient81_203, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_205, Icur := OriginalRow227TriangleData1103.coefficient80_204,
    output := OriginalRow227TriangleData1114.coefficient81_204, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1103.coefficient80_206, Icur := OriginalRow227TriangleData1103.coefficient80_205,
    output := OriginalRow227TriangleData1114.coefficient81_205, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_207, Icur := OriginalRow227TriangleData1103.coefficient80_206,
    output := OriginalRow227TriangleData1114.coefficient81_206, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_208, Icur := OriginalRow227TriangleData1104.coefficient80_207,
    output := OriginalRow227TriangleData1114.coefficient81_207, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1098

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1098.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
