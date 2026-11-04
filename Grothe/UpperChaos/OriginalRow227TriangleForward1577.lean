import Grothe.UpperChaos.OriginalRow227TriangleData1585
import Grothe.UpperChaos.OriginalRow227TriangleData1586
import Grothe.UpperChaos.OriginalRow227TriangleData1593
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1577
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_163, Icur := OriginalRow227TriangleData1585.coefficient130_162,
    output := OriginalRow227TriangleData1593.coefficient131_162, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_164, Icur := OriginalRow227TriangleData1585.coefficient130_163,
    output := OriginalRow227TriangleData1593.coefficient131_163, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_165, Icur := OriginalRow227TriangleData1585.coefficient130_164,
    output := OriginalRow227TriangleData1593.coefficient131_164, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_166, Icur := OriginalRow227TriangleData1585.coefficient130_165,
    output := OriginalRow227TriangleData1593.coefficient131_165, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_167, Icur := OriginalRow227TriangleData1585.coefficient130_166,
    output := OriginalRow227TriangleData1593.coefficient131_166, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_168, Icur := OriginalRow227TriangleData1585.coefficient130_167,
    output := OriginalRow227TriangleData1593.coefficient131_167, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_169, Icur := OriginalRow227TriangleData1585.coefficient130_168,
    output := OriginalRow227TriangleData1593.coefficient131_168, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_170, Icur := OriginalRow227TriangleData1585.coefficient130_169,
    output := OriginalRow227TriangleData1593.coefficient131_169, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_171, Icur := OriginalRow227TriangleData1585.coefficient130_170,
    output := OriginalRow227TriangleData1593.coefficient131_170, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_172, Icur := OriginalRow227TriangleData1585.coefficient130_171,
    output := OriginalRow227TriangleData1593.coefficient131_171, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_173, Icur := OriginalRow227TriangleData1585.coefficient130_172,
    output := OriginalRow227TriangleData1593.coefficient131_172, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_174, Icur := OriginalRow227TriangleData1585.coefficient130_173,
    output := OriginalRow227TriangleData1593.coefficient131_173, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_175, Icur := OriginalRow227TriangleData1585.coefficient130_174,
    output := OriginalRow227TriangleData1593.coefficient131_174, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_176, Icur := OriginalRow227TriangleData1585.coefficient130_175,
    output := OriginalRow227TriangleData1593.coefficient131_175, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_177, Icur := OriginalRow227TriangleData1585.coefficient130_176,
    output := OriginalRow227TriangleData1593.coefficient131_176, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_178, Icur := OriginalRow227TriangleData1585.coefficient130_177,
    output := OriginalRow227TriangleData1593.coefficient131_177, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_179, Icur := OriginalRow227TriangleData1585.coefficient130_178,
    output := OriginalRow227TriangleData1593.coefficient131_178, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_180, Icur := OriginalRow227TriangleData1585.coefficient130_179,
    output := OriginalRow227TriangleData1593.coefficient131_179, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_181, Icur := OriginalRow227TriangleData1585.coefficient130_180,
    output := OriginalRow227TriangleData1593.coefficient131_180, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_182, Icur := OriginalRow227TriangleData1585.coefficient130_181,
    output := OriginalRow227TriangleData1593.coefficient131_181, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_183, Icur := OriginalRow227TriangleData1585.coefficient130_182,
    output := OriginalRow227TriangleData1593.coefficient131_182, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_184, Icur := OriginalRow227TriangleData1585.coefficient130_183,
    output := OriginalRow227TriangleData1593.coefficient131_183, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_185, Icur := OriginalRow227TriangleData1585.coefficient130_184,
    output := OriginalRow227TriangleData1593.coefficient131_184, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_186, Icur := OriginalRow227TriangleData1585.coefficient130_185,
    output := OriginalRow227TriangleData1593.coefficient131_185, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_187, Icur := OriginalRow227TriangleData1585.coefficient130_186,
    output := OriginalRow227TriangleData1593.coefficient131_186, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_188, Icur := OriginalRow227TriangleData1585.coefficient130_187,
    output := OriginalRow227TriangleData1593.coefficient131_187, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_189, Icur := OriginalRow227TriangleData1585.coefficient130_188,
    output := OriginalRow227TriangleData1593.coefficient131_188, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_190, Icur := OriginalRow227TriangleData1585.coefficient130_189,
    output := OriginalRow227TriangleData1593.coefficient131_189, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_191, Icur := OriginalRow227TriangleData1585.coefficient130_190,
    output := OriginalRow227TriangleData1593.coefficient131_190, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1585.coefficient130_192, Icur := OriginalRow227TriangleData1585.coefficient130_191,
    output := OriginalRow227TriangleData1593.coefficient131_191, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1586.coefficient130_193, Icur := OriginalRow227TriangleData1585.coefficient130_192,
    output := OriginalRow227TriangleData1593.coefficient131_192, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1586.coefficient130_194, Icur := OriginalRow227TriangleData1586.coefficient130_193,
    output := OriginalRow227TriangleData1593.coefficient131_193, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1577

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1577.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
