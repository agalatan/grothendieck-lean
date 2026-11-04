import Grothe.UpperChaos.OriginalRow227TriangleData1189
import Grothe.UpperChaos.OriginalRow227TriangleData1190
import Grothe.UpperChaos.OriginalRow227TriangleData1200
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1184
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_121, Icur := OriginalRow227TriangleData1189.coefficient88_120,
    output := OriginalRow227TriangleData1200.coefficient89_120, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_122, Icur := OriginalRow227TriangleData1189.coefficient88_121,
    output := OriginalRow227TriangleData1200.coefficient89_121, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_123, Icur := OriginalRow227TriangleData1189.coefficient88_122,
    output := OriginalRow227TriangleData1200.coefficient89_122, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_124, Icur := OriginalRow227TriangleData1189.coefficient88_123,
    output := OriginalRow227TriangleData1200.coefficient89_123, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_125, Icur := OriginalRow227TriangleData1189.coefficient88_124,
    output := OriginalRow227TriangleData1200.coefficient89_124, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_126, Icur := OriginalRow227TriangleData1189.coefficient88_125,
    output := OriginalRow227TriangleData1200.coefficient89_125, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_127, Icur := OriginalRow227TriangleData1189.coefficient88_126,
    output := OriginalRow227TriangleData1200.coefficient89_126, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_128, Icur := OriginalRow227TriangleData1189.coefficient88_127,
    output := OriginalRow227TriangleData1200.coefficient89_127, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_129, Icur := OriginalRow227TriangleData1189.coefficient88_128,
    output := OriginalRow227TriangleData1200.coefficient89_128, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_130, Icur := OriginalRow227TriangleData1189.coefficient88_129,
    output := OriginalRow227TriangleData1200.coefficient89_129, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_131, Icur := OriginalRow227TriangleData1189.coefficient88_130,
    output := OriginalRow227TriangleData1200.coefficient89_130, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_132, Icur := OriginalRow227TriangleData1189.coefficient88_131,
    output := OriginalRow227TriangleData1200.coefficient89_131, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_133, Icur := OriginalRow227TriangleData1189.coefficient88_132,
    output := OriginalRow227TriangleData1200.coefficient89_132, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_134, Icur := OriginalRow227TriangleData1189.coefficient88_133,
    output := OriginalRow227TriangleData1200.coefficient89_133, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_135, Icur := OriginalRow227TriangleData1189.coefficient88_134,
    output := OriginalRow227TriangleData1200.coefficient89_134, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_136, Icur := OriginalRow227TriangleData1189.coefficient88_135,
    output := OriginalRow227TriangleData1200.coefficient89_135, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_137, Icur := OriginalRow227TriangleData1189.coefficient88_136,
    output := OriginalRow227TriangleData1200.coefficient89_136, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_138, Icur := OriginalRow227TriangleData1189.coefficient88_137,
    output := OriginalRow227TriangleData1200.coefficient89_137, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_139, Icur := OriginalRow227TriangleData1189.coefficient88_138,
    output := OriginalRow227TriangleData1200.coefficient89_138, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_140, Icur := OriginalRow227TriangleData1189.coefficient88_139,
    output := OriginalRow227TriangleData1200.coefficient89_139, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_141, Icur := OriginalRow227TriangleData1189.coefficient88_140,
    output := OriginalRow227TriangleData1200.coefficient89_140, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_142, Icur := OriginalRow227TriangleData1189.coefficient88_141,
    output := OriginalRow227TriangleData1200.coefficient89_141, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_143, Icur := OriginalRow227TriangleData1189.coefficient88_142,
    output := OriginalRow227TriangleData1200.coefficient89_142, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_144, Icur := OriginalRow227TriangleData1189.coefficient88_143,
    output := OriginalRow227TriangleData1200.coefficient89_143, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_145, Icur := OriginalRow227TriangleData1189.coefficient88_144,
    output := OriginalRow227TriangleData1200.coefficient89_144, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_146, Icur := OriginalRow227TriangleData1189.coefficient88_145,
    output := OriginalRow227TriangleData1200.coefficient89_145, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_147, Icur := OriginalRow227TriangleData1189.coefficient88_146,
    output := OriginalRow227TriangleData1200.coefficient89_146, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_148, Icur := OriginalRow227TriangleData1189.coefficient88_147,
    output := OriginalRow227TriangleData1200.coefficient89_147, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_149, Icur := OriginalRow227TriangleData1189.coefficient88_148,
    output := OriginalRow227TriangleData1200.coefficient89_148, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1189.coefficient88_150, Icur := OriginalRow227TriangleData1189.coefficient88_149,
    output := OriginalRow227TriangleData1200.coefficient89_149, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1190.coefficient88_151, Icur := OriginalRow227TriangleData1189.coefficient88_150,
    output := OriginalRow227TriangleData1200.coefficient89_150, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1190.coefficient88_152, Icur := OriginalRow227TriangleData1190.coefficient88_151,
    output := OriginalRow227TriangleData1200.coefficient89_151, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1184

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1184.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
