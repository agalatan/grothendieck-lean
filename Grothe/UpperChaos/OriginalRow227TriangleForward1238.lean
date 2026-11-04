import Grothe.UpperChaos.OriginalRow227TriangleData1244
import Grothe.UpperChaos.OriginalRow227TriangleData1245
import Grothe.UpperChaos.OriginalRow227TriangleData1254
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1238
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_158, Icur := OriginalRow227TriangleData1244.coefficient93_157,
    output := OriginalRow227TriangleData1254.coefficient94_157, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_159, Icur := OriginalRow227TriangleData1244.coefficient93_158,
    output := OriginalRow227TriangleData1254.coefficient94_158, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_160, Icur := OriginalRow227TriangleData1244.coefficient93_159,
    output := OriginalRow227TriangleData1254.coefficient94_159, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_161, Icur := OriginalRow227TriangleData1244.coefficient93_160,
    output := OriginalRow227TriangleData1254.coefficient94_160, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_162, Icur := OriginalRow227TriangleData1244.coefficient93_161,
    output := OriginalRow227TriangleData1254.coefficient94_161, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_163, Icur := OriginalRow227TriangleData1244.coefficient93_162,
    output := OriginalRow227TriangleData1254.coefficient94_162, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_164, Icur := OriginalRow227TriangleData1244.coefficient93_163,
    output := OriginalRow227TriangleData1254.coefficient94_163, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_165, Icur := OriginalRow227TriangleData1244.coefficient93_164,
    output := OriginalRow227TriangleData1254.coefficient94_164, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_166, Icur := OriginalRow227TriangleData1244.coefficient93_165,
    output := OriginalRow227TriangleData1254.coefficient94_165, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_167, Icur := OriginalRow227TriangleData1244.coefficient93_166,
    output := OriginalRow227TriangleData1254.coefficient94_166, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_168, Icur := OriginalRow227TriangleData1244.coefficient93_167,
    output := OriginalRow227TriangleData1254.coefficient94_167, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_169, Icur := OriginalRow227TriangleData1244.coefficient93_168,
    output := OriginalRow227TriangleData1254.coefficient94_168, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_170, Icur := OriginalRow227TriangleData1244.coefficient93_169,
    output := OriginalRow227TriangleData1254.coefficient94_169, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_171, Icur := OriginalRow227TriangleData1244.coefficient93_170,
    output := OriginalRow227TriangleData1254.coefficient94_170, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_172, Icur := OriginalRow227TriangleData1244.coefficient93_171,
    output := OriginalRow227TriangleData1254.coefficient94_171, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_173, Icur := OriginalRow227TriangleData1244.coefficient93_172,
    output := OriginalRow227TriangleData1254.coefficient94_172, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_174, Icur := OriginalRow227TriangleData1244.coefficient93_173,
    output := OriginalRow227TriangleData1254.coefficient94_173, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_175, Icur := OriginalRow227TriangleData1244.coefficient93_174,
    output := OriginalRow227TriangleData1254.coefficient94_174, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_176, Icur := OriginalRow227TriangleData1244.coefficient93_175,
    output := OriginalRow227TriangleData1254.coefficient94_175, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_177, Icur := OriginalRow227TriangleData1244.coefficient93_176,
    output := OriginalRow227TriangleData1254.coefficient94_176, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_178, Icur := OriginalRow227TriangleData1244.coefficient93_177,
    output := OriginalRow227TriangleData1254.coefficient94_177, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_179, Icur := OriginalRow227TriangleData1244.coefficient93_178,
    output := OriginalRow227TriangleData1254.coefficient94_178, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_180, Icur := OriginalRow227TriangleData1244.coefficient93_179,
    output := OriginalRow227TriangleData1254.coefficient94_179, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_181, Icur := OriginalRow227TriangleData1244.coefficient93_180,
    output := OriginalRow227TriangleData1254.coefficient94_180, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_182, Icur := OriginalRow227TriangleData1244.coefficient93_181,
    output := OriginalRow227TriangleData1254.coefficient94_181, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_183, Icur := OriginalRow227TriangleData1244.coefficient93_182,
    output := OriginalRow227TriangleData1254.coefficient94_182, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_184, Icur := OriginalRow227TriangleData1244.coefficient93_183,
    output := OriginalRow227TriangleData1254.coefficient94_183, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_185, Icur := OriginalRow227TriangleData1244.coefficient93_184,
    output := OriginalRow227TriangleData1254.coefficient94_184, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_186, Icur := OriginalRow227TriangleData1244.coefficient93_185,
    output := OriginalRow227TriangleData1254.coefficient94_185, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1244.coefficient93_187, Icur := OriginalRow227TriangleData1244.coefficient93_186,
    output := OriginalRow227TriangleData1254.coefficient94_186, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1245.coefficient93_188, Icur := OriginalRow227TriangleData1244.coefficient93_187,
    output := OriginalRow227TriangleData1254.coefficient94_187, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1245.coefficient93_189, Icur := OriginalRow227TriangleData1245.coefficient93_188,
    output := OriginalRow227TriangleData1254.coefficient94_188, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1238

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1238.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
