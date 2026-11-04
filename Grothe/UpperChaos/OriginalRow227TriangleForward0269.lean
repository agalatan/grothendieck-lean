import Grothe.UpperChaos.OriginalRow227TriangleData0270
import Grothe.UpperChaos.OriginalRow227TriangleData0271
import Grothe.UpperChaos.OriginalRow227TriangleData0285
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0269
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_114, Icur := OriginalRow227TriangleData0270.coefficient17_113,
    output := OriginalRow227TriangleData0285.coefficient18_113, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_115, Icur := OriginalRow227TriangleData0270.coefficient17_114,
    output := OriginalRow227TriangleData0285.coefficient18_114, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_116, Icur := OriginalRow227TriangleData0270.coefficient17_115,
    output := OriginalRow227TriangleData0285.coefficient18_115, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_117, Icur := OriginalRow227TriangleData0270.coefficient17_116,
    output := OriginalRow227TriangleData0285.coefficient18_116, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_118, Icur := OriginalRow227TriangleData0270.coefficient17_117,
    output := OriginalRow227TriangleData0285.coefficient18_117, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_119, Icur := OriginalRow227TriangleData0270.coefficient17_118,
    output := OriginalRow227TriangleData0285.coefficient18_118, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_120, Icur := OriginalRow227TriangleData0270.coefficient17_119,
    output := OriginalRow227TriangleData0285.coefficient18_119, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_121, Icur := OriginalRow227TriangleData0270.coefficient17_120,
    output := OriginalRow227TriangleData0285.coefficient18_120, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_122, Icur := OriginalRow227TriangleData0270.coefficient17_121,
    output := OriginalRow227TriangleData0285.coefficient18_121, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_123, Icur := OriginalRow227TriangleData0270.coefficient17_122,
    output := OriginalRow227TriangleData0285.coefficient18_122, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_124, Icur := OriginalRow227TriangleData0270.coefficient17_123,
    output := OriginalRow227TriangleData0285.coefficient18_123, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_125, Icur := OriginalRow227TriangleData0270.coefficient17_124,
    output := OriginalRow227TriangleData0285.coefficient18_124, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_126, Icur := OriginalRow227TriangleData0270.coefficient17_125,
    output := OriginalRow227TriangleData0285.coefficient18_125, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_127, Icur := OriginalRow227TriangleData0270.coefficient17_126,
    output := OriginalRow227TriangleData0285.coefficient18_126, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_128, Icur := OriginalRow227TriangleData0270.coefficient17_127,
    output := OriginalRow227TriangleData0285.coefficient18_127, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_129, Icur := OriginalRow227TriangleData0270.coefficient17_128,
    output := OriginalRow227TriangleData0285.coefficient18_128, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_130, Icur := OriginalRow227TriangleData0270.coefficient17_129,
    output := OriginalRow227TriangleData0285.coefficient18_129, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_131, Icur := OriginalRow227TriangleData0270.coefficient17_130,
    output := OriginalRow227TriangleData0285.coefficient18_130, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_132, Icur := OriginalRow227TriangleData0270.coefficient17_131,
    output := OriginalRow227TriangleData0285.coefficient18_131, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_133, Icur := OriginalRow227TriangleData0270.coefficient17_132,
    output := OriginalRow227TriangleData0285.coefficient18_132, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_134, Icur := OriginalRow227TriangleData0270.coefficient17_133,
    output := OriginalRow227TriangleData0285.coefficient18_133, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_135, Icur := OriginalRow227TriangleData0270.coefficient17_134,
    output := OriginalRow227TriangleData0285.coefficient18_134, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_136, Icur := OriginalRow227TriangleData0270.coefficient17_135,
    output := OriginalRow227TriangleData0285.coefficient18_135, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_137, Icur := OriginalRow227TriangleData0270.coefficient17_136,
    output := OriginalRow227TriangleData0285.coefficient18_136, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_138, Icur := OriginalRow227TriangleData0270.coefficient17_137,
    output := OriginalRow227TriangleData0285.coefficient18_137, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_139, Icur := OriginalRow227TriangleData0270.coefficient17_138,
    output := OriginalRow227TriangleData0285.coefficient18_138, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_140, Icur := OriginalRow227TriangleData0270.coefficient17_139,
    output := OriginalRow227TriangleData0285.coefficient18_139, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_141, Icur := OriginalRow227TriangleData0270.coefficient17_140,
    output := OriginalRow227TriangleData0285.coefficient18_140, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_142, Icur := OriginalRow227TriangleData0270.coefficient17_141,
    output := OriginalRow227TriangleData0285.coefficient18_141, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_143, Icur := OriginalRow227TriangleData0270.coefficient17_142,
    output := OriginalRow227TriangleData0285.coefficient18_142, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_144, Icur := OriginalRow227TriangleData0270.coefficient17_143,
    output := OriginalRow227TriangleData0285.coefficient18_143, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_145, Icur := OriginalRow227TriangleData0271.coefficient17_144,
    output := OriginalRow227TriangleData0285.coefficient18_144, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0269

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0269.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
