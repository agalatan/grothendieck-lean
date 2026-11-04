import Grothe.UpperChaos.OriginalRow227TriangleData0116
import Grothe.UpperChaos.OriginalRow227TriangleData0117
import Grothe.UpperChaos.OriginalRow227TriangleData0132
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0116
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_136, Icur := OriginalRow227TriangleData0116.coefficient7_135,
    output := OriginalRow227TriangleData0132.coefficient8_135, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_137, Icur := OriginalRow227TriangleData0116.coefficient7_136,
    output := OriginalRow227TriangleData0132.coefficient8_136, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_138, Icur := OriginalRow227TriangleData0116.coefficient7_137,
    output := OriginalRow227TriangleData0132.coefficient8_137, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_139, Icur := OriginalRow227TriangleData0116.coefficient7_138,
    output := OriginalRow227TriangleData0132.coefficient8_138, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_140, Icur := OriginalRow227TriangleData0116.coefficient7_139,
    output := OriginalRow227TriangleData0132.coefficient8_139, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_141, Icur := OriginalRow227TriangleData0116.coefficient7_140,
    output := OriginalRow227TriangleData0132.coefficient8_140, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_142, Icur := OriginalRow227TriangleData0116.coefficient7_141,
    output := OriginalRow227TriangleData0132.coefficient8_141, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_143, Icur := OriginalRow227TriangleData0116.coefficient7_142,
    output := OriginalRow227TriangleData0132.coefficient8_142, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_144, Icur := OriginalRow227TriangleData0116.coefficient7_143,
    output := OriginalRow227TriangleData0132.coefficient8_143, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_145, Icur := OriginalRow227TriangleData0116.coefficient7_144,
    output := OriginalRow227TriangleData0132.coefficient8_144, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_146, Icur := OriginalRow227TriangleData0116.coefficient7_145,
    output := OriginalRow227TriangleData0132.coefficient8_145, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_147, Icur := OriginalRow227TriangleData0116.coefficient7_146,
    output := OriginalRow227TriangleData0132.coefficient8_146, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_148, Icur := OriginalRow227TriangleData0116.coefficient7_147,
    output := OriginalRow227TriangleData0132.coefficient8_147, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_149, Icur := OriginalRow227TriangleData0116.coefficient7_148,
    output := OriginalRow227TriangleData0132.coefficient8_148, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_150, Icur := OriginalRow227TriangleData0116.coefficient7_149,
    output := OriginalRow227TriangleData0132.coefficient8_149, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_151, Icur := OriginalRow227TriangleData0116.coefficient7_150,
    output := OriginalRow227TriangleData0132.coefficient8_150, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_152, Icur := OriginalRow227TriangleData0116.coefficient7_151,
    output := OriginalRow227TriangleData0132.coefficient8_151, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_153, Icur := OriginalRow227TriangleData0116.coefficient7_152,
    output := OriginalRow227TriangleData0132.coefficient8_152, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_154, Icur := OriginalRow227TriangleData0116.coefficient7_153,
    output := OriginalRow227TriangleData0132.coefficient8_153, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_155, Icur := OriginalRow227TriangleData0116.coefficient7_154,
    output := OriginalRow227TriangleData0132.coefficient8_154, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_156, Icur := OriginalRow227TriangleData0116.coefficient7_155,
    output := OriginalRow227TriangleData0132.coefficient8_155, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_157, Icur := OriginalRow227TriangleData0116.coefficient7_156,
    output := OriginalRow227TriangleData0132.coefficient8_156, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_158, Icur := OriginalRow227TriangleData0116.coefficient7_157,
    output := OriginalRow227TriangleData0132.coefficient8_157, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_159, Icur := OriginalRow227TriangleData0116.coefficient7_158,
    output := OriginalRow227TriangleData0132.coefficient8_158, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_160, Icur := OriginalRow227TriangleData0116.coefficient7_159,
    output := OriginalRow227TriangleData0132.coefficient8_159, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_161, Icur := OriginalRow227TriangleData0116.coefficient7_160,
    output := OriginalRow227TriangleData0132.coefficient8_160, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_162, Icur := OriginalRow227TriangleData0116.coefficient7_161,
    output := OriginalRow227TriangleData0132.coefficient8_161, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_163, Icur := OriginalRow227TriangleData0116.coefficient7_162,
    output := OriginalRow227TriangleData0132.coefficient8_162, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_164, Icur := OriginalRow227TriangleData0116.coefficient7_163,
    output := OriginalRow227TriangleData0132.coefficient8_163, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0116.coefficient7_165, Icur := OriginalRow227TriangleData0116.coefficient7_164,
    output := OriginalRow227TriangleData0132.coefficient8_164, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_166, Icur := OriginalRow227TriangleData0116.coefficient7_165,
    output := OriginalRow227TriangleData0132.coefficient8_165, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_167, Icur := OriginalRow227TriangleData0117.coefficient7_166,
    output := OriginalRow227TriangleData0132.coefficient8_166, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0116

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0116.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
