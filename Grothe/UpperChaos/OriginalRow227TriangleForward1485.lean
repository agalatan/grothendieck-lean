import Grothe.UpperChaos.OriginalRow227TriangleData1492
import Grothe.UpperChaos.OriginalRow227TriangleData1493
import Grothe.UpperChaos.OriginalRow227TriangleData1501
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1485
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_152, Icur := OriginalRow227TriangleData1492.coefficient119_151,
    output := OriginalRow227TriangleData1501.coefficient120_151, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_153, Icur := OriginalRow227TriangleData1492.coefficient119_152,
    output := OriginalRow227TriangleData1501.coefficient120_152, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_154, Icur := OriginalRow227TriangleData1492.coefficient119_153,
    output := OriginalRow227TriangleData1501.coefficient120_153, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_155, Icur := OriginalRow227TriangleData1492.coefficient119_154,
    output := OriginalRow227TriangleData1501.coefficient120_154, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_156, Icur := OriginalRow227TriangleData1492.coefficient119_155,
    output := OriginalRow227TriangleData1501.coefficient120_155, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_157, Icur := OriginalRow227TriangleData1492.coefficient119_156,
    output := OriginalRow227TriangleData1501.coefficient120_156, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_158, Icur := OriginalRow227TriangleData1492.coefficient119_157,
    output := OriginalRow227TriangleData1501.coefficient120_157, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_159, Icur := OriginalRow227TriangleData1492.coefficient119_158,
    output := OriginalRow227TriangleData1501.coefficient120_158, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_160, Icur := OriginalRow227TriangleData1492.coefficient119_159,
    output := OriginalRow227TriangleData1501.coefficient120_159, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_161, Icur := OriginalRow227TriangleData1492.coefficient119_160,
    output := OriginalRow227TriangleData1501.coefficient120_160, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_162, Icur := OriginalRow227TriangleData1492.coefficient119_161,
    output := OriginalRow227TriangleData1501.coefficient120_161, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_163, Icur := OriginalRow227TriangleData1492.coefficient119_162,
    output := OriginalRow227TriangleData1501.coefficient120_162, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_164, Icur := OriginalRow227TriangleData1492.coefficient119_163,
    output := OriginalRow227TriangleData1501.coefficient120_163, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_165, Icur := OriginalRow227TriangleData1492.coefficient119_164,
    output := OriginalRow227TriangleData1501.coefficient120_164, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_166, Icur := OriginalRow227TriangleData1492.coefficient119_165,
    output := OriginalRow227TriangleData1501.coefficient120_165, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_167, Icur := OriginalRow227TriangleData1492.coefficient119_166,
    output := OriginalRow227TriangleData1501.coefficient120_166, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_168, Icur := OriginalRow227TriangleData1492.coefficient119_167,
    output := OriginalRow227TriangleData1501.coefficient120_167, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_169, Icur := OriginalRow227TriangleData1492.coefficient119_168,
    output := OriginalRow227TriangleData1501.coefficient120_168, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_170, Icur := OriginalRow227TriangleData1492.coefficient119_169,
    output := OriginalRow227TriangleData1501.coefficient120_169, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_171, Icur := OriginalRow227TriangleData1492.coefficient119_170,
    output := OriginalRow227TriangleData1501.coefficient120_170, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_172, Icur := OriginalRow227TriangleData1492.coefficient119_171,
    output := OriginalRow227TriangleData1501.coefficient120_171, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_173, Icur := OriginalRow227TriangleData1492.coefficient119_172,
    output := OriginalRow227TriangleData1501.coefficient120_172, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_174, Icur := OriginalRow227TriangleData1492.coefficient119_173,
    output := OriginalRow227TriangleData1501.coefficient120_173, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_175, Icur := OriginalRow227TriangleData1492.coefficient119_174,
    output := OriginalRow227TriangleData1501.coefficient120_174, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_176, Icur := OriginalRow227TriangleData1492.coefficient119_175,
    output := OriginalRow227TriangleData1501.coefficient120_175, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_177, Icur := OriginalRow227TriangleData1492.coefficient119_176,
    output := OriginalRow227TriangleData1501.coefficient120_176, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_178, Icur := OriginalRow227TriangleData1492.coefficient119_177,
    output := OriginalRow227TriangleData1501.coefficient120_177, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_179, Icur := OriginalRow227TriangleData1492.coefficient119_178,
    output := OriginalRow227TriangleData1501.coefficient120_178, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_180, Icur := OriginalRow227TriangleData1492.coefficient119_179,
    output := OriginalRow227TriangleData1501.coefficient120_179, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1492.coefficient119_181, Icur := OriginalRow227TriangleData1492.coefficient119_180,
    output := OriginalRow227TriangleData1501.coefficient120_180, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1493.coefficient119_182, Icur := OriginalRow227TriangleData1492.coefficient119_181,
    output := OriginalRow227TriangleData1501.coefficient120_181, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1493.coefficient119_183, Icur := OriginalRow227TriangleData1493.coefficient119_182,
    output := OriginalRow227TriangleData1501.coefficient120_182, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1485

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1485.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
