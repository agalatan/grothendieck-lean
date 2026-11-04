import Grothe.UpperChaos.OriginalRow227TriangleData0225
import Grothe.UpperChaos.OriginalRow227TriangleData0226
import Grothe.UpperChaos.OriginalRow227TriangleData0240
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0224
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_111, Icur := OriginalRow227TriangleData0225.coefficient14_110,
    output := OriginalRow227TriangleData0240.coefficient15_110, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_112, Icur := OriginalRow227TriangleData0225.coefficient14_111,
    output := OriginalRow227TriangleData0240.coefficient15_111, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_113, Icur := OriginalRow227TriangleData0225.coefficient14_112,
    output := OriginalRow227TriangleData0240.coefficient15_112, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_114, Icur := OriginalRow227TriangleData0225.coefficient14_113,
    output := OriginalRow227TriangleData0240.coefficient15_113, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_115, Icur := OriginalRow227TriangleData0225.coefficient14_114,
    output := OriginalRow227TriangleData0240.coefficient15_114, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_116, Icur := OriginalRow227TriangleData0225.coefficient14_115,
    output := OriginalRow227TriangleData0240.coefficient15_115, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_117, Icur := OriginalRow227TriangleData0225.coefficient14_116,
    output := OriginalRow227TriangleData0240.coefficient15_116, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_118, Icur := OriginalRow227TriangleData0225.coefficient14_117,
    output := OriginalRow227TriangleData0240.coefficient15_117, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_119, Icur := OriginalRow227TriangleData0225.coefficient14_118,
    output := OriginalRow227TriangleData0240.coefficient15_118, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_120, Icur := OriginalRow227TriangleData0225.coefficient14_119,
    output := OriginalRow227TriangleData0240.coefficient15_119, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_121, Icur := OriginalRow227TriangleData0225.coefficient14_120,
    output := OriginalRow227TriangleData0240.coefficient15_120, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_122, Icur := OriginalRow227TriangleData0225.coefficient14_121,
    output := OriginalRow227TriangleData0240.coefficient15_121, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_123, Icur := OriginalRow227TriangleData0225.coefficient14_122,
    output := OriginalRow227TriangleData0240.coefficient15_122, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_124, Icur := OriginalRow227TriangleData0225.coefficient14_123,
    output := OriginalRow227TriangleData0240.coefficient15_123, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_125, Icur := OriginalRow227TriangleData0225.coefficient14_124,
    output := OriginalRow227TriangleData0240.coefficient15_124, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_126, Icur := OriginalRow227TriangleData0225.coefficient14_125,
    output := OriginalRow227TriangleData0240.coefficient15_125, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_127, Icur := OriginalRow227TriangleData0225.coefficient14_126,
    output := OriginalRow227TriangleData0240.coefficient15_126, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_128, Icur := OriginalRow227TriangleData0225.coefficient14_127,
    output := OriginalRow227TriangleData0240.coefficient15_127, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_129, Icur := OriginalRow227TriangleData0225.coefficient14_128,
    output := OriginalRow227TriangleData0240.coefficient15_128, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_130, Icur := OriginalRow227TriangleData0225.coefficient14_129,
    output := OriginalRow227TriangleData0240.coefficient15_129, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_131, Icur := OriginalRow227TriangleData0225.coefficient14_130,
    output := OriginalRow227TriangleData0240.coefficient15_130, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_132, Icur := OriginalRow227TriangleData0225.coefficient14_131,
    output := OriginalRow227TriangleData0240.coefficient15_131, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_133, Icur := OriginalRow227TriangleData0225.coefficient14_132,
    output := OriginalRow227TriangleData0240.coefficient15_132, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_134, Icur := OriginalRow227TriangleData0225.coefficient14_133,
    output := OriginalRow227TriangleData0240.coefficient15_133, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_135, Icur := OriginalRow227TriangleData0225.coefficient14_134,
    output := OriginalRow227TriangleData0240.coefficient15_134, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_136, Icur := OriginalRow227TriangleData0225.coefficient14_135,
    output := OriginalRow227TriangleData0240.coefficient15_135, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_137, Icur := OriginalRow227TriangleData0225.coefficient14_136,
    output := OriginalRow227TriangleData0240.coefficient15_136, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_138, Icur := OriginalRow227TriangleData0225.coefficient14_137,
    output := OriginalRow227TriangleData0240.coefficient15_137, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_139, Icur := OriginalRow227TriangleData0225.coefficient14_138,
    output := OriginalRow227TriangleData0240.coefficient15_138, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0225.coefficient14_140, Icur := OriginalRow227TriangleData0225.coefficient14_139,
    output := OriginalRow227TriangleData0240.coefficient15_139, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0226.coefficient14_141, Icur := OriginalRow227TriangleData0225.coefficient14_140,
    output := OriginalRow227TriangleData0240.coefficient15_140, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0226.coefficient14_142, Icur := OriginalRow227TriangleData0226.coefficient14_141,
    output := OriginalRow227TriangleData0240.coefficient15_141, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0224

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0224.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
