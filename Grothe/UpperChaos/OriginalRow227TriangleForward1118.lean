import Grothe.UpperChaos.OriginalRow227TriangleData1123
import Grothe.UpperChaos.OriginalRow227TriangleData1124
import Grothe.UpperChaos.OriginalRow227TriangleData1134
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1118
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_115, Icur := OriginalRow227TriangleData1123.coefficient82_114,
    output := OriginalRow227TriangleData1134.coefficient83_114, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_116, Icur := OriginalRow227TriangleData1123.coefficient82_115,
    output := OriginalRow227TriangleData1134.coefficient83_115, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_117, Icur := OriginalRow227TriangleData1123.coefficient82_116,
    output := OriginalRow227TriangleData1134.coefficient83_116, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_118, Icur := OriginalRow227TriangleData1123.coefficient82_117,
    output := OriginalRow227TriangleData1134.coefficient83_117, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_119, Icur := OriginalRow227TriangleData1123.coefficient82_118,
    output := OriginalRow227TriangleData1134.coefficient83_118, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_120, Icur := OriginalRow227TriangleData1123.coefficient82_119,
    output := OriginalRow227TriangleData1134.coefficient83_119, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_121, Icur := OriginalRow227TriangleData1123.coefficient82_120,
    output := OriginalRow227TriangleData1134.coefficient83_120, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_122, Icur := OriginalRow227TriangleData1123.coefficient82_121,
    output := OriginalRow227TriangleData1134.coefficient83_121, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_123, Icur := OriginalRow227TriangleData1123.coefficient82_122,
    output := OriginalRow227TriangleData1134.coefficient83_122, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_124, Icur := OriginalRow227TriangleData1123.coefficient82_123,
    output := OriginalRow227TriangleData1134.coefficient83_123, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_125, Icur := OriginalRow227TriangleData1123.coefficient82_124,
    output := OriginalRow227TriangleData1134.coefficient83_124, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_126, Icur := OriginalRow227TriangleData1123.coefficient82_125,
    output := OriginalRow227TriangleData1134.coefficient83_125, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_127, Icur := OriginalRow227TriangleData1123.coefficient82_126,
    output := OriginalRow227TriangleData1134.coefficient83_126, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_128, Icur := OriginalRow227TriangleData1123.coefficient82_127,
    output := OriginalRow227TriangleData1134.coefficient83_127, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_129, Icur := OriginalRow227TriangleData1123.coefficient82_128,
    output := OriginalRow227TriangleData1134.coefficient83_128, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_130, Icur := OriginalRow227TriangleData1123.coefficient82_129,
    output := OriginalRow227TriangleData1134.coefficient83_129, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_131, Icur := OriginalRow227TriangleData1123.coefficient82_130,
    output := OriginalRow227TriangleData1134.coefficient83_130, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_132, Icur := OriginalRow227TriangleData1123.coefficient82_131,
    output := OriginalRow227TriangleData1134.coefficient83_131, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_133, Icur := OriginalRow227TriangleData1123.coefficient82_132,
    output := OriginalRow227TriangleData1134.coefficient83_132, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_134, Icur := OriginalRow227TriangleData1123.coefficient82_133,
    output := OriginalRow227TriangleData1134.coefficient83_133, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_135, Icur := OriginalRow227TriangleData1123.coefficient82_134,
    output := OriginalRow227TriangleData1134.coefficient83_134, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_136, Icur := OriginalRow227TriangleData1123.coefficient82_135,
    output := OriginalRow227TriangleData1134.coefficient83_135, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_137, Icur := OriginalRow227TriangleData1123.coefficient82_136,
    output := OriginalRow227TriangleData1134.coefficient83_136, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_138, Icur := OriginalRow227TriangleData1123.coefficient82_137,
    output := OriginalRow227TriangleData1134.coefficient83_137, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_139, Icur := OriginalRow227TriangleData1123.coefficient82_138,
    output := OriginalRow227TriangleData1134.coefficient83_138, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_140, Icur := OriginalRow227TriangleData1123.coefficient82_139,
    output := OriginalRow227TriangleData1134.coefficient83_139, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_141, Icur := OriginalRow227TriangleData1123.coefficient82_140,
    output := OriginalRow227TriangleData1134.coefficient83_140, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_142, Icur := OriginalRow227TriangleData1123.coefficient82_141,
    output := OriginalRow227TriangleData1134.coefficient83_141, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_143, Icur := OriginalRow227TriangleData1123.coefficient82_142,
    output := OriginalRow227TriangleData1134.coefficient83_142, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1123.coefficient82_144, Icur := OriginalRow227TriangleData1123.coefficient82_143,
    output := OriginalRow227TriangleData1134.coefficient83_143, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1124.coefficient82_145, Icur := OriginalRow227TriangleData1123.coefficient82_144,
    output := OriginalRow227TriangleData1134.coefficient83_144, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1124.coefficient82_146, Icur := OriginalRow227TriangleData1124.coefficient82_145,
    output := OriginalRow227TriangleData1134.coefficient83_145, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1118

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1118.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
