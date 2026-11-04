import Grothe.UpperChaos.OriginalRow227TriangleData1078
import Grothe.UpperChaos.OriginalRow227TriangleData1079
import Grothe.UpperChaos.OriginalRow227TriangleData1089
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1073
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_79, Icur := OriginalRow227TriangleData1078.coefficient78_78,
    output := OriginalRow227TriangleData1089.coefficient79_78, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_80, Icur := OriginalRow227TriangleData1078.coefficient78_79,
    output := OriginalRow227TriangleData1089.coefficient79_79, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_81, Icur := OriginalRow227TriangleData1078.coefficient78_80,
    output := OriginalRow227TriangleData1089.coefficient79_80, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_82, Icur := OriginalRow227TriangleData1078.coefficient78_81,
    output := OriginalRow227TriangleData1089.coefficient79_81, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_83, Icur := OriginalRow227TriangleData1078.coefficient78_82,
    output := OriginalRow227TriangleData1089.coefficient79_82, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_84, Icur := OriginalRow227TriangleData1078.coefficient78_83,
    output := OriginalRow227TriangleData1089.coefficient79_83, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_85, Icur := OriginalRow227TriangleData1078.coefficient78_84,
    output := OriginalRow227TriangleData1089.coefficient79_84, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_86, Icur := OriginalRow227TriangleData1078.coefficient78_85,
    output := OriginalRow227TriangleData1089.coefficient79_85, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_87, Icur := OriginalRow227TriangleData1078.coefficient78_86,
    output := OriginalRow227TriangleData1089.coefficient79_86, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_88, Icur := OriginalRow227TriangleData1078.coefficient78_87,
    output := OriginalRow227TriangleData1089.coefficient79_87, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_89, Icur := OriginalRow227TriangleData1078.coefficient78_88,
    output := OriginalRow227TriangleData1089.coefficient79_88, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_90, Icur := OriginalRow227TriangleData1078.coefficient78_89,
    output := OriginalRow227TriangleData1089.coefficient79_89, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_91, Icur := OriginalRow227TriangleData1078.coefficient78_90,
    output := OriginalRow227TriangleData1089.coefficient79_90, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_92, Icur := OriginalRow227TriangleData1078.coefficient78_91,
    output := OriginalRow227TriangleData1089.coefficient79_91, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_93, Icur := OriginalRow227TriangleData1078.coefficient78_92,
    output := OriginalRow227TriangleData1089.coefficient79_92, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_94, Icur := OriginalRow227TriangleData1078.coefficient78_93,
    output := OriginalRow227TriangleData1089.coefficient79_93, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_95, Icur := OriginalRow227TriangleData1078.coefficient78_94,
    output := OriginalRow227TriangleData1089.coefficient79_94, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_96, Icur := OriginalRow227TriangleData1078.coefficient78_95,
    output := OriginalRow227TriangleData1089.coefficient79_95, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_97, Icur := OriginalRow227TriangleData1078.coefficient78_96,
    output := OriginalRow227TriangleData1089.coefficient79_96, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_98, Icur := OriginalRow227TriangleData1078.coefficient78_97,
    output := OriginalRow227TriangleData1089.coefficient79_97, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_99, Icur := OriginalRow227TriangleData1078.coefficient78_98,
    output := OriginalRow227TriangleData1089.coefficient79_98, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_100, Icur := OriginalRow227TriangleData1078.coefficient78_99,
    output := OriginalRow227TriangleData1089.coefficient79_99, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_101, Icur := OriginalRow227TriangleData1078.coefficient78_100,
    output := OriginalRow227TriangleData1089.coefficient79_100, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_102, Icur := OriginalRow227TriangleData1078.coefficient78_101,
    output := OriginalRow227TriangleData1089.coefficient79_101, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_103, Icur := OriginalRow227TriangleData1078.coefficient78_102,
    output := OriginalRow227TriangleData1089.coefficient79_102, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_104, Icur := OriginalRow227TriangleData1078.coefficient78_103,
    output := OriginalRow227TriangleData1089.coefficient79_103, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_105, Icur := OriginalRow227TriangleData1078.coefficient78_104,
    output := OriginalRow227TriangleData1089.coefficient79_104, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_106, Icur := OriginalRow227TriangleData1078.coefficient78_105,
    output := OriginalRow227TriangleData1089.coefficient79_105, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_107, Icur := OriginalRow227TriangleData1078.coefficient78_106,
    output := OriginalRow227TriangleData1089.coefficient79_106, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1078.coefficient78_108, Icur := OriginalRow227TriangleData1078.coefficient78_107,
    output := OriginalRow227TriangleData1089.coefficient79_107, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_109, Icur := OriginalRow227TriangleData1078.coefficient78_108,
    output := OriginalRow227TriangleData1089.coefficient79_108, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_110, Icur := OriginalRow227TriangleData1079.coefficient78_109,
    output := OriginalRow227TriangleData1089.coefficient79_109, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1073

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1073.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
