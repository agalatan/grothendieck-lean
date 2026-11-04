import Grothe.UpperChaos.OriginalRow227TriangleData1113
import Grothe.UpperChaos.OriginalRow227TriangleData1114
import Grothe.UpperChaos.OriginalRow227TriangleData1124
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1108
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_146, Icur := OriginalRow227TriangleData1113.coefficient81_145,
    output := OriginalRow227TriangleData1124.coefficient82_145, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_147, Icur := OriginalRow227TriangleData1113.coefficient81_146,
    output := OriginalRow227TriangleData1124.coefficient82_146, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_148, Icur := OriginalRow227TriangleData1113.coefficient81_147,
    output := OriginalRow227TriangleData1124.coefficient82_147, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_149, Icur := OriginalRow227TriangleData1113.coefficient81_148,
    output := OriginalRow227TriangleData1124.coefficient82_148, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_150, Icur := OriginalRow227TriangleData1113.coefficient81_149,
    output := OriginalRow227TriangleData1124.coefficient82_149, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_151, Icur := OriginalRow227TriangleData1113.coefficient81_150,
    output := OriginalRow227TriangleData1124.coefficient82_150, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_152, Icur := OriginalRow227TriangleData1113.coefficient81_151,
    output := OriginalRow227TriangleData1124.coefficient82_151, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_153, Icur := OriginalRow227TriangleData1113.coefficient81_152,
    output := OriginalRow227TriangleData1124.coefficient82_152, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_154, Icur := OriginalRow227TriangleData1113.coefficient81_153,
    output := OriginalRow227TriangleData1124.coefficient82_153, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_155, Icur := OriginalRow227TriangleData1113.coefficient81_154,
    output := OriginalRow227TriangleData1124.coefficient82_154, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_156, Icur := OriginalRow227TriangleData1113.coefficient81_155,
    output := OriginalRow227TriangleData1124.coefficient82_155, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_157, Icur := OriginalRow227TriangleData1113.coefficient81_156,
    output := OriginalRow227TriangleData1124.coefficient82_156, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_158, Icur := OriginalRow227TriangleData1113.coefficient81_157,
    output := OriginalRow227TriangleData1124.coefficient82_157, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_159, Icur := OriginalRow227TriangleData1113.coefficient81_158,
    output := OriginalRow227TriangleData1124.coefficient82_158, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_160, Icur := OriginalRow227TriangleData1113.coefficient81_159,
    output := OriginalRow227TriangleData1124.coefficient82_159, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_161, Icur := OriginalRow227TriangleData1113.coefficient81_160,
    output := OriginalRow227TriangleData1124.coefficient82_160, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_162, Icur := OriginalRow227TriangleData1113.coefficient81_161,
    output := OriginalRow227TriangleData1124.coefficient82_161, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_163, Icur := OriginalRow227TriangleData1113.coefficient81_162,
    output := OriginalRow227TriangleData1124.coefficient82_162, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_164, Icur := OriginalRow227TriangleData1113.coefficient81_163,
    output := OriginalRow227TriangleData1124.coefficient82_163, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_165, Icur := OriginalRow227TriangleData1113.coefficient81_164,
    output := OriginalRow227TriangleData1124.coefficient82_164, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_166, Icur := OriginalRow227TriangleData1113.coefficient81_165,
    output := OriginalRow227TriangleData1124.coefficient82_165, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_167, Icur := OriginalRow227TriangleData1113.coefficient81_166,
    output := OriginalRow227TriangleData1124.coefficient82_166, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_168, Icur := OriginalRow227TriangleData1113.coefficient81_167,
    output := OriginalRow227TriangleData1124.coefficient82_167, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_169, Icur := OriginalRow227TriangleData1113.coefficient81_168,
    output := OriginalRow227TriangleData1124.coefficient82_168, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_170, Icur := OriginalRow227TriangleData1113.coefficient81_169,
    output := OriginalRow227TriangleData1124.coefficient82_169, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_171, Icur := OriginalRow227TriangleData1113.coefficient81_170,
    output := OriginalRow227TriangleData1124.coefficient82_170, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_172, Icur := OriginalRow227TriangleData1113.coefficient81_171,
    output := OriginalRow227TriangleData1124.coefficient82_171, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_173, Icur := OriginalRow227TriangleData1113.coefficient81_172,
    output := OriginalRow227TriangleData1124.coefficient82_172, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_174, Icur := OriginalRow227TriangleData1113.coefficient81_173,
    output := OriginalRow227TriangleData1124.coefficient82_173, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1113.coefficient81_175, Icur := OriginalRow227TriangleData1113.coefficient81_174,
    output := OriginalRow227TriangleData1124.coefficient82_174, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1114.coefficient81_176, Icur := OriginalRow227TriangleData1113.coefficient81_175,
    output := OriginalRow227TriangleData1124.coefficient82_175, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1114.coefficient81_177, Icur := OriginalRow227TriangleData1114.coefficient81_176,
    output := OriginalRow227TriangleData1124.coefficient82_176, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1108

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1108.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
