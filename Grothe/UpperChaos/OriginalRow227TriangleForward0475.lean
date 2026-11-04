import Grothe.UpperChaos.OriginalRow227TriangleData0477
import Grothe.UpperChaos.OriginalRow227TriangleData0478
import Grothe.UpperChaos.OriginalRow227TriangleData0491
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0475
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_128, Icur := OriginalRow227TriangleData0477.coefficient31_127,
    output := OriginalRow227TriangleData0491.coefficient32_127, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_129, Icur := OriginalRow227TriangleData0477.coefficient31_128,
    output := OriginalRow227TriangleData0491.coefficient32_128, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_130, Icur := OriginalRow227TriangleData0477.coefficient31_129,
    output := OriginalRow227TriangleData0491.coefficient32_129, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_131, Icur := OriginalRow227TriangleData0477.coefficient31_130,
    output := OriginalRow227TriangleData0491.coefficient32_130, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_132, Icur := OriginalRow227TriangleData0477.coefficient31_131,
    output := OriginalRow227TriangleData0491.coefficient32_131, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_133, Icur := OriginalRow227TriangleData0477.coefficient31_132,
    output := OriginalRow227TriangleData0491.coefficient32_132, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_134, Icur := OriginalRow227TriangleData0477.coefficient31_133,
    output := OriginalRow227TriangleData0491.coefficient32_133, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_135, Icur := OriginalRow227TriangleData0477.coefficient31_134,
    output := OriginalRow227TriangleData0491.coefficient32_134, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_136, Icur := OriginalRow227TriangleData0477.coefficient31_135,
    output := OriginalRow227TriangleData0491.coefficient32_135, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_137, Icur := OriginalRow227TriangleData0477.coefficient31_136,
    output := OriginalRow227TriangleData0491.coefficient32_136, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_138, Icur := OriginalRow227TriangleData0477.coefficient31_137,
    output := OriginalRow227TriangleData0491.coefficient32_137, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_139, Icur := OriginalRow227TriangleData0477.coefficient31_138,
    output := OriginalRow227TriangleData0491.coefficient32_138, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_140, Icur := OriginalRow227TriangleData0477.coefficient31_139,
    output := OriginalRow227TriangleData0491.coefficient32_139, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_141, Icur := OriginalRow227TriangleData0477.coefficient31_140,
    output := OriginalRow227TriangleData0491.coefficient32_140, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_142, Icur := OriginalRow227TriangleData0477.coefficient31_141,
    output := OriginalRow227TriangleData0491.coefficient32_141, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_143, Icur := OriginalRow227TriangleData0477.coefficient31_142,
    output := OriginalRow227TriangleData0491.coefficient32_142, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_144, Icur := OriginalRow227TriangleData0477.coefficient31_143,
    output := OriginalRow227TriangleData0491.coefficient32_143, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_145, Icur := OriginalRow227TriangleData0477.coefficient31_144,
    output := OriginalRow227TriangleData0491.coefficient32_144, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_146, Icur := OriginalRow227TriangleData0477.coefficient31_145,
    output := OriginalRow227TriangleData0491.coefficient32_145, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_147, Icur := OriginalRow227TriangleData0477.coefficient31_146,
    output := OriginalRow227TriangleData0491.coefficient32_146, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_148, Icur := OriginalRow227TriangleData0477.coefficient31_147,
    output := OriginalRow227TriangleData0491.coefficient32_147, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_149, Icur := OriginalRow227TriangleData0477.coefficient31_148,
    output := OriginalRow227TriangleData0491.coefficient32_148, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_150, Icur := OriginalRow227TriangleData0477.coefficient31_149,
    output := OriginalRow227TriangleData0491.coefficient32_149, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_151, Icur := OriginalRow227TriangleData0477.coefficient31_150,
    output := OriginalRow227TriangleData0491.coefficient32_150, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_152, Icur := OriginalRow227TriangleData0477.coefficient31_151,
    output := OriginalRow227TriangleData0491.coefficient32_151, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_153, Icur := OriginalRow227TriangleData0477.coefficient31_152,
    output := OriginalRow227TriangleData0491.coefficient32_152, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_154, Icur := OriginalRow227TriangleData0477.coefficient31_153,
    output := OriginalRow227TriangleData0491.coefficient32_153, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_155, Icur := OriginalRow227TriangleData0477.coefficient31_154,
    output := OriginalRow227TriangleData0491.coefficient32_154, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_156, Icur := OriginalRow227TriangleData0477.coefficient31_155,
    output := OriginalRow227TriangleData0491.coefficient32_155, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0477.coefficient31_157, Icur := OriginalRow227TriangleData0477.coefficient31_156,
    output := OriginalRow227TriangleData0491.coefficient32_156, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0478.coefficient31_158, Icur := OriginalRow227TriangleData0477.coefficient31_157,
    output := OriginalRow227TriangleData0491.coefficient32_157, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0478.coefficient31_159, Icur := OriginalRow227TriangleData0478.coefficient31_158,
    output := OriginalRow227TriangleData0491.coefficient32_158, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0475

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0475.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
