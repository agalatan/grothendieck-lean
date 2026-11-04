import Grothe.UpperChaos.OriginalRow227TriangleData0840
import Grothe.UpperChaos.OriginalRow227TriangleData0841
import Grothe.UpperChaos.OriginalRow227TriangleData0853
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0837
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_123, Icur := OriginalRow227TriangleData0840.coefficient58_122,
    output := OriginalRow227TriangleData0853.coefficient59_122, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_124, Icur := OriginalRow227TriangleData0840.coefficient58_123,
    output := OriginalRow227TriangleData0853.coefficient59_123, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_125, Icur := OriginalRow227TriangleData0840.coefficient58_124,
    output := OriginalRow227TriangleData0853.coefficient59_124, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_126, Icur := OriginalRow227TriangleData0840.coefficient58_125,
    output := OriginalRow227TriangleData0853.coefficient59_125, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_127, Icur := OriginalRow227TriangleData0840.coefficient58_126,
    output := OriginalRow227TriangleData0853.coefficient59_126, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_128, Icur := OriginalRow227TriangleData0840.coefficient58_127,
    output := OriginalRow227TriangleData0853.coefficient59_127, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_129, Icur := OriginalRow227TriangleData0840.coefficient58_128,
    output := OriginalRow227TriangleData0853.coefficient59_128, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_130, Icur := OriginalRow227TriangleData0840.coefficient58_129,
    output := OriginalRow227TriangleData0853.coefficient59_129, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_131, Icur := OriginalRow227TriangleData0840.coefficient58_130,
    output := OriginalRow227TriangleData0853.coefficient59_130, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_132, Icur := OriginalRow227TriangleData0840.coefficient58_131,
    output := OriginalRow227TriangleData0853.coefficient59_131, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_133, Icur := OriginalRow227TriangleData0840.coefficient58_132,
    output := OriginalRow227TriangleData0853.coefficient59_132, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_134, Icur := OriginalRow227TriangleData0840.coefficient58_133,
    output := OriginalRow227TriangleData0853.coefficient59_133, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_135, Icur := OriginalRow227TriangleData0840.coefficient58_134,
    output := OriginalRow227TriangleData0853.coefficient59_134, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_136, Icur := OriginalRow227TriangleData0840.coefficient58_135,
    output := OriginalRow227TriangleData0853.coefficient59_135, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_137, Icur := OriginalRow227TriangleData0840.coefficient58_136,
    output := OriginalRow227TriangleData0853.coefficient59_136, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_138, Icur := OriginalRow227TriangleData0840.coefficient58_137,
    output := OriginalRow227TriangleData0853.coefficient59_137, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_139, Icur := OriginalRow227TriangleData0840.coefficient58_138,
    output := OriginalRow227TriangleData0853.coefficient59_138, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_140, Icur := OriginalRow227TriangleData0840.coefficient58_139,
    output := OriginalRow227TriangleData0853.coefficient59_139, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_141, Icur := OriginalRow227TriangleData0840.coefficient58_140,
    output := OriginalRow227TriangleData0853.coefficient59_140, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_142, Icur := OriginalRow227TriangleData0840.coefficient58_141,
    output := OriginalRow227TriangleData0853.coefficient59_141, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_143, Icur := OriginalRow227TriangleData0840.coefficient58_142,
    output := OriginalRow227TriangleData0853.coefficient59_142, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_144, Icur := OriginalRow227TriangleData0840.coefficient58_143,
    output := OriginalRow227TriangleData0853.coefficient59_143, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_145, Icur := OriginalRow227TriangleData0840.coefficient58_144,
    output := OriginalRow227TriangleData0853.coefficient59_144, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_146, Icur := OriginalRow227TriangleData0840.coefficient58_145,
    output := OriginalRow227TriangleData0853.coefficient59_145, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_147, Icur := OriginalRow227TriangleData0840.coefficient58_146,
    output := OriginalRow227TriangleData0853.coefficient59_146, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_148, Icur := OriginalRow227TriangleData0840.coefficient58_147,
    output := OriginalRow227TriangleData0853.coefficient59_147, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_149, Icur := OriginalRow227TriangleData0840.coefficient58_148,
    output := OriginalRow227TriangleData0853.coefficient59_148, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_150, Icur := OriginalRow227TriangleData0840.coefficient58_149,
    output := OriginalRow227TriangleData0853.coefficient59_149, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_151, Icur := OriginalRow227TriangleData0840.coefficient58_150,
    output := OriginalRow227TriangleData0853.coefficient59_150, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0840.coefficient58_152, Icur := OriginalRow227TriangleData0840.coefficient58_151,
    output := OriginalRow227TriangleData0853.coefficient59_151, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0841.coefficient58_153, Icur := OriginalRow227TriangleData0840.coefficient58_152,
    output := OriginalRow227TriangleData0853.coefficient59_152, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0841.coefficient58_154, Icur := OriginalRow227TriangleData0841.coefficient58_153,
    output := OriginalRow227TriangleData0853.coefficient59_153, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0837

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0837.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
