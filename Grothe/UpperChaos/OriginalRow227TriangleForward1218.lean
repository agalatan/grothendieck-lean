import Grothe.UpperChaos.OriginalRow227TriangleData1223
import Grothe.UpperChaos.OriginalRow227TriangleData1224
import Grothe.UpperChaos.OriginalRow227TriangleData1234
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1218
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_156, Icur := OriginalRow227TriangleData1223.coefficient91_155,
    output := OriginalRow227TriangleData1234.coefficient92_155, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_157, Icur := OriginalRow227TriangleData1223.coefficient91_156,
    output := OriginalRow227TriangleData1234.coefficient92_156, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_158, Icur := OriginalRow227TriangleData1223.coefficient91_157,
    output := OriginalRow227TriangleData1234.coefficient92_157, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_159, Icur := OriginalRow227TriangleData1223.coefficient91_158,
    output := OriginalRow227TriangleData1234.coefficient92_158, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_160, Icur := OriginalRow227TriangleData1223.coefficient91_159,
    output := OriginalRow227TriangleData1234.coefficient92_159, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_161, Icur := OriginalRow227TriangleData1223.coefficient91_160,
    output := OriginalRow227TriangleData1234.coefficient92_160, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_162, Icur := OriginalRow227TriangleData1223.coefficient91_161,
    output := OriginalRow227TriangleData1234.coefficient92_161, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_163, Icur := OriginalRow227TriangleData1223.coefficient91_162,
    output := OriginalRow227TriangleData1234.coefficient92_162, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_164, Icur := OriginalRow227TriangleData1223.coefficient91_163,
    output := OriginalRow227TriangleData1234.coefficient92_163, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_165, Icur := OriginalRow227TriangleData1223.coefficient91_164,
    output := OriginalRow227TriangleData1234.coefficient92_164, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_166, Icur := OriginalRow227TriangleData1223.coefficient91_165,
    output := OriginalRow227TriangleData1234.coefficient92_165, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_167, Icur := OriginalRow227TriangleData1223.coefficient91_166,
    output := OriginalRow227TriangleData1234.coefficient92_166, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_168, Icur := OriginalRow227TriangleData1223.coefficient91_167,
    output := OriginalRow227TriangleData1234.coefficient92_167, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_169, Icur := OriginalRow227TriangleData1223.coefficient91_168,
    output := OriginalRow227TriangleData1234.coefficient92_168, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_170, Icur := OriginalRow227TriangleData1223.coefficient91_169,
    output := OriginalRow227TriangleData1234.coefficient92_169, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_171, Icur := OriginalRow227TriangleData1223.coefficient91_170,
    output := OriginalRow227TriangleData1234.coefficient92_170, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_172, Icur := OriginalRow227TriangleData1223.coefficient91_171,
    output := OriginalRow227TriangleData1234.coefficient92_171, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_173, Icur := OriginalRow227TriangleData1223.coefficient91_172,
    output := OriginalRow227TriangleData1234.coefficient92_172, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_174, Icur := OriginalRow227TriangleData1223.coefficient91_173,
    output := OriginalRow227TriangleData1234.coefficient92_173, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_175, Icur := OriginalRow227TriangleData1223.coefficient91_174,
    output := OriginalRow227TriangleData1234.coefficient92_174, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_176, Icur := OriginalRow227TriangleData1223.coefficient91_175,
    output := OriginalRow227TriangleData1234.coefficient92_175, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_177, Icur := OriginalRow227TriangleData1223.coefficient91_176,
    output := OriginalRow227TriangleData1234.coefficient92_176, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_178, Icur := OriginalRow227TriangleData1223.coefficient91_177,
    output := OriginalRow227TriangleData1234.coefficient92_177, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_179, Icur := OriginalRow227TriangleData1223.coefficient91_178,
    output := OriginalRow227TriangleData1234.coefficient92_178, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_180, Icur := OriginalRow227TriangleData1223.coefficient91_179,
    output := OriginalRow227TriangleData1234.coefficient92_179, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_181, Icur := OriginalRow227TriangleData1223.coefficient91_180,
    output := OriginalRow227TriangleData1234.coefficient92_180, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_182, Icur := OriginalRow227TriangleData1223.coefficient91_181,
    output := OriginalRow227TriangleData1234.coefficient92_181, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_183, Icur := OriginalRow227TriangleData1223.coefficient91_182,
    output := OriginalRow227TriangleData1234.coefficient92_182, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_184, Icur := OriginalRow227TriangleData1223.coefficient91_183,
    output := OriginalRow227TriangleData1234.coefficient92_183, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1223.coefficient91_185, Icur := OriginalRow227TriangleData1223.coefficient91_184,
    output := OriginalRow227TriangleData1234.coefficient92_184, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_186, Icur := OriginalRow227TriangleData1223.coefficient91_185,
    output := OriginalRow227TriangleData1234.coefficient92_185, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1224.coefficient91_187, Icur := OriginalRow227TriangleData1224.coefficient91_186,
    output := OriginalRow227TriangleData1234.coefficient92_186, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1218

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1218.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
