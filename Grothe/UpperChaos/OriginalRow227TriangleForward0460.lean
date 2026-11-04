import Grothe.UpperChaos.OriginalRow227TriangleData0462
import Grothe.UpperChaos.OriginalRow227TriangleData0463
import Grothe.UpperChaos.OriginalRow227TriangleData0476
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0460
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_95, Icur := OriginalRow227TriangleData0462.coefficient30_94,
    output := OriginalRow227TriangleData0476.coefficient31_94, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_96, Icur := OriginalRow227TriangleData0462.coefficient30_95,
    output := OriginalRow227TriangleData0476.coefficient31_95, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_97, Icur := OriginalRow227TriangleData0462.coefficient30_96,
    output := OriginalRow227TriangleData0476.coefficient31_96, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_98, Icur := OriginalRow227TriangleData0462.coefficient30_97,
    output := OriginalRow227TriangleData0476.coefficient31_97, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_99, Icur := OriginalRow227TriangleData0462.coefficient30_98,
    output := OriginalRow227TriangleData0476.coefficient31_98, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_100, Icur := OriginalRow227TriangleData0462.coefficient30_99,
    output := OriginalRow227TriangleData0476.coefficient31_99, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_101, Icur := OriginalRow227TriangleData0462.coefficient30_100,
    output := OriginalRow227TriangleData0476.coefficient31_100, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_102, Icur := OriginalRow227TriangleData0462.coefficient30_101,
    output := OriginalRow227TriangleData0476.coefficient31_101, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_103, Icur := OriginalRow227TriangleData0462.coefficient30_102,
    output := OriginalRow227TriangleData0476.coefficient31_102, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_104, Icur := OriginalRow227TriangleData0462.coefficient30_103,
    output := OriginalRow227TriangleData0476.coefficient31_103, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_105, Icur := OriginalRow227TriangleData0462.coefficient30_104,
    output := OriginalRow227TriangleData0476.coefficient31_104, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_106, Icur := OriginalRow227TriangleData0462.coefficient30_105,
    output := OriginalRow227TriangleData0476.coefficient31_105, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_107, Icur := OriginalRow227TriangleData0462.coefficient30_106,
    output := OriginalRow227TriangleData0476.coefficient31_106, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_108, Icur := OriginalRow227TriangleData0462.coefficient30_107,
    output := OriginalRow227TriangleData0476.coefficient31_107, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_109, Icur := OriginalRow227TriangleData0462.coefficient30_108,
    output := OriginalRow227TriangleData0476.coefficient31_108, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_110, Icur := OriginalRow227TriangleData0462.coefficient30_109,
    output := OriginalRow227TriangleData0476.coefficient31_109, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_111, Icur := OriginalRow227TriangleData0462.coefficient30_110,
    output := OriginalRow227TriangleData0476.coefficient31_110, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_112, Icur := OriginalRow227TriangleData0462.coefficient30_111,
    output := OriginalRow227TriangleData0476.coefficient31_111, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_113, Icur := OriginalRow227TriangleData0462.coefficient30_112,
    output := OriginalRow227TriangleData0476.coefficient31_112, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_114, Icur := OriginalRow227TriangleData0462.coefficient30_113,
    output := OriginalRow227TriangleData0476.coefficient31_113, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_115, Icur := OriginalRow227TriangleData0462.coefficient30_114,
    output := OriginalRow227TriangleData0476.coefficient31_114, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_116, Icur := OriginalRow227TriangleData0462.coefficient30_115,
    output := OriginalRow227TriangleData0476.coefficient31_115, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_117, Icur := OriginalRow227TriangleData0462.coefficient30_116,
    output := OriginalRow227TriangleData0476.coefficient31_116, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_118, Icur := OriginalRow227TriangleData0462.coefficient30_117,
    output := OriginalRow227TriangleData0476.coefficient31_117, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_119, Icur := OriginalRow227TriangleData0462.coefficient30_118,
    output := OriginalRow227TriangleData0476.coefficient31_118, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_120, Icur := OriginalRow227TriangleData0462.coefficient30_119,
    output := OriginalRow227TriangleData0476.coefficient31_119, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_121, Icur := OriginalRow227TriangleData0462.coefficient30_120,
    output := OriginalRow227TriangleData0476.coefficient31_120, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_122, Icur := OriginalRow227TriangleData0462.coefficient30_121,
    output := OriginalRow227TriangleData0476.coefficient31_121, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_123, Icur := OriginalRow227TriangleData0462.coefficient30_122,
    output := OriginalRow227TriangleData0476.coefficient31_122, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0462.coefficient30_124, Icur := OriginalRow227TriangleData0462.coefficient30_123,
    output := OriginalRow227TriangleData0476.coefficient31_123, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0463.coefficient30_125, Icur := OriginalRow227TriangleData0462.coefficient30_124,
    output := OriginalRow227TriangleData0476.coefficient31_124, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0463.coefficient30_126, Icur := OriginalRow227TriangleData0463.coefficient30_125,
    output := OriginalRow227TriangleData0476.coefficient31_125, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0460

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0460.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
