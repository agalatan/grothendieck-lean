import Grothe.UpperChaos.OriginalRow227TriangleData1527
import Grothe.UpperChaos.OriginalRow227TriangleData1528
import Grothe.UpperChaos.OriginalRow227TriangleData1536
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1520
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_124, Icur := OriginalRow227TriangleData1527.coefficient123_123,
    output := OriginalRow227TriangleData1536.coefficient124_123, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_125, Icur := OriginalRow227TriangleData1527.coefficient123_124,
    output := OriginalRow227TriangleData1536.coefficient124_124, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_126, Icur := OriginalRow227TriangleData1527.coefficient123_125,
    output := OriginalRow227TriangleData1536.coefficient124_125, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_127, Icur := OriginalRow227TriangleData1527.coefficient123_126,
    output := OriginalRow227TriangleData1536.coefficient124_126, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_128, Icur := OriginalRow227TriangleData1527.coefficient123_127,
    output := OriginalRow227TriangleData1536.coefficient124_127, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_129, Icur := OriginalRow227TriangleData1527.coefficient123_128,
    output := OriginalRow227TriangleData1536.coefficient124_128, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_130, Icur := OriginalRow227TriangleData1527.coefficient123_129,
    output := OriginalRow227TriangleData1536.coefficient124_129, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_131, Icur := OriginalRow227TriangleData1527.coefficient123_130,
    output := OriginalRow227TriangleData1536.coefficient124_130, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_132, Icur := OriginalRow227TriangleData1527.coefficient123_131,
    output := OriginalRow227TriangleData1536.coefficient124_131, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_133, Icur := OriginalRow227TriangleData1527.coefficient123_132,
    output := OriginalRow227TriangleData1536.coefficient124_132, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_134, Icur := OriginalRow227TriangleData1527.coefficient123_133,
    output := OriginalRow227TriangleData1536.coefficient124_133, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_135, Icur := OriginalRow227TriangleData1527.coefficient123_134,
    output := OriginalRow227TriangleData1536.coefficient124_134, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_136, Icur := OriginalRow227TriangleData1527.coefficient123_135,
    output := OriginalRow227TriangleData1536.coefficient124_135, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_137, Icur := OriginalRow227TriangleData1527.coefficient123_136,
    output := OriginalRow227TriangleData1536.coefficient124_136, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_138, Icur := OriginalRow227TriangleData1527.coefficient123_137,
    output := OriginalRow227TriangleData1536.coefficient124_137, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_139, Icur := OriginalRow227TriangleData1527.coefficient123_138,
    output := OriginalRow227TriangleData1536.coefficient124_138, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_140, Icur := OriginalRow227TriangleData1527.coefficient123_139,
    output := OriginalRow227TriangleData1536.coefficient124_139, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_141, Icur := OriginalRow227TriangleData1527.coefficient123_140,
    output := OriginalRow227TriangleData1536.coefficient124_140, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_142, Icur := OriginalRow227TriangleData1527.coefficient123_141,
    output := OriginalRow227TriangleData1536.coefficient124_141, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_143, Icur := OriginalRow227TriangleData1527.coefficient123_142,
    output := OriginalRow227TriangleData1536.coefficient124_142, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_144, Icur := OriginalRow227TriangleData1527.coefficient123_143,
    output := OriginalRow227TriangleData1536.coefficient124_143, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_145, Icur := OriginalRow227TriangleData1527.coefficient123_144,
    output := OriginalRow227TriangleData1536.coefficient124_144, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_146, Icur := OriginalRow227TriangleData1527.coefficient123_145,
    output := OriginalRow227TriangleData1536.coefficient124_145, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_147, Icur := OriginalRow227TriangleData1527.coefficient123_146,
    output := OriginalRow227TriangleData1536.coefficient124_146, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_148, Icur := OriginalRow227TriangleData1527.coefficient123_147,
    output := OriginalRow227TriangleData1536.coefficient124_147, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_149, Icur := OriginalRow227TriangleData1527.coefficient123_148,
    output := OriginalRow227TriangleData1536.coefficient124_148, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_150, Icur := OriginalRow227TriangleData1527.coefficient123_149,
    output := OriginalRow227TriangleData1536.coefficient124_149, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_151, Icur := OriginalRow227TriangleData1527.coefficient123_150,
    output := OriginalRow227TriangleData1536.coefficient124_150, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_152, Icur := OriginalRow227TriangleData1527.coefficient123_151,
    output := OriginalRow227TriangleData1536.coefficient124_151, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1527.coefficient123_153, Icur := OriginalRow227TriangleData1527.coefficient123_152,
    output := OriginalRow227TriangleData1536.coefficient124_152, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_154, Icur := OriginalRow227TriangleData1527.coefficient123_153,
    output := OriginalRow227TriangleData1536.coefficient124_153, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_155, Icur := OriginalRow227TriangleData1528.coefficient123_154,
    output := OriginalRow227TriangleData1536.coefficient124_154, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1520

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1520.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
