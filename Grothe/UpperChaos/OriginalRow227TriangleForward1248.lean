import Grothe.UpperChaos.OriginalRow227TriangleData1254
import Grothe.UpperChaos.OriginalRow227TriangleData1255
import Grothe.UpperChaos.OriginalRow227TriangleData1264
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1248
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_159, Icur := OriginalRow227TriangleData1254.coefficient94_158,
    output := OriginalRow227TriangleData1264.coefficient95_158, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_160, Icur := OriginalRow227TriangleData1254.coefficient94_159,
    output := OriginalRow227TriangleData1264.coefficient95_159, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_161, Icur := OriginalRow227TriangleData1254.coefficient94_160,
    output := OriginalRow227TriangleData1264.coefficient95_160, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_162, Icur := OriginalRow227TriangleData1254.coefficient94_161,
    output := OriginalRow227TriangleData1264.coefficient95_161, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_163, Icur := OriginalRow227TriangleData1254.coefficient94_162,
    output := OriginalRow227TriangleData1264.coefficient95_162, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_164, Icur := OriginalRow227TriangleData1254.coefficient94_163,
    output := OriginalRow227TriangleData1264.coefficient95_163, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_165, Icur := OriginalRow227TriangleData1254.coefficient94_164,
    output := OriginalRow227TriangleData1264.coefficient95_164, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_166, Icur := OriginalRow227TriangleData1254.coefficient94_165,
    output := OriginalRow227TriangleData1264.coefficient95_165, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_167, Icur := OriginalRow227TriangleData1254.coefficient94_166,
    output := OriginalRow227TriangleData1264.coefficient95_166, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_168, Icur := OriginalRow227TriangleData1254.coefficient94_167,
    output := OriginalRow227TriangleData1264.coefficient95_167, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_169, Icur := OriginalRow227TriangleData1254.coefficient94_168,
    output := OriginalRow227TriangleData1264.coefficient95_168, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_170, Icur := OriginalRow227TriangleData1254.coefficient94_169,
    output := OriginalRow227TriangleData1264.coefficient95_169, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_171, Icur := OriginalRow227TriangleData1254.coefficient94_170,
    output := OriginalRow227TriangleData1264.coefficient95_170, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_172, Icur := OriginalRow227TriangleData1254.coefficient94_171,
    output := OriginalRow227TriangleData1264.coefficient95_171, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_173, Icur := OriginalRow227TriangleData1254.coefficient94_172,
    output := OriginalRow227TriangleData1264.coefficient95_172, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_174, Icur := OriginalRow227TriangleData1254.coefficient94_173,
    output := OriginalRow227TriangleData1264.coefficient95_173, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_175, Icur := OriginalRow227TriangleData1254.coefficient94_174,
    output := OriginalRow227TriangleData1264.coefficient95_174, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_176, Icur := OriginalRow227TriangleData1254.coefficient94_175,
    output := OriginalRow227TriangleData1264.coefficient95_175, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_177, Icur := OriginalRow227TriangleData1254.coefficient94_176,
    output := OriginalRow227TriangleData1264.coefficient95_176, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_178, Icur := OriginalRow227TriangleData1254.coefficient94_177,
    output := OriginalRow227TriangleData1264.coefficient95_177, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_179, Icur := OriginalRow227TriangleData1254.coefficient94_178,
    output := OriginalRow227TriangleData1264.coefficient95_178, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_180, Icur := OriginalRow227TriangleData1254.coefficient94_179,
    output := OriginalRow227TriangleData1264.coefficient95_179, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_181, Icur := OriginalRow227TriangleData1254.coefficient94_180,
    output := OriginalRow227TriangleData1264.coefficient95_180, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_182, Icur := OriginalRow227TriangleData1254.coefficient94_181,
    output := OriginalRow227TriangleData1264.coefficient95_181, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_183, Icur := OriginalRow227TriangleData1254.coefficient94_182,
    output := OriginalRow227TriangleData1264.coefficient95_182, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_184, Icur := OriginalRow227TriangleData1254.coefficient94_183,
    output := OriginalRow227TriangleData1264.coefficient95_183, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_185, Icur := OriginalRow227TriangleData1254.coefficient94_184,
    output := OriginalRow227TriangleData1264.coefficient95_184, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_186, Icur := OriginalRow227TriangleData1254.coefficient94_185,
    output := OriginalRow227TriangleData1264.coefficient95_185, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_187, Icur := OriginalRow227TriangleData1254.coefficient94_186,
    output := OriginalRow227TriangleData1264.coefficient95_186, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1254.coefficient94_188, Icur := OriginalRow227TriangleData1254.coefficient94_187,
    output := OriginalRow227TriangleData1264.coefficient95_187, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1255.coefficient94_189, Icur := OriginalRow227TriangleData1254.coefficient94_188,
    output := OriginalRow227TriangleData1264.coefficient95_188, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1255.coefficient94_190, Icur := OriginalRow227TriangleData1255.coefficient94_189,
    output := OriginalRow227TriangleData1264.coefficient95_189, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1248

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1248.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
