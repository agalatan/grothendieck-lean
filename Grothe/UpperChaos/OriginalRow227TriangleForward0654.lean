import Grothe.UpperChaos.OriginalRow227TriangleData0657
import Grothe.UpperChaos.OriginalRow227TriangleData0658
import Grothe.UpperChaos.OriginalRow227TriangleData0670
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0654
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_77, Icur := OriginalRow227TriangleData0657.coefficient44_76,
    output := OriginalRow227TriangleData0670.coefficient45_76, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_78, Icur := OriginalRow227TriangleData0657.coefficient44_77,
    output := OriginalRow227TriangleData0670.coefficient45_77, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_79, Icur := OriginalRow227TriangleData0657.coefficient44_78,
    output := OriginalRow227TriangleData0670.coefficient45_78, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_80, Icur := OriginalRow227TriangleData0657.coefficient44_79,
    output := OriginalRow227TriangleData0670.coefficient45_79, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_81, Icur := OriginalRow227TriangleData0657.coefficient44_80,
    output := OriginalRow227TriangleData0670.coefficient45_80, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_82, Icur := OriginalRow227TriangleData0657.coefficient44_81,
    output := OriginalRow227TriangleData0670.coefficient45_81, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_83, Icur := OriginalRow227TriangleData0657.coefficient44_82,
    output := OriginalRow227TriangleData0670.coefficient45_82, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_84, Icur := OriginalRow227TriangleData0657.coefficient44_83,
    output := OriginalRow227TriangleData0670.coefficient45_83, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_85, Icur := OriginalRow227TriangleData0657.coefficient44_84,
    output := OriginalRow227TriangleData0670.coefficient45_84, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_86, Icur := OriginalRow227TriangleData0657.coefficient44_85,
    output := OriginalRow227TriangleData0670.coefficient45_85, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_87, Icur := OriginalRow227TriangleData0657.coefficient44_86,
    output := OriginalRow227TriangleData0670.coefficient45_86, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_88, Icur := OriginalRow227TriangleData0657.coefficient44_87,
    output := OriginalRow227TriangleData0670.coefficient45_87, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_89, Icur := OriginalRow227TriangleData0657.coefficient44_88,
    output := OriginalRow227TriangleData0670.coefficient45_88, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_90, Icur := OriginalRow227TriangleData0657.coefficient44_89,
    output := OriginalRow227TriangleData0670.coefficient45_89, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_91, Icur := OriginalRow227TriangleData0657.coefficient44_90,
    output := OriginalRow227TriangleData0670.coefficient45_90, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_92, Icur := OriginalRow227TriangleData0657.coefficient44_91,
    output := OriginalRow227TriangleData0670.coefficient45_91, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_93, Icur := OriginalRow227TriangleData0657.coefficient44_92,
    output := OriginalRow227TriangleData0670.coefficient45_92, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_94, Icur := OriginalRow227TriangleData0657.coefficient44_93,
    output := OriginalRow227TriangleData0670.coefficient45_93, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_95, Icur := OriginalRow227TriangleData0657.coefficient44_94,
    output := OriginalRow227TriangleData0670.coefficient45_94, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_96, Icur := OriginalRow227TriangleData0657.coefficient44_95,
    output := OriginalRow227TriangleData0670.coefficient45_95, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_97, Icur := OriginalRow227TriangleData0657.coefficient44_96,
    output := OriginalRow227TriangleData0670.coefficient45_96, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_98, Icur := OriginalRow227TriangleData0657.coefficient44_97,
    output := OriginalRow227TriangleData0670.coefficient45_97, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_99, Icur := OriginalRow227TriangleData0657.coefficient44_98,
    output := OriginalRow227TriangleData0670.coefficient45_98, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_100, Icur := OriginalRow227TriangleData0657.coefficient44_99,
    output := OriginalRow227TriangleData0670.coefficient45_99, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_101, Icur := OriginalRow227TriangleData0657.coefficient44_100,
    output := OriginalRow227TriangleData0670.coefficient45_100, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_102, Icur := OriginalRow227TriangleData0657.coefficient44_101,
    output := OriginalRow227TriangleData0670.coefficient45_101, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_103, Icur := OriginalRow227TriangleData0657.coefficient44_102,
    output := OriginalRow227TriangleData0670.coefficient45_102, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_104, Icur := OriginalRow227TriangleData0657.coefficient44_103,
    output := OriginalRow227TriangleData0670.coefficient45_103, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_105, Icur := OriginalRow227TriangleData0657.coefficient44_104,
    output := OriginalRow227TriangleData0670.coefficient45_104, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0657.coefficient44_106, Icur := OriginalRow227TriangleData0657.coefficient44_105,
    output := OriginalRow227TriangleData0670.coefficient45_105, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0658.coefficient44_107, Icur := OriginalRow227TriangleData0657.coefficient44_106,
    output := OriginalRow227TriangleData0670.coefficient45_106, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0658.coefficient44_108, Icur := OriginalRow227TriangleData0658.coefficient44_107,
    output := OriginalRow227TriangleData0670.coefficient45_107, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0654

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0654.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
