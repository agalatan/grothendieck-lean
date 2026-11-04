import Grothe.UpperChaos.OriginalRow227TriangleData0224
import Grothe.UpperChaos.OriginalRow227TriangleData0225
import Grothe.UpperChaos.OriginalRow227TriangleData0239
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0223
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_79, Icur := OriginalRow227TriangleData0224.coefficient14_78,
    output := OriginalRow227TriangleData0239.coefficient15_78, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_80, Icur := OriginalRow227TriangleData0224.coefficient14_79,
    output := OriginalRow227TriangleData0239.coefficient15_79, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_81, Icur := OriginalRow227TriangleData0224.coefficient14_80,
    output := OriginalRow227TriangleData0239.coefficient15_80, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_82, Icur := OriginalRow227TriangleData0224.coefficient14_81,
    output := OriginalRow227TriangleData0239.coefficient15_81, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_83, Icur := OriginalRow227TriangleData0224.coefficient14_82,
    output := OriginalRow227TriangleData0239.coefficient15_82, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_84, Icur := OriginalRow227TriangleData0224.coefficient14_83,
    output := OriginalRow227TriangleData0239.coefficient15_83, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_85, Icur := OriginalRow227TriangleData0224.coefficient14_84,
    output := OriginalRow227TriangleData0239.coefficient15_84, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_86, Icur := OriginalRow227TriangleData0224.coefficient14_85,
    output := OriginalRow227TriangleData0239.coefficient15_85, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_87, Icur := OriginalRow227TriangleData0224.coefficient14_86,
    output := OriginalRow227TriangleData0239.coefficient15_86, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_88, Icur := OriginalRow227TriangleData0224.coefficient14_87,
    output := OriginalRow227TriangleData0239.coefficient15_87, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_89, Icur := OriginalRow227TriangleData0224.coefficient14_88,
    output := OriginalRow227TriangleData0239.coefficient15_88, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_90, Icur := OriginalRow227TriangleData0224.coefficient14_89,
    output := OriginalRow227TriangleData0239.coefficient15_89, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_91, Icur := OriginalRow227TriangleData0224.coefficient14_90,
    output := OriginalRow227TriangleData0239.coefficient15_90, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_92, Icur := OriginalRow227TriangleData0224.coefficient14_91,
    output := OriginalRow227TriangleData0239.coefficient15_91, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_93, Icur := OriginalRow227TriangleData0224.coefficient14_92,
    output := OriginalRow227TriangleData0239.coefficient15_92, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_94, Icur := OriginalRow227TriangleData0224.coefficient14_93,
    output := OriginalRow227TriangleData0239.coefficient15_93, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_95, Icur := OriginalRow227TriangleData0224.coefficient14_94,
    output := OriginalRow227TriangleData0239.coefficient15_94, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_96, Icur := OriginalRow227TriangleData0224.coefficient14_95,
    output := OriginalRow227TriangleData0239.coefficient15_95, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_97, Icur := OriginalRow227TriangleData0224.coefficient14_96,
    output := OriginalRow227TriangleData0239.coefficient15_96, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_98, Icur := OriginalRow227TriangleData0224.coefficient14_97,
    output := OriginalRow227TriangleData0239.coefficient15_97, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_99, Icur := OriginalRow227TriangleData0224.coefficient14_98,
    output := OriginalRow227TriangleData0239.coefficient15_98, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_100, Icur := OriginalRow227TriangleData0224.coefficient14_99,
    output := OriginalRow227TriangleData0239.coefficient15_99, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_101, Icur := OriginalRow227TriangleData0224.coefficient14_100,
    output := OriginalRow227TriangleData0239.coefficient15_100, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_102, Icur := OriginalRow227TriangleData0224.coefficient14_101,
    output := OriginalRow227TriangleData0239.coefficient15_101, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_103, Icur := OriginalRow227TriangleData0224.coefficient14_102,
    output := OriginalRow227TriangleData0239.coefficient15_102, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_104, Icur := OriginalRow227TriangleData0224.coefficient14_103,
    output := OriginalRow227TriangleData0239.coefficient15_103, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_105, Icur := OriginalRow227TriangleData0224.coefficient14_104,
    output := OriginalRow227TriangleData0239.coefficient15_104, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_106, Icur := OriginalRow227TriangleData0224.coefficient14_105,
    output := OriginalRow227TriangleData0239.coefficient15_105, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_107, Icur := OriginalRow227TriangleData0224.coefficient14_106,
    output := OriginalRow227TriangleData0239.coefficient15_106, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0224.coefficient14_108, Icur := OriginalRow227TriangleData0224.coefficient14_107,
    output := OriginalRow227TriangleData0239.coefficient15_107, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_109, Icur := OriginalRow227TriangleData0224.coefficient14_108,
    output := OriginalRow227TriangleData0239.coefficient15_108, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_110, Icur := OriginalRow227TriangleData0225.coefficient14_109,
    output := OriginalRow227TriangleData0239.coefficient15_109, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0223

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0223.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
