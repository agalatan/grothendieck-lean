import Grothe.UpperChaos.OriginalRow227TriangleData0285
import Grothe.UpperChaos.OriginalRow227TriangleData0286
import Grothe.UpperChaos.OriginalRow227TriangleData0300
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0284
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_115, Icur := OriginalRow227TriangleData0285.coefficient18_114,
    output := OriginalRow227TriangleData0300.coefficient19_114, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_116, Icur := OriginalRow227TriangleData0285.coefficient18_115,
    output := OriginalRow227TriangleData0300.coefficient19_115, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_117, Icur := OriginalRow227TriangleData0285.coefficient18_116,
    output := OriginalRow227TriangleData0300.coefficient19_116, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_118, Icur := OriginalRow227TriangleData0285.coefficient18_117,
    output := OriginalRow227TriangleData0300.coefficient19_117, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_119, Icur := OriginalRow227TriangleData0285.coefficient18_118,
    output := OriginalRow227TriangleData0300.coefficient19_118, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_120, Icur := OriginalRow227TriangleData0285.coefficient18_119,
    output := OriginalRow227TriangleData0300.coefficient19_119, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_121, Icur := OriginalRow227TriangleData0285.coefficient18_120,
    output := OriginalRow227TriangleData0300.coefficient19_120, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_122, Icur := OriginalRow227TriangleData0285.coefficient18_121,
    output := OriginalRow227TriangleData0300.coefficient19_121, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_123, Icur := OriginalRow227TriangleData0285.coefficient18_122,
    output := OriginalRow227TriangleData0300.coefficient19_122, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_124, Icur := OriginalRow227TriangleData0285.coefficient18_123,
    output := OriginalRow227TriangleData0300.coefficient19_123, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_125, Icur := OriginalRow227TriangleData0285.coefficient18_124,
    output := OriginalRow227TriangleData0300.coefficient19_124, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_126, Icur := OriginalRow227TriangleData0285.coefficient18_125,
    output := OriginalRow227TriangleData0300.coefficient19_125, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_127, Icur := OriginalRow227TriangleData0285.coefficient18_126,
    output := OriginalRow227TriangleData0300.coefficient19_126, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_128, Icur := OriginalRow227TriangleData0285.coefficient18_127,
    output := OriginalRow227TriangleData0300.coefficient19_127, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_129, Icur := OriginalRow227TriangleData0285.coefficient18_128,
    output := OriginalRow227TriangleData0300.coefficient19_128, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_130, Icur := OriginalRow227TriangleData0285.coefficient18_129,
    output := OriginalRow227TriangleData0300.coefficient19_129, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_131, Icur := OriginalRow227TriangleData0285.coefficient18_130,
    output := OriginalRow227TriangleData0300.coefficient19_130, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_132, Icur := OriginalRow227TriangleData0285.coefficient18_131,
    output := OriginalRow227TriangleData0300.coefficient19_131, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_133, Icur := OriginalRow227TriangleData0285.coefficient18_132,
    output := OriginalRow227TriangleData0300.coefficient19_132, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_134, Icur := OriginalRow227TriangleData0285.coefficient18_133,
    output := OriginalRow227TriangleData0300.coefficient19_133, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_135, Icur := OriginalRow227TriangleData0285.coefficient18_134,
    output := OriginalRow227TriangleData0300.coefficient19_134, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_136, Icur := OriginalRow227TriangleData0285.coefficient18_135,
    output := OriginalRow227TriangleData0300.coefficient19_135, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_137, Icur := OriginalRow227TriangleData0285.coefficient18_136,
    output := OriginalRow227TriangleData0300.coefficient19_136, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_138, Icur := OriginalRow227TriangleData0285.coefficient18_137,
    output := OriginalRow227TriangleData0300.coefficient19_137, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_139, Icur := OriginalRow227TriangleData0285.coefficient18_138,
    output := OriginalRow227TriangleData0300.coefficient19_138, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_140, Icur := OriginalRow227TriangleData0285.coefficient18_139,
    output := OriginalRow227TriangleData0300.coefficient19_139, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_141, Icur := OriginalRow227TriangleData0285.coefficient18_140,
    output := OriginalRow227TriangleData0300.coefficient19_140, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_142, Icur := OriginalRow227TriangleData0285.coefficient18_141,
    output := OriginalRow227TriangleData0300.coefficient19_141, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_143, Icur := OriginalRow227TriangleData0285.coefficient18_142,
    output := OriginalRow227TriangleData0300.coefficient19_142, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0285.coefficient18_144, Icur := OriginalRow227TriangleData0285.coefficient18_143,
    output := OriginalRow227TriangleData0300.coefficient19_143, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0286.coefficient18_145, Icur := OriginalRow227TriangleData0285.coefficient18_144,
    output := OriginalRow227TriangleData0300.coefficient19_144, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0286.coefficient18_146, Icur := OriginalRow227TriangleData0286.coefficient18_145,
    output := OriginalRow227TriangleData0300.coefficient19_145, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0284

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0284.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
