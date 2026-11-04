import Grothe.UpperChaos.OriginalRow227TriangleData0404
import Grothe.UpperChaos.OriginalRow227TriangleData0405
import Grothe.UpperChaos.OriginalRow227TriangleData0419
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0403
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_91, Icur := OriginalRow227TriangleData0404.coefficient26_90,
    output := OriginalRow227TriangleData0419.coefficient27_90, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_92, Icur := OriginalRow227TriangleData0404.coefficient26_91,
    output := OriginalRow227TriangleData0419.coefficient27_91, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_93, Icur := OriginalRow227TriangleData0404.coefficient26_92,
    output := OriginalRow227TriangleData0419.coefficient27_92, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_94, Icur := OriginalRow227TriangleData0404.coefficient26_93,
    output := OriginalRow227TriangleData0419.coefficient27_93, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_95, Icur := OriginalRow227TriangleData0404.coefficient26_94,
    output := OriginalRow227TriangleData0419.coefficient27_94, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_96, Icur := OriginalRow227TriangleData0404.coefficient26_95,
    output := OriginalRow227TriangleData0419.coefficient27_95, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_97, Icur := OriginalRow227TriangleData0404.coefficient26_96,
    output := OriginalRow227TriangleData0419.coefficient27_96, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_98, Icur := OriginalRow227TriangleData0404.coefficient26_97,
    output := OriginalRow227TriangleData0419.coefficient27_97, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_99, Icur := OriginalRow227TriangleData0404.coefficient26_98,
    output := OriginalRow227TriangleData0419.coefficient27_98, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_100, Icur := OriginalRow227TriangleData0404.coefficient26_99,
    output := OriginalRow227TriangleData0419.coefficient27_99, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_101, Icur := OriginalRow227TriangleData0404.coefficient26_100,
    output := OriginalRow227TriangleData0419.coefficient27_100, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_102, Icur := OriginalRow227TriangleData0404.coefficient26_101,
    output := OriginalRow227TriangleData0419.coefficient27_101, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_103, Icur := OriginalRow227TriangleData0404.coefficient26_102,
    output := OriginalRow227TriangleData0419.coefficient27_102, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_104, Icur := OriginalRow227TriangleData0404.coefficient26_103,
    output := OriginalRow227TriangleData0419.coefficient27_103, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_105, Icur := OriginalRow227TriangleData0404.coefficient26_104,
    output := OriginalRow227TriangleData0419.coefficient27_104, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_106, Icur := OriginalRow227TriangleData0404.coefficient26_105,
    output := OriginalRow227TriangleData0419.coefficient27_105, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_107, Icur := OriginalRow227TriangleData0404.coefficient26_106,
    output := OriginalRow227TriangleData0419.coefficient27_106, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_108, Icur := OriginalRow227TriangleData0404.coefficient26_107,
    output := OriginalRow227TriangleData0419.coefficient27_107, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_109, Icur := OriginalRow227TriangleData0404.coefficient26_108,
    output := OriginalRow227TriangleData0419.coefficient27_108, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_110, Icur := OriginalRow227TriangleData0404.coefficient26_109,
    output := OriginalRow227TriangleData0419.coefficient27_109, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_111, Icur := OriginalRow227TriangleData0404.coefficient26_110,
    output := OriginalRow227TriangleData0419.coefficient27_110, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_112, Icur := OriginalRow227TriangleData0404.coefficient26_111,
    output := OriginalRow227TriangleData0419.coefficient27_111, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_113, Icur := OriginalRow227TriangleData0404.coefficient26_112,
    output := OriginalRow227TriangleData0419.coefficient27_112, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_114, Icur := OriginalRow227TriangleData0404.coefficient26_113,
    output := OriginalRow227TriangleData0419.coefficient27_113, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_115, Icur := OriginalRow227TriangleData0404.coefficient26_114,
    output := OriginalRow227TriangleData0419.coefficient27_114, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_116, Icur := OriginalRow227TriangleData0404.coefficient26_115,
    output := OriginalRow227TriangleData0419.coefficient27_115, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_117, Icur := OriginalRow227TriangleData0404.coefficient26_116,
    output := OriginalRow227TriangleData0419.coefficient27_116, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_118, Icur := OriginalRow227TriangleData0404.coefficient26_117,
    output := OriginalRow227TriangleData0419.coefficient27_117, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_119, Icur := OriginalRow227TriangleData0404.coefficient26_118,
    output := OriginalRow227TriangleData0419.coefficient27_118, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_120, Icur := OriginalRow227TriangleData0404.coefficient26_119,
    output := OriginalRow227TriangleData0419.coefficient27_119, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0405.coefficient26_121, Icur := OriginalRow227TriangleData0404.coefficient26_120,
    output := OriginalRow227TriangleData0419.coefficient27_120, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0405.coefficient26_122, Icur := OriginalRow227TriangleData0405.coefficient26_121,
    output := OriginalRow227TriangleData0419.coefficient27_121, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0403

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0403.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
