import Grothe.UpperChaos.OriginalRow227TriangleData1304
import Grothe.UpperChaos.OriginalRow227TriangleData1305
import Grothe.UpperChaos.OriginalRow227TriangleData1314
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1298
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_164, Icur := OriginalRow227TriangleData1304.coefficient99_163,
    output := OriginalRow227TriangleData1314.coefficient100_163, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_165, Icur := OriginalRow227TriangleData1304.coefficient99_164,
    output := OriginalRow227TriangleData1314.coefficient100_164, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_166, Icur := OriginalRow227TriangleData1304.coefficient99_165,
    output := OriginalRow227TriangleData1314.coefficient100_165, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_167, Icur := OriginalRow227TriangleData1304.coefficient99_166,
    output := OriginalRow227TriangleData1314.coefficient100_166, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_168, Icur := OriginalRow227TriangleData1304.coefficient99_167,
    output := OriginalRow227TriangleData1314.coefficient100_167, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_169, Icur := OriginalRow227TriangleData1304.coefficient99_168,
    output := OriginalRow227TriangleData1314.coefficient100_168, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_170, Icur := OriginalRow227TriangleData1304.coefficient99_169,
    output := OriginalRow227TriangleData1314.coefficient100_169, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_171, Icur := OriginalRow227TriangleData1304.coefficient99_170,
    output := OriginalRow227TriangleData1314.coefficient100_170, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_172, Icur := OriginalRow227TriangleData1304.coefficient99_171,
    output := OriginalRow227TriangleData1314.coefficient100_171, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_173, Icur := OriginalRow227TriangleData1304.coefficient99_172,
    output := OriginalRow227TriangleData1314.coefficient100_172, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_174, Icur := OriginalRow227TriangleData1304.coefficient99_173,
    output := OriginalRow227TriangleData1314.coefficient100_173, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_175, Icur := OriginalRow227TriangleData1304.coefficient99_174,
    output := OriginalRow227TriangleData1314.coefficient100_174, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_176, Icur := OriginalRow227TriangleData1304.coefficient99_175,
    output := OriginalRow227TriangleData1314.coefficient100_175, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_177, Icur := OriginalRow227TriangleData1304.coefficient99_176,
    output := OriginalRow227TriangleData1314.coefficient100_176, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_178, Icur := OriginalRow227TriangleData1304.coefficient99_177,
    output := OriginalRow227TriangleData1314.coefficient100_177, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_179, Icur := OriginalRow227TriangleData1304.coefficient99_178,
    output := OriginalRow227TriangleData1314.coefficient100_178, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_180, Icur := OriginalRow227TriangleData1304.coefficient99_179,
    output := OriginalRow227TriangleData1314.coefficient100_179, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_181, Icur := OriginalRow227TriangleData1304.coefficient99_180,
    output := OriginalRow227TriangleData1314.coefficient100_180, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_182, Icur := OriginalRow227TriangleData1304.coefficient99_181,
    output := OriginalRow227TriangleData1314.coefficient100_181, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_183, Icur := OriginalRow227TriangleData1304.coefficient99_182,
    output := OriginalRow227TriangleData1314.coefficient100_182, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_184, Icur := OriginalRow227TriangleData1304.coefficient99_183,
    output := OriginalRow227TriangleData1314.coefficient100_183, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_185, Icur := OriginalRow227TriangleData1304.coefficient99_184,
    output := OriginalRow227TriangleData1314.coefficient100_184, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_186, Icur := OriginalRow227TriangleData1304.coefficient99_185,
    output := OriginalRow227TriangleData1314.coefficient100_185, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_187, Icur := OriginalRow227TriangleData1304.coefficient99_186,
    output := OriginalRow227TriangleData1314.coefficient100_186, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_188, Icur := OriginalRow227TriangleData1304.coefficient99_187,
    output := OriginalRow227TriangleData1314.coefficient100_187, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_189, Icur := OriginalRow227TriangleData1304.coefficient99_188,
    output := OriginalRow227TriangleData1314.coefficient100_188, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_190, Icur := OriginalRow227TriangleData1304.coefficient99_189,
    output := OriginalRow227TriangleData1314.coefficient100_189, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_191, Icur := OriginalRow227TriangleData1304.coefficient99_190,
    output := OriginalRow227TriangleData1314.coefficient100_190, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_192, Icur := OriginalRow227TriangleData1304.coefficient99_191,
    output := OriginalRow227TriangleData1314.coefficient100_191, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1304.coefficient99_193, Icur := OriginalRow227TriangleData1304.coefficient99_192,
    output := OriginalRow227TriangleData1314.coefficient100_192, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1305.coefficient99_194, Icur := OriginalRow227TriangleData1304.coefficient99_193,
    output := OriginalRow227TriangleData1314.coefficient100_193, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1305.coefficient99_195, Icur := OriginalRow227TriangleData1305.coefficient99_194,
    output := OriginalRow227TriangleData1314.coefficient100_194, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1298

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1298.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
