import Grothe.UpperChaos.OriginalRow227TriangleData0114
import Grothe.UpperChaos.OriginalRow227TriangleData0115
import Grothe.UpperChaos.OriginalRow227TriangleData0130
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0114
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_72, Icur := OriginalRow227TriangleData0114.coefficient7_71,
    output := OriginalRow227TriangleData0130.coefficient8_71, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_73, Icur := OriginalRow227TriangleData0114.coefficient7_72,
    output := OriginalRow227TriangleData0130.coefficient8_72, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_74, Icur := OriginalRow227TriangleData0114.coefficient7_73,
    output := OriginalRow227TriangleData0130.coefficient8_73, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_75, Icur := OriginalRow227TriangleData0114.coefficient7_74,
    output := OriginalRow227TriangleData0130.coefficient8_74, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_76, Icur := OriginalRow227TriangleData0114.coefficient7_75,
    output := OriginalRow227TriangleData0130.coefficient8_75, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_77, Icur := OriginalRow227TriangleData0114.coefficient7_76,
    output := OriginalRow227TriangleData0130.coefficient8_76, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_78, Icur := OriginalRow227TriangleData0114.coefficient7_77,
    output := OriginalRow227TriangleData0130.coefficient8_77, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_79, Icur := OriginalRow227TriangleData0114.coefficient7_78,
    output := OriginalRow227TriangleData0130.coefficient8_78, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_80, Icur := OriginalRow227TriangleData0114.coefficient7_79,
    output := OriginalRow227TriangleData0130.coefficient8_79, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_81, Icur := OriginalRow227TriangleData0114.coefficient7_80,
    output := OriginalRow227TriangleData0130.coefficient8_80, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_82, Icur := OriginalRow227TriangleData0114.coefficient7_81,
    output := OriginalRow227TriangleData0130.coefficient8_81, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_83, Icur := OriginalRow227TriangleData0114.coefficient7_82,
    output := OriginalRow227TriangleData0130.coefficient8_82, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_84, Icur := OriginalRow227TriangleData0114.coefficient7_83,
    output := OriginalRow227TriangleData0130.coefficient8_83, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_85, Icur := OriginalRow227TriangleData0114.coefficient7_84,
    output := OriginalRow227TriangleData0130.coefficient8_84, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_86, Icur := OriginalRow227TriangleData0114.coefficient7_85,
    output := OriginalRow227TriangleData0130.coefficient8_85, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_87, Icur := OriginalRow227TriangleData0114.coefficient7_86,
    output := OriginalRow227TriangleData0130.coefficient8_86, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_88, Icur := OriginalRow227TriangleData0114.coefficient7_87,
    output := OriginalRow227TriangleData0130.coefficient8_87, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_89, Icur := OriginalRow227TriangleData0114.coefficient7_88,
    output := OriginalRow227TriangleData0130.coefficient8_88, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_90, Icur := OriginalRow227TriangleData0114.coefficient7_89,
    output := OriginalRow227TriangleData0130.coefficient8_89, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_91, Icur := OriginalRow227TriangleData0114.coefficient7_90,
    output := OriginalRow227TriangleData0130.coefficient8_90, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_92, Icur := OriginalRow227TriangleData0114.coefficient7_91,
    output := OriginalRow227TriangleData0130.coefficient8_91, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_93, Icur := OriginalRow227TriangleData0114.coefficient7_92,
    output := OriginalRow227TriangleData0130.coefficient8_92, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_94, Icur := OriginalRow227TriangleData0114.coefficient7_93,
    output := OriginalRow227TriangleData0130.coefficient8_93, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_95, Icur := OriginalRow227TriangleData0114.coefficient7_94,
    output := OriginalRow227TriangleData0130.coefficient8_94, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_96, Icur := OriginalRow227TriangleData0114.coefficient7_95,
    output := OriginalRow227TriangleData0130.coefficient8_95, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_97, Icur := OriginalRow227TriangleData0114.coefficient7_96,
    output := OriginalRow227TriangleData0130.coefficient8_96, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_98, Icur := OriginalRow227TriangleData0114.coefficient7_97,
    output := OriginalRow227TriangleData0130.coefficient8_97, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_99, Icur := OriginalRow227TriangleData0114.coefficient7_98,
    output := OriginalRow227TriangleData0130.coefficient8_98, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_100, Icur := OriginalRow227TriangleData0114.coefficient7_99,
    output := OriginalRow227TriangleData0130.coefficient8_99, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_101, Icur := OriginalRow227TriangleData0114.coefficient7_100,
    output := OriginalRow227TriangleData0130.coefficient8_100, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0115.coefficient7_102, Icur := OriginalRow227TriangleData0114.coefficient7_101,
    output := OriginalRow227TriangleData0130.coefficient8_101, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0115.coefficient7_103, Icur := OriginalRow227TriangleData0115.coefficient7_102,
    output := OriginalRow227TriangleData0130.coefficient8_102, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0114

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0114.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
