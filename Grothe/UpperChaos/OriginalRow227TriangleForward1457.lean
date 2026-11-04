import Grothe.UpperChaos.OriginalRow227TriangleData1464
import Grothe.UpperChaos.OriginalRow227TriangleData1465
import Grothe.UpperChaos.OriginalRow227TriangleData1473
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1457
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_117, Icur := OriginalRow227TriangleData1464.coefficient116_116,
    output := OriginalRow227TriangleData1473.coefficient117_116, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_118, Icur := OriginalRow227TriangleData1464.coefficient116_117,
    output := OriginalRow227TriangleData1473.coefficient117_117, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_119, Icur := OriginalRow227TriangleData1464.coefficient116_118,
    output := OriginalRow227TriangleData1473.coefficient117_118, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_120, Icur := OriginalRow227TriangleData1464.coefficient116_119,
    output := OriginalRow227TriangleData1473.coefficient117_119, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_121, Icur := OriginalRow227TriangleData1464.coefficient116_120,
    output := OriginalRow227TriangleData1473.coefficient117_120, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_122, Icur := OriginalRow227TriangleData1464.coefficient116_121,
    output := OriginalRow227TriangleData1473.coefficient117_121, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_123, Icur := OriginalRow227TriangleData1464.coefficient116_122,
    output := OriginalRow227TriangleData1473.coefficient117_122, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_124, Icur := OriginalRow227TriangleData1464.coefficient116_123,
    output := OriginalRow227TriangleData1473.coefficient117_123, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_125, Icur := OriginalRow227TriangleData1464.coefficient116_124,
    output := OriginalRow227TriangleData1473.coefficient117_124, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_126, Icur := OriginalRow227TriangleData1464.coefficient116_125,
    output := OriginalRow227TriangleData1473.coefficient117_125, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_127, Icur := OriginalRow227TriangleData1464.coefficient116_126,
    output := OriginalRow227TriangleData1473.coefficient117_126, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_128, Icur := OriginalRow227TriangleData1464.coefficient116_127,
    output := OriginalRow227TriangleData1473.coefficient117_127, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_129, Icur := OriginalRow227TriangleData1464.coefficient116_128,
    output := OriginalRow227TriangleData1473.coefficient117_128, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_130, Icur := OriginalRow227TriangleData1464.coefficient116_129,
    output := OriginalRow227TriangleData1473.coefficient117_129, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_131, Icur := OriginalRow227TriangleData1464.coefficient116_130,
    output := OriginalRow227TriangleData1473.coefficient117_130, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_132, Icur := OriginalRow227TriangleData1464.coefficient116_131,
    output := OriginalRow227TriangleData1473.coefficient117_131, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_133, Icur := OriginalRow227TriangleData1464.coefficient116_132,
    output := OriginalRow227TriangleData1473.coefficient117_132, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_134, Icur := OriginalRow227TriangleData1464.coefficient116_133,
    output := OriginalRow227TriangleData1473.coefficient117_133, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_135, Icur := OriginalRow227TriangleData1464.coefficient116_134,
    output := OriginalRow227TriangleData1473.coefficient117_134, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_136, Icur := OriginalRow227TriangleData1464.coefficient116_135,
    output := OriginalRow227TriangleData1473.coefficient117_135, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_137, Icur := OriginalRow227TriangleData1464.coefficient116_136,
    output := OriginalRow227TriangleData1473.coefficient117_136, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_138, Icur := OriginalRow227TriangleData1464.coefficient116_137,
    output := OriginalRow227TriangleData1473.coefficient117_137, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_139, Icur := OriginalRow227TriangleData1464.coefficient116_138,
    output := OriginalRow227TriangleData1473.coefficient117_138, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_140, Icur := OriginalRow227TriangleData1464.coefficient116_139,
    output := OriginalRow227TriangleData1473.coefficient117_139, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_141, Icur := OriginalRow227TriangleData1464.coefficient116_140,
    output := OriginalRow227TriangleData1473.coefficient117_140, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_142, Icur := OriginalRow227TriangleData1464.coefficient116_141,
    output := OriginalRow227TriangleData1473.coefficient117_141, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_143, Icur := OriginalRow227TriangleData1464.coefficient116_142,
    output := OriginalRow227TriangleData1473.coefficient117_142, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_144, Icur := OriginalRow227TriangleData1464.coefficient116_143,
    output := OriginalRow227TriangleData1473.coefficient117_143, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_145, Icur := OriginalRow227TriangleData1464.coefficient116_144,
    output := OriginalRow227TriangleData1473.coefficient117_144, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1464.coefficient116_146, Icur := OriginalRow227TriangleData1464.coefficient116_145,
    output := OriginalRow227TriangleData1473.coefficient117_145, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1465.coefficient116_147, Icur := OriginalRow227TriangleData1464.coefficient116_146,
    output := OriginalRow227TriangleData1473.coefficient117_146, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1465.coefficient116_148, Icur := OriginalRow227TriangleData1465.coefficient116_147,
    output := OriginalRow227TriangleData1473.coefficient117_147, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1457

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1457.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
