import Grothe.UpperChaos.OriginalRow227TriangleData1393
import Grothe.UpperChaos.OriginalRow227TriangleData1394
import Grothe.UpperChaos.OriginalRow227TriangleData1402
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1386
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_141, Icur := OriginalRow227TriangleData1393.coefficient108_140,
    output := OriginalRow227TriangleData1402.coefficient109_140, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_142, Icur := OriginalRow227TriangleData1393.coefficient108_141,
    output := OriginalRow227TriangleData1402.coefficient109_141, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_143, Icur := OriginalRow227TriangleData1393.coefficient108_142,
    output := OriginalRow227TriangleData1402.coefficient109_142, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_144, Icur := OriginalRow227TriangleData1393.coefficient108_143,
    output := OriginalRow227TriangleData1402.coefficient109_143, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_145, Icur := OriginalRow227TriangleData1393.coefficient108_144,
    output := OriginalRow227TriangleData1402.coefficient109_144, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_146, Icur := OriginalRow227TriangleData1393.coefficient108_145,
    output := OriginalRow227TriangleData1402.coefficient109_145, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_147, Icur := OriginalRow227TriangleData1393.coefficient108_146,
    output := OriginalRow227TriangleData1402.coefficient109_146, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_148, Icur := OriginalRow227TriangleData1393.coefficient108_147,
    output := OriginalRow227TriangleData1402.coefficient109_147, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_149, Icur := OriginalRow227TriangleData1393.coefficient108_148,
    output := OriginalRow227TriangleData1402.coefficient109_148, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_150, Icur := OriginalRow227TriangleData1393.coefficient108_149,
    output := OriginalRow227TriangleData1402.coefficient109_149, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_151, Icur := OriginalRow227TriangleData1393.coefficient108_150,
    output := OriginalRow227TriangleData1402.coefficient109_150, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_152, Icur := OriginalRow227TriangleData1393.coefficient108_151,
    output := OriginalRow227TriangleData1402.coefficient109_151, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_153, Icur := OriginalRow227TriangleData1393.coefficient108_152,
    output := OriginalRow227TriangleData1402.coefficient109_152, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_154, Icur := OriginalRow227TriangleData1393.coefficient108_153,
    output := OriginalRow227TriangleData1402.coefficient109_153, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_155, Icur := OriginalRow227TriangleData1393.coefficient108_154,
    output := OriginalRow227TriangleData1402.coefficient109_154, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_156, Icur := OriginalRow227TriangleData1393.coefficient108_155,
    output := OriginalRow227TriangleData1402.coefficient109_155, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_157, Icur := OriginalRow227TriangleData1393.coefficient108_156,
    output := OriginalRow227TriangleData1402.coefficient109_156, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_158, Icur := OriginalRow227TriangleData1393.coefficient108_157,
    output := OriginalRow227TriangleData1402.coefficient109_157, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_159, Icur := OriginalRow227TriangleData1393.coefficient108_158,
    output := OriginalRow227TriangleData1402.coefficient109_158, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_160, Icur := OriginalRow227TriangleData1393.coefficient108_159,
    output := OriginalRow227TriangleData1402.coefficient109_159, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_161, Icur := OriginalRow227TriangleData1393.coefficient108_160,
    output := OriginalRow227TriangleData1402.coefficient109_160, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_162, Icur := OriginalRow227TriangleData1393.coefficient108_161,
    output := OriginalRow227TriangleData1402.coefficient109_161, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_163, Icur := OriginalRow227TriangleData1393.coefficient108_162,
    output := OriginalRow227TriangleData1402.coefficient109_162, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_164, Icur := OriginalRow227TriangleData1393.coefficient108_163,
    output := OriginalRow227TriangleData1402.coefficient109_163, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_165, Icur := OriginalRow227TriangleData1393.coefficient108_164,
    output := OriginalRow227TriangleData1402.coefficient109_164, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_166, Icur := OriginalRow227TriangleData1393.coefficient108_165,
    output := OriginalRow227TriangleData1402.coefficient109_165, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_167, Icur := OriginalRow227TriangleData1393.coefficient108_166,
    output := OriginalRow227TriangleData1402.coefficient109_166, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_168, Icur := OriginalRow227TriangleData1393.coefficient108_167,
    output := OriginalRow227TriangleData1402.coefficient109_167, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_169, Icur := OriginalRow227TriangleData1393.coefficient108_168,
    output := OriginalRow227TriangleData1402.coefficient109_168, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1393.coefficient108_170, Icur := OriginalRow227TriangleData1393.coefficient108_169,
    output := OriginalRow227TriangleData1402.coefficient109_169, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1394.coefficient108_171, Icur := OriginalRow227TriangleData1393.coefficient108_170,
    output := OriginalRow227TriangleData1402.coefficient109_170, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root109,
    Inext := OriginalRow227TriangleData1394.coefficient108_172, Icur := OriginalRow227TriangleData1394.coefficient108_171,
    output := OriginalRow227TriangleData1402.coefficient109_171, hC := OriginalRow227TriangleRoots03.root109_pos, hAC := OriginalRow227TriangleRoots03.product109_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1386

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1386.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
