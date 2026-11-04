import Grothe.UpperChaos.OriginalRow227TriangleData0082
import Grothe.UpperChaos.OriginalRow227TriangleData0083
import Grothe.UpperChaos.OriginalRow227TriangleData0098
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0082
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_70, Icur := OriginalRow227TriangleData0082.coefficient5_69,
    output := OriginalRow227TriangleData0098.coefficient6_69, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_71, Icur := OriginalRow227TriangleData0082.coefficient5_70,
    output := OriginalRow227TriangleData0098.coefficient6_70, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_72, Icur := OriginalRow227TriangleData0082.coefficient5_71,
    output := OriginalRow227TriangleData0098.coefficient6_71, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_73, Icur := OriginalRow227TriangleData0082.coefficient5_72,
    output := OriginalRow227TriangleData0098.coefficient6_72, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_74, Icur := OriginalRow227TriangleData0082.coefficient5_73,
    output := OriginalRow227TriangleData0098.coefficient6_73, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_75, Icur := OriginalRow227TriangleData0082.coefficient5_74,
    output := OriginalRow227TriangleData0098.coefficient6_74, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_76, Icur := OriginalRow227TriangleData0082.coefficient5_75,
    output := OriginalRow227TriangleData0098.coefficient6_75, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_77, Icur := OriginalRow227TriangleData0082.coefficient5_76,
    output := OriginalRow227TriangleData0098.coefficient6_76, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_78, Icur := OriginalRow227TriangleData0082.coefficient5_77,
    output := OriginalRow227TriangleData0098.coefficient6_77, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_79, Icur := OriginalRow227TriangleData0082.coefficient5_78,
    output := OriginalRow227TriangleData0098.coefficient6_78, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_80, Icur := OriginalRow227TriangleData0082.coefficient5_79,
    output := OriginalRow227TriangleData0098.coefficient6_79, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_81, Icur := OriginalRow227TriangleData0082.coefficient5_80,
    output := OriginalRow227TriangleData0098.coefficient6_80, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_82, Icur := OriginalRow227TriangleData0082.coefficient5_81,
    output := OriginalRow227TriangleData0098.coefficient6_81, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_83, Icur := OriginalRow227TriangleData0082.coefficient5_82,
    output := OriginalRow227TriangleData0098.coefficient6_82, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_84, Icur := OriginalRow227TriangleData0082.coefficient5_83,
    output := OriginalRow227TriangleData0098.coefficient6_83, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_85, Icur := OriginalRow227TriangleData0082.coefficient5_84,
    output := OriginalRow227TriangleData0098.coefficient6_84, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_86, Icur := OriginalRow227TriangleData0082.coefficient5_85,
    output := OriginalRow227TriangleData0098.coefficient6_85, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_87, Icur := OriginalRow227TriangleData0082.coefficient5_86,
    output := OriginalRow227TriangleData0098.coefficient6_86, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_88, Icur := OriginalRow227TriangleData0082.coefficient5_87,
    output := OriginalRow227TriangleData0098.coefficient6_87, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_89, Icur := OriginalRow227TriangleData0082.coefficient5_88,
    output := OriginalRow227TriangleData0098.coefficient6_88, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_90, Icur := OriginalRow227TriangleData0082.coefficient5_89,
    output := OriginalRow227TriangleData0098.coefficient6_89, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_91, Icur := OriginalRow227TriangleData0082.coefficient5_90,
    output := OriginalRow227TriangleData0098.coefficient6_90, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_92, Icur := OriginalRow227TriangleData0082.coefficient5_91,
    output := OriginalRow227TriangleData0098.coefficient6_91, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_93, Icur := OriginalRow227TriangleData0082.coefficient5_92,
    output := OriginalRow227TriangleData0098.coefficient6_92, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_94, Icur := OriginalRow227TriangleData0082.coefficient5_93,
    output := OriginalRow227TriangleData0098.coefficient6_93, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_95, Icur := OriginalRow227TriangleData0082.coefficient5_94,
    output := OriginalRow227TriangleData0098.coefficient6_94, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_96, Icur := OriginalRow227TriangleData0082.coefficient5_95,
    output := OriginalRow227TriangleData0098.coefficient6_95, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_97, Icur := OriginalRow227TriangleData0082.coefficient5_96,
    output := OriginalRow227TriangleData0098.coefficient6_96, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_98, Icur := OriginalRow227TriangleData0082.coefficient5_97,
    output := OriginalRow227TriangleData0098.coefficient6_97, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0082.coefficient5_99, Icur := OriginalRow227TriangleData0082.coefficient5_98,
    output := OriginalRow227TriangleData0098.coefficient6_98, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0083.coefficient5_100, Icur := OriginalRow227TriangleData0082.coefficient5_99,
    output := OriginalRow227TriangleData0098.coefficient6_99, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0083.coefficient5_101, Icur := OriginalRow227TriangleData0083.coefficient5_100,
    output := OriginalRow227TriangleData0098.coefficient6_100, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0082

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0082.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
