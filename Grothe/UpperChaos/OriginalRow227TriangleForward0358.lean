import Grothe.UpperChaos.OriginalRow227TriangleData0359
import Grothe.UpperChaos.OriginalRow227TriangleData0360
import Grothe.UpperChaos.OriginalRow227TriangleData0374
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0358
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_88, Icur := OriginalRow227TriangleData0359.coefficient23_87,
    output := OriginalRow227TriangleData0374.coefficient24_87, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_89, Icur := OriginalRow227TriangleData0359.coefficient23_88,
    output := OriginalRow227TriangleData0374.coefficient24_88, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_90, Icur := OriginalRow227TriangleData0359.coefficient23_89,
    output := OriginalRow227TriangleData0374.coefficient24_89, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_91, Icur := OriginalRow227TriangleData0359.coefficient23_90,
    output := OriginalRow227TriangleData0374.coefficient24_90, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_92, Icur := OriginalRow227TriangleData0359.coefficient23_91,
    output := OriginalRow227TriangleData0374.coefficient24_91, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_93, Icur := OriginalRow227TriangleData0359.coefficient23_92,
    output := OriginalRow227TriangleData0374.coefficient24_92, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_94, Icur := OriginalRow227TriangleData0359.coefficient23_93,
    output := OriginalRow227TriangleData0374.coefficient24_93, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_95, Icur := OriginalRow227TriangleData0359.coefficient23_94,
    output := OriginalRow227TriangleData0374.coefficient24_94, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_96, Icur := OriginalRow227TriangleData0359.coefficient23_95,
    output := OriginalRow227TriangleData0374.coefficient24_95, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_97, Icur := OriginalRow227TriangleData0359.coefficient23_96,
    output := OriginalRow227TriangleData0374.coefficient24_96, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_98, Icur := OriginalRow227TriangleData0359.coefficient23_97,
    output := OriginalRow227TriangleData0374.coefficient24_97, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_99, Icur := OriginalRow227TriangleData0359.coefficient23_98,
    output := OriginalRow227TriangleData0374.coefficient24_98, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_100, Icur := OriginalRow227TriangleData0359.coefficient23_99,
    output := OriginalRow227TriangleData0374.coefficient24_99, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_101, Icur := OriginalRow227TriangleData0359.coefficient23_100,
    output := OriginalRow227TriangleData0374.coefficient24_100, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_102, Icur := OriginalRow227TriangleData0359.coefficient23_101,
    output := OriginalRow227TriangleData0374.coefficient24_101, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_103, Icur := OriginalRow227TriangleData0359.coefficient23_102,
    output := OriginalRow227TriangleData0374.coefficient24_102, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_104, Icur := OriginalRow227TriangleData0359.coefficient23_103,
    output := OriginalRow227TriangleData0374.coefficient24_103, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_105, Icur := OriginalRow227TriangleData0359.coefficient23_104,
    output := OriginalRow227TriangleData0374.coefficient24_104, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_106, Icur := OriginalRow227TriangleData0359.coefficient23_105,
    output := OriginalRow227TriangleData0374.coefficient24_105, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_107, Icur := OriginalRow227TriangleData0359.coefficient23_106,
    output := OriginalRow227TriangleData0374.coefficient24_106, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_108, Icur := OriginalRow227TriangleData0359.coefficient23_107,
    output := OriginalRow227TriangleData0374.coefficient24_107, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_109, Icur := OriginalRow227TriangleData0359.coefficient23_108,
    output := OriginalRow227TriangleData0374.coefficient24_108, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_110, Icur := OriginalRow227TriangleData0359.coefficient23_109,
    output := OriginalRow227TriangleData0374.coefficient24_109, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_111, Icur := OriginalRow227TriangleData0359.coefficient23_110,
    output := OriginalRow227TriangleData0374.coefficient24_110, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_112, Icur := OriginalRow227TriangleData0359.coefficient23_111,
    output := OriginalRow227TriangleData0374.coefficient24_111, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_113, Icur := OriginalRow227TriangleData0359.coefficient23_112,
    output := OriginalRow227TriangleData0374.coefficient24_112, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_114, Icur := OriginalRow227TriangleData0359.coefficient23_113,
    output := OriginalRow227TriangleData0374.coefficient24_113, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_115, Icur := OriginalRow227TriangleData0359.coefficient23_114,
    output := OriginalRow227TriangleData0374.coefficient24_114, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_116, Icur := OriginalRow227TriangleData0359.coefficient23_115,
    output := OriginalRow227TriangleData0374.coefficient24_115, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0359.coefficient23_117, Icur := OriginalRow227TriangleData0359.coefficient23_116,
    output := OriginalRow227TriangleData0374.coefficient24_116, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_118, Icur := OriginalRow227TriangleData0359.coefficient23_117,
    output := OriginalRow227TriangleData0374.coefficient24_117, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_119, Icur := OriginalRow227TriangleData0360.coefficient23_118,
    output := OriginalRow227TriangleData0374.coefficient24_118, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0358

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0358.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
