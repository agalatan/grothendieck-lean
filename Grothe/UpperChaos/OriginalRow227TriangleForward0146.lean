import Grothe.UpperChaos.OriginalRow227TriangleData0146
import Grothe.UpperChaos.OriginalRow227TriangleData0147
import Grothe.UpperChaos.OriginalRow227TriangleData0162
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0146
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_74, Icur := OriginalRow227TriangleData0146.coefficient9_73,
    output := OriginalRow227TriangleData0162.coefficient10_73, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_75, Icur := OriginalRow227TriangleData0146.coefficient9_74,
    output := OriginalRow227TriangleData0162.coefficient10_74, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_76, Icur := OriginalRow227TriangleData0146.coefficient9_75,
    output := OriginalRow227TriangleData0162.coefficient10_75, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_77, Icur := OriginalRow227TriangleData0146.coefficient9_76,
    output := OriginalRow227TriangleData0162.coefficient10_76, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_78, Icur := OriginalRow227TriangleData0146.coefficient9_77,
    output := OriginalRow227TriangleData0162.coefficient10_77, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_79, Icur := OriginalRow227TriangleData0146.coefficient9_78,
    output := OriginalRow227TriangleData0162.coefficient10_78, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_80, Icur := OriginalRow227TriangleData0146.coefficient9_79,
    output := OriginalRow227TriangleData0162.coefficient10_79, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_81, Icur := OriginalRow227TriangleData0146.coefficient9_80,
    output := OriginalRow227TriangleData0162.coefficient10_80, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_82, Icur := OriginalRow227TriangleData0146.coefficient9_81,
    output := OriginalRow227TriangleData0162.coefficient10_81, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_83, Icur := OriginalRow227TriangleData0146.coefficient9_82,
    output := OriginalRow227TriangleData0162.coefficient10_82, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_84, Icur := OriginalRow227TriangleData0146.coefficient9_83,
    output := OriginalRow227TriangleData0162.coefficient10_83, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_85, Icur := OriginalRow227TriangleData0146.coefficient9_84,
    output := OriginalRow227TriangleData0162.coefficient10_84, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_86, Icur := OriginalRow227TriangleData0146.coefficient9_85,
    output := OriginalRow227TriangleData0162.coefficient10_85, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_87, Icur := OriginalRow227TriangleData0146.coefficient9_86,
    output := OriginalRow227TriangleData0162.coefficient10_86, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_88, Icur := OriginalRow227TriangleData0146.coefficient9_87,
    output := OriginalRow227TriangleData0162.coefficient10_87, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_89, Icur := OriginalRow227TriangleData0146.coefficient9_88,
    output := OriginalRow227TriangleData0162.coefficient10_88, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_90, Icur := OriginalRow227TriangleData0146.coefficient9_89,
    output := OriginalRow227TriangleData0162.coefficient10_89, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_91, Icur := OriginalRow227TriangleData0146.coefficient9_90,
    output := OriginalRow227TriangleData0162.coefficient10_90, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_92, Icur := OriginalRow227TriangleData0146.coefficient9_91,
    output := OriginalRow227TriangleData0162.coefficient10_91, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_93, Icur := OriginalRow227TriangleData0146.coefficient9_92,
    output := OriginalRow227TriangleData0162.coefficient10_92, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_94, Icur := OriginalRow227TriangleData0146.coefficient9_93,
    output := OriginalRow227TriangleData0162.coefficient10_93, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_95, Icur := OriginalRow227TriangleData0146.coefficient9_94,
    output := OriginalRow227TriangleData0162.coefficient10_94, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_96, Icur := OriginalRow227TriangleData0146.coefficient9_95,
    output := OriginalRow227TriangleData0162.coefficient10_95, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_97, Icur := OriginalRow227TriangleData0146.coefficient9_96,
    output := OriginalRow227TriangleData0162.coefficient10_96, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_98, Icur := OriginalRow227TriangleData0146.coefficient9_97,
    output := OriginalRow227TriangleData0162.coefficient10_97, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_99, Icur := OriginalRow227TriangleData0146.coefficient9_98,
    output := OriginalRow227TriangleData0162.coefficient10_98, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_100, Icur := OriginalRow227TriangleData0146.coefficient9_99,
    output := OriginalRow227TriangleData0162.coefficient10_99, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_101, Icur := OriginalRow227TriangleData0146.coefficient9_100,
    output := OriginalRow227TriangleData0162.coefficient10_100, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_102, Icur := OriginalRow227TriangleData0146.coefficient9_101,
    output := OriginalRow227TriangleData0162.coefficient10_101, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0146.coefficient9_103, Icur := OriginalRow227TriangleData0146.coefficient9_102,
    output := OriginalRow227TriangleData0162.coefficient10_102, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_104, Icur := OriginalRow227TriangleData0146.coefficient9_103,
    output := OriginalRow227TriangleData0162.coefficient10_103, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_105, Icur := OriginalRow227TriangleData0147.coefficient9_104,
    output := OriginalRow227TriangleData0162.coefficient10_104, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0146

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0146.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
