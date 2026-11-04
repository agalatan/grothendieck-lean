import Grothe.UpperChaos.OriginalRow227TriangleData1111
import Grothe.UpperChaos.OriginalRow227TriangleData1112
import Grothe.UpperChaos.OriginalRow227TriangleData1122
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1106
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_82, Icur := OriginalRow227TriangleData1111.coefficient81_81,
    output := OriginalRow227TriangleData1122.coefficient82_81, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_83, Icur := OriginalRow227TriangleData1111.coefficient81_82,
    output := OriginalRow227TriangleData1122.coefficient82_82, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_84, Icur := OriginalRow227TriangleData1111.coefficient81_83,
    output := OriginalRow227TriangleData1122.coefficient82_83, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_85, Icur := OriginalRow227TriangleData1111.coefficient81_84,
    output := OriginalRow227TriangleData1122.coefficient82_84, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_86, Icur := OriginalRow227TriangleData1111.coefficient81_85,
    output := OriginalRow227TriangleData1122.coefficient82_85, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_87, Icur := OriginalRow227TriangleData1111.coefficient81_86,
    output := OriginalRow227TriangleData1122.coefficient82_86, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_88, Icur := OriginalRow227TriangleData1111.coefficient81_87,
    output := OriginalRow227TriangleData1122.coefficient82_87, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_89, Icur := OriginalRow227TriangleData1111.coefficient81_88,
    output := OriginalRow227TriangleData1122.coefficient82_88, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_90, Icur := OriginalRow227TriangleData1111.coefficient81_89,
    output := OriginalRow227TriangleData1122.coefficient82_89, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_91, Icur := OriginalRow227TriangleData1111.coefficient81_90,
    output := OriginalRow227TriangleData1122.coefficient82_90, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_92, Icur := OriginalRow227TriangleData1111.coefficient81_91,
    output := OriginalRow227TriangleData1122.coefficient82_91, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_93, Icur := OriginalRow227TriangleData1111.coefficient81_92,
    output := OriginalRow227TriangleData1122.coefficient82_92, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_94, Icur := OriginalRow227TriangleData1111.coefficient81_93,
    output := OriginalRow227TriangleData1122.coefficient82_93, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_95, Icur := OriginalRow227TriangleData1111.coefficient81_94,
    output := OriginalRow227TriangleData1122.coefficient82_94, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_96, Icur := OriginalRow227TriangleData1111.coefficient81_95,
    output := OriginalRow227TriangleData1122.coefficient82_95, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_97, Icur := OriginalRow227TriangleData1111.coefficient81_96,
    output := OriginalRow227TriangleData1122.coefficient82_96, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_98, Icur := OriginalRow227TriangleData1111.coefficient81_97,
    output := OriginalRow227TriangleData1122.coefficient82_97, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_99, Icur := OriginalRow227TriangleData1111.coefficient81_98,
    output := OriginalRow227TriangleData1122.coefficient82_98, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_100, Icur := OriginalRow227TriangleData1111.coefficient81_99,
    output := OriginalRow227TriangleData1122.coefficient82_99, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_101, Icur := OriginalRow227TriangleData1111.coefficient81_100,
    output := OriginalRow227TriangleData1122.coefficient82_100, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_102, Icur := OriginalRow227TriangleData1111.coefficient81_101,
    output := OriginalRow227TriangleData1122.coefficient82_101, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_103, Icur := OriginalRow227TriangleData1111.coefficient81_102,
    output := OriginalRow227TriangleData1122.coefficient82_102, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_104, Icur := OriginalRow227TriangleData1111.coefficient81_103,
    output := OriginalRow227TriangleData1122.coefficient82_103, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_105, Icur := OriginalRow227TriangleData1111.coefficient81_104,
    output := OriginalRow227TriangleData1122.coefficient82_104, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_106, Icur := OriginalRow227TriangleData1111.coefficient81_105,
    output := OriginalRow227TriangleData1122.coefficient82_105, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_107, Icur := OriginalRow227TriangleData1111.coefficient81_106,
    output := OriginalRow227TriangleData1122.coefficient82_106, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_108, Icur := OriginalRow227TriangleData1111.coefficient81_107,
    output := OriginalRow227TriangleData1122.coefficient82_107, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_109, Icur := OriginalRow227TriangleData1111.coefficient81_108,
    output := OriginalRow227TriangleData1122.coefficient82_108, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_110, Icur := OriginalRow227TriangleData1111.coefficient81_109,
    output := OriginalRow227TriangleData1122.coefficient82_109, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1111.coefficient81_111, Icur := OriginalRow227TriangleData1111.coefficient81_110,
    output := OriginalRow227TriangleData1122.coefficient82_110, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_112, Icur := OriginalRow227TriangleData1111.coefficient81_111,
    output := OriginalRow227TriangleData1122.coefficient82_111, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1112.coefficient81_113, Icur := OriginalRow227TriangleData1112.coefficient81_112,
    output := OriginalRow227TriangleData1122.coefficient82_112, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1106

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1106.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
