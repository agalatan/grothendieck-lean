import Grothe.UpperChaos.OriginalRow227TriangleData1713
import Grothe.UpperChaos.OriginalRow227TriangleData1714
import Grothe.UpperChaos.OriginalRow227TriangleData1720
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1704
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_148, Icur := OriginalRow227TriangleData1713.coefficient147_147,
    output := OriginalRow227TriangleData1720.coefficient148_147, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_149, Icur := OriginalRow227TriangleData1713.coefficient147_148,
    output := OriginalRow227TriangleData1720.coefficient148_148, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_150, Icur := OriginalRow227TriangleData1713.coefficient147_149,
    output := OriginalRow227TriangleData1720.coefficient148_149, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_151, Icur := OriginalRow227TriangleData1713.coefficient147_150,
    output := OriginalRow227TriangleData1720.coefficient148_150, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_152, Icur := OriginalRow227TriangleData1713.coefficient147_151,
    output := OriginalRow227TriangleData1720.coefficient148_151, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_153, Icur := OriginalRow227TriangleData1713.coefficient147_152,
    output := OriginalRow227TriangleData1720.coefficient148_152, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_154, Icur := OriginalRow227TriangleData1713.coefficient147_153,
    output := OriginalRow227TriangleData1720.coefficient148_153, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_155, Icur := OriginalRow227TriangleData1713.coefficient147_154,
    output := OriginalRow227TriangleData1720.coefficient148_154, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_156, Icur := OriginalRow227TriangleData1713.coefficient147_155,
    output := OriginalRow227TriangleData1720.coefficient148_155, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_157, Icur := OriginalRow227TriangleData1713.coefficient147_156,
    output := OriginalRow227TriangleData1720.coefficient148_156, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_158, Icur := OriginalRow227TriangleData1713.coefficient147_157,
    output := OriginalRow227TriangleData1720.coefficient148_157, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_159, Icur := OriginalRow227TriangleData1713.coefficient147_158,
    output := OriginalRow227TriangleData1720.coefficient148_158, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_160, Icur := OriginalRow227TriangleData1713.coefficient147_159,
    output := OriginalRow227TriangleData1720.coefficient148_159, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_161, Icur := OriginalRow227TriangleData1713.coefficient147_160,
    output := OriginalRow227TriangleData1720.coefficient148_160, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_162, Icur := OriginalRow227TriangleData1713.coefficient147_161,
    output := OriginalRow227TriangleData1720.coefficient148_161, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_163, Icur := OriginalRow227TriangleData1713.coefficient147_162,
    output := OriginalRow227TriangleData1720.coefficient148_162, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_164, Icur := OriginalRow227TriangleData1713.coefficient147_163,
    output := OriginalRow227TriangleData1720.coefficient148_163, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_165, Icur := OriginalRow227TriangleData1713.coefficient147_164,
    output := OriginalRow227TriangleData1720.coefficient148_164, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_166, Icur := OriginalRow227TriangleData1713.coefficient147_165,
    output := OriginalRow227TriangleData1720.coefficient148_165, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_167, Icur := OriginalRow227TriangleData1713.coefficient147_166,
    output := OriginalRow227TriangleData1720.coefficient148_166, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_168, Icur := OriginalRow227TriangleData1713.coefficient147_167,
    output := OriginalRow227TriangleData1720.coefficient148_167, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_169, Icur := OriginalRow227TriangleData1713.coefficient147_168,
    output := OriginalRow227TriangleData1720.coefficient148_168, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_170, Icur := OriginalRow227TriangleData1713.coefficient147_169,
    output := OriginalRow227TriangleData1720.coefficient148_169, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_171, Icur := OriginalRow227TriangleData1713.coefficient147_170,
    output := OriginalRow227TriangleData1720.coefficient148_170, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_172, Icur := OriginalRow227TriangleData1713.coefficient147_171,
    output := OriginalRow227TriangleData1720.coefficient148_171, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_173, Icur := OriginalRow227TriangleData1713.coefficient147_172,
    output := OriginalRow227TriangleData1720.coefficient148_172, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_174, Icur := OriginalRow227TriangleData1713.coefficient147_173,
    output := OriginalRow227TriangleData1720.coefficient148_173, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_175, Icur := OriginalRow227TriangleData1713.coefficient147_174,
    output := OriginalRow227TriangleData1720.coefficient148_174, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_176, Icur := OriginalRow227TriangleData1713.coefficient147_175,
    output := OriginalRow227TriangleData1720.coefficient148_175, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1713.coefficient147_177, Icur := OriginalRow227TriangleData1713.coefficient147_176,
    output := OriginalRow227TriangleData1720.coefficient148_176, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_178, Icur := OriginalRow227TriangleData1713.coefficient147_177,
    output := OriginalRow227TriangleData1720.coefficient148_177, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_179, Icur := OriginalRow227TriangleData1714.coefficient147_178,
    output := OriginalRow227TriangleData1720.coefficient148_178, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1704

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1704.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
