import Grothe.UpperChaos.OriginalRow227TriangleData0375
import Grothe.UpperChaos.OriginalRow227TriangleData0376
import Grothe.UpperChaos.OriginalRow227TriangleData0390
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0374
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_121, Icur := OriginalRow227TriangleData0375.coefficient24_120,
    output := OriginalRow227TriangleData0390.coefficient25_120, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_122, Icur := OriginalRow227TriangleData0375.coefficient24_121,
    output := OriginalRow227TriangleData0390.coefficient25_121, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_123, Icur := OriginalRow227TriangleData0375.coefficient24_122,
    output := OriginalRow227TriangleData0390.coefficient25_122, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_124, Icur := OriginalRow227TriangleData0375.coefficient24_123,
    output := OriginalRow227TriangleData0390.coefficient25_123, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_125, Icur := OriginalRow227TriangleData0375.coefficient24_124,
    output := OriginalRow227TriangleData0390.coefficient25_124, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_126, Icur := OriginalRow227TriangleData0375.coefficient24_125,
    output := OriginalRow227TriangleData0390.coefficient25_125, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_127, Icur := OriginalRow227TriangleData0375.coefficient24_126,
    output := OriginalRow227TriangleData0390.coefficient25_126, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_128, Icur := OriginalRow227TriangleData0375.coefficient24_127,
    output := OriginalRow227TriangleData0390.coefficient25_127, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_129, Icur := OriginalRow227TriangleData0375.coefficient24_128,
    output := OriginalRow227TriangleData0390.coefficient25_128, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_130, Icur := OriginalRow227TriangleData0375.coefficient24_129,
    output := OriginalRow227TriangleData0390.coefficient25_129, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_131, Icur := OriginalRow227TriangleData0375.coefficient24_130,
    output := OriginalRow227TriangleData0390.coefficient25_130, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_132, Icur := OriginalRow227TriangleData0375.coefficient24_131,
    output := OriginalRow227TriangleData0390.coefficient25_131, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_133, Icur := OriginalRow227TriangleData0375.coefficient24_132,
    output := OriginalRow227TriangleData0390.coefficient25_132, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_134, Icur := OriginalRow227TriangleData0375.coefficient24_133,
    output := OriginalRow227TriangleData0390.coefficient25_133, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_135, Icur := OriginalRow227TriangleData0375.coefficient24_134,
    output := OriginalRow227TriangleData0390.coefficient25_134, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_136, Icur := OriginalRow227TriangleData0375.coefficient24_135,
    output := OriginalRow227TriangleData0390.coefficient25_135, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_137, Icur := OriginalRow227TriangleData0375.coefficient24_136,
    output := OriginalRow227TriangleData0390.coefficient25_136, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_138, Icur := OriginalRow227TriangleData0375.coefficient24_137,
    output := OriginalRow227TriangleData0390.coefficient25_137, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_139, Icur := OriginalRow227TriangleData0375.coefficient24_138,
    output := OriginalRow227TriangleData0390.coefficient25_138, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_140, Icur := OriginalRow227TriangleData0375.coefficient24_139,
    output := OriginalRow227TriangleData0390.coefficient25_139, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_141, Icur := OriginalRow227TriangleData0375.coefficient24_140,
    output := OriginalRow227TriangleData0390.coefficient25_140, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_142, Icur := OriginalRow227TriangleData0375.coefficient24_141,
    output := OriginalRow227TriangleData0390.coefficient25_141, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_143, Icur := OriginalRow227TriangleData0375.coefficient24_142,
    output := OriginalRow227TriangleData0390.coefficient25_142, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_144, Icur := OriginalRow227TriangleData0375.coefficient24_143,
    output := OriginalRow227TriangleData0390.coefficient25_143, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_145, Icur := OriginalRow227TriangleData0375.coefficient24_144,
    output := OriginalRow227TriangleData0390.coefficient25_144, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_146, Icur := OriginalRow227TriangleData0375.coefficient24_145,
    output := OriginalRow227TriangleData0390.coefficient25_145, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_147, Icur := OriginalRow227TriangleData0375.coefficient24_146,
    output := OriginalRow227TriangleData0390.coefficient25_146, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_148, Icur := OriginalRow227TriangleData0375.coefficient24_147,
    output := OriginalRow227TriangleData0390.coefficient25_147, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_149, Icur := OriginalRow227TriangleData0375.coefficient24_148,
    output := OriginalRow227TriangleData0390.coefficient25_148, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0375.coefficient24_150, Icur := OriginalRow227TriangleData0375.coefficient24_149,
    output := OriginalRow227TriangleData0390.coefficient25_149, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_151, Icur := OriginalRow227TriangleData0375.coefficient24_150,
    output := OriginalRow227TriangleData0390.coefficient25_150, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_152, Icur := OriginalRow227TriangleData0376.coefficient24_151,
    output := OriginalRow227TriangleData0390.coefficient25_151, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0374

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0374.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
