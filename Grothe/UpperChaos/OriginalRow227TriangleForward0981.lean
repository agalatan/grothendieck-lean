import Grothe.UpperChaos.OriginalRow227TriangleData0985
import Grothe.UpperChaos.OriginalRow227TriangleData0986
import Grothe.UpperChaos.OriginalRow227TriangleData0997
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0981
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_103, Icur := OriginalRow227TriangleData0985.coefficient70_102,
    output := OriginalRow227TriangleData0997.coefficient71_102, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_104, Icur := OriginalRow227TriangleData0985.coefficient70_103,
    output := OriginalRow227TriangleData0997.coefficient71_103, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_105, Icur := OriginalRow227TriangleData0985.coefficient70_104,
    output := OriginalRow227TriangleData0997.coefficient71_104, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_106, Icur := OriginalRow227TriangleData0985.coefficient70_105,
    output := OriginalRow227TriangleData0997.coefficient71_105, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_107, Icur := OriginalRow227TriangleData0985.coefficient70_106,
    output := OriginalRow227TriangleData0997.coefficient71_106, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_108, Icur := OriginalRow227TriangleData0985.coefficient70_107,
    output := OriginalRow227TriangleData0997.coefficient71_107, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_109, Icur := OriginalRow227TriangleData0985.coefficient70_108,
    output := OriginalRow227TriangleData0997.coefficient71_108, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_110, Icur := OriginalRow227TriangleData0985.coefficient70_109,
    output := OriginalRow227TriangleData0997.coefficient71_109, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_111, Icur := OriginalRow227TriangleData0985.coefficient70_110,
    output := OriginalRow227TriangleData0997.coefficient71_110, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_112, Icur := OriginalRow227TriangleData0985.coefficient70_111,
    output := OriginalRow227TriangleData0997.coefficient71_111, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_113, Icur := OriginalRow227TriangleData0985.coefficient70_112,
    output := OriginalRow227TriangleData0997.coefficient71_112, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_114, Icur := OriginalRow227TriangleData0985.coefficient70_113,
    output := OriginalRow227TriangleData0997.coefficient71_113, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_115, Icur := OriginalRow227TriangleData0985.coefficient70_114,
    output := OriginalRow227TriangleData0997.coefficient71_114, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_116, Icur := OriginalRow227TriangleData0985.coefficient70_115,
    output := OriginalRow227TriangleData0997.coefficient71_115, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_117, Icur := OriginalRow227TriangleData0985.coefficient70_116,
    output := OriginalRow227TriangleData0997.coefficient71_116, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_118, Icur := OriginalRow227TriangleData0985.coefficient70_117,
    output := OriginalRow227TriangleData0997.coefficient71_117, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_119, Icur := OriginalRow227TriangleData0985.coefficient70_118,
    output := OriginalRow227TriangleData0997.coefficient71_118, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_120, Icur := OriginalRow227TriangleData0985.coefficient70_119,
    output := OriginalRow227TriangleData0997.coefficient71_119, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_121, Icur := OriginalRow227TriangleData0985.coefficient70_120,
    output := OriginalRow227TriangleData0997.coefficient71_120, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_122, Icur := OriginalRow227TriangleData0985.coefficient70_121,
    output := OriginalRow227TriangleData0997.coefficient71_121, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_123, Icur := OriginalRow227TriangleData0985.coefficient70_122,
    output := OriginalRow227TriangleData0997.coefficient71_122, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_124, Icur := OriginalRow227TriangleData0985.coefficient70_123,
    output := OriginalRow227TriangleData0997.coefficient71_123, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_125, Icur := OriginalRow227TriangleData0985.coefficient70_124,
    output := OriginalRow227TriangleData0997.coefficient71_124, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_126, Icur := OriginalRow227TriangleData0985.coefficient70_125,
    output := OriginalRow227TriangleData0997.coefficient71_125, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_127, Icur := OriginalRow227TriangleData0985.coefficient70_126,
    output := OriginalRow227TriangleData0997.coefficient71_126, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_128, Icur := OriginalRow227TriangleData0985.coefficient70_127,
    output := OriginalRow227TriangleData0997.coefficient71_127, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_129, Icur := OriginalRow227TriangleData0985.coefficient70_128,
    output := OriginalRow227TriangleData0997.coefficient71_128, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_130, Icur := OriginalRow227TriangleData0985.coefficient70_129,
    output := OriginalRow227TriangleData0997.coefficient71_129, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_131, Icur := OriginalRow227TriangleData0985.coefficient70_130,
    output := OriginalRow227TriangleData0997.coefficient71_130, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_132, Icur := OriginalRow227TriangleData0985.coefficient70_131,
    output := OriginalRow227TriangleData0997.coefficient71_131, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0986.coefficient70_133, Icur := OriginalRow227TriangleData0985.coefficient70_132,
    output := OriginalRow227TriangleData0997.coefficient71_132, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0986.coefficient70_134, Icur := OriginalRow227TriangleData0986.coefficient70_133,
    output := OriginalRow227TriangleData0997.coefficient71_133, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0981

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0981.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
