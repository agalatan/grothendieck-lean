import Grothe.UpperChaos.OriginalRow227TriangleData1528
import Grothe.UpperChaos.OriginalRow227TriangleData1529
import Grothe.UpperChaos.OriginalRow227TriangleData1537
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1521
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_156, Icur := OriginalRow227TriangleData1528.coefficient123_155,
    output := OriginalRow227TriangleData1537.coefficient124_155, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_157, Icur := OriginalRow227TriangleData1528.coefficient123_156,
    output := OriginalRow227TriangleData1537.coefficient124_156, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_158, Icur := OriginalRow227TriangleData1528.coefficient123_157,
    output := OriginalRow227TriangleData1537.coefficient124_157, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_159, Icur := OriginalRow227TriangleData1528.coefficient123_158,
    output := OriginalRow227TriangleData1537.coefficient124_158, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_160, Icur := OriginalRow227TriangleData1528.coefficient123_159,
    output := OriginalRow227TriangleData1537.coefficient124_159, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_161, Icur := OriginalRow227TriangleData1528.coefficient123_160,
    output := OriginalRow227TriangleData1537.coefficient124_160, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_162, Icur := OriginalRow227TriangleData1528.coefficient123_161,
    output := OriginalRow227TriangleData1537.coefficient124_161, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_163, Icur := OriginalRow227TriangleData1528.coefficient123_162,
    output := OriginalRow227TriangleData1537.coefficient124_162, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_164, Icur := OriginalRow227TriangleData1528.coefficient123_163,
    output := OriginalRow227TriangleData1537.coefficient124_163, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_165, Icur := OriginalRow227TriangleData1528.coefficient123_164,
    output := OriginalRow227TriangleData1537.coefficient124_164, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_166, Icur := OriginalRow227TriangleData1528.coefficient123_165,
    output := OriginalRow227TriangleData1537.coefficient124_165, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_167, Icur := OriginalRow227TriangleData1528.coefficient123_166,
    output := OriginalRow227TriangleData1537.coefficient124_166, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_168, Icur := OriginalRow227TriangleData1528.coefficient123_167,
    output := OriginalRow227TriangleData1537.coefficient124_167, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_169, Icur := OriginalRow227TriangleData1528.coefficient123_168,
    output := OriginalRow227TriangleData1537.coefficient124_168, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_170, Icur := OriginalRow227TriangleData1528.coefficient123_169,
    output := OriginalRow227TriangleData1537.coefficient124_169, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_171, Icur := OriginalRow227TriangleData1528.coefficient123_170,
    output := OriginalRow227TriangleData1537.coefficient124_170, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_172, Icur := OriginalRow227TriangleData1528.coefficient123_171,
    output := OriginalRow227TriangleData1537.coefficient124_171, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_173, Icur := OriginalRow227TriangleData1528.coefficient123_172,
    output := OriginalRow227TriangleData1537.coefficient124_172, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_174, Icur := OriginalRow227TriangleData1528.coefficient123_173,
    output := OriginalRow227TriangleData1537.coefficient124_173, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_175, Icur := OriginalRow227TriangleData1528.coefficient123_174,
    output := OriginalRow227TriangleData1537.coefficient124_174, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_176, Icur := OriginalRow227TriangleData1528.coefficient123_175,
    output := OriginalRow227TriangleData1537.coefficient124_175, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_177, Icur := OriginalRow227TriangleData1528.coefficient123_176,
    output := OriginalRow227TriangleData1537.coefficient124_176, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_178, Icur := OriginalRow227TriangleData1528.coefficient123_177,
    output := OriginalRow227TriangleData1537.coefficient124_177, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_179, Icur := OriginalRow227TriangleData1528.coefficient123_178,
    output := OriginalRow227TriangleData1537.coefficient124_178, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_180, Icur := OriginalRow227TriangleData1528.coefficient123_179,
    output := OriginalRow227TriangleData1537.coefficient124_179, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_181, Icur := OriginalRow227TriangleData1528.coefficient123_180,
    output := OriginalRow227TriangleData1537.coefficient124_180, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_182, Icur := OriginalRow227TriangleData1528.coefficient123_181,
    output := OriginalRow227TriangleData1537.coefficient124_181, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_183, Icur := OriginalRow227TriangleData1528.coefficient123_182,
    output := OriginalRow227TriangleData1537.coefficient124_182, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_184, Icur := OriginalRow227TriangleData1528.coefficient123_183,
    output := OriginalRow227TriangleData1537.coefficient124_183, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1528.coefficient123_185, Icur := OriginalRow227TriangleData1528.coefficient123_184,
    output := OriginalRow227TriangleData1537.coefficient124_184, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1529.coefficient123_186, Icur := OriginalRow227TriangleData1528.coefficient123_185,
    output := OriginalRow227TriangleData1537.coefficient124_185, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1529.coefficient123_187, Icur := OriginalRow227TriangleData1529.coefficient123_186,
    output := OriginalRow227TriangleData1537.coefficient124_186, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1521

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1521.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
