import Grothe.UpperChaos.OriginalRow227TriangleData0051
import Grothe.UpperChaos.OriginalRow227TriangleData0052
import Grothe.UpperChaos.OriginalRow227TriangleData0067
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0051
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_100, Icur := OriginalRow227TriangleData0051.coefficient3_99,
    output := OriginalRow227TriangleData0067.coefficient4_99, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_101, Icur := OriginalRow227TriangleData0051.coefficient3_100,
    output := OriginalRow227TriangleData0067.coefficient4_100, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_102, Icur := OriginalRow227TriangleData0051.coefficient3_101,
    output := OriginalRow227TriangleData0067.coefficient4_101, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_103, Icur := OriginalRow227TriangleData0051.coefficient3_102,
    output := OriginalRow227TriangleData0067.coefficient4_102, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_104, Icur := OriginalRow227TriangleData0051.coefficient3_103,
    output := OriginalRow227TriangleData0067.coefficient4_103, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_105, Icur := OriginalRow227TriangleData0051.coefficient3_104,
    output := OriginalRow227TriangleData0067.coefficient4_104, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_106, Icur := OriginalRow227TriangleData0051.coefficient3_105,
    output := OriginalRow227TriangleData0067.coefficient4_105, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_107, Icur := OriginalRow227TriangleData0051.coefficient3_106,
    output := OriginalRow227TriangleData0067.coefficient4_106, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_108, Icur := OriginalRow227TriangleData0051.coefficient3_107,
    output := OriginalRow227TriangleData0067.coefficient4_107, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_109, Icur := OriginalRow227TriangleData0051.coefficient3_108,
    output := OriginalRow227TriangleData0067.coefficient4_108, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_110, Icur := OriginalRow227TriangleData0051.coefficient3_109,
    output := OriginalRow227TriangleData0067.coefficient4_109, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_111, Icur := OriginalRow227TriangleData0051.coefficient3_110,
    output := OriginalRow227TriangleData0067.coefficient4_110, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_112, Icur := OriginalRow227TriangleData0051.coefficient3_111,
    output := OriginalRow227TriangleData0067.coefficient4_111, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_113, Icur := OriginalRow227TriangleData0051.coefficient3_112,
    output := OriginalRow227TriangleData0067.coefficient4_112, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_114, Icur := OriginalRow227TriangleData0051.coefficient3_113,
    output := OriginalRow227TriangleData0067.coefficient4_113, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_115, Icur := OriginalRow227TriangleData0051.coefficient3_114,
    output := OriginalRow227TriangleData0067.coefficient4_114, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_116, Icur := OriginalRow227TriangleData0051.coefficient3_115,
    output := OriginalRow227TriangleData0067.coefficient4_115, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_117, Icur := OriginalRow227TriangleData0051.coefficient3_116,
    output := OriginalRow227TriangleData0067.coefficient4_116, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_118, Icur := OriginalRow227TriangleData0051.coefficient3_117,
    output := OriginalRow227TriangleData0067.coefficient4_117, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_119, Icur := OriginalRow227TriangleData0051.coefficient3_118,
    output := OriginalRow227TriangleData0067.coefficient4_118, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_120, Icur := OriginalRow227TriangleData0051.coefficient3_119,
    output := OriginalRow227TriangleData0067.coefficient4_119, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_121, Icur := OriginalRow227TriangleData0051.coefficient3_120,
    output := OriginalRow227TriangleData0067.coefficient4_120, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_122, Icur := OriginalRow227TriangleData0051.coefficient3_121,
    output := OriginalRow227TriangleData0067.coefficient4_121, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_123, Icur := OriginalRow227TriangleData0051.coefficient3_122,
    output := OriginalRow227TriangleData0067.coefficient4_122, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_124, Icur := OriginalRow227TriangleData0051.coefficient3_123,
    output := OriginalRow227TriangleData0067.coefficient4_123, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_125, Icur := OriginalRow227TriangleData0051.coefficient3_124,
    output := OriginalRow227TriangleData0067.coefficient4_124, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_126, Icur := OriginalRow227TriangleData0051.coefficient3_125,
    output := OriginalRow227TriangleData0067.coefficient4_125, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_127, Icur := OriginalRow227TriangleData0051.coefficient3_126,
    output := OriginalRow227TriangleData0067.coefficient4_126, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_128, Icur := OriginalRow227TriangleData0051.coefficient3_127,
    output := OriginalRow227TriangleData0067.coefficient4_127, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0051.coefficient3_129, Icur := OriginalRow227TriangleData0051.coefficient3_128,
    output := OriginalRow227TriangleData0067.coefficient4_128, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0052.coefficient3_130, Icur := OriginalRow227TriangleData0051.coefficient3_129,
    output := OriginalRow227TriangleData0067.coefficient4_129, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0052.coefficient3_131, Icur := OriginalRow227TriangleData0052.coefficient3_130,
    output := OriginalRow227TriangleData0067.coefficient4_130, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0051

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0051.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
