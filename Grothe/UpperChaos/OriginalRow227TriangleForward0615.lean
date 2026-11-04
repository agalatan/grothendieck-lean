import Grothe.UpperChaos.OriginalRow227TriangleData0617
import Grothe.UpperChaos.OriginalRow227TriangleData0618
import Grothe.UpperChaos.OriginalRow227TriangleData0631
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0615
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_138, Icur := OriginalRow227TriangleData0617.coefficient41_137,
    output := OriginalRow227TriangleData0631.coefficient42_137, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_139, Icur := OriginalRow227TriangleData0617.coefficient41_138,
    output := OriginalRow227TriangleData0631.coefficient42_138, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_140, Icur := OriginalRow227TriangleData0617.coefficient41_139,
    output := OriginalRow227TriangleData0631.coefficient42_139, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_141, Icur := OriginalRow227TriangleData0617.coefficient41_140,
    output := OriginalRow227TriangleData0631.coefficient42_140, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_142, Icur := OriginalRow227TriangleData0617.coefficient41_141,
    output := OriginalRow227TriangleData0631.coefficient42_141, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_143, Icur := OriginalRow227TriangleData0617.coefficient41_142,
    output := OriginalRow227TriangleData0631.coefficient42_142, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_144, Icur := OriginalRow227TriangleData0617.coefficient41_143,
    output := OriginalRow227TriangleData0631.coefficient42_143, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_145, Icur := OriginalRow227TriangleData0617.coefficient41_144,
    output := OriginalRow227TriangleData0631.coefficient42_144, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_146, Icur := OriginalRow227TriangleData0617.coefficient41_145,
    output := OriginalRow227TriangleData0631.coefficient42_145, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_147, Icur := OriginalRow227TriangleData0617.coefficient41_146,
    output := OriginalRow227TriangleData0631.coefficient42_146, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_148, Icur := OriginalRow227TriangleData0617.coefficient41_147,
    output := OriginalRow227TriangleData0631.coefficient42_147, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_149, Icur := OriginalRow227TriangleData0617.coefficient41_148,
    output := OriginalRow227TriangleData0631.coefficient42_148, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_150, Icur := OriginalRow227TriangleData0617.coefficient41_149,
    output := OriginalRow227TriangleData0631.coefficient42_149, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_151, Icur := OriginalRow227TriangleData0617.coefficient41_150,
    output := OriginalRow227TriangleData0631.coefficient42_150, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_152, Icur := OriginalRow227TriangleData0617.coefficient41_151,
    output := OriginalRow227TriangleData0631.coefficient42_151, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_153, Icur := OriginalRow227TriangleData0617.coefficient41_152,
    output := OriginalRow227TriangleData0631.coefficient42_152, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_154, Icur := OriginalRow227TriangleData0617.coefficient41_153,
    output := OriginalRow227TriangleData0631.coefficient42_153, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_155, Icur := OriginalRow227TriangleData0617.coefficient41_154,
    output := OriginalRow227TriangleData0631.coefficient42_154, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_156, Icur := OriginalRow227TriangleData0617.coefficient41_155,
    output := OriginalRow227TriangleData0631.coefficient42_155, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_157, Icur := OriginalRow227TriangleData0617.coefficient41_156,
    output := OriginalRow227TriangleData0631.coefficient42_156, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_158, Icur := OriginalRow227TriangleData0617.coefficient41_157,
    output := OriginalRow227TriangleData0631.coefficient42_157, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_159, Icur := OriginalRow227TriangleData0617.coefficient41_158,
    output := OriginalRow227TriangleData0631.coefficient42_158, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_160, Icur := OriginalRow227TriangleData0617.coefficient41_159,
    output := OriginalRow227TriangleData0631.coefficient42_159, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_161, Icur := OriginalRow227TriangleData0617.coefficient41_160,
    output := OriginalRow227TriangleData0631.coefficient42_160, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_162, Icur := OriginalRow227TriangleData0617.coefficient41_161,
    output := OriginalRow227TriangleData0631.coefficient42_161, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_163, Icur := OriginalRow227TriangleData0617.coefficient41_162,
    output := OriginalRow227TriangleData0631.coefficient42_162, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_164, Icur := OriginalRow227TriangleData0617.coefficient41_163,
    output := OriginalRow227TriangleData0631.coefficient42_163, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_165, Icur := OriginalRow227TriangleData0617.coefficient41_164,
    output := OriginalRow227TriangleData0631.coefficient42_164, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_166, Icur := OriginalRow227TriangleData0617.coefficient41_165,
    output := OriginalRow227TriangleData0631.coefficient42_165, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_167, Icur := OriginalRow227TriangleData0617.coefficient41_166,
    output := OriginalRow227TriangleData0631.coefficient42_166, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0618.coefficient41_168, Icur := OriginalRow227TriangleData0617.coefficient41_167,
    output := OriginalRow227TriangleData0631.coefficient42_167, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0618.coefficient41_169, Icur := OriginalRow227TriangleData0618.coefficient41_168,
    output := OriginalRow227TriangleData0631.coefficient42_168, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0615

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0615.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
