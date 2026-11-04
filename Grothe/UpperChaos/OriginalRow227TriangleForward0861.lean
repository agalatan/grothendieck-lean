import Grothe.UpperChaos.OriginalRow227TriangleData0865
import Grothe.UpperChaos.OriginalRow227TriangleData0866
import Grothe.UpperChaos.OriginalRow227TriangleData0877
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0861
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_93, Icur := OriginalRow227TriangleData0865.coefficient60_92,
    output := OriginalRow227TriangleData0877.coefficient61_92, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_94, Icur := OriginalRow227TriangleData0865.coefficient60_93,
    output := OriginalRow227TriangleData0877.coefficient61_93, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_95, Icur := OriginalRow227TriangleData0865.coefficient60_94,
    output := OriginalRow227TriangleData0877.coefficient61_94, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_96, Icur := OriginalRow227TriangleData0865.coefficient60_95,
    output := OriginalRow227TriangleData0877.coefficient61_95, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_97, Icur := OriginalRow227TriangleData0865.coefficient60_96,
    output := OriginalRow227TriangleData0877.coefficient61_96, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_98, Icur := OriginalRow227TriangleData0865.coefficient60_97,
    output := OriginalRow227TriangleData0877.coefficient61_97, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_99, Icur := OriginalRow227TriangleData0865.coefficient60_98,
    output := OriginalRow227TriangleData0877.coefficient61_98, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_100, Icur := OriginalRow227TriangleData0865.coefficient60_99,
    output := OriginalRow227TriangleData0877.coefficient61_99, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_101, Icur := OriginalRow227TriangleData0865.coefficient60_100,
    output := OriginalRow227TriangleData0877.coefficient61_100, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_102, Icur := OriginalRow227TriangleData0865.coefficient60_101,
    output := OriginalRow227TriangleData0877.coefficient61_101, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_103, Icur := OriginalRow227TriangleData0865.coefficient60_102,
    output := OriginalRow227TriangleData0877.coefficient61_102, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_104, Icur := OriginalRow227TriangleData0865.coefficient60_103,
    output := OriginalRow227TriangleData0877.coefficient61_103, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_105, Icur := OriginalRow227TriangleData0865.coefficient60_104,
    output := OriginalRow227TriangleData0877.coefficient61_104, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_106, Icur := OriginalRow227TriangleData0865.coefficient60_105,
    output := OriginalRow227TriangleData0877.coefficient61_105, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_107, Icur := OriginalRow227TriangleData0865.coefficient60_106,
    output := OriginalRow227TriangleData0877.coefficient61_106, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_108, Icur := OriginalRow227TriangleData0865.coefficient60_107,
    output := OriginalRow227TriangleData0877.coefficient61_107, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_109, Icur := OriginalRow227TriangleData0865.coefficient60_108,
    output := OriginalRow227TriangleData0877.coefficient61_108, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_110, Icur := OriginalRow227TriangleData0865.coefficient60_109,
    output := OriginalRow227TriangleData0877.coefficient61_109, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_111, Icur := OriginalRow227TriangleData0865.coefficient60_110,
    output := OriginalRow227TriangleData0877.coefficient61_110, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_112, Icur := OriginalRow227TriangleData0865.coefficient60_111,
    output := OriginalRow227TriangleData0877.coefficient61_111, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_113, Icur := OriginalRow227TriangleData0865.coefficient60_112,
    output := OriginalRow227TriangleData0877.coefficient61_112, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_114, Icur := OriginalRow227TriangleData0865.coefficient60_113,
    output := OriginalRow227TriangleData0877.coefficient61_113, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_115, Icur := OriginalRow227TriangleData0865.coefficient60_114,
    output := OriginalRow227TriangleData0877.coefficient61_114, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_116, Icur := OriginalRow227TriangleData0865.coefficient60_115,
    output := OriginalRow227TriangleData0877.coefficient61_115, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_117, Icur := OriginalRow227TriangleData0865.coefficient60_116,
    output := OriginalRow227TriangleData0877.coefficient61_116, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_118, Icur := OriginalRow227TriangleData0865.coefficient60_117,
    output := OriginalRow227TriangleData0877.coefficient61_117, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_119, Icur := OriginalRow227TriangleData0865.coefficient60_118,
    output := OriginalRow227TriangleData0877.coefficient61_118, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_120, Icur := OriginalRow227TriangleData0865.coefficient60_119,
    output := OriginalRow227TriangleData0877.coefficient61_119, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_121, Icur := OriginalRow227TriangleData0865.coefficient60_120,
    output := OriginalRow227TriangleData0877.coefficient61_120, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_122, Icur := OriginalRow227TriangleData0865.coefficient60_121,
    output := OriginalRow227TriangleData0877.coefficient61_121, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0866.coefficient60_123, Icur := OriginalRow227TriangleData0865.coefficient60_122,
    output := OriginalRow227TriangleData0877.coefficient61_122, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0866.coefficient60_124, Icur := OriginalRow227TriangleData0866.coefficient60_123,
    output := OriginalRow227TriangleData0877.coefficient61_123, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0861

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0861.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
