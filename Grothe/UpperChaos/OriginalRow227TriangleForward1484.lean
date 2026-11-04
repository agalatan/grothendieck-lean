import Grothe.UpperChaos.OriginalRow227TriangleData1491
import Grothe.UpperChaos.OriginalRow227TriangleData1492
import Grothe.UpperChaos.OriginalRow227TriangleData1500
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1484
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_120, Icur := OriginalRow227TriangleData1491.coefficient119_119,
    output := OriginalRow227TriangleData1500.coefficient120_119, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_121, Icur := OriginalRow227TriangleData1491.coefficient119_120,
    output := OriginalRow227TriangleData1500.coefficient120_120, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_122, Icur := OriginalRow227TriangleData1491.coefficient119_121,
    output := OriginalRow227TriangleData1500.coefficient120_121, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_123, Icur := OriginalRow227TriangleData1491.coefficient119_122,
    output := OriginalRow227TriangleData1500.coefficient120_122, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_124, Icur := OriginalRow227TriangleData1491.coefficient119_123,
    output := OriginalRow227TriangleData1500.coefficient120_123, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_125, Icur := OriginalRow227TriangleData1491.coefficient119_124,
    output := OriginalRow227TriangleData1500.coefficient120_124, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_126, Icur := OriginalRow227TriangleData1491.coefficient119_125,
    output := OriginalRow227TriangleData1500.coefficient120_125, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_127, Icur := OriginalRow227TriangleData1491.coefficient119_126,
    output := OriginalRow227TriangleData1500.coefficient120_126, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_128, Icur := OriginalRow227TriangleData1491.coefficient119_127,
    output := OriginalRow227TriangleData1500.coefficient120_127, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_129, Icur := OriginalRow227TriangleData1491.coefficient119_128,
    output := OriginalRow227TriangleData1500.coefficient120_128, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_130, Icur := OriginalRow227TriangleData1491.coefficient119_129,
    output := OriginalRow227TriangleData1500.coefficient120_129, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_131, Icur := OriginalRow227TriangleData1491.coefficient119_130,
    output := OriginalRow227TriangleData1500.coefficient120_130, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_132, Icur := OriginalRow227TriangleData1491.coefficient119_131,
    output := OriginalRow227TriangleData1500.coefficient120_131, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_133, Icur := OriginalRow227TriangleData1491.coefficient119_132,
    output := OriginalRow227TriangleData1500.coefficient120_132, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_134, Icur := OriginalRow227TriangleData1491.coefficient119_133,
    output := OriginalRow227TriangleData1500.coefficient120_133, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_135, Icur := OriginalRow227TriangleData1491.coefficient119_134,
    output := OriginalRow227TriangleData1500.coefficient120_134, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_136, Icur := OriginalRow227TriangleData1491.coefficient119_135,
    output := OriginalRow227TriangleData1500.coefficient120_135, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_137, Icur := OriginalRow227TriangleData1491.coefficient119_136,
    output := OriginalRow227TriangleData1500.coefficient120_136, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_138, Icur := OriginalRow227TriangleData1491.coefficient119_137,
    output := OriginalRow227TriangleData1500.coefficient120_137, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_139, Icur := OriginalRow227TriangleData1491.coefficient119_138,
    output := OriginalRow227TriangleData1500.coefficient120_138, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_140, Icur := OriginalRow227TriangleData1491.coefficient119_139,
    output := OriginalRow227TriangleData1500.coefficient120_139, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_141, Icur := OriginalRow227TriangleData1491.coefficient119_140,
    output := OriginalRow227TriangleData1500.coefficient120_140, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_142, Icur := OriginalRow227TriangleData1491.coefficient119_141,
    output := OriginalRow227TriangleData1500.coefficient120_141, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_143, Icur := OriginalRow227TriangleData1491.coefficient119_142,
    output := OriginalRow227TriangleData1500.coefficient120_142, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_144, Icur := OriginalRow227TriangleData1491.coefficient119_143,
    output := OriginalRow227TriangleData1500.coefficient120_143, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_145, Icur := OriginalRow227TriangleData1491.coefficient119_144,
    output := OriginalRow227TriangleData1500.coefficient120_144, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_146, Icur := OriginalRow227TriangleData1491.coefficient119_145,
    output := OriginalRow227TriangleData1500.coefficient120_145, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_147, Icur := OriginalRow227TriangleData1491.coefficient119_146,
    output := OriginalRow227TriangleData1500.coefficient120_146, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_148, Icur := OriginalRow227TriangleData1491.coefficient119_147,
    output := OriginalRow227TriangleData1500.coefficient120_147, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1491.coefficient119_149, Icur := OriginalRow227TriangleData1491.coefficient119_148,
    output := OriginalRow227TriangleData1500.coefficient120_148, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_150, Icur := OriginalRow227TriangleData1491.coefficient119_149,
    output := OriginalRow227TriangleData1500.coefficient120_149, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_151, Icur := OriginalRow227TriangleData1492.coefficient119_150,
    output := OriginalRow227TriangleData1500.coefficient120_150, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1484

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1484.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
