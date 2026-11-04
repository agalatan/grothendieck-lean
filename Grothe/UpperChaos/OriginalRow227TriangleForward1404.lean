import Grothe.UpperChaos.OriginalRow227TriangleData1411
import Grothe.UpperChaos.OriginalRow227TriangleData1412
import Grothe.UpperChaos.OriginalRow227TriangleData1420
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1404
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_143, Icur := OriginalRow227TriangleData1411.coefficient110_142,
    output := OriginalRow227TriangleData1420.coefficient111_142, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_144, Icur := OriginalRow227TriangleData1411.coefficient110_143,
    output := OriginalRow227TriangleData1420.coefficient111_143, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_145, Icur := OriginalRow227TriangleData1411.coefficient110_144,
    output := OriginalRow227TriangleData1420.coefficient111_144, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_146, Icur := OriginalRow227TriangleData1411.coefficient110_145,
    output := OriginalRow227TriangleData1420.coefficient111_145, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_147, Icur := OriginalRow227TriangleData1411.coefficient110_146,
    output := OriginalRow227TriangleData1420.coefficient111_146, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_148, Icur := OriginalRow227TriangleData1411.coefficient110_147,
    output := OriginalRow227TriangleData1420.coefficient111_147, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_149, Icur := OriginalRow227TriangleData1411.coefficient110_148,
    output := OriginalRow227TriangleData1420.coefficient111_148, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_150, Icur := OriginalRow227TriangleData1411.coefficient110_149,
    output := OriginalRow227TriangleData1420.coefficient111_149, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_151, Icur := OriginalRow227TriangleData1411.coefficient110_150,
    output := OriginalRow227TriangleData1420.coefficient111_150, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_152, Icur := OriginalRow227TriangleData1411.coefficient110_151,
    output := OriginalRow227TriangleData1420.coefficient111_151, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_153, Icur := OriginalRow227TriangleData1411.coefficient110_152,
    output := OriginalRow227TriangleData1420.coefficient111_152, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_154, Icur := OriginalRow227TriangleData1411.coefficient110_153,
    output := OriginalRow227TriangleData1420.coefficient111_153, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_155, Icur := OriginalRow227TriangleData1411.coefficient110_154,
    output := OriginalRow227TriangleData1420.coefficient111_154, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_156, Icur := OriginalRow227TriangleData1411.coefficient110_155,
    output := OriginalRow227TriangleData1420.coefficient111_155, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_157, Icur := OriginalRow227TriangleData1411.coefficient110_156,
    output := OriginalRow227TriangleData1420.coefficient111_156, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_158, Icur := OriginalRow227TriangleData1411.coefficient110_157,
    output := OriginalRow227TriangleData1420.coefficient111_157, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_159, Icur := OriginalRow227TriangleData1411.coefficient110_158,
    output := OriginalRow227TriangleData1420.coefficient111_158, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_160, Icur := OriginalRow227TriangleData1411.coefficient110_159,
    output := OriginalRow227TriangleData1420.coefficient111_159, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_161, Icur := OriginalRow227TriangleData1411.coefficient110_160,
    output := OriginalRow227TriangleData1420.coefficient111_160, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_162, Icur := OriginalRow227TriangleData1411.coefficient110_161,
    output := OriginalRow227TriangleData1420.coefficient111_161, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_163, Icur := OriginalRow227TriangleData1411.coefficient110_162,
    output := OriginalRow227TriangleData1420.coefficient111_162, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_164, Icur := OriginalRow227TriangleData1411.coefficient110_163,
    output := OriginalRow227TriangleData1420.coefficient111_163, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_165, Icur := OriginalRow227TriangleData1411.coefficient110_164,
    output := OriginalRow227TriangleData1420.coefficient111_164, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_166, Icur := OriginalRow227TriangleData1411.coefficient110_165,
    output := OriginalRow227TriangleData1420.coefficient111_165, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_167, Icur := OriginalRow227TriangleData1411.coefficient110_166,
    output := OriginalRow227TriangleData1420.coefficient111_166, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_168, Icur := OriginalRow227TriangleData1411.coefficient110_167,
    output := OriginalRow227TriangleData1420.coefficient111_167, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_169, Icur := OriginalRow227TriangleData1411.coefficient110_168,
    output := OriginalRow227TriangleData1420.coefficient111_168, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_170, Icur := OriginalRow227TriangleData1411.coefficient110_169,
    output := OriginalRow227TriangleData1420.coefficient111_169, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_171, Icur := OriginalRow227TriangleData1411.coefficient110_170,
    output := OriginalRow227TriangleData1420.coefficient111_170, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1411.coefficient110_172, Icur := OriginalRow227TriangleData1411.coefficient110_171,
    output := OriginalRow227TriangleData1420.coefficient111_171, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1412.coefficient110_173, Icur := OriginalRow227TriangleData1411.coefficient110_172,
    output := OriginalRow227TriangleData1420.coefficient111_172, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1412.coefficient110_174, Icur := OriginalRow227TriangleData1412.coefficient110_173,
    output := OriginalRow227TriangleData1420.coefficient111_173, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1404

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1404.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
