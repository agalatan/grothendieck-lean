import Grothe.UpperChaos.OriginalRow227TriangleData0315
import Grothe.UpperChaos.OriginalRow227TriangleData0316
import Grothe.UpperChaos.OriginalRow227TriangleData0330
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0314
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_117, Icur := OriginalRow227TriangleData0315.coefficient20_116,
    output := OriginalRow227TriangleData0330.coefficient21_116, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_118, Icur := OriginalRow227TriangleData0315.coefficient20_117,
    output := OriginalRow227TriangleData0330.coefficient21_117, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_119, Icur := OriginalRow227TriangleData0315.coefficient20_118,
    output := OriginalRow227TriangleData0330.coefficient21_118, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_120, Icur := OriginalRow227TriangleData0315.coefficient20_119,
    output := OriginalRow227TriangleData0330.coefficient21_119, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_121, Icur := OriginalRow227TriangleData0315.coefficient20_120,
    output := OriginalRow227TriangleData0330.coefficient21_120, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_122, Icur := OriginalRow227TriangleData0315.coefficient20_121,
    output := OriginalRow227TriangleData0330.coefficient21_121, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_123, Icur := OriginalRow227TriangleData0315.coefficient20_122,
    output := OriginalRow227TriangleData0330.coefficient21_122, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_124, Icur := OriginalRow227TriangleData0315.coefficient20_123,
    output := OriginalRow227TriangleData0330.coefficient21_123, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_125, Icur := OriginalRow227TriangleData0315.coefficient20_124,
    output := OriginalRow227TriangleData0330.coefficient21_124, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_126, Icur := OriginalRow227TriangleData0315.coefficient20_125,
    output := OriginalRow227TriangleData0330.coefficient21_125, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_127, Icur := OriginalRow227TriangleData0315.coefficient20_126,
    output := OriginalRow227TriangleData0330.coefficient21_126, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_128, Icur := OriginalRow227TriangleData0315.coefficient20_127,
    output := OriginalRow227TriangleData0330.coefficient21_127, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_129, Icur := OriginalRow227TriangleData0315.coefficient20_128,
    output := OriginalRow227TriangleData0330.coefficient21_128, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_130, Icur := OriginalRow227TriangleData0315.coefficient20_129,
    output := OriginalRow227TriangleData0330.coefficient21_129, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_131, Icur := OriginalRow227TriangleData0315.coefficient20_130,
    output := OriginalRow227TriangleData0330.coefficient21_130, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_132, Icur := OriginalRow227TriangleData0315.coefficient20_131,
    output := OriginalRow227TriangleData0330.coefficient21_131, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_133, Icur := OriginalRow227TriangleData0315.coefficient20_132,
    output := OriginalRow227TriangleData0330.coefficient21_132, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_134, Icur := OriginalRow227TriangleData0315.coefficient20_133,
    output := OriginalRow227TriangleData0330.coefficient21_133, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_135, Icur := OriginalRow227TriangleData0315.coefficient20_134,
    output := OriginalRow227TriangleData0330.coefficient21_134, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_136, Icur := OriginalRow227TriangleData0315.coefficient20_135,
    output := OriginalRow227TriangleData0330.coefficient21_135, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_137, Icur := OriginalRow227TriangleData0315.coefficient20_136,
    output := OriginalRow227TriangleData0330.coefficient21_136, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_138, Icur := OriginalRow227TriangleData0315.coefficient20_137,
    output := OriginalRow227TriangleData0330.coefficient21_137, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_139, Icur := OriginalRow227TriangleData0315.coefficient20_138,
    output := OriginalRow227TriangleData0330.coefficient21_138, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_140, Icur := OriginalRow227TriangleData0315.coefficient20_139,
    output := OriginalRow227TriangleData0330.coefficient21_139, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_141, Icur := OriginalRow227TriangleData0315.coefficient20_140,
    output := OriginalRow227TriangleData0330.coefficient21_140, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_142, Icur := OriginalRow227TriangleData0315.coefficient20_141,
    output := OriginalRow227TriangleData0330.coefficient21_141, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_143, Icur := OriginalRow227TriangleData0315.coefficient20_142,
    output := OriginalRow227TriangleData0330.coefficient21_142, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_144, Icur := OriginalRow227TriangleData0315.coefficient20_143,
    output := OriginalRow227TriangleData0330.coefficient21_143, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_145, Icur := OriginalRow227TriangleData0315.coefficient20_144,
    output := OriginalRow227TriangleData0330.coefficient21_144, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_146, Icur := OriginalRow227TriangleData0315.coefficient20_145,
    output := OriginalRow227TriangleData0330.coefficient21_145, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_147, Icur := OriginalRow227TriangleData0315.coefficient20_146,
    output := OriginalRow227TriangleData0330.coefficient21_146, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_148, Icur := OriginalRow227TriangleData0316.coefficient20_147,
    output := OriginalRow227TriangleData0330.coefficient21_147, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0314

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0314.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
