import Grothe.UpperChaos.OriginalRow227TriangleData1569
import Grothe.UpperChaos.OriginalRow227TriangleData1570
import Grothe.UpperChaos.OriginalRow227TriangleData1577
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1561
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_161, Icur := OriginalRow227TriangleData1569.coefficient128_160,
    output := OriginalRow227TriangleData1577.coefficient129_160, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_162, Icur := OriginalRow227TriangleData1569.coefficient128_161,
    output := OriginalRow227TriangleData1577.coefficient129_161, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_163, Icur := OriginalRow227TriangleData1569.coefficient128_162,
    output := OriginalRow227TriangleData1577.coefficient129_162, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_164, Icur := OriginalRow227TriangleData1569.coefficient128_163,
    output := OriginalRow227TriangleData1577.coefficient129_163, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_165, Icur := OriginalRow227TriangleData1569.coefficient128_164,
    output := OriginalRow227TriangleData1577.coefficient129_164, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_166, Icur := OriginalRow227TriangleData1569.coefficient128_165,
    output := OriginalRow227TriangleData1577.coefficient129_165, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_167, Icur := OriginalRow227TriangleData1569.coefficient128_166,
    output := OriginalRow227TriangleData1577.coefficient129_166, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_168, Icur := OriginalRow227TriangleData1569.coefficient128_167,
    output := OriginalRow227TriangleData1577.coefficient129_167, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_169, Icur := OriginalRow227TriangleData1569.coefficient128_168,
    output := OriginalRow227TriangleData1577.coefficient129_168, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_170, Icur := OriginalRow227TriangleData1569.coefficient128_169,
    output := OriginalRow227TriangleData1577.coefficient129_169, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_171, Icur := OriginalRow227TriangleData1569.coefficient128_170,
    output := OriginalRow227TriangleData1577.coefficient129_170, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_172, Icur := OriginalRow227TriangleData1569.coefficient128_171,
    output := OriginalRow227TriangleData1577.coefficient129_171, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_173, Icur := OriginalRow227TriangleData1569.coefficient128_172,
    output := OriginalRow227TriangleData1577.coefficient129_172, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_174, Icur := OriginalRow227TriangleData1569.coefficient128_173,
    output := OriginalRow227TriangleData1577.coefficient129_173, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_175, Icur := OriginalRow227TriangleData1569.coefficient128_174,
    output := OriginalRow227TriangleData1577.coefficient129_174, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_176, Icur := OriginalRow227TriangleData1569.coefficient128_175,
    output := OriginalRow227TriangleData1577.coefficient129_175, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_177, Icur := OriginalRow227TriangleData1569.coefficient128_176,
    output := OriginalRow227TriangleData1577.coefficient129_176, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_178, Icur := OriginalRow227TriangleData1569.coefficient128_177,
    output := OriginalRow227TriangleData1577.coefficient129_177, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_179, Icur := OriginalRow227TriangleData1569.coefficient128_178,
    output := OriginalRow227TriangleData1577.coefficient129_178, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_180, Icur := OriginalRow227TriangleData1569.coefficient128_179,
    output := OriginalRow227TriangleData1577.coefficient129_179, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_181, Icur := OriginalRow227TriangleData1569.coefficient128_180,
    output := OriginalRow227TriangleData1577.coefficient129_180, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_182, Icur := OriginalRow227TriangleData1569.coefficient128_181,
    output := OriginalRow227TriangleData1577.coefficient129_181, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_183, Icur := OriginalRow227TriangleData1569.coefficient128_182,
    output := OriginalRow227TriangleData1577.coefficient129_182, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_184, Icur := OriginalRow227TriangleData1569.coefficient128_183,
    output := OriginalRow227TriangleData1577.coefficient129_183, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_185, Icur := OriginalRow227TriangleData1569.coefficient128_184,
    output := OriginalRow227TriangleData1577.coefficient129_184, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_186, Icur := OriginalRow227TriangleData1569.coefficient128_185,
    output := OriginalRow227TriangleData1577.coefficient129_185, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_187, Icur := OriginalRow227TriangleData1569.coefficient128_186,
    output := OriginalRow227TriangleData1577.coefficient129_186, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_188, Icur := OriginalRow227TriangleData1569.coefficient128_187,
    output := OriginalRow227TriangleData1577.coefficient129_187, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_189, Icur := OriginalRow227TriangleData1569.coefficient128_188,
    output := OriginalRow227TriangleData1577.coefficient129_188, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1569.coefficient128_190, Icur := OriginalRow227TriangleData1569.coefficient128_189,
    output := OriginalRow227TriangleData1577.coefficient129_189, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1570.coefficient128_191, Icur := OriginalRow227TriangleData1569.coefficient128_190,
    output := OriginalRow227TriangleData1577.coefficient129_190, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1570.coefficient128_192, Icur := OriginalRow227TriangleData1570.coefficient128_191,
    output := OriginalRow227TriangleData1577.coefficient129_191, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1561

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1561.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
