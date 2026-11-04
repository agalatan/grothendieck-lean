import Grothe.UpperChaos.OriginalRow227TriangleData0239
import Grothe.UpperChaos.OriginalRow227TriangleData0240
import Grothe.UpperChaos.OriginalRow227TriangleData0254
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0238
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_80, Icur := OriginalRow227TriangleData0239.coefficient15_79,
    output := OriginalRow227TriangleData0254.coefficient16_79, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_81, Icur := OriginalRow227TriangleData0239.coefficient15_80,
    output := OriginalRow227TriangleData0254.coefficient16_80, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_82, Icur := OriginalRow227TriangleData0239.coefficient15_81,
    output := OriginalRow227TriangleData0254.coefficient16_81, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_83, Icur := OriginalRow227TriangleData0239.coefficient15_82,
    output := OriginalRow227TriangleData0254.coefficient16_82, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_84, Icur := OriginalRow227TriangleData0239.coefficient15_83,
    output := OriginalRow227TriangleData0254.coefficient16_83, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_85, Icur := OriginalRow227TriangleData0239.coefficient15_84,
    output := OriginalRow227TriangleData0254.coefficient16_84, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_86, Icur := OriginalRow227TriangleData0239.coefficient15_85,
    output := OriginalRow227TriangleData0254.coefficient16_85, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_87, Icur := OriginalRow227TriangleData0239.coefficient15_86,
    output := OriginalRow227TriangleData0254.coefficient16_86, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_88, Icur := OriginalRow227TriangleData0239.coefficient15_87,
    output := OriginalRow227TriangleData0254.coefficient16_87, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_89, Icur := OriginalRow227TriangleData0239.coefficient15_88,
    output := OriginalRow227TriangleData0254.coefficient16_88, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_90, Icur := OriginalRow227TriangleData0239.coefficient15_89,
    output := OriginalRow227TriangleData0254.coefficient16_89, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_91, Icur := OriginalRow227TriangleData0239.coefficient15_90,
    output := OriginalRow227TriangleData0254.coefficient16_90, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_92, Icur := OriginalRow227TriangleData0239.coefficient15_91,
    output := OriginalRow227TriangleData0254.coefficient16_91, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_93, Icur := OriginalRow227TriangleData0239.coefficient15_92,
    output := OriginalRow227TriangleData0254.coefficient16_92, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_94, Icur := OriginalRow227TriangleData0239.coefficient15_93,
    output := OriginalRow227TriangleData0254.coefficient16_93, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_95, Icur := OriginalRow227TriangleData0239.coefficient15_94,
    output := OriginalRow227TriangleData0254.coefficient16_94, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_96, Icur := OriginalRow227TriangleData0239.coefficient15_95,
    output := OriginalRow227TriangleData0254.coefficient16_95, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_97, Icur := OriginalRow227TriangleData0239.coefficient15_96,
    output := OriginalRow227TriangleData0254.coefficient16_96, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_98, Icur := OriginalRow227TriangleData0239.coefficient15_97,
    output := OriginalRow227TriangleData0254.coefficient16_97, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_99, Icur := OriginalRow227TriangleData0239.coefficient15_98,
    output := OriginalRow227TriangleData0254.coefficient16_98, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_100, Icur := OriginalRow227TriangleData0239.coefficient15_99,
    output := OriginalRow227TriangleData0254.coefficient16_99, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_101, Icur := OriginalRow227TriangleData0239.coefficient15_100,
    output := OriginalRow227TriangleData0254.coefficient16_100, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_102, Icur := OriginalRow227TriangleData0239.coefficient15_101,
    output := OriginalRow227TriangleData0254.coefficient16_101, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_103, Icur := OriginalRow227TriangleData0239.coefficient15_102,
    output := OriginalRow227TriangleData0254.coefficient16_102, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_104, Icur := OriginalRow227TriangleData0239.coefficient15_103,
    output := OriginalRow227TriangleData0254.coefficient16_103, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_105, Icur := OriginalRow227TriangleData0239.coefficient15_104,
    output := OriginalRow227TriangleData0254.coefficient16_104, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_106, Icur := OriginalRow227TriangleData0239.coefficient15_105,
    output := OriginalRow227TriangleData0254.coefficient16_105, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_107, Icur := OriginalRow227TriangleData0239.coefficient15_106,
    output := OriginalRow227TriangleData0254.coefficient16_106, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_108, Icur := OriginalRow227TriangleData0239.coefficient15_107,
    output := OriginalRow227TriangleData0254.coefficient16_107, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_109, Icur := OriginalRow227TriangleData0239.coefficient15_108,
    output := OriginalRow227TriangleData0254.coefficient16_108, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0240.coefficient15_110, Icur := OriginalRow227TriangleData0239.coefficient15_109,
    output := OriginalRow227TriangleData0254.coefficient16_109, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0240.coefficient15_111, Icur := OriginalRow227TriangleData0240.coefficient15_110,
    output := OriginalRow227TriangleData0254.coefficient16_110, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0238

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0238.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
