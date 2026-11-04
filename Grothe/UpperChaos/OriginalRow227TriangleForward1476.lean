import Grothe.UpperChaos.OriginalRow227TriangleData1483
import Grothe.UpperChaos.OriginalRow227TriangleData1484
import Grothe.UpperChaos.OriginalRow227TriangleData1492
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1476
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_151, Icur := OriginalRow227TriangleData1483.coefficient118_150,
    output := OriginalRow227TriangleData1492.coefficient119_150, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_152, Icur := OriginalRow227TriangleData1483.coefficient118_151,
    output := OriginalRow227TriangleData1492.coefficient119_151, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_153, Icur := OriginalRow227TriangleData1483.coefficient118_152,
    output := OriginalRow227TriangleData1492.coefficient119_152, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_154, Icur := OriginalRow227TriangleData1483.coefficient118_153,
    output := OriginalRow227TriangleData1492.coefficient119_153, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_155, Icur := OriginalRow227TriangleData1483.coefficient118_154,
    output := OriginalRow227TriangleData1492.coefficient119_154, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_156, Icur := OriginalRow227TriangleData1483.coefficient118_155,
    output := OriginalRow227TriangleData1492.coefficient119_155, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_157, Icur := OriginalRow227TriangleData1483.coefficient118_156,
    output := OriginalRow227TriangleData1492.coefficient119_156, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_158, Icur := OriginalRow227TriangleData1483.coefficient118_157,
    output := OriginalRow227TriangleData1492.coefficient119_157, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_159, Icur := OriginalRow227TriangleData1483.coefficient118_158,
    output := OriginalRow227TriangleData1492.coefficient119_158, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_160, Icur := OriginalRow227TriangleData1483.coefficient118_159,
    output := OriginalRow227TriangleData1492.coefficient119_159, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_161, Icur := OriginalRow227TriangleData1483.coefficient118_160,
    output := OriginalRow227TriangleData1492.coefficient119_160, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_162, Icur := OriginalRow227TriangleData1483.coefficient118_161,
    output := OriginalRow227TriangleData1492.coefficient119_161, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_163, Icur := OriginalRow227TriangleData1483.coefficient118_162,
    output := OriginalRow227TriangleData1492.coefficient119_162, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_164, Icur := OriginalRow227TriangleData1483.coefficient118_163,
    output := OriginalRow227TriangleData1492.coefficient119_163, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_165, Icur := OriginalRow227TriangleData1483.coefficient118_164,
    output := OriginalRow227TriangleData1492.coefficient119_164, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_166, Icur := OriginalRow227TriangleData1483.coefficient118_165,
    output := OriginalRow227TriangleData1492.coefficient119_165, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_167, Icur := OriginalRow227TriangleData1483.coefficient118_166,
    output := OriginalRow227TriangleData1492.coefficient119_166, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_168, Icur := OriginalRow227TriangleData1483.coefficient118_167,
    output := OriginalRow227TriangleData1492.coefficient119_167, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_169, Icur := OriginalRow227TriangleData1483.coefficient118_168,
    output := OriginalRow227TriangleData1492.coefficient119_168, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_170, Icur := OriginalRow227TriangleData1483.coefficient118_169,
    output := OriginalRow227TriangleData1492.coefficient119_169, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_171, Icur := OriginalRow227TriangleData1483.coefficient118_170,
    output := OriginalRow227TriangleData1492.coefficient119_170, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_172, Icur := OriginalRow227TriangleData1483.coefficient118_171,
    output := OriginalRow227TriangleData1492.coefficient119_171, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_173, Icur := OriginalRow227TriangleData1483.coefficient118_172,
    output := OriginalRow227TriangleData1492.coefficient119_172, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_174, Icur := OriginalRow227TriangleData1483.coefficient118_173,
    output := OriginalRow227TriangleData1492.coefficient119_173, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_175, Icur := OriginalRow227TriangleData1483.coefficient118_174,
    output := OriginalRow227TriangleData1492.coefficient119_174, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_176, Icur := OriginalRow227TriangleData1483.coefficient118_175,
    output := OriginalRow227TriangleData1492.coefficient119_175, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_177, Icur := OriginalRow227TriangleData1483.coefficient118_176,
    output := OriginalRow227TriangleData1492.coefficient119_176, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_178, Icur := OriginalRow227TriangleData1483.coefficient118_177,
    output := OriginalRow227TriangleData1492.coefficient119_177, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_179, Icur := OriginalRow227TriangleData1483.coefficient118_178,
    output := OriginalRow227TriangleData1492.coefficient119_178, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1483.coefficient118_180, Icur := OriginalRow227TriangleData1483.coefficient118_179,
    output := OriginalRow227TriangleData1492.coefficient119_179, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1484.coefficient118_181, Icur := OriginalRow227TriangleData1483.coefficient118_180,
    output := OriginalRow227TriangleData1492.coefficient119_180, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1484.coefficient118_182, Icur := OriginalRow227TriangleData1484.coefficient118_181,
    output := OriginalRow227TriangleData1492.coefficient119_181, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1476

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1476.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
