import Grothe.UpperChaos.OriginalRow227TriangleData0672
import Grothe.UpperChaos.OriginalRow227TriangleData0673
import Grothe.UpperChaos.OriginalRow227TriangleData0685
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0669
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_142, Icur := OriginalRow227TriangleData0672.coefficient45_141,
    output := OriginalRow227TriangleData0685.coefficient46_141, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_143, Icur := OriginalRow227TriangleData0672.coefficient45_142,
    output := OriginalRow227TriangleData0685.coefficient46_142, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_144, Icur := OriginalRow227TriangleData0672.coefficient45_143,
    output := OriginalRow227TriangleData0685.coefficient46_143, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_145, Icur := OriginalRow227TriangleData0672.coefficient45_144,
    output := OriginalRow227TriangleData0685.coefficient46_144, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_146, Icur := OriginalRow227TriangleData0672.coefficient45_145,
    output := OriginalRow227TriangleData0685.coefficient46_145, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_147, Icur := OriginalRow227TriangleData0672.coefficient45_146,
    output := OriginalRow227TriangleData0685.coefficient46_146, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_148, Icur := OriginalRow227TriangleData0672.coefficient45_147,
    output := OriginalRow227TriangleData0685.coefficient46_147, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_149, Icur := OriginalRow227TriangleData0672.coefficient45_148,
    output := OriginalRow227TriangleData0685.coefficient46_148, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_150, Icur := OriginalRow227TriangleData0672.coefficient45_149,
    output := OriginalRow227TriangleData0685.coefficient46_149, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_151, Icur := OriginalRow227TriangleData0672.coefficient45_150,
    output := OriginalRow227TriangleData0685.coefficient46_150, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_152, Icur := OriginalRow227TriangleData0672.coefficient45_151,
    output := OriginalRow227TriangleData0685.coefficient46_151, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_153, Icur := OriginalRow227TriangleData0672.coefficient45_152,
    output := OriginalRow227TriangleData0685.coefficient46_152, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_154, Icur := OriginalRow227TriangleData0672.coefficient45_153,
    output := OriginalRow227TriangleData0685.coefficient46_153, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_155, Icur := OriginalRow227TriangleData0672.coefficient45_154,
    output := OriginalRow227TriangleData0685.coefficient46_154, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_156, Icur := OriginalRow227TriangleData0672.coefficient45_155,
    output := OriginalRow227TriangleData0685.coefficient46_155, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_157, Icur := OriginalRow227TriangleData0672.coefficient45_156,
    output := OriginalRow227TriangleData0685.coefficient46_156, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_158, Icur := OriginalRow227TriangleData0672.coefficient45_157,
    output := OriginalRow227TriangleData0685.coefficient46_157, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_159, Icur := OriginalRow227TriangleData0672.coefficient45_158,
    output := OriginalRow227TriangleData0685.coefficient46_158, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_160, Icur := OriginalRow227TriangleData0672.coefficient45_159,
    output := OriginalRow227TriangleData0685.coefficient46_159, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_161, Icur := OriginalRow227TriangleData0672.coefficient45_160,
    output := OriginalRow227TriangleData0685.coefficient46_160, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_162, Icur := OriginalRow227TriangleData0672.coefficient45_161,
    output := OriginalRow227TriangleData0685.coefficient46_161, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_163, Icur := OriginalRow227TriangleData0672.coefficient45_162,
    output := OriginalRow227TriangleData0685.coefficient46_162, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_164, Icur := OriginalRow227TriangleData0672.coefficient45_163,
    output := OriginalRow227TriangleData0685.coefficient46_163, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_165, Icur := OriginalRow227TriangleData0672.coefficient45_164,
    output := OriginalRow227TriangleData0685.coefficient46_164, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_166, Icur := OriginalRow227TriangleData0672.coefficient45_165,
    output := OriginalRow227TriangleData0685.coefficient46_165, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_167, Icur := OriginalRow227TriangleData0672.coefficient45_166,
    output := OriginalRow227TriangleData0685.coefficient46_166, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_168, Icur := OriginalRow227TriangleData0672.coefficient45_167,
    output := OriginalRow227TriangleData0685.coefficient46_167, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_169, Icur := OriginalRow227TriangleData0672.coefficient45_168,
    output := OriginalRow227TriangleData0685.coefficient46_168, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_170, Icur := OriginalRow227TriangleData0672.coefficient45_169,
    output := OriginalRow227TriangleData0685.coefficient46_169, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_171, Icur := OriginalRow227TriangleData0672.coefficient45_170,
    output := OriginalRow227TriangleData0685.coefficient46_170, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0673.coefficient45_172, Icur := OriginalRow227TriangleData0672.coefficient45_171,
    output := OriginalRow227TriangleData0685.coefficient46_171, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0673.coefficient45_173, Icur := OriginalRow227TriangleData0673.coefficient45_172,
    output := OriginalRow227TriangleData0685.coefficient46_172, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0669

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0669.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
