import Grothe.UpperChaos.OriginalRow227TriangleData1324
import Grothe.UpperChaos.OriginalRow227TriangleData1325
import Grothe.UpperChaos.OriginalRow227TriangleData1334
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1318
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_166, Icur := OriginalRow227TriangleData1324.coefficient101_165,
    output := OriginalRow227TriangleData1334.coefficient102_165, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_167, Icur := OriginalRow227TriangleData1324.coefficient101_166,
    output := OriginalRow227TriangleData1334.coefficient102_166, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_168, Icur := OriginalRow227TriangleData1324.coefficient101_167,
    output := OriginalRow227TriangleData1334.coefficient102_167, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_169, Icur := OriginalRow227TriangleData1324.coefficient101_168,
    output := OriginalRow227TriangleData1334.coefficient102_168, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_170, Icur := OriginalRow227TriangleData1324.coefficient101_169,
    output := OriginalRow227TriangleData1334.coefficient102_169, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_171, Icur := OriginalRow227TriangleData1324.coefficient101_170,
    output := OriginalRow227TriangleData1334.coefficient102_170, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_172, Icur := OriginalRow227TriangleData1324.coefficient101_171,
    output := OriginalRow227TriangleData1334.coefficient102_171, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_173, Icur := OriginalRow227TriangleData1324.coefficient101_172,
    output := OriginalRow227TriangleData1334.coefficient102_172, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_174, Icur := OriginalRow227TriangleData1324.coefficient101_173,
    output := OriginalRow227TriangleData1334.coefficient102_173, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_175, Icur := OriginalRow227TriangleData1324.coefficient101_174,
    output := OriginalRow227TriangleData1334.coefficient102_174, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_176, Icur := OriginalRow227TriangleData1324.coefficient101_175,
    output := OriginalRow227TriangleData1334.coefficient102_175, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_177, Icur := OriginalRow227TriangleData1324.coefficient101_176,
    output := OriginalRow227TriangleData1334.coefficient102_176, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_178, Icur := OriginalRow227TriangleData1324.coefficient101_177,
    output := OriginalRow227TriangleData1334.coefficient102_177, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_179, Icur := OriginalRow227TriangleData1324.coefficient101_178,
    output := OriginalRow227TriangleData1334.coefficient102_178, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_180, Icur := OriginalRow227TriangleData1324.coefficient101_179,
    output := OriginalRow227TriangleData1334.coefficient102_179, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_181, Icur := OriginalRow227TriangleData1324.coefficient101_180,
    output := OriginalRow227TriangleData1334.coefficient102_180, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_182, Icur := OriginalRow227TriangleData1324.coefficient101_181,
    output := OriginalRow227TriangleData1334.coefficient102_181, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_183, Icur := OriginalRow227TriangleData1324.coefficient101_182,
    output := OriginalRow227TriangleData1334.coefficient102_182, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_184, Icur := OriginalRow227TriangleData1324.coefficient101_183,
    output := OriginalRow227TriangleData1334.coefficient102_183, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_185, Icur := OriginalRow227TriangleData1324.coefficient101_184,
    output := OriginalRow227TriangleData1334.coefficient102_184, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_186, Icur := OriginalRow227TriangleData1324.coefficient101_185,
    output := OriginalRow227TriangleData1334.coefficient102_185, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_187, Icur := OriginalRow227TriangleData1324.coefficient101_186,
    output := OriginalRow227TriangleData1334.coefficient102_186, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_188, Icur := OriginalRow227TriangleData1324.coefficient101_187,
    output := OriginalRow227TriangleData1334.coefficient102_187, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_189, Icur := OriginalRow227TriangleData1324.coefficient101_188,
    output := OriginalRow227TriangleData1334.coefficient102_188, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_190, Icur := OriginalRow227TriangleData1324.coefficient101_189,
    output := OriginalRow227TriangleData1334.coefficient102_189, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_191, Icur := OriginalRow227TriangleData1324.coefficient101_190,
    output := OriginalRow227TriangleData1334.coefficient102_190, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_192, Icur := OriginalRow227TriangleData1324.coefficient101_191,
    output := OriginalRow227TriangleData1334.coefficient102_191, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_193, Icur := OriginalRow227TriangleData1324.coefficient101_192,
    output := OriginalRow227TriangleData1334.coefficient102_192, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_194, Icur := OriginalRow227TriangleData1324.coefficient101_193,
    output := OriginalRow227TriangleData1334.coefficient102_193, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1324.coefficient101_195, Icur := OriginalRow227TriangleData1324.coefficient101_194,
    output := OriginalRow227TriangleData1334.coefficient102_194, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1325.coefficient101_196, Icur := OriginalRow227TriangleData1324.coefficient101_195,
    output := OriginalRow227TriangleData1334.coefficient102_195, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1325.coefficient101_197, Icur := OriginalRow227TriangleData1325.coefficient101_196,
    output := OriginalRow227TriangleData1334.coefficient102_196, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1318

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1318.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
