import Grothe.UpperChaos.OriginalRow227TriangleData0984
import Grothe.UpperChaos.OriginalRow227TriangleData0985
import Grothe.UpperChaos.OriginalRow227TriangleData0996
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0980
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_71, Icur := OriginalRow227TriangleData0984.coefficient70_70,
    output := OriginalRow227TriangleData0996.coefficient71_70, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_72, Icur := OriginalRow227TriangleData0984.coefficient70_71,
    output := OriginalRow227TriangleData0996.coefficient71_71, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_73, Icur := OriginalRow227TriangleData0984.coefficient70_72,
    output := OriginalRow227TriangleData0996.coefficient71_72, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_74, Icur := OriginalRow227TriangleData0984.coefficient70_73,
    output := OriginalRow227TriangleData0996.coefficient71_73, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_75, Icur := OriginalRow227TriangleData0984.coefficient70_74,
    output := OriginalRow227TriangleData0996.coefficient71_74, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_76, Icur := OriginalRow227TriangleData0984.coefficient70_75,
    output := OriginalRow227TriangleData0996.coefficient71_75, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_77, Icur := OriginalRow227TriangleData0984.coefficient70_76,
    output := OriginalRow227TriangleData0996.coefficient71_76, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_78, Icur := OriginalRow227TriangleData0984.coefficient70_77,
    output := OriginalRow227TriangleData0996.coefficient71_77, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_79, Icur := OriginalRow227TriangleData0984.coefficient70_78,
    output := OriginalRow227TriangleData0996.coefficient71_78, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_80, Icur := OriginalRow227TriangleData0984.coefficient70_79,
    output := OriginalRow227TriangleData0996.coefficient71_79, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_81, Icur := OriginalRow227TriangleData0984.coefficient70_80,
    output := OriginalRow227TriangleData0996.coefficient71_80, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_82, Icur := OriginalRow227TriangleData0984.coefficient70_81,
    output := OriginalRow227TriangleData0996.coefficient71_81, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_83, Icur := OriginalRow227TriangleData0984.coefficient70_82,
    output := OriginalRow227TriangleData0996.coefficient71_82, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_84, Icur := OriginalRow227TriangleData0984.coefficient70_83,
    output := OriginalRow227TriangleData0996.coefficient71_83, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_85, Icur := OriginalRow227TriangleData0984.coefficient70_84,
    output := OriginalRow227TriangleData0996.coefficient71_84, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_86, Icur := OriginalRow227TriangleData0984.coefficient70_85,
    output := OriginalRow227TriangleData0996.coefficient71_85, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_87, Icur := OriginalRow227TriangleData0984.coefficient70_86,
    output := OriginalRow227TriangleData0996.coefficient71_86, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_88, Icur := OriginalRow227TriangleData0984.coefficient70_87,
    output := OriginalRow227TriangleData0996.coefficient71_87, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_89, Icur := OriginalRow227TriangleData0984.coefficient70_88,
    output := OriginalRow227TriangleData0996.coefficient71_88, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_90, Icur := OriginalRow227TriangleData0984.coefficient70_89,
    output := OriginalRow227TriangleData0996.coefficient71_89, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_91, Icur := OriginalRow227TriangleData0984.coefficient70_90,
    output := OriginalRow227TriangleData0996.coefficient71_90, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_92, Icur := OriginalRow227TriangleData0984.coefficient70_91,
    output := OriginalRow227TriangleData0996.coefficient71_91, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_93, Icur := OriginalRow227TriangleData0984.coefficient70_92,
    output := OriginalRow227TriangleData0996.coefficient71_92, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_94, Icur := OriginalRow227TriangleData0984.coefficient70_93,
    output := OriginalRow227TriangleData0996.coefficient71_93, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_95, Icur := OriginalRow227TriangleData0984.coefficient70_94,
    output := OriginalRow227TriangleData0996.coefficient71_94, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_96, Icur := OriginalRow227TriangleData0984.coefficient70_95,
    output := OriginalRow227TriangleData0996.coefficient71_95, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_97, Icur := OriginalRow227TriangleData0984.coefficient70_96,
    output := OriginalRow227TriangleData0996.coefficient71_96, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_98, Icur := OriginalRow227TriangleData0984.coefficient70_97,
    output := OriginalRow227TriangleData0996.coefficient71_97, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_99, Icur := OriginalRow227TriangleData0984.coefficient70_98,
    output := OriginalRow227TriangleData0996.coefficient71_98, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0984.coefficient70_100, Icur := OriginalRow227TriangleData0984.coefficient70_99,
    output := OriginalRow227TriangleData0996.coefficient71_99, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_101, Icur := OriginalRow227TriangleData0984.coefficient70_100,
    output := OriginalRow227TriangleData0996.coefficient71_100, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0985.coefficient70_102, Icur := OriginalRow227TriangleData0985.coefficient70_101,
    output := OriginalRow227TriangleData0996.coefficient71_101, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0980

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0980.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
