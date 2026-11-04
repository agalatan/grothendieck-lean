import Grothe.UpperChaos.OriginalRow227TriangleData0360
import Grothe.UpperChaos.OriginalRow227TriangleData0361
import Grothe.UpperChaos.OriginalRow227TriangleData0375
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0359
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_120, Icur := OriginalRow227TriangleData0360.coefficient23_119,
    output := OriginalRow227TriangleData0375.coefficient24_119, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_121, Icur := OriginalRow227TriangleData0360.coefficient23_120,
    output := OriginalRow227TriangleData0375.coefficient24_120, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_122, Icur := OriginalRow227TriangleData0360.coefficient23_121,
    output := OriginalRow227TriangleData0375.coefficient24_121, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_123, Icur := OriginalRow227TriangleData0360.coefficient23_122,
    output := OriginalRow227TriangleData0375.coefficient24_122, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_124, Icur := OriginalRow227TriangleData0360.coefficient23_123,
    output := OriginalRow227TriangleData0375.coefficient24_123, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_125, Icur := OriginalRow227TriangleData0360.coefficient23_124,
    output := OriginalRow227TriangleData0375.coefficient24_124, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_126, Icur := OriginalRow227TriangleData0360.coefficient23_125,
    output := OriginalRow227TriangleData0375.coefficient24_125, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_127, Icur := OriginalRow227TriangleData0360.coefficient23_126,
    output := OriginalRow227TriangleData0375.coefficient24_126, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_128, Icur := OriginalRow227TriangleData0360.coefficient23_127,
    output := OriginalRow227TriangleData0375.coefficient24_127, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_129, Icur := OriginalRow227TriangleData0360.coefficient23_128,
    output := OriginalRow227TriangleData0375.coefficient24_128, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_130, Icur := OriginalRow227TriangleData0360.coefficient23_129,
    output := OriginalRow227TriangleData0375.coefficient24_129, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_131, Icur := OriginalRow227TriangleData0360.coefficient23_130,
    output := OriginalRow227TriangleData0375.coefficient24_130, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_132, Icur := OriginalRow227TriangleData0360.coefficient23_131,
    output := OriginalRow227TriangleData0375.coefficient24_131, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_133, Icur := OriginalRow227TriangleData0360.coefficient23_132,
    output := OriginalRow227TriangleData0375.coefficient24_132, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_134, Icur := OriginalRow227TriangleData0360.coefficient23_133,
    output := OriginalRow227TriangleData0375.coefficient24_133, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_135, Icur := OriginalRow227TriangleData0360.coefficient23_134,
    output := OriginalRow227TriangleData0375.coefficient24_134, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_136, Icur := OriginalRow227TriangleData0360.coefficient23_135,
    output := OriginalRow227TriangleData0375.coefficient24_135, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_137, Icur := OriginalRow227TriangleData0360.coefficient23_136,
    output := OriginalRow227TriangleData0375.coefficient24_136, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_138, Icur := OriginalRow227TriangleData0360.coefficient23_137,
    output := OriginalRow227TriangleData0375.coefficient24_137, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_139, Icur := OriginalRow227TriangleData0360.coefficient23_138,
    output := OriginalRow227TriangleData0375.coefficient24_138, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_140, Icur := OriginalRow227TriangleData0360.coefficient23_139,
    output := OriginalRow227TriangleData0375.coefficient24_139, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_141, Icur := OriginalRow227TriangleData0360.coefficient23_140,
    output := OriginalRow227TriangleData0375.coefficient24_140, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_142, Icur := OriginalRow227TriangleData0360.coefficient23_141,
    output := OriginalRow227TriangleData0375.coefficient24_141, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_143, Icur := OriginalRow227TriangleData0360.coefficient23_142,
    output := OriginalRow227TriangleData0375.coefficient24_142, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_144, Icur := OriginalRow227TriangleData0360.coefficient23_143,
    output := OriginalRow227TriangleData0375.coefficient24_143, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_145, Icur := OriginalRow227TriangleData0360.coefficient23_144,
    output := OriginalRow227TriangleData0375.coefficient24_144, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_146, Icur := OriginalRow227TriangleData0360.coefficient23_145,
    output := OriginalRow227TriangleData0375.coefficient24_145, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_147, Icur := OriginalRow227TriangleData0360.coefficient23_146,
    output := OriginalRow227TriangleData0375.coefficient24_146, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_148, Icur := OriginalRow227TriangleData0360.coefficient23_147,
    output := OriginalRow227TriangleData0375.coefficient24_147, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0360.coefficient23_149, Icur := OriginalRow227TriangleData0360.coefficient23_148,
    output := OriginalRow227TriangleData0375.coefficient24_148, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0361.coefficient23_150, Icur := OriginalRow227TriangleData0360.coefficient23_149,
    output := OriginalRow227TriangleData0375.coefficient24_149, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0361.coefficient23_151, Icur := OriginalRow227TriangleData0361.coefficient23_150,
    output := OriginalRow227TriangleData0375.coefficient24_150, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0359

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0359.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
