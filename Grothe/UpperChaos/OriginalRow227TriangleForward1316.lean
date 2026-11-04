import Grothe.UpperChaos.OriginalRow227TriangleData1322
import Grothe.UpperChaos.OriginalRow227TriangleData1323
import Grothe.UpperChaos.OriginalRow227TriangleData1332
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1316
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_102, Icur := OriginalRow227TriangleData1322.coefficient101_101,
    output := OriginalRow227TriangleData1332.coefficient102_101, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_103, Icur := OriginalRow227TriangleData1322.coefficient101_102,
    output := OriginalRow227TriangleData1332.coefficient102_102, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_104, Icur := OriginalRow227TriangleData1322.coefficient101_103,
    output := OriginalRow227TriangleData1332.coefficient102_103, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_105, Icur := OriginalRow227TriangleData1322.coefficient101_104,
    output := OriginalRow227TriangleData1332.coefficient102_104, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_106, Icur := OriginalRow227TriangleData1322.coefficient101_105,
    output := OriginalRow227TriangleData1332.coefficient102_105, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_107, Icur := OriginalRow227TriangleData1322.coefficient101_106,
    output := OriginalRow227TriangleData1332.coefficient102_106, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_108, Icur := OriginalRow227TriangleData1322.coefficient101_107,
    output := OriginalRow227TriangleData1332.coefficient102_107, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_109, Icur := OriginalRow227TriangleData1322.coefficient101_108,
    output := OriginalRow227TriangleData1332.coefficient102_108, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_110, Icur := OriginalRow227TriangleData1322.coefficient101_109,
    output := OriginalRow227TriangleData1332.coefficient102_109, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_111, Icur := OriginalRow227TriangleData1322.coefficient101_110,
    output := OriginalRow227TriangleData1332.coefficient102_110, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_112, Icur := OriginalRow227TriangleData1322.coefficient101_111,
    output := OriginalRow227TriangleData1332.coefficient102_111, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_113, Icur := OriginalRow227TriangleData1322.coefficient101_112,
    output := OriginalRow227TriangleData1332.coefficient102_112, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_114, Icur := OriginalRow227TriangleData1322.coefficient101_113,
    output := OriginalRow227TriangleData1332.coefficient102_113, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_115, Icur := OriginalRow227TriangleData1322.coefficient101_114,
    output := OriginalRow227TriangleData1332.coefficient102_114, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_116, Icur := OriginalRow227TriangleData1322.coefficient101_115,
    output := OriginalRow227TriangleData1332.coefficient102_115, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_117, Icur := OriginalRow227TriangleData1322.coefficient101_116,
    output := OriginalRow227TriangleData1332.coefficient102_116, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_118, Icur := OriginalRow227TriangleData1322.coefficient101_117,
    output := OriginalRow227TriangleData1332.coefficient102_117, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_119, Icur := OriginalRow227TriangleData1322.coefficient101_118,
    output := OriginalRow227TriangleData1332.coefficient102_118, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_120, Icur := OriginalRow227TriangleData1322.coefficient101_119,
    output := OriginalRow227TriangleData1332.coefficient102_119, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_121, Icur := OriginalRow227TriangleData1322.coefficient101_120,
    output := OriginalRow227TriangleData1332.coefficient102_120, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_122, Icur := OriginalRow227TriangleData1322.coefficient101_121,
    output := OriginalRow227TriangleData1332.coefficient102_121, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_123, Icur := OriginalRow227TriangleData1322.coefficient101_122,
    output := OriginalRow227TriangleData1332.coefficient102_122, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_124, Icur := OriginalRow227TriangleData1322.coefficient101_123,
    output := OriginalRow227TriangleData1332.coefficient102_123, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_125, Icur := OriginalRow227TriangleData1322.coefficient101_124,
    output := OriginalRow227TriangleData1332.coefficient102_124, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_126, Icur := OriginalRow227TriangleData1322.coefficient101_125,
    output := OriginalRow227TriangleData1332.coefficient102_125, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_127, Icur := OriginalRow227TriangleData1322.coefficient101_126,
    output := OriginalRow227TriangleData1332.coefficient102_126, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_128, Icur := OriginalRow227TriangleData1322.coefficient101_127,
    output := OriginalRow227TriangleData1332.coefficient102_127, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_129, Icur := OriginalRow227TriangleData1322.coefficient101_128,
    output := OriginalRow227TriangleData1332.coefficient102_128, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_130, Icur := OriginalRow227TriangleData1322.coefficient101_129,
    output := OriginalRow227TriangleData1332.coefficient102_129, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1322.coefficient101_131, Icur := OriginalRow227TriangleData1322.coefficient101_130,
    output := OriginalRow227TriangleData1332.coefficient102_130, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1323.coefficient101_132, Icur := OriginalRow227TriangleData1322.coefficient101_131,
    output := OriginalRow227TriangleData1332.coefficient102_131, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1323.coefficient101_133, Icur := OriginalRow227TriangleData1323.coefficient101_132,
    output := OriginalRow227TriangleData1332.coefficient102_132, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1316

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1316.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
