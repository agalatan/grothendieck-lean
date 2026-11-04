import Grothe.UpperChaos.OriginalRow227TriangleData1373
import Grothe.UpperChaos.OriginalRow227TriangleData1374
import Grothe.UpperChaos.OriginalRow227TriangleData1383
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1367
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_139, Icur := OriginalRow227TriangleData1373.coefficient106_138,
    output := OriginalRow227TriangleData1383.coefficient107_138, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_140, Icur := OriginalRow227TriangleData1373.coefficient106_139,
    output := OriginalRow227TriangleData1383.coefficient107_139, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_141, Icur := OriginalRow227TriangleData1373.coefficient106_140,
    output := OriginalRow227TriangleData1383.coefficient107_140, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_142, Icur := OriginalRow227TriangleData1373.coefficient106_141,
    output := OriginalRow227TriangleData1383.coefficient107_141, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_143, Icur := OriginalRow227TriangleData1373.coefficient106_142,
    output := OriginalRow227TriangleData1383.coefficient107_142, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_144, Icur := OriginalRow227TriangleData1373.coefficient106_143,
    output := OriginalRow227TriangleData1383.coefficient107_143, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_145, Icur := OriginalRow227TriangleData1373.coefficient106_144,
    output := OriginalRow227TriangleData1383.coefficient107_144, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_146, Icur := OriginalRow227TriangleData1373.coefficient106_145,
    output := OriginalRow227TriangleData1383.coefficient107_145, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_147, Icur := OriginalRow227TriangleData1373.coefficient106_146,
    output := OriginalRow227TriangleData1383.coefficient107_146, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_148, Icur := OriginalRow227TriangleData1373.coefficient106_147,
    output := OriginalRow227TriangleData1383.coefficient107_147, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_149, Icur := OriginalRow227TriangleData1373.coefficient106_148,
    output := OriginalRow227TriangleData1383.coefficient107_148, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_150, Icur := OriginalRow227TriangleData1373.coefficient106_149,
    output := OriginalRow227TriangleData1383.coefficient107_149, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_151, Icur := OriginalRow227TriangleData1373.coefficient106_150,
    output := OriginalRow227TriangleData1383.coefficient107_150, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_152, Icur := OriginalRow227TriangleData1373.coefficient106_151,
    output := OriginalRow227TriangleData1383.coefficient107_151, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_153, Icur := OriginalRow227TriangleData1373.coefficient106_152,
    output := OriginalRow227TriangleData1383.coefficient107_152, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_154, Icur := OriginalRow227TriangleData1373.coefficient106_153,
    output := OriginalRow227TriangleData1383.coefficient107_153, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_155, Icur := OriginalRow227TriangleData1373.coefficient106_154,
    output := OriginalRow227TriangleData1383.coefficient107_154, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_156, Icur := OriginalRow227TriangleData1373.coefficient106_155,
    output := OriginalRow227TriangleData1383.coefficient107_155, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_157, Icur := OriginalRow227TriangleData1373.coefficient106_156,
    output := OriginalRow227TriangleData1383.coefficient107_156, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_158, Icur := OriginalRow227TriangleData1373.coefficient106_157,
    output := OriginalRow227TriangleData1383.coefficient107_157, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_159, Icur := OriginalRow227TriangleData1373.coefficient106_158,
    output := OriginalRow227TriangleData1383.coefficient107_158, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_160, Icur := OriginalRow227TriangleData1373.coefficient106_159,
    output := OriginalRow227TriangleData1383.coefficient107_159, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_161, Icur := OriginalRow227TriangleData1373.coefficient106_160,
    output := OriginalRow227TriangleData1383.coefficient107_160, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_162, Icur := OriginalRow227TriangleData1373.coefficient106_161,
    output := OriginalRow227TriangleData1383.coefficient107_161, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_163, Icur := OriginalRow227TriangleData1373.coefficient106_162,
    output := OriginalRow227TriangleData1383.coefficient107_162, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_164, Icur := OriginalRow227TriangleData1373.coefficient106_163,
    output := OriginalRow227TriangleData1383.coefficient107_163, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_165, Icur := OriginalRow227TriangleData1373.coefficient106_164,
    output := OriginalRow227TriangleData1383.coefficient107_164, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_166, Icur := OriginalRow227TriangleData1373.coefficient106_165,
    output := OriginalRow227TriangleData1383.coefficient107_165, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_167, Icur := OriginalRow227TriangleData1373.coefficient106_166,
    output := OriginalRow227TriangleData1383.coefficient107_166, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1373.coefficient106_168, Icur := OriginalRow227TriangleData1373.coefficient106_167,
    output := OriginalRow227TriangleData1383.coefficient107_167, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_169, Icur := OriginalRow227TriangleData1373.coefficient106_168,
    output := OriginalRow227TriangleData1383.coefficient107_168, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_170, Icur := OriginalRow227TriangleData1374.coefficient106_169,
    output := OriginalRow227TriangleData1383.coefficient107_169, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1367

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1367.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
