import Grothe.UpperChaos.OriginalRow227TriangleData0575
import Grothe.UpperChaos.OriginalRow227TriangleData0576
import Grothe.UpperChaos.OriginalRow227TriangleData0589
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0573
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_135, Icur := OriginalRow227TriangleData0575.coefficient38_134,
    output := OriginalRow227TriangleData0589.coefficient39_134, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_136, Icur := OriginalRow227TriangleData0575.coefficient38_135,
    output := OriginalRow227TriangleData0589.coefficient39_135, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_137, Icur := OriginalRow227TriangleData0575.coefficient38_136,
    output := OriginalRow227TriangleData0589.coefficient39_136, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_138, Icur := OriginalRow227TriangleData0575.coefficient38_137,
    output := OriginalRow227TriangleData0589.coefficient39_137, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_139, Icur := OriginalRow227TriangleData0575.coefficient38_138,
    output := OriginalRow227TriangleData0589.coefficient39_138, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_140, Icur := OriginalRow227TriangleData0575.coefficient38_139,
    output := OriginalRow227TriangleData0589.coefficient39_139, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_141, Icur := OriginalRow227TriangleData0575.coefficient38_140,
    output := OriginalRow227TriangleData0589.coefficient39_140, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_142, Icur := OriginalRow227TriangleData0575.coefficient38_141,
    output := OriginalRow227TriangleData0589.coefficient39_141, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_143, Icur := OriginalRow227TriangleData0575.coefficient38_142,
    output := OriginalRow227TriangleData0589.coefficient39_142, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_144, Icur := OriginalRow227TriangleData0575.coefficient38_143,
    output := OriginalRow227TriangleData0589.coefficient39_143, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_145, Icur := OriginalRow227TriangleData0575.coefficient38_144,
    output := OriginalRow227TriangleData0589.coefficient39_144, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_146, Icur := OriginalRow227TriangleData0575.coefficient38_145,
    output := OriginalRow227TriangleData0589.coefficient39_145, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_147, Icur := OriginalRow227TriangleData0575.coefficient38_146,
    output := OriginalRow227TriangleData0589.coefficient39_146, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_148, Icur := OriginalRow227TriangleData0575.coefficient38_147,
    output := OriginalRow227TriangleData0589.coefficient39_147, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_149, Icur := OriginalRow227TriangleData0575.coefficient38_148,
    output := OriginalRow227TriangleData0589.coefficient39_148, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_150, Icur := OriginalRow227TriangleData0575.coefficient38_149,
    output := OriginalRow227TriangleData0589.coefficient39_149, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_151, Icur := OriginalRow227TriangleData0575.coefficient38_150,
    output := OriginalRow227TriangleData0589.coefficient39_150, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_152, Icur := OriginalRow227TriangleData0575.coefficient38_151,
    output := OriginalRow227TriangleData0589.coefficient39_151, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_153, Icur := OriginalRow227TriangleData0575.coefficient38_152,
    output := OriginalRow227TriangleData0589.coefficient39_152, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_154, Icur := OriginalRow227TriangleData0575.coefficient38_153,
    output := OriginalRow227TriangleData0589.coefficient39_153, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_155, Icur := OriginalRow227TriangleData0575.coefficient38_154,
    output := OriginalRow227TriangleData0589.coefficient39_154, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_156, Icur := OriginalRow227TriangleData0575.coefficient38_155,
    output := OriginalRow227TriangleData0589.coefficient39_155, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_157, Icur := OriginalRow227TriangleData0575.coefficient38_156,
    output := OriginalRow227TriangleData0589.coefficient39_156, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_158, Icur := OriginalRow227TriangleData0575.coefficient38_157,
    output := OriginalRow227TriangleData0589.coefficient39_157, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_159, Icur := OriginalRow227TriangleData0575.coefficient38_158,
    output := OriginalRow227TriangleData0589.coefficient39_158, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_160, Icur := OriginalRow227TriangleData0575.coefficient38_159,
    output := OriginalRow227TriangleData0589.coefficient39_159, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_161, Icur := OriginalRow227TriangleData0575.coefficient38_160,
    output := OriginalRow227TriangleData0589.coefficient39_160, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_162, Icur := OriginalRow227TriangleData0575.coefficient38_161,
    output := OriginalRow227TriangleData0589.coefficient39_161, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_163, Icur := OriginalRow227TriangleData0575.coefficient38_162,
    output := OriginalRow227TriangleData0589.coefficient39_162, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0575.coefficient38_164, Icur := OriginalRow227TriangleData0575.coefficient38_163,
    output := OriginalRow227TriangleData0589.coefficient39_163, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_165, Icur := OriginalRow227TriangleData0575.coefficient38_164,
    output := OriginalRow227TriangleData0589.coefficient39_164, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_166, Icur := OriginalRow227TriangleData0576.coefficient38_165,
    output := OriginalRow227TriangleData0589.coefficient39_165, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0573

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0573.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
