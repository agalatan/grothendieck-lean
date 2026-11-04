import Grothe.UpperChaos.OriginalRow227TriangleData1344
import Grothe.UpperChaos.OriginalRow227TriangleData1345
import Grothe.UpperChaos.OriginalRow227TriangleData1354
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1338
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_168, Icur := OriginalRow227TriangleData1344.coefficient103_167,
    output := OriginalRow227TriangleData1354.coefficient104_167, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_169, Icur := OriginalRow227TriangleData1344.coefficient103_168,
    output := OriginalRow227TriangleData1354.coefficient104_168, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_170, Icur := OriginalRow227TriangleData1344.coefficient103_169,
    output := OriginalRow227TriangleData1354.coefficient104_169, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_171, Icur := OriginalRow227TriangleData1344.coefficient103_170,
    output := OriginalRow227TriangleData1354.coefficient104_170, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_172, Icur := OriginalRow227TriangleData1344.coefficient103_171,
    output := OriginalRow227TriangleData1354.coefficient104_171, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_173, Icur := OriginalRow227TriangleData1344.coefficient103_172,
    output := OriginalRow227TriangleData1354.coefficient104_172, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_174, Icur := OriginalRow227TriangleData1344.coefficient103_173,
    output := OriginalRow227TriangleData1354.coefficient104_173, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_175, Icur := OriginalRow227TriangleData1344.coefficient103_174,
    output := OriginalRow227TriangleData1354.coefficient104_174, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_176, Icur := OriginalRow227TriangleData1344.coefficient103_175,
    output := OriginalRow227TriangleData1354.coefficient104_175, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_177, Icur := OriginalRow227TriangleData1344.coefficient103_176,
    output := OriginalRow227TriangleData1354.coefficient104_176, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_178, Icur := OriginalRow227TriangleData1344.coefficient103_177,
    output := OriginalRow227TriangleData1354.coefficient104_177, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_179, Icur := OriginalRow227TriangleData1344.coefficient103_178,
    output := OriginalRow227TriangleData1354.coefficient104_178, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_180, Icur := OriginalRow227TriangleData1344.coefficient103_179,
    output := OriginalRow227TriangleData1354.coefficient104_179, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_181, Icur := OriginalRow227TriangleData1344.coefficient103_180,
    output := OriginalRow227TriangleData1354.coefficient104_180, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_182, Icur := OriginalRow227TriangleData1344.coefficient103_181,
    output := OriginalRow227TriangleData1354.coefficient104_181, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_183, Icur := OriginalRow227TriangleData1344.coefficient103_182,
    output := OriginalRow227TriangleData1354.coefficient104_182, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_184, Icur := OriginalRow227TriangleData1344.coefficient103_183,
    output := OriginalRow227TriangleData1354.coefficient104_183, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_185, Icur := OriginalRow227TriangleData1344.coefficient103_184,
    output := OriginalRow227TriangleData1354.coefficient104_184, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_186, Icur := OriginalRow227TriangleData1344.coefficient103_185,
    output := OriginalRow227TriangleData1354.coefficient104_185, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_187, Icur := OriginalRow227TriangleData1344.coefficient103_186,
    output := OriginalRow227TriangleData1354.coefficient104_186, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_188, Icur := OriginalRow227TriangleData1344.coefficient103_187,
    output := OriginalRow227TriangleData1354.coefficient104_187, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_189, Icur := OriginalRow227TriangleData1344.coefficient103_188,
    output := OriginalRow227TriangleData1354.coefficient104_188, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_190, Icur := OriginalRow227TriangleData1344.coefficient103_189,
    output := OriginalRow227TriangleData1354.coefficient104_189, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_191, Icur := OriginalRow227TriangleData1344.coefficient103_190,
    output := OriginalRow227TriangleData1354.coefficient104_190, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_192, Icur := OriginalRow227TriangleData1344.coefficient103_191,
    output := OriginalRow227TriangleData1354.coefficient104_191, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_193, Icur := OriginalRow227TriangleData1344.coefficient103_192,
    output := OriginalRow227TriangleData1354.coefficient104_192, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_194, Icur := OriginalRow227TriangleData1344.coefficient103_193,
    output := OriginalRow227TriangleData1354.coefficient104_193, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_195, Icur := OriginalRow227TriangleData1344.coefficient103_194,
    output := OriginalRow227TriangleData1354.coefficient104_194, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_196, Icur := OriginalRow227TriangleData1344.coefficient103_195,
    output := OriginalRow227TriangleData1354.coefficient104_195, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1344.coefficient103_197, Icur := OriginalRow227TriangleData1344.coefficient103_196,
    output := OriginalRow227TriangleData1354.coefficient104_196, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1345.coefficient103_198, Icur := OriginalRow227TriangleData1344.coefficient103_197,
    output := OriginalRow227TriangleData1354.coefficient104_197, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1345.coefficient103_199, Icur := OriginalRow227TriangleData1345.coefficient103_198,
    output := OriginalRow227TriangleData1354.coefficient104_198, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1338

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1338.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
