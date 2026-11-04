import Grothe.UpperChaos.OriginalRow227TriangleData0974
import Grothe.UpperChaos.OriginalRow227TriangleData0975
import Grothe.UpperChaos.OriginalRow227TriangleData0986
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0970
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_134, Icur := OriginalRow227TriangleData0974.coefficient69_133,
    output := OriginalRow227TriangleData0986.coefficient70_133, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_135, Icur := OriginalRow227TriangleData0974.coefficient69_134,
    output := OriginalRow227TriangleData0986.coefficient70_134, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_136, Icur := OriginalRow227TriangleData0974.coefficient69_135,
    output := OriginalRow227TriangleData0986.coefficient70_135, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_137, Icur := OriginalRow227TriangleData0974.coefficient69_136,
    output := OriginalRow227TriangleData0986.coefficient70_136, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_138, Icur := OriginalRow227TriangleData0974.coefficient69_137,
    output := OriginalRow227TriangleData0986.coefficient70_137, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_139, Icur := OriginalRow227TriangleData0974.coefficient69_138,
    output := OriginalRow227TriangleData0986.coefficient70_138, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_140, Icur := OriginalRow227TriangleData0974.coefficient69_139,
    output := OriginalRow227TriangleData0986.coefficient70_139, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_141, Icur := OriginalRow227TriangleData0974.coefficient69_140,
    output := OriginalRow227TriangleData0986.coefficient70_140, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_142, Icur := OriginalRow227TriangleData0974.coefficient69_141,
    output := OriginalRow227TriangleData0986.coefficient70_141, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_143, Icur := OriginalRow227TriangleData0974.coefficient69_142,
    output := OriginalRow227TriangleData0986.coefficient70_142, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_144, Icur := OriginalRow227TriangleData0974.coefficient69_143,
    output := OriginalRow227TriangleData0986.coefficient70_143, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_145, Icur := OriginalRow227TriangleData0974.coefficient69_144,
    output := OriginalRow227TriangleData0986.coefficient70_144, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_146, Icur := OriginalRow227TriangleData0974.coefficient69_145,
    output := OriginalRow227TriangleData0986.coefficient70_145, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_147, Icur := OriginalRow227TriangleData0974.coefficient69_146,
    output := OriginalRow227TriangleData0986.coefficient70_146, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_148, Icur := OriginalRow227TriangleData0974.coefficient69_147,
    output := OriginalRow227TriangleData0986.coefficient70_147, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_149, Icur := OriginalRow227TriangleData0974.coefficient69_148,
    output := OriginalRow227TriangleData0986.coefficient70_148, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_150, Icur := OriginalRow227TriangleData0974.coefficient69_149,
    output := OriginalRow227TriangleData0986.coefficient70_149, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_151, Icur := OriginalRow227TriangleData0974.coefficient69_150,
    output := OriginalRow227TriangleData0986.coefficient70_150, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_152, Icur := OriginalRow227TriangleData0974.coefficient69_151,
    output := OriginalRow227TriangleData0986.coefficient70_151, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_153, Icur := OriginalRow227TriangleData0974.coefficient69_152,
    output := OriginalRow227TriangleData0986.coefficient70_152, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_154, Icur := OriginalRow227TriangleData0974.coefficient69_153,
    output := OriginalRow227TriangleData0986.coefficient70_153, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_155, Icur := OriginalRow227TriangleData0974.coefficient69_154,
    output := OriginalRow227TriangleData0986.coefficient70_154, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_156, Icur := OriginalRow227TriangleData0974.coefficient69_155,
    output := OriginalRow227TriangleData0986.coefficient70_155, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_157, Icur := OriginalRow227TriangleData0974.coefficient69_156,
    output := OriginalRow227TriangleData0986.coefficient70_156, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_158, Icur := OriginalRow227TriangleData0974.coefficient69_157,
    output := OriginalRow227TriangleData0986.coefficient70_157, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_159, Icur := OriginalRow227TriangleData0974.coefficient69_158,
    output := OriginalRow227TriangleData0986.coefficient70_158, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_160, Icur := OriginalRow227TriangleData0974.coefficient69_159,
    output := OriginalRow227TriangleData0986.coefficient70_159, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_161, Icur := OriginalRow227TriangleData0974.coefficient69_160,
    output := OriginalRow227TriangleData0986.coefficient70_160, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_162, Icur := OriginalRow227TriangleData0974.coefficient69_161,
    output := OriginalRow227TriangleData0986.coefficient70_161, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0974.coefficient69_163, Icur := OriginalRow227TriangleData0974.coefficient69_162,
    output := OriginalRow227TriangleData0986.coefficient70_162, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_164, Icur := OriginalRow227TriangleData0974.coefficient69_163,
    output := OriginalRow227TriangleData0986.coefficient70_163, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_165, Icur := OriginalRow227TriangleData0975.coefficient69_164,
    output := OriginalRow227TriangleData0986.coefficient70_164, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0970

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0970.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
