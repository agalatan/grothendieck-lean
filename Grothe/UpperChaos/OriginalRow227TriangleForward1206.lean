import Grothe.UpperChaos.OriginalRow227TriangleData1211
import Grothe.UpperChaos.OriginalRow227TriangleData1212
import Grothe.UpperChaos.OriginalRow227TriangleData1222
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1206
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_123, Icur := OriginalRow227TriangleData1211.coefficient90_122,
    output := OriginalRow227TriangleData1222.coefficient91_122, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_124, Icur := OriginalRow227TriangleData1211.coefficient90_123,
    output := OriginalRow227TriangleData1222.coefficient91_123, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_125, Icur := OriginalRow227TriangleData1211.coefficient90_124,
    output := OriginalRow227TriangleData1222.coefficient91_124, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_126, Icur := OriginalRow227TriangleData1211.coefficient90_125,
    output := OriginalRow227TriangleData1222.coefficient91_125, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_127, Icur := OriginalRow227TriangleData1211.coefficient90_126,
    output := OriginalRow227TriangleData1222.coefficient91_126, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_128, Icur := OriginalRow227TriangleData1211.coefficient90_127,
    output := OriginalRow227TriangleData1222.coefficient91_127, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_129, Icur := OriginalRow227TriangleData1211.coefficient90_128,
    output := OriginalRow227TriangleData1222.coefficient91_128, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_130, Icur := OriginalRow227TriangleData1211.coefficient90_129,
    output := OriginalRow227TriangleData1222.coefficient91_129, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_131, Icur := OriginalRow227TriangleData1211.coefficient90_130,
    output := OriginalRow227TriangleData1222.coefficient91_130, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_132, Icur := OriginalRow227TriangleData1211.coefficient90_131,
    output := OriginalRow227TriangleData1222.coefficient91_131, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_133, Icur := OriginalRow227TriangleData1211.coefficient90_132,
    output := OriginalRow227TriangleData1222.coefficient91_132, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_134, Icur := OriginalRow227TriangleData1211.coefficient90_133,
    output := OriginalRow227TriangleData1222.coefficient91_133, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_135, Icur := OriginalRow227TriangleData1211.coefficient90_134,
    output := OriginalRow227TriangleData1222.coefficient91_134, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_136, Icur := OriginalRow227TriangleData1211.coefficient90_135,
    output := OriginalRow227TriangleData1222.coefficient91_135, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_137, Icur := OriginalRow227TriangleData1211.coefficient90_136,
    output := OriginalRow227TriangleData1222.coefficient91_136, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_138, Icur := OriginalRow227TriangleData1211.coefficient90_137,
    output := OriginalRow227TriangleData1222.coefficient91_137, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_139, Icur := OriginalRow227TriangleData1211.coefficient90_138,
    output := OriginalRow227TriangleData1222.coefficient91_138, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_140, Icur := OriginalRow227TriangleData1211.coefficient90_139,
    output := OriginalRow227TriangleData1222.coefficient91_139, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_141, Icur := OriginalRow227TriangleData1211.coefficient90_140,
    output := OriginalRow227TriangleData1222.coefficient91_140, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_142, Icur := OriginalRow227TriangleData1211.coefficient90_141,
    output := OriginalRow227TriangleData1222.coefficient91_141, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_143, Icur := OriginalRow227TriangleData1211.coefficient90_142,
    output := OriginalRow227TriangleData1222.coefficient91_142, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_144, Icur := OriginalRow227TriangleData1211.coefficient90_143,
    output := OriginalRow227TriangleData1222.coefficient91_143, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_145, Icur := OriginalRow227TriangleData1211.coefficient90_144,
    output := OriginalRow227TriangleData1222.coefficient91_144, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_146, Icur := OriginalRow227TriangleData1211.coefficient90_145,
    output := OriginalRow227TriangleData1222.coefficient91_145, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_147, Icur := OriginalRow227TriangleData1211.coefficient90_146,
    output := OriginalRow227TriangleData1222.coefficient91_146, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_148, Icur := OriginalRow227TriangleData1211.coefficient90_147,
    output := OriginalRow227TriangleData1222.coefficient91_147, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_149, Icur := OriginalRow227TriangleData1211.coefficient90_148,
    output := OriginalRow227TriangleData1222.coefficient91_148, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_150, Icur := OriginalRow227TriangleData1211.coefficient90_149,
    output := OriginalRow227TriangleData1222.coefficient91_149, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_151, Icur := OriginalRow227TriangleData1211.coefficient90_150,
    output := OriginalRow227TriangleData1222.coefficient91_150, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1211.coefficient90_152, Icur := OriginalRow227TriangleData1211.coefficient90_151,
    output := OriginalRow227TriangleData1222.coefficient91_151, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1212.coefficient90_153, Icur := OriginalRow227TriangleData1211.coefficient90_152,
    output := OriginalRow227TriangleData1222.coefficient91_152, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1212.coefficient90_154, Icur := OriginalRow227TriangleData1212.coefficient90_153,
    output := OriginalRow227TriangleData1222.coefficient91_153, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1206

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1206.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
