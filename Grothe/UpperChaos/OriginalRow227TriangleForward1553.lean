import Grothe.UpperChaos.OriginalRow227TriangleData1561
import Grothe.UpperChaos.OriginalRow227TriangleData1562
import Grothe.UpperChaos.OriginalRow227TriangleData1569
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1553
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_160, Icur := OriginalRow227TriangleData1561.coefficient127_159,
    output := OriginalRow227TriangleData1569.coefficient128_159, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_161, Icur := OriginalRow227TriangleData1561.coefficient127_160,
    output := OriginalRow227TriangleData1569.coefficient128_160, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_162, Icur := OriginalRow227TriangleData1561.coefficient127_161,
    output := OriginalRow227TriangleData1569.coefficient128_161, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_163, Icur := OriginalRow227TriangleData1561.coefficient127_162,
    output := OriginalRow227TriangleData1569.coefficient128_162, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_164, Icur := OriginalRow227TriangleData1561.coefficient127_163,
    output := OriginalRow227TriangleData1569.coefficient128_163, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_165, Icur := OriginalRow227TriangleData1561.coefficient127_164,
    output := OriginalRow227TriangleData1569.coefficient128_164, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_166, Icur := OriginalRow227TriangleData1561.coefficient127_165,
    output := OriginalRow227TriangleData1569.coefficient128_165, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_167, Icur := OriginalRow227TriangleData1561.coefficient127_166,
    output := OriginalRow227TriangleData1569.coefficient128_166, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_168, Icur := OriginalRow227TriangleData1561.coefficient127_167,
    output := OriginalRow227TriangleData1569.coefficient128_167, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_169, Icur := OriginalRow227TriangleData1561.coefficient127_168,
    output := OriginalRow227TriangleData1569.coefficient128_168, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_170, Icur := OriginalRow227TriangleData1561.coefficient127_169,
    output := OriginalRow227TriangleData1569.coefficient128_169, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_171, Icur := OriginalRow227TriangleData1561.coefficient127_170,
    output := OriginalRow227TriangleData1569.coefficient128_170, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_172, Icur := OriginalRow227TriangleData1561.coefficient127_171,
    output := OriginalRow227TriangleData1569.coefficient128_171, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_173, Icur := OriginalRow227TriangleData1561.coefficient127_172,
    output := OriginalRow227TriangleData1569.coefficient128_172, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_174, Icur := OriginalRow227TriangleData1561.coefficient127_173,
    output := OriginalRow227TriangleData1569.coefficient128_173, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_175, Icur := OriginalRow227TriangleData1561.coefficient127_174,
    output := OriginalRow227TriangleData1569.coefficient128_174, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_176, Icur := OriginalRow227TriangleData1561.coefficient127_175,
    output := OriginalRow227TriangleData1569.coefficient128_175, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_177, Icur := OriginalRow227TriangleData1561.coefficient127_176,
    output := OriginalRow227TriangleData1569.coefficient128_176, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_178, Icur := OriginalRow227TriangleData1561.coefficient127_177,
    output := OriginalRow227TriangleData1569.coefficient128_177, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_179, Icur := OriginalRow227TriangleData1561.coefficient127_178,
    output := OriginalRow227TriangleData1569.coefficient128_178, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_180, Icur := OriginalRow227TriangleData1561.coefficient127_179,
    output := OriginalRow227TriangleData1569.coefficient128_179, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_181, Icur := OriginalRow227TriangleData1561.coefficient127_180,
    output := OriginalRow227TriangleData1569.coefficient128_180, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_182, Icur := OriginalRow227TriangleData1561.coefficient127_181,
    output := OriginalRow227TriangleData1569.coefficient128_181, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_183, Icur := OriginalRow227TriangleData1561.coefficient127_182,
    output := OriginalRow227TriangleData1569.coefficient128_182, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_184, Icur := OriginalRow227TriangleData1561.coefficient127_183,
    output := OriginalRow227TriangleData1569.coefficient128_183, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_185, Icur := OriginalRow227TriangleData1561.coefficient127_184,
    output := OriginalRow227TriangleData1569.coefficient128_184, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_186, Icur := OriginalRow227TriangleData1561.coefficient127_185,
    output := OriginalRow227TriangleData1569.coefficient128_185, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_187, Icur := OriginalRow227TriangleData1561.coefficient127_186,
    output := OriginalRow227TriangleData1569.coefficient128_186, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_188, Icur := OriginalRow227TriangleData1561.coefficient127_187,
    output := OriginalRow227TriangleData1569.coefficient128_187, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1561.coefficient127_189, Icur := OriginalRow227TriangleData1561.coefficient127_188,
    output := OriginalRow227TriangleData1569.coefficient128_188, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1562.coefficient127_190, Icur := OriginalRow227TriangleData1561.coefficient127_189,
    output := OriginalRow227TriangleData1569.coefficient128_189, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1562.coefficient127_191, Icur := OriginalRow227TriangleData1562.coefficient127_190,
    output := OriginalRow227TriangleData1569.coefficient128_190, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1553

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1553.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
