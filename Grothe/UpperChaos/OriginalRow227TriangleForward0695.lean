import Grothe.UpperChaos.OriginalRow227TriangleData0698
import Grothe.UpperChaos.OriginalRow227TriangleData0699
import Grothe.UpperChaos.OriginalRow227TriangleData0711
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0695
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_144, Icur := OriginalRow227TriangleData0698.coefficient47_143,
    output := OriginalRow227TriangleData0711.coefficient48_143, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_145, Icur := OriginalRow227TriangleData0698.coefficient47_144,
    output := OriginalRow227TriangleData0711.coefficient48_144, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_146, Icur := OriginalRow227TriangleData0698.coefficient47_145,
    output := OriginalRow227TriangleData0711.coefficient48_145, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_147, Icur := OriginalRow227TriangleData0698.coefficient47_146,
    output := OriginalRow227TriangleData0711.coefficient48_146, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_148, Icur := OriginalRow227TriangleData0698.coefficient47_147,
    output := OriginalRow227TriangleData0711.coefficient48_147, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_149, Icur := OriginalRow227TriangleData0698.coefficient47_148,
    output := OriginalRow227TriangleData0711.coefficient48_148, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_150, Icur := OriginalRow227TriangleData0698.coefficient47_149,
    output := OriginalRow227TriangleData0711.coefficient48_149, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_151, Icur := OriginalRow227TriangleData0698.coefficient47_150,
    output := OriginalRow227TriangleData0711.coefficient48_150, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_152, Icur := OriginalRow227TriangleData0698.coefficient47_151,
    output := OriginalRow227TriangleData0711.coefficient48_151, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_153, Icur := OriginalRow227TriangleData0698.coefficient47_152,
    output := OriginalRow227TriangleData0711.coefficient48_152, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_154, Icur := OriginalRow227TriangleData0698.coefficient47_153,
    output := OriginalRow227TriangleData0711.coefficient48_153, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_155, Icur := OriginalRow227TriangleData0698.coefficient47_154,
    output := OriginalRow227TriangleData0711.coefficient48_154, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_156, Icur := OriginalRow227TriangleData0698.coefficient47_155,
    output := OriginalRow227TriangleData0711.coefficient48_155, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_157, Icur := OriginalRow227TriangleData0698.coefficient47_156,
    output := OriginalRow227TriangleData0711.coefficient48_156, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_158, Icur := OriginalRow227TriangleData0698.coefficient47_157,
    output := OriginalRow227TriangleData0711.coefficient48_157, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_159, Icur := OriginalRow227TriangleData0698.coefficient47_158,
    output := OriginalRow227TriangleData0711.coefficient48_158, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_160, Icur := OriginalRow227TriangleData0698.coefficient47_159,
    output := OriginalRow227TriangleData0711.coefficient48_159, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_161, Icur := OriginalRow227TriangleData0698.coefficient47_160,
    output := OriginalRow227TriangleData0711.coefficient48_160, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_162, Icur := OriginalRow227TriangleData0698.coefficient47_161,
    output := OriginalRow227TriangleData0711.coefficient48_161, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_163, Icur := OriginalRow227TriangleData0698.coefficient47_162,
    output := OriginalRow227TriangleData0711.coefficient48_162, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_164, Icur := OriginalRow227TriangleData0698.coefficient47_163,
    output := OriginalRow227TriangleData0711.coefficient48_163, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_165, Icur := OriginalRow227TriangleData0698.coefficient47_164,
    output := OriginalRow227TriangleData0711.coefficient48_164, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_166, Icur := OriginalRow227TriangleData0698.coefficient47_165,
    output := OriginalRow227TriangleData0711.coefficient48_165, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_167, Icur := OriginalRow227TriangleData0698.coefficient47_166,
    output := OriginalRow227TriangleData0711.coefficient48_166, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_168, Icur := OriginalRow227TriangleData0698.coefficient47_167,
    output := OriginalRow227TriangleData0711.coefficient48_167, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_169, Icur := OriginalRow227TriangleData0698.coefficient47_168,
    output := OriginalRow227TriangleData0711.coefficient48_168, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_170, Icur := OriginalRow227TriangleData0698.coefficient47_169,
    output := OriginalRow227TriangleData0711.coefficient48_169, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_171, Icur := OriginalRow227TriangleData0698.coefficient47_170,
    output := OriginalRow227TriangleData0711.coefficient48_170, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_172, Icur := OriginalRow227TriangleData0698.coefficient47_171,
    output := OriginalRow227TriangleData0711.coefficient48_171, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0698.coefficient47_173, Icur := OriginalRow227TriangleData0698.coefficient47_172,
    output := OriginalRow227TriangleData0711.coefficient48_172, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0699.coefficient47_174, Icur := OriginalRow227TriangleData0698.coefficient47_173,
    output := OriginalRow227TriangleData0711.coefficient48_173, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0699.coefficient47_175, Icur := OriginalRow227TriangleData0699.coefficient47_174,
    output := OriginalRow227TriangleData0711.coefficient48_174, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0695

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0695.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
