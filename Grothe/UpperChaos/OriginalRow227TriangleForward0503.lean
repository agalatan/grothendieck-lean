import Grothe.UpperChaos.OriginalRow227TriangleData0505
import Grothe.UpperChaos.OriginalRow227TriangleData0506
import Grothe.UpperChaos.OriginalRow227TriangleData0519
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0503
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_130, Icur := OriginalRow227TriangleData0505.coefficient33_129,
    output := OriginalRow227TriangleData0519.coefficient34_129, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_131, Icur := OriginalRow227TriangleData0505.coefficient33_130,
    output := OriginalRow227TriangleData0519.coefficient34_130, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_132, Icur := OriginalRow227TriangleData0505.coefficient33_131,
    output := OriginalRow227TriangleData0519.coefficient34_131, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_133, Icur := OriginalRow227TriangleData0505.coefficient33_132,
    output := OriginalRow227TriangleData0519.coefficient34_132, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_134, Icur := OriginalRow227TriangleData0505.coefficient33_133,
    output := OriginalRow227TriangleData0519.coefficient34_133, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_135, Icur := OriginalRow227TriangleData0505.coefficient33_134,
    output := OriginalRow227TriangleData0519.coefficient34_134, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_136, Icur := OriginalRow227TriangleData0505.coefficient33_135,
    output := OriginalRow227TriangleData0519.coefficient34_135, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_137, Icur := OriginalRow227TriangleData0505.coefficient33_136,
    output := OriginalRow227TriangleData0519.coefficient34_136, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_138, Icur := OriginalRow227TriangleData0505.coefficient33_137,
    output := OriginalRow227TriangleData0519.coefficient34_137, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_139, Icur := OriginalRow227TriangleData0505.coefficient33_138,
    output := OriginalRow227TriangleData0519.coefficient34_138, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_140, Icur := OriginalRow227TriangleData0505.coefficient33_139,
    output := OriginalRow227TriangleData0519.coefficient34_139, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_141, Icur := OriginalRow227TriangleData0505.coefficient33_140,
    output := OriginalRow227TriangleData0519.coefficient34_140, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_142, Icur := OriginalRow227TriangleData0505.coefficient33_141,
    output := OriginalRow227TriangleData0519.coefficient34_141, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_143, Icur := OriginalRow227TriangleData0505.coefficient33_142,
    output := OriginalRow227TriangleData0519.coefficient34_142, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_144, Icur := OriginalRow227TriangleData0505.coefficient33_143,
    output := OriginalRow227TriangleData0519.coefficient34_143, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_145, Icur := OriginalRow227TriangleData0505.coefficient33_144,
    output := OriginalRow227TriangleData0519.coefficient34_144, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_146, Icur := OriginalRow227TriangleData0505.coefficient33_145,
    output := OriginalRow227TriangleData0519.coefficient34_145, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_147, Icur := OriginalRow227TriangleData0505.coefficient33_146,
    output := OriginalRow227TriangleData0519.coefficient34_146, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_148, Icur := OriginalRow227TriangleData0505.coefficient33_147,
    output := OriginalRow227TriangleData0519.coefficient34_147, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_149, Icur := OriginalRow227TriangleData0505.coefficient33_148,
    output := OriginalRow227TriangleData0519.coefficient34_148, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_150, Icur := OriginalRow227TriangleData0505.coefficient33_149,
    output := OriginalRow227TriangleData0519.coefficient34_149, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_151, Icur := OriginalRow227TriangleData0505.coefficient33_150,
    output := OriginalRow227TriangleData0519.coefficient34_150, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_152, Icur := OriginalRow227TriangleData0505.coefficient33_151,
    output := OriginalRow227TriangleData0519.coefficient34_151, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_153, Icur := OriginalRow227TriangleData0505.coefficient33_152,
    output := OriginalRow227TriangleData0519.coefficient34_152, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_154, Icur := OriginalRow227TriangleData0505.coefficient33_153,
    output := OriginalRow227TriangleData0519.coefficient34_153, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_155, Icur := OriginalRow227TriangleData0505.coefficient33_154,
    output := OriginalRow227TriangleData0519.coefficient34_154, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_156, Icur := OriginalRow227TriangleData0505.coefficient33_155,
    output := OriginalRow227TriangleData0519.coefficient34_155, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_157, Icur := OriginalRow227TriangleData0505.coefficient33_156,
    output := OriginalRow227TriangleData0519.coefficient34_156, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_158, Icur := OriginalRow227TriangleData0505.coefficient33_157,
    output := OriginalRow227TriangleData0519.coefficient34_157, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0505.coefficient33_159, Icur := OriginalRow227TriangleData0505.coefficient33_158,
    output := OriginalRow227TriangleData0519.coefficient34_158, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_160, Icur := OriginalRow227TriangleData0505.coefficient33_159,
    output := OriginalRow227TriangleData0519.coefficient34_159, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_161, Icur := OriginalRow227TriangleData0506.coefficient33_160,
    output := OriginalRow227TriangleData0519.coefficient34_160, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0503

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0503.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
