import Grothe.UpperChaos.OriginalRow227TriangleData0131
import Grothe.UpperChaos.OriginalRow227TriangleData0132
import Grothe.UpperChaos.OriginalRow227TriangleData0147
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0131
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_105, Icur := OriginalRow227TriangleData0131.coefficient8_104,
    output := OriginalRow227TriangleData0147.coefficient9_104, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_106, Icur := OriginalRow227TriangleData0131.coefficient8_105,
    output := OriginalRow227TriangleData0147.coefficient9_105, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_107, Icur := OriginalRow227TriangleData0131.coefficient8_106,
    output := OriginalRow227TriangleData0147.coefficient9_106, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_108, Icur := OriginalRow227TriangleData0131.coefficient8_107,
    output := OriginalRow227TriangleData0147.coefficient9_107, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_109, Icur := OriginalRow227TriangleData0131.coefficient8_108,
    output := OriginalRow227TriangleData0147.coefficient9_108, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_110, Icur := OriginalRow227TriangleData0131.coefficient8_109,
    output := OriginalRow227TriangleData0147.coefficient9_109, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_111, Icur := OriginalRow227TriangleData0131.coefficient8_110,
    output := OriginalRow227TriangleData0147.coefficient9_110, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_112, Icur := OriginalRow227TriangleData0131.coefficient8_111,
    output := OriginalRow227TriangleData0147.coefficient9_111, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_113, Icur := OriginalRow227TriangleData0131.coefficient8_112,
    output := OriginalRow227TriangleData0147.coefficient9_112, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_114, Icur := OriginalRow227TriangleData0131.coefficient8_113,
    output := OriginalRow227TriangleData0147.coefficient9_113, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_115, Icur := OriginalRow227TriangleData0131.coefficient8_114,
    output := OriginalRow227TriangleData0147.coefficient9_114, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_116, Icur := OriginalRow227TriangleData0131.coefficient8_115,
    output := OriginalRow227TriangleData0147.coefficient9_115, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_117, Icur := OriginalRow227TriangleData0131.coefficient8_116,
    output := OriginalRow227TriangleData0147.coefficient9_116, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_118, Icur := OriginalRow227TriangleData0131.coefficient8_117,
    output := OriginalRow227TriangleData0147.coefficient9_117, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_119, Icur := OriginalRow227TriangleData0131.coefficient8_118,
    output := OriginalRow227TriangleData0147.coefficient9_118, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_120, Icur := OriginalRow227TriangleData0131.coefficient8_119,
    output := OriginalRow227TriangleData0147.coefficient9_119, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_121, Icur := OriginalRow227TriangleData0131.coefficient8_120,
    output := OriginalRow227TriangleData0147.coefficient9_120, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_122, Icur := OriginalRow227TriangleData0131.coefficient8_121,
    output := OriginalRow227TriangleData0147.coefficient9_121, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_123, Icur := OriginalRow227TriangleData0131.coefficient8_122,
    output := OriginalRow227TriangleData0147.coefficient9_122, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_124, Icur := OriginalRow227TriangleData0131.coefficient8_123,
    output := OriginalRow227TriangleData0147.coefficient9_123, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_125, Icur := OriginalRow227TriangleData0131.coefficient8_124,
    output := OriginalRow227TriangleData0147.coefficient9_124, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_126, Icur := OriginalRow227TriangleData0131.coefficient8_125,
    output := OriginalRow227TriangleData0147.coefficient9_125, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_127, Icur := OriginalRow227TriangleData0131.coefficient8_126,
    output := OriginalRow227TriangleData0147.coefficient9_126, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_128, Icur := OriginalRow227TriangleData0131.coefficient8_127,
    output := OriginalRow227TriangleData0147.coefficient9_127, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_129, Icur := OriginalRow227TriangleData0131.coefficient8_128,
    output := OriginalRow227TriangleData0147.coefficient9_128, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_130, Icur := OriginalRow227TriangleData0131.coefficient8_129,
    output := OriginalRow227TriangleData0147.coefficient9_129, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_131, Icur := OriginalRow227TriangleData0131.coefficient8_130,
    output := OriginalRow227TriangleData0147.coefficient9_130, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_132, Icur := OriginalRow227TriangleData0131.coefficient8_131,
    output := OriginalRow227TriangleData0147.coefficient9_131, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_133, Icur := OriginalRow227TriangleData0131.coefficient8_132,
    output := OriginalRow227TriangleData0147.coefficient9_132, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0131.coefficient8_134, Icur := OriginalRow227TriangleData0131.coefficient8_133,
    output := OriginalRow227TriangleData0147.coefficient9_133, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0132.coefficient8_135, Icur := OriginalRow227TriangleData0131.coefficient8_134,
    output := OriginalRow227TriangleData0147.coefficient9_134, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0132.coefficient8_136, Icur := OriginalRow227TriangleData0132.coefficient8_135,
    output := OriginalRow227TriangleData0147.coefficient9_135, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0131

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0131.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
