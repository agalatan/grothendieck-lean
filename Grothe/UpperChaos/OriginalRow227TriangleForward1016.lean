import Grothe.UpperChaos.OriginalRow227TriangleData1020
import Grothe.UpperChaos.OriginalRow227TriangleData1021
import Grothe.UpperChaos.OriginalRow227TriangleData1032
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1016
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_74, Icur := OriginalRow227TriangleData1020.coefficient73_73,
    output := OriginalRow227TriangleData1032.coefficient74_73, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_75, Icur := OriginalRow227TriangleData1020.coefficient73_74,
    output := OriginalRow227TriangleData1032.coefficient74_74, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_76, Icur := OriginalRow227TriangleData1020.coefficient73_75,
    output := OriginalRow227TriangleData1032.coefficient74_75, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_77, Icur := OriginalRow227TriangleData1020.coefficient73_76,
    output := OriginalRow227TriangleData1032.coefficient74_76, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_78, Icur := OriginalRow227TriangleData1020.coefficient73_77,
    output := OriginalRow227TriangleData1032.coefficient74_77, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_79, Icur := OriginalRow227TriangleData1020.coefficient73_78,
    output := OriginalRow227TriangleData1032.coefficient74_78, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_80, Icur := OriginalRow227TriangleData1020.coefficient73_79,
    output := OriginalRow227TriangleData1032.coefficient74_79, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_81, Icur := OriginalRow227TriangleData1020.coefficient73_80,
    output := OriginalRow227TriangleData1032.coefficient74_80, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_82, Icur := OriginalRow227TriangleData1020.coefficient73_81,
    output := OriginalRow227TriangleData1032.coefficient74_81, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_83, Icur := OriginalRow227TriangleData1020.coefficient73_82,
    output := OriginalRow227TriangleData1032.coefficient74_82, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_84, Icur := OriginalRow227TriangleData1020.coefficient73_83,
    output := OriginalRow227TriangleData1032.coefficient74_83, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_85, Icur := OriginalRow227TriangleData1020.coefficient73_84,
    output := OriginalRow227TriangleData1032.coefficient74_84, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_86, Icur := OriginalRow227TriangleData1020.coefficient73_85,
    output := OriginalRow227TriangleData1032.coefficient74_85, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_87, Icur := OriginalRow227TriangleData1020.coefficient73_86,
    output := OriginalRow227TriangleData1032.coefficient74_86, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_88, Icur := OriginalRow227TriangleData1020.coefficient73_87,
    output := OriginalRow227TriangleData1032.coefficient74_87, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_89, Icur := OriginalRow227TriangleData1020.coefficient73_88,
    output := OriginalRow227TriangleData1032.coefficient74_88, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_90, Icur := OriginalRow227TriangleData1020.coefficient73_89,
    output := OriginalRow227TriangleData1032.coefficient74_89, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_91, Icur := OriginalRow227TriangleData1020.coefficient73_90,
    output := OriginalRow227TriangleData1032.coefficient74_90, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_92, Icur := OriginalRow227TriangleData1020.coefficient73_91,
    output := OriginalRow227TriangleData1032.coefficient74_91, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_93, Icur := OriginalRow227TriangleData1020.coefficient73_92,
    output := OriginalRow227TriangleData1032.coefficient74_92, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_94, Icur := OriginalRow227TriangleData1020.coefficient73_93,
    output := OriginalRow227TriangleData1032.coefficient74_93, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_95, Icur := OriginalRow227TriangleData1020.coefficient73_94,
    output := OriginalRow227TriangleData1032.coefficient74_94, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_96, Icur := OriginalRow227TriangleData1020.coefficient73_95,
    output := OriginalRow227TriangleData1032.coefficient74_95, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_97, Icur := OriginalRow227TriangleData1020.coefficient73_96,
    output := OriginalRow227TriangleData1032.coefficient74_96, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_98, Icur := OriginalRow227TriangleData1020.coefficient73_97,
    output := OriginalRow227TriangleData1032.coefficient74_97, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_99, Icur := OriginalRow227TriangleData1020.coefficient73_98,
    output := OriginalRow227TriangleData1032.coefficient74_98, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_100, Icur := OriginalRow227TriangleData1020.coefficient73_99,
    output := OriginalRow227TriangleData1032.coefficient74_99, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_101, Icur := OriginalRow227TriangleData1020.coefficient73_100,
    output := OriginalRow227TriangleData1032.coefficient74_100, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_102, Icur := OriginalRow227TriangleData1020.coefficient73_101,
    output := OriginalRow227TriangleData1032.coefficient74_101, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1020.coefficient73_103, Icur := OriginalRow227TriangleData1020.coefficient73_102,
    output := OriginalRow227TriangleData1032.coefficient74_102, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1021.coefficient73_104, Icur := OriginalRow227TriangleData1020.coefficient73_103,
    output := OriginalRow227TriangleData1032.coefficient74_103, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1021.coefficient73_105, Icur := OriginalRow227TriangleData1021.coefficient73_104,
    output := OriginalRow227TriangleData1032.coefficient74_104, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1016

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1016.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
