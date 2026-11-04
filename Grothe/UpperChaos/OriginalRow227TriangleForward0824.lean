import Grothe.UpperChaos.OriginalRow227TriangleData0827
import Grothe.UpperChaos.OriginalRow227TriangleData0828
import Grothe.UpperChaos.OriginalRow227TriangleData0840
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0824
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_122, Icur := OriginalRow227TriangleData0827.coefficient57_121,
    output := OriginalRow227TriangleData0840.coefficient58_121, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_123, Icur := OriginalRow227TriangleData0827.coefficient57_122,
    output := OriginalRow227TriangleData0840.coefficient58_122, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_124, Icur := OriginalRow227TriangleData0827.coefficient57_123,
    output := OriginalRow227TriangleData0840.coefficient58_123, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_125, Icur := OriginalRow227TriangleData0827.coefficient57_124,
    output := OriginalRow227TriangleData0840.coefficient58_124, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_126, Icur := OriginalRow227TriangleData0827.coefficient57_125,
    output := OriginalRow227TriangleData0840.coefficient58_125, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_127, Icur := OriginalRow227TriangleData0827.coefficient57_126,
    output := OriginalRow227TriangleData0840.coefficient58_126, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_128, Icur := OriginalRow227TriangleData0827.coefficient57_127,
    output := OriginalRow227TriangleData0840.coefficient58_127, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_129, Icur := OriginalRow227TriangleData0827.coefficient57_128,
    output := OriginalRow227TriangleData0840.coefficient58_128, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_130, Icur := OriginalRow227TriangleData0827.coefficient57_129,
    output := OriginalRow227TriangleData0840.coefficient58_129, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_131, Icur := OriginalRow227TriangleData0827.coefficient57_130,
    output := OriginalRow227TriangleData0840.coefficient58_130, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_132, Icur := OriginalRow227TriangleData0827.coefficient57_131,
    output := OriginalRow227TriangleData0840.coefficient58_131, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_133, Icur := OriginalRow227TriangleData0827.coefficient57_132,
    output := OriginalRow227TriangleData0840.coefficient58_132, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_134, Icur := OriginalRow227TriangleData0827.coefficient57_133,
    output := OriginalRow227TriangleData0840.coefficient58_133, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_135, Icur := OriginalRow227TriangleData0827.coefficient57_134,
    output := OriginalRow227TriangleData0840.coefficient58_134, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_136, Icur := OriginalRow227TriangleData0827.coefficient57_135,
    output := OriginalRow227TriangleData0840.coefficient58_135, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_137, Icur := OriginalRow227TriangleData0827.coefficient57_136,
    output := OriginalRow227TriangleData0840.coefficient58_136, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_138, Icur := OriginalRow227TriangleData0827.coefficient57_137,
    output := OriginalRow227TriangleData0840.coefficient58_137, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_139, Icur := OriginalRow227TriangleData0827.coefficient57_138,
    output := OriginalRow227TriangleData0840.coefficient58_138, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_140, Icur := OriginalRow227TriangleData0827.coefficient57_139,
    output := OriginalRow227TriangleData0840.coefficient58_139, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_141, Icur := OriginalRow227TriangleData0827.coefficient57_140,
    output := OriginalRow227TriangleData0840.coefficient58_140, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_142, Icur := OriginalRow227TriangleData0827.coefficient57_141,
    output := OriginalRow227TriangleData0840.coefficient58_141, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_143, Icur := OriginalRow227TriangleData0827.coefficient57_142,
    output := OriginalRow227TriangleData0840.coefficient58_142, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_144, Icur := OriginalRow227TriangleData0827.coefficient57_143,
    output := OriginalRow227TriangleData0840.coefficient58_143, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_145, Icur := OriginalRow227TriangleData0827.coefficient57_144,
    output := OriginalRow227TriangleData0840.coefficient58_144, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_146, Icur := OriginalRow227TriangleData0827.coefficient57_145,
    output := OriginalRow227TriangleData0840.coefficient58_145, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_147, Icur := OriginalRow227TriangleData0827.coefficient57_146,
    output := OriginalRow227TriangleData0840.coefficient58_146, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_148, Icur := OriginalRow227TriangleData0827.coefficient57_147,
    output := OriginalRow227TriangleData0840.coefficient58_147, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_149, Icur := OriginalRow227TriangleData0827.coefficient57_148,
    output := OriginalRow227TriangleData0840.coefficient58_148, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_150, Icur := OriginalRow227TriangleData0827.coefficient57_149,
    output := OriginalRow227TriangleData0840.coefficient58_149, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_151, Icur := OriginalRow227TriangleData0827.coefficient57_150,
    output := OriginalRow227TriangleData0840.coefficient58_150, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0828.coefficient57_152, Icur := OriginalRow227TriangleData0827.coefficient57_151,
    output := OriginalRow227TriangleData0840.coefficient58_151, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0828.coefficient57_153, Icur := OriginalRow227TriangleData0828.coefficient57_152,
    output := OriginalRow227TriangleData0840.coefficient58_152, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0824

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0824.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
