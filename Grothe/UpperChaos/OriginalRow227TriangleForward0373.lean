import Grothe.UpperChaos.OriginalRow227TriangleData0374
import Grothe.UpperChaos.OriginalRow227TriangleData0375
import Grothe.UpperChaos.OriginalRow227TriangleData0389
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0373
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_89, Icur := OriginalRow227TriangleData0374.coefficient24_88,
    output := OriginalRow227TriangleData0389.coefficient25_88, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_90, Icur := OriginalRow227TriangleData0374.coefficient24_89,
    output := OriginalRow227TriangleData0389.coefficient25_89, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_91, Icur := OriginalRow227TriangleData0374.coefficient24_90,
    output := OriginalRow227TriangleData0389.coefficient25_90, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_92, Icur := OriginalRow227TriangleData0374.coefficient24_91,
    output := OriginalRow227TriangleData0389.coefficient25_91, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_93, Icur := OriginalRow227TriangleData0374.coefficient24_92,
    output := OriginalRow227TriangleData0389.coefficient25_92, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_94, Icur := OriginalRow227TriangleData0374.coefficient24_93,
    output := OriginalRow227TriangleData0389.coefficient25_93, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_95, Icur := OriginalRow227TriangleData0374.coefficient24_94,
    output := OriginalRow227TriangleData0389.coefficient25_94, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_96, Icur := OriginalRow227TriangleData0374.coefficient24_95,
    output := OriginalRow227TriangleData0389.coefficient25_95, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_97, Icur := OriginalRow227TriangleData0374.coefficient24_96,
    output := OriginalRow227TriangleData0389.coefficient25_96, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_98, Icur := OriginalRow227TriangleData0374.coefficient24_97,
    output := OriginalRow227TriangleData0389.coefficient25_97, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_99, Icur := OriginalRow227TriangleData0374.coefficient24_98,
    output := OriginalRow227TriangleData0389.coefficient25_98, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_100, Icur := OriginalRow227TriangleData0374.coefficient24_99,
    output := OriginalRow227TriangleData0389.coefficient25_99, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_101, Icur := OriginalRow227TriangleData0374.coefficient24_100,
    output := OriginalRow227TriangleData0389.coefficient25_100, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_102, Icur := OriginalRow227TriangleData0374.coefficient24_101,
    output := OriginalRow227TriangleData0389.coefficient25_101, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_103, Icur := OriginalRow227TriangleData0374.coefficient24_102,
    output := OriginalRow227TriangleData0389.coefficient25_102, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_104, Icur := OriginalRow227TriangleData0374.coefficient24_103,
    output := OriginalRow227TriangleData0389.coefficient25_103, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_105, Icur := OriginalRow227TriangleData0374.coefficient24_104,
    output := OriginalRow227TriangleData0389.coefficient25_104, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_106, Icur := OriginalRow227TriangleData0374.coefficient24_105,
    output := OriginalRow227TriangleData0389.coefficient25_105, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_107, Icur := OriginalRow227TriangleData0374.coefficient24_106,
    output := OriginalRow227TriangleData0389.coefficient25_106, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_108, Icur := OriginalRow227TriangleData0374.coefficient24_107,
    output := OriginalRow227TriangleData0389.coefficient25_107, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_109, Icur := OriginalRow227TriangleData0374.coefficient24_108,
    output := OriginalRow227TriangleData0389.coefficient25_108, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_110, Icur := OriginalRow227TriangleData0374.coefficient24_109,
    output := OriginalRow227TriangleData0389.coefficient25_109, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_111, Icur := OriginalRow227TriangleData0374.coefficient24_110,
    output := OriginalRow227TriangleData0389.coefficient25_110, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_112, Icur := OriginalRow227TriangleData0374.coefficient24_111,
    output := OriginalRow227TriangleData0389.coefficient25_111, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_113, Icur := OriginalRow227TriangleData0374.coefficient24_112,
    output := OriginalRow227TriangleData0389.coefficient25_112, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_114, Icur := OriginalRow227TriangleData0374.coefficient24_113,
    output := OriginalRow227TriangleData0389.coefficient25_113, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_115, Icur := OriginalRow227TriangleData0374.coefficient24_114,
    output := OriginalRow227TriangleData0389.coefficient25_114, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_116, Icur := OriginalRow227TriangleData0374.coefficient24_115,
    output := OriginalRow227TriangleData0389.coefficient25_115, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_117, Icur := OriginalRow227TriangleData0374.coefficient24_116,
    output := OriginalRow227TriangleData0389.coefficient25_116, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0374.coefficient24_118, Icur := OriginalRow227TriangleData0374.coefficient24_117,
    output := OriginalRow227TriangleData0389.coefficient25_117, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_119, Icur := OriginalRow227TriangleData0374.coefficient24_118,
    output := OriginalRow227TriangleData0389.coefficient25_118, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_120, Icur := OriginalRow227TriangleData0375.coefficient24_119,
    output := OriginalRow227TriangleData0389.coefficient25_119, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0373

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0373.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
