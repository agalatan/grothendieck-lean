import Grothe.UpperChaos.OriginalRow227TriangleData1640
import Grothe.UpperChaos.OriginalRow227TriangleData1641
import Grothe.UpperChaos.OriginalRow227TriangleData1648
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1632
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_138, Icur := OriginalRow227TriangleData1640.coefficient137_137,
    output := OriginalRow227TriangleData1648.coefficient138_137, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_139, Icur := OriginalRow227TriangleData1640.coefficient137_138,
    output := OriginalRow227TriangleData1648.coefficient138_138, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_140, Icur := OriginalRow227TriangleData1640.coefficient137_139,
    output := OriginalRow227TriangleData1648.coefficient138_139, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_141, Icur := OriginalRow227TriangleData1640.coefficient137_140,
    output := OriginalRow227TriangleData1648.coefficient138_140, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_142, Icur := OriginalRow227TriangleData1640.coefficient137_141,
    output := OriginalRow227TriangleData1648.coefficient138_141, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_143, Icur := OriginalRow227TriangleData1640.coefficient137_142,
    output := OriginalRow227TriangleData1648.coefficient138_142, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_144, Icur := OriginalRow227TriangleData1640.coefficient137_143,
    output := OriginalRow227TriangleData1648.coefficient138_143, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_145, Icur := OriginalRow227TriangleData1640.coefficient137_144,
    output := OriginalRow227TriangleData1648.coefficient138_144, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_146, Icur := OriginalRow227TriangleData1640.coefficient137_145,
    output := OriginalRow227TriangleData1648.coefficient138_145, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_147, Icur := OriginalRow227TriangleData1640.coefficient137_146,
    output := OriginalRow227TriangleData1648.coefficient138_146, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_148, Icur := OriginalRow227TriangleData1640.coefficient137_147,
    output := OriginalRow227TriangleData1648.coefficient138_147, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_149, Icur := OriginalRow227TriangleData1640.coefficient137_148,
    output := OriginalRow227TriangleData1648.coefficient138_148, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_150, Icur := OriginalRow227TriangleData1640.coefficient137_149,
    output := OriginalRow227TriangleData1648.coefficient138_149, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_151, Icur := OriginalRow227TriangleData1640.coefficient137_150,
    output := OriginalRow227TriangleData1648.coefficient138_150, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_152, Icur := OriginalRow227TriangleData1640.coefficient137_151,
    output := OriginalRow227TriangleData1648.coefficient138_151, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_153, Icur := OriginalRow227TriangleData1640.coefficient137_152,
    output := OriginalRow227TriangleData1648.coefficient138_152, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_154, Icur := OriginalRow227TriangleData1640.coefficient137_153,
    output := OriginalRow227TriangleData1648.coefficient138_153, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_155, Icur := OriginalRow227TriangleData1640.coefficient137_154,
    output := OriginalRow227TriangleData1648.coefficient138_154, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_156, Icur := OriginalRow227TriangleData1640.coefficient137_155,
    output := OriginalRow227TriangleData1648.coefficient138_155, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_157, Icur := OriginalRow227TriangleData1640.coefficient137_156,
    output := OriginalRow227TriangleData1648.coefficient138_156, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_158, Icur := OriginalRow227TriangleData1640.coefficient137_157,
    output := OriginalRow227TriangleData1648.coefficient138_157, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_159, Icur := OriginalRow227TriangleData1640.coefficient137_158,
    output := OriginalRow227TriangleData1648.coefficient138_158, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_160, Icur := OriginalRow227TriangleData1640.coefficient137_159,
    output := OriginalRow227TriangleData1648.coefficient138_159, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_161, Icur := OriginalRow227TriangleData1640.coefficient137_160,
    output := OriginalRow227TriangleData1648.coefficient138_160, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_162, Icur := OriginalRow227TriangleData1640.coefficient137_161,
    output := OriginalRow227TriangleData1648.coefficient138_161, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_163, Icur := OriginalRow227TriangleData1640.coefficient137_162,
    output := OriginalRow227TriangleData1648.coefficient138_162, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_164, Icur := OriginalRow227TriangleData1640.coefficient137_163,
    output := OriginalRow227TriangleData1648.coefficient138_163, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_165, Icur := OriginalRow227TriangleData1640.coefficient137_164,
    output := OriginalRow227TriangleData1648.coefficient138_164, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_166, Icur := OriginalRow227TriangleData1640.coefficient137_165,
    output := OriginalRow227TriangleData1648.coefficient138_165, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1640.coefficient137_167, Icur := OriginalRow227TriangleData1640.coefficient137_166,
    output := OriginalRow227TriangleData1648.coefficient138_166, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1641.coefficient137_168, Icur := OriginalRow227TriangleData1640.coefficient137_167,
    output := OriginalRow227TriangleData1648.coefficient138_167, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1641.coefficient137_169, Icur := OriginalRow227TriangleData1641.coefficient137_168,
    output := OriginalRow227TriangleData1648.coefficient138_168, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1632

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1632.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
