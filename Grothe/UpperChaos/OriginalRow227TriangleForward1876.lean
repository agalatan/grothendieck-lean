import Grothe.UpperChaos.OriginalRow227TriangleData1887
import Grothe.UpperChaos.OriginalRow227TriangleData1888
import Grothe.UpperChaos.OriginalRow227TriangleData1892
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1876
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_176, Icur := OriginalRow227TriangleData1887.coefficient175_175,
    output := OriginalRow227TriangleData1892.coefficient176_175, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_177, Icur := OriginalRow227TriangleData1887.coefficient175_176,
    output := OriginalRow227TriangleData1892.coefficient176_176, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_178, Icur := OriginalRow227TriangleData1887.coefficient175_177,
    output := OriginalRow227TriangleData1892.coefficient176_177, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_179, Icur := OriginalRow227TriangleData1887.coefficient175_178,
    output := OriginalRow227TriangleData1892.coefficient176_178, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_180, Icur := OriginalRow227TriangleData1887.coefficient175_179,
    output := OriginalRow227TriangleData1892.coefficient176_179, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_181, Icur := OriginalRow227TriangleData1887.coefficient175_180,
    output := OriginalRow227TriangleData1892.coefficient176_180, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_182, Icur := OriginalRow227TriangleData1887.coefficient175_181,
    output := OriginalRow227TriangleData1892.coefficient176_181, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_183, Icur := OriginalRow227TriangleData1887.coefficient175_182,
    output := OriginalRow227TriangleData1892.coefficient176_182, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_184, Icur := OriginalRow227TriangleData1887.coefficient175_183,
    output := OriginalRow227TriangleData1892.coefficient176_183, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_185, Icur := OriginalRow227TriangleData1887.coefficient175_184,
    output := OriginalRow227TriangleData1892.coefficient176_184, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_186, Icur := OriginalRow227TriangleData1887.coefficient175_185,
    output := OriginalRow227TriangleData1892.coefficient176_185, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_187, Icur := OriginalRow227TriangleData1887.coefficient175_186,
    output := OriginalRow227TriangleData1892.coefficient176_186, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_188, Icur := OriginalRow227TriangleData1887.coefficient175_187,
    output := OriginalRow227TriangleData1892.coefficient176_187, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_189, Icur := OriginalRow227TriangleData1887.coefficient175_188,
    output := OriginalRow227TriangleData1892.coefficient176_188, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_190, Icur := OriginalRow227TriangleData1887.coefficient175_189,
    output := OriginalRow227TriangleData1892.coefficient176_189, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_191, Icur := OriginalRow227TriangleData1887.coefficient175_190,
    output := OriginalRow227TriangleData1892.coefficient176_190, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_192, Icur := OriginalRow227TriangleData1887.coefficient175_191,
    output := OriginalRow227TriangleData1892.coefficient176_191, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_193, Icur := OriginalRow227TriangleData1887.coefficient175_192,
    output := OriginalRow227TriangleData1892.coefficient176_192, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_194, Icur := OriginalRow227TriangleData1887.coefficient175_193,
    output := OriginalRow227TriangleData1892.coefficient176_193, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_195, Icur := OriginalRow227TriangleData1887.coefficient175_194,
    output := OriginalRow227TriangleData1892.coefficient176_194, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_196, Icur := OriginalRow227TriangleData1887.coefficient175_195,
    output := OriginalRow227TriangleData1892.coefficient176_195, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_197, Icur := OriginalRow227TriangleData1887.coefficient175_196,
    output := OriginalRow227TriangleData1892.coefficient176_196, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_198, Icur := OriginalRow227TriangleData1887.coefficient175_197,
    output := OriginalRow227TriangleData1892.coefficient176_197, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_199, Icur := OriginalRow227TriangleData1887.coefficient175_198,
    output := OriginalRow227TriangleData1892.coefficient176_198, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_200, Icur := OriginalRow227TriangleData1887.coefficient175_199,
    output := OriginalRow227TriangleData1892.coefficient176_199, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_201, Icur := OriginalRow227TriangleData1887.coefficient175_200,
    output := OriginalRow227TriangleData1892.coefficient176_200, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_202, Icur := OriginalRow227TriangleData1887.coefficient175_201,
    output := OriginalRow227TriangleData1892.coefficient176_201, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_203, Icur := OriginalRow227TriangleData1887.coefficient175_202,
    output := OriginalRow227TriangleData1892.coefficient176_202, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_204, Icur := OriginalRow227TriangleData1887.coefficient175_203,
    output := OriginalRow227TriangleData1892.coefficient176_203, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1887.coefficient175_205, Icur := OriginalRow227TriangleData1887.coefficient175_204,
    output := OriginalRow227TriangleData1892.coefficient176_204, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1888.coefficient175_206, Icur := OriginalRow227TriangleData1887.coefficient175_205,
    output := OriginalRow227TriangleData1892.coefficient176_205, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root176,
    Inext := OriginalRow227TriangleData1888.coefficient175_207, Icur := OriginalRow227TriangleData1888.coefficient175_206,
    output := OriginalRow227TriangleData1892.coefficient176_206, hC := OriginalRow227TriangleRoots05.root176_pos, hAC := OriginalRow227TriangleRoots05.product176_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1876

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1876.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
