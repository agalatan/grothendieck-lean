import Grothe.UpperChaos.OriginalRow227TriangleData1800
import Grothe.UpperChaos.OriginalRow227TriangleData1801
import Grothe.UpperChaos.OriginalRow227TriangleData1806
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1790
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_161, Icur := OriginalRow227TriangleData1800.coefficient160_160,
    output := OriginalRow227TriangleData1806.coefficient161_160, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_162, Icur := OriginalRow227TriangleData1800.coefficient160_161,
    output := OriginalRow227TriangleData1806.coefficient161_161, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_163, Icur := OriginalRow227TriangleData1800.coefficient160_162,
    output := OriginalRow227TriangleData1806.coefficient161_162, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_164, Icur := OriginalRow227TriangleData1800.coefficient160_163,
    output := OriginalRow227TriangleData1806.coefficient161_163, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_165, Icur := OriginalRow227TriangleData1800.coefficient160_164,
    output := OriginalRow227TriangleData1806.coefficient161_164, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_166, Icur := OriginalRow227TriangleData1800.coefficient160_165,
    output := OriginalRow227TriangleData1806.coefficient161_165, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_167, Icur := OriginalRow227TriangleData1800.coefficient160_166,
    output := OriginalRow227TriangleData1806.coefficient161_166, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_168, Icur := OriginalRow227TriangleData1800.coefficient160_167,
    output := OriginalRow227TriangleData1806.coefficient161_167, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_169, Icur := OriginalRow227TriangleData1800.coefficient160_168,
    output := OriginalRow227TriangleData1806.coefficient161_168, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_170, Icur := OriginalRow227TriangleData1800.coefficient160_169,
    output := OriginalRow227TriangleData1806.coefficient161_169, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_171, Icur := OriginalRow227TriangleData1800.coefficient160_170,
    output := OriginalRow227TriangleData1806.coefficient161_170, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_172, Icur := OriginalRow227TriangleData1800.coefficient160_171,
    output := OriginalRow227TriangleData1806.coefficient161_171, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_173, Icur := OriginalRow227TriangleData1800.coefficient160_172,
    output := OriginalRow227TriangleData1806.coefficient161_172, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_174, Icur := OriginalRow227TriangleData1800.coefficient160_173,
    output := OriginalRow227TriangleData1806.coefficient161_173, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_175, Icur := OriginalRow227TriangleData1800.coefficient160_174,
    output := OriginalRow227TriangleData1806.coefficient161_174, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_176, Icur := OriginalRow227TriangleData1800.coefficient160_175,
    output := OriginalRow227TriangleData1806.coefficient161_175, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_177, Icur := OriginalRow227TriangleData1800.coefficient160_176,
    output := OriginalRow227TriangleData1806.coefficient161_176, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_178, Icur := OriginalRow227TriangleData1800.coefficient160_177,
    output := OriginalRow227TriangleData1806.coefficient161_177, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_179, Icur := OriginalRow227TriangleData1800.coefficient160_178,
    output := OriginalRow227TriangleData1806.coefficient161_178, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_180, Icur := OriginalRow227TriangleData1800.coefficient160_179,
    output := OriginalRow227TriangleData1806.coefficient161_179, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_181, Icur := OriginalRow227TriangleData1800.coefficient160_180,
    output := OriginalRow227TriangleData1806.coefficient161_180, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_182, Icur := OriginalRow227TriangleData1800.coefficient160_181,
    output := OriginalRow227TriangleData1806.coefficient161_181, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_183, Icur := OriginalRow227TriangleData1800.coefficient160_182,
    output := OriginalRow227TriangleData1806.coefficient161_182, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_184, Icur := OriginalRow227TriangleData1800.coefficient160_183,
    output := OriginalRow227TriangleData1806.coefficient161_183, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_185, Icur := OriginalRow227TriangleData1800.coefficient160_184,
    output := OriginalRow227TriangleData1806.coefficient161_184, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_186, Icur := OriginalRow227TriangleData1800.coefficient160_185,
    output := OriginalRow227TriangleData1806.coefficient161_185, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_187, Icur := OriginalRow227TriangleData1800.coefficient160_186,
    output := OriginalRow227TriangleData1806.coefficient161_186, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_188, Icur := OriginalRow227TriangleData1800.coefficient160_187,
    output := OriginalRow227TriangleData1806.coefficient161_187, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_189, Icur := OriginalRow227TriangleData1800.coefficient160_188,
    output := OriginalRow227TriangleData1806.coefficient161_188, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1800.coefficient160_190, Icur := OriginalRow227TriangleData1800.coefficient160_189,
    output := OriginalRow227TriangleData1806.coefficient161_189, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1801.coefficient160_191, Icur := OriginalRow227TriangleData1800.coefficient160_190,
    output := OriginalRow227TriangleData1806.coefficient161_190, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1801.coefficient160_192, Icur := OriginalRow227TriangleData1801.coefficient160_191,
    output := OriginalRow227TriangleData1806.coefficient161_191, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1790

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1790.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
