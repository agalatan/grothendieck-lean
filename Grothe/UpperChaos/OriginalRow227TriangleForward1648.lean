import Grothe.UpperChaos.OriginalRow227TriangleData1656
import Grothe.UpperChaos.OriginalRow227TriangleData1657
import Grothe.UpperChaos.OriginalRow227TriangleData1664
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1648
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_140, Icur := OriginalRow227TriangleData1656.coefficient139_139,
    output := OriginalRow227TriangleData1664.coefficient140_139, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_141, Icur := OriginalRow227TriangleData1656.coefficient139_140,
    output := OriginalRow227TriangleData1664.coefficient140_140, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_142, Icur := OriginalRow227TriangleData1656.coefficient139_141,
    output := OriginalRow227TriangleData1664.coefficient140_141, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_143, Icur := OriginalRow227TriangleData1656.coefficient139_142,
    output := OriginalRow227TriangleData1664.coefficient140_142, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_144, Icur := OriginalRow227TriangleData1656.coefficient139_143,
    output := OriginalRow227TriangleData1664.coefficient140_143, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_145, Icur := OriginalRow227TriangleData1656.coefficient139_144,
    output := OriginalRow227TriangleData1664.coefficient140_144, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_146, Icur := OriginalRow227TriangleData1656.coefficient139_145,
    output := OriginalRow227TriangleData1664.coefficient140_145, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_147, Icur := OriginalRow227TriangleData1656.coefficient139_146,
    output := OriginalRow227TriangleData1664.coefficient140_146, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_148, Icur := OriginalRow227TriangleData1656.coefficient139_147,
    output := OriginalRow227TriangleData1664.coefficient140_147, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_149, Icur := OriginalRow227TriangleData1656.coefficient139_148,
    output := OriginalRow227TriangleData1664.coefficient140_148, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_150, Icur := OriginalRow227TriangleData1656.coefficient139_149,
    output := OriginalRow227TriangleData1664.coefficient140_149, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_151, Icur := OriginalRow227TriangleData1656.coefficient139_150,
    output := OriginalRow227TriangleData1664.coefficient140_150, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_152, Icur := OriginalRow227TriangleData1656.coefficient139_151,
    output := OriginalRow227TriangleData1664.coefficient140_151, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_153, Icur := OriginalRow227TriangleData1656.coefficient139_152,
    output := OriginalRow227TriangleData1664.coefficient140_152, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_154, Icur := OriginalRow227TriangleData1656.coefficient139_153,
    output := OriginalRow227TriangleData1664.coefficient140_153, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_155, Icur := OriginalRow227TriangleData1656.coefficient139_154,
    output := OriginalRow227TriangleData1664.coefficient140_154, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_156, Icur := OriginalRow227TriangleData1656.coefficient139_155,
    output := OriginalRow227TriangleData1664.coefficient140_155, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_157, Icur := OriginalRow227TriangleData1656.coefficient139_156,
    output := OriginalRow227TriangleData1664.coefficient140_156, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_158, Icur := OriginalRow227TriangleData1656.coefficient139_157,
    output := OriginalRow227TriangleData1664.coefficient140_157, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_159, Icur := OriginalRow227TriangleData1656.coefficient139_158,
    output := OriginalRow227TriangleData1664.coefficient140_158, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_160, Icur := OriginalRow227TriangleData1656.coefficient139_159,
    output := OriginalRow227TriangleData1664.coefficient140_159, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_161, Icur := OriginalRow227TriangleData1656.coefficient139_160,
    output := OriginalRow227TriangleData1664.coefficient140_160, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_162, Icur := OriginalRow227TriangleData1656.coefficient139_161,
    output := OriginalRow227TriangleData1664.coefficient140_161, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_163, Icur := OriginalRow227TriangleData1656.coefficient139_162,
    output := OriginalRow227TriangleData1664.coefficient140_162, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_164, Icur := OriginalRow227TriangleData1656.coefficient139_163,
    output := OriginalRow227TriangleData1664.coefficient140_163, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_165, Icur := OriginalRow227TriangleData1656.coefficient139_164,
    output := OriginalRow227TriangleData1664.coefficient140_164, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_166, Icur := OriginalRow227TriangleData1656.coefficient139_165,
    output := OriginalRow227TriangleData1664.coefficient140_165, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_167, Icur := OriginalRow227TriangleData1656.coefficient139_166,
    output := OriginalRow227TriangleData1664.coefficient140_166, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_168, Icur := OriginalRow227TriangleData1656.coefficient139_167,
    output := OriginalRow227TriangleData1664.coefficient140_167, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1656.coefficient139_169, Icur := OriginalRow227TriangleData1656.coefficient139_168,
    output := OriginalRow227TriangleData1664.coefficient140_168, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1657.coefficient139_170, Icur := OriginalRow227TriangleData1656.coefficient139_169,
    output := OriginalRow227TriangleData1664.coefficient140_169, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1657.coefficient139_171, Icur := OriginalRow227TriangleData1657.coefficient139_170,
    output := OriginalRow227TriangleData1664.coefficient140_170, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1648

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1648.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
