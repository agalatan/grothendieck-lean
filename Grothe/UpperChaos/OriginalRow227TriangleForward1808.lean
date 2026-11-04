import Grothe.UpperChaos.OriginalRow227TriangleData1818
import Grothe.UpperChaos.OriginalRow227TriangleData1819
import Grothe.UpperChaos.OriginalRow227TriangleData1824
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1808
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_164, Icur := OriginalRow227TriangleData1818.coefficient163_163,
    output := OriginalRow227TriangleData1824.coefficient164_163, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_165, Icur := OriginalRow227TriangleData1818.coefficient163_164,
    output := OriginalRow227TriangleData1824.coefficient164_164, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_166, Icur := OriginalRow227TriangleData1818.coefficient163_165,
    output := OriginalRow227TriangleData1824.coefficient164_165, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_167, Icur := OriginalRow227TriangleData1818.coefficient163_166,
    output := OriginalRow227TriangleData1824.coefficient164_166, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_168, Icur := OriginalRow227TriangleData1818.coefficient163_167,
    output := OriginalRow227TriangleData1824.coefficient164_167, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_169, Icur := OriginalRow227TriangleData1818.coefficient163_168,
    output := OriginalRow227TriangleData1824.coefficient164_168, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_170, Icur := OriginalRow227TriangleData1818.coefficient163_169,
    output := OriginalRow227TriangleData1824.coefficient164_169, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_171, Icur := OriginalRow227TriangleData1818.coefficient163_170,
    output := OriginalRow227TriangleData1824.coefficient164_170, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_172, Icur := OriginalRow227TriangleData1818.coefficient163_171,
    output := OriginalRow227TriangleData1824.coefficient164_171, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_173, Icur := OriginalRow227TriangleData1818.coefficient163_172,
    output := OriginalRow227TriangleData1824.coefficient164_172, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_174, Icur := OriginalRow227TriangleData1818.coefficient163_173,
    output := OriginalRow227TriangleData1824.coefficient164_173, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_175, Icur := OriginalRow227TriangleData1818.coefficient163_174,
    output := OriginalRow227TriangleData1824.coefficient164_174, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_176, Icur := OriginalRow227TriangleData1818.coefficient163_175,
    output := OriginalRow227TriangleData1824.coefficient164_175, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_177, Icur := OriginalRow227TriangleData1818.coefficient163_176,
    output := OriginalRow227TriangleData1824.coefficient164_176, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_178, Icur := OriginalRow227TriangleData1818.coefficient163_177,
    output := OriginalRow227TriangleData1824.coefficient164_177, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_179, Icur := OriginalRow227TriangleData1818.coefficient163_178,
    output := OriginalRow227TriangleData1824.coefficient164_178, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_180, Icur := OriginalRow227TriangleData1818.coefficient163_179,
    output := OriginalRow227TriangleData1824.coefficient164_179, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_181, Icur := OriginalRow227TriangleData1818.coefficient163_180,
    output := OriginalRow227TriangleData1824.coefficient164_180, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_182, Icur := OriginalRow227TriangleData1818.coefficient163_181,
    output := OriginalRow227TriangleData1824.coefficient164_181, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_183, Icur := OriginalRow227TriangleData1818.coefficient163_182,
    output := OriginalRow227TriangleData1824.coefficient164_182, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_184, Icur := OriginalRow227TriangleData1818.coefficient163_183,
    output := OriginalRow227TriangleData1824.coefficient164_183, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_185, Icur := OriginalRow227TriangleData1818.coefficient163_184,
    output := OriginalRow227TriangleData1824.coefficient164_184, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_186, Icur := OriginalRow227TriangleData1818.coefficient163_185,
    output := OriginalRow227TriangleData1824.coefficient164_185, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_187, Icur := OriginalRow227TriangleData1818.coefficient163_186,
    output := OriginalRow227TriangleData1824.coefficient164_186, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_188, Icur := OriginalRow227TriangleData1818.coefficient163_187,
    output := OriginalRow227TriangleData1824.coefficient164_187, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_189, Icur := OriginalRow227TriangleData1818.coefficient163_188,
    output := OriginalRow227TriangleData1824.coefficient164_188, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_190, Icur := OriginalRow227TriangleData1818.coefficient163_189,
    output := OriginalRow227TriangleData1824.coefficient164_189, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_191, Icur := OriginalRow227TriangleData1818.coefficient163_190,
    output := OriginalRow227TriangleData1824.coefficient164_190, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_192, Icur := OriginalRow227TriangleData1818.coefficient163_191,
    output := OriginalRow227TriangleData1824.coefficient164_191, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1818.coefficient163_193, Icur := OriginalRow227TriangleData1818.coefficient163_192,
    output := OriginalRow227TriangleData1824.coefficient164_192, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_194, Icur := OriginalRow227TriangleData1818.coefficient163_193,
    output := OriginalRow227TriangleData1824.coefficient164_193, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1819.coefficient163_195, Icur := OriginalRow227TriangleData1819.coefficient163_194,
    output := OriginalRow227TriangleData1824.coefficient164_194, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1808

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1808.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
