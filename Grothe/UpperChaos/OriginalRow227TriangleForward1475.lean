import Grothe.UpperChaos.OriginalRow227TriangleData1482
import Grothe.UpperChaos.OriginalRow227TriangleData1483
import Grothe.UpperChaos.OriginalRow227TriangleData1491
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1475
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_119, Icur := OriginalRow227TriangleData1482.coefficient118_118,
    output := OriginalRow227TriangleData1491.coefficient119_118, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_120, Icur := OriginalRow227TriangleData1482.coefficient118_119,
    output := OriginalRow227TriangleData1491.coefficient119_119, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_121, Icur := OriginalRow227TriangleData1482.coefficient118_120,
    output := OriginalRow227TriangleData1491.coefficient119_120, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_122, Icur := OriginalRow227TriangleData1482.coefficient118_121,
    output := OriginalRow227TriangleData1491.coefficient119_121, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_123, Icur := OriginalRow227TriangleData1482.coefficient118_122,
    output := OriginalRow227TriangleData1491.coefficient119_122, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_124, Icur := OriginalRow227TriangleData1482.coefficient118_123,
    output := OriginalRow227TriangleData1491.coefficient119_123, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_125, Icur := OriginalRow227TriangleData1482.coefficient118_124,
    output := OriginalRow227TriangleData1491.coefficient119_124, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_126, Icur := OriginalRow227TriangleData1482.coefficient118_125,
    output := OriginalRow227TriangleData1491.coefficient119_125, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_127, Icur := OriginalRow227TriangleData1482.coefficient118_126,
    output := OriginalRow227TriangleData1491.coefficient119_126, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_128, Icur := OriginalRow227TriangleData1482.coefficient118_127,
    output := OriginalRow227TriangleData1491.coefficient119_127, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_129, Icur := OriginalRow227TriangleData1482.coefficient118_128,
    output := OriginalRow227TriangleData1491.coefficient119_128, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_130, Icur := OriginalRow227TriangleData1482.coefficient118_129,
    output := OriginalRow227TriangleData1491.coefficient119_129, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_131, Icur := OriginalRow227TriangleData1482.coefficient118_130,
    output := OriginalRow227TriangleData1491.coefficient119_130, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_132, Icur := OriginalRow227TriangleData1482.coefficient118_131,
    output := OriginalRow227TriangleData1491.coefficient119_131, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_133, Icur := OriginalRow227TriangleData1482.coefficient118_132,
    output := OriginalRow227TriangleData1491.coefficient119_132, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_134, Icur := OriginalRow227TriangleData1482.coefficient118_133,
    output := OriginalRow227TriangleData1491.coefficient119_133, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_135, Icur := OriginalRow227TriangleData1482.coefficient118_134,
    output := OriginalRow227TriangleData1491.coefficient119_134, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_136, Icur := OriginalRow227TriangleData1482.coefficient118_135,
    output := OriginalRow227TriangleData1491.coefficient119_135, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_137, Icur := OriginalRow227TriangleData1482.coefficient118_136,
    output := OriginalRow227TriangleData1491.coefficient119_136, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_138, Icur := OriginalRow227TriangleData1482.coefficient118_137,
    output := OriginalRow227TriangleData1491.coefficient119_137, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_139, Icur := OriginalRow227TriangleData1482.coefficient118_138,
    output := OriginalRow227TriangleData1491.coefficient119_138, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_140, Icur := OriginalRow227TriangleData1482.coefficient118_139,
    output := OriginalRow227TriangleData1491.coefficient119_139, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_141, Icur := OriginalRow227TriangleData1482.coefficient118_140,
    output := OriginalRow227TriangleData1491.coefficient119_140, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_142, Icur := OriginalRow227TriangleData1482.coefficient118_141,
    output := OriginalRow227TriangleData1491.coefficient119_141, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_143, Icur := OriginalRow227TriangleData1482.coefficient118_142,
    output := OriginalRow227TriangleData1491.coefficient119_142, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_144, Icur := OriginalRow227TriangleData1482.coefficient118_143,
    output := OriginalRow227TriangleData1491.coefficient119_143, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_145, Icur := OriginalRow227TriangleData1482.coefficient118_144,
    output := OriginalRow227TriangleData1491.coefficient119_144, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_146, Icur := OriginalRow227TriangleData1482.coefficient118_145,
    output := OriginalRow227TriangleData1491.coefficient119_145, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_147, Icur := OriginalRow227TriangleData1482.coefficient118_146,
    output := OriginalRow227TriangleData1491.coefficient119_146, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1482.coefficient118_148, Icur := OriginalRow227TriangleData1482.coefficient118_147,
    output := OriginalRow227TriangleData1491.coefficient119_147, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_149, Icur := OriginalRow227TriangleData1482.coefficient118_148,
    output := OriginalRow227TriangleData1491.coefficient119_148, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_150, Icur := OriginalRow227TriangleData1483.coefficient118_149,
    output := OriginalRow227TriangleData1491.coefficient119_149, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1475

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1475.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
