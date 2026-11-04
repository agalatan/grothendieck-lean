import Grothe.UpperChaos.OriginalRow227TriangleData0546
import Grothe.UpperChaos.OriginalRow227TriangleData0547
import Grothe.UpperChaos.OriginalRow227TriangleData0560
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0544
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_101, Icur := OriginalRow227TriangleData0546.coefficient36_100,
    output := OriginalRow227TriangleData0560.coefficient37_100, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_102, Icur := OriginalRow227TriangleData0546.coefficient36_101,
    output := OriginalRow227TriangleData0560.coefficient37_101, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_103, Icur := OriginalRow227TriangleData0546.coefficient36_102,
    output := OriginalRow227TriangleData0560.coefficient37_102, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_104, Icur := OriginalRow227TriangleData0546.coefficient36_103,
    output := OriginalRow227TriangleData0560.coefficient37_103, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_105, Icur := OriginalRow227TriangleData0546.coefficient36_104,
    output := OriginalRow227TriangleData0560.coefficient37_104, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_106, Icur := OriginalRow227TriangleData0546.coefficient36_105,
    output := OriginalRow227TriangleData0560.coefficient37_105, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_107, Icur := OriginalRow227TriangleData0546.coefficient36_106,
    output := OriginalRow227TriangleData0560.coefficient37_106, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_108, Icur := OriginalRow227TriangleData0546.coefficient36_107,
    output := OriginalRow227TriangleData0560.coefficient37_107, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_109, Icur := OriginalRow227TriangleData0546.coefficient36_108,
    output := OriginalRow227TriangleData0560.coefficient37_108, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_110, Icur := OriginalRow227TriangleData0546.coefficient36_109,
    output := OriginalRow227TriangleData0560.coefficient37_109, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_111, Icur := OriginalRow227TriangleData0546.coefficient36_110,
    output := OriginalRow227TriangleData0560.coefficient37_110, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_112, Icur := OriginalRow227TriangleData0546.coefficient36_111,
    output := OriginalRow227TriangleData0560.coefficient37_111, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_113, Icur := OriginalRow227TriangleData0546.coefficient36_112,
    output := OriginalRow227TriangleData0560.coefficient37_112, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_114, Icur := OriginalRow227TriangleData0546.coefficient36_113,
    output := OriginalRow227TriangleData0560.coefficient37_113, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_115, Icur := OriginalRow227TriangleData0546.coefficient36_114,
    output := OriginalRow227TriangleData0560.coefficient37_114, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_116, Icur := OriginalRow227TriangleData0546.coefficient36_115,
    output := OriginalRow227TriangleData0560.coefficient37_115, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_117, Icur := OriginalRow227TriangleData0546.coefficient36_116,
    output := OriginalRow227TriangleData0560.coefficient37_116, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_118, Icur := OriginalRow227TriangleData0546.coefficient36_117,
    output := OriginalRow227TriangleData0560.coefficient37_117, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_119, Icur := OriginalRow227TriangleData0546.coefficient36_118,
    output := OriginalRow227TriangleData0560.coefficient37_118, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_120, Icur := OriginalRow227TriangleData0546.coefficient36_119,
    output := OriginalRow227TriangleData0560.coefficient37_119, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_121, Icur := OriginalRow227TriangleData0546.coefficient36_120,
    output := OriginalRow227TriangleData0560.coefficient37_120, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_122, Icur := OriginalRow227TriangleData0546.coefficient36_121,
    output := OriginalRow227TriangleData0560.coefficient37_121, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_123, Icur := OriginalRow227TriangleData0546.coefficient36_122,
    output := OriginalRow227TriangleData0560.coefficient37_122, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_124, Icur := OriginalRow227TriangleData0546.coefficient36_123,
    output := OriginalRow227TriangleData0560.coefficient37_123, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_125, Icur := OriginalRow227TriangleData0546.coefficient36_124,
    output := OriginalRow227TriangleData0560.coefficient37_124, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_126, Icur := OriginalRow227TriangleData0546.coefficient36_125,
    output := OriginalRow227TriangleData0560.coefficient37_125, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_127, Icur := OriginalRow227TriangleData0546.coefficient36_126,
    output := OriginalRow227TriangleData0560.coefficient37_126, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_128, Icur := OriginalRow227TriangleData0546.coefficient36_127,
    output := OriginalRow227TriangleData0560.coefficient37_127, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_129, Icur := OriginalRow227TriangleData0546.coefficient36_128,
    output := OriginalRow227TriangleData0560.coefficient37_128, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0546.coefficient36_130, Icur := OriginalRow227TriangleData0546.coefficient36_129,
    output := OriginalRow227TriangleData0560.coefficient37_129, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0547.coefficient36_131, Icur := OriginalRow227TriangleData0546.coefficient36_130,
    output := OriginalRow227TriangleData0560.coefficient37_130, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0547.coefficient36_132, Icur := OriginalRow227TriangleData0547.coefficient36_131,
    output := OriginalRow227TriangleData0560.coefficient37_131, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0544

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0544.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
