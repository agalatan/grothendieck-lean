import Grothe.UpperChaos.OriginalRow227TriangleData0891
import Grothe.UpperChaos.OriginalRow227TriangleData0892
import Grothe.UpperChaos.OriginalRow227TriangleData0903
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0887
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_159, Icur := OriginalRow227TriangleData0891.coefficient62_158,
    output := OriginalRow227TriangleData0903.coefficient63_158, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_160, Icur := OriginalRow227TriangleData0891.coefficient62_159,
    output := OriginalRow227TriangleData0903.coefficient63_159, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_161, Icur := OriginalRow227TriangleData0891.coefficient62_160,
    output := OriginalRow227TriangleData0903.coefficient63_160, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_162, Icur := OriginalRow227TriangleData0891.coefficient62_161,
    output := OriginalRow227TriangleData0903.coefficient63_161, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_163, Icur := OriginalRow227TriangleData0891.coefficient62_162,
    output := OriginalRow227TriangleData0903.coefficient63_162, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_164, Icur := OriginalRow227TriangleData0891.coefficient62_163,
    output := OriginalRow227TriangleData0903.coefficient63_163, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_165, Icur := OriginalRow227TriangleData0891.coefficient62_164,
    output := OriginalRow227TriangleData0903.coefficient63_164, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_166, Icur := OriginalRow227TriangleData0891.coefficient62_165,
    output := OriginalRow227TriangleData0903.coefficient63_165, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_167, Icur := OriginalRow227TriangleData0891.coefficient62_166,
    output := OriginalRow227TriangleData0903.coefficient63_166, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_168, Icur := OriginalRow227TriangleData0891.coefficient62_167,
    output := OriginalRow227TriangleData0903.coefficient63_167, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_169, Icur := OriginalRow227TriangleData0891.coefficient62_168,
    output := OriginalRow227TriangleData0903.coefficient63_168, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_170, Icur := OriginalRow227TriangleData0891.coefficient62_169,
    output := OriginalRow227TriangleData0903.coefficient63_169, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_171, Icur := OriginalRow227TriangleData0891.coefficient62_170,
    output := OriginalRow227TriangleData0903.coefficient63_170, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_172, Icur := OriginalRow227TriangleData0891.coefficient62_171,
    output := OriginalRow227TriangleData0903.coefficient63_171, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_173, Icur := OriginalRow227TriangleData0891.coefficient62_172,
    output := OriginalRow227TriangleData0903.coefficient63_172, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_174, Icur := OriginalRow227TriangleData0891.coefficient62_173,
    output := OriginalRow227TriangleData0903.coefficient63_173, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_175, Icur := OriginalRow227TriangleData0891.coefficient62_174,
    output := OriginalRow227TriangleData0903.coefficient63_174, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_176, Icur := OriginalRow227TriangleData0891.coefficient62_175,
    output := OriginalRow227TriangleData0903.coefficient63_175, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_177, Icur := OriginalRow227TriangleData0891.coefficient62_176,
    output := OriginalRow227TriangleData0903.coefficient63_176, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_178, Icur := OriginalRow227TriangleData0891.coefficient62_177,
    output := OriginalRow227TriangleData0903.coefficient63_177, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_179, Icur := OriginalRow227TriangleData0891.coefficient62_178,
    output := OriginalRow227TriangleData0903.coefficient63_178, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_180, Icur := OriginalRow227TriangleData0891.coefficient62_179,
    output := OriginalRow227TriangleData0903.coefficient63_179, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_181, Icur := OriginalRow227TriangleData0891.coefficient62_180,
    output := OriginalRow227TriangleData0903.coefficient63_180, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_182, Icur := OriginalRow227TriangleData0891.coefficient62_181,
    output := OriginalRow227TriangleData0903.coefficient63_181, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_183, Icur := OriginalRow227TriangleData0891.coefficient62_182,
    output := OriginalRow227TriangleData0903.coefficient63_182, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_184, Icur := OriginalRow227TriangleData0891.coefficient62_183,
    output := OriginalRow227TriangleData0903.coefficient63_183, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_185, Icur := OriginalRow227TriangleData0891.coefficient62_184,
    output := OriginalRow227TriangleData0903.coefficient63_184, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_186, Icur := OriginalRow227TriangleData0891.coefficient62_185,
    output := OriginalRow227TriangleData0903.coefficient63_185, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_187, Icur := OriginalRow227TriangleData0891.coefficient62_186,
    output := OriginalRow227TriangleData0903.coefficient63_186, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0891.coefficient62_188, Icur := OriginalRow227TriangleData0891.coefficient62_187,
    output := OriginalRow227TriangleData0903.coefficient63_187, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0892.coefficient62_189, Icur := OriginalRow227TriangleData0891.coefficient62_188,
    output := OriginalRow227TriangleData0903.coefficient63_188, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0892.coefficient62_190, Icur := OriginalRow227TriangleData0892.coefficient62_189,
    output := OriginalRow227TriangleData0903.coefficient63_189, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0887

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0887.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
