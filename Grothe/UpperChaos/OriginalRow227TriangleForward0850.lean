import Grothe.UpperChaos.OriginalRow227TriangleData0853
import Grothe.UpperChaos.OriginalRow227TriangleData0854
import Grothe.UpperChaos.OriginalRow227TriangleData0866
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0850
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_124, Icur := OriginalRow227TriangleData0853.coefficient59_123,
    output := OriginalRow227TriangleData0866.coefficient60_123, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_125, Icur := OriginalRow227TriangleData0853.coefficient59_124,
    output := OriginalRow227TriangleData0866.coefficient60_124, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_126, Icur := OriginalRow227TriangleData0853.coefficient59_125,
    output := OriginalRow227TriangleData0866.coefficient60_125, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_127, Icur := OriginalRow227TriangleData0853.coefficient59_126,
    output := OriginalRow227TriangleData0866.coefficient60_126, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_128, Icur := OriginalRow227TriangleData0853.coefficient59_127,
    output := OriginalRow227TriangleData0866.coefficient60_127, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_129, Icur := OriginalRow227TriangleData0853.coefficient59_128,
    output := OriginalRow227TriangleData0866.coefficient60_128, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_130, Icur := OriginalRow227TriangleData0853.coefficient59_129,
    output := OriginalRow227TriangleData0866.coefficient60_129, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_131, Icur := OriginalRow227TriangleData0853.coefficient59_130,
    output := OriginalRow227TriangleData0866.coefficient60_130, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_132, Icur := OriginalRow227TriangleData0853.coefficient59_131,
    output := OriginalRow227TriangleData0866.coefficient60_131, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_133, Icur := OriginalRow227TriangleData0853.coefficient59_132,
    output := OriginalRow227TriangleData0866.coefficient60_132, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_134, Icur := OriginalRow227TriangleData0853.coefficient59_133,
    output := OriginalRow227TriangleData0866.coefficient60_133, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_135, Icur := OriginalRow227TriangleData0853.coefficient59_134,
    output := OriginalRow227TriangleData0866.coefficient60_134, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_136, Icur := OriginalRow227TriangleData0853.coefficient59_135,
    output := OriginalRow227TriangleData0866.coefficient60_135, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_137, Icur := OriginalRow227TriangleData0853.coefficient59_136,
    output := OriginalRow227TriangleData0866.coefficient60_136, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_138, Icur := OriginalRow227TriangleData0853.coefficient59_137,
    output := OriginalRow227TriangleData0866.coefficient60_137, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_139, Icur := OriginalRow227TriangleData0853.coefficient59_138,
    output := OriginalRow227TriangleData0866.coefficient60_138, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_140, Icur := OriginalRow227TriangleData0853.coefficient59_139,
    output := OriginalRow227TriangleData0866.coefficient60_139, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_141, Icur := OriginalRow227TriangleData0853.coefficient59_140,
    output := OriginalRow227TriangleData0866.coefficient60_140, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_142, Icur := OriginalRow227TriangleData0853.coefficient59_141,
    output := OriginalRow227TriangleData0866.coefficient60_141, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_143, Icur := OriginalRow227TriangleData0853.coefficient59_142,
    output := OriginalRow227TriangleData0866.coefficient60_142, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_144, Icur := OriginalRow227TriangleData0853.coefficient59_143,
    output := OriginalRow227TriangleData0866.coefficient60_143, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_145, Icur := OriginalRow227TriangleData0853.coefficient59_144,
    output := OriginalRow227TriangleData0866.coefficient60_144, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_146, Icur := OriginalRow227TriangleData0853.coefficient59_145,
    output := OriginalRow227TriangleData0866.coefficient60_145, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_147, Icur := OriginalRow227TriangleData0853.coefficient59_146,
    output := OriginalRow227TriangleData0866.coefficient60_146, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_148, Icur := OriginalRow227TriangleData0853.coefficient59_147,
    output := OriginalRow227TriangleData0866.coefficient60_147, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_149, Icur := OriginalRow227TriangleData0853.coefficient59_148,
    output := OriginalRow227TriangleData0866.coefficient60_148, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_150, Icur := OriginalRow227TriangleData0853.coefficient59_149,
    output := OriginalRow227TriangleData0866.coefficient60_149, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_151, Icur := OriginalRow227TriangleData0853.coefficient59_150,
    output := OriginalRow227TriangleData0866.coefficient60_150, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_152, Icur := OriginalRow227TriangleData0853.coefficient59_151,
    output := OriginalRow227TriangleData0866.coefficient60_151, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_153, Icur := OriginalRow227TriangleData0853.coefficient59_152,
    output := OriginalRow227TriangleData0866.coefficient60_152, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_154, Icur := OriginalRow227TriangleData0853.coefficient59_153,
    output := OriginalRow227TriangleData0866.coefficient60_153, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_155, Icur := OriginalRow227TriangleData0854.coefficient59_154,
    output := OriginalRow227TriangleData0866.coefficient60_154, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0850

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0850.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
