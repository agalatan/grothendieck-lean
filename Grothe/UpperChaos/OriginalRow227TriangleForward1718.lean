import Grothe.UpperChaos.OriginalRow227TriangleData1727
import Grothe.UpperChaos.OriginalRow227TriangleData1728
import Grothe.UpperChaos.OriginalRow227TriangleData1734
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1718
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_150, Icur := OriginalRow227TriangleData1727.coefficient149_149,
    output := OriginalRow227TriangleData1734.coefficient150_149, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_151, Icur := OriginalRow227TriangleData1727.coefficient149_150,
    output := OriginalRow227TriangleData1734.coefficient150_150, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_152, Icur := OriginalRow227TriangleData1727.coefficient149_151,
    output := OriginalRow227TriangleData1734.coefficient150_151, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_153, Icur := OriginalRow227TriangleData1727.coefficient149_152,
    output := OriginalRow227TriangleData1734.coefficient150_152, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_154, Icur := OriginalRow227TriangleData1727.coefficient149_153,
    output := OriginalRow227TriangleData1734.coefficient150_153, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_155, Icur := OriginalRow227TriangleData1727.coefficient149_154,
    output := OriginalRow227TriangleData1734.coefficient150_154, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_156, Icur := OriginalRow227TriangleData1727.coefficient149_155,
    output := OriginalRow227TriangleData1734.coefficient150_155, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_157, Icur := OriginalRow227TriangleData1727.coefficient149_156,
    output := OriginalRow227TriangleData1734.coefficient150_156, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_158, Icur := OriginalRow227TriangleData1727.coefficient149_157,
    output := OriginalRow227TriangleData1734.coefficient150_157, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_159, Icur := OriginalRow227TriangleData1727.coefficient149_158,
    output := OriginalRow227TriangleData1734.coefficient150_158, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_160, Icur := OriginalRow227TriangleData1727.coefficient149_159,
    output := OriginalRow227TriangleData1734.coefficient150_159, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_161, Icur := OriginalRow227TriangleData1727.coefficient149_160,
    output := OriginalRow227TriangleData1734.coefficient150_160, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_162, Icur := OriginalRow227TriangleData1727.coefficient149_161,
    output := OriginalRow227TriangleData1734.coefficient150_161, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_163, Icur := OriginalRow227TriangleData1727.coefficient149_162,
    output := OriginalRow227TriangleData1734.coefficient150_162, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_164, Icur := OriginalRow227TriangleData1727.coefficient149_163,
    output := OriginalRow227TriangleData1734.coefficient150_163, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_165, Icur := OriginalRow227TriangleData1727.coefficient149_164,
    output := OriginalRow227TriangleData1734.coefficient150_164, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_166, Icur := OriginalRow227TriangleData1727.coefficient149_165,
    output := OriginalRow227TriangleData1734.coefficient150_165, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_167, Icur := OriginalRow227TriangleData1727.coefficient149_166,
    output := OriginalRow227TriangleData1734.coefficient150_166, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_168, Icur := OriginalRow227TriangleData1727.coefficient149_167,
    output := OriginalRow227TriangleData1734.coefficient150_167, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_169, Icur := OriginalRow227TriangleData1727.coefficient149_168,
    output := OriginalRow227TriangleData1734.coefficient150_168, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_170, Icur := OriginalRow227TriangleData1727.coefficient149_169,
    output := OriginalRow227TriangleData1734.coefficient150_169, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_171, Icur := OriginalRow227TriangleData1727.coefficient149_170,
    output := OriginalRow227TriangleData1734.coefficient150_170, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_172, Icur := OriginalRow227TriangleData1727.coefficient149_171,
    output := OriginalRow227TriangleData1734.coefficient150_171, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_173, Icur := OriginalRow227TriangleData1727.coefficient149_172,
    output := OriginalRow227TriangleData1734.coefficient150_172, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_174, Icur := OriginalRow227TriangleData1727.coefficient149_173,
    output := OriginalRow227TriangleData1734.coefficient150_173, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_175, Icur := OriginalRow227TriangleData1727.coefficient149_174,
    output := OriginalRow227TriangleData1734.coefficient150_174, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_176, Icur := OriginalRow227TriangleData1727.coefficient149_175,
    output := OriginalRow227TriangleData1734.coefficient150_175, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_177, Icur := OriginalRow227TriangleData1727.coefficient149_176,
    output := OriginalRow227TriangleData1734.coefficient150_176, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_178, Icur := OriginalRow227TriangleData1727.coefficient149_177,
    output := OriginalRow227TriangleData1734.coefficient150_177, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1727.coefficient149_179, Icur := OriginalRow227TriangleData1727.coefficient149_178,
    output := OriginalRow227TriangleData1734.coefficient150_178, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1728.coefficient149_180, Icur := OriginalRow227TriangleData1727.coefficient149_179,
    output := OriginalRow227TriangleData1734.coefficient150_179, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1728.coefficient149_181, Icur := OriginalRow227TriangleData1728.coefficient149_180,
    output := OriginalRow227TriangleData1734.coefficient150_180, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1718

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1718.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
