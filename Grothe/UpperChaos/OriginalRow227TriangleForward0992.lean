import Grothe.UpperChaos.OriginalRow227TriangleData0996
import Grothe.UpperChaos.OriginalRow227TriangleData0997
import Grothe.UpperChaos.OriginalRow227TriangleData1008
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0992
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_72, Icur := OriginalRow227TriangleData0996.coefficient71_71,
    output := OriginalRow227TriangleData1008.coefficient72_71, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_73, Icur := OriginalRow227TriangleData0996.coefficient71_72,
    output := OriginalRow227TriangleData1008.coefficient72_72, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_74, Icur := OriginalRow227TriangleData0996.coefficient71_73,
    output := OriginalRow227TriangleData1008.coefficient72_73, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_75, Icur := OriginalRow227TriangleData0996.coefficient71_74,
    output := OriginalRow227TriangleData1008.coefficient72_74, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_76, Icur := OriginalRow227TriangleData0996.coefficient71_75,
    output := OriginalRow227TriangleData1008.coefficient72_75, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_77, Icur := OriginalRow227TriangleData0996.coefficient71_76,
    output := OriginalRow227TriangleData1008.coefficient72_76, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_78, Icur := OriginalRow227TriangleData0996.coefficient71_77,
    output := OriginalRow227TriangleData1008.coefficient72_77, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_79, Icur := OriginalRow227TriangleData0996.coefficient71_78,
    output := OriginalRow227TriangleData1008.coefficient72_78, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_80, Icur := OriginalRow227TriangleData0996.coefficient71_79,
    output := OriginalRow227TriangleData1008.coefficient72_79, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_81, Icur := OriginalRow227TriangleData0996.coefficient71_80,
    output := OriginalRow227TriangleData1008.coefficient72_80, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_82, Icur := OriginalRow227TriangleData0996.coefficient71_81,
    output := OriginalRow227TriangleData1008.coefficient72_81, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_83, Icur := OriginalRow227TriangleData0996.coefficient71_82,
    output := OriginalRow227TriangleData1008.coefficient72_82, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_84, Icur := OriginalRow227TriangleData0996.coefficient71_83,
    output := OriginalRow227TriangleData1008.coefficient72_83, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_85, Icur := OriginalRow227TriangleData0996.coefficient71_84,
    output := OriginalRow227TriangleData1008.coefficient72_84, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_86, Icur := OriginalRow227TriangleData0996.coefficient71_85,
    output := OriginalRow227TriangleData1008.coefficient72_85, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_87, Icur := OriginalRow227TriangleData0996.coefficient71_86,
    output := OriginalRow227TriangleData1008.coefficient72_86, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_88, Icur := OriginalRow227TriangleData0996.coefficient71_87,
    output := OriginalRow227TriangleData1008.coefficient72_87, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_89, Icur := OriginalRow227TriangleData0996.coefficient71_88,
    output := OriginalRow227TriangleData1008.coefficient72_88, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_90, Icur := OriginalRow227TriangleData0996.coefficient71_89,
    output := OriginalRow227TriangleData1008.coefficient72_89, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_91, Icur := OriginalRow227TriangleData0996.coefficient71_90,
    output := OriginalRow227TriangleData1008.coefficient72_90, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_92, Icur := OriginalRow227TriangleData0996.coefficient71_91,
    output := OriginalRow227TriangleData1008.coefficient72_91, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_93, Icur := OriginalRow227TriangleData0996.coefficient71_92,
    output := OriginalRow227TriangleData1008.coefficient72_92, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_94, Icur := OriginalRow227TriangleData0996.coefficient71_93,
    output := OriginalRow227TriangleData1008.coefficient72_93, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_95, Icur := OriginalRow227TriangleData0996.coefficient71_94,
    output := OriginalRow227TriangleData1008.coefficient72_94, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_96, Icur := OriginalRow227TriangleData0996.coefficient71_95,
    output := OriginalRow227TriangleData1008.coefficient72_95, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_97, Icur := OriginalRow227TriangleData0996.coefficient71_96,
    output := OriginalRow227TriangleData1008.coefficient72_96, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_98, Icur := OriginalRow227TriangleData0996.coefficient71_97,
    output := OriginalRow227TriangleData1008.coefficient72_97, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_99, Icur := OriginalRow227TriangleData0996.coefficient71_98,
    output := OriginalRow227TriangleData1008.coefficient72_98, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_100, Icur := OriginalRow227TriangleData0996.coefficient71_99,
    output := OriginalRow227TriangleData1008.coefficient72_99, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0996.coefficient71_101, Icur := OriginalRow227TriangleData0996.coefficient71_100,
    output := OriginalRow227TriangleData1008.coefficient72_100, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0997.coefficient71_102, Icur := OriginalRow227TriangleData0996.coefficient71_101,
    output := OriginalRow227TriangleData1008.coefficient72_101, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData0997.coefficient71_103, Icur := OriginalRow227TriangleData0997.coefficient71_102,
    output := OriginalRow227TriangleData1008.coefficient72_102, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0992

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0992.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
