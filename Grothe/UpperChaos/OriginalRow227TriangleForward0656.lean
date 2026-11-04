import Grothe.UpperChaos.OriginalRow227TriangleData0659
import Grothe.UpperChaos.OriginalRow227TriangleData0660
import Grothe.UpperChaos.OriginalRow227TriangleData0672
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0656
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_141, Icur := OriginalRow227TriangleData0659.coefficient44_140,
    output := OriginalRow227TriangleData0672.coefficient45_140, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_142, Icur := OriginalRow227TriangleData0659.coefficient44_141,
    output := OriginalRow227TriangleData0672.coefficient45_141, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_143, Icur := OriginalRow227TriangleData0659.coefficient44_142,
    output := OriginalRow227TriangleData0672.coefficient45_142, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_144, Icur := OriginalRow227TriangleData0659.coefficient44_143,
    output := OriginalRow227TriangleData0672.coefficient45_143, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_145, Icur := OriginalRow227TriangleData0659.coefficient44_144,
    output := OriginalRow227TriangleData0672.coefficient45_144, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_146, Icur := OriginalRow227TriangleData0659.coefficient44_145,
    output := OriginalRow227TriangleData0672.coefficient45_145, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_147, Icur := OriginalRow227TriangleData0659.coefficient44_146,
    output := OriginalRow227TriangleData0672.coefficient45_146, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_148, Icur := OriginalRow227TriangleData0659.coefficient44_147,
    output := OriginalRow227TriangleData0672.coefficient45_147, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_149, Icur := OriginalRow227TriangleData0659.coefficient44_148,
    output := OriginalRow227TriangleData0672.coefficient45_148, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_150, Icur := OriginalRow227TriangleData0659.coefficient44_149,
    output := OriginalRow227TriangleData0672.coefficient45_149, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_151, Icur := OriginalRow227TriangleData0659.coefficient44_150,
    output := OriginalRow227TriangleData0672.coefficient45_150, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_152, Icur := OriginalRow227TriangleData0659.coefficient44_151,
    output := OriginalRow227TriangleData0672.coefficient45_151, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_153, Icur := OriginalRow227TriangleData0659.coefficient44_152,
    output := OriginalRow227TriangleData0672.coefficient45_152, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_154, Icur := OriginalRow227TriangleData0659.coefficient44_153,
    output := OriginalRow227TriangleData0672.coefficient45_153, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_155, Icur := OriginalRow227TriangleData0659.coefficient44_154,
    output := OriginalRow227TriangleData0672.coefficient45_154, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_156, Icur := OriginalRow227TriangleData0659.coefficient44_155,
    output := OriginalRow227TriangleData0672.coefficient45_155, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_157, Icur := OriginalRow227TriangleData0659.coefficient44_156,
    output := OriginalRow227TriangleData0672.coefficient45_156, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_158, Icur := OriginalRow227TriangleData0659.coefficient44_157,
    output := OriginalRow227TriangleData0672.coefficient45_157, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_159, Icur := OriginalRow227TriangleData0659.coefficient44_158,
    output := OriginalRow227TriangleData0672.coefficient45_158, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_160, Icur := OriginalRow227TriangleData0659.coefficient44_159,
    output := OriginalRow227TriangleData0672.coefficient45_159, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_161, Icur := OriginalRow227TriangleData0659.coefficient44_160,
    output := OriginalRow227TriangleData0672.coefficient45_160, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_162, Icur := OriginalRow227TriangleData0659.coefficient44_161,
    output := OriginalRow227TriangleData0672.coefficient45_161, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_163, Icur := OriginalRow227TriangleData0659.coefficient44_162,
    output := OriginalRow227TriangleData0672.coefficient45_162, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_164, Icur := OriginalRow227TriangleData0659.coefficient44_163,
    output := OriginalRow227TriangleData0672.coefficient45_163, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_165, Icur := OriginalRow227TriangleData0659.coefficient44_164,
    output := OriginalRow227TriangleData0672.coefficient45_164, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_166, Icur := OriginalRow227TriangleData0659.coefficient44_165,
    output := OriginalRow227TriangleData0672.coefficient45_165, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_167, Icur := OriginalRow227TriangleData0659.coefficient44_166,
    output := OriginalRow227TriangleData0672.coefficient45_166, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_168, Icur := OriginalRow227TriangleData0659.coefficient44_167,
    output := OriginalRow227TriangleData0672.coefficient45_167, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_169, Icur := OriginalRow227TriangleData0659.coefficient44_168,
    output := OriginalRow227TriangleData0672.coefficient45_168, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0659.coefficient44_170, Icur := OriginalRow227TriangleData0659.coefficient44_169,
    output := OriginalRow227TriangleData0672.coefficient45_169, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0660.coefficient44_171, Icur := OriginalRow227TriangleData0659.coefficient44_170,
    output := OriginalRow227TriangleData0672.coefficient45_170, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0660.coefficient44_172, Icur := OriginalRow227TriangleData0660.coefficient44_171,
    output := OriginalRow227TriangleData0672.coefficient45_171, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0656

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0656.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
