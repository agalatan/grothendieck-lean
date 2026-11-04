import Grothe.UpperChaos.OriginalRow227TriangleData1437
import Grothe.UpperChaos.OriginalRow227TriangleData1438
import Grothe.UpperChaos.OriginalRow227TriangleData1446
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1430
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_114, Icur := OriginalRow227TriangleData1437.coefficient113_113,
    output := OriginalRow227TriangleData1446.coefficient114_113, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_115, Icur := OriginalRow227TriangleData1437.coefficient113_114,
    output := OriginalRow227TriangleData1446.coefficient114_114, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_116, Icur := OriginalRow227TriangleData1437.coefficient113_115,
    output := OriginalRow227TriangleData1446.coefficient114_115, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_117, Icur := OriginalRow227TriangleData1437.coefficient113_116,
    output := OriginalRow227TriangleData1446.coefficient114_116, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_118, Icur := OriginalRow227TriangleData1437.coefficient113_117,
    output := OriginalRow227TriangleData1446.coefficient114_117, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_119, Icur := OriginalRow227TriangleData1437.coefficient113_118,
    output := OriginalRow227TriangleData1446.coefficient114_118, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_120, Icur := OriginalRow227TriangleData1437.coefficient113_119,
    output := OriginalRow227TriangleData1446.coefficient114_119, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_121, Icur := OriginalRow227TriangleData1437.coefficient113_120,
    output := OriginalRow227TriangleData1446.coefficient114_120, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_122, Icur := OriginalRow227TriangleData1437.coefficient113_121,
    output := OriginalRow227TriangleData1446.coefficient114_121, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_123, Icur := OriginalRow227TriangleData1437.coefficient113_122,
    output := OriginalRow227TriangleData1446.coefficient114_122, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_124, Icur := OriginalRow227TriangleData1437.coefficient113_123,
    output := OriginalRow227TriangleData1446.coefficient114_123, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_125, Icur := OriginalRow227TriangleData1437.coefficient113_124,
    output := OriginalRow227TriangleData1446.coefficient114_124, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_126, Icur := OriginalRow227TriangleData1437.coefficient113_125,
    output := OriginalRow227TriangleData1446.coefficient114_125, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_127, Icur := OriginalRow227TriangleData1437.coefficient113_126,
    output := OriginalRow227TriangleData1446.coefficient114_126, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_128, Icur := OriginalRow227TriangleData1437.coefficient113_127,
    output := OriginalRow227TriangleData1446.coefficient114_127, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_129, Icur := OriginalRow227TriangleData1437.coefficient113_128,
    output := OriginalRow227TriangleData1446.coefficient114_128, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_130, Icur := OriginalRow227TriangleData1437.coefficient113_129,
    output := OriginalRow227TriangleData1446.coefficient114_129, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_131, Icur := OriginalRow227TriangleData1437.coefficient113_130,
    output := OriginalRow227TriangleData1446.coefficient114_130, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_132, Icur := OriginalRow227TriangleData1437.coefficient113_131,
    output := OriginalRow227TriangleData1446.coefficient114_131, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_133, Icur := OriginalRow227TriangleData1437.coefficient113_132,
    output := OriginalRow227TriangleData1446.coefficient114_132, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_134, Icur := OriginalRow227TriangleData1437.coefficient113_133,
    output := OriginalRow227TriangleData1446.coefficient114_133, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_135, Icur := OriginalRow227TriangleData1437.coefficient113_134,
    output := OriginalRow227TriangleData1446.coefficient114_134, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_136, Icur := OriginalRow227TriangleData1437.coefficient113_135,
    output := OriginalRow227TriangleData1446.coefficient114_135, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_137, Icur := OriginalRow227TriangleData1437.coefficient113_136,
    output := OriginalRow227TriangleData1446.coefficient114_136, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_138, Icur := OriginalRow227TriangleData1437.coefficient113_137,
    output := OriginalRow227TriangleData1446.coefficient114_137, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_139, Icur := OriginalRow227TriangleData1437.coefficient113_138,
    output := OriginalRow227TriangleData1446.coefficient114_138, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_140, Icur := OriginalRow227TriangleData1437.coefficient113_139,
    output := OriginalRow227TriangleData1446.coefficient114_139, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_141, Icur := OriginalRow227TriangleData1437.coefficient113_140,
    output := OriginalRow227TriangleData1446.coefficient114_140, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_142, Icur := OriginalRow227TriangleData1437.coefficient113_141,
    output := OriginalRow227TriangleData1446.coefficient114_141, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1437.coefficient113_143, Icur := OriginalRow227TriangleData1437.coefficient113_142,
    output := OriginalRow227TriangleData1446.coefficient114_142, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1438.coefficient113_144, Icur := OriginalRow227TriangleData1437.coefficient113_143,
    output := OriginalRow227TriangleData1446.coefficient114_143, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1438.coefficient113_145, Icur := OriginalRow227TriangleData1438.coefficient113_144,
    output := OriginalRow227TriangleData1446.coefficient114_144, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1430

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1430.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
