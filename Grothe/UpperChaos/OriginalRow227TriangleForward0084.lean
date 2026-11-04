import Grothe.UpperChaos.OriginalRow227TriangleData0084
import Grothe.UpperChaos.OriginalRow227TriangleData0085
import Grothe.UpperChaos.OriginalRow227TriangleData0100
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0084
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_134, Icur := OriginalRow227TriangleData0084.coefficient5_133,
    output := OriginalRow227TriangleData0100.coefficient6_133, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_135, Icur := OriginalRow227TriangleData0084.coefficient5_134,
    output := OriginalRow227TriangleData0100.coefficient6_134, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_136, Icur := OriginalRow227TriangleData0084.coefficient5_135,
    output := OriginalRow227TriangleData0100.coefficient6_135, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_137, Icur := OriginalRow227TriangleData0084.coefficient5_136,
    output := OriginalRow227TriangleData0100.coefficient6_136, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_138, Icur := OriginalRow227TriangleData0084.coefficient5_137,
    output := OriginalRow227TriangleData0100.coefficient6_137, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_139, Icur := OriginalRow227TriangleData0084.coefficient5_138,
    output := OriginalRow227TriangleData0100.coefficient6_138, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_140, Icur := OriginalRow227TriangleData0084.coefficient5_139,
    output := OriginalRow227TriangleData0100.coefficient6_139, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_141, Icur := OriginalRow227TriangleData0084.coefficient5_140,
    output := OriginalRow227TriangleData0100.coefficient6_140, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_142, Icur := OriginalRow227TriangleData0084.coefficient5_141,
    output := OriginalRow227TriangleData0100.coefficient6_141, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_143, Icur := OriginalRow227TriangleData0084.coefficient5_142,
    output := OriginalRow227TriangleData0100.coefficient6_142, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_144, Icur := OriginalRow227TriangleData0084.coefficient5_143,
    output := OriginalRow227TriangleData0100.coefficient6_143, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_145, Icur := OriginalRow227TriangleData0084.coefficient5_144,
    output := OriginalRow227TriangleData0100.coefficient6_144, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_146, Icur := OriginalRow227TriangleData0084.coefficient5_145,
    output := OriginalRow227TriangleData0100.coefficient6_145, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_147, Icur := OriginalRow227TriangleData0084.coefficient5_146,
    output := OriginalRow227TriangleData0100.coefficient6_146, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_148, Icur := OriginalRow227TriangleData0084.coefficient5_147,
    output := OriginalRow227TriangleData0100.coefficient6_147, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_149, Icur := OriginalRow227TriangleData0084.coefficient5_148,
    output := OriginalRow227TriangleData0100.coefficient6_148, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_150, Icur := OriginalRow227TriangleData0084.coefficient5_149,
    output := OriginalRow227TriangleData0100.coefficient6_149, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_151, Icur := OriginalRow227TriangleData0084.coefficient5_150,
    output := OriginalRow227TriangleData0100.coefficient6_150, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_152, Icur := OriginalRow227TriangleData0084.coefficient5_151,
    output := OriginalRow227TriangleData0100.coefficient6_151, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_153, Icur := OriginalRow227TriangleData0084.coefficient5_152,
    output := OriginalRow227TriangleData0100.coefficient6_152, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_154, Icur := OriginalRow227TriangleData0084.coefficient5_153,
    output := OriginalRow227TriangleData0100.coefficient6_153, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_155, Icur := OriginalRow227TriangleData0084.coefficient5_154,
    output := OriginalRow227TriangleData0100.coefficient6_154, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_156, Icur := OriginalRow227TriangleData0084.coefficient5_155,
    output := OriginalRow227TriangleData0100.coefficient6_155, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_157, Icur := OriginalRow227TriangleData0084.coefficient5_156,
    output := OriginalRow227TriangleData0100.coefficient6_156, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_158, Icur := OriginalRow227TriangleData0084.coefficient5_157,
    output := OriginalRow227TriangleData0100.coefficient6_157, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_159, Icur := OriginalRow227TriangleData0084.coefficient5_158,
    output := OriginalRow227TriangleData0100.coefficient6_158, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_160, Icur := OriginalRow227TriangleData0084.coefficient5_159,
    output := OriginalRow227TriangleData0100.coefficient6_159, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_161, Icur := OriginalRow227TriangleData0084.coefficient5_160,
    output := OriginalRow227TriangleData0100.coefficient6_160, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_162, Icur := OriginalRow227TriangleData0084.coefficient5_161,
    output := OriginalRow227TriangleData0100.coefficient6_161, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0084.coefficient5_163, Icur := OriginalRow227TriangleData0084.coefficient5_162,
    output := OriginalRow227TriangleData0100.coefficient6_162, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0085.coefficient5_164, Icur := OriginalRow227TriangleData0084.coefficient5_163,
    output := OriginalRow227TriangleData0100.coefficient6_163, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0085.coefficient5_165, Icur := OriginalRow227TriangleData0085.coefficient5_164,
    output := OriginalRow227TriangleData0100.coefficient6_164, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0084

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0084.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
