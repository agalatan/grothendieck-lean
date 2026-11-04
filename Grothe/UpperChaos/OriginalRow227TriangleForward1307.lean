import Grothe.UpperChaos.OriginalRow227TriangleData1313
import Grothe.UpperChaos.OriginalRow227TriangleData1314
import Grothe.UpperChaos.OriginalRow227TriangleData1323
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1307
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_133, Icur := OriginalRow227TriangleData1313.coefficient100_132,
    output := OriginalRow227TriangleData1323.coefficient101_132, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_134, Icur := OriginalRow227TriangleData1313.coefficient100_133,
    output := OriginalRow227TriangleData1323.coefficient101_133, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_135, Icur := OriginalRow227TriangleData1313.coefficient100_134,
    output := OriginalRow227TriangleData1323.coefficient101_134, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_136, Icur := OriginalRow227TriangleData1313.coefficient100_135,
    output := OriginalRow227TriangleData1323.coefficient101_135, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_137, Icur := OriginalRow227TriangleData1313.coefficient100_136,
    output := OriginalRow227TriangleData1323.coefficient101_136, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_138, Icur := OriginalRow227TriangleData1313.coefficient100_137,
    output := OriginalRow227TriangleData1323.coefficient101_137, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_139, Icur := OriginalRow227TriangleData1313.coefficient100_138,
    output := OriginalRow227TriangleData1323.coefficient101_138, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_140, Icur := OriginalRow227TriangleData1313.coefficient100_139,
    output := OriginalRow227TriangleData1323.coefficient101_139, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_141, Icur := OriginalRow227TriangleData1313.coefficient100_140,
    output := OriginalRow227TriangleData1323.coefficient101_140, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_142, Icur := OriginalRow227TriangleData1313.coefficient100_141,
    output := OriginalRow227TriangleData1323.coefficient101_141, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_143, Icur := OriginalRow227TriangleData1313.coefficient100_142,
    output := OriginalRow227TriangleData1323.coefficient101_142, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_144, Icur := OriginalRow227TriangleData1313.coefficient100_143,
    output := OriginalRow227TriangleData1323.coefficient101_143, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_145, Icur := OriginalRow227TriangleData1313.coefficient100_144,
    output := OriginalRow227TriangleData1323.coefficient101_144, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_146, Icur := OriginalRow227TriangleData1313.coefficient100_145,
    output := OriginalRow227TriangleData1323.coefficient101_145, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_147, Icur := OriginalRow227TriangleData1313.coefficient100_146,
    output := OriginalRow227TriangleData1323.coefficient101_146, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_148, Icur := OriginalRow227TriangleData1313.coefficient100_147,
    output := OriginalRow227TriangleData1323.coefficient101_147, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_149, Icur := OriginalRow227TriangleData1313.coefficient100_148,
    output := OriginalRow227TriangleData1323.coefficient101_148, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_150, Icur := OriginalRow227TriangleData1313.coefficient100_149,
    output := OriginalRow227TriangleData1323.coefficient101_149, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_151, Icur := OriginalRow227TriangleData1313.coefficient100_150,
    output := OriginalRow227TriangleData1323.coefficient101_150, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_152, Icur := OriginalRow227TriangleData1313.coefficient100_151,
    output := OriginalRow227TriangleData1323.coefficient101_151, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_153, Icur := OriginalRow227TriangleData1313.coefficient100_152,
    output := OriginalRow227TriangleData1323.coefficient101_152, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_154, Icur := OriginalRow227TriangleData1313.coefficient100_153,
    output := OriginalRow227TriangleData1323.coefficient101_153, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_155, Icur := OriginalRow227TriangleData1313.coefficient100_154,
    output := OriginalRow227TriangleData1323.coefficient101_154, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_156, Icur := OriginalRow227TriangleData1313.coefficient100_155,
    output := OriginalRow227TriangleData1323.coefficient101_155, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_157, Icur := OriginalRow227TriangleData1313.coefficient100_156,
    output := OriginalRow227TriangleData1323.coefficient101_156, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_158, Icur := OriginalRow227TriangleData1313.coefficient100_157,
    output := OriginalRow227TriangleData1323.coefficient101_157, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_159, Icur := OriginalRow227TriangleData1313.coefficient100_158,
    output := OriginalRow227TriangleData1323.coefficient101_158, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_160, Icur := OriginalRow227TriangleData1313.coefficient100_159,
    output := OriginalRow227TriangleData1323.coefficient101_159, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_161, Icur := OriginalRow227TriangleData1313.coefficient100_160,
    output := OriginalRow227TriangleData1323.coefficient101_160, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_162, Icur := OriginalRow227TriangleData1313.coefficient100_161,
    output := OriginalRow227TriangleData1323.coefficient101_161, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1314.coefficient100_163, Icur := OriginalRow227TriangleData1313.coefficient100_162,
    output := OriginalRow227TriangleData1323.coefficient101_162, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1314.coefficient100_164, Icur := OriginalRow227TriangleData1314.coefficient100_163,
    output := OriginalRow227TriangleData1323.coefficient101_163, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1307

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1307.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
