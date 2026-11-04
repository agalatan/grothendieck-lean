import Grothe.UpperChaos.OriginalRow227TriangleData0211
import Grothe.UpperChaos.OriginalRow227TriangleData0212
import Grothe.UpperChaos.OriginalRow227TriangleData0226
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0210
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_142, Icur := OriginalRow227TriangleData0211.coefficient13_141,
    output := OriginalRow227TriangleData0226.coefficient14_141, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_143, Icur := OriginalRow227TriangleData0211.coefficient13_142,
    output := OriginalRow227TriangleData0226.coefficient14_142, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_144, Icur := OriginalRow227TriangleData0211.coefficient13_143,
    output := OriginalRow227TriangleData0226.coefficient14_143, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_145, Icur := OriginalRow227TriangleData0211.coefficient13_144,
    output := OriginalRow227TriangleData0226.coefficient14_144, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_146, Icur := OriginalRow227TriangleData0211.coefficient13_145,
    output := OriginalRow227TriangleData0226.coefficient14_145, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_147, Icur := OriginalRow227TriangleData0211.coefficient13_146,
    output := OriginalRow227TriangleData0226.coefficient14_146, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_148, Icur := OriginalRow227TriangleData0211.coefficient13_147,
    output := OriginalRow227TriangleData0226.coefficient14_147, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_149, Icur := OriginalRow227TriangleData0211.coefficient13_148,
    output := OriginalRow227TriangleData0226.coefficient14_148, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_150, Icur := OriginalRow227TriangleData0211.coefficient13_149,
    output := OriginalRow227TriangleData0226.coefficient14_149, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_151, Icur := OriginalRow227TriangleData0211.coefficient13_150,
    output := OriginalRow227TriangleData0226.coefficient14_150, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_152, Icur := OriginalRow227TriangleData0211.coefficient13_151,
    output := OriginalRow227TriangleData0226.coefficient14_151, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_153, Icur := OriginalRow227TriangleData0211.coefficient13_152,
    output := OriginalRow227TriangleData0226.coefficient14_152, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_154, Icur := OriginalRow227TriangleData0211.coefficient13_153,
    output := OriginalRow227TriangleData0226.coefficient14_153, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_155, Icur := OriginalRow227TriangleData0211.coefficient13_154,
    output := OriginalRow227TriangleData0226.coefficient14_154, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_156, Icur := OriginalRow227TriangleData0211.coefficient13_155,
    output := OriginalRow227TriangleData0226.coefficient14_155, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_157, Icur := OriginalRow227TriangleData0211.coefficient13_156,
    output := OriginalRow227TriangleData0226.coefficient14_156, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_158, Icur := OriginalRow227TriangleData0211.coefficient13_157,
    output := OriginalRow227TriangleData0226.coefficient14_157, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_159, Icur := OriginalRow227TriangleData0211.coefficient13_158,
    output := OriginalRow227TriangleData0226.coefficient14_158, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_160, Icur := OriginalRow227TriangleData0211.coefficient13_159,
    output := OriginalRow227TriangleData0226.coefficient14_159, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_161, Icur := OriginalRow227TriangleData0211.coefficient13_160,
    output := OriginalRow227TriangleData0226.coefficient14_160, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_162, Icur := OriginalRow227TriangleData0211.coefficient13_161,
    output := OriginalRow227TriangleData0226.coefficient14_161, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_163, Icur := OriginalRow227TriangleData0211.coefficient13_162,
    output := OriginalRow227TriangleData0226.coefficient14_162, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_164, Icur := OriginalRow227TriangleData0211.coefficient13_163,
    output := OriginalRow227TriangleData0226.coefficient14_163, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_165, Icur := OriginalRow227TriangleData0211.coefficient13_164,
    output := OriginalRow227TriangleData0226.coefficient14_164, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_166, Icur := OriginalRow227TriangleData0211.coefficient13_165,
    output := OriginalRow227TriangleData0226.coefficient14_165, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_167, Icur := OriginalRow227TriangleData0211.coefficient13_166,
    output := OriginalRow227TriangleData0226.coefficient14_166, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_168, Icur := OriginalRow227TriangleData0211.coefficient13_167,
    output := OriginalRow227TriangleData0226.coefficient14_167, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_169, Icur := OriginalRow227TriangleData0211.coefficient13_168,
    output := OriginalRow227TriangleData0226.coefficient14_168, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_170, Icur := OriginalRow227TriangleData0211.coefficient13_169,
    output := OriginalRow227TriangleData0226.coefficient14_169, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0211.coefficient13_171, Icur := OriginalRow227TriangleData0211.coefficient13_170,
    output := OriginalRow227TriangleData0226.coefficient14_170, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_172, Icur := OriginalRow227TriangleData0211.coefficient13_171,
    output := OriginalRow227TriangleData0226.coefficient14_171, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_173, Icur := OriginalRow227TriangleData0212.coefficient13_172,
    output := OriginalRow227TriangleData0226.coefficient14_172, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0210

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0210.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
