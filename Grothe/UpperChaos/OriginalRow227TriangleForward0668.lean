import Grothe.UpperChaos.OriginalRow227TriangleData0671
import Grothe.UpperChaos.OriginalRow227TriangleData0672
import Grothe.UpperChaos.OriginalRow227TriangleData0684
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0668
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_110, Icur := OriginalRow227TriangleData0671.coefficient45_109,
    output := OriginalRow227TriangleData0684.coefficient46_109, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_111, Icur := OriginalRow227TriangleData0671.coefficient45_110,
    output := OriginalRow227TriangleData0684.coefficient46_110, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_112, Icur := OriginalRow227TriangleData0671.coefficient45_111,
    output := OriginalRow227TriangleData0684.coefficient46_111, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_113, Icur := OriginalRow227TriangleData0671.coefficient45_112,
    output := OriginalRow227TriangleData0684.coefficient46_112, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_114, Icur := OriginalRow227TriangleData0671.coefficient45_113,
    output := OriginalRow227TriangleData0684.coefficient46_113, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_115, Icur := OriginalRow227TriangleData0671.coefficient45_114,
    output := OriginalRow227TriangleData0684.coefficient46_114, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_116, Icur := OriginalRow227TriangleData0671.coefficient45_115,
    output := OriginalRow227TriangleData0684.coefficient46_115, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_117, Icur := OriginalRow227TriangleData0671.coefficient45_116,
    output := OriginalRow227TriangleData0684.coefficient46_116, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_118, Icur := OriginalRow227TriangleData0671.coefficient45_117,
    output := OriginalRow227TriangleData0684.coefficient46_117, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_119, Icur := OriginalRow227TriangleData0671.coefficient45_118,
    output := OriginalRow227TriangleData0684.coefficient46_118, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_120, Icur := OriginalRow227TriangleData0671.coefficient45_119,
    output := OriginalRow227TriangleData0684.coefficient46_119, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_121, Icur := OriginalRow227TriangleData0671.coefficient45_120,
    output := OriginalRow227TriangleData0684.coefficient46_120, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_122, Icur := OriginalRow227TriangleData0671.coefficient45_121,
    output := OriginalRow227TriangleData0684.coefficient46_121, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_123, Icur := OriginalRow227TriangleData0671.coefficient45_122,
    output := OriginalRow227TriangleData0684.coefficient46_122, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_124, Icur := OriginalRow227TriangleData0671.coefficient45_123,
    output := OriginalRow227TriangleData0684.coefficient46_123, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_125, Icur := OriginalRow227TriangleData0671.coefficient45_124,
    output := OriginalRow227TriangleData0684.coefficient46_124, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_126, Icur := OriginalRow227TriangleData0671.coefficient45_125,
    output := OriginalRow227TriangleData0684.coefficient46_125, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_127, Icur := OriginalRow227TriangleData0671.coefficient45_126,
    output := OriginalRow227TriangleData0684.coefficient46_126, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_128, Icur := OriginalRow227TriangleData0671.coefficient45_127,
    output := OriginalRow227TriangleData0684.coefficient46_127, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_129, Icur := OriginalRow227TriangleData0671.coefficient45_128,
    output := OriginalRow227TriangleData0684.coefficient46_128, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_130, Icur := OriginalRow227TriangleData0671.coefficient45_129,
    output := OriginalRow227TriangleData0684.coefficient46_129, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_131, Icur := OriginalRow227TriangleData0671.coefficient45_130,
    output := OriginalRow227TriangleData0684.coefficient46_130, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_132, Icur := OriginalRow227TriangleData0671.coefficient45_131,
    output := OriginalRow227TriangleData0684.coefficient46_131, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_133, Icur := OriginalRow227TriangleData0671.coefficient45_132,
    output := OriginalRow227TriangleData0684.coefficient46_132, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_134, Icur := OriginalRow227TriangleData0671.coefficient45_133,
    output := OriginalRow227TriangleData0684.coefficient46_133, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_135, Icur := OriginalRow227TriangleData0671.coefficient45_134,
    output := OriginalRow227TriangleData0684.coefficient46_134, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_136, Icur := OriginalRow227TriangleData0671.coefficient45_135,
    output := OriginalRow227TriangleData0684.coefficient46_135, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_137, Icur := OriginalRow227TriangleData0671.coefficient45_136,
    output := OriginalRow227TriangleData0684.coefficient46_136, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_138, Icur := OriginalRow227TriangleData0671.coefficient45_137,
    output := OriginalRow227TriangleData0684.coefficient46_137, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0671.coefficient45_139, Icur := OriginalRow227TriangleData0671.coefficient45_138,
    output := OriginalRow227TriangleData0684.coefficient46_138, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_140, Icur := OriginalRow227TriangleData0671.coefficient45_139,
    output := OriginalRow227TriangleData0684.coefficient46_139, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0672.coefficient45_141, Icur := OriginalRow227TriangleData0672.coefficient45_140,
    output := OriginalRow227TriangleData0684.coefficient46_140, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0668

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0668.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
