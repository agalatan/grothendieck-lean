import Grothe.UpperChaos.OriginalRow227TriangleData1179
import Grothe.UpperChaos.OriginalRow227TriangleData1180
import Grothe.UpperChaos.OriginalRow227TriangleData1190
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1174
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_152, Icur := OriginalRow227TriangleData1179.coefficient87_151,
    output := OriginalRow227TriangleData1190.coefficient88_151, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_153, Icur := OriginalRow227TriangleData1179.coefficient87_152,
    output := OriginalRow227TriangleData1190.coefficient88_152, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_154, Icur := OriginalRow227TriangleData1179.coefficient87_153,
    output := OriginalRow227TriangleData1190.coefficient88_153, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_155, Icur := OriginalRow227TriangleData1179.coefficient87_154,
    output := OriginalRow227TriangleData1190.coefficient88_154, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_156, Icur := OriginalRow227TriangleData1179.coefficient87_155,
    output := OriginalRow227TriangleData1190.coefficient88_155, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_157, Icur := OriginalRow227TriangleData1179.coefficient87_156,
    output := OriginalRow227TriangleData1190.coefficient88_156, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_158, Icur := OriginalRow227TriangleData1179.coefficient87_157,
    output := OriginalRow227TriangleData1190.coefficient88_157, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_159, Icur := OriginalRow227TriangleData1179.coefficient87_158,
    output := OriginalRow227TriangleData1190.coefficient88_158, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_160, Icur := OriginalRow227TriangleData1179.coefficient87_159,
    output := OriginalRow227TriangleData1190.coefficient88_159, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_161, Icur := OriginalRow227TriangleData1179.coefficient87_160,
    output := OriginalRow227TriangleData1190.coefficient88_160, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_162, Icur := OriginalRow227TriangleData1179.coefficient87_161,
    output := OriginalRow227TriangleData1190.coefficient88_161, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_163, Icur := OriginalRow227TriangleData1179.coefficient87_162,
    output := OriginalRow227TriangleData1190.coefficient88_162, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_164, Icur := OriginalRow227TriangleData1179.coefficient87_163,
    output := OriginalRow227TriangleData1190.coefficient88_163, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_165, Icur := OriginalRow227TriangleData1179.coefficient87_164,
    output := OriginalRow227TriangleData1190.coefficient88_164, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_166, Icur := OriginalRow227TriangleData1179.coefficient87_165,
    output := OriginalRow227TriangleData1190.coefficient88_165, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_167, Icur := OriginalRow227TriangleData1179.coefficient87_166,
    output := OriginalRow227TriangleData1190.coefficient88_166, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_168, Icur := OriginalRow227TriangleData1179.coefficient87_167,
    output := OriginalRow227TriangleData1190.coefficient88_167, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_169, Icur := OriginalRow227TriangleData1179.coefficient87_168,
    output := OriginalRow227TriangleData1190.coefficient88_168, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_170, Icur := OriginalRow227TriangleData1179.coefficient87_169,
    output := OriginalRow227TriangleData1190.coefficient88_169, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_171, Icur := OriginalRow227TriangleData1179.coefficient87_170,
    output := OriginalRow227TriangleData1190.coefficient88_170, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_172, Icur := OriginalRow227TriangleData1179.coefficient87_171,
    output := OriginalRow227TriangleData1190.coefficient88_171, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_173, Icur := OriginalRow227TriangleData1179.coefficient87_172,
    output := OriginalRow227TriangleData1190.coefficient88_172, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_174, Icur := OriginalRow227TriangleData1179.coefficient87_173,
    output := OriginalRow227TriangleData1190.coefficient88_173, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_175, Icur := OriginalRow227TriangleData1179.coefficient87_174,
    output := OriginalRow227TriangleData1190.coefficient88_174, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_176, Icur := OriginalRow227TriangleData1179.coefficient87_175,
    output := OriginalRow227TriangleData1190.coefficient88_175, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_177, Icur := OriginalRow227TriangleData1179.coefficient87_176,
    output := OriginalRow227TriangleData1190.coefficient88_176, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_178, Icur := OriginalRow227TriangleData1179.coefficient87_177,
    output := OriginalRow227TriangleData1190.coefficient88_177, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_179, Icur := OriginalRow227TriangleData1179.coefficient87_178,
    output := OriginalRow227TriangleData1190.coefficient88_178, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_180, Icur := OriginalRow227TriangleData1179.coefficient87_179,
    output := OriginalRow227TriangleData1190.coefficient88_179, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1179.coefficient87_181, Icur := OriginalRow227TriangleData1179.coefficient87_180,
    output := OriginalRow227TriangleData1190.coefficient88_180, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1180.coefficient87_182, Icur := OriginalRow227TriangleData1179.coefficient87_181,
    output := OriginalRow227TriangleData1190.coefficient88_181, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root88,
    Inext := OriginalRow227TriangleData1180.coefficient87_183, Icur := OriginalRow227TriangleData1180.coefficient87_182,
    output := OriginalRow227TriangleData1190.coefficient88_182, hC := OriginalRow227TriangleRoots02.root88_pos, hAC := OriginalRow227TriangleRoots02.product88_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1174

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1174.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
