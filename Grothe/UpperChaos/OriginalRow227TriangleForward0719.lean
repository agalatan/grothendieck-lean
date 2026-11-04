import Grothe.UpperChaos.OriginalRow227TriangleData0722
import Grothe.UpperChaos.OriginalRow227TriangleData0723
import Grothe.UpperChaos.OriginalRow227TriangleData0735
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0719
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_82, Icur := OriginalRow227TriangleData0722.coefficient49_81,
    output := OriginalRow227TriangleData0735.coefficient50_81, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_83, Icur := OriginalRow227TriangleData0722.coefficient49_82,
    output := OriginalRow227TriangleData0735.coefficient50_82, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_84, Icur := OriginalRow227TriangleData0722.coefficient49_83,
    output := OriginalRow227TriangleData0735.coefficient50_83, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_85, Icur := OriginalRow227TriangleData0722.coefficient49_84,
    output := OriginalRow227TriangleData0735.coefficient50_84, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_86, Icur := OriginalRow227TriangleData0722.coefficient49_85,
    output := OriginalRow227TriangleData0735.coefficient50_85, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_87, Icur := OriginalRow227TriangleData0722.coefficient49_86,
    output := OriginalRow227TriangleData0735.coefficient50_86, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_88, Icur := OriginalRow227TriangleData0722.coefficient49_87,
    output := OriginalRow227TriangleData0735.coefficient50_87, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_89, Icur := OriginalRow227TriangleData0722.coefficient49_88,
    output := OriginalRow227TriangleData0735.coefficient50_88, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_90, Icur := OriginalRow227TriangleData0722.coefficient49_89,
    output := OriginalRow227TriangleData0735.coefficient50_89, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_91, Icur := OriginalRow227TriangleData0722.coefficient49_90,
    output := OriginalRow227TriangleData0735.coefficient50_90, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_92, Icur := OriginalRow227TriangleData0722.coefficient49_91,
    output := OriginalRow227TriangleData0735.coefficient50_91, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_93, Icur := OriginalRow227TriangleData0722.coefficient49_92,
    output := OriginalRow227TriangleData0735.coefficient50_92, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_94, Icur := OriginalRow227TriangleData0722.coefficient49_93,
    output := OriginalRow227TriangleData0735.coefficient50_93, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_95, Icur := OriginalRow227TriangleData0722.coefficient49_94,
    output := OriginalRow227TriangleData0735.coefficient50_94, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_96, Icur := OriginalRow227TriangleData0722.coefficient49_95,
    output := OriginalRow227TriangleData0735.coefficient50_95, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_97, Icur := OriginalRow227TriangleData0722.coefficient49_96,
    output := OriginalRow227TriangleData0735.coefficient50_96, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_98, Icur := OriginalRow227TriangleData0722.coefficient49_97,
    output := OriginalRow227TriangleData0735.coefficient50_97, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_99, Icur := OriginalRow227TriangleData0722.coefficient49_98,
    output := OriginalRow227TriangleData0735.coefficient50_98, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_100, Icur := OriginalRow227TriangleData0722.coefficient49_99,
    output := OriginalRow227TriangleData0735.coefficient50_99, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_101, Icur := OriginalRow227TriangleData0722.coefficient49_100,
    output := OriginalRow227TriangleData0735.coefficient50_100, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_102, Icur := OriginalRow227TriangleData0722.coefficient49_101,
    output := OriginalRow227TriangleData0735.coefficient50_101, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_103, Icur := OriginalRow227TriangleData0722.coefficient49_102,
    output := OriginalRow227TriangleData0735.coefficient50_102, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_104, Icur := OriginalRow227TriangleData0722.coefficient49_103,
    output := OriginalRow227TriangleData0735.coefficient50_103, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_105, Icur := OriginalRow227TriangleData0722.coefficient49_104,
    output := OriginalRow227TriangleData0735.coefficient50_104, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_106, Icur := OriginalRow227TriangleData0722.coefficient49_105,
    output := OriginalRow227TriangleData0735.coefficient50_105, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_107, Icur := OriginalRow227TriangleData0722.coefficient49_106,
    output := OriginalRow227TriangleData0735.coefficient50_106, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_108, Icur := OriginalRow227TriangleData0722.coefficient49_107,
    output := OriginalRow227TriangleData0735.coefficient50_107, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_109, Icur := OriginalRow227TriangleData0722.coefficient49_108,
    output := OriginalRow227TriangleData0735.coefficient50_108, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_110, Icur := OriginalRow227TriangleData0722.coefficient49_109,
    output := OriginalRow227TriangleData0735.coefficient50_109, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_111, Icur := OriginalRow227TriangleData0722.coefficient49_110,
    output := OriginalRow227TriangleData0735.coefficient50_110, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_112, Icur := OriginalRow227TriangleData0722.coefficient49_111,
    output := OriginalRow227TriangleData0735.coefficient50_111, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_113, Icur := OriginalRow227TriangleData0723.coefficient49_112,
    output := OriginalRow227TriangleData0735.coefficient50_112, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0719

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0719.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
