import Grothe.UpperChaos.OriginalRow227TriangleData1576
import Grothe.UpperChaos.OriginalRow227TriangleData1577
import Grothe.UpperChaos.OriginalRow227TriangleData1584
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1568
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_130, Icur := OriginalRow227TriangleData1576.coefficient129_129,
    output := OriginalRow227TriangleData1584.coefficient130_129, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_131, Icur := OriginalRow227TriangleData1576.coefficient129_130,
    output := OriginalRow227TriangleData1584.coefficient130_130, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_132, Icur := OriginalRow227TriangleData1576.coefficient129_131,
    output := OriginalRow227TriangleData1584.coefficient130_131, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_133, Icur := OriginalRow227TriangleData1576.coefficient129_132,
    output := OriginalRow227TriangleData1584.coefficient130_132, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_134, Icur := OriginalRow227TriangleData1576.coefficient129_133,
    output := OriginalRow227TriangleData1584.coefficient130_133, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_135, Icur := OriginalRow227TriangleData1576.coefficient129_134,
    output := OriginalRow227TriangleData1584.coefficient130_134, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_136, Icur := OriginalRow227TriangleData1576.coefficient129_135,
    output := OriginalRow227TriangleData1584.coefficient130_135, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_137, Icur := OriginalRow227TriangleData1576.coefficient129_136,
    output := OriginalRow227TriangleData1584.coefficient130_136, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_138, Icur := OriginalRow227TriangleData1576.coefficient129_137,
    output := OriginalRow227TriangleData1584.coefficient130_137, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_139, Icur := OriginalRow227TriangleData1576.coefficient129_138,
    output := OriginalRow227TriangleData1584.coefficient130_138, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_140, Icur := OriginalRow227TriangleData1576.coefficient129_139,
    output := OriginalRow227TriangleData1584.coefficient130_139, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_141, Icur := OriginalRow227TriangleData1576.coefficient129_140,
    output := OriginalRow227TriangleData1584.coefficient130_140, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_142, Icur := OriginalRow227TriangleData1576.coefficient129_141,
    output := OriginalRow227TriangleData1584.coefficient130_141, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_143, Icur := OriginalRow227TriangleData1576.coefficient129_142,
    output := OriginalRow227TriangleData1584.coefficient130_142, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_144, Icur := OriginalRow227TriangleData1576.coefficient129_143,
    output := OriginalRow227TriangleData1584.coefficient130_143, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_145, Icur := OriginalRow227TriangleData1576.coefficient129_144,
    output := OriginalRow227TriangleData1584.coefficient130_144, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_146, Icur := OriginalRow227TriangleData1576.coefficient129_145,
    output := OriginalRow227TriangleData1584.coefficient130_145, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_147, Icur := OriginalRow227TriangleData1576.coefficient129_146,
    output := OriginalRow227TriangleData1584.coefficient130_146, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_148, Icur := OriginalRow227TriangleData1576.coefficient129_147,
    output := OriginalRow227TriangleData1584.coefficient130_147, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_149, Icur := OriginalRow227TriangleData1576.coefficient129_148,
    output := OriginalRow227TriangleData1584.coefficient130_148, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_150, Icur := OriginalRow227TriangleData1576.coefficient129_149,
    output := OriginalRow227TriangleData1584.coefficient130_149, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_151, Icur := OriginalRow227TriangleData1576.coefficient129_150,
    output := OriginalRow227TriangleData1584.coefficient130_150, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_152, Icur := OriginalRow227TriangleData1576.coefficient129_151,
    output := OriginalRow227TriangleData1584.coefficient130_151, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_153, Icur := OriginalRow227TriangleData1576.coefficient129_152,
    output := OriginalRow227TriangleData1584.coefficient130_152, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_154, Icur := OriginalRow227TriangleData1576.coefficient129_153,
    output := OriginalRow227TriangleData1584.coefficient130_153, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_155, Icur := OriginalRow227TriangleData1576.coefficient129_154,
    output := OriginalRow227TriangleData1584.coefficient130_154, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_156, Icur := OriginalRow227TriangleData1576.coefficient129_155,
    output := OriginalRow227TriangleData1584.coefficient130_155, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_157, Icur := OriginalRow227TriangleData1576.coefficient129_156,
    output := OriginalRow227TriangleData1584.coefficient130_156, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_158, Icur := OriginalRow227TriangleData1576.coefficient129_157,
    output := OriginalRow227TriangleData1584.coefficient130_157, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1576.coefficient129_159, Icur := OriginalRow227TriangleData1576.coefficient129_158,
    output := OriginalRow227TriangleData1584.coefficient130_158, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1577.coefficient129_160, Icur := OriginalRow227TriangleData1576.coefficient129_159,
    output := OriginalRow227TriangleData1584.coefficient130_159, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1577.coefficient129_161, Icur := OriginalRow227TriangleData1577.coefficient129_160,
    output := OriginalRow227TriangleData1584.coefficient130_160, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1568

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1568.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
