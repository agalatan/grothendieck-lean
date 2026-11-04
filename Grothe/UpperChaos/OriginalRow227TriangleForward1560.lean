import Grothe.UpperChaos.OriginalRow227TriangleData1568
import Grothe.UpperChaos.OriginalRow227TriangleData1569
import Grothe.UpperChaos.OriginalRow227TriangleData1576
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1560
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_129, Icur := OriginalRow227TriangleData1568.coefficient128_128,
    output := OriginalRow227TriangleData1576.coefficient129_128, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_130, Icur := OriginalRow227TriangleData1568.coefficient128_129,
    output := OriginalRow227TriangleData1576.coefficient129_129, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_131, Icur := OriginalRow227TriangleData1568.coefficient128_130,
    output := OriginalRow227TriangleData1576.coefficient129_130, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_132, Icur := OriginalRow227TriangleData1568.coefficient128_131,
    output := OriginalRow227TriangleData1576.coefficient129_131, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_133, Icur := OriginalRow227TriangleData1568.coefficient128_132,
    output := OriginalRow227TriangleData1576.coefficient129_132, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_134, Icur := OriginalRow227TriangleData1568.coefficient128_133,
    output := OriginalRow227TriangleData1576.coefficient129_133, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_135, Icur := OriginalRow227TriangleData1568.coefficient128_134,
    output := OriginalRow227TriangleData1576.coefficient129_134, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_136, Icur := OriginalRow227TriangleData1568.coefficient128_135,
    output := OriginalRow227TriangleData1576.coefficient129_135, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_137, Icur := OriginalRow227TriangleData1568.coefficient128_136,
    output := OriginalRow227TriangleData1576.coefficient129_136, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_138, Icur := OriginalRow227TriangleData1568.coefficient128_137,
    output := OriginalRow227TriangleData1576.coefficient129_137, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_139, Icur := OriginalRow227TriangleData1568.coefficient128_138,
    output := OriginalRow227TriangleData1576.coefficient129_138, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_140, Icur := OriginalRow227TriangleData1568.coefficient128_139,
    output := OriginalRow227TriangleData1576.coefficient129_139, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_141, Icur := OriginalRow227TriangleData1568.coefficient128_140,
    output := OriginalRow227TriangleData1576.coefficient129_140, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_142, Icur := OriginalRow227TriangleData1568.coefficient128_141,
    output := OriginalRow227TriangleData1576.coefficient129_141, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_143, Icur := OriginalRow227TriangleData1568.coefficient128_142,
    output := OriginalRow227TriangleData1576.coefficient129_142, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_144, Icur := OriginalRow227TriangleData1568.coefficient128_143,
    output := OriginalRow227TriangleData1576.coefficient129_143, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_145, Icur := OriginalRow227TriangleData1568.coefficient128_144,
    output := OriginalRow227TriangleData1576.coefficient129_144, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_146, Icur := OriginalRow227TriangleData1568.coefficient128_145,
    output := OriginalRow227TriangleData1576.coefficient129_145, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_147, Icur := OriginalRow227TriangleData1568.coefficient128_146,
    output := OriginalRow227TriangleData1576.coefficient129_146, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_148, Icur := OriginalRow227TriangleData1568.coefficient128_147,
    output := OriginalRow227TriangleData1576.coefficient129_147, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_149, Icur := OriginalRow227TriangleData1568.coefficient128_148,
    output := OriginalRow227TriangleData1576.coefficient129_148, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_150, Icur := OriginalRow227TriangleData1568.coefficient128_149,
    output := OriginalRow227TriangleData1576.coefficient129_149, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_151, Icur := OriginalRow227TriangleData1568.coefficient128_150,
    output := OriginalRow227TriangleData1576.coefficient129_150, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_152, Icur := OriginalRow227TriangleData1568.coefficient128_151,
    output := OriginalRow227TriangleData1576.coefficient129_151, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_153, Icur := OriginalRow227TriangleData1568.coefficient128_152,
    output := OriginalRow227TriangleData1576.coefficient129_152, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_154, Icur := OriginalRow227TriangleData1568.coefficient128_153,
    output := OriginalRow227TriangleData1576.coefficient129_153, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_155, Icur := OriginalRow227TriangleData1568.coefficient128_154,
    output := OriginalRow227TriangleData1576.coefficient129_154, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_156, Icur := OriginalRow227TriangleData1568.coefficient128_155,
    output := OriginalRow227TriangleData1576.coefficient129_155, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_157, Icur := OriginalRow227TriangleData1568.coefficient128_156,
    output := OriginalRow227TriangleData1576.coefficient129_156, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1568.coefficient128_158, Icur := OriginalRow227TriangleData1568.coefficient128_157,
    output := OriginalRow227TriangleData1576.coefficient129_157, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_159, Icur := OriginalRow227TriangleData1568.coefficient128_158,
    output := OriginalRow227TriangleData1576.coefficient129_158, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_160, Icur := OriginalRow227TriangleData1569.coefficient128_159,
    output := OriginalRow227TriangleData1576.coefficient129_159, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1560

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1560.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
