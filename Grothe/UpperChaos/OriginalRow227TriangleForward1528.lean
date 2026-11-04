import Grothe.UpperChaos.OriginalRow227TriangleData1536
import Grothe.UpperChaos.OriginalRow227TriangleData1537
import Grothe.UpperChaos.OriginalRow227TriangleData1544
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1528
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_125, Icur := OriginalRow227TriangleData1536.coefficient124_124,
    output := OriginalRow227TriangleData1544.coefficient125_124, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_126, Icur := OriginalRow227TriangleData1536.coefficient124_125,
    output := OriginalRow227TriangleData1544.coefficient125_125, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_127, Icur := OriginalRow227TriangleData1536.coefficient124_126,
    output := OriginalRow227TriangleData1544.coefficient125_126, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_128, Icur := OriginalRow227TriangleData1536.coefficient124_127,
    output := OriginalRow227TriangleData1544.coefficient125_127, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_129, Icur := OriginalRow227TriangleData1536.coefficient124_128,
    output := OriginalRow227TriangleData1544.coefficient125_128, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_130, Icur := OriginalRow227TriangleData1536.coefficient124_129,
    output := OriginalRow227TriangleData1544.coefficient125_129, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_131, Icur := OriginalRow227TriangleData1536.coefficient124_130,
    output := OriginalRow227TriangleData1544.coefficient125_130, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_132, Icur := OriginalRow227TriangleData1536.coefficient124_131,
    output := OriginalRow227TriangleData1544.coefficient125_131, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_133, Icur := OriginalRow227TriangleData1536.coefficient124_132,
    output := OriginalRow227TriangleData1544.coefficient125_132, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_134, Icur := OriginalRow227TriangleData1536.coefficient124_133,
    output := OriginalRow227TriangleData1544.coefficient125_133, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_135, Icur := OriginalRow227TriangleData1536.coefficient124_134,
    output := OriginalRow227TriangleData1544.coefficient125_134, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_136, Icur := OriginalRow227TriangleData1536.coefficient124_135,
    output := OriginalRow227TriangleData1544.coefficient125_135, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_137, Icur := OriginalRow227TriangleData1536.coefficient124_136,
    output := OriginalRow227TriangleData1544.coefficient125_136, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_138, Icur := OriginalRow227TriangleData1536.coefficient124_137,
    output := OriginalRow227TriangleData1544.coefficient125_137, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_139, Icur := OriginalRow227TriangleData1536.coefficient124_138,
    output := OriginalRow227TriangleData1544.coefficient125_138, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_140, Icur := OriginalRow227TriangleData1536.coefficient124_139,
    output := OriginalRow227TriangleData1544.coefficient125_139, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_141, Icur := OriginalRow227TriangleData1536.coefficient124_140,
    output := OriginalRow227TriangleData1544.coefficient125_140, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_142, Icur := OriginalRow227TriangleData1536.coefficient124_141,
    output := OriginalRow227TriangleData1544.coefficient125_141, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_143, Icur := OriginalRow227TriangleData1536.coefficient124_142,
    output := OriginalRow227TriangleData1544.coefficient125_142, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_144, Icur := OriginalRow227TriangleData1536.coefficient124_143,
    output := OriginalRow227TriangleData1544.coefficient125_143, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_145, Icur := OriginalRow227TriangleData1536.coefficient124_144,
    output := OriginalRow227TriangleData1544.coefficient125_144, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_146, Icur := OriginalRow227TriangleData1536.coefficient124_145,
    output := OriginalRow227TriangleData1544.coefficient125_145, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_147, Icur := OriginalRow227TriangleData1536.coefficient124_146,
    output := OriginalRow227TriangleData1544.coefficient125_146, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_148, Icur := OriginalRow227TriangleData1536.coefficient124_147,
    output := OriginalRow227TriangleData1544.coefficient125_147, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_149, Icur := OriginalRow227TriangleData1536.coefficient124_148,
    output := OriginalRow227TriangleData1544.coefficient125_148, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_150, Icur := OriginalRow227TriangleData1536.coefficient124_149,
    output := OriginalRow227TriangleData1544.coefficient125_149, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_151, Icur := OriginalRow227TriangleData1536.coefficient124_150,
    output := OriginalRow227TriangleData1544.coefficient125_150, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_152, Icur := OriginalRow227TriangleData1536.coefficient124_151,
    output := OriginalRow227TriangleData1544.coefficient125_151, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_153, Icur := OriginalRow227TriangleData1536.coefficient124_152,
    output := OriginalRow227TriangleData1544.coefficient125_152, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1536.coefficient124_154, Icur := OriginalRow227TriangleData1536.coefficient124_153,
    output := OriginalRow227TriangleData1544.coefficient125_153, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1537.coefficient124_155, Icur := OriginalRow227TriangleData1536.coefficient124_154,
    output := OriginalRow227TriangleData1544.coefficient125_154, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root125,
    Inext := OriginalRow227TriangleData1537.coefficient124_156, Icur := OriginalRow227TriangleData1537.coefficient124_155,
    output := OriginalRow227TriangleData1544.coefficient125_155, hC := OriginalRow227TriangleRoots03.root125_pos, hAC := OriginalRow227TriangleRoots03.product125_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1528

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1528.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
