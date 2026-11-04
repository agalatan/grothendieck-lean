import Grothe.UpperChaos.OriginalRow227TriangleData1419
import Grothe.UpperChaos.OriginalRow227TriangleData1420
import Grothe.UpperChaos.OriginalRow227TriangleData1428
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1412
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_112, Icur := OriginalRow227TriangleData1419.coefficient111_111,
    output := OriginalRow227TriangleData1428.coefficient112_111, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_113, Icur := OriginalRow227TriangleData1419.coefficient111_112,
    output := OriginalRow227TriangleData1428.coefficient112_112, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_114, Icur := OriginalRow227TriangleData1419.coefficient111_113,
    output := OriginalRow227TriangleData1428.coefficient112_113, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_115, Icur := OriginalRow227TriangleData1419.coefficient111_114,
    output := OriginalRow227TriangleData1428.coefficient112_114, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_116, Icur := OriginalRow227TriangleData1419.coefficient111_115,
    output := OriginalRow227TriangleData1428.coefficient112_115, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_117, Icur := OriginalRow227TriangleData1419.coefficient111_116,
    output := OriginalRow227TriangleData1428.coefficient112_116, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_118, Icur := OriginalRow227TriangleData1419.coefficient111_117,
    output := OriginalRow227TriangleData1428.coefficient112_117, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_119, Icur := OriginalRow227TriangleData1419.coefficient111_118,
    output := OriginalRow227TriangleData1428.coefficient112_118, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_120, Icur := OriginalRow227TriangleData1419.coefficient111_119,
    output := OriginalRow227TriangleData1428.coefficient112_119, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_121, Icur := OriginalRow227TriangleData1419.coefficient111_120,
    output := OriginalRow227TriangleData1428.coefficient112_120, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_122, Icur := OriginalRow227TriangleData1419.coefficient111_121,
    output := OriginalRow227TriangleData1428.coefficient112_121, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_123, Icur := OriginalRow227TriangleData1419.coefficient111_122,
    output := OriginalRow227TriangleData1428.coefficient112_122, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_124, Icur := OriginalRow227TriangleData1419.coefficient111_123,
    output := OriginalRow227TriangleData1428.coefficient112_123, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_125, Icur := OriginalRow227TriangleData1419.coefficient111_124,
    output := OriginalRow227TriangleData1428.coefficient112_124, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_126, Icur := OriginalRow227TriangleData1419.coefficient111_125,
    output := OriginalRow227TriangleData1428.coefficient112_125, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_127, Icur := OriginalRow227TriangleData1419.coefficient111_126,
    output := OriginalRow227TriangleData1428.coefficient112_126, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_128, Icur := OriginalRow227TriangleData1419.coefficient111_127,
    output := OriginalRow227TriangleData1428.coefficient112_127, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_129, Icur := OriginalRow227TriangleData1419.coefficient111_128,
    output := OriginalRow227TriangleData1428.coefficient112_128, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_130, Icur := OriginalRow227TriangleData1419.coefficient111_129,
    output := OriginalRow227TriangleData1428.coefficient112_129, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_131, Icur := OriginalRow227TriangleData1419.coefficient111_130,
    output := OriginalRow227TriangleData1428.coefficient112_130, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_132, Icur := OriginalRow227TriangleData1419.coefficient111_131,
    output := OriginalRow227TriangleData1428.coefficient112_131, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_133, Icur := OriginalRow227TriangleData1419.coefficient111_132,
    output := OriginalRow227TriangleData1428.coefficient112_132, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_134, Icur := OriginalRow227TriangleData1419.coefficient111_133,
    output := OriginalRow227TriangleData1428.coefficient112_133, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_135, Icur := OriginalRow227TriangleData1419.coefficient111_134,
    output := OriginalRow227TriangleData1428.coefficient112_134, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_136, Icur := OriginalRow227TriangleData1419.coefficient111_135,
    output := OriginalRow227TriangleData1428.coefficient112_135, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_137, Icur := OriginalRow227TriangleData1419.coefficient111_136,
    output := OriginalRow227TriangleData1428.coefficient112_136, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_138, Icur := OriginalRow227TriangleData1419.coefficient111_137,
    output := OriginalRow227TriangleData1428.coefficient112_137, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_139, Icur := OriginalRow227TriangleData1419.coefficient111_138,
    output := OriginalRow227TriangleData1428.coefficient112_138, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_140, Icur := OriginalRow227TriangleData1419.coefficient111_139,
    output := OriginalRow227TriangleData1428.coefficient112_139, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1419.coefficient111_141, Icur := OriginalRow227TriangleData1419.coefficient111_140,
    output := OriginalRow227TriangleData1428.coefficient112_140, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1420.coefficient111_142, Icur := OriginalRow227TriangleData1419.coefficient111_141,
    output := OriginalRow227TriangleData1428.coefficient112_141, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1420.coefficient111_143, Icur := OriginalRow227TriangleData1420.coefficient111_142,
    output := OriginalRow227TriangleData1428.coefficient112_142, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1412

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1412.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
