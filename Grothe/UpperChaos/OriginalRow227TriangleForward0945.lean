import Grothe.UpperChaos.OriginalRow227TriangleData0949
import Grothe.UpperChaos.OriginalRow227TriangleData0950
import Grothe.UpperChaos.OriginalRow227TriangleData0961
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0945
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_100, Icur := OriginalRow227TriangleData0949.coefficient67_99,
    output := OriginalRow227TriangleData0961.coefficient68_99, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_101, Icur := OriginalRow227TriangleData0949.coefficient67_100,
    output := OriginalRow227TriangleData0961.coefficient68_100, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_102, Icur := OriginalRow227TriangleData0949.coefficient67_101,
    output := OriginalRow227TriangleData0961.coefficient68_101, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_103, Icur := OriginalRow227TriangleData0949.coefficient67_102,
    output := OriginalRow227TriangleData0961.coefficient68_102, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_104, Icur := OriginalRow227TriangleData0949.coefficient67_103,
    output := OriginalRow227TriangleData0961.coefficient68_103, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_105, Icur := OriginalRow227TriangleData0949.coefficient67_104,
    output := OriginalRow227TriangleData0961.coefficient68_104, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_106, Icur := OriginalRow227TriangleData0949.coefficient67_105,
    output := OriginalRow227TriangleData0961.coefficient68_105, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_107, Icur := OriginalRow227TriangleData0949.coefficient67_106,
    output := OriginalRow227TriangleData0961.coefficient68_106, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_108, Icur := OriginalRow227TriangleData0949.coefficient67_107,
    output := OriginalRow227TriangleData0961.coefficient68_107, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_109, Icur := OriginalRow227TriangleData0949.coefficient67_108,
    output := OriginalRow227TriangleData0961.coefficient68_108, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_110, Icur := OriginalRow227TriangleData0949.coefficient67_109,
    output := OriginalRow227TriangleData0961.coefficient68_109, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_111, Icur := OriginalRow227TriangleData0949.coefficient67_110,
    output := OriginalRow227TriangleData0961.coefficient68_110, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_112, Icur := OriginalRow227TriangleData0949.coefficient67_111,
    output := OriginalRow227TriangleData0961.coefficient68_111, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_113, Icur := OriginalRow227TriangleData0949.coefficient67_112,
    output := OriginalRow227TriangleData0961.coefficient68_112, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_114, Icur := OriginalRow227TriangleData0949.coefficient67_113,
    output := OriginalRow227TriangleData0961.coefficient68_113, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_115, Icur := OriginalRow227TriangleData0949.coefficient67_114,
    output := OriginalRow227TriangleData0961.coefficient68_114, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_116, Icur := OriginalRow227TriangleData0949.coefficient67_115,
    output := OriginalRow227TriangleData0961.coefficient68_115, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_117, Icur := OriginalRow227TriangleData0949.coefficient67_116,
    output := OriginalRow227TriangleData0961.coefficient68_116, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_118, Icur := OriginalRow227TriangleData0949.coefficient67_117,
    output := OriginalRow227TriangleData0961.coefficient68_117, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_119, Icur := OriginalRow227TriangleData0949.coefficient67_118,
    output := OriginalRow227TriangleData0961.coefficient68_118, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_120, Icur := OriginalRow227TriangleData0949.coefficient67_119,
    output := OriginalRow227TriangleData0961.coefficient68_119, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_121, Icur := OriginalRow227TriangleData0949.coefficient67_120,
    output := OriginalRow227TriangleData0961.coefficient68_120, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_122, Icur := OriginalRow227TriangleData0949.coefficient67_121,
    output := OriginalRow227TriangleData0961.coefficient68_121, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_123, Icur := OriginalRow227TriangleData0949.coefficient67_122,
    output := OriginalRow227TriangleData0961.coefficient68_122, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_124, Icur := OriginalRow227TriangleData0949.coefficient67_123,
    output := OriginalRow227TriangleData0961.coefficient68_123, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_125, Icur := OriginalRow227TriangleData0949.coefficient67_124,
    output := OriginalRow227TriangleData0961.coefficient68_124, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_126, Icur := OriginalRow227TriangleData0949.coefficient67_125,
    output := OriginalRow227TriangleData0961.coefficient68_125, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_127, Icur := OriginalRow227TriangleData0949.coefficient67_126,
    output := OriginalRow227TriangleData0961.coefficient68_126, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_128, Icur := OriginalRow227TriangleData0949.coefficient67_127,
    output := OriginalRow227TriangleData0961.coefficient68_127, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_129, Icur := OriginalRow227TriangleData0949.coefficient67_128,
    output := OriginalRow227TriangleData0961.coefficient68_128, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0950.coefficient67_130, Icur := OriginalRow227TriangleData0949.coefficient67_129,
    output := OriginalRow227TriangleData0961.coefficient68_129, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0950.coefficient67_131, Icur := OriginalRow227TriangleData0950.coefficient67_130,
    output := OriginalRow227TriangleData0961.coefficient68_130, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0945

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0945.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
