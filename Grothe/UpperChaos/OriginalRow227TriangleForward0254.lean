import Grothe.UpperChaos.OriginalRow227TriangleData0255
import Grothe.UpperChaos.OriginalRow227TriangleData0256
import Grothe.UpperChaos.OriginalRow227TriangleData0270
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0254
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_113, Icur := OriginalRow227TriangleData0255.coefficient16_112,
    output := OriginalRow227TriangleData0270.coefficient17_112, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_114, Icur := OriginalRow227TriangleData0255.coefficient16_113,
    output := OriginalRow227TriangleData0270.coefficient17_113, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_115, Icur := OriginalRow227TriangleData0255.coefficient16_114,
    output := OriginalRow227TriangleData0270.coefficient17_114, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_116, Icur := OriginalRow227TriangleData0255.coefficient16_115,
    output := OriginalRow227TriangleData0270.coefficient17_115, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_117, Icur := OriginalRow227TriangleData0255.coefficient16_116,
    output := OriginalRow227TriangleData0270.coefficient17_116, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_118, Icur := OriginalRow227TriangleData0255.coefficient16_117,
    output := OriginalRow227TriangleData0270.coefficient17_117, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_119, Icur := OriginalRow227TriangleData0255.coefficient16_118,
    output := OriginalRow227TriangleData0270.coefficient17_118, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_120, Icur := OriginalRow227TriangleData0255.coefficient16_119,
    output := OriginalRow227TriangleData0270.coefficient17_119, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_121, Icur := OriginalRow227TriangleData0255.coefficient16_120,
    output := OriginalRow227TriangleData0270.coefficient17_120, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_122, Icur := OriginalRow227TriangleData0255.coefficient16_121,
    output := OriginalRow227TriangleData0270.coefficient17_121, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_123, Icur := OriginalRow227TriangleData0255.coefficient16_122,
    output := OriginalRow227TriangleData0270.coefficient17_122, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_124, Icur := OriginalRow227TriangleData0255.coefficient16_123,
    output := OriginalRow227TriangleData0270.coefficient17_123, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_125, Icur := OriginalRow227TriangleData0255.coefficient16_124,
    output := OriginalRow227TriangleData0270.coefficient17_124, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_126, Icur := OriginalRow227TriangleData0255.coefficient16_125,
    output := OriginalRow227TriangleData0270.coefficient17_125, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_127, Icur := OriginalRow227TriangleData0255.coefficient16_126,
    output := OriginalRow227TriangleData0270.coefficient17_126, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_128, Icur := OriginalRow227TriangleData0255.coefficient16_127,
    output := OriginalRow227TriangleData0270.coefficient17_127, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_129, Icur := OriginalRow227TriangleData0255.coefficient16_128,
    output := OriginalRow227TriangleData0270.coefficient17_128, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_130, Icur := OriginalRow227TriangleData0255.coefficient16_129,
    output := OriginalRow227TriangleData0270.coefficient17_129, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_131, Icur := OriginalRow227TriangleData0255.coefficient16_130,
    output := OriginalRow227TriangleData0270.coefficient17_130, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_132, Icur := OriginalRow227TriangleData0255.coefficient16_131,
    output := OriginalRow227TriangleData0270.coefficient17_131, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_133, Icur := OriginalRow227TriangleData0255.coefficient16_132,
    output := OriginalRow227TriangleData0270.coefficient17_132, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_134, Icur := OriginalRow227TriangleData0255.coefficient16_133,
    output := OriginalRow227TriangleData0270.coefficient17_133, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_135, Icur := OriginalRow227TriangleData0255.coefficient16_134,
    output := OriginalRow227TriangleData0270.coefficient17_134, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_136, Icur := OriginalRow227TriangleData0255.coefficient16_135,
    output := OriginalRow227TriangleData0270.coefficient17_135, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_137, Icur := OriginalRow227TriangleData0255.coefficient16_136,
    output := OriginalRow227TriangleData0270.coefficient17_136, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_138, Icur := OriginalRow227TriangleData0255.coefficient16_137,
    output := OriginalRow227TriangleData0270.coefficient17_137, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_139, Icur := OriginalRow227TriangleData0255.coefficient16_138,
    output := OriginalRow227TriangleData0270.coefficient17_138, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_140, Icur := OriginalRow227TriangleData0255.coefficient16_139,
    output := OriginalRow227TriangleData0270.coefficient17_139, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_141, Icur := OriginalRow227TriangleData0255.coefficient16_140,
    output := OriginalRow227TriangleData0270.coefficient17_140, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0255.coefficient16_142, Icur := OriginalRow227TriangleData0255.coefficient16_141,
    output := OriginalRow227TriangleData0270.coefficient17_141, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0256.coefficient16_143, Icur := OriginalRow227TriangleData0255.coefficient16_142,
    output := OriginalRow227TriangleData0270.coefficient17_142, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0256.coefficient16_144, Icur := OriginalRow227TriangleData0256.coefficient16_143,
    output := OriginalRow227TriangleData0270.coefficient17_143, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0254

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0254.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
