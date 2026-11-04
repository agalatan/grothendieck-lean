import Grothe.UpperChaos.OriginalRow227TriangleData1686
import Grothe.UpperChaos.OriginalRow227TriangleData1687
import Grothe.UpperChaos.OriginalRow227TriangleData1693
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1677
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_176, Icur := OriginalRow227TriangleData1686.coefficient143_175,
    output := OriginalRow227TriangleData1693.coefficient144_175, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_177, Icur := OriginalRow227TriangleData1686.coefficient143_176,
    output := OriginalRow227TriangleData1693.coefficient144_176, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_178, Icur := OriginalRow227TriangleData1686.coefficient143_177,
    output := OriginalRow227TriangleData1693.coefficient144_177, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_179, Icur := OriginalRow227TriangleData1686.coefficient143_178,
    output := OriginalRow227TriangleData1693.coefficient144_178, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_180, Icur := OriginalRow227TriangleData1686.coefficient143_179,
    output := OriginalRow227TriangleData1693.coefficient144_179, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_181, Icur := OriginalRow227TriangleData1686.coefficient143_180,
    output := OriginalRow227TriangleData1693.coefficient144_180, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_182, Icur := OriginalRow227TriangleData1686.coefficient143_181,
    output := OriginalRow227TriangleData1693.coefficient144_181, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_183, Icur := OriginalRow227TriangleData1686.coefficient143_182,
    output := OriginalRow227TriangleData1693.coefficient144_182, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_184, Icur := OriginalRow227TriangleData1686.coefficient143_183,
    output := OriginalRow227TriangleData1693.coefficient144_183, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_185, Icur := OriginalRow227TriangleData1686.coefficient143_184,
    output := OriginalRow227TriangleData1693.coefficient144_184, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_186, Icur := OriginalRow227TriangleData1686.coefficient143_185,
    output := OriginalRow227TriangleData1693.coefficient144_185, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_187, Icur := OriginalRow227TriangleData1686.coefficient143_186,
    output := OriginalRow227TriangleData1693.coefficient144_186, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_188, Icur := OriginalRow227TriangleData1686.coefficient143_187,
    output := OriginalRow227TriangleData1693.coefficient144_187, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_189, Icur := OriginalRow227TriangleData1686.coefficient143_188,
    output := OriginalRow227TriangleData1693.coefficient144_188, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_190, Icur := OriginalRow227TriangleData1686.coefficient143_189,
    output := OriginalRow227TriangleData1693.coefficient144_189, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_191, Icur := OriginalRow227TriangleData1686.coefficient143_190,
    output := OriginalRow227TriangleData1693.coefficient144_190, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_192, Icur := OriginalRow227TriangleData1686.coefficient143_191,
    output := OriginalRow227TriangleData1693.coefficient144_191, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_193, Icur := OriginalRow227TriangleData1686.coefficient143_192,
    output := OriginalRow227TriangleData1693.coefficient144_192, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_194, Icur := OriginalRow227TriangleData1686.coefficient143_193,
    output := OriginalRow227TriangleData1693.coefficient144_193, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_195, Icur := OriginalRow227TriangleData1686.coefficient143_194,
    output := OriginalRow227TriangleData1693.coefficient144_194, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_196, Icur := OriginalRow227TriangleData1686.coefficient143_195,
    output := OriginalRow227TriangleData1693.coefficient144_195, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_197, Icur := OriginalRow227TriangleData1686.coefficient143_196,
    output := OriginalRow227TriangleData1693.coefficient144_196, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_198, Icur := OriginalRow227TriangleData1686.coefficient143_197,
    output := OriginalRow227TriangleData1693.coefficient144_197, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_199, Icur := OriginalRow227TriangleData1686.coefficient143_198,
    output := OriginalRow227TriangleData1693.coefficient144_198, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_200, Icur := OriginalRow227TriangleData1686.coefficient143_199,
    output := OriginalRow227TriangleData1693.coefficient144_199, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_201, Icur := OriginalRow227TriangleData1686.coefficient143_200,
    output := OriginalRow227TriangleData1693.coefficient144_200, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_202, Icur := OriginalRow227TriangleData1686.coefficient143_201,
    output := OriginalRow227TriangleData1693.coefficient144_201, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_203, Icur := OriginalRow227TriangleData1686.coefficient143_202,
    output := OriginalRow227TriangleData1693.coefficient144_202, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_204, Icur := OriginalRow227TriangleData1686.coefficient143_203,
    output := OriginalRow227TriangleData1693.coefficient144_203, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_205, Icur := OriginalRow227TriangleData1686.coefficient143_204,
    output := OriginalRow227TriangleData1693.coefficient144_204, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1687.coefficient143_206, Icur := OriginalRow227TriangleData1686.coefficient143_205,
    output := OriginalRow227TriangleData1693.coefficient144_205, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1687.coefficient143_207, Icur := OriginalRow227TriangleData1687.coefficient143_206,
    output := OriginalRow227TriangleData1693.coefficient144_206, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1677

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1677.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
