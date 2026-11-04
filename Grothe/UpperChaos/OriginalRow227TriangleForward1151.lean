import Grothe.UpperChaos.OriginalRow227TriangleData1156
import Grothe.UpperChaos.OriginalRow227TriangleData1157
import Grothe.UpperChaos.OriginalRow227TriangleData1167
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1151
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_118, Icur := OriginalRow227TriangleData1156.coefficient85_117,
    output := OriginalRow227TriangleData1167.coefficient86_117, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_119, Icur := OriginalRow227TriangleData1156.coefficient85_118,
    output := OriginalRow227TriangleData1167.coefficient86_118, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_120, Icur := OriginalRow227TriangleData1156.coefficient85_119,
    output := OriginalRow227TriangleData1167.coefficient86_119, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_121, Icur := OriginalRow227TriangleData1156.coefficient85_120,
    output := OriginalRow227TriangleData1167.coefficient86_120, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_122, Icur := OriginalRow227TriangleData1156.coefficient85_121,
    output := OriginalRow227TriangleData1167.coefficient86_121, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_123, Icur := OriginalRow227TriangleData1156.coefficient85_122,
    output := OriginalRow227TriangleData1167.coefficient86_122, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_124, Icur := OriginalRow227TriangleData1156.coefficient85_123,
    output := OriginalRow227TriangleData1167.coefficient86_123, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_125, Icur := OriginalRow227TriangleData1156.coefficient85_124,
    output := OriginalRow227TriangleData1167.coefficient86_124, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_126, Icur := OriginalRow227TriangleData1156.coefficient85_125,
    output := OriginalRow227TriangleData1167.coefficient86_125, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_127, Icur := OriginalRow227TriangleData1156.coefficient85_126,
    output := OriginalRow227TriangleData1167.coefficient86_126, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_128, Icur := OriginalRow227TriangleData1156.coefficient85_127,
    output := OriginalRow227TriangleData1167.coefficient86_127, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_129, Icur := OriginalRow227TriangleData1156.coefficient85_128,
    output := OriginalRow227TriangleData1167.coefficient86_128, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_130, Icur := OriginalRow227TriangleData1156.coefficient85_129,
    output := OriginalRow227TriangleData1167.coefficient86_129, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_131, Icur := OriginalRow227TriangleData1156.coefficient85_130,
    output := OriginalRow227TriangleData1167.coefficient86_130, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_132, Icur := OriginalRow227TriangleData1156.coefficient85_131,
    output := OriginalRow227TriangleData1167.coefficient86_131, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_133, Icur := OriginalRow227TriangleData1156.coefficient85_132,
    output := OriginalRow227TriangleData1167.coefficient86_132, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_134, Icur := OriginalRow227TriangleData1156.coefficient85_133,
    output := OriginalRow227TriangleData1167.coefficient86_133, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_135, Icur := OriginalRow227TriangleData1156.coefficient85_134,
    output := OriginalRow227TriangleData1167.coefficient86_134, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_136, Icur := OriginalRow227TriangleData1156.coefficient85_135,
    output := OriginalRow227TriangleData1167.coefficient86_135, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_137, Icur := OriginalRow227TriangleData1156.coefficient85_136,
    output := OriginalRow227TriangleData1167.coefficient86_136, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_138, Icur := OriginalRow227TriangleData1156.coefficient85_137,
    output := OriginalRow227TriangleData1167.coefficient86_137, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_139, Icur := OriginalRow227TriangleData1156.coefficient85_138,
    output := OriginalRow227TriangleData1167.coefficient86_138, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_140, Icur := OriginalRow227TriangleData1156.coefficient85_139,
    output := OriginalRow227TriangleData1167.coefficient86_139, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_141, Icur := OriginalRow227TriangleData1156.coefficient85_140,
    output := OriginalRow227TriangleData1167.coefficient86_140, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_142, Icur := OriginalRow227TriangleData1156.coefficient85_141,
    output := OriginalRow227TriangleData1167.coefficient86_141, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_143, Icur := OriginalRow227TriangleData1156.coefficient85_142,
    output := OriginalRow227TriangleData1167.coefficient86_142, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_144, Icur := OriginalRow227TriangleData1156.coefficient85_143,
    output := OriginalRow227TriangleData1167.coefficient86_143, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_145, Icur := OriginalRow227TriangleData1156.coefficient85_144,
    output := OriginalRow227TriangleData1167.coefficient86_144, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_146, Icur := OriginalRow227TriangleData1156.coefficient85_145,
    output := OriginalRow227TriangleData1167.coefficient86_145, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1156.coefficient85_147, Icur := OriginalRow227TriangleData1156.coefficient85_146,
    output := OriginalRow227TriangleData1167.coefficient86_146, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1157.coefficient85_148, Icur := OriginalRow227TriangleData1156.coefficient85_147,
    output := OriginalRow227TriangleData1167.coefficient86_147, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1157.coefficient85_149, Icur := OriginalRow227TriangleData1157.coefficient85_148,
    output := OriginalRow227TriangleData1167.coefficient86_148, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1151

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1151.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
