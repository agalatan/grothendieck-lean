import Grothe.UpperChaos.OriginalRow227TriangleData1135
import Grothe.UpperChaos.OriginalRow227TriangleData1136
import Grothe.UpperChaos.OriginalRow227TriangleData1146
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1130
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_148, Icur := OriginalRow227TriangleData1135.coefficient83_147,
    output := OriginalRow227TriangleData1146.coefficient84_147, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_149, Icur := OriginalRow227TriangleData1135.coefficient83_148,
    output := OriginalRow227TriangleData1146.coefficient84_148, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_150, Icur := OriginalRow227TriangleData1135.coefficient83_149,
    output := OriginalRow227TriangleData1146.coefficient84_149, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_151, Icur := OriginalRow227TriangleData1135.coefficient83_150,
    output := OriginalRow227TriangleData1146.coefficient84_150, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_152, Icur := OriginalRow227TriangleData1135.coefficient83_151,
    output := OriginalRow227TriangleData1146.coefficient84_151, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_153, Icur := OriginalRow227TriangleData1135.coefficient83_152,
    output := OriginalRow227TriangleData1146.coefficient84_152, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_154, Icur := OriginalRow227TriangleData1135.coefficient83_153,
    output := OriginalRow227TriangleData1146.coefficient84_153, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_155, Icur := OriginalRow227TriangleData1135.coefficient83_154,
    output := OriginalRow227TriangleData1146.coefficient84_154, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_156, Icur := OriginalRow227TriangleData1135.coefficient83_155,
    output := OriginalRow227TriangleData1146.coefficient84_155, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_157, Icur := OriginalRow227TriangleData1135.coefficient83_156,
    output := OriginalRow227TriangleData1146.coefficient84_156, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_158, Icur := OriginalRow227TriangleData1135.coefficient83_157,
    output := OriginalRow227TriangleData1146.coefficient84_157, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_159, Icur := OriginalRow227TriangleData1135.coefficient83_158,
    output := OriginalRow227TriangleData1146.coefficient84_158, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_160, Icur := OriginalRow227TriangleData1135.coefficient83_159,
    output := OriginalRow227TriangleData1146.coefficient84_159, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_161, Icur := OriginalRow227TriangleData1135.coefficient83_160,
    output := OriginalRow227TriangleData1146.coefficient84_160, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_162, Icur := OriginalRow227TriangleData1135.coefficient83_161,
    output := OriginalRow227TriangleData1146.coefficient84_161, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_163, Icur := OriginalRow227TriangleData1135.coefficient83_162,
    output := OriginalRow227TriangleData1146.coefficient84_162, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_164, Icur := OriginalRow227TriangleData1135.coefficient83_163,
    output := OriginalRow227TriangleData1146.coefficient84_163, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_165, Icur := OriginalRow227TriangleData1135.coefficient83_164,
    output := OriginalRow227TriangleData1146.coefficient84_164, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_166, Icur := OriginalRow227TriangleData1135.coefficient83_165,
    output := OriginalRow227TriangleData1146.coefficient84_165, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_167, Icur := OriginalRow227TriangleData1135.coefficient83_166,
    output := OriginalRow227TriangleData1146.coefficient84_166, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_168, Icur := OriginalRow227TriangleData1135.coefficient83_167,
    output := OriginalRow227TriangleData1146.coefficient84_167, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_169, Icur := OriginalRow227TriangleData1135.coefficient83_168,
    output := OriginalRow227TriangleData1146.coefficient84_168, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_170, Icur := OriginalRow227TriangleData1135.coefficient83_169,
    output := OriginalRow227TriangleData1146.coefficient84_169, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_171, Icur := OriginalRow227TriangleData1135.coefficient83_170,
    output := OriginalRow227TriangleData1146.coefficient84_170, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_172, Icur := OriginalRow227TriangleData1135.coefficient83_171,
    output := OriginalRow227TriangleData1146.coefficient84_171, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_173, Icur := OriginalRow227TriangleData1135.coefficient83_172,
    output := OriginalRow227TriangleData1146.coefficient84_172, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_174, Icur := OriginalRow227TriangleData1135.coefficient83_173,
    output := OriginalRow227TriangleData1146.coefficient84_173, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_175, Icur := OriginalRow227TriangleData1135.coefficient83_174,
    output := OriginalRow227TriangleData1146.coefficient84_174, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_176, Icur := OriginalRow227TriangleData1135.coefficient83_175,
    output := OriginalRow227TriangleData1146.coefficient84_175, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_177, Icur := OriginalRow227TriangleData1135.coefficient83_176,
    output := OriginalRow227TriangleData1146.coefficient84_176, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1136.coefficient83_178, Icur := OriginalRow227TriangleData1135.coefficient83_177,
    output := OriginalRow227TriangleData1146.coefficient84_177, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1136.coefficient83_179, Icur := OriginalRow227TriangleData1136.coefficient83_178,
    output := OriginalRow227TriangleData1146.coefficient84_178, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1130

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1130.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
