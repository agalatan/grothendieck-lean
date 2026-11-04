import Grothe.UpperChaos.OriginalRow227TriangleData0434
import Grothe.UpperChaos.OriginalRow227TriangleData0435
import Grothe.UpperChaos.OriginalRow227TriangleData0448
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0432
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_93, Icur := OriginalRow227TriangleData0434.coefficient28_92,
    output := OriginalRow227TriangleData0448.coefficient29_92, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_94, Icur := OriginalRow227TriangleData0434.coefficient28_93,
    output := OriginalRow227TriangleData0448.coefficient29_93, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_95, Icur := OriginalRow227TriangleData0434.coefficient28_94,
    output := OriginalRow227TriangleData0448.coefficient29_94, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_96, Icur := OriginalRow227TriangleData0434.coefficient28_95,
    output := OriginalRow227TriangleData0448.coefficient29_95, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_97, Icur := OriginalRow227TriangleData0434.coefficient28_96,
    output := OriginalRow227TriangleData0448.coefficient29_96, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_98, Icur := OriginalRow227TriangleData0434.coefficient28_97,
    output := OriginalRow227TriangleData0448.coefficient29_97, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_99, Icur := OriginalRow227TriangleData0434.coefficient28_98,
    output := OriginalRow227TriangleData0448.coefficient29_98, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_100, Icur := OriginalRow227TriangleData0434.coefficient28_99,
    output := OriginalRow227TriangleData0448.coefficient29_99, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_101, Icur := OriginalRow227TriangleData0434.coefficient28_100,
    output := OriginalRow227TriangleData0448.coefficient29_100, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_102, Icur := OriginalRow227TriangleData0434.coefficient28_101,
    output := OriginalRow227TriangleData0448.coefficient29_101, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_103, Icur := OriginalRow227TriangleData0434.coefficient28_102,
    output := OriginalRow227TriangleData0448.coefficient29_102, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_104, Icur := OriginalRow227TriangleData0434.coefficient28_103,
    output := OriginalRow227TriangleData0448.coefficient29_103, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_105, Icur := OriginalRow227TriangleData0434.coefficient28_104,
    output := OriginalRow227TriangleData0448.coefficient29_104, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_106, Icur := OriginalRow227TriangleData0434.coefficient28_105,
    output := OriginalRow227TriangleData0448.coefficient29_105, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_107, Icur := OriginalRow227TriangleData0434.coefficient28_106,
    output := OriginalRow227TriangleData0448.coefficient29_106, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_108, Icur := OriginalRow227TriangleData0434.coefficient28_107,
    output := OriginalRow227TriangleData0448.coefficient29_107, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_109, Icur := OriginalRow227TriangleData0434.coefficient28_108,
    output := OriginalRow227TriangleData0448.coefficient29_108, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_110, Icur := OriginalRow227TriangleData0434.coefficient28_109,
    output := OriginalRow227TriangleData0448.coefficient29_109, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_111, Icur := OriginalRow227TriangleData0434.coefficient28_110,
    output := OriginalRow227TriangleData0448.coefficient29_110, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_112, Icur := OriginalRow227TriangleData0434.coefficient28_111,
    output := OriginalRow227TriangleData0448.coefficient29_111, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_113, Icur := OriginalRow227TriangleData0434.coefficient28_112,
    output := OriginalRow227TriangleData0448.coefficient29_112, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_114, Icur := OriginalRow227TriangleData0434.coefficient28_113,
    output := OriginalRow227TriangleData0448.coefficient29_113, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_115, Icur := OriginalRow227TriangleData0434.coefficient28_114,
    output := OriginalRow227TriangleData0448.coefficient29_114, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_116, Icur := OriginalRow227TriangleData0434.coefficient28_115,
    output := OriginalRow227TriangleData0448.coefficient29_115, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_117, Icur := OriginalRow227TriangleData0434.coefficient28_116,
    output := OriginalRow227TriangleData0448.coefficient29_116, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_118, Icur := OriginalRow227TriangleData0434.coefficient28_117,
    output := OriginalRow227TriangleData0448.coefficient29_117, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_119, Icur := OriginalRow227TriangleData0434.coefficient28_118,
    output := OriginalRow227TriangleData0448.coefficient29_118, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_120, Icur := OriginalRow227TriangleData0434.coefficient28_119,
    output := OriginalRow227TriangleData0448.coefficient29_119, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_121, Icur := OriginalRow227TriangleData0434.coefficient28_120,
    output := OriginalRow227TriangleData0448.coefficient29_120, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0434.coefficient28_122, Icur := OriginalRow227TriangleData0434.coefficient28_121,
    output := OriginalRow227TriangleData0448.coefficient29_121, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0435.coefficient28_123, Icur := OriginalRow227TriangleData0434.coefficient28_122,
    output := OriginalRow227TriangleData0448.coefficient29_122, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0435.coefficient28_124, Icur := OriginalRow227TriangleData0435.coefficient28_123,
    output := OriginalRow227TriangleData0448.coefficient29_123, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0432

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0432.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
