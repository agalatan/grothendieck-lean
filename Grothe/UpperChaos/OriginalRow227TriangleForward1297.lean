import Grothe.UpperChaos.OriginalRow227TriangleData1303
import Grothe.UpperChaos.OriginalRow227TriangleData1304
import Grothe.UpperChaos.OriginalRow227TriangleData1313
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1297
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_132, Icur := OriginalRow227TriangleData1303.coefficient99_131,
    output := OriginalRow227TriangleData1313.coefficient100_131, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_133, Icur := OriginalRow227TriangleData1303.coefficient99_132,
    output := OriginalRow227TriangleData1313.coefficient100_132, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_134, Icur := OriginalRow227TriangleData1303.coefficient99_133,
    output := OriginalRow227TriangleData1313.coefficient100_133, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_135, Icur := OriginalRow227TriangleData1303.coefficient99_134,
    output := OriginalRow227TriangleData1313.coefficient100_134, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_136, Icur := OriginalRow227TriangleData1303.coefficient99_135,
    output := OriginalRow227TriangleData1313.coefficient100_135, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_137, Icur := OriginalRow227TriangleData1303.coefficient99_136,
    output := OriginalRow227TriangleData1313.coefficient100_136, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_138, Icur := OriginalRow227TriangleData1303.coefficient99_137,
    output := OriginalRow227TriangleData1313.coefficient100_137, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_139, Icur := OriginalRow227TriangleData1303.coefficient99_138,
    output := OriginalRow227TriangleData1313.coefficient100_138, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_140, Icur := OriginalRow227TriangleData1303.coefficient99_139,
    output := OriginalRow227TriangleData1313.coefficient100_139, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_141, Icur := OriginalRow227TriangleData1303.coefficient99_140,
    output := OriginalRow227TriangleData1313.coefficient100_140, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_142, Icur := OriginalRow227TriangleData1303.coefficient99_141,
    output := OriginalRow227TriangleData1313.coefficient100_141, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_143, Icur := OriginalRow227TriangleData1303.coefficient99_142,
    output := OriginalRow227TriangleData1313.coefficient100_142, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_144, Icur := OriginalRow227TriangleData1303.coefficient99_143,
    output := OriginalRow227TriangleData1313.coefficient100_143, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_145, Icur := OriginalRow227TriangleData1303.coefficient99_144,
    output := OriginalRow227TriangleData1313.coefficient100_144, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_146, Icur := OriginalRow227TriangleData1303.coefficient99_145,
    output := OriginalRow227TriangleData1313.coefficient100_145, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_147, Icur := OriginalRow227TriangleData1303.coefficient99_146,
    output := OriginalRow227TriangleData1313.coefficient100_146, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_148, Icur := OriginalRow227TriangleData1303.coefficient99_147,
    output := OriginalRow227TriangleData1313.coefficient100_147, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_149, Icur := OriginalRow227TriangleData1303.coefficient99_148,
    output := OriginalRow227TriangleData1313.coefficient100_148, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_150, Icur := OriginalRow227TriangleData1303.coefficient99_149,
    output := OriginalRow227TriangleData1313.coefficient100_149, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_151, Icur := OriginalRow227TriangleData1303.coefficient99_150,
    output := OriginalRow227TriangleData1313.coefficient100_150, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_152, Icur := OriginalRow227TriangleData1303.coefficient99_151,
    output := OriginalRow227TriangleData1313.coefficient100_151, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_153, Icur := OriginalRow227TriangleData1303.coefficient99_152,
    output := OriginalRow227TriangleData1313.coefficient100_152, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_154, Icur := OriginalRow227TriangleData1303.coefficient99_153,
    output := OriginalRow227TriangleData1313.coefficient100_153, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_155, Icur := OriginalRow227TriangleData1303.coefficient99_154,
    output := OriginalRow227TriangleData1313.coefficient100_154, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_156, Icur := OriginalRow227TriangleData1303.coefficient99_155,
    output := OriginalRow227TriangleData1313.coefficient100_155, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_157, Icur := OriginalRow227TriangleData1303.coefficient99_156,
    output := OriginalRow227TriangleData1313.coefficient100_156, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_158, Icur := OriginalRow227TriangleData1303.coefficient99_157,
    output := OriginalRow227TriangleData1313.coefficient100_157, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_159, Icur := OriginalRow227TriangleData1303.coefficient99_158,
    output := OriginalRow227TriangleData1313.coefficient100_158, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_160, Icur := OriginalRow227TriangleData1303.coefficient99_159,
    output := OriginalRow227TriangleData1313.coefficient100_159, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1303.coefficient99_161, Icur := OriginalRow227TriangleData1303.coefficient99_160,
    output := OriginalRow227TriangleData1313.coefficient100_160, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_162, Icur := OriginalRow227TriangleData1303.coefficient99_161,
    output := OriginalRow227TriangleData1313.coefficient100_161, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_163, Icur := OriginalRow227TriangleData1304.coefficient99_162,
    output := OriginalRow227TriangleData1313.coefficient100_162, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1297

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1297.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
