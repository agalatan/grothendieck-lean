import Grothe.UpperChaos.OriginalRow227TriangleData1058
import Grothe.UpperChaos.OriginalRow227TriangleData1059
import Grothe.UpperChaos.OriginalRow227TriangleData1069
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1053
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_141, Icur := OriginalRow227TriangleData1058.coefficient76_140,
    output := OriginalRow227TriangleData1069.coefficient77_140, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_142, Icur := OriginalRow227TriangleData1058.coefficient76_141,
    output := OriginalRow227TriangleData1069.coefficient77_141, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_143, Icur := OriginalRow227TriangleData1058.coefficient76_142,
    output := OriginalRow227TriangleData1069.coefficient77_142, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_144, Icur := OriginalRow227TriangleData1058.coefficient76_143,
    output := OriginalRow227TriangleData1069.coefficient77_143, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_145, Icur := OriginalRow227TriangleData1058.coefficient76_144,
    output := OriginalRow227TriangleData1069.coefficient77_144, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_146, Icur := OriginalRow227TriangleData1058.coefficient76_145,
    output := OriginalRow227TriangleData1069.coefficient77_145, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_147, Icur := OriginalRow227TriangleData1058.coefficient76_146,
    output := OriginalRow227TriangleData1069.coefficient77_146, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_148, Icur := OriginalRow227TriangleData1058.coefficient76_147,
    output := OriginalRow227TriangleData1069.coefficient77_147, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_149, Icur := OriginalRow227TriangleData1058.coefficient76_148,
    output := OriginalRow227TriangleData1069.coefficient77_148, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_150, Icur := OriginalRow227TriangleData1058.coefficient76_149,
    output := OriginalRow227TriangleData1069.coefficient77_149, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_151, Icur := OriginalRow227TriangleData1058.coefficient76_150,
    output := OriginalRow227TriangleData1069.coefficient77_150, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_152, Icur := OriginalRow227TriangleData1058.coefficient76_151,
    output := OriginalRow227TriangleData1069.coefficient77_151, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_153, Icur := OriginalRow227TriangleData1058.coefficient76_152,
    output := OriginalRow227TriangleData1069.coefficient77_152, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_154, Icur := OriginalRow227TriangleData1058.coefficient76_153,
    output := OriginalRow227TriangleData1069.coefficient77_153, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_155, Icur := OriginalRow227TriangleData1058.coefficient76_154,
    output := OriginalRow227TriangleData1069.coefficient77_154, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_156, Icur := OriginalRow227TriangleData1058.coefficient76_155,
    output := OriginalRow227TriangleData1069.coefficient77_155, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_157, Icur := OriginalRow227TriangleData1058.coefficient76_156,
    output := OriginalRow227TriangleData1069.coefficient77_156, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_158, Icur := OriginalRow227TriangleData1058.coefficient76_157,
    output := OriginalRow227TriangleData1069.coefficient77_157, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_159, Icur := OriginalRow227TriangleData1058.coefficient76_158,
    output := OriginalRow227TriangleData1069.coefficient77_158, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_160, Icur := OriginalRow227TriangleData1058.coefficient76_159,
    output := OriginalRow227TriangleData1069.coefficient77_159, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_161, Icur := OriginalRow227TriangleData1058.coefficient76_160,
    output := OriginalRow227TriangleData1069.coefficient77_160, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_162, Icur := OriginalRow227TriangleData1058.coefficient76_161,
    output := OriginalRow227TriangleData1069.coefficient77_161, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_163, Icur := OriginalRow227TriangleData1058.coefficient76_162,
    output := OriginalRow227TriangleData1069.coefficient77_162, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_164, Icur := OriginalRow227TriangleData1058.coefficient76_163,
    output := OriginalRow227TriangleData1069.coefficient77_163, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_165, Icur := OriginalRow227TriangleData1058.coefficient76_164,
    output := OriginalRow227TriangleData1069.coefficient77_164, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_166, Icur := OriginalRow227TriangleData1058.coefficient76_165,
    output := OriginalRow227TriangleData1069.coefficient77_165, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_167, Icur := OriginalRow227TriangleData1058.coefficient76_166,
    output := OriginalRow227TriangleData1069.coefficient77_166, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_168, Icur := OriginalRow227TriangleData1058.coefficient76_167,
    output := OriginalRow227TriangleData1069.coefficient77_167, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_169, Icur := OriginalRow227TriangleData1058.coefficient76_168,
    output := OriginalRow227TriangleData1069.coefficient77_168, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_170, Icur := OriginalRow227TriangleData1058.coefficient76_169,
    output := OriginalRow227TriangleData1069.coefficient77_169, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1059.coefficient76_171, Icur := OriginalRow227TriangleData1058.coefficient76_170,
    output := OriginalRow227TriangleData1069.coefficient77_170, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1059.coefficient76_172, Icur := OriginalRow227TriangleData1059.coefficient76_171,
    output := OriginalRow227TriangleData1069.coefficient77_171, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1053

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1053.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
