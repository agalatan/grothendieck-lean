import Grothe.UpperChaos.OriginalRow227TriangleData0902
import Grothe.UpperChaos.OriginalRow227TriangleData0903
import Grothe.UpperChaos.OriginalRow227TriangleData0914
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0898
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_128, Icur := OriginalRow227TriangleData0902.coefficient63_127,
    output := OriginalRow227TriangleData0914.coefficient64_127, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_129, Icur := OriginalRow227TriangleData0902.coefficient63_128,
    output := OriginalRow227TriangleData0914.coefficient64_128, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_130, Icur := OriginalRow227TriangleData0902.coefficient63_129,
    output := OriginalRow227TriangleData0914.coefficient64_129, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_131, Icur := OriginalRow227TriangleData0902.coefficient63_130,
    output := OriginalRow227TriangleData0914.coefficient64_130, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_132, Icur := OriginalRow227TriangleData0902.coefficient63_131,
    output := OriginalRow227TriangleData0914.coefficient64_131, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_133, Icur := OriginalRow227TriangleData0902.coefficient63_132,
    output := OriginalRow227TriangleData0914.coefficient64_132, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_134, Icur := OriginalRow227TriangleData0902.coefficient63_133,
    output := OriginalRow227TriangleData0914.coefficient64_133, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_135, Icur := OriginalRow227TriangleData0902.coefficient63_134,
    output := OriginalRow227TriangleData0914.coefficient64_134, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_136, Icur := OriginalRow227TriangleData0902.coefficient63_135,
    output := OriginalRow227TriangleData0914.coefficient64_135, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_137, Icur := OriginalRow227TriangleData0902.coefficient63_136,
    output := OriginalRow227TriangleData0914.coefficient64_136, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_138, Icur := OriginalRow227TriangleData0902.coefficient63_137,
    output := OriginalRow227TriangleData0914.coefficient64_137, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_139, Icur := OriginalRow227TriangleData0902.coefficient63_138,
    output := OriginalRow227TriangleData0914.coefficient64_138, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_140, Icur := OriginalRow227TriangleData0902.coefficient63_139,
    output := OriginalRow227TriangleData0914.coefficient64_139, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_141, Icur := OriginalRow227TriangleData0902.coefficient63_140,
    output := OriginalRow227TriangleData0914.coefficient64_140, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_142, Icur := OriginalRow227TriangleData0902.coefficient63_141,
    output := OriginalRow227TriangleData0914.coefficient64_141, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_143, Icur := OriginalRow227TriangleData0902.coefficient63_142,
    output := OriginalRow227TriangleData0914.coefficient64_142, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_144, Icur := OriginalRow227TriangleData0902.coefficient63_143,
    output := OriginalRow227TriangleData0914.coefficient64_143, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_145, Icur := OriginalRow227TriangleData0902.coefficient63_144,
    output := OriginalRow227TriangleData0914.coefficient64_144, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_146, Icur := OriginalRow227TriangleData0902.coefficient63_145,
    output := OriginalRow227TriangleData0914.coefficient64_145, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_147, Icur := OriginalRow227TriangleData0902.coefficient63_146,
    output := OriginalRow227TriangleData0914.coefficient64_146, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_148, Icur := OriginalRow227TriangleData0902.coefficient63_147,
    output := OriginalRow227TriangleData0914.coefficient64_147, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_149, Icur := OriginalRow227TriangleData0902.coefficient63_148,
    output := OriginalRow227TriangleData0914.coefficient64_148, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_150, Icur := OriginalRow227TriangleData0902.coefficient63_149,
    output := OriginalRow227TriangleData0914.coefficient64_149, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_151, Icur := OriginalRow227TriangleData0902.coefficient63_150,
    output := OriginalRow227TriangleData0914.coefficient64_150, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_152, Icur := OriginalRow227TriangleData0902.coefficient63_151,
    output := OriginalRow227TriangleData0914.coefficient64_151, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_153, Icur := OriginalRow227TriangleData0902.coefficient63_152,
    output := OriginalRow227TriangleData0914.coefficient64_152, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_154, Icur := OriginalRow227TriangleData0902.coefficient63_153,
    output := OriginalRow227TriangleData0914.coefficient64_153, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_155, Icur := OriginalRow227TriangleData0902.coefficient63_154,
    output := OriginalRow227TriangleData0914.coefficient64_154, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_156, Icur := OriginalRow227TriangleData0902.coefficient63_155,
    output := OriginalRow227TriangleData0914.coefficient64_155, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0902.coefficient63_157, Icur := OriginalRow227TriangleData0902.coefficient63_156,
    output := OriginalRow227TriangleData0914.coefficient64_156, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_158, Icur := OriginalRow227TriangleData0902.coefficient63_157,
    output := OriginalRow227TriangleData0914.coefficient64_157, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_159, Icur := OriginalRow227TriangleData0903.coefficient63_158,
    output := OriginalRow227TriangleData0914.coefficient64_158, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0898

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0898.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
