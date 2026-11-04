import Grothe.UpperChaos.OriginalRow227TriangleData1178
import Grothe.UpperChaos.OriginalRow227TriangleData1179
import Grothe.UpperChaos.OriginalRow227TriangleData1189
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1173
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_120, Icur := OriginalRow227TriangleData1178.coefficient87_119,
    output := OriginalRow227TriangleData1189.coefficient88_119, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_121, Icur := OriginalRow227TriangleData1178.coefficient87_120,
    output := OriginalRow227TriangleData1189.coefficient88_120, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_122, Icur := OriginalRow227TriangleData1178.coefficient87_121,
    output := OriginalRow227TriangleData1189.coefficient88_121, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_123, Icur := OriginalRow227TriangleData1178.coefficient87_122,
    output := OriginalRow227TriangleData1189.coefficient88_122, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_124, Icur := OriginalRow227TriangleData1178.coefficient87_123,
    output := OriginalRow227TriangleData1189.coefficient88_123, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_125, Icur := OriginalRow227TriangleData1178.coefficient87_124,
    output := OriginalRow227TriangleData1189.coefficient88_124, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_126, Icur := OriginalRow227TriangleData1178.coefficient87_125,
    output := OriginalRow227TriangleData1189.coefficient88_125, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_127, Icur := OriginalRow227TriangleData1178.coefficient87_126,
    output := OriginalRow227TriangleData1189.coefficient88_126, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_128, Icur := OriginalRow227TriangleData1178.coefficient87_127,
    output := OriginalRow227TriangleData1189.coefficient88_127, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_129, Icur := OriginalRow227TriangleData1178.coefficient87_128,
    output := OriginalRow227TriangleData1189.coefficient88_128, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_130, Icur := OriginalRow227TriangleData1178.coefficient87_129,
    output := OriginalRow227TriangleData1189.coefficient88_129, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_131, Icur := OriginalRow227TriangleData1178.coefficient87_130,
    output := OriginalRow227TriangleData1189.coefficient88_130, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_132, Icur := OriginalRow227TriangleData1178.coefficient87_131,
    output := OriginalRow227TriangleData1189.coefficient88_131, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_133, Icur := OriginalRow227TriangleData1178.coefficient87_132,
    output := OriginalRow227TriangleData1189.coefficient88_132, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_134, Icur := OriginalRow227TriangleData1178.coefficient87_133,
    output := OriginalRow227TriangleData1189.coefficient88_133, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_135, Icur := OriginalRow227TriangleData1178.coefficient87_134,
    output := OriginalRow227TriangleData1189.coefficient88_134, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_136, Icur := OriginalRow227TriangleData1178.coefficient87_135,
    output := OriginalRow227TriangleData1189.coefficient88_135, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_137, Icur := OriginalRow227TriangleData1178.coefficient87_136,
    output := OriginalRow227TriangleData1189.coefficient88_136, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_138, Icur := OriginalRow227TriangleData1178.coefficient87_137,
    output := OriginalRow227TriangleData1189.coefficient88_137, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_139, Icur := OriginalRow227TriangleData1178.coefficient87_138,
    output := OriginalRow227TriangleData1189.coefficient88_138, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_140, Icur := OriginalRow227TriangleData1178.coefficient87_139,
    output := OriginalRow227TriangleData1189.coefficient88_139, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_141, Icur := OriginalRow227TriangleData1178.coefficient87_140,
    output := OriginalRow227TriangleData1189.coefficient88_140, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_142, Icur := OriginalRow227TriangleData1178.coefficient87_141,
    output := OriginalRow227TriangleData1189.coefficient88_141, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_143, Icur := OriginalRow227TriangleData1178.coefficient87_142,
    output := OriginalRow227TriangleData1189.coefficient88_142, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_144, Icur := OriginalRow227TriangleData1178.coefficient87_143,
    output := OriginalRow227TriangleData1189.coefficient88_143, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_145, Icur := OriginalRow227TriangleData1178.coefficient87_144,
    output := OriginalRow227TriangleData1189.coefficient88_144, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_146, Icur := OriginalRow227TriangleData1178.coefficient87_145,
    output := OriginalRow227TriangleData1189.coefficient88_145, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_147, Icur := OriginalRow227TriangleData1178.coefficient87_146,
    output := OriginalRow227TriangleData1189.coefficient88_146, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_148, Icur := OriginalRow227TriangleData1178.coefficient87_147,
    output := OriginalRow227TriangleData1189.coefficient88_147, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1178.coefficient87_149, Icur := OriginalRow227TriangleData1178.coefficient87_148,
    output := OriginalRow227TriangleData1189.coefficient88_148, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_150, Icur := OriginalRow227TriangleData1178.coefficient87_149,
    output := OriginalRow227TriangleData1189.coefficient88_149, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_151, Icur := OriginalRow227TriangleData1179.coefficient87_150,
    output := OriginalRow227TriangleData1189.coefficient88_150, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1173

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1173.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
