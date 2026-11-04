import Grothe.UpperChaos.OriginalRow227TriangleData1233
import Grothe.UpperChaos.OriginalRow227TriangleData1234
import Grothe.UpperChaos.OriginalRow227TriangleData1243
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1227
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_125, Icur := OriginalRow227TriangleData1233.coefficient92_124,
    output := OriginalRow227TriangleData1243.coefficient93_124, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_126, Icur := OriginalRow227TriangleData1233.coefficient92_125,
    output := OriginalRow227TriangleData1243.coefficient93_125, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_127, Icur := OriginalRow227TriangleData1233.coefficient92_126,
    output := OriginalRow227TriangleData1243.coefficient93_126, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_128, Icur := OriginalRow227TriangleData1233.coefficient92_127,
    output := OriginalRow227TriangleData1243.coefficient93_127, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_129, Icur := OriginalRow227TriangleData1233.coefficient92_128,
    output := OriginalRow227TriangleData1243.coefficient93_128, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_130, Icur := OriginalRow227TriangleData1233.coefficient92_129,
    output := OriginalRow227TriangleData1243.coefficient93_129, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_131, Icur := OriginalRow227TriangleData1233.coefficient92_130,
    output := OriginalRow227TriangleData1243.coefficient93_130, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_132, Icur := OriginalRow227TriangleData1233.coefficient92_131,
    output := OriginalRow227TriangleData1243.coefficient93_131, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_133, Icur := OriginalRow227TriangleData1233.coefficient92_132,
    output := OriginalRow227TriangleData1243.coefficient93_132, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_134, Icur := OriginalRow227TriangleData1233.coefficient92_133,
    output := OriginalRow227TriangleData1243.coefficient93_133, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_135, Icur := OriginalRow227TriangleData1233.coefficient92_134,
    output := OriginalRow227TriangleData1243.coefficient93_134, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_136, Icur := OriginalRow227TriangleData1233.coefficient92_135,
    output := OriginalRow227TriangleData1243.coefficient93_135, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_137, Icur := OriginalRow227TriangleData1233.coefficient92_136,
    output := OriginalRow227TriangleData1243.coefficient93_136, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_138, Icur := OriginalRow227TriangleData1233.coefficient92_137,
    output := OriginalRow227TriangleData1243.coefficient93_137, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_139, Icur := OriginalRow227TriangleData1233.coefficient92_138,
    output := OriginalRow227TriangleData1243.coefficient93_138, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_140, Icur := OriginalRow227TriangleData1233.coefficient92_139,
    output := OriginalRow227TriangleData1243.coefficient93_139, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_141, Icur := OriginalRow227TriangleData1233.coefficient92_140,
    output := OriginalRow227TriangleData1243.coefficient93_140, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_142, Icur := OriginalRow227TriangleData1233.coefficient92_141,
    output := OriginalRow227TriangleData1243.coefficient93_141, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_143, Icur := OriginalRow227TriangleData1233.coefficient92_142,
    output := OriginalRow227TriangleData1243.coefficient93_142, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_144, Icur := OriginalRow227TriangleData1233.coefficient92_143,
    output := OriginalRow227TriangleData1243.coefficient93_143, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_145, Icur := OriginalRow227TriangleData1233.coefficient92_144,
    output := OriginalRow227TriangleData1243.coefficient93_144, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_146, Icur := OriginalRow227TriangleData1233.coefficient92_145,
    output := OriginalRow227TriangleData1243.coefficient93_145, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_147, Icur := OriginalRow227TriangleData1233.coefficient92_146,
    output := OriginalRow227TriangleData1243.coefficient93_146, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_148, Icur := OriginalRow227TriangleData1233.coefficient92_147,
    output := OriginalRow227TriangleData1243.coefficient93_147, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_149, Icur := OriginalRow227TriangleData1233.coefficient92_148,
    output := OriginalRow227TriangleData1243.coefficient93_148, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_150, Icur := OriginalRow227TriangleData1233.coefficient92_149,
    output := OriginalRow227TriangleData1243.coefficient93_149, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_151, Icur := OriginalRow227TriangleData1233.coefficient92_150,
    output := OriginalRow227TriangleData1243.coefficient93_150, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_152, Icur := OriginalRow227TriangleData1233.coefficient92_151,
    output := OriginalRow227TriangleData1243.coefficient93_151, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_153, Icur := OriginalRow227TriangleData1233.coefficient92_152,
    output := OriginalRow227TriangleData1243.coefficient93_152, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_154, Icur := OriginalRow227TriangleData1233.coefficient92_153,
    output := OriginalRow227TriangleData1243.coefficient93_153, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1234.coefficient92_155, Icur := OriginalRow227TriangleData1233.coefficient92_154,
    output := OriginalRow227TriangleData1243.coefficient93_154, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1234.coefficient92_156, Icur := OriginalRow227TriangleData1234.coefficient92_155,
    output := OriginalRow227TriangleData1243.coefficient93_155, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1227

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1227.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
