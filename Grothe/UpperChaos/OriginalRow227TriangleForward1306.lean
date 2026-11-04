import Grothe.UpperChaos.OriginalRow227TriangleData1312
import Grothe.UpperChaos.OriginalRow227TriangleData1313
import Grothe.UpperChaos.OriginalRow227TriangleData1322
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1306
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_101, Icur := OriginalRow227TriangleData1312.coefficient100_100,
    output := OriginalRow227TriangleData1322.coefficient101_100, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_102, Icur := OriginalRow227TriangleData1312.coefficient100_101,
    output := OriginalRow227TriangleData1322.coefficient101_101, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_103, Icur := OriginalRow227TriangleData1312.coefficient100_102,
    output := OriginalRow227TriangleData1322.coefficient101_102, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_104, Icur := OriginalRow227TriangleData1312.coefficient100_103,
    output := OriginalRow227TriangleData1322.coefficient101_103, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_105, Icur := OriginalRow227TriangleData1312.coefficient100_104,
    output := OriginalRow227TriangleData1322.coefficient101_104, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_106, Icur := OriginalRow227TriangleData1312.coefficient100_105,
    output := OriginalRow227TriangleData1322.coefficient101_105, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_107, Icur := OriginalRow227TriangleData1312.coefficient100_106,
    output := OriginalRow227TriangleData1322.coefficient101_106, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_108, Icur := OriginalRow227TriangleData1312.coefficient100_107,
    output := OriginalRow227TriangleData1322.coefficient101_107, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_109, Icur := OriginalRow227TriangleData1312.coefficient100_108,
    output := OriginalRow227TriangleData1322.coefficient101_108, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_110, Icur := OriginalRow227TriangleData1312.coefficient100_109,
    output := OriginalRow227TriangleData1322.coefficient101_109, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_111, Icur := OriginalRow227TriangleData1312.coefficient100_110,
    output := OriginalRow227TriangleData1322.coefficient101_110, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_112, Icur := OriginalRow227TriangleData1312.coefficient100_111,
    output := OriginalRow227TriangleData1322.coefficient101_111, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_113, Icur := OriginalRow227TriangleData1312.coefficient100_112,
    output := OriginalRow227TriangleData1322.coefficient101_112, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_114, Icur := OriginalRow227TriangleData1312.coefficient100_113,
    output := OriginalRow227TriangleData1322.coefficient101_113, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_115, Icur := OriginalRow227TriangleData1312.coefficient100_114,
    output := OriginalRow227TriangleData1322.coefficient101_114, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_116, Icur := OriginalRow227TriangleData1312.coefficient100_115,
    output := OriginalRow227TriangleData1322.coefficient101_115, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_117, Icur := OriginalRow227TriangleData1312.coefficient100_116,
    output := OriginalRow227TriangleData1322.coefficient101_116, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_118, Icur := OriginalRow227TriangleData1312.coefficient100_117,
    output := OriginalRow227TriangleData1322.coefficient101_117, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_119, Icur := OriginalRow227TriangleData1312.coefficient100_118,
    output := OriginalRow227TriangleData1322.coefficient101_118, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_120, Icur := OriginalRow227TriangleData1312.coefficient100_119,
    output := OriginalRow227TriangleData1322.coefficient101_119, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_121, Icur := OriginalRow227TriangleData1312.coefficient100_120,
    output := OriginalRow227TriangleData1322.coefficient101_120, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_122, Icur := OriginalRow227TriangleData1312.coefficient100_121,
    output := OriginalRow227TriangleData1322.coefficient101_121, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_123, Icur := OriginalRow227TriangleData1312.coefficient100_122,
    output := OriginalRow227TriangleData1322.coefficient101_122, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_124, Icur := OriginalRow227TriangleData1312.coefficient100_123,
    output := OriginalRow227TriangleData1322.coefficient101_123, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_125, Icur := OriginalRow227TriangleData1312.coefficient100_124,
    output := OriginalRow227TriangleData1322.coefficient101_124, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_126, Icur := OriginalRow227TriangleData1312.coefficient100_125,
    output := OriginalRow227TriangleData1322.coefficient101_125, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_127, Icur := OriginalRow227TriangleData1312.coefficient100_126,
    output := OriginalRow227TriangleData1322.coefficient101_126, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_128, Icur := OriginalRow227TriangleData1312.coefficient100_127,
    output := OriginalRow227TriangleData1322.coefficient101_127, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_129, Icur := OriginalRow227TriangleData1312.coefficient100_128,
    output := OriginalRow227TriangleData1322.coefficient101_128, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1312.coefficient100_130, Icur := OriginalRow227TriangleData1312.coefficient100_129,
    output := OriginalRow227TriangleData1322.coefficient101_129, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_131, Icur := OriginalRow227TriangleData1312.coefficient100_130,
    output := OriginalRow227TriangleData1322.coefficient101_130, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1313.coefficient100_132, Icur := OriginalRow227TriangleData1313.coefficient100_131,
    output := OriginalRow227TriangleData1322.coefficient101_131, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1306

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1306.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
