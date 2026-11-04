import Grothe.UpperChaos.OriginalRow227TriangleData1706
import Grothe.UpperChaos.OriginalRow227TriangleData1707
import Grothe.UpperChaos.OriginalRow227TriangleData1713
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1697
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_147, Icur := OriginalRow227TriangleData1706.coefficient146_146,
    output := OriginalRow227TriangleData1713.coefficient147_146, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_148, Icur := OriginalRow227TriangleData1706.coefficient146_147,
    output := OriginalRow227TriangleData1713.coefficient147_147, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_149, Icur := OriginalRow227TriangleData1706.coefficient146_148,
    output := OriginalRow227TriangleData1713.coefficient147_148, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_150, Icur := OriginalRow227TriangleData1706.coefficient146_149,
    output := OriginalRow227TriangleData1713.coefficient147_149, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_151, Icur := OriginalRow227TriangleData1706.coefficient146_150,
    output := OriginalRow227TriangleData1713.coefficient147_150, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_152, Icur := OriginalRow227TriangleData1706.coefficient146_151,
    output := OriginalRow227TriangleData1713.coefficient147_151, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_153, Icur := OriginalRow227TriangleData1706.coefficient146_152,
    output := OriginalRow227TriangleData1713.coefficient147_152, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_154, Icur := OriginalRow227TriangleData1706.coefficient146_153,
    output := OriginalRow227TriangleData1713.coefficient147_153, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_155, Icur := OriginalRow227TriangleData1706.coefficient146_154,
    output := OriginalRow227TriangleData1713.coefficient147_154, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_156, Icur := OriginalRow227TriangleData1706.coefficient146_155,
    output := OriginalRow227TriangleData1713.coefficient147_155, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_157, Icur := OriginalRow227TriangleData1706.coefficient146_156,
    output := OriginalRow227TriangleData1713.coefficient147_156, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_158, Icur := OriginalRow227TriangleData1706.coefficient146_157,
    output := OriginalRow227TriangleData1713.coefficient147_157, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_159, Icur := OriginalRow227TriangleData1706.coefficient146_158,
    output := OriginalRow227TriangleData1713.coefficient147_158, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_160, Icur := OriginalRow227TriangleData1706.coefficient146_159,
    output := OriginalRow227TriangleData1713.coefficient147_159, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_161, Icur := OriginalRow227TriangleData1706.coefficient146_160,
    output := OriginalRow227TriangleData1713.coefficient147_160, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_162, Icur := OriginalRow227TriangleData1706.coefficient146_161,
    output := OriginalRow227TriangleData1713.coefficient147_161, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_163, Icur := OriginalRow227TriangleData1706.coefficient146_162,
    output := OriginalRow227TriangleData1713.coefficient147_162, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_164, Icur := OriginalRow227TriangleData1706.coefficient146_163,
    output := OriginalRow227TriangleData1713.coefficient147_163, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_165, Icur := OriginalRow227TriangleData1706.coefficient146_164,
    output := OriginalRow227TriangleData1713.coefficient147_164, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_166, Icur := OriginalRow227TriangleData1706.coefficient146_165,
    output := OriginalRow227TriangleData1713.coefficient147_165, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_167, Icur := OriginalRow227TriangleData1706.coefficient146_166,
    output := OriginalRow227TriangleData1713.coefficient147_166, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_168, Icur := OriginalRow227TriangleData1706.coefficient146_167,
    output := OriginalRow227TriangleData1713.coefficient147_167, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_169, Icur := OriginalRow227TriangleData1706.coefficient146_168,
    output := OriginalRow227TriangleData1713.coefficient147_168, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_170, Icur := OriginalRow227TriangleData1706.coefficient146_169,
    output := OriginalRow227TriangleData1713.coefficient147_169, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_171, Icur := OriginalRow227TriangleData1706.coefficient146_170,
    output := OriginalRow227TriangleData1713.coefficient147_170, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_172, Icur := OriginalRow227TriangleData1706.coefficient146_171,
    output := OriginalRow227TriangleData1713.coefficient147_171, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_173, Icur := OriginalRow227TriangleData1706.coefficient146_172,
    output := OriginalRow227TriangleData1713.coefficient147_172, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_174, Icur := OriginalRow227TriangleData1706.coefficient146_173,
    output := OriginalRow227TriangleData1713.coefficient147_173, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_175, Icur := OriginalRow227TriangleData1706.coefficient146_174,
    output := OriginalRow227TriangleData1713.coefficient147_174, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1706.coefficient146_176, Icur := OriginalRow227TriangleData1706.coefficient146_175,
    output := OriginalRow227TriangleData1713.coefficient147_175, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_177, Icur := OriginalRow227TriangleData1706.coefficient146_176,
    output := OriginalRow227TriangleData1713.coefficient147_176, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1707.coefficient146_178, Icur := OriginalRow227TriangleData1707.coefficient146_177,
    output := OriginalRow227TriangleData1713.coefficient147_177, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1697

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1697.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
