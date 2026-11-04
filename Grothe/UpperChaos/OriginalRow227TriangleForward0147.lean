import Grothe.UpperChaos.OriginalRow227TriangleData0147
import Grothe.UpperChaos.OriginalRow227TriangleData0148
import Grothe.UpperChaos.OriginalRow227TriangleData0163
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0147
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_106, Icur := OriginalRow227TriangleData0147.coefficient9_105,
    output := OriginalRow227TriangleData0163.coefficient10_105, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_107, Icur := OriginalRow227TriangleData0147.coefficient9_106,
    output := OriginalRow227TriangleData0163.coefficient10_106, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_108, Icur := OriginalRow227TriangleData0147.coefficient9_107,
    output := OriginalRow227TriangleData0163.coefficient10_107, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_109, Icur := OriginalRow227TriangleData0147.coefficient9_108,
    output := OriginalRow227TriangleData0163.coefficient10_108, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_110, Icur := OriginalRow227TriangleData0147.coefficient9_109,
    output := OriginalRow227TriangleData0163.coefficient10_109, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_111, Icur := OriginalRow227TriangleData0147.coefficient9_110,
    output := OriginalRow227TriangleData0163.coefficient10_110, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_112, Icur := OriginalRow227TriangleData0147.coefficient9_111,
    output := OriginalRow227TriangleData0163.coefficient10_111, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_113, Icur := OriginalRow227TriangleData0147.coefficient9_112,
    output := OriginalRow227TriangleData0163.coefficient10_112, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_114, Icur := OriginalRow227TriangleData0147.coefficient9_113,
    output := OriginalRow227TriangleData0163.coefficient10_113, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_115, Icur := OriginalRow227TriangleData0147.coefficient9_114,
    output := OriginalRow227TriangleData0163.coefficient10_114, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_116, Icur := OriginalRow227TriangleData0147.coefficient9_115,
    output := OriginalRow227TriangleData0163.coefficient10_115, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_117, Icur := OriginalRow227TriangleData0147.coefficient9_116,
    output := OriginalRow227TriangleData0163.coefficient10_116, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_118, Icur := OriginalRow227TriangleData0147.coefficient9_117,
    output := OriginalRow227TriangleData0163.coefficient10_117, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_119, Icur := OriginalRow227TriangleData0147.coefficient9_118,
    output := OriginalRow227TriangleData0163.coefficient10_118, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_120, Icur := OriginalRow227TriangleData0147.coefficient9_119,
    output := OriginalRow227TriangleData0163.coefficient10_119, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_121, Icur := OriginalRow227TriangleData0147.coefficient9_120,
    output := OriginalRow227TriangleData0163.coefficient10_120, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_122, Icur := OriginalRow227TriangleData0147.coefficient9_121,
    output := OriginalRow227TriangleData0163.coefficient10_121, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_123, Icur := OriginalRow227TriangleData0147.coefficient9_122,
    output := OriginalRow227TriangleData0163.coefficient10_122, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_124, Icur := OriginalRow227TriangleData0147.coefficient9_123,
    output := OriginalRow227TriangleData0163.coefficient10_123, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_125, Icur := OriginalRow227TriangleData0147.coefficient9_124,
    output := OriginalRow227TriangleData0163.coefficient10_124, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_126, Icur := OriginalRow227TriangleData0147.coefficient9_125,
    output := OriginalRow227TriangleData0163.coefficient10_125, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_127, Icur := OriginalRow227TriangleData0147.coefficient9_126,
    output := OriginalRow227TriangleData0163.coefficient10_126, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_128, Icur := OriginalRow227TriangleData0147.coefficient9_127,
    output := OriginalRow227TriangleData0163.coefficient10_127, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_129, Icur := OriginalRow227TriangleData0147.coefficient9_128,
    output := OriginalRow227TriangleData0163.coefficient10_128, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_130, Icur := OriginalRow227TriangleData0147.coefficient9_129,
    output := OriginalRow227TriangleData0163.coefficient10_129, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_131, Icur := OriginalRow227TriangleData0147.coefficient9_130,
    output := OriginalRow227TriangleData0163.coefficient10_130, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_132, Icur := OriginalRow227TriangleData0147.coefficient9_131,
    output := OriginalRow227TriangleData0163.coefficient10_131, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_133, Icur := OriginalRow227TriangleData0147.coefficient9_132,
    output := OriginalRow227TriangleData0163.coefficient10_132, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_134, Icur := OriginalRow227TriangleData0147.coefficient9_133,
    output := OriginalRow227TriangleData0163.coefficient10_133, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0147.coefficient9_135, Icur := OriginalRow227TriangleData0147.coefficient9_134,
    output := OriginalRow227TriangleData0163.coefficient10_134, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0148.coefficient9_136, Icur := OriginalRow227TriangleData0147.coefficient9_135,
    output := OriginalRow227TriangleData0163.coefficient10_135, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0148.coefficient9_137, Icur := OriginalRow227TriangleData0148.coefficient9_136,
    output := OriginalRow227TriangleData0163.coefficient10_136, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0147

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0147.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
