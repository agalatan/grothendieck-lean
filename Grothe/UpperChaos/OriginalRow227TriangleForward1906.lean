import Grothe.UpperChaos.OriginalRow227TriangleData1917
import Grothe.UpperChaos.OriginalRow227TriangleData1918
import Grothe.UpperChaos.OriginalRow227TriangleData1922
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1906
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_182, Icur := OriginalRow227TriangleData1917.coefficient181_181,
    output := OriginalRow227TriangleData1922.coefficient182_181, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_183, Icur := OriginalRow227TriangleData1917.coefficient181_182,
    output := OriginalRow227TriangleData1922.coefficient182_182, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_184, Icur := OriginalRow227TriangleData1917.coefficient181_183,
    output := OriginalRow227TriangleData1922.coefficient182_183, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_185, Icur := OriginalRow227TriangleData1917.coefficient181_184,
    output := OriginalRow227TriangleData1922.coefficient182_184, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_186, Icur := OriginalRow227TriangleData1917.coefficient181_185,
    output := OriginalRow227TriangleData1922.coefficient182_185, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_187, Icur := OriginalRow227TriangleData1917.coefficient181_186,
    output := OriginalRow227TriangleData1922.coefficient182_186, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_188, Icur := OriginalRow227TriangleData1917.coefficient181_187,
    output := OriginalRow227TriangleData1922.coefficient182_187, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_189, Icur := OriginalRow227TriangleData1917.coefficient181_188,
    output := OriginalRow227TriangleData1922.coefficient182_188, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_190, Icur := OriginalRow227TriangleData1917.coefficient181_189,
    output := OriginalRow227TriangleData1922.coefficient182_189, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_191, Icur := OriginalRow227TriangleData1917.coefficient181_190,
    output := OriginalRow227TriangleData1922.coefficient182_190, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_192, Icur := OriginalRow227TriangleData1917.coefficient181_191,
    output := OriginalRow227TriangleData1922.coefficient182_191, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_193, Icur := OriginalRow227TriangleData1917.coefficient181_192,
    output := OriginalRow227TriangleData1922.coefficient182_192, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_194, Icur := OriginalRow227TriangleData1917.coefficient181_193,
    output := OriginalRow227TriangleData1922.coefficient182_193, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_195, Icur := OriginalRow227TriangleData1917.coefficient181_194,
    output := OriginalRow227TriangleData1922.coefficient182_194, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_196, Icur := OriginalRow227TriangleData1917.coefficient181_195,
    output := OriginalRow227TriangleData1922.coefficient182_195, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_197, Icur := OriginalRow227TriangleData1917.coefficient181_196,
    output := OriginalRow227TriangleData1922.coefficient182_196, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_198, Icur := OriginalRow227TriangleData1917.coefficient181_197,
    output := OriginalRow227TriangleData1922.coefficient182_197, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_199, Icur := OriginalRow227TriangleData1917.coefficient181_198,
    output := OriginalRow227TriangleData1922.coefficient182_198, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_200, Icur := OriginalRow227TriangleData1917.coefficient181_199,
    output := OriginalRow227TriangleData1922.coefficient182_199, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_201, Icur := OriginalRow227TriangleData1917.coefficient181_200,
    output := OriginalRow227TriangleData1922.coefficient182_200, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_202, Icur := OriginalRow227TriangleData1917.coefficient181_201,
    output := OriginalRow227TriangleData1922.coefficient182_201, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_203, Icur := OriginalRow227TriangleData1917.coefficient181_202,
    output := OriginalRow227TriangleData1922.coefficient182_202, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_204, Icur := OriginalRow227TriangleData1917.coefficient181_203,
    output := OriginalRow227TriangleData1922.coefficient182_203, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_205, Icur := OriginalRow227TriangleData1917.coefficient181_204,
    output := OriginalRow227TriangleData1922.coefficient182_204, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_206, Icur := OriginalRow227TriangleData1917.coefficient181_205,
    output := OriginalRow227TriangleData1922.coefficient182_205, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_207, Icur := OriginalRow227TriangleData1917.coefficient181_206,
    output := OriginalRow227TriangleData1922.coefficient182_206, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_208, Icur := OriginalRow227TriangleData1917.coefficient181_207,
    output := OriginalRow227TriangleData1922.coefficient182_207, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_209, Icur := OriginalRow227TriangleData1917.coefficient181_208,
    output := OriginalRow227TriangleData1922.coefficient182_208, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_210, Icur := OriginalRow227TriangleData1917.coefficient181_209,
    output := OriginalRow227TriangleData1922.coefficient182_209, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1917.coefficient181_211, Icur := OriginalRow227TriangleData1917.coefficient181_210,
    output := OriginalRow227TriangleData1922.coefficient182_210, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1918.coefficient181_212, Icur := OriginalRow227TriangleData1917.coefficient181_211,
    output := OriginalRow227TriangleData1922.coefficient182_211, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1918.coefficient181_213, Icur := OriginalRow227TriangleData1918.coefficient181_212,
    output := OriginalRow227TriangleData1922.coefficient182_212, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1906

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1906.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
