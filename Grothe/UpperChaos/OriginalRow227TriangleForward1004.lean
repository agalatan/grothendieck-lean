import Grothe.UpperChaos.OriginalRow227TriangleData1008
import Grothe.UpperChaos.OriginalRow227TriangleData1009
import Grothe.UpperChaos.OriginalRow227TriangleData1020
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1004
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_73, Icur := OriginalRow227TriangleData1008.coefficient72_72,
    output := OriginalRow227TriangleData1020.coefficient73_72, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_74, Icur := OriginalRow227TriangleData1008.coefficient72_73,
    output := OriginalRow227TriangleData1020.coefficient73_73, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_75, Icur := OriginalRow227TriangleData1008.coefficient72_74,
    output := OriginalRow227TriangleData1020.coefficient73_74, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_76, Icur := OriginalRow227TriangleData1008.coefficient72_75,
    output := OriginalRow227TriangleData1020.coefficient73_75, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_77, Icur := OriginalRow227TriangleData1008.coefficient72_76,
    output := OriginalRow227TriangleData1020.coefficient73_76, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_78, Icur := OriginalRow227TriangleData1008.coefficient72_77,
    output := OriginalRow227TriangleData1020.coefficient73_77, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_79, Icur := OriginalRow227TriangleData1008.coefficient72_78,
    output := OriginalRow227TriangleData1020.coefficient73_78, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_80, Icur := OriginalRow227TriangleData1008.coefficient72_79,
    output := OriginalRow227TriangleData1020.coefficient73_79, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_81, Icur := OriginalRow227TriangleData1008.coefficient72_80,
    output := OriginalRow227TriangleData1020.coefficient73_80, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_82, Icur := OriginalRow227TriangleData1008.coefficient72_81,
    output := OriginalRow227TriangleData1020.coefficient73_81, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_83, Icur := OriginalRow227TriangleData1008.coefficient72_82,
    output := OriginalRow227TriangleData1020.coefficient73_82, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_84, Icur := OriginalRow227TriangleData1008.coefficient72_83,
    output := OriginalRow227TriangleData1020.coefficient73_83, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_85, Icur := OriginalRow227TriangleData1008.coefficient72_84,
    output := OriginalRow227TriangleData1020.coefficient73_84, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_86, Icur := OriginalRow227TriangleData1008.coefficient72_85,
    output := OriginalRow227TriangleData1020.coefficient73_85, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_87, Icur := OriginalRow227TriangleData1008.coefficient72_86,
    output := OriginalRow227TriangleData1020.coefficient73_86, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_88, Icur := OriginalRow227TriangleData1008.coefficient72_87,
    output := OriginalRow227TriangleData1020.coefficient73_87, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_89, Icur := OriginalRow227TriangleData1008.coefficient72_88,
    output := OriginalRow227TriangleData1020.coefficient73_88, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_90, Icur := OriginalRow227TriangleData1008.coefficient72_89,
    output := OriginalRow227TriangleData1020.coefficient73_89, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_91, Icur := OriginalRow227TriangleData1008.coefficient72_90,
    output := OriginalRow227TriangleData1020.coefficient73_90, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_92, Icur := OriginalRow227TriangleData1008.coefficient72_91,
    output := OriginalRow227TriangleData1020.coefficient73_91, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_93, Icur := OriginalRow227TriangleData1008.coefficient72_92,
    output := OriginalRow227TriangleData1020.coefficient73_92, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_94, Icur := OriginalRow227TriangleData1008.coefficient72_93,
    output := OriginalRow227TriangleData1020.coefficient73_93, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_95, Icur := OriginalRow227TriangleData1008.coefficient72_94,
    output := OriginalRow227TriangleData1020.coefficient73_94, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_96, Icur := OriginalRow227TriangleData1008.coefficient72_95,
    output := OriginalRow227TriangleData1020.coefficient73_95, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_97, Icur := OriginalRow227TriangleData1008.coefficient72_96,
    output := OriginalRow227TriangleData1020.coefficient73_96, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_98, Icur := OriginalRow227TriangleData1008.coefficient72_97,
    output := OriginalRow227TriangleData1020.coefficient73_97, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_99, Icur := OriginalRow227TriangleData1008.coefficient72_98,
    output := OriginalRow227TriangleData1020.coefficient73_98, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_100, Icur := OriginalRow227TriangleData1008.coefficient72_99,
    output := OriginalRow227TriangleData1020.coefficient73_99, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_101, Icur := OriginalRow227TriangleData1008.coefficient72_100,
    output := OriginalRow227TriangleData1020.coefficient73_100, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1008.coefficient72_102, Icur := OriginalRow227TriangleData1008.coefficient72_101,
    output := OriginalRow227TriangleData1020.coefficient73_101, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1009.coefficient72_103, Icur := OriginalRow227TriangleData1008.coefficient72_102,
    output := OriginalRow227TriangleData1020.coefficient73_102, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1009.coefficient72_104, Icur := OriginalRow227TriangleData1009.coefficient72_103,
    output := OriginalRow227TriangleData1020.coefficient73_103, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1004

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1004.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
