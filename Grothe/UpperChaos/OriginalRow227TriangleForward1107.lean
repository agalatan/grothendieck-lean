import Grothe.UpperChaos.OriginalRow227TriangleData1112
import Grothe.UpperChaos.OriginalRow227TriangleData1113
import Grothe.UpperChaos.OriginalRow227TriangleData1123
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1107
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_114, Icur := OriginalRow227TriangleData1112.coefficient81_113,
    output := OriginalRow227TriangleData1123.coefficient82_113, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_115, Icur := OriginalRow227TriangleData1112.coefficient81_114,
    output := OriginalRow227TriangleData1123.coefficient82_114, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_116, Icur := OriginalRow227TriangleData1112.coefficient81_115,
    output := OriginalRow227TriangleData1123.coefficient82_115, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_117, Icur := OriginalRow227TriangleData1112.coefficient81_116,
    output := OriginalRow227TriangleData1123.coefficient82_116, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_118, Icur := OriginalRow227TriangleData1112.coefficient81_117,
    output := OriginalRow227TriangleData1123.coefficient82_117, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_119, Icur := OriginalRow227TriangleData1112.coefficient81_118,
    output := OriginalRow227TriangleData1123.coefficient82_118, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_120, Icur := OriginalRow227TriangleData1112.coefficient81_119,
    output := OriginalRow227TriangleData1123.coefficient82_119, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_121, Icur := OriginalRow227TriangleData1112.coefficient81_120,
    output := OriginalRow227TriangleData1123.coefficient82_120, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_122, Icur := OriginalRow227TriangleData1112.coefficient81_121,
    output := OriginalRow227TriangleData1123.coefficient82_121, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_123, Icur := OriginalRow227TriangleData1112.coefficient81_122,
    output := OriginalRow227TriangleData1123.coefficient82_122, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_124, Icur := OriginalRow227TriangleData1112.coefficient81_123,
    output := OriginalRow227TriangleData1123.coefficient82_123, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_125, Icur := OriginalRow227TriangleData1112.coefficient81_124,
    output := OriginalRow227TriangleData1123.coefficient82_124, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_126, Icur := OriginalRow227TriangleData1112.coefficient81_125,
    output := OriginalRow227TriangleData1123.coefficient82_125, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_127, Icur := OriginalRow227TriangleData1112.coefficient81_126,
    output := OriginalRow227TriangleData1123.coefficient82_126, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_128, Icur := OriginalRow227TriangleData1112.coefficient81_127,
    output := OriginalRow227TriangleData1123.coefficient82_127, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_129, Icur := OriginalRow227TriangleData1112.coefficient81_128,
    output := OriginalRow227TriangleData1123.coefficient82_128, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_130, Icur := OriginalRow227TriangleData1112.coefficient81_129,
    output := OriginalRow227TriangleData1123.coefficient82_129, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_131, Icur := OriginalRow227TriangleData1112.coefficient81_130,
    output := OriginalRow227TriangleData1123.coefficient82_130, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_132, Icur := OriginalRow227TriangleData1112.coefficient81_131,
    output := OriginalRow227TriangleData1123.coefficient82_131, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_133, Icur := OriginalRow227TriangleData1112.coefficient81_132,
    output := OriginalRow227TriangleData1123.coefficient82_132, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_134, Icur := OriginalRow227TriangleData1112.coefficient81_133,
    output := OriginalRow227TriangleData1123.coefficient82_133, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_135, Icur := OriginalRow227TriangleData1112.coefficient81_134,
    output := OriginalRow227TriangleData1123.coefficient82_134, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_136, Icur := OriginalRow227TriangleData1112.coefficient81_135,
    output := OriginalRow227TriangleData1123.coefficient82_135, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_137, Icur := OriginalRow227TriangleData1112.coefficient81_136,
    output := OriginalRow227TriangleData1123.coefficient82_136, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_138, Icur := OriginalRow227TriangleData1112.coefficient81_137,
    output := OriginalRow227TriangleData1123.coefficient82_137, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_139, Icur := OriginalRow227TriangleData1112.coefficient81_138,
    output := OriginalRow227TriangleData1123.coefficient82_138, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_140, Icur := OriginalRow227TriangleData1112.coefficient81_139,
    output := OriginalRow227TriangleData1123.coefficient82_139, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_141, Icur := OriginalRow227TriangleData1112.coefficient81_140,
    output := OriginalRow227TriangleData1123.coefficient82_140, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_142, Icur := OriginalRow227TriangleData1112.coefficient81_141,
    output := OriginalRow227TriangleData1123.coefficient82_141, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_143, Icur := OriginalRow227TriangleData1112.coefficient81_142,
    output := OriginalRow227TriangleData1123.coefficient82_142, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_144, Icur := OriginalRow227TriangleData1112.coefficient81_143,
    output := OriginalRow227TriangleData1123.coefficient82_143, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_145, Icur := OriginalRow227TriangleData1113.coefficient81_144,
    output := OriginalRow227TriangleData1123.coefficient82_144, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1107

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1107.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
