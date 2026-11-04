import Grothe.UpperChaos.OriginalRow227TriangleData0178
import Grothe.UpperChaos.OriginalRow227TriangleData0179
import Grothe.UpperChaos.OriginalRow227TriangleData0194
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0178
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_76, Icur := OriginalRow227TriangleData0178.coefficient11_75,
    output := OriginalRow227TriangleData0194.coefficient12_75, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_77, Icur := OriginalRow227TriangleData0178.coefficient11_76,
    output := OriginalRow227TriangleData0194.coefficient12_76, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_78, Icur := OriginalRow227TriangleData0178.coefficient11_77,
    output := OriginalRow227TriangleData0194.coefficient12_77, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_79, Icur := OriginalRow227TriangleData0178.coefficient11_78,
    output := OriginalRow227TriangleData0194.coefficient12_78, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_80, Icur := OriginalRow227TriangleData0178.coefficient11_79,
    output := OriginalRow227TriangleData0194.coefficient12_79, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_81, Icur := OriginalRow227TriangleData0178.coefficient11_80,
    output := OriginalRow227TriangleData0194.coefficient12_80, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_82, Icur := OriginalRow227TriangleData0178.coefficient11_81,
    output := OriginalRow227TriangleData0194.coefficient12_81, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_83, Icur := OriginalRow227TriangleData0178.coefficient11_82,
    output := OriginalRow227TriangleData0194.coefficient12_82, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_84, Icur := OriginalRow227TriangleData0178.coefficient11_83,
    output := OriginalRow227TriangleData0194.coefficient12_83, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_85, Icur := OriginalRow227TriangleData0178.coefficient11_84,
    output := OriginalRow227TriangleData0194.coefficient12_84, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_86, Icur := OriginalRow227TriangleData0178.coefficient11_85,
    output := OriginalRow227TriangleData0194.coefficient12_85, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_87, Icur := OriginalRow227TriangleData0178.coefficient11_86,
    output := OriginalRow227TriangleData0194.coefficient12_86, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_88, Icur := OriginalRow227TriangleData0178.coefficient11_87,
    output := OriginalRow227TriangleData0194.coefficient12_87, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_89, Icur := OriginalRow227TriangleData0178.coefficient11_88,
    output := OriginalRow227TriangleData0194.coefficient12_88, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_90, Icur := OriginalRow227TriangleData0178.coefficient11_89,
    output := OriginalRow227TriangleData0194.coefficient12_89, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_91, Icur := OriginalRow227TriangleData0178.coefficient11_90,
    output := OriginalRow227TriangleData0194.coefficient12_90, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_92, Icur := OriginalRow227TriangleData0178.coefficient11_91,
    output := OriginalRow227TriangleData0194.coefficient12_91, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_93, Icur := OriginalRow227TriangleData0178.coefficient11_92,
    output := OriginalRow227TriangleData0194.coefficient12_92, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_94, Icur := OriginalRow227TriangleData0178.coefficient11_93,
    output := OriginalRow227TriangleData0194.coefficient12_93, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_95, Icur := OriginalRow227TriangleData0178.coefficient11_94,
    output := OriginalRow227TriangleData0194.coefficient12_94, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_96, Icur := OriginalRow227TriangleData0178.coefficient11_95,
    output := OriginalRow227TriangleData0194.coefficient12_95, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_97, Icur := OriginalRow227TriangleData0178.coefficient11_96,
    output := OriginalRow227TriangleData0194.coefficient12_96, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_98, Icur := OriginalRow227TriangleData0178.coefficient11_97,
    output := OriginalRow227TriangleData0194.coefficient12_97, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_99, Icur := OriginalRow227TriangleData0178.coefficient11_98,
    output := OriginalRow227TriangleData0194.coefficient12_98, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_100, Icur := OriginalRow227TriangleData0178.coefficient11_99,
    output := OriginalRow227TriangleData0194.coefficient12_99, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_101, Icur := OriginalRow227TriangleData0178.coefficient11_100,
    output := OriginalRow227TriangleData0194.coefficient12_100, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_102, Icur := OriginalRow227TriangleData0178.coefficient11_101,
    output := OriginalRow227TriangleData0194.coefficient12_101, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_103, Icur := OriginalRow227TriangleData0178.coefficient11_102,
    output := OriginalRow227TriangleData0194.coefficient12_102, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_104, Icur := OriginalRow227TriangleData0178.coefficient11_103,
    output := OriginalRow227TriangleData0194.coefficient12_103, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0178.coefficient11_105, Icur := OriginalRow227TriangleData0178.coefficient11_104,
    output := OriginalRow227TriangleData0194.coefficient12_104, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0179.coefficient11_106, Icur := OriginalRow227TriangleData0178.coefficient11_105,
    output := OriginalRow227TriangleData0194.coefficient12_105, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0179.coefficient11_107, Icur := OriginalRow227TriangleData0179.coefficient11_106,
    output := OriginalRow227TriangleData0194.coefficient12_106, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0178

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0178.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
