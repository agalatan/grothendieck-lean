import Grothe.UpperChaos.OriginalRow227TriangleData1692
import Grothe.UpperChaos.OriginalRow227TriangleData1693
import Grothe.UpperChaos.OriginalRow227TriangleData1699
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1683
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_145, Icur := OriginalRow227TriangleData1692.coefficient144_144,
    output := OriginalRow227TriangleData1699.coefficient145_144, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_146, Icur := OriginalRow227TriangleData1692.coefficient144_145,
    output := OriginalRow227TriangleData1699.coefficient145_145, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_147, Icur := OriginalRow227TriangleData1692.coefficient144_146,
    output := OriginalRow227TriangleData1699.coefficient145_146, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_148, Icur := OriginalRow227TriangleData1692.coefficient144_147,
    output := OriginalRow227TriangleData1699.coefficient145_147, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_149, Icur := OriginalRow227TriangleData1692.coefficient144_148,
    output := OriginalRow227TriangleData1699.coefficient145_148, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_150, Icur := OriginalRow227TriangleData1692.coefficient144_149,
    output := OriginalRow227TriangleData1699.coefficient145_149, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_151, Icur := OriginalRow227TriangleData1692.coefficient144_150,
    output := OriginalRow227TriangleData1699.coefficient145_150, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_152, Icur := OriginalRow227TriangleData1692.coefficient144_151,
    output := OriginalRow227TriangleData1699.coefficient145_151, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_153, Icur := OriginalRow227TriangleData1692.coefficient144_152,
    output := OriginalRow227TriangleData1699.coefficient145_152, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_154, Icur := OriginalRow227TriangleData1692.coefficient144_153,
    output := OriginalRow227TriangleData1699.coefficient145_153, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_155, Icur := OriginalRow227TriangleData1692.coefficient144_154,
    output := OriginalRow227TriangleData1699.coefficient145_154, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_156, Icur := OriginalRow227TriangleData1692.coefficient144_155,
    output := OriginalRow227TriangleData1699.coefficient145_155, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_157, Icur := OriginalRow227TriangleData1692.coefficient144_156,
    output := OriginalRow227TriangleData1699.coefficient145_156, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_158, Icur := OriginalRow227TriangleData1692.coefficient144_157,
    output := OriginalRow227TriangleData1699.coefficient145_157, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_159, Icur := OriginalRow227TriangleData1692.coefficient144_158,
    output := OriginalRow227TriangleData1699.coefficient145_158, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_160, Icur := OriginalRow227TriangleData1692.coefficient144_159,
    output := OriginalRow227TriangleData1699.coefficient145_159, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_161, Icur := OriginalRow227TriangleData1692.coefficient144_160,
    output := OriginalRow227TriangleData1699.coefficient145_160, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_162, Icur := OriginalRow227TriangleData1692.coefficient144_161,
    output := OriginalRow227TriangleData1699.coefficient145_161, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_163, Icur := OriginalRow227TriangleData1692.coefficient144_162,
    output := OriginalRow227TriangleData1699.coefficient145_162, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_164, Icur := OriginalRow227TriangleData1692.coefficient144_163,
    output := OriginalRow227TriangleData1699.coefficient145_163, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_165, Icur := OriginalRow227TriangleData1692.coefficient144_164,
    output := OriginalRow227TriangleData1699.coefficient145_164, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_166, Icur := OriginalRow227TriangleData1692.coefficient144_165,
    output := OriginalRow227TriangleData1699.coefficient145_165, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_167, Icur := OriginalRow227TriangleData1692.coefficient144_166,
    output := OriginalRow227TriangleData1699.coefficient145_166, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_168, Icur := OriginalRow227TriangleData1692.coefficient144_167,
    output := OriginalRow227TriangleData1699.coefficient145_167, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_169, Icur := OriginalRow227TriangleData1692.coefficient144_168,
    output := OriginalRow227TriangleData1699.coefficient145_168, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_170, Icur := OriginalRow227TriangleData1692.coefficient144_169,
    output := OriginalRow227TriangleData1699.coefficient145_169, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_171, Icur := OriginalRow227TriangleData1692.coefficient144_170,
    output := OriginalRow227TriangleData1699.coefficient145_170, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_172, Icur := OriginalRow227TriangleData1692.coefficient144_171,
    output := OriginalRow227TriangleData1699.coefficient145_171, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_173, Icur := OriginalRow227TriangleData1692.coefficient144_172,
    output := OriginalRow227TriangleData1699.coefficient145_172, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1692.coefficient144_174, Icur := OriginalRow227TriangleData1692.coefficient144_173,
    output := OriginalRow227TriangleData1699.coefficient145_173, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1693.coefficient144_175, Icur := OriginalRow227TriangleData1692.coefficient144_174,
    output := OriginalRow227TriangleData1699.coefficient145_174, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1693.coefficient144_176, Icur := OriginalRow227TriangleData1693.coefficient144_175,
    output := OriginalRow227TriangleData1699.coefficient145_175, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1683

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1683.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
