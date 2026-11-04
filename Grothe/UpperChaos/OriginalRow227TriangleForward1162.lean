import Grothe.UpperChaos.OriginalRow227TriangleData1167
import Grothe.UpperChaos.OriginalRow227TriangleData1168
import Grothe.UpperChaos.OriginalRow227TriangleData1178
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1162
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_119, Icur := OriginalRow227TriangleData1167.coefficient86_118,
    output := OriginalRow227TriangleData1178.coefficient87_118, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_120, Icur := OriginalRow227TriangleData1167.coefficient86_119,
    output := OriginalRow227TriangleData1178.coefficient87_119, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_121, Icur := OriginalRow227TriangleData1167.coefficient86_120,
    output := OriginalRow227TriangleData1178.coefficient87_120, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_122, Icur := OriginalRow227TriangleData1167.coefficient86_121,
    output := OriginalRow227TriangleData1178.coefficient87_121, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_123, Icur := OriginalRow227TriangleData1167.coefficient86_122,
    output := OriginalRow227TriangleData1178.coefficient87_122, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_124, Icur := OriginalRow227TriangleData1167.coefficient86_123,
    output := OriginalRow227TriangleData1178.coefficient87_123, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_125, Icur := OriginalRow227TriangleData1167.coefficient86_124,
    output := OriginalRow227TriangleData1178.coefficient87_124, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_126, Icur := OriginalRow227TriangleData1167.coefficient86_125,
    output := OriginalRow227TriangleData1178.coefficient87_125, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_127, Icur := OriginalRow227TriangleData1167.coefficient86_126,
    output := OriginalRow227TriangleData1178.coefficient87_126, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_128, Icur := OriginalRow227TriangleData1167.coefficient86_127,
    output := OriginalRow227TriangleData1178.coefficient87_127, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_129, Icur := OriginalRow227TriangleData1167.coefficient86_128,
    output := OriginalRow227TriangleData1178.coefficient87_128, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_130, Icur := OriginalRow227TriangleData1167.coefficient86_129,
    output := OriginalRow227TriangleData1178.coefficient87_129, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_131, Icur := OriginalRow227TriangleData1167.coefficient86_130,
    output := OriginalRow227TriangleData1178.coefficient87_130, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_132, Icur := OriginalRow227TriangleData1167.coefficient86_131,
    output := OriginalRow227TriangleData1178.coefficient87_131, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_133, Icur := OriginalRow227TriangleData1167.coefficient86_132,
    output := OriginalRow227TriangleData1178.coefficient87_132, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_134, Icur := OriginalRow227TriangleData1167.coefficient86_133,
    output := OriginalRow227TriangleData1178.coefficient87_133, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_135, Icur := OriginalRow227TriangleData1167.coefficient86_134,
    output := OriginalRow227TriangleData1178.coefficient87_134, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_136, Icur := OriginalRow227TriangleData1167.coefficient86_135,
    output := OriginalRow227TriangleData1178.coefficient87_135, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_137, Icur := OriginalRow227TriangleData1167.coefficient86_136,
    output := OriginalRow227TriangleData1178.coefficient87_136, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_138, Icur := OriginalRow227TriangleData1167.coefficient86_137,
    output := OriginalRow227TriangleData1178.coefficient87_137, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_139, Icur := OriginalRow227TriangleData1167.coefficient86_138,
    output := OriginalRow227TriangleData1178.coefficient87_138, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_140, Icur := OriginalRow227TriangleData1167.coefficient86_139,
    output := OriginalRow227TriangleData1178.coefficient87_139, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_141, Icur := OriginalRow227TriangleData1167.coefficient86_140,
    output := OriginalRow227TriangleData1178.coefficient87_140, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_142, Icur := OriginalRow227TriangleData1167.coefficient86_141,
    output := OriginalRow227TriangleData1178.coefficient87_141, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_143, Icur := OriginalRow227TriangleData1167.coefficient86_142,
    output := OriginalRow227TriangleData1178.coefficient87_142, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_144, Icur := OriginalRow227TriangleData1167.coefficient86_143,
    output := OriginalRow227TriangleData1178.coefficient87_143, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_145, Icur := OriginalRow227TriangleData1167.coefficient86_144,
    output := OriginalRow227TriangleData1178.coefficient87_144, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_146, Icur := OriginalRow227TriangleData1167.coefficient86_145,
    output := OriginalRow227TriangleData1178.coefficient87_145, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_147, Icur := OriginalRow227TriangleData1167.coefficient86_146,
    output := OriginalRow227TriangleData1178.coefficient87_146, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_148, Icur := OriginalRow227TriangleData1167.coefficient86_147,
    output := OriginalRow227TriangleData1178.coefficient87_147, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1168.coefficient86_149, Icur := OriginalRow227TriangleData1167.coefficient86_148,
    output := OriginalRow227TriangleData1178.coefficient87_148, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1168.coefficient86_150, Icur := OriginalRow227TriangleData1168.coefficient86_149,
    output := OriginalRow227TriangleData1178.coefficient87_149, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1162

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1162.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
