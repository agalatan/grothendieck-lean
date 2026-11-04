import Grothe.UpperChaos.OriginalRow227TriangleData1447
import Grothe.UpperChaos.OriginalRow227TriangleData1448
import Grothe.UpperChaos.OriginalRow227TriangleData1456
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1440
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_147, Icur := OriginalRow227TriangleData1447.coefficient114_146,
    output := OriginalRow227TriangleData1456.coefficient115_146, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_148, Icur := OriginalRow227TriangleData1447.coefficient114_147,
    output := OriginalRow227TriangleData1456.coefficient115_147, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_149, Icur := OriginalRow227TriangleData1447.coefficient114_148,
    output := OriginalRow227TriangleData1456.coefficient115_148, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_150, Icur := OriginalRow227TriangleData1447.coefficient114_149,
    output := OriginalRow227TriangleData1456.coefficient115_149, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_151, Icur := OriginalRow227TriangleData1447.coefficient114_150,
    output := OriginalRow227TriangleData1456.coefficient115_150, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_152, Icur := OriginalRow227TriangleData1447.coefficient114_151,
    output := OriginalRow227TriangleData1456.coefficient115_151, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_153, Icur := OriginalRow227TriangleData1447.coefficient114_152,
    output := OriginalRow227TriangleData1456.coefficient115_152, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_154, Icur := OriginalRow227TriangleData1447.coefficient114_153,
    output := OriginalRow227TriangleData1456.coefficient115_153, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_155, Icur := OriginalRow227TriangleData1447.coefficient114_154,
    output := OriginalRow227TriangleData1456.coefficient115_154, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_156, Icur := OriginalRow227TriangleData1447.coefficient114_155,
    output := OriginalRow227TriangleData1456.coefficient115_155, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_157, Icur := OriginalRow227TriangleData1447.coefficient114_156,
    output := OriginalRow227TriangleData1456.coefficient115_156, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_158, Icur := OriginalRow227TriangleData1447.coefficient114_157,
    output := OriginalRow227TriangleData1456.coefficient115_157, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_159, Icur := OriginalRow227TriangleData1447.coefficient114_158,
    output := OriginalRow227TriangleData1456.coefficient115_158, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_160, Icur := OriginalRow227TriangleData1447.coefficient114_159,
    output := OriginalRow227TriangleData1456.coefficient115_159, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_161, Icur := OriginalRow227TriangleData1447.coefficient114_160,
    output := OriginalRow227TriangleData1456.coefficient115_160, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_162, Icur := OriginalRow227TriangleData1447.coefficient114_161,
    output := OriginalRow227TriangleData1456.coefficient115_161, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_163, Icur := OriginalRow227TriangleData1447.coefficient114_162,
    output := OriginalRow227TriangleData1456.coefficient115_162, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_164, Icur := OriginalRow227TriangleData1447.coefficient114_163,
    output := OriginalRow227TriangleData1456.coefficient115_163, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_165, Icur := OriginalRow227TriangleData1447.coefficient114_164,
    output := OriginalRow227TriangleData1456.coefficient115_164, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_166, Icur := OriginalRow227TriangleData1447.coefficient114_165,
    output := OriginalRow227TriangleData1456.coefficient115_165, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_167, Icur := OriginalRow227TriangleData1447.coefficient114_166,
    output := OriginalRow227TriangleData1456.coefficient115_166, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_168, Icur := OriginalRow227TriangleData1447.coefficient114_167,
    output := OriginalRow227TriangleData1456.coefficient115_167, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_169, Icur := OriginalRow227TriangleData1447.coefficient114_168,
    output := OriginalRow227TriangleData1456.coefficient115_168, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_170, Icur := OriginalRow227TriangleData1447.coefficient114_169,
    output := OriginalRow227TriangleData1456.coefficient115_169, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_171, Icur := OriginalRow227TriangleData1447.coefficient114_170,
    output := OriginalRow227TriangleData1456.coefficient115_170, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_172, Icur := OriginalRow227TriangleData1447.coefficient114_171,
    output := OriginalRow227TriangleData1456.coefficient115_171, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_173, Icur := OriginalRow227TriangleData1447.coefficient114_172,
    output := OriginalRow227TriangleData1456.coefficient115_172, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_174, Icur := OriginalRow227TriangleData1447.coefficient114_173,
    output := OriginalRow227TriangleData1456.coefficient115_173, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_175, Icur := OriginalRow227TriangleData1447.coefficient114_174,
    output := OriginalRow227TriangleData1456.coefficient115_174, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1447.coefficient114_176, Icur := OriginalRow227TriangleData1447.coefficient114_175,
    output := OriginalRow227TriangleData1456.coefficient115_175, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_177, Icur := OriginalRow227TriangleData1447.coefficient114_176,
    output := OriginalRow227TriangleData1456.coefficient115_176, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1448.coefficient114_178, Icur := OriginalRow227TriangleData1448.coefficient114_177,
    output := OriginalRow227TriangleData1456.coefficient115_177, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1440

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1440.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
