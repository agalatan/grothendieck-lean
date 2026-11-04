import Grothe.UpperChaos.OriginalRow227TriangleData1932
import Grothe.UpperChaos.OriginalRow227TriangleData1933
import Grothe.UpperChaos.OriginalRow227TriangleData1937
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1921
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_185, Icur := OriginalRow227TriangleData1932.coefficient184_184,
    output := OriginalRow227TriangleData1937.coefficient185_184, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_186, Icur := OriginalRow227TriangleData1932.coefficient184_185,
    output := OriginalRow227TriangleData1937.coefficient185_185, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_187, Icur := OriginalRow227TriangleData1932.coefficient184_186,
    output := OriginalRow227TriangleData1937.coefficient185_186, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_188, Icur := OriginalRow227TriangleData1932.coefficient184_187,
    output := OriginalRow227TriangleData1937.coefficient185_187, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_189, Icur := OriginalRow227TriangleData1932.coefficient184_188,
    output := OriginalRow227TriangleData1937.coefficient185_188, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_190, Icur := OriginalRow227TriangleData1932.coefficient184_189,
    output := OriginalRow227TriangleData1937.coefficient185_189, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_191, Icur := OriginalRow227TriangleData1932.coefficient184_190,
    output := OriginalRow227TriangleData1937.coefficient185_190, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_192, Icur := OriginalRow227TriangleData1932.coefficient184_191,
    output := OriginalRow227TriangleData1937.coefficient185_191, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_193, Icur := OriginalRow227TriangleData1932.coefficient184_192,
    output := OriginalRow227TriangleData1937.coefficient185_192, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_194, Icur := OriginalRow227TriangleData1932.coefficient184_193,
    output := OriginalRow227TriangleData1937.coefficient185_193, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_195, Icur := OriginalRow227TriangleData1932.coefficient184_194,
    output := OriginalRow227TriangleData1937.coefficient185_194, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_196, Icur := OriginalRow227TriangleData1932.coefficient184_195,
    output := OriginalRow227TriangleData1937.coefficient185_195, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_197, Icur := OriginalRow227TriangleData1932.coefficient184_196,
    output := OriginalRow227TriangleData1937.coefficient185_196, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_198, Icur := OriginalRow227TriangleData1932.coefficient184_197,
    output := OriginalRow227TriangleData1937.coefficient185_197, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_199, Icur := OriginalRow227TriangleData1932.coefficient184_198,
    output := OriginalRow227TriangleData1937.coefficient185_198, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_200, Icur := OriginalRow227TriangleData1932.coefficient184_199,
    output := OriginalRow227TriangleData1937.coefficient185_199, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_201, Icur := OriginalRow227TriangleData1932.coefficient184_200,
    output := OriginalRow227TriangleData1937.coefficient185_200, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_202, Icur := OriginalRow227TriangleData1932.coefficient184_201,
    output := OriginalRow227TriangleData1937.coefficient185_201, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_203, Icur := OriginalRow227TriangleData1932.coefficient184_202,
    output := OriginalRow227TriangleData1937.coefficient185_202, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_204, Icur := OriginalRow227TriangleData1932.coefficient184_203,
    output := OriginalRow227TriangleData1937.coefficient185_203, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_205, Icur := OriginalRow227TriangleData1932.coefficient184_204,
    output := OriginalRow227TriangleData1937.coefficient185_204, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_206, Icur := OriginalRow227TriangleData1932.coefficient184_205,
    output := OriginalRow227TriangleData1937.coefficient185_205, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_207, Icur := OriginalRow227TriangleData1932.coefficient184_206,
    output := OriginalRow227TriangleData1937.coefficient185_206, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_208, Icur := OriginalRow227TriangleData1932.coefficient184_207,
    output := OriginalRow227TriangleData1937.coefficient185_207, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_209, Icur := OriginalRow227TriangleData1932.coefficient184_208,
    output := OriginalRow227TriangleData1937.coefficient185_208, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_210, Icur := OriginalRow227TriangleData1932.coefficient184_209,
    output := OriginalRow227TriangleData1937.coefficient185_209, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_211, Icur := OriginalRow227TriangleData1932.coefficient184_210,
    output := OriginalRow227TriangleData1937.coefficient185_210, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_212, Icur := OriginalRow227TriangleData1932.coefficient184_211,
    output := OriginalRow227TriangleData1937.coefficient185_211, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_213, Icur := OriginalRow227TriangleData1932.coefficient184_212,
    output := OriginalRow227TriangleData1937.coefficient185_212, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1932.coefficient184_214, Icur := OriginalRow227TriangleData1932.coefficient184_213,
    output := OriginalRow227TriangleData1937.coefficient185_213, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1933.coefficient184_215, Icur := OriginalRow227TriangleData1932.coefficient184_214,
    output := OriginalRow227TriangleData1937.coefficient185_214, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1933.coefficient184_216, Icur := OriginalRow227TriangleData1933.coefficient184_215,
    output := OriginalRow227TriangleData1937.coefficient185_215, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1921

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1921.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
