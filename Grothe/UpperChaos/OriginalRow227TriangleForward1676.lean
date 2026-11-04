import Grothe.UpperChaos.OriginalRow227TriangleData1685
import Grothe.UpperChaos.OriginalRow227TriangleData1686
import Grothe.UpperChaos.OriginalRow227TriangleData1692
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1676
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_144, Icur := OriginalRow227TriangleData1685.coefficient143_143,
    output := OriginalRow227TriangleData1692.coefficient144_143, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_145, Icur := OriginalRow227TriangleData1685.coefficient143_144,
    output := OriginalRow227TriangleData1692.coefficient144_144, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_146, Icur := OriginalRow227TriangleData1685.coefficient143_145,
    output := OriginalRow227TriangleData1692.coefficient144_145, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_147, Icur := OriginalRow227TriangleData1685.coefficient143_146,
    output := OriginalRow227TriangleData1692.coefficient144_146, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_148, Icur := OriginalRow227TriangleData1685.coefficient143_147,
    output := OriginalRow227TriangleData1692.coefficient144_147, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_149, Icur := OriginalRow227TriangleData1685.coefficient143_148,
    output := OriginalRow227TriangleData1692.coefficient144_148, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_150, Icur := OriginalRow227TriangleData1685.coefficient143_149,
    output := OriginalRow227TriangleData1692.coefficient144_149, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_151, Icur := OriginalRow227TriangleData1685.coefficient143_150,
    output := OriginalRow227TriangleData1692.coefficient144_150, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_152, Icur := OriginalRow227TriangleData1685.coefficient143_151,
    output := OriginalRow227TriangleData1692.coefficient144_151, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_153, Icur := OriginalRow227TriangleData1685.coefficient143_152,
    output := OriginalRow227TriangleData1692.coefficient144_152, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_154, Icur := OriginalRow227TriangleData1685.coefficient143_153,
    output := OriginalRow227TriangleData1692.coefficient144_153, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_155, Icur := OriginalRow227TriangleData1685.coefficient143_154,
    output := OriginalRow227TriangleData1692.coefficient144_154, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_156, Icur := OriginalRow227TriangleData1685.coefficient143_155,
    output := OriginalRow227TriangleData1692.coefficient144_155, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_157, Icur := OriginalRow227TriangleData1685.coefficient143_156,
    output := OriginalRow227TriangleData1692.coefficient144_156, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_158, Icur := OriginalRow227TriangleData1685.coefficient143_157,
    output := OriginalRow227TriangleData1692.coefficient144_157, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_159, Icur := OriginalRow227TriangleData1685.coefficient143_158,
    output := OriginalRow227TriangleData1692.coefficient144_158, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_160, Icur := OriginalRow227TriangleData1685.coefficient143_159,
    output := OriginalRow227TriangleData1692.coefficient144_159, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_161, Icur := OriginalRow227TriangleData1685.coefficient143_160,
    output := OriginalRow227TriangleData1692.coefficient144_160, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_162, Icur := OriginalRow227TriangleData1685.coefficient143_161,
    output := OriginalRow227TriangleData1692.coefficient144_161, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_163, Icur := OriginalRow227TriangleData1685.coefficient143_162,
    output := OriginalRow227TriangleData1692.coefficient144_162, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_164, Icur := OriginalRow227TriangleData1685.coefficient143_163,
    output := OriginalRow227TriangleData1692.coefficient144_163, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_165, Icur := OriginalRow227TriangleData1685.coefficient143_164,
    output := OriginalRow227TriangleData1692.coefficient144_164, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_166, Icur := OriginalRow227TriangleData1685.coefficient143_165,
    output := OriginalRow227TriangleData1692.coefficient144_165, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_167, Icur := OriginalRow227TriangleData1685.coefficient143_166,
    output := OriginalRow227TriangleData1692.coefficient144_166, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_168, Icur := OriginalRow227TriangleData1685.coefficient143_167,
    output := OriginalRow227TriangleData1692.coefficient144_167, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_169, Icur := OriginalRow227TriangleData1685.coefficient143_168,
    output := OriginalRow227TriangleData1692.coefficient144_168, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_170, Icur := OriginalRow227TriangleData1685.coefficient143_169,
    output := OriginalRow227TriangleData1692.coefficient144_169, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_171, Icur := OriginalRow227TriangleData1685.coefficient143_170,
    output := OriginalRow227TriangleData1692.coefficient144_170, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_172, Icur := OriginalRow227TriangleData1685.coefficient143_171,
    output := OriginalRow227TriangleData1692.coefficient144_171, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1685.coefficient143_173, Icur := OriginalRow227TriangleData1685.coefficient143_172,
    output := OriginalRow227TriangleData1692.coefficient144_172, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_174, Icur := OriginalRow227TriangleData1685.coefficient143_173,
    output := OriginalRow227TriangleData1692.coefficient144_173, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1686.coefficient143_175, Icur := OriginalRow227TriangleData1686.coefficient143_174,
    output := OriginalRow227TriangleData1692.coefficient144_174, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1676

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1676.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
