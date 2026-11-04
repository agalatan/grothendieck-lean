import Grothe.UpperChaos.OriginalRow227TriangleData1741
import Grothe.UpperChaos.OriginalRow227TriangleData1742
import Grothe.UpperChaos.OriginalRow227TriangleData1748
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1732
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_152, Icur := OriginalRow227TriangleData1741.coefficient151_151,
    output := OriginalRow227TriangleData1748.coefficient152_151, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_153, Icur := OriginalRow227TriangleData1741.coefficient151_152,
    output := OriginalRow227TriangleData1748.coefficient152_152, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_154, Icur := OriginalRow227TriangleData1741.coefficient151_153,
    output := OriginalRow227TriangleData1748.coefficient152_153, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_155, Icur := OriginalRow227TriangleData1741.coefficient151_154,
    output := OriginalRow227TriangleData1748.coefficient152_154, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_156, Icur := OriginalRow227TriangleData1741.coefficient151_155,
    output := OriginalRow227TriangleData1748.coefficient152_155, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_157, Icur := OriginalRow227TriangleData1741.coefficient151_156,
    output := OriginalRow227TriangleData1748.coefficient152_156, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_158, Icur := OriginalRow227TriangleData1741.coefficient151_157,
    output := OriginalRow227TriangleData1748.coefficient152_157, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_159, Icur := OriginalRow227TriangleData1741.coefficient151_158,
    output := OriginalRow227TriangleData1748.coefficient152_158, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_160, Icur := OriginalRow227TriangleData1741.coefficient151_159,
    output := OriginalRow227TriangleData1748.coefficient152_159, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_161, Icur := OriginalRow227TriangleData1741.coefficient151_160,
    output := OriginalRow227TriangleData1748.coefficient152_160, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_162, Icur := OriginalRow227TriangleData1741.coefficient151_161,
    output := OriginalRow227TriangleData1748.coefficient152_161, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_163, Icur := OriginalRow227TriangleData1741.coefficient151_162,
    output := OriginalRow227TriangleData1748.coefficient152_162, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_164, Icur := OriginalRow227TriangleData1741.coefficient151_163,
    output := OriginalRow227TriangleData1748.coefficient152_163, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_165, Icur := OriginalRow227TriangleData1741.coefficient151_164,
    output := OriginalRow227TriangleData1748.coefficient152_164, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_166, Icur := OriginalRow227TriangleData1741.coefficient151_165,
    output := OriginalRow227TriangleData1748.coefficient152_165, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_167, Icur := OriginalRow227TriangleData1741.coefficient151_166,
    output := OriginalRow227TriangleData1748.coefficient152_166, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_168, Icur := OriginalRow227TriangleData1741.coefficient151_167,
    output := OriginalRow227TriangleData1748.coefficient152_167, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_169, Icur := OriginalRow227TriangleData1741.coefficient151_168,
    output := OriginalRow227TriangleData1748.coefficient152_168, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_170, Icur := OriginalRow227TriangleData1741.coefficient151_169,
    output := OriginalRow227TriangleData1748.coefficient152_169, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_171, Icur := OriginalRow227TriangleData1741.coefficient151_170,
    output := OriginalRow227TriangleData1748.coefficient152_170, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_172, Icur := OriginalRow227TriangleData1741.coefficient151_171,
    output := OriginalRow227TriangleData1748.coefficient152_171, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_173, Icur := OriginalRow227TriangleData1741.coefficient151_172,
    output := OriginalRow227TriangleData1748.coefficient152_172, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_174, Icur := OriginalRow227TriangleData1741.coefficient151_173,
    output := OriginalRow227TriangleData1748.coefficient152_173, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_175, Icur := OriginalRow227TriangleData1741.coefficient151_174,
    output := OriginalRow227TriangleData1748.coefficient152_174, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_176, Icur := OriginalRow227TriangleData1741.coefficient151_175,
    output := OriginalRow227TriangleData1748.coefficient152_175, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_177, Icur := OriginalRow227TriangleData1741.coefficient151_176,
    output := OriginalRow227TriangleData1748.coefficient152_176, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_178, Icur := OriginalRow227TriangleData1741.coefficient151_177,
    output := OriginalRow227TriangleData1748.coefficient152_177, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_179, Icur := OriginalRow227TriangleData1741.coefficient151_178,
    output := OriginalRow227TriangleData1748.coefficient152_178, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_180, Icur := OriginalRow227TriangleData1741.coefficient151_179,
    output := OriginalRow227TriangleData1748.coefficient152_179, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1741.coefficient151_181, Icur := OriginalRow227TriangleData1741.coefficient151_180,
    output := OriginalRow227TriangleData1748.coefficient152_180, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1742.coefficient151_182, Icur := OriginalRow227TriangleData1741.coefficient151_181,
    output := OriginalRow227TriangleData1748.coefficient152_181, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1742.coefficient151_183, Icur := OriginalRow227TriangleData1742.coefficient151_182,
    output := OriginalRow227TriangleData1748.coefficient152_182, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1732

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1732.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
