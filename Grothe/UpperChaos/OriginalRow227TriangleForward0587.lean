import Grothe.UpperChaos.OriginalRow227TriangleData0589
import Grothe.UpperChaos.OriginalRow227TriangleData0590
import Grothe.UpperChaos.OriginalRow227TriangleData0603
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0587
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_136, Icur := OriginalRow227TriangleData0589.coefficient39_135,
    output := OriginalRow227TriangleData0603.coefficient40_135, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_137, Icur := OriginalRow227TriangleData0589.coefficient39_136,
    output := OriginalRow227TriangleData0603.coefficient40_136, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_138, Icur := OriginalRow227TriangleData0589.coefficient39_137,
    output := OriginalRow227TriangleData0603.coefficient40_137, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_139, Icur := OriginalRow227TriangleData0589.coefficient39_138,
    output := OriginalRow227TriangleData0603.coefficient40_138, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_140, Icur := OriginalRow227TriangleData0589.coefficient39_139,
    output := OriginalRow227TriangleData0603.coefficient40_139, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_141, Icur := OriginalRow227TriangleData0589.coefficient39_140,
    output := OriginalRow227TriangleData0603.coefficient40_140, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_142, Icur := OriginalRow227TriangleData0589.coefficient39_141,
    output := OriginalRow227TriangleData0603.coefficient40_141, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_143, Icur := OriginalRow227TriangleData0589.coefficient39_142,
    output := OriginalRow227TriangleData0603.coefficient40_142, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_144, Icur := OriginalRow227TriangleData0589.coefficient39_143,
    output := OriginalRow227TriangleData0603.coefficient40_143, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_145, Icur := OriginalRow227TriangleData0589.coefficient39_144,
    output := OriginalRow227TriangleData0603.coefficient40_144, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_146, Icur := OriginalRow227TriangleData0589.coefficient39_145,
    output := OriginalRow227TriangleData0603.coefficient40_145, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_147, Icur := OriginalRow227TriangleData0589.coefficient39_146,
    output := OriginalRow227TriangleData0603.coefficient40_146, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_148, Icur := OriginalRow227TriangleData0589.coefficient39_147,
    output := OriginalRow227TriangleData0603.coefficient40_147, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_149, Icur := OriginalRow227TriangleData0589.coefficient39_148,
    output := OriginalRow227TriangleData0603.coefficient40_148, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_150, Icur := OriginalRow227TriangleData0589.coefficient39_149,
    output := OriginalRow227TriangleData0603.coefficient40_149, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_151, Icur := OriginalRow227TriangleData0589.coefficient39_150,
    output := OriginalRow227TriangleData0603.coefficient40_150, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_152, Icur := OriginalRow227TriangleData0589.coefficient39_151,
    output := OriginalRow227TriangleData0603.coefficient40_151, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_153, Icur := OriginalRow227TriangleData0589.coefficient39_152,
    output := OriginalRow227TriangleData0603.coefficient40_152, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_154, Icur := OriginalRow227TriangleData0589.coefficient39_153,
    output := OriginalRow227TriangleData0603.coefficient40_153, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_155, Icur := OriginalRow227TriangleData0589.coefficient39_154,
    output := OriginalRow227TriangleData0603.coefficient40_154, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_156, Icur := OriginalRow227TriangleData0589.coefficient39_155,
    output := OriginalRow227TriangleData0603.coefficient40_155, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_157, Icur := OriginalRow227TriangleData0589.coefficient39_156,
    output := OriginalRow227TriangleData0603.coefficient40_156, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_158, Icur := OriginalRow227TriangleData0589.coefficient39_157,
    output := OriginalRow227TriangleData0603.coefficient40_157, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_159, Icur := OriginalRow227TriangleData0589.coefficient39_158,
    output := OriginalRow227TriangleData0603.coefficient40_158, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_160, Icur := OriginalRow227TriangleData0589.coefficient39_159,
    output := OriginalRow227TriangleData0603.coefficient40_159, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_161, Icur := OriginalRow227TriangleData0589.coefficient39_160,
    output := OriginalRow227TriangleData0603.coefficient40_160, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_162, Icur := OriginalRow227TriangleData0589.coefficient39_161,
    output := OriginalRow227TriangleData0603.coefficient40_161, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_163, Icur := OriginalRow227TriangleData0589.coefficient39_162,
    output := OriginalRow227TriangleData0603.coefficient40_162, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_164, Icur := OriginalRow227TriangleData0589.coefficient39_163,
    output := OriginalRow227TriangleData0603.coefficient40_163, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0589.coefficient39_165, Icur := OriginalRow227TriangleData0589.coefficient39_164,
    output := OriginalRow227TriangleData0603.coefficient40_164, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_166, Icur := OriginalRow227TriangleData0589.coefficient39_165,
    output := OriginalRow227TriangleData0603.coefficient40_165, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_167, Icur := OriginalRow227TriangleData0590.coefficient39_166,
    output := OriginalRow227TriangleData0603.coefficient40_166, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0587

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0587.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
