import Grothe.UpperChaos.OriginalRow227TriangleData0531
import Grothe.UpperChaos.OriginalRow227TriangleData0532
import Grothe.UpperChaos.OriginalRow227TriangleData0545
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0529
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_68, Icur := OriginalRow227TriangleData0531.coefficient35_67,
    output := OriginalRow227TriangleData0545.coefficient36_67, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_69, Icur := OriginalRow227TriangleData0531.coefficient35_68,
    output := OriginalRow227TriangleData0545.coefficient36_68, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_70, Icur := OriginalRow227TriangleData0531.coefficient35_69,
    output := OriginalRow227TriangleData0545.coefficient36_69, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_71, Icur := OriginalRow227TriangleData0531.coefficient35_70,
    output := OriginalRow227TriangleData0545.coefficient36_70, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_72, Icur := OriginalRow227TriangleData0531.coefficient35_71,
    output := OriginalRow227TriangleData0545.coefficient36_71, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_73, Icur := OriginalRow227TriangleData0531.coefficient35_72,
    output := OriginalRow227TriangleData0545.coefficient36_72, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_74, Icur := OriginalRow227TriangleData0531.coefficient35_73,
    output := OriginalRow227TriangleData0545.coefficient36_73, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_75, Icur := OriginalRow227TriangleData0531.coefficient35_74,
    output := OriginalRow227TriangleData0545.coefficient36_74, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_76, Icur := OriginalRow227TriangleData0531.coefficient35_75,
    output := OriginalRow227TriangleData0545.coefficient36_75, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_77, Icur := OriginalRow227TriangleData0531.coefficient35_76,
    output := OriginalRow227TriangleData0545.coefficient36_76, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_78, Icur := OriginalRow227TriangleData0531.coefficient35_77,
    output := OriginalRow227TriangleData0545.coefficient36_77, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_79, Icur := OriginalRow227TriangleData0531.coefficient35_78,
    output := OriginalRow227TriangleData0545.coefficient36_78, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_80, Icur := OriginalRow227TriangleData0531.coefficient35_79,
    output := OriginalRow227TriangleData0545.coefficient36_79, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_81, Icur := OriginalRow227TriangleData0531.coefficient35_80,
    output := OriginalRow227TriangleData0545.coefficient36_80, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_82, Icur := OriginalRow227TriangleData0531.coefficient35_81,
    output := OriginalRow227TriangleData0545.coefficient36_81, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_83, Icur := OriginalRow227TriangleData0531.coefficient35_82,
    output := OriginalRow227TriangleData0545.coefficient36_82, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_84, Icur := OriginalRow227TriangleData0531.coefficient35_83,
    output := OriginalRow227TriangleData0545.coefficient36_83, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_85, Icur := OriginalRow227TriangleData0531.coefficient35_84,
    output := OriginalRow227TriangleData0545.coefficient36_84, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_86, Icur := OriginalRow227TriangleData0531.coefficient35_85,
    output := OriginalRow227TriangleData0545.coefficient36_85, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_87, Icur := OriginalRow227TriangleData0531.coefficient35_86,
    output := OriginalRow227TriangleData0545.coefficient36_86, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_88, Icur := OriginalRow227TriangleData0531.coefficient35_87,
    output := OriginalRow227TriangleData0545.coefficient36_87, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_89, Icur := OriginalRow227TriangleData0531.coefficient35_88,
    output := OriginalRow227TriangleData0545.coefficient36_88, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_90, Icur := OriginalRow227TriangleData0531.coefficient35_89,
    output := OriginalRow227TriangleData0545.coefficient36_89, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_91, Icur := OriginalRow227TriangleData0531.coefficient35_90,
    output := OriginalRow227TriangleData0545.coefficient36_90, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_92, Icur := OriginalRow227TriangleData0531.coefficient35_91,
    output := OriginalRow227TriangleData0545.coefficient36_91, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_93, Icur := OriginalRow227TriangleData0531.coefficient35_92,
    output := OriginalRow227TriangleData0545.coefficient36_92, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_94, Icur := OriginalRow227TriangleData0531.coefficient35_93,
    output := OriginalRow227TriangleData0545.coefficient36_93, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_95, Icur := OriginalRow227TriangleData0531.coefficient35_94,
    output := OriginalRow227TriangleData0545.coefficient36_94, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_96, Icur := OriginalRow227TriangleData0531.coefficient35_95,
    output := OriginalRow227TriangleData0545.coefficient36_95, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_97, Icur := OriginalRow227TriangleData0531.coefficient35_96,
    output := OriginalRow227TriangleData0545.coefficient36_96, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0532.coefficient35_98, Icur := OriginalRow227TriangleData0531.coefficient35_97,
    output := OriginalRow227TriangleData0545.coefficient36_97, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0532.coefficient35_99, Icur := OriginalRow227TriangleData0532.coefficient35_98,
    output := OriginalRow227TriangleData0545.coefficient36_98, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0529

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0529.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
