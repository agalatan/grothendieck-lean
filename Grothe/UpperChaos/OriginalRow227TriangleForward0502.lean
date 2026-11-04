import Grothe.UpperChaos.OriginalRow227TriangleData0504
import Grothe.UpperChaos.OriginalRow227TriangleData0505
import Grothe.UpperChaos.OriginalRow227TriangleData0518
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0502
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_98, Icur := OriginalRow227TriangleData0504.coefficient33_97,
    output := OriginalRow227TriangleData0518.coefficient34_97, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_99, Icur := OriginalRow227TriangleData0504.coefficient33_98,
    output := OriginalRow227TriangleData0518.coefficient34_98, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_100, Icur := OriginalRow227TriangleData0504.coefficient33_99,
    output := OriginalRow227TriangleData0518.coefficient34_99, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_101, Icur := OriginalRow227TriangleData0504.coefficient33_100,
    output := OriginalRow227TriangleData0518.coefficient34_100, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_102, Icur := OriginalRow227TriangleData0504.coefficient33_101,
    output := OriginalRow227TriangleData0518.coefficient34_101, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_103, Icur := OriginalRow227TriangleData0504.coefficient33_102,
    output := OriginalRow227TriangleData0518.coefficient34_102, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_104, Icur := OriginalRow227TriangleData0504.coefficient33_103,
    output := OriginalRow227TriangleData0518.coefficient34_103, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_105, Icur := OriginalRow227TriangleData0504.coefficient33_104,
    output := OriginalRow227TriangleData0518.coefficient34_104, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_106, Icur := OriginalRow227TriangleData0504.coefficient33_105,
    output := OriginalRow227TriangleData0518.coefficient34_105, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_107, Icur := OriginalRow227TriangleData0504.coefficient33_106,
    output := OriginalRow227TriangleData0518.coefficient34_106, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_108, Icur := OriginalRow227TriangleData0504.coefficient33_107,
    output := OriginalRow227TriangleData0518.coefficient34_107, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_109, Icur := OriginalRow227TriangleData0504.coefficient33_108,
    output := OriginalRow227TriangleData0518.coefficient34_108, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_110, Icur := OriginalRow227TriangleData0504.coefficient33_109,
    output := OriginalRow227TriangleData0518.coefficient34_109, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_111, Icur := OriginalRow227TriangleData0504.coefficient33_110,
    output := OriginalRow227TriangleData0518.coefficient34_110, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_112, Icur := OriginalRow227TriangleData0504.coefficient33_111,
    output := OriginalRow227TriangleData0518.coefficient34_111, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_113, Icur := OriginalRow227TriangleData0504.coefficient33_112,
    output := OriginalRow227TriangleData0518.coefficient34_112, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_114, Icur := OriginalRow227TriangleData0504.coefficient33_113,
    output := OriginalRow227TriangleData0518.coefficient34_113, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_115, Icur := OriginalRow227TriangleData0504.coefficient33_114,
    output := OriginalRow227TriangleData0518.coefficient34_114, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_116, Icur := OriginalRow227TriangleData0504.coefficient33_115,
    output := OriginalRow227TriangleData0518.coefficient34_115, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_117, Icur := OriginalRow227TriangleData0504.coefficient33_116,
    output := OriginalRow227TriangleData0518.coefficient34_116, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_118, Icur := OriginalRow227TriangleData0504.coefficient33_117,
    output := OriginalRow227TriangleData0518.coefficient34_117, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_119, Icur := OriginalRow227TriangleData0504.coefficient33_118,
    output := OriginalRow227TriangleData0518.coefficient34_118, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_120, Icur := OriginalRow227TriangleData0504.coefficient33_119,
    output := OriginalRow227TriangleData0518.coefficient34_119, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_121, Icur := OriginalRow227TriangleData0504.coefficient33_120,
    output := OriginalRow227TriangleData0518.coefficient34_120, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_122, Icur := OriginalRow227TriangleData0504.coefficient33_121,
    output := OriginalRow227TriangleData0518.coefficient34_121, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_123, Icur := OriginalRow227TriangleData0504.coefficient33_122,
    output := OriginalRow227TriangleData0518.coefficient34_122, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_124, Icur := OriginalRow227TriangleData0504.coefficient33_123,
    output := OriginalRow227TriangleData0518.coefficient34_123, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_125, Icur := OriginalRow227TriangleData0504.coefficient33_124,
    output := OriginalRow227TriangleData0518.coefficient34_124, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_126, Icur := OriginalRow227TriangleData0504.coefficient33_125,
    output := OriginalRow227TriangleData0518.coefficient34_125, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_127, Icur := OriginalRow227TriangleData0504.coefficient33_126,
    output := OriginalRow227TriangleData0518.coefficient34_126, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_128, Icur := OriginalRow227TriangleData0504.coefficient33_127,
    output := OriginalRow227TriangleData0518.coefficient34_127, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_129, Icur := OriginalRow227TriangleData0505.coefficient33_128,
    output := OriginalRow227TriangleData0518.coefficient34_128, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0502

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0502.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
