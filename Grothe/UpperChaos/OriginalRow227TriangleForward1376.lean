import Grothe.UpperChaos.OriginalRow227TriangleData1382
import Grothe.UpperChaos.OriginalRow227TriangleData1383
import Grothe.UpperChaos.OriginalRow227TriangleData1392
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1376
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_108, Icur := OriginalRow227TriangleData1382.coefficient107_107,
    output := OriginalRow227TriangleData1392.coefficient108_107, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_109, Icur := OriginalRow227TriangleData1382.coefficient107_108,
    output := OriginalRow227TriangleData1392.coefficient108_108, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_110, Icur := OriginalRow227TriangleData1382.coefficient107_109,
    output := OriginalRow227TriangleData1392.coefficient108_109, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_111, Icur := OriginalRow227TriangleData1382.coefficient107_110,
    output := OriginalRow227TriangleData1392.coefficient108_110, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_112, Icur := OriginalRow227TriangleData1382.coefficient107_111,
    output := OriginalRow227TriangleData1392.coefficient108_111, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_113, Icur := OriginalRow227TriangleData1382.coefficient107_112,
    output := OriginalRow227TriangleData1392.coefficient108_112, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_114, Icur := OriginalRow227TriangleData1382.coefficient107_113,
    output := OriginalRow227TriangleData1392.coefficient108_113, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_115, Icur := OriginalRow227TriangleData1382.coefficient107_114,
    output := OriginalRow227TriangleData1392.coefficient108_114, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_116, Icur := OriginalRow227TriangleData1382.coefficient107_115,
    output := OriginalRow227TriangleData1392.coefficient108_115, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_117, Icur := OriginalRow227TriangleData1382.coefficient107_116,
    output := OriginalRow227TriangleData1392.coefficient108_116, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_118, Icur := OriginalRow227TriangleData1382.coefficient107_117,
    output := OriginalRow227TriangleData1392.coefficient108_117, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_119, Icur := OriginalRow227TriangleData1382.coefficient107_118,
    output := OriginalRow227TriangleData1392.coefficient108_118, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_120, Icur := OriginalRow227TriangleData1382.coefficient107_119,
    output := OriginalRow227TriangleData1392.coefficient108_119, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_121, Icur := OriginalRow227TriangleData1382.coefficient107_120,
    output := OriginalRow227TriangleData1392.coefficient108_120, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_122, Icur := OriginalRow227TriangleData1382.coefficient107_121,
    output := OriginalRow227TriangleData1392.coefficient108_121, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_123, Icur := OriginalRow227TriangleData1382.coefficient107_122,
    output := OriginalRow227TriangleData1392.coefficient108_122, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_124, Icur := OriginalRow227TriangleData1382.coefficient107_123,
    output := OriginalRow227TriangleData1392.coefficient108_123, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_125, Icur := OriginalRow227TriangleData1382.coefficient107_124,
    output := OriginalRow227TriangleData1392.coefficient108_124, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_126, Icur := OriginalRow227TriangleData1382.coefficient107_125,
    output := OriginalRow227TriangleData1392.coefficient108_125, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_127, Icur := OriginalRow227TriangleData1382.coefficient107_126,
    output := OriginalRow227TriangleData1392.coefficient108_126, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_128, Icur := OriginalRow227TriangleData1382.coefficient107_127,
    output := OriginalRow227TriangleData1392.coefficient108_127, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_129, Icur := OriginalRow227TriangleData1382.coefficient107_128,
    output := OriginalRow227TriangleData1392.coefficient108_128, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_130, Icur := OriginalRow227TriangleData1382.coefficient107_129,
    output := OriginalRow227TriangleData1392.coefficient108_129, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_131, Icur := OriginalRow227TriangleData1382.coefficient107_130,
    output := OriginalRow227TriangleData1392.coefficient108_130, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_132, Icur := OriginalRow227TriangleData1382.coefficient107_131,
    output := OriginalRow227TriangleData1392.coefficient108_131, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_133, Icur := OriginalRow227TriangleData1382.coefficient107_132,
    output := OriginalRow227TriangleData1392.coefficient108_132, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_134, Icur := OriginalRow227TriangleData1382.coefficient107_133,
    output := OriginalRow227TriangleData1392.coefficient108_133, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_135, Icur := OriginalRow227TriangleData1382.coefficient107_134,
    output := OriginalRow227TriangleData1392.coefficient108_134, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_136, Icur := OriginalRow227TriangleData1382.coefficient107_135,
    output := OriginalRow227TriangleData1392.coefficient108_135, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1382.coefficient107_137, Icur := OriginalRow227TriangleData1382.coefficient107_136,
    output := OriginalRow227TriangleData1392.coefficient108_136, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1383.coefficient107_138, Icur := OriginalRow227TriangleData1382.coefficient107_137,
    output := OriginalRow227TriangleData1392.coefficient108_137, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1383.coefficient107_139, Icur := OriginalRow227TriangleData1383.coefficient107_138,
    output := OriginalRow227TriangleData1392.coefficient108_138, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1376

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1376.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
