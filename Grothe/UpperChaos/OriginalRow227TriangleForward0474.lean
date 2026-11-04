import Grothe.UpperChaos.OriginalRow227TriangleData0476
import Grothe.UpperChaos.OriginalRow227TriangleData0477
import Grothe.UpperChaos.OriginalRow227TriangleData0490
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0474
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_96, Icur := OriginalRow227TriangleData0476.coefficient31_95,
    output := OriginalRow227TriangleData0490.coefficient32_95, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_97, Icur := OriginalRow227TriangleData0476.coefficient31_96,
    output := OriginalRow227TriangleData0490.coefficient32_96, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_98, Icur := OriginalRow227TriangleData0476.coefficient31_97,
    output := OriginalRow227TriangleData0490.coefficient32_97, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_99, Icur := OriginalRow227TriangleData0476.coefficient31_98,
    output := OriginalRow227TriangleData0490.coefficient32_98, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_100, Icur := OriginalRow227TriangleData0476.coefficient31_99,
    output := OriginalRow227TriangleData0490.coefficient32_99, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_101, Icur := OriginalRow227TriangleData0476.coefficient31_100,
    output := OriginalRow227TriangleData0490.coefficient32_100, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_102, Icur := OriginalRow227TriangleData0476.coefficient31_101,
    output := OriginalRow227TriangleData0490.coefficient32_101, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_103, Icur := OriginalRow227TriangleData0476.coefficient31_102,
    output := OriginalRow227TriangleData0490.coefficient32_102, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_104, Icur := OriginalRow227TriangleData0476.coefficient31_103,
    output := OriginalRow227TriangleData0490.coefficient32_103, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_105, Icur := OriginalRow227TriangleData0476.coefficient31_104,
    output := OriginalRow227TriangleData0490.coefficient32_104, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_106, Icur := OriginalRow227TriangleData0476.coefficient31_105,
    output := OriginalRow227TriangleData0490.coefficient32_105, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_107, Icur := OriginalRow227TriangleData0476.coefficient31_106,
    output := OriginalRow227TriangleData0490.coefficient32_106, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_108, Icur := OriginalRow227TriangleData0476.coefficient31_107,
    output := OriginalRow227TriangleData0490.coefficient32_107, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_109, Icur := OriginalRow227TriangleData0476.coefficient31_108,
    output := OriginalRow227TriangleData0490.coefficient32_108, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_110, Icur := OriginalRow227TriangleData0476.coefficient31_109,
    output := OriginalRow227TriangleData0490.coefficient32_109, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_111, Icur := OriginalRow227TriangleData0476.coefficient31_110,
    output := OriginalRow227TriangleData0490.coefficient32_110, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_112, Icur := OriginalRow227TriangleData0476.coefficient31_111,
    output := OriginalRow227TriangleData0490.coefficient32_111, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_113, Icur := OriginalRow227TriangleData0476.coefficient31_112,
    output := OriginalRow227TriangleData0490.coefficient32_112, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_114, Icur := OriginalRow227TriangleData0476.coefficient31_113,
    output := OriginalRow227TriangleData0490.coefficient32_113, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_115, Icur := OriginalRow227TriangleData0476.coefficient31_114,
    output := OriginalRow227TriangleData0490.coefficient32_114, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_116, Icur := OriginalRow227TriangleData0476.coefficient31_115,
    output := OriginalRow227TriangleData0490.coefficient32_115, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_117, Icur := OriginalRow227TriangleData0476.coefficient31_116,
    output := OriginalRow227TriangleData0490.coefficient32_116, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_118, Icur := OriginalRow227TriangleData0476.coefficient31_117,
    output := OriginalRow227TriangleData0490.coefficient32_117, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_119, Icur := OriginalRow227TriangleData0476.coefficient31_118,
    output := OriginalRow227TriangleData0490.coefficient32_118, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_120, Icur := OriginalRow227TriangleData0476.coefficient31_119,
    output := OriginalRow227TriangleData0490.coefficient32_119, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_121, Icur := OriginalRow227TriangleData0476.coefficient31_120,
    output := OriginalRow227TriangleData0490.coefficient32_120, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_122, Icur := OriginalRow227TriangleData0476.coefficient31_121,
    output := OriginalRow227TriangleData0490.coefficient32_121, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_123, Icur := OriginalRow227TriangleData0476.coefficient31_122,
    output := OriginalRow227TriangleData0490.coefficient32_122, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_124, Icur := OriginalRow227TriangleData0476.coefficient31_123,
    output := OriginalRow227TriangleData0490.coefficient32_123, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0476.coefficient31_125, Icur := OriginalRow227TriangleData0476.coefficient31_124,
    output := OriginalRow227TriangleData0490.coefficient32_124, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_126, Icur := OriginalRow227TriangleData0476.coefficient31_125,
    output := OriginalRow227TriangleData0490.coefficient32_125, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_127, Icur := OriginalRow227TriangleData0477.coefficient31_126,
    output := OriginalRow227TriangleData0490.coefficient32_126, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0474

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0474.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
