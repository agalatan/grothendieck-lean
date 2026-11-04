import Grothe.UpperChaos.OriginalRow227TriangleData0490
import Grothe.UpperChaos.OriginalRow227TriangleData0491
import Grothe.UpperChaos.OriginalRow227TriangleData0504
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0488
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_97, Icur := OriginalRow227TriangleData0490.coefficient32_96,
    output := OriginalRow227TriangleData0504.coefficient33_96, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_98, Icur := OriginalRow227TriangleData0490.coefficient32_97,
    output := OriginalRow227TriangleData0504.coefficient33_97, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_99, Icur := OriginalRow227TriangleData0490.coefficient32_98,
    output := OriginalRow227TriangleData0504.coefficient33_98, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_100, Icur := OriginalRow227TriangleData0490.coefficient32_99,
    output := OriginalRow227TriangleData0504.coefficient33_99, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_101, Icur := OriginalRow227TriangleData0490.coefficient32_100,
    output := OriginalRow227TriangleData0504.coefficient33_100, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_102, Icur := OriginalRow227TriangleData0490.coefficient32_101,
    output := OriginalRow227TriangleData0504.coefficient33_101, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_103, Icur := OriginalRow227TriangleData0490.coefficient32_102,
    output := OriginalRow227TriangleData0504.coefficient33_102, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_104, Icur := OriginalRow227TriangleData0490.coefficient32_103,
    output := OriginalRow227TriangleData0504.coefficient33_103, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_105, Icur := OriginalRow227TriangleData0490.coefficient32_104,
    output := OriginalRow227TriangleData0504.coefficient33_104, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_106, Icur := OriginalRow227TriangleData0490.coefficient32_105,
    output := OriginalRow227TriangleData0504.coefficient33_105, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_107, Icur := OriginalRow227TriangleData0490.coefficient32_106,
    output := OriginalRow227TriangleData0504.coefficient33_106, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_108, Icur := OriginalRow227TriangleData0490.coefficient32_107,
    output := OriginalRow227TriangleData0504.coefficient33_107, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_109, Icur := OriginalRow227TriangleData0490.coefficient32_108,
    output := OriginalRow227TriangleData0504.coefficient33_108, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_110, Icur := OriginalRow227TriangleData0490.coefficient32_109,
    output := OriginalRow227TriangleData0504.coefficient33_109, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_111, Icur := OriginalRow227TriangleData0490.coefficient32_110,
    output := OriginalRow227TriangleData0504.coefficient33_110, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_112, Icur := OriginalRow227TriangleData0490.coefficient32_111,
    output := OriginalRow227TriangleData0504.coefficient33_111, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_113, Icur := OriginalRow227TriangleData0490.coefficient32_112,
    output := OriginalRow227TriangleData0504.coefficient33_112, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_114, Icur := OriginalRow227TriangleData0490.coefficient32_113,
    output := OriginalRow227TriangleData0504.coefficient33_113, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_115, Icur := OriginalRow227TriangleData0490.coefficient32_114,
    output := OriginalRow227TriangleData0504.coefficient33_114, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_116, Icur := OriginalRow227TriangleData0490.coefficient32_115,
    output := OriginalRow227TriangleData0504.coefficient33_115, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_117, Icur := OriginalRow227TriangleData0490.coefficient32_116,
    output := OriginalRow227TriangleData0504.coefficient33_116, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_118, Icur := OriginalRow227TriangleData0490.coefficient32_117,
    output := OriginalRow227TriangleData0504.coefficient33_117, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_119, Icur := OriginalRow227TriangleData0490.coefficient32_118,
    output := OriginalRow227TriangleData0504.coefficient33_118, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_120, Icur := OriginalRow227TriangleData0490.coefficient32_119,
    output := OriginalRow227TriangleData0504.coefficient33_119, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_121, Icur := OriginalRow227TriangleData0490.coefficient32_120,
    output := OriginalRow227TriangleData0504.coefficient33_120, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_122, Icur := OriginalRow227TriangleData0490.coefficient32_121,
    output := OriginalRow227TriangleData0504.coefficient33_121, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_123, Icur := OriginalRow227TriangleData0490.coefficient32_122,
    output := OriginalRow227TriangleData0504.coefficient33_122, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_124, Icur := OriginalRow227TriangleData0490.coefficient32_123,
    output := OriginalRow227TriangleData0504.coefficient33_123, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_125, Icur := OriginalRow227TriangleData0490.coefficient32_124,
    output := OriginalRow227TriangleData0504.coefficient33_124, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0490.coefficient32_126, Icur := OriginalRow227TriangleData0490.coefficient32_125,
    output := OriginalRow227TriangleData0504.coefficient33_125, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0491.coefficient32_127, Icur := OriginalRow227TriangleData0490.coefficient32_126,
    output := OriginalRow227TriangleData0504.coefficient33_126, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0491.coefficient32_128, Icur := OriginalRow227TriangleData0491.coefficient32_127,
    output := OriginalRow227TriangleData0504.coefficient33_127, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0488

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0488.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
