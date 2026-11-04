import Grothe.UpperChaos.OriginalRow227TriangleData1748
import Grothe.UpperChaos.OriginalRow227TriangleData1749
import Grothe.UpperChaos.OriginalRow227TriangleData1755
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1739
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_153, Icur := OriginalRow227TriangleData1748.coefficient152_152,
    output := OriginalRow227TriangleData1755.coefficient153_152, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_154, Icur := OriginalRow227TriangleData1748.coefficient152_153,
    output := OriginalRow227TriangleData1755.coefficient153_153, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_155, Icur := OriginalRow227TriangleData1748.coefficient152_154,
    output := OriginalRow227TriangleData1755.coefficient153_154, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_156, Icur := OriginalRow227TriangleData1748.coefficient152_155,
    output := OriginalRow227TriangleData1755.coefficient153_155, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_157, Icur := OriginalRow227TriangleData1748.coefficient152_156,
    output := OriginalRow227TriangleData1755.coefficient153_156, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_158, Icur := OriginalRow227TriangleData1748.coefficient152_157,
    output := OriginalRow227TriangleData1755.coefficient153_157, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_159, Icur := OriginalRow227TriangleData1748.coefficient152_158,
    output := OriginalRow227TriangleData1755.coefficient153_158, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_160, Icur := OriginalRow227TriangleData1748.coefficient152_159,
    output := OriginalRow227TriangleData1755.coefficient153_159, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_161, Icur := OriginalRow227TriangleData1748.coefficient152_160,
    output := OriginalRow227TriangleData1755.coefficient153_160, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_162, Icur := OriginalRow227TriangleData1748.coefficient152_161,
    output := OriginalRow227TriangleData1755.coefficient153_161, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_163, Icur := OriginalRow227TriangleData1748.coefficient152_162,
    output := OriginalRow227TriangleData1755.coefficient153_162, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_164, Icur := OriginalRow227TriangleData1748.coefficient152_163,
    output := OriginalRow227TriangleData1755.coefficient153_163, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_165, Icur := OriginalRow227TriangleData1748.coefficient152_164,
    output := OriginalRow227TriangleData1755.coefficient153_164, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_166, Icur := OriginalRow227TriangleData1748.coefficient152_165,
    output := OriginalRow227TriangleData1755.coefficient153_165, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_167, Icur := OriginalRow227TriangleData1748.coefficient152_166,
    output := OriginalRow227TriangleData1755.coefficient153_166, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_168, Icur := OriginalRow227TriangleData1748.coefficient152_167,
    output := OriginalRow227TriangleData1755.coefficient153_167, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_169, Icur := OriginalRow227TriangleData1748.coefficient152_168,
    output := OriginalRow227TriangleData1755.coefficient153_168, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_170, Icur := OriginalRow227TriangleData1748.coefficient152_169,
    output := OriginalRow227TriangleData1755.coefficient153_169, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_171, Icur := OriginalRow227TriangleData1748.coefficient152_170,
    output := OriginalRow227TriangleData1755.coefficient153_170, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_172, Icur := OriginalRow227TriangleData1748.coefficient152_171,
    output := OriginalRow227TriangleData1755.coefficient153_171, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_173, Icur := OriginalRow227TriangleData1748.coefficient152_172,
    output := OriginalRow227TriangleData1755.coefficient153_172, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_174, Icur := OriginalRow227TriangleData1748.coefficient152_173,
    output := OriginalRow227TriangleData1755.coefficient153_173, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_175, Icur := OriginalRow227TriangleData1748.coefficient152_174,
    output := OriginalRow227TriangleData1755.coefficient153_174, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_176, Icur := OriginalRow227TriangleData1748.coefficient152_175,
    output := OriginalRow227TriangleData1755.coefficient153_175, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_177, Icur := OriginalRow227TriangleData1748.coefficient152_176,
    output := OriginalRow227TriangleData1755.coefficient153_176, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_178, Icur := OriginalRow227TriangleData1748.coefficient152_177,
    output := OriginalRow227TriangleData1755.coefficient153_177, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_179, Icur := OriginalRow227TriangleData1748.coefficient152_178,
    output := OriginalRow227TriangleData1755.coefficient153_178, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_180, Icur := OriginalRow227TriangleData1748.coefficient152_179,
    output := OriginalRow227TriangleData1755.coefficient153_179, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_181, Icur := OriginalRow227TriangleData1748.coefficient152_180,
    output := OriginalRow227TriangleData1755.coefficient153_180, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1748.coefficient152_182, Icur := OriginalRow227TriangleData1748.coefficient152_181,
    output := OriginalRow227TriangleData1755.coefficient153_181, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_183, Icur := OriginalRow227TriangleData1748.coefficient152_182,
    output := OriginalRow227TriangleData1755.coefficient153_182, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1749.coefficient152_184, Icur := OriginalRow227TriangleData1749.coefficient152_183,
    output := OriginalRow227TriangleData1755.coefficient153_183, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1739

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1739.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
