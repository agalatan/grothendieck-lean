import Grothe.UpperChaos.OriginalRow227TriangleData0271
import Grothe.UpperChaos.OriginalRow227TriangleData0272
import Grothe.UpperChaos.OriginalRow227TriangleData0286
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0270
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_146, Icur := OriginalRow227TriangleData0271.coefficient17_145,
    output := OriginalRow227TriangleData0286.coefficient18_145, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_147, Icur := OriginalRow227TriangleData0271.coefficient17_146,
    output := OriginalRow227TriangleData0286.coefficient18_146, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_148, Icur := OriginalRow227TriangleData0271.coefficient17_147,
    output := OriginalRow227TriangleData0286.coefficient18_147, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_149, Icur := OriginalRow227TriangleData0271.coefficient17_148,
    output := OriginalRow227TriangleData0286.coefficient18_148, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_150, Icur := OriginalRow227TriangleData0271.coefficient17_149,
    output := OriginalRow227TriangleData0286.coefficient18_149, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_151, Icur := OriginalRow227TriangleData0271.coefficient17_150,
    output := OriginalRow227TriangleData0286.coefficient18_150, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_152, Icur := OriginalRow227TriangleData0271.coefficient17_151,
    output := OriginalRow227TriangleData0286.coefficient18_151, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_153, Icur := OriginalRow227TriangleData0271.coefficient17_152,
    output := OriginalRow227TriangleData0286.coefficient18_152, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_154, Icur := OriginalRow227TriangleData0271.coefficient17_153,
    output := OriginalRow227TriangleData0286.coefficient18_153, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_155, Icur := OriginalRow227TriangleData0271.coefficient17_154,
    output := OriginalRow227TriangleData0286.coefficient18_154, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_156, Icur := OriginalRow227TriangleData0271.coefficient17_155,
    output := OriginalRow227TriangleData0286.coefficient18_155, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_157, Icur := OriginalRow227TriangleData0271.coefficient17_156,
    output := OriginalRow227TriangleData0286.coefficient18_156, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_158, Icur := OriginalRow227TriangleData0271.coefficient17_157,
    output := OriginalRow227TriangleData0286.coefficient18_157, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_159, Icur := OriginalRow227TriangleData0271.coefficient17_158,
    output := OriginalRow227TriangleData0286.coefficient18_158, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_160, Icur := OriginalRow227TriangleData0271.coefficient17_159,
    output := OriginalRow227TriangleData0286.coefficient18_159, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_161, Icur := OriginalRow227TriangleData0271.coefficient17_160,
    output := OriginalRow227TriangleData0286.coefficient18_160, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_162, Icur := OriginalRow227TriangleData0271.coefficient17_161,
    output := OriginalRow227TriangleData0286.coefficient18_161, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_163, Icur := OriginalRow227TriangleData0271.coefficient17_162,
    output := OriginalRow227TriangleData0286.coefficient18_162, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_164, Icur := OriginalRow227TriangleData0271.coefficient17_163,
    output := OriginalRow227TriangleData0286.coefficient18_163, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_165, Icur := OriginalRow227TriangleData0271.coefficient17_164,
    output := OriginalRow227TriangleData0286.coefficient18_164, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_166, Icur := OriginalRow227TriangleData0271.coefficient17_165,
    output := OriginalRow227TriangleData0286.coefficient18_165, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_167, Icur := OriginalRow227TriangleData0271.coefficient17_166,
    output := OriginalRow227TriangleData0286.coefficient18_166, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_168, Icur := OriginalRow227TriangleData0271.coefficient17_167,
    output := OriginalRow227TriangleData0286.coefficient18_167, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_169, Icur := OriginalRow227TriangleData0271.coefficient17_168,
    output := OriginalRow227TriangleData0286.coefficient18_168, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_170, Icur := OriginalRow227TriangleData0271.coefficient17_169,
    output := OriginalRow227TriangleData0286.coefficient18_169, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_171, Icur := OriginalRow227TriangleData0271.coefficient17_170,
    output := OriginalRow227TriangleData0286.coefficient18_170, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_172, Icur := OriginalRow227TriangleData0271.coefficient17_171,
    output := OriginalRow227TriangleData0286.coefficient18_171, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_173, Icur := OriginalRow227TriangleData0271.coefficient17_172,
    output := OriginalRow227TriangleData0286.coefficient18_172, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_174, Icur := OriginalRow227TriangleData0271.coefficient17_173,
    output := OriginalRow227TriangleData0286.coefficient18_173, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0271.coefficient17_175, Icur := OriginalRow227TriangleData0271.coefficient17_174,
    output := OriginalRow227TriangleData0286.coefficient18_174, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_176, Icur := OriginalRow227TriangleData0271.coefficient17_175,
    output := OriginalRow227TriangleData0286.coefficient18_175, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0272.coefficient17_177, Icur := OriginalRow227TriangleData0272.coefficient17_176,
    output := OriginalRow227TriangleData0286.coefficient18_176, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0270

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0270.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
