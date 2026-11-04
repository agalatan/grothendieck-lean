import Grothe.UpperChaos.OriginalRow227TriangleData0761
import Grothe.UpperChaos.OriginalRow227TriangleData0762
import Grothe.UpperChaos.OriginalRow227TriangleData0774
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0758
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_85, Icur := OriginalRow227TriangleData0761.coefficient52_84,
    output := OriginalRow227TriangleData0774.coefficient53_84, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_86, Icur := OriginalRow227TriangleData0761.coefficient52_85,
    output := OriginalRow227TriangleData0774.coefficient53_85, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_87, Icur := OriginalRow227TriangleData0761.coefficient52_86,
    output := OriginalRow227TriangleData0774.coefficient53_86, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_88, Icur := OriginalRow227TriangleData0761.coefficient52_87,
    output := OriginalRow227TriangleData0774.coefficient53_87, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_89, Icur := OriginalRow227TriangleData0761.coefficient52_88,
    output := OriginalRow227TriangleData0774.coefficient53_88, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_90, Icur := OriginalRow227TriangleData0761.coefficient52_89,
    output := OriginalRow227TriangleData0774.coefficient53_89, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_91, Icur := OriginalRow227TriangleData0761.coefficient52_90,
    output := OriginalRow227TriangleData0774.coefficient53_90, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_92, Icur := OriginalRow227TriangleData0761.coefficient52_91,
    output := OriginalRow227TriangleData0774.coefficient53_91, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_93, Icur := OriginalRow227TriangleData0761.coefficient52_92,
    output := OriginalRow227TriangleData0774.coefficient53_92, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_94, Icur := OriginalRow227TriangleData0761.coefficient52_93,
    output := OriginalRow227TriangleData0774.coefficient53_93, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_95, Icur := OriginalRow227TriangleData0761.coefficient52_94,
    output := OriginalRow227TriangleData0774.coefficient53_94, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_96, Icur := OriginalRow227TriangleData0761.coefficient52_95,
    output := OriginalRow227TriangleData0774.coefficient53_95, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_97, Icur := OriginalRow227TriangleData0761.coefficient52_96,
    output := OriginalRow227TriangleData0774.coefficient53_96, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_98, Icur := OriginalRow227TriangleData0761.coefficient52_97,
    output := OriginalRow227TriangleData0774.coefficient53_97, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_99, Icur := OriginalRow227TriangleData0761.coefficient52_98,
    output := OriginalRow227TriangleData0774.coefficient53_98, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_100, Icur := OriginalRow227TriangleData0761.coefficient52_99,
    output := OriginalRow227TriangleData0774.coefficient53_99, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_101, Icur := OriginalRow227TriangleData0761.coefficient52_100,
    output := OriginalRow227TriangleData0774.coefficient53_100, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_102, Icur := OriginalRow227TriangleData0761.coefficient52_101,
    output := OriginalRow227TriangleData0774.coefficient53_101, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_103, Icur := OriginalRow227TriangleData0761.coefficient52_102,
    output := OriginalRow227TriangleData0774.coefficient53_102, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_104, Icur := OriginalRow227TriangleData0761.coefficient52_103,
    output := OriginalRow227TriangleData0774.coefficient53_103, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_105, Icur := OriginalRow227TriangleData0761.coefficient52_104,
    output := OriginalRow227TriangleData0774.coefficient53_104, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_106, Icur := OriginalRow227TriangleData0761.coefficient52_105,
    output := OriginalRow227TriangleData0774.coefficient53_105, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_107, Icur := OriginalRow227TriangleData0761.coefficient52_106,
    output := OriginalRow227TriangleData0774.coefficient53_106, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_108, Icur := OriginalRow227TriangleData0761.coefficient52_107,
    output := OriginalRow227TriangleData0774.coefficient53_107, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_109, Icur := OriginalRow227TriangleData0761.coefficient52_108,
    output := OriginalRow227TriangleData0774.coefficient53_108, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_110, Icur := OriginalRow227TriangleData0761.coefficient52_109,
    output := OriginalRow227TriangleData0774.coefficient53_109, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_111, Icur := OriginalRow227TriangleData0761.coefficient52_110,
    output := OriginalRow227TriangleData0774.coefficient53_110, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_112, Icur := OriginalRow227TriangleData0761.coefficient52_111,
    output := OriginalRow227TriangleData0774.coefficient53_111, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_113, Icur := OriginalRow227TriangleData0761.coefficient52_112,
    output := OriginalRow227TriangleData0774.coefficient53_112, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0761.coefficient52_114, Icur := OriginalRow227TriangleData0761.coefficient52_113,
    output := OriginalRow227TriangleData0774.coefficient53_113, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0762.coefficient52_115, Icur := OriginalRow227TriangleData0761.coefficient52_114,
    output := OriginalRow227TriangleData0774.coefficient53_114, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0762.coefficient52_116, Icur := OriginalRow227TriangleData0762.coefficient52_115,
    output := OriginalRow227TriangleData0774.coefficient53_115, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0758

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0758.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
