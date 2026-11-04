import Grothe.UpperChaos.OriginalRow227TriangleData1294
import Grothe.UpperChaos.OriginalRow227TriangleData1295
import Grothe.UpperChaos.OriginalRow227TriangleData1304
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1288
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_163, Icur := OriginalRow227TriangleData1294.coefficient98_162,
    output := OriginalRow227TriangleData1304.coefficient99_162, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_164, Icur := OriginalRow227TriangleData1294.coefficient98_163,
    output := OriginalRow227TriangleData1304.coefficient99_163, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_165, Icur := OriginalRow227TriangleData1294.coefficient98_164,
    output := OriginalRow227TriangleData1304.coefficient99_164, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_166, Icur := OriginalRow227TriangleData1294.coefficient98_165,
    output := OriginalRow227TriangleData1304.coefficient99_165, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_167, Icur := OriginalRow227TriangleData1294.coefficient98_166,
    output := OriginalRow227TriangleData1304.coefficient99_166, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_168, Icur := OriginalRow227TriangleData1294.coefficient98_167,
    output := OriginalRow227TriangleData1304.coefficient99_167, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_169, Icur := OriginalRow227TriangleData1294.coefficient98_168,
    output := OriginalRow227TriangleData1304.coefficient99_168, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_170, Icur := OriginalRow227TriangleData1294.coefficient98_169,
    output := OriginalRow227TriangleData1304.coefficient99_169, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_171, Icur := OriginalRow227TriangleData1294.coefficient98_170,
    output := OriginalRow227TriangleData1304.coefficient99_170, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_172, Icur := OriginalRow227TriangleData1294.coefficient98_171,
    output := OriginalRow227TriangleData1304.coefficient99_171, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_173, Icur := OriginalRow227TriangleData1294.coefficient98_172,
    output := OriginalRow227TriangleData1304.coefficient99_172, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_174, Icur := OriginalRow227TriangleData1294.coefficient98_173,
    output := OriginalRow227TriangleData1304.coefficient99_173, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_175, Icur := OriginalRow227TriangleData1294.coefficient98_174,
    output := OriginalRow227TriangleData1304.coefficient99_174, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_176, Icur := OriginalRow227TriangleData1294.coefficient98_175,
    output := OriginalRow227TriangleData1304.coefficient99_175, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_177, Icur := OriginalRow227TriangleData1294.coefficient98_176,
    output := OriginalRow227TriangleData1304.coefficient99_176, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_178, Icur := OriginalRow227TriangleData1294.coefficient98_177,
    output := OriginalRow227TriangleData1304.coefficient99_177, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_179, Icur := OriginalRow227TriangleData1294.coefficient98_178,
    output := OriginalRow227TriangleData1304.coefficient99_178, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_180, Icur := OriginalRow227TriangleData1294.coefficient98_179,
    output := OriginalRow227TriangleData1304.coefficient99_179, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_181, Icur := OriginalRow227TriangleData1294.coefficient98_180,
    output := OriginalRow227TriangleData1304.coefficient99_180, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_182, Icur := OriginalRow227TriangleData1294.coefficient98_181,
    output := OriginalRow227TriangleData1304.coefficient99_181, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_183, Icur := OriginalRow227TriangleData1294.coefficient98_182,
    output := OriginalRow227TriangleData1304.coefficient99_182, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_184, Icur := OriginalRow227TriangleData1294.coefficient98_183,
    output := OriginalRow227TriangleData1304.coefficient99_183, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_185, Icur := OriginalRow227TriangleData1294.coefficient98_184,
    output := OriginalRow227TriangleData1304.coefficient99_184, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_186, Icur := OriginalRow227TriangleData1294.coefficient98_185,
    output := OriginalRow227TriangleData1304.coefficient99_185, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_187, Icur := OriginalRow227TriangleData1294.coefficient98_186,
    output := OriginalRow227TriangleData1304.coefficient99_186, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_188, Icur := OriginalRow227TriangleData1294.coefficient98_187,
    output := OriginalRow227TriangleData1304.coefficient99_187, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_189, Icur := OriginalRow227TriangleData1294.coefficient98_188,
    output := OriginalRow227TriangleData1304.coefficient99_188, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_190, Icur := OriginalRow227TriangleData1294.coefficient98_189,
    output := OriginalRow227TriangleData1304.coefficient99_189, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_191, Icur := OriginalRow227TriangleData1294.coefficient98_190,
    output := OriginalRow227TriangleData1304.coefficient99_190, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1294.coefficient98_192, Icur := OriginalRow227TriangleData1294.coefficient98_191,
    output := OriginalRow227TriangleData1304.coefficient99_191, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_193, Icur := OriginalRow227TriangleData1294.coefficient98_192,
    output := OriginalRow227TriangleData1304.coefficient99_192, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1295.coefficient98_194, Icur := OriginalRow227TriangleData1295.coefficient98_193,
    output := OriginalRow227TriangleData1304.coefficient99_193, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1288

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1288.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
