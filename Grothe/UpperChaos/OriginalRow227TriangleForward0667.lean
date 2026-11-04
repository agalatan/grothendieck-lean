import Grothe.UpperChaos.OriginalRow227TriangleData0670
import Grothe.UpperChaos.OriginalRow227TriangleData0671
import Grothe.UpperChaos.OriginalRow227TriangleData0683
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0667
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_78, Icur := OriginalRow227TriangleData0670.coefficient45_77,
    output := OriginalRow227TriangleData0683.coefficient46_77, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_79, Icur := OriginalRow227TriangleData0670.coefficient45_78,
    output := OriginalRow227TriangleData0683.coefficient46_78, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_80, Icur := OriginalRow227TriangleData0670.coefficient45_79,
    output := OriginalRow227TriangleData0683.coefficient46_79, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_81, Icur := OriginalRow227TriangleData0670.coefficient45_80,
    output := OriginalRow227TriangleData0683.coefficient46_80, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_82, Icur := OriginalRow227TriangleData0670.coefficient45_81,
    output := OriginalRow227TriangleData0683.coefficient46_81, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_83, Icur := OriginalRow227TriangleData0670.coefficient45_82,
    output := OriginalRow227TriangleData0683.coefficient46_82, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_84, Icur := OriginalRow227TriangleData0670.coefficient45_83,
    output := OriginalRow227TriangleData0683.coefficient46_83, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_85, Icur := OriginalRow227TriangleData0670.coefficient45_84,
    output := OriginalRow227TriangleData0683.coefficient46_84, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_86, Icur := OriginalRow227TriangleData0670.coefficient45_85,
    output := OriginalRow227TriangleData0683.coefficient46_85, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_87, Icur := OriginalRow227TriangleData0670.coefficient45_86,
    output := OriginalRow227TriangleData0683.coefficient46_86, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_88, Icur := OriginalRow227TriangleData0670.coefficient45_87,
    output := OriginalRow227TriangleData0683.coefficient46_87, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_89, Icur := OriginalRow227TriangleData0670.coefficient45_88,
    output := OriginalRow227TriangleData0683.coefficient46_88, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_90, Icur := OriginalRow227TriangleData0670.coefficient45_89,
    output := OriginalRow227TriangleData0683.coefficient46_89, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_91, Icur := OriginalRow227TriangleData0670.coefficient45_90,
    output := OriginalRow227TriangleData0683.coefficient46_90, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_92, Icur := OriginalRow227TriangleData0670.coefficient45_91,
    output := OriginalRow227TriangleData0683.coefficient46_91, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_93, Icur := OriginalRow227TriangleData0670.coefficient45_92,
    output := OriginalRow227TriangleData0683.coefficient46_92, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_94, Icur := OriginalRow227TriangleData0670.coefficient45_93,
    output := OriginalRow227TriangleData0683.coefficient46_93, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_95, Icur := OriginalRow227TriangleData0670.coefficient45_94,
    output := OriginalRow227TriangleData0683.coefficient46_94, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_96, Icur := OriginalRow227TriangleData0670.coefficient45_95,
    output := OriginalRow227TriangleData0683.coefficient46_95, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_97, Icur := OriginalRow227TriangleData0670.coefficient45_96,
    output := OriginalRow227TriangleData0683.coefficient46_96, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_98, Icur := OriginalRow227TriangleData0670.coefficient45_97,
    output := OriginalRow227TriangleData0683.coefficient46_97, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_99, Icur := OriginalRow227TriangleData0670.coefficient45_98,
    output := OriginalRow227TriangleData0683.coefficient46_98, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_100, Icur := OriginalRow227TriangleData0670.coefficient45_99,
    output := OriginalRow227TriangleData0683.coefficient46_99, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_101, Icur := OriginalRow227TriangleData0670.coefficient45_100,
    output := OriginalRow227TriangleData0683.coefficient46_100, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_102, Icur := OriginalRow227TriangleData0670.coefficient45_101,
    output := OriginalRow227TriangleData0683.coefficient46_101, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_103, Icur := OriginalRow227TriangleData0670.coefficient45_102,
    output := OriginalRow227TriangleData0683.coefficient46_102, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_104, Icur := OriginalRow227TriangleData0670.coefficient45_103,
    output := OriginalRow227TriangleData0683.coefficient46_103, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_105, Icur := OriginalRow227TriangleData0670.coefficient45_104,
    output := OriginalRow227TriangleData0683.coefficient46_104, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_106, Icur := OriginalRow227TriangleData0670.coefficient45_105,
    output := OriginalRow227TriangleData0683.coefficient46_105, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_107, Icur := OriginalRow227TriangleData0670.coefficient45_106,
    output := OriginalRow227TriangleData0683.coefficient46_106, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_108, Icur := OriginalRow227TriangleData0670.coefficient45_107,
    output := OriginalRow227TriangleData0683.coefficient46_107, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_109, Icur := OriginalRow227TriangleData0671.coefficient45_108,
    output := OriginalRow227TriangleData0683.coefficient46_108, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0667

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0667.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
