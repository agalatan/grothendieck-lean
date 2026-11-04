import Grothe.UpperChaos.OriginalRow227TriangleData1860
import Grothe.UpperChaos.OriginalRow227TriangleData1861
import Grothe.UpperChaos.OriginalRow227TriangleData1866
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1850
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_171, Icur := OriginalRow227TriangleData1860.coefficient170_170,
    output := OriginalRow227TriangleData1866.coefficient171_170, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_172, Icur := OriginalRow227TriangleData1860.coefficient170_171,
    output := OriginalRow227TriangleData1866.coefficient171_171, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_173, Icur := OriginalRow227TriangleData1860.coefficient170_172,
    output := OriginalRow227TriangleData1866.coefficient171_172, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_174, Icur := OriginalRow227TriangleData1860.coefficient170_173,
    output := OriginalRow227TriangleData1866.coefficient171_173, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_175, Icur := OriginalRow227TriangleData1860.coefficient170_174,
    output := OriginalRow227TriangleData1866.coefficient171_174, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_176, Icur := OriginalRow227TriangleData1860.coefficient170_175,
    output := OriginalRow227TriangleData1866.coefficient171_175, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_177, Icur := OriginalRow227TriangleData1860.coefficient170_176,
    output := OriginalRow227TriangleData1866.coefficient171_176, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_178, Icur := OriginalRow227TriangleData1860.coefficient170_177,
    output := OriginalRow227TriangleData1866.coefficient171_177, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_179, Icur := OriginalRow227TriangleData1860.coefficient170_178,
    output := OriginalRow227TriangleData1866.coefficient171_178, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_180, Icur := OriginalRow227TriangleData1860.coefficient170_179,
    output := OriginalRow227TriangleData1866.coefficient171_179, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_181, Icur := OriginalRow227TriangleData1860.coefficient170_180,
    output := OriginalRow227TriangleData1866.coefficient171_180, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_182, Icur := OriginalRow227TriangleData1860.coefficient170_181,
    output := OriginalRow227TriangleData1866.coefficient171_181, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_183, Icur := OriginalRow227TriangleData1860.coefficient170_182,
    output := OriginalRow227TriangleData1866.coefficient171_182, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_184, Icur := OriginalRow227TriangleData1860.coefficient170_183,
    output := OriginalRow227TriangleData1866.coefficient171_183, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_185, Icur := OriginalRow227TriangleData1860.coefficient170_184,
    output := OriginalRow227TriangleData1866.coefficient171_184, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_186, Icur := OriginalRow227TriangleData1860.coefficient170_185,
    output := OriginalRow227TriangleData1866.coefficient171_185, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_187, Icur := OriginalRow227TriangleData1860.coefficient170_186,
    output := OriginalRow227TriangleData1866.coefficient171_186, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_188, Icur := OriginalRow227TriangleData1860.coefficient170_187,
    output := OriginalRow227TriangleData1866.coefficient171_187, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_189, Icur := OriginalRow227TriangleData1860.coefficient170_188,
    output := OriginalRow227TriangleData1866.coefficient171_188, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_190, Icur := OriginalRow227TriangleData1860.coefficient170_189,
    output := OriginalRow227TriangleData1866.coefficient171_189, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_191, Icur := OriginalRow227TriangleData1860.coefficient170_190,
    output := OriginalRow227TriangleData1866.coefficient171_190, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_192, Icur := OriginalRow227TriangleData1860.coefficient170_191,
    output := OriginalRow227TriangleData1866.coefficient171_191, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_193, Icur := OriginalRow227TriangleData1860.coefficient170_192,
    output := OriginalRow227TriangleData1866.coefficient171_192, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_194, Icur := OriginalRow227TriangleData1860.coefficient170_193,
    output := OriginalRow227TriangleData1866.coefficient171_193, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_195, Icur := OriginalRow227TriangleData1860.coefficient170_194,
    output := OriginalRow227TriangleData1866.coefficient171_194, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_196, Icur := OriginalRow227TriangleData1860.coefficient170_195,
    output := OriginalRow227TriangleData1866.coefficient171_195, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_197, Icur := OriginalRow227TriangleData1860.coefficient170_196,
    output := OriginalRow227TriangleData1866.coefficient171_196, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_198, Icur := OriginalRow227TriangleData1860.coefficient170_197,
    output := OriginalRow227TriangleData1866.coefficient171_197, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_199, Icur := OriginalRow227TriangleData1860.coefficient170_198,
    output := OriginalRow227TriangleData1866.coefficient171_198, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1860.coefficient170_200, Icur := OriginalRow227TriangleData1860.coefficient170_199,
    output := OriginalRow227TriangleData1866.coefficient171_199, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_201, Icur := OriginalRow227TriangleData1860.coefficient170_200,
    output := OriginalRow227TriangleData1866.coefficient171_200, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_202, Icur := OriginalRow227TriangleData1861.coefficient170_201,
    output := OriginalRow227TriangleData1866.coefficient171_201, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1850

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1850.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
