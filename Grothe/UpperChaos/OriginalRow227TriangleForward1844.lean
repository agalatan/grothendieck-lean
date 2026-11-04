import Grothe.UpperChaos.OriginalRow227TriangleData1854
import Grothe.UpperChaos.OriginalRow227TriangleData1855
import Grothe.UpperChaos.OriginalRow227TriangleData1860
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1844
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_170, Icur := OriginalRow227TriangleData1854.coefficient169_169,
    output := OriginalRow227TriangleData1860.coefficient170_169, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_171, Icur := OriginalRow227TriangleData1854.coefficient169_170,
    output := OriginalRow227TriangleData1860.coefficient170_170, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_172, Icur := OriginalRow227TriangleData1854.coefficient169_171,
    output := OriginalRow227TriangleData1860.coefficient170_171, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_173, Icur := OriginalRow227TriangleData1854.coefficient169_172,
    output := OriginalRow227TriangleData1860.coefficient170_172, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_174, Icur := OriginalRow227TriangleData1854.coefficient169_173,
    output := OriginalRow227TriangleData1860.coefficient170_173, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_175, Icur := OriginalRow227TriangleData1854.coefficient169_174,
    output := OriginalRow227TriangleData1860.coefficient170_174, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_176, Icur := OriginalRow227TriangleData1854.coefficient169_175,
    output := OriginalRow227TriangleData1860.coefficient170_175, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_177, Icur := OriginalRow227TriangleData1854.coefficient169_176,
    output := OriginalRow227TriangleData1860.coefficient170_176, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_178, Icur := OriginalRow227TriangleData1854.coefficient169_177,
    output := OriginalRow227TriangleData1860.coefficient170_177, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_179, Icur := OriginalRow227TriangleData1854.coefficient169_178,
    output := OriginalRow227TriangleData1860.coefficient170_178, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_180, Icur := OriginalRow227TriangleData1854.coefficient169_179,
    output := OriginalRow227TriangleData1860.coefficient170_179, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_181, Icur := OriginalRow227TriangleData1854.coefficient169_180,
    output := OriginalRow227TriangleData1860.coefficient170_180, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_182, Icur := OriginalRow227TriangleData1854.coefficient169_181,
    output := OriginalRow227TriangleData1860.coefficient170_181, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_183, Icur := OriginalRow227TriangleData1854.coefficient169_182,
    output := OriginalRow227TriangleData1860.coefficient170_182, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_184, Icur := OriginalRow227TriangleData1854.coefficient169_183,
    output := OriginalRow227TriangleData1860.coefficient170_183, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_185, Icur := OriginalRow227TriangleData1854.coefficient169_184,
    output := OriginalRow227TriangleData1860.coefficient170_184, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_186, Icur := OriginalRow227TriangleData1854.coefficient169_185,
    output := OriginalRow227TriangleData1860.coefficient170_185, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_187, Icur := OriginalRow227TriangleData1854.coefficient169_186,
    output := OriginalRow227TriangleData1860.coefficient170_186, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_188, Icur := OriginalRow227TriangleData1854.coefficient169_187,
    output := OriginalRow227TriangleData1860.coefficient170_187, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_189, Icur := OriginalRow227TriangleData1854.coefficient169_188,
    output := OriginalRow227TriangleData1860.coefficient170_188, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_190, Icur := OriginalRow227TriangleData1854.coefficient169_189,
    output := OriginalRow227TriangleData1860.coefficient170_189, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_191, Icur := OriginalRow227TriangleData1854.coefficient169_190,
    output := OriginalRow227TriangleData1860.coefficient170_190, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_192, Icur := OriginalRow227TriangleData1854.coefficient169_191,
    output := OriginalRow227TriangleData1860.coefficient170_191, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_193, Icur := OriginalRow227TriangleData1854.coefficient169_192,
    output := OriginalRow227TriangleData1860.coefficient170_192, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_194, Icur := OriginalRow227TriangleData1854.coefficient169_193,
    output := OriginalRow227TriangleData1860.coefficient170_193, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_195, Icur := OriginalRow227TriangleData1854.coefficient169_194,
    output := OriginalRow227TriangleData1860.coefficient170_194, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_196, Icur := OriginalRow227TriangleData1854.coefficient169_195,
    output := OriginalRow227TriangleData1860.coefficient170_195, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_197, Icur := OriginalRow227TriangleData1854.coefficient169_196,
    output := OriginalRow227TriangleData1860.coefficient170_196, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_198, Icur := OriginalRow227TriangleData1854.coefficient169_197,
    output := OriginalRow227TriangleData1860.coefficient170_197, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1854.coefficient169_199, Icur := OriginalRow227TriangleData1854.coefficient169_198,
    output := OriginalRow227TriangleData1860.coefficient170_198, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1855.coefficient169_200, Icur := OriginalRow227TriangleData1854.coefficient169_199,
    output := OriginalRow227TriangleData1860.coefficient170_199, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1855.coefficient169_201, Icur := OriginalRow227TriangleData1855.coefficient169_200,
    output := OriginalRow227TriangleData1860.coefficient170_200, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1844

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1844.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
