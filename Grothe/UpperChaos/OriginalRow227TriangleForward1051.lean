import Grothe.UpperChaos.OriginalRow227TriangleData1056
import Grothe.UpperChaos.OriginalRow227TriangleData1057
import Grothe.UpperChaos.OriginalRow227TriangleData1067
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1051
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_77, Icur := OriginalRow227TriangleData1056.coefficient76_76,
    output := OriginalRow227TriangleData1067.coefficient77_76, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_78, Icur := OriginalRow227TriangleData1056.coefficient76_77,
    output := OriginalRow227TriangleData1067.coefficient77_77, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_79, Icur := OriginalRow227TriangleData1056.coefficient76_78,
    output := OriginalRow227TriangleData1067.coefficient77_78, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_80, Icur := OriginalRow227TriangleData1056.coefficient76_79,
    output := OriginalRow227TriangleData1067.coefficient77_79, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_81, Icur := OriginalRow227TriangleData1056.coefficient76_80,
    output := OriginalRow227TriangleData1067.coefficient77_80, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_82, Icur := OriginalRow227TriangleData1056.coefficient76_81,
    output := OriginalRow227TriangleData1067.coefficient77_81, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_83, Icur := OriginalRow227TriangleData1056.coefficient76_82,
    output := OriginalRow227TriangleData1067.coefficient77_82, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_84, Icur := OriginalRow227TriangleData1056.coefficient76_83,
    output := OriginalRow227TriangleData1067.coefficient77_83, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_85, Icur := OriginalRow227TriangleData1056.coefficient76_84,
    output := OriginalRow227TriangleData1067.coefficient77_84, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_86, Icur := OriginalRow227TriangleData1056.coefficient76_85,
    output := OriginalRow227TriangleData1067.coefficient77_85, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_87, Icur := OriginalRow227TriangleData1056.coefficient76_86,
    output := OriginalRow227TriangleData1067.coefficient77_86, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_88, Icur := OriginalRow227TriangleData1056.coefficient76_87,
    output := OriginalRow227TriangleData1067.coefficient77_87, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_89, Icur := OriginalRow227TriangleData1056.coefficient76_88,
    output := OriginalRow227TriangleData1067.coefficient77_88, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_90, Icur := OriginalRow227TriangleData1056.coefficient76_89,
    output := OriginalRow227TriangleData1067.coefficient77_89, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_91, Icur := OriginalRow227TriangleData1056.coefficient76_90,
    output := OriginalRow227TriangleData1067.coefficient77_90, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_92, Icur := OriginalRow227TriangleData1056.coefficient76_91,
    output := OriginalRow227TriangleData1067.coefficient77_91, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_93, Icur := OriginalRow227TriangleData1056.coefficient76_92,
    output := OriginalRow227TriangleData1067.coefficient77_92, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_94, Icur := OriginalRow227TriangleData1056.coefficient76_93,
    output := OriginalRow227TriangleData1067.coefficient77_93, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_95, Icur := OriginalRow227TriangleData1056.coefficient76_94,
    output := OriginalRow227TriangleData1067.coefficient77_94, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_96, Icur := OriginalRow227TriangleData1056.coefficient76_95,
    output := OriginalRow227TriangleData1067.coefficient77_95, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_97, Icur := OriginalRow227TriangleData1056.coefficient76_96,
    output := OriginalRow227TriangleData1067.coefficient77_96, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_98, Icur := OriginalRow227TriangleData1056.coefficient76_97,
    output := OriginalRow227TriangleData1067.coefficient77_97, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_99, Icur := OriginalRow227TriangleData1056.coefficient76_98,
    output := OriginalRow227TriangleData1067.coefficient77_98, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_100, Icur := OriginalRow227TriangleData1056.coefficient76_99,
    output := OriginalRow227TriangleData1067.coefficient77_99, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_101, Icur := OriginalRow227TriangleData1056.coefficient76_100,
    output := OriginalRow227TriangleData1067.coefficient77_100, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_102, Icur := OriginalRow227TriangleData1056.coefficient76_101,
    output := OriginalRow227TriangleData1067.coefficient77_101, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_103, Icur := OriginalRow227TriangleData1056.coefficient76_102,
    output := OriginalRow227TriangleData1067.coefficient77_102, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_104, Icur := OriginalRow227TriangleData1056.coefficient76_103,
    output := OriginalRow227TriangleData1067.coefficient77_103, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_105, Icur := OriginalRow227TriangleData1056.coefficient76_104,
    output := OriginalRow227TriangleData1067.coefficient77_104, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1056.coefficient76_106, Icur := OriginalRow227TriangleData1056.coefficient76_105,
    output := OriginalRow227TriangleData1067.coefficient77_105, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_107, Icur := OriginalRow227TriangleData1056.coefficient76_106,
    output := OriginalRow227TriangleData1067.coefficient77_106, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_108, Icur := OriginalRow227TriangleData1057.coefficient76_107,
    output := OriginalRow227TriangleData1067.coefficient77_107, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1051

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1051.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
