import Grothe.UpperChaos.OriginalRow227TriangleData0814
import Grothe.UpperChaos.OriginalRow227TriangleData0815
import Grothe.UpperChaos.OriginalRow227TriangleData0827
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0811
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_121, Icur := OriginalRow227TriangleData0814.coefficient56_120,
    output := OriginalRow227TriangleData0827.coefficient57_120, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_122, Icur := OriginalRow227TriangleData0814.coefficient56_121,
    output := OriginalRow227TriangleData0827.coefficient57_121, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_123, Icur := OriginalRow227TriangleData0814.coefficient56_122,
    output := OriginalRow227TriangleData0827.coefficient57_122, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_124, Icur := OriginalRow227TriangleData0814.coefficient56_123,
    output := OriginalRow227TriangleData0827.coefficient57_123, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_125, Icur := OriginalRow227TriangleData0814.coefficient56_124,
    output := OriginalRow227TriangleData0827.coefficient57_124, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_126, Icur := OriginalRow227TriangleData0814.coefficient56_125,
    output := OriginalRow227TriangleData0827.coefficient57_125, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_127, Icur := OriginalRow227TriangleData0814.coefficient56_126,
    output := OriginalRow227TriangleData0827.coefficient57_126, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_128, Icur := OriginalRow227TriangleData0814.coefficient56_127,
    output := OriginalRow227TriangleData0827.coefficient57_127, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_129, Icur := OriginalRow227TriangleData0814.coefficient56_128,
    output := OriginalRow227TriangleData0827.coefficient57_128, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_130, Icur := OriginalRow227TriangleData0814.coefficient56_129,
    output := OriginalRow227TriangleData0827.coefficient57_129, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_131, Icur := OriginalRow227TriangleData0814.coefficient56_130,
    output := OriginalRow227TriangleData0827.coefficient57_130, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_132, Icur := OriginalRow227TriangleData0814.coefficient56_131,
    output := OriginalRow227TriangleData0827.coefficient57_131, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_133, Icur := OriginalRow227TriangleData0814.coefficient56_132,
    output := OriginalRow227TriangleData0827.coefficient57_132, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_134, Icur := OriginalRow227TriangleData0814.coefficient56_133,
    output := OriginalRow227TriangleData0827.coefficient57_133, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_135, Icur := OriginalRow227TriangleData0814.coefficient56_134,
    output := OriginalRow227TriangleData0827.coefficient57_134, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_136, Icur := OriginalRow227TriangleData0814.coefficient56_135,
    output := OriginalRow227TriangleData0827.coefficient57_135, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_137, Icur := OriginalRow227TriangleData0814.coefficient56_136,
    output := OriginalRow227TriangleData0827.coefficient57_136, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_138, Icur := OriginalRow227TriangleData0814.coefficient56_137,
    output := OriginalRow227TriangleData0827.coefficient57_137, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_139, Icur := OriginalRow227TriangleData0814.coefficient56_138,
    output := OriginalRow227TriangleData0827.coefficient57_138, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_140, Icur := OriginalRow227TriangleData0814.coefficient56_139,
    output := OriginalRow227TriangleData0827.coefficient57_139, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_141, Icur := OriginalRow227TriangleData0814.coefficient56_140,
    output := OriginalRow227TriangleData0827.coefficient57_140, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_142, Icur := OriginalRow227TriangleData0814.coefficient56_141,
    output := OriginalRow227TriangleData0827.coefficient57_141, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_143, Icur := OriginalRow227TriangleData0814.coefficient56_142,
    output := OriginalRow227TriangleData0827.coefficient57_142, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_144, Icur := OriginalRow227TriangleData0814.coefficient56_143,
    output := OriginalRow227TriangleData0827.coefficient57_143, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_145, Icur := OriginalRow227TriangleData0814.coefficient56_144,
    output := OriginalRow227TriangleData0827.coefficient57_144, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_146, Icur := OriginalRow227TriangleData0814.coefficient56_145,
    output := OriginalRow227TriangleData0827.coefficient57_145, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_147, Icur := OriginalRow227TriangleData0814.coefficient56_146,
    output := OriginalRow227TriangleData0827.coefficient57_146, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_148, Icur := OriginalRow227TriangleData0814.coefficient56_147,
    output := OriginalRow227TriangleData0827.coefficient57_147, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_149, Icur := OriginalRow227TriangleData0814.coefficient56_148,
    output := OriginalRow227TriangleData0827.coefficient57_148, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_150, Icur := OriginalRow227TriangleData0814.coefficient56_149,
    output := OriginalRow227TriangleData0827.coefficient57_149, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0815.coefficient56_151, Icur := OriginalRow227TriangleData0814.coefficient56_150,
    output := OriginalRow227TriangleData0827.coefficient57_150, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0815.coefficient56_152, Icur := OriginalRow227TriangleData0815.coefficient56_151,
    output := OriginalRow227TriangleData0827.coefficient57_151, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0811

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0811.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
