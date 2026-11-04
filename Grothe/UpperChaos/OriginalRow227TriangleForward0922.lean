import Grothe.UpperChaos.OriginalRow227TriangleData0926
import Grothe.UpperChaos.OriginalRow227TriangleData0927
import Grothe.UpperChaos.OriginalRow227TriangleData0938
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0922
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_130, Icur := OriginalRow227TriangleData0926.coefficient65_129,
    output := OriginalRow227TriangleData0938.coefficient66_129, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_131, Icur := OriginalRow227TriangleData0926.coefficient65_130,
    output := OriginalRow227TriangleData0938.coefficient66_130, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_132, Icur := OriginalRow227TriangleData0926.coefficient65_131,
    output := OriginalRow227TriangleData0938.coefficient66_131, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_133, Icur := OriginalRow227TriangleData0926.coefficient65_132,
    output := OriginalRow227TriangleData0938.coefficient66_132, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_134, Icur := OriginalRow227TriangleData0926.coefficient65_133,
    output := OriginalRow227TriangleData0938.coefficient66_133, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_135, Icur := OriginalRow227TriangleData0926.coefficient65_134,
    output := OriginalRow227TriangleData0938.coefficient66_134, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_136, Icur := OriginalRow227TriangleData0926.coefficient65_135,
    output := OriginalRow227TriangleData0938.coefficient66_135, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_137, Icur := OriginalRow227TriangleData0926.coefficient65_136,
    output := OriginalRow227TriangleData0938.coefficient66_136, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_138, Icur := OriginalRow227TriangleData0926.coefficient65_137,
    output := OriginalRow227TriangleData0938.coefficient66_137, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_139, Icur := OriginalRow227TriangleData0926.coefficient65_138,
    output := OriginalRow227TriangleData0938.coefficient66_138, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_140, Icur := OriginalRow227TriangleData0926.coefficient65_139,
    output := OriginalRow227TriangleData0938.coefficient66_139, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_141, Icur := OriginalRow227TriangleData0926.coefficient65_140,
    output := OriginalRow227TriangleData0938.coefficient66_140, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_142, Icur := OriginalRow227TriangleData0926.coefficient65_141,
    output := OriginalRow227TriangleData0938.coefficient66_141, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_143, Icur := OriginalRow227TriangleData0926.coefficient65_142,
    output := OriginalRow227TriangleData0938.coefficient66_142, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_144, Icur := OriginalRow227TriangleData0926.coefficient65_143,
    output := OriginalRow227TriangleData0938.coefficient66_143, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_145, Icur := OriginalRow227TriangleData0926.coefficient65_144,
    output := OriginalRow227TriangleData0938.coefficient66_144, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_146, Icur := OriginalRow227TriangleData0926.coefficient65_145,
    output := OriginalRow227TriangleData0938.coefficient66_145, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_147, Icur := OriginalRow227TriangleData0926.coefficient65_146,
    output := OriginalRow227TriangleData0938.coefficient66_146, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_148, Icur := OriginalRow227TriangleData0926.coefficient65_147,
    output := OriginalRow227TriangleData0938.coefficient66_147, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_149, Icur := OriginalRow227TriangleData0926.coefficient65_148,
    output := OriginalRow227TriangleData0938.coefficient66_148, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_150, Icur := OriginalRow227TriangleData0926.coefficient65_149,
    output := OriginalRow227TriangleData0938.coefficient66_149, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_151, Icur := OriginalRow227TriangleData0926.coefficient65_150,
    output := OriginalRow227TriangleData0938.coefficient66_150, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_152, Icur := OriginalRow227TriangleData0926.coefficient65_151,
    output := OriginalRow227TriangleData0938.coefficient66_151, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_153, Icur := OriginalRow227TriangleData0926.coefficient65_152,
    output := OriginalRow227TriangleData0938.coefficient66_152, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_154, Icur := OriginalRow227TriangleData0926.coefficient65_153,
    output := OriginalRow227TriangleData0938.coefficient66_153, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_155, Icur := OriginalRow227TriangleData0926.coefficient65_154,
    output := OriginalRow227TriangleData0938.coefficient66_154, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_156, Icur := OriginalRow227TriangleData0926.coefficient65_155,
    output := OriginalRow227TriangleData0938.coefficient66_155, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_157, Icur := OriginalRow227TriangleData0926.coefficient65_156,
    output := OriginalRow227TriangleData0938.coefficient66_156, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_158, Icur := OriginalRow227TriangleData0926.coefficient65_157,
    output := OriginalRow227TriangleData0938.coefficient66_157, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0926.coefficient65_159, Icur := OriginalRow227TriangleData0926.coefficient65_158,
    output := OriginalRow227TriangleData0938.coefficient66_158, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0927.coefficient65_160, Icur := OriginalRow227TriangleData0926.coefficient65_159,
    output := OriginalRow227TriangleData0938.coefficient66_159, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0927.coefficient65_161, Icur := OriginalRow227TriangleData0927.coefficient65_160,
    output := OriginalRow227TriangleData0938.coefficient66_160, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0922

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0922.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
