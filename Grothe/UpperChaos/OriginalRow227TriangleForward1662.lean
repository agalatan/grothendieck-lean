import Grothe.UpperChaos.OriginalRow227TriangleData1671
import Grothe.UpperChaos.OriginalRow227TriangleData1672
import Grothe.UpperChaos.OriginalRow227TriangleData1678
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1662
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_142, Icur := OriginalRow227TriangleData1671.coefficient141_141,
    output := OriginalRow227TriangleData1678.coefficient142_141, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_143, Icur := OriginalRow227TriangleData1671.coefficient141_142,
    output := OriginalRow227TriangleData1678.coefficient142_142, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_144, Icur := OriginalRow227TriangleData1671.coefficient141_143,
    output := OriginalRow227TriangleData1678.coefficient142_143, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_145, Icur := OriginalRow227TriangleData1671.coefficient141_144,
    output := OriginalRow227TriangleData1678.coefficient142_144, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_146, Icur := OriginalRow227TriangleData1671.coefficient141_145,
    output := OriginalRow227TriangleData1678.coefficient142_145, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_147, Icur := OriginalRow227TriangleData1671.coefficient141_146,
    output := OriginalRow227TriangleData1678.coefficient142_146, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_148, Icur := OriginalRow227TriangleData1671.coefficient141_147,
    output := OriginalRow227TriangleData1678.coefficient142_147, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_149, Icur := OriginalRow227TriangleData1671.coefficient141_148,
    output := OriginalRow227TriangleData1678.coefficient142_148, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_150, Icur := OriginalRow227TriangleData1671.coefficient141_149,
    output := OriginalRow227TriangleData1678.coefficient142_149, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_151, Icur := OriginalRow227TriangleData1671.coefficient141_150,
    output := OriginalRow227TriangleData1678.coefficient142_150, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_152, Icur := OriginalRow227TriangleData1671.coefficient141_151,
    output := OriginalRow227TriangleData1678.coefficient142_151, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_153, Icur := OriginalRow227TriangleData1671.coefficient141_152,
    output := OriginalRow227TriangleData1678.coefficient142_152, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_154, Icur := OriginalRow227TriangleData1671.coefficient141_153,
    output := OriginalRow227TriangleData1678.coefficient142_153, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_155, Icur := OriginalRow227TriangleData1671.coefficient141_154,
    output := OriginalRow227TriangleData1678.coefficient142_154, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_156, Icur := OriginalRow227TriangleData1671.coefficient141_155,
    output := OriginalRow227TriangleData1678.coefficient142_155, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_157, Icur := OriginalRow227TriangleData1671.coefficient141_156,
    output := OriginalRow227TriangleData1678.coefficient142_156, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_158, Icur := OriginalRow227TriangleData1671.coefficient141_157,
    output := OriginalRow227TriangleData1678.coefficient142_157, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_159, Icur := OriginalRow227TriangleData1671.coefficient141_158,
    output := OriginalRow227TriangleData1678.coefficient142_158, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_160, Icur := OriginalRow227TriangleData1671.coefficient141_159,
    output := OriginalRow227TriangleData1678.coefficient142_159, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_161, Icur := OriginalRow227TriangleData1671.coefficient141_160,
    output := OriginalRow227TriangleData1678.coefficient142_160, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_162, Icur := OriginalRow227TriangleData1671.coefficient141_161,
    output := OriginalRow227TriangleData1678.coefficient142_161, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_163, Icur := OriginalRow227TriangleData1671.coefficient141_162,
    output := OriginalRow227TriangleData1678.coefficient142_162, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_164, Icur := OriginalRow227TriangleData1671.coefficient141_163,
    output := OriginalRow227TriangleData1678.coefficient142_163, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_165, Icur := OriginalRow227TriangleData1671.coefficient141_164,
    output := OriginalRow227TriangleData1678.coefficient142_164, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_166, Icur := OriginalRow227TriangleData1671.coefficient141_165,
    output := OriginalRow227TriangleData1678.coefficient142_165, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_167, Icur := OriginalRow227TriangleData1671.coefficient141_166,
    output := OriginalRow227TriangleData1678.coefficient142_166, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_168, Icur := OriginalRow227TriangleData1671.coefficient141_167,
    output := OriginalRow227TriangleData1678.coefficient142_167, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_169, Icur := OriginalRow227TriangleData1671.coefficient141_168,
    output := OriginalRow227TriangleData1678.coefficient142_168, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_170, Icur := OriginalRow227TriangleData1671.coefficient141_169,
    output := OriginalRow227TriangleData1678.coefficient142_169, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1671.coefficient141_171, Icur := OriginalRow227TriangleData1671.coefficient141_170,
    output := OriginalRow227TriangleData1678.coefficient142_170, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1672.coefficient141_172, Icur := OriginalRow227TriangleData1671.coefficient141_171,
    output := OriginalRow227TriangleData1678.coefficient142_171, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1672.coefficient141_173, Icur := OriginalRow227TriangleData1672.coefficient141_172,
    output := OriginalRow227TriangleData1678.coefficient142_172, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1662

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1662.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
