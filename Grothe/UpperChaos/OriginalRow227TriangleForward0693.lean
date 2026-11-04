import Grothe.UpperChaos.OriginalRow227TriangleData0696
import Grothe.UpperChaos.OriginalRow227TriangleData0697
import Grothe.UpperChaos.OriginalRow227TriangleData0709
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0693
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_80, Icur := OriginalRow227TriangleData0696.coefficient47_79,
    output := OriginalRow227TriangleData0709.coefficient48_79, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_81, Icur := OriginalRow227TriangleData0696.coefficient47_80,
    output := OriginalRow227TriangleData0709.coefficient48_80, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_82, Icur := OriginalRow227TriangleData0696.coefficient47_81,
    output := OriginalRow227TriangleData0709.coefficient48_81, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_83, Icur := OriginalRow227TriangleData0696.coefficient47_82,
    output := OriginalRow227TriangleData0709.coefficient48_82, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_84, Icur := OriginalRow227TriangleData0696.coefficient47_83,
    output := OriginalRow227TriangleData0709.coefficient48_83, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_85, Icur := OriginalRow227TriangleData0696.coefficient47_84,
    output := OriginalRow227TriangleData0709.coefficient48_84, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_86, Icur := OriginalRow227TriangleData0696.coefficient47_85,
    output := OriginalRow227TriangleData0709.coefficient48_85, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_87, Icur := OriginalRow227TriangleData0696.coefficient47_86,
    output := OriginalRow227TriangleData0709.coefficient48_86, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_88, Icur := OriginalRow227TriangleData0696.coefficient47_87,
    output := OriginalRow227TriangleData0709.coefficient48_87, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_89, Icur := OriginalRow227TriangleData0696.coefficient47_88,
    output := OriginalRow227TriangleData0709.coefficient48_88, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_90, Icur := OriginalRow227TriangleData0696.coefficient47_89,
    output := OriginalRow227TriangleData0709.coefficient48_89, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_91, Icur := OriginalRow227TriangleData0696.coefficient47_90,
    output := OriginalRow227TriangleData0709.coefficient48_90, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_92, Icur := OriginalRow227TriangleData0696.coefficient47_91,
    output := OriginalRow227TriangleData0709.coefficient48_91, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_93, Icur := OriginalRow227TriangleData0696.coefficient47_92,
    output := OriginalRow227TriangleData0709.coefficient48_92, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_94, Icur := OriginalRow227TriangleData0696.coefficient47_93,
    output := OriginalRow227TriangleData0709.coefficient48_93, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_95, Icur := OriginalRow227TriangleData0696.coefficient47_94,
    output := OriginalRow227TriangleData0709.coefficient48_94, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_96, Icur := OriginalRow227TriangleData0696.coefficient47_95,
    output := OriginalRow227TriangleData0709.coefficient48_95, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_97, Icur := OriginalRow227TriangleData0696.coefficient47_96,
    output := OriginalRow227TriangleData0709.coefficient48_96, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_98, Icur := OriginalRow227TriangleData0696.coefficient47_97,
    output := OriginalRow227TriangleData0709.coefficient48_97, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_99, Icur := OriginalRow227TriangleData0696.coefficient47_98,
    output := OriginalRow227TriangleData0709.coefficient48_98, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_100, Icur := OriginalRow227TriangleData0696.coefficient47_99,
    output := OriginalRow227TriangleData0709.coefficient48_99, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_101, Icur := OriginalRow227TriangleData0696.coefficient47_100,
    output := OriginalRow227TriangleData0709.coefficient48_100, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_102, Icur := OriginalRow227TriangleData0696.coefficient47_101,
    output := OriginalRow227TriangleData0709.coefficient48_101, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_103, Icur := OriginalRow227TriangleData0696.coefficient47_102,
    output := OriginalRow227TriangleData0709.coefficient48_102, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_104, Icur := OriginalRow227TriangleData0696.coefficient47_103,
    output := OriginalRow227TriangleData0709.coefficient48_103, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_105, Icur := OriginalRow227TriangleData0696.coefficient47_104,
    output := OriginalRow227TriangleData0709.coefficient48_104, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_106, Icur := OriginalRow227TriangleData0696.coefficient47_105,
    output := OriginalRow227TriangleData0709.coefficient48_105, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_107, Icur := OriginalRow227TriangleData0696.coefficient47_106,
    output := OriginalRow227TriangleData0709.coefficient48_106, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_108, Icur := OriginalRow227TriangleData0696.coefficient47_107,
    output := OriginalRow227TriangleData0709.coefficient48_107, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_109, Icur := OriginalRow227TriangleData0696.coefficient47_108,
    output := OriginalRow227TriangleData0709.coefficient48_108, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0697.coefficient47_110, Icur := OriginalRow227TriangleData0696.coefficient47_109,
    output := OriginalRow227TriangleData0709.coefficient48_109, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0697.coefficient47_111, Icur := OriginalRow227TriangleData0697.coefficient47_110,
    output := OriginalRow227TriangleData0709.coefficient48_110, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0693

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0693.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
