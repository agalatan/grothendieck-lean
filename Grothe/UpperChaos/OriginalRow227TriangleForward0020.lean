import Grothe.UpperChaos.OriginalRow227TriangleData0020
import Grothe.UpperChaos.OriginalRow227TriangleData0021
import Grothe.UpperChaos.OriginalRow227TriangleData0036
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0020
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_130, Icur := OriginalRow227TriangleData0020.coefficient1_129,
    output := OriginalRow227TriangleData0036.coefficient2_129, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_131, Icur := OriginalRow227TriangleData0020.coefficient1_130,
    output := OriginalRow227TriangleData0036.coefficient2_130, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_132, Icur := OriginalRow227TriangleData0020.coefficient1_131,
    output := OriginalRow227TriangleData0036.coefficient2_131, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_133, Icur := OriginalRow227TriangleData0020.coefficient1_132,
    output := OriginalRow227TriangleData0036.coefficient2_132, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_134, Icur := OriginalRow227TriangleData0020.coefficient1_133,
    output := OriginalRow227TriangleData0036.coefficient2_133, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_135, Icur := OriginalRow227TriangleData0020.coefficient1_134,
    output := OriginalRow227TriangleData0036.coefficient2_134, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_136, Icur := OriginalRow227TriangleData0020.coefficient1_135,
    output := OriginalRow227TriangleData0036.coefficient2_135, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_137, Icur := OriginalRow227TriangleData0020.coefficient1_136,
    output := OriginalRow227TriangleData0036.coefficient2_136, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_138, Icur := OriginalRow227TriangleData0020.coefficient1_137,
    output := OriginalRow227TriangleData0036.coefficient2_137, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_139, Icur := OriginalRow227TriangleData0020.coefficient1_138,
    output := OriginalRow227TriangleData0036.coefficient2_138, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_140, Icur := OriginalRow227TriangleData0020.coefficient1_139,
    output := OriginalRow227TriangleData0036.coefficient2_139, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_141, Icur := OriginalRow227TriangleData0020.coefficient1_140,
    output := OriginalRow227TriangleData0036.coefficient2_140, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_142, Icur := OriginalRow227TriangleData0020.coefficient1_141,
    output := OriginalRow227TriangleData0036.coefficient2_141, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_143, Icur := OriginalRow227TriangleData0020.coefficient1_142,
    output := OriginalRow227TriangleData0036.coefficient2_142, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_144, Icur := OriginalRow227TriangleData0020.coefficient1_143,
    output := OriginalRow227TriangleData0036.coefficient2_143, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_145, Icur := OriginalRow227TriangleData0020.coefficient1_144,
    output := OriginalRow227TriangleData0036.coefficient2_144, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_146, Icur := OriginalRow227TriangleData0020.coefficient1_145,
    output := OriginalRow227TriangleData0036.coefficient2_145, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_147, Icur := OriginalRow227TriangleData0020.coefficient1_146,
    output := OriginalRow227TriangleData0036.coefficient2_146, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_148, Icur := OriginalRow227TriangleData0020.coefficient1_147,
    output := OriginalRow227TriangleData0036.coefficient2_147, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_149, Icur := OriginalRow227TriangleData0020.coefficient1_148,
    output := OriginalRow227TriangleData0036.coefficient2_148, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_150, Icur := OriginalRow227TriangleData0020.coefficient1_149,
    output := OriginalRow227TriangleData0036.coefficient2_149, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_151, Icur := OriginalRow227TriangleData0020.coefficient1_150,
    output := OriginalRow227TriangleData0036.coefficient2_150, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_152, Icur := OriginalRow227TriangleData0020.coefficient1_151,
    output := OriginalRow227TriangleData0036.coefficient2_151, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_153, Icur := OriginalRow227TriangleData0020.coefficient1_152,
    output := OriginalRow227TriangleData0036.coefficient2_152, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_154, Icur := OriginalRow227TriangleData0020.coefficient1_153,
    output := OriginalRow227TriangleData0036.coefficient2_153, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_155, Icur := OriginalRow227TriangleData0020.coefficient1_154,
    output := OriginalRow227TriangleData0036.coefficient2_154, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_156, Icur := OriginalRow227TriangleData0020.coefficient1_155,
    output := OriginalRow227TriangleData0036.coefficient2_155, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_157, Icur := OriginalRow227TriangleData0020.coefficient1_156,
    output := OriginalRow227TriangleData0036.coefficient2_156, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_158, Icur := OriginalRow227TriangleData0020.coefficient1_157,
    output := OriginalRow227TriangleData0036.coefficient2_157, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0020.coefficient1_159, Icur := OriginalRow227TriangleData0020.coefficient1_158,
    output := OriginalRow227TriangleData0036.coefficient2_158, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_160, Icur := OriginalRow227TriangleData0020.coefficient1_159,
    output := OriginalRow227TriangleData0036.coefficient2_159, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_161, Icur := OriginalRow227TriangleData0021.coefficient1_160,
    output := OriginalRow227TriangleData0036.coefficient2_160, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0020

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0020.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
