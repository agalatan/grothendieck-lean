import Grothe.UpperChaos.OriginalRow227TriangleData0561
import Grothe.UpperChaos.OriginalRow227TriangleData0562
import Grothe.UpperChaos.OriginalRow227TriangleData0575
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0559
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_134, Icur := OriginalRow227TriangleData0561.coefficient37_133,
    output := OriginalRow227TriangleData0575.coefficient38_133, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_135, Icur := OriginalRow227TriangleData0561.coefficient37_134,
    output := OriginalRow227TriangleData0575.coefficient38_134, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_136, Icur := OriginalRow227TriangleData0561.coefficient37_135,
    output := OriginalRow227TriangleData0575.coefficient38_135, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_137, Icur := OriginalRow227TriangleData0561.coefficient37_136,
    output := OriginalRow227TriangleData0575.coefficient38_136, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_138, Icur := OriginalRow227TriangleData0561.coefficient37_137,
    output := OriginalRow227TriangleData0575.coefficient38_137, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_139, Icur := OriginalRow227TriangleData0561.coefficient37_138,
    output := OriginalRow227TriangleData0575.coefficient38_138, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_140, Icur := OriginalRow227TriangleData0561.coefficient37_139,
    output := OriginalRow227TriangleData0575.coefficient38_139, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_141, Icur := OriginalRow227TriangleData0561.coefficient37_140,
    output := OriginalRow227TriangleData0575.coefficient38_140, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_142, Icur := OriginalRow227TriangleData0561.coefficient37_141,
    output := OriginalRow227TriangleData0575.coefficient38_141, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_143, Icur := OriginalRow227TriangleData0561.coefficient37_142,
    output := OriginalRow227TriangleData0575.coefficient38_142, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_144, Icur := OriginalRow227TriangleData0561.coefficient37_143,
    output := OriginalRow227TriangleData0575.coefficient38_143, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_145, Icur := OriginalRow227TriangleData0561.coefficient37_144,
    output := OriginalRow227TriangleData0575.coefficient38_144, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_146, Icur := OriginalRow227TriangleData0561.coefficient37_145,
    output := OriginalRow227TriangleData0575.coefficient38_145, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_147, Icur := OriginalRow227TriangleData0561.coefficient37_146,
    output := OriginalRow227TriangleData0575.coefficient38_146, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_148, Icur := OriginalRow227TriangleData0561.coefficient37_147,
    output := OriginalRow227TriangleData0575.coefficient38_147, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_149, Icur := OriginalRow227TriangleData0561.coefficient37_148,
    output := OriginalRow227TriangleData0575.coefficient38_148, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_150, Icur := OriginalRow227TriangleData0561.coefficient37_149,
    output := OriginalRow227TriangleData0575.coefficient38_149, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_151, Icur := OriginalRow227TriangleData0561.coefficient37_150,
    output := OriginalRow227TriangleData0575.coefficient38_150, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_152, Icur := OriginalRow227TriangleData0561.coefficient37_151,
    output := OriginalRow227TriangleData0575.coefficient38_151, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_153, Icur := OriginalRow227TriangleData0561.coefficient37_152,
    output := OriginalRow227TriangleData0575.coefficient38_152, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_154, Icur := OriginalRow227TriangleData0561.coefficient37_153,
    output := OriginalRow227TriangleData0575.coefficient38_153, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_155, Icur := OriginalRow227TriangleData0561.coefficient37_154,
    output := OriginalRow227TriangleData0575.coefficient38_154, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_156, Icur := OriginalRow227TriangleData0561.coefficient37_155,
    output := OriginalRow227TriangleData0575.coefficient38_155, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_157, Icur := OriginalRow227TriangleData0561.coefficient37_156,
    output := OriginalRow227TriangleData0575.coefficient38_156, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_158, Icur := OriginalRow227TriangleData0561.coefficient37_157,
    output := OriginalRow227TriangleData0575.coefficient38_157, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_159, Icur := OriginalRow227TriangleData0561.coefficient37_158,
    output := OriginalRow227TriangleData0575.coefficient38_158, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_160, Icur := OriginalRow227TriangleData0561.coefficient37_159,
    output := OriginalRow227TriangleData0575.coefficient38_159, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_161, Icur := OriginalRow227TriangleData0561.coefficient37_160,
    output := OriginalRow227TriangleData0575.coefficient38_160, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_162, Icur := OriginalRow227TriangleData0561.coefficient37_161,
    output := OriginalRow227TriangleData0575.coefficient38_161, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0561.coefficient37_163, Icur := OriginalRow227TriangleData0561.coefficient37_162,
    output := OriginalRow227TriangleData0575.coefficient38_162, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_164, Icur := OriginalRow227TriangleData0561.coefficient37_163,
    output := OriginalRow227TriangleData0575.coefficient38_163, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_165, Icur := OriginalRow227TriangleData0562.coefficient37_164,
    output := OriginalRow227TriangleData0575.coefficient38_164, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0559

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0559.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
