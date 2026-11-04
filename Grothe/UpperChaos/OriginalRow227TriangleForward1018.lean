import Grothe.UpperChaos.OriginalRow227TriangleData1022
import Grothe.UpperChaos.OriginalRow227TriangleData1023
import Grothe.UpperChaos.OriginalRow227TriangleData1034
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1018
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_138, Icur := OriginalRow227TriangleData1022.coefficient73_137,
    output := OriginalRow227TriangleData1034.coefficient74_137, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_139, Icur := OriginalRow227TriangleData1022.coefficient73_138,
    output := OriginalRow227TriangleData1034.coefficient74_138, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_140, Icur := OriginalRow227TriangleData1022.coefficient73_139,
    output := OriginalRow227TriangleData1034.coefficient74_139, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_141, Icur := OriginalRow227TriangleData1022.coefficient73_140,
    output := OriginalRow227TriangleData1034.coefficient74_140, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_142, Icur := OriginalRow227TriangleData1022.coefficient73_141,
    output := OriginalRow227TriangleData1034.coefficient74_141, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_143, Icur := OriginalRow227TriangleData1022.coefficient73_142,
    output := OriginalRow227TriangleData1034.coefficient74_142, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_144, Icur := OriginalRow227TriangleData1022.coefficient73_143,
    output := OriginalRow227TriangleData1034.coefficient74_143, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_145, Icur := OriginalRow227TriangleData1022.coefficient73_144,
    output := OriginalRow227TriangleData1034.coefficient74_144, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_146, Icur := OriginalRow227TriangleData1022.coefficient73_145,
    output := OriginalRow227TriangleData1034.coefficient74_145, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_147, Icur := OriginalRow227TriangleData1022.coefficient73_146,
    output := OriginalRow227TriangleData1034.coefficient74_146, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_148, Icur := OriginalRow227TriangleData1022.coefficient73_147,
    output := OriginalRow227TriangleData1034.coefficient74_147, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_149, Icur := OriginalRow227TriangleData1022.coefficient73_148,
    output := OriginalRow227TriangleData1034.coefficient74_148, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_150, Icur := OriginalRow227TriangleData1022.coefficient73_149,
    output := OriginalRow227TriangleData1034.coefficient74_149, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_151, Icur := OriginalRow227TriangleData1022.coefficient73_150,
    output := OriginalRow227TriangleData1034.coefficient74_150, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_152, Icur := OriginalRow227TriangleData1022.coefficient73_151,
    output := OriginalRow227TriangleData1034.coefficient74_151, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_153, Icur := OriginalRow227TriangleData1022.coefficient73_152,
    output := OriginalRow227TriangleData1034.coefficient74_152, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_154, Icur := OriginalRow227TriangleData1022.coefficient73_153,
    output := OriginalRow227TriangleData1034.coefficient74_153, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_155, Icur := OriginalRow227TriangleData1022.coefficient73_154,
    output := OriginalRow227TriangleData1034.coefficient74_154, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_156, Icur := OriginalRow227TriangleData1022.coefficient73_155,
    output := OriginalRow227TriangleData1034.coefficient74_155, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_157, Icur := OriginalRow227TriangleData1022.coefficient73_156,
    output := OriginalRow227TriangleData1034.coefficient74_156, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_158, Icur := OriginalRow227TriangleData1022.coefficient73_157,
    output := OriginalRow227TriangleData1034.coefficient74_157, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_159, Icur := OriginalRow227TriangleData1022.coefficient73_158,
    output := OriginalRow227TriangleData1034.coefficient74_158, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_160, Icur := OriginalRow227TriangleData1022.coefficient73_159,
    output := OriginalRow227TriangleData1034.coefficient74_159, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_161, Icur := OriginalRow227TriangleData1022.coefficient73_160,
    output := OriginalRow227TriangleData1034.coefficient74_160, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_162, Icur := OriginalRow227TriangleData1022.coefficient73_161,
    output := OriginalRow227TriangleData1034.coefficient74_161, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_163, Icur := OriginalRow227TriangleData1022.coefficient73_162,
    output := OriginalRow227TriangleData1034.coefficient74_162, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_164, Icur := OriginalRow227TriangleData1022.coefficient73_163,
    output := OriginalRow227TriangleData1034.coefficient74_163, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_165, Icur := OriginalRow227TriangleData1022.coefficient73_164,
    output := OriginalRow227TriangleData1034.coefficient74_164, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_166, Icur := OriginalRow227TriangleData1022.coefficient73_165,
    output := OriginalRow227TriangleData1034.coefficient74_165, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1022.coefficient73_167, Icur := OriginalRow227TriangleData1022.coefficient73_166,
    output := OriginalRow227TriangleData1034.coefficient74_166, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1023.coefficient73_168, Icur := OriginalRow227TriangleData1022.coefficient73_167,
    output := OriginalRow227TriangleData1034.coefficient74_167, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1023.coefficient73_169, Icur := OriginalRow227TriangleData1023.coefficient73_168,
    output := OriginalRow227TriangleData1034.coefficient74_168, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1018

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1018.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
