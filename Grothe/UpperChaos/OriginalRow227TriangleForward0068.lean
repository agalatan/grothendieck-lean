import Grothe.UpperChaos.OriginalRow227TriangleData0068
import Grothe.UpperChaos.OriginalRow227TriangleData0069
import Grothe.UpperChaos.OriginalRow227TriangleData0084
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0068
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_133, Icur := OriginalRow227TriangleData0068.coefficient4_132,
    output := OriginalRow227TriangleData0084.coefficient5_132, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_134, Icur := OriginalRow227TriangleData0068.coefficient4_133,
    output := OriginalRow227TriangleData0084.coefficient5_133, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_135, Icur := OriginalRow227TriangleData0068.coefficient4_134,
    output := OriginalRow227TriangleData0084.coefficient5_134, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_136, Icur := OriginalRow227TriangleData0068.coefficient4_135,
    output := OriginalRow227TriangleData0084.coefficient5_135, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_137, Icur := OriginalRow227TriangleData0068.coefficient4_136,
    output := OriginalRow227TriangleData0084.coefficient5_136, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_138, Icur := OriginalRow227TriangleData0068.coefficient4_137,
    output := OriginalRow227TriangleData0084.coefficient5_137, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_139, Icur := OriginalRow227TriangleData0068.coefficient4_138,
    output := OriginalRow227TriangleData0084.coefficient5_138, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_140, Icur := OriginalRow227TriangleData0068.coefficient4_139,
    output := OriginalRow227TriangleData0084.coefficient5_139, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_141, Icur := OriginalRow227TriangleData0068.coefficient4_140,
    output := OriginalRow227TriangleData0084.coefficient5_140, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_142, Icur := OriginalRow227TriangleData0068.coefficient4_141,
    output := OriginalRow227TriangleData0084.coefficient5_141, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_143, Icur := OriginalRow227TriangleData0068.coefficient4_142,
    output := OriginalRow227TriangleData0084.coefficient5_142, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_144, Icur := OriginalRow227TriangleData0068.coefficient4_143,
    output := OriginalRow227TriangleData0084.coefficient5_143, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_145, Icur := OriginalRow227TriangleData0068.coefficient4_144,
    output := OriginalRow227TriangleData0084.coefficient5_144, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_146, Icur := OriginalRow227TriangleData0068.coefficient4_145,
    output := OriginalRow227TriangleData0084.coefficient5_145, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_147, Icur := OriginalRow227TriangleData0068.coefficient4_146,
    output := OriginalRow227TriangleData0084.coefficient5_146, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_148, Icur := OriginalRow227TriangleData0068.coefficient4_147,
    output := OriginalRow227TriangleData0084.coefficient5_147, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_149, Icur := OriginalRow227TriangleData0068.coefficient4_148,
    output := OriginalRow227TriangleData0084.coefficient5_148, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_150, Icur := OriginalRow227TriangleData0068.coefficient4_149,
    output := OriginalRow227TriangleData0084.coefficient5_149, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_151, Icur := OriginalRow227TriangleData0068.coefficient4_150,
    output := OriginalRow227TriangleData0084.coefficient5_150, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_152, Icur := OriginalRow227TriangleData0068.coefficient4_151,
    output := OriginalRow227TriangleData0084.coefficient5_151, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_153, Icur := OriginalRow227TriangleData0068.coefficient4_152,
    output := OriginalRow227TriangleData0084.coefficient5_152, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_154, Icur := OriginalRow227TriangleData0068.coefficient4_153,
    output := OriginalRow227TriangleData0084.coefficient5_153, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_155, Icur := OriginalRow227TriangleData0068.coefficient4_154,
    output := OriginalRow227TriangleData0084.coefficient5_154, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_156, Icur := OriginalRow227TriangleData0068.coefficient4_155,
    output := OriginalRow227TriangleData0084.coefficient5_155, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_157, Icur := OriginalRow227TriangleData0068.coefficient4_156,
    output := OriginalRow227TriangleData0084.coefficient5_156, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_158, Icur := OriginalRow227TriangleData0068.coefficient4_157,
    output := OriginalRow227TriangleData0084.coefficient5_157, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_159, Icur := OriginalRow227TriangleData0068.coefficient4_158,
    output := OriginalRow227TriangleData0084.coefficient5_158, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_160, Icur := OriginalRow227TriangleData0068.coefficient4_159,
    output := OriginalRow227TriangleData0084.coefficient5_159, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_161, Icur := OriginalRow227TriangleData0068.coefficient4_160,
    output := OriginalRow227TriangleData0084.coefficient5_160, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0068.coefficient4_162, Icur := OriginalRow227TriangleData0068.coefficient4_161,
    output := OriginalRow227TriangleData0084.coefficient5_161, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0069.coefficient4_163, Icur := OriginalRow227TriangleData0068.coefficient4_162,
    output := OriginalRow227TriangleData0084.coefficient5_162, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0069.coefficient4_164, Icur := OriginalRow227TriangleData0069.coefficient4_163,
    output := OriginalRow227TriangleData0084.coefficient5_163, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0068

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0068.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
