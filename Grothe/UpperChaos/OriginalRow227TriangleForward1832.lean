import Grothe.UpperChaos.OriginalRow227TriangleData1842
import Grothe.UpperChaos.OriginalRow227TriangleData1843
import Grothe.UpperChaos.OriginalRow227TriangleData1848
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1832
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_168, Icur := OriginalRow227TriangleData1842.coefficient167_167,
    output := OriginalRow227TriangleData1848.coefficient168_167, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_169, Icur := OriginalRow227TriangleData1842.coefficient167_168,
    output := OriginalRow227TriangleData1848.coefficient168_168, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_170, Icur := OriginalRow227TriangleData1842.coefficient167_169,
    output := OriginalRow227TriangleData1848.coefficient168_169, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_171, Icur := OriginalRow227TriangleData1842.coefficient167_170,
    output := OriginalRow227TriangleData1848.coefficient168_170, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_172, Icur := OriginalRow227TriangleData1842.coefficient167_171,
    output := OriginalRow227TriangleData1848.coefficient168_171, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_173, Icur := OriginalRow227TriangleData1842.coefficient167_172,
    output := OriginalRow227TriangleData1848.coefficient168_172, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_174, Icur := OriginalRow227TriangleData1842.coefficient167_173,
    output := OriginalRow227TriangleData1848.coefficient168_173, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_175, Icur := OriginalRow227TriangleData1842.coefficient167_174,
    output := OriginalRow227TriangleData1848.coefficient168_174, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_176, Icur := OriginalRow227TriangleData1842.coefficient167_175,
    output := OriginalRow227TriangleData1848.coefficient168_175, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_177, Icur := OriginalRow227TriangleData1842.coefficient167_176,
    output := OriginalRow227TriangleData1848.coefficient168_176, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_178, Icur := OriginalRow227TriangleData1842.coefficient167_177,
    output := OriginalRow227TriangleData1848.coefficient168_177, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_179, Icur := OriginalRow227TriangleData1842.coefficient167_178,
    output := OriginalRow227TriangleData1848.coefficient168_178, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_180, Icur := OriginalRow227TriangleData1842.coefficient167_179,
    output := OriginalRow227TriangleData1848.coefficient168_179, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_181, Icur := OriginalRow227TriangleData1842.coefficient167_180,
    output := OriginalRow227TriangleData1848.coefficient168_180, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_182, Icur := OriginalRow227TriangleData1842.coefficient167_181,
    output := OriginalRow227TriangleData1848.coefficient168_181, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_183, Icur := OriginalRow227TriangleData1842.coefficient167_182,
    output := OriginalRow227TriangleData1848.coefficient168_182, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_184, Icur := OriginalRow227TriangleData1842.coefficient167_183,
    output := OriginalRow227TriangleData1848.coefficient168_183, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_185, Icur := OriginalRow227TriangleData1842.coefficient167_184,
    output := OriginalRow227TriangleData1848.coefficient168_184, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_186, Icur := OriginalRow227TriangleData1842.coefficient167_185,
    output := OriginalRow227TriangleData1848.coefficient168_185, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_187, Icur := OriginalRow227TriangleData1842.coefficient167_186,
    output := OriginalRow227TriangleData1848.coefficient168_186, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_188, Icur := OriginalRow227TriangleData1842.coefficient167_187,
    output := OriginalRow227TriangleData1848.coefficient168_187, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_189, Icur := OriginalRow227TriangleData1842.coefficient167_188,
    output := OriginalRow227TriangleData1848.coefficient168_188, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_190, Icur := OriginalRow227TriangleData1842.coefficient167_189,
    output := OriginalRow227TriangleData1848.coefficient168_189, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_191, Icur := OriginalRow227TriangleData1842.coefficient167_190,
    output := OriginalRow227TriangleData1848.coefficient168_190, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_192, Icur := OriginalRow227TriangleData1842.coefficient167_191,
    output := OriginalRow227TriangleData1848.coefficient168_191, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_193, Icur := OriginalRow227TriangleData1842.coefficient167_192,
    output := OriginalRow227TriangleData1848.coefficient168_192, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_194, Icur := OriginalRow227TriangleData1842.coefficient167_193,
    output := OriginalRow227TriangleData1848.coefficient168_193, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_195, Icur := OriginalRow227TriangleData1842.coefficient167_194,
    output := OriginalRow227TriangleData1848.coefficient168_194, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_196, Icur := OriginalRow227TriangleData1842.coefficient167_195,
    output := OriginalRow227TriangleData1848.coefficient168_195, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1842.coefficient167_197, Icur := OriginalRow227TriangleData1842.coefficient167_196,
    output := OriginalRow227TriangleData1848.coefficient168_196, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1843.coefficient167_198, Icur := OriginalRow227TriangleData1842.coefficient167_197,
    output := OriginalRow227TriangleData1848.coefficient168_197, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root168,
    Inext := OriginalRow227TriangleData1843.coefficient167_199, Icur := OriginalRow227TriangleData1843.coefficient167_198,
    output := OriginalRow227TriangleData1848.coefficient168_198, hC := OriginalRow227TriangleRoots05.root168_pos, hAC := OriginalRow227TriangleRoots05.product168_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1832

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1832.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
