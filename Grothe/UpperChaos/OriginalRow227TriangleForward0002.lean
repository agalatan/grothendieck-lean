import Grothe.UpperChaos.OriginalRow227TriangleData0002
import Grothe.UpperChaos.OriginalRow227TriangleData0003
import Grothe.UpperChaos.OriginalRow227TriangleData0018
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0002
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_65, Icur := OriginalRow227TriangleData0002.coefficient0_64,
    output := OriginalRow227TriangleData0018.coefficient1_64, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_66, Icur := OriginalRow227TriangleData0002.coefficient0_65,
    output := OriginalRow227TriangleData0018.coefficient1_65, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_67, Icur := OriginalRow227TriangleData0002.coefficient0_66,
    output := OriginalRow227TriangleData0018.coefficient1_66, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_68, Icur := OriginalRow227TriangleData0002.coefficient0_67,
    output := OriginalRow227TriangleData0018.coefficient1_67, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_69, Icur := OriginalRow227TriangleData0002.coefficient0_68,
    output := OriginalRow227TriangleData0018.coefficient1_68, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_70, Icur := OriginalRow227TriangleData0002.coefficient0_69,
    output := OriginalRow227TriangleData0018.coefficient1_69, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_71, Icur := OriginalRow227TriangleData0002.coefficient0_70,
    output := OriginalRow227TriangleData0018.coefficient1_70, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_72, Icur := OriginalRow227TriangleData0002.coefficient0_71,
    output := OriginalRow227TriangleData0018.coefficient1_71, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_73, Icur := OriginalRow227TriangleData0002.coefficient0_72,
    output := OriginalRow227TriangleData0018.coefficient1_72, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_74, Icur := OriginalRow227TriangleData0002.coefficient0_73,
    output := OriginalRow227TriangleData0018.coefficient1_73, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_75, Icur := OriginalRow227TriangleData0002.coefficient0_74,
    output := OriginalRow227TriangleData0018.coefficient1_74, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_76, Icur := OriginalRow227TriangleData0002.coefficient0_75,
    output := OriginalRow227TriangleData0018.coefficient1_75, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_77, Icur := OriginalRow227TriangleData0002.coefficient0_76,
    output := OriginalRow227TriangleData0018.coefficient1_76, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_78, Icur := OriginalRow227TriangleData0002.coefficient0_77,
    output := OriginalRow227TriangleData0018.coefficient1_77, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_79, Icur := OriginalRow227TriangleData0002.coefficient0_78,
    output := OriginalRow227TriangleData0018.coefficient1_78, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_80, Icur := OriginalRow227TriangleData0002.coefficient0_79,
    output := OriginalRow227TriangleData0018.coefficient1_79, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_81, Icur := OriginalRow227TriangleData0002.coefficient0_80,
    output := OriginalRow227TriangleData0018.coefficient1_80, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_82, Icur := OriginalRow227TriangleData0002.coefficient0_81,
    output := OriginalRow227TriangleData0018.coefficient1_81, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_83, Icur := OriginalRow227TriangleData0002.coefficient0_82,
    output := OriginalRow227TriangleData0018.coefficient1_82, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_84, Icur := OriginalRow227TriangleData0002.coefficient0_83,
    output := OriginalRow227TriangleData0018.coefficient1_83, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_85, Icur := OriginalRow227TriangleData0002.coefficient0_84,
    output := OriginalRow227TriangleData0018.coefficient1_84, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_86, Icur := OriginalRow227TriangleData0002.coefficient0_85,
    output := OriginalRow227TriangleData0018.coefficient1_85, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_87, Icur := OriginalRow227TriangleData0002.coefficient0_86,
    output := OriginalRow227TriangleData0018.coefficient1_86, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_88, Icur := OriginalRow227TriangleData0002.coefficient0_87,
    output := OriginalRow227TriangleData0018.coefficient1_87, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_89, Icur := OriginalRow227TriangleData0002.coefficient0_88,
    output := OriginalRow227TriangleData0018.coefficient1_88, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_90, Icur := OriginalRow227TriangleData0002.coefficient0_89,
    output := OriginalRow227TriangleData0018.coefficient1_89, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_91, Icur := OriginalRow227TriangleData0002.coefficient0_90,
    output := OriginalRow227TriangleData0018.coefficient1_90, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_92, Icur := OriginalRow227TriangleData0002.coefficient0_91,
    output := OriginalRow227TriangleData0018.coefficient1_91, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_93, Icur := OriginalRow227TriangleData0002.coefficient0_92,
    output := OriginalRow227TriangleData0018.coefficient1_92, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_94, Icur := OriginalRow227TriangleData0002.coefficient0_93,
    output := OriginalRow227TriangleData0018.coefficient1_93, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_95, Icur := OriginalRow227TriangleData0002.coefficient0_94,
    output := OriginalRow227TriangleData0018.coefficient1_94, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0003.coefficient0_96, Icur := OriginalRow227TriangleData0002.coefficient0_95,
    output := OriginalRow227TriangleData0018.coefficient1_95, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0002

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0002.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
