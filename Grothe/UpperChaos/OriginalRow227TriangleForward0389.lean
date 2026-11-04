import Grothe.UpperChaos.OriginalRow227TriangleData0390
import Grothe.UpperChaos.OriginalRow227TriangleData0391
import Grothe.UpperChaos.OriginalRow227TriangleData0405
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0389
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_122, Icur := OriginalRow227TriangleData0390.coefficient25_121,
    output := OriginalRow227TriangleData0405.coefficient26_121, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_123, Icur := OriginalRow227TriangleData0390.coefficient25_122,
    output := OriginalRow227TriangleData0405.coefficient26_122, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_124, Icur := OriginalRow227TriangleData0390.coefficient25_123,
    output := OriginalRow227TriangleData0405.coefficient26_123, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_125, Icur := OriginalRow227TriangleData0390.coefficient25_124,
    output := OriginalRow227TriangleData0405.coefficient26_124, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_126, Icur := OriginalRow227TriangleData0390.coefficient25_125,
    output := OriginalRow227TriangleData0405.coefficient26_125, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_127, Icur := OriginalRow227TriangleData0390.coefficient25_126,
    output := OriginalRow227TriangleData0405.coefficient26_126, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_128, Icur := OriginalRow227TriangleData0390.coefficient25_127,
    output := OriginalRow227TriangleData0405.coefficient26_127, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_129, Icur := OriginalRow227TriangleData0390.coefficient25_128,
    output := OriginalRow227TriangleData0405.coefficient26_128, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_130, Icur := OriginalRow227TriangleData0390.coefficient25_129,
    output := OriginalRow227TriangleData0405.coefficient26_129, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_131, Icur := OriginalRow227TriangleData0390.coefficient25_130,
    output := OriginalRow227TriangleData0405.coefficient26_130, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_132, Icur := OriginalRow227TriangleData0390.coefficient25_131,
    output := OriginalRow227TriangleData0405.coefficient26_131, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_133, Icur := OriginalRow227TriangleData0390.coefficient25_132,
    output := OriginalRow227TriangleData0405.coefficient26_132, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_134, Icur := OriginalRow227TriangleData0390.coefficient25_133,
    output := OriginalRow227TriangleData0405.coefficient26_133, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_135, Icur := OriginalRow227TriangleData0390.coefficient25_134,
    output := OriginalRow227TriangleData0405.coefficient26_134, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_136, Icur := OriginalRow227TriangleData0390.coefficient25_135,
    output := OriginalRow227TriangleData0405.coefficient26_135, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_137, Icur := OriginalRow227TriangleData0390.coefficient25_136,
    output := OriginalRow227TriangleData0405.coefficient26_136, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_138, Icur := OriginalRow227TriangleData0390.coefficient25_137,
    output := OriginalRow227TriangleData0405.coefficient26_137, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_139, Icur := OriginalRow227TriangleData0390.coefficient25_138,
    output := OriginalRow227TriangleData0405.coefficient26_138, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_140, Icur := OriginalRow227TriangleData0390.coefficient25_139,
    output := OriginalRow227TriangleData0405.coefficient26_139, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_141, Icur := OriginalRow227TriangleData0390.coefficient25_140,
    output := OriginalRow227TriangleData0405.coefficient26_140, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_142, Icur := OriginalRow227TriangleData0390.coefficient25_141,
    output := OriginalRow227TriangleData0405.coefficient26_141, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_143, Icur := OriginalRow227TriangleData0390.coefficient25_142,
    output := OriginalRow227TriangleData0405.coefficient26_142, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_144, Icur := OriginalRow227TriangleData0390.coefficient25_143,
    output := OriginalRow227TriangleData0405.coefficient26_143, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_145, Icur := OriginalRow227TriangleData0390.coefficient25_144,
    output := OriginalRow227TriangleData0405.coefficient26_144, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_146, Icur := OriginalRow227TriangleData0390.coefficient25_145,
    output := OriginalRow227TriangleData0405.coefficient26_145, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_147, Icur := OriginalRow227TriangleData0390.coefficient25_146,
    output := OriginalRow227TriangleData0405.coefficient26_146, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_148, Icur := OriginalRow227TriangleData0390.coefficient25_147,
    output := OriginalRow227TriangleData0405.coefficient26_147, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_149, Icur := OriginalRow227TriangleData0390.coefficient25_148,
    output := OriginalRow227TriangleData0405.coefficient26_148, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_150, Icur := OriginalRow227TriangleData0390.coefficient25_149,
    output := OriginalRow227TriangleData0405.coefficient26_149, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0390.coefficient25_151, Icur := OriginalRow227TriangleData0390.coefficient25_150,
    output := OriginalRow227TriangleData0405.coefficient26_150, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0391.coefficient25_152, Icur := OriginalRow227TriangleData0390.coefficient25_151,
    output := OriginalRow227TriangleData0405.coefficient26_151, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0391.coefficient25_153, Icur := OriginalRow227TriangleData0391.coefficient25_152,
    output := OriginalRow227TriangleData0405.coefficient26_152, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0389

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0389.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
