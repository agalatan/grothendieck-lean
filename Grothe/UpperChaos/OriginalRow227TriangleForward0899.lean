import Grothe.UpperChaos.OriginalRow227TriangleData0903
import Grothe.UpperChaos.OriginalRow227TriangleData0904
import Grothe.UpperChaos.OriginalRow227TriangleData0915
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0899
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_160, Icur := OriginalRow227TriangleData0903.coefficient63_159,
    output := OriginalRow227TriangleData0915.coefficient64_159, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_161, Icur := OriginalRow227TriangleData0903.coefficient63_160,
    output := OriginalRow227TriangleData0915.coefficient64_160, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_162, Icur := OriginalRow227TriangleData0903.coefficient63_161,
    output := OriginalRow227TriangleData0915.coefficient64_161, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_163, Icur := OriginalRow227TriangleData0903.coefficient63_162,
    output := OriginalRow227TriangleData0915.coefficient64_162, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_164, Icur := OriginalRow227TriangleData0903.coefficient63_163,
    output := OriginalRow227TriangleData0915.coefficient64_163, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_165, Icur := OriginalRow227TriangleData0903.coefficient63_164,
    output := OriginalRow227TriangleData0915.coefficient64_164, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_166, Icur := OriginalRow227TriangleData0903.coefficient63_165,
    output := OriginalRow227TriangleData0915.coefficient64_165, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_167, Icur := OriginalRow227TriangleData0903.coefficient63_166,
    output := OriginalRow227TriangleData0915.coefficient64_166, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_168, Icur := OriginalRow227TriangleData0903.coefficient63_167,
    output := OriginalRow227TriangleData0915.coefficient64_167, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_169, Icur := OriginalRow227TriangleData0903.coefficient63_168,
    output := OriginalRow227TriangleData0915.coefficient64_168, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_170, Icur := OriginalRow227TriangleData0903.coefficient63_169,
    output := OriginalRow227TriangleData0915.coefficient64_169, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_171, Icur := OriginalRow227TriangleData0903.coefficient63_170,
    output := OriginalRow227TriangleData0915.coefficient64_170, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_172, Icur := OriginalRow227TriangleData0903.coefficient63_171,
    output := OriginalRow227TriangleData0915.coefficient64_171, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_173, Icur := OriginalRow227TriangleData0903.coefficient63_172,
    output := OriginalRow227TriangleData0915.coefficient64_172, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_174, Icur := OriginalRow227TriangleData0903.coefficient63_173,
    output := OriginalRow227TriangleData0915.coefficient64_173, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_175, Icur := OriginalRow227TriangleData0903.coefficient63_174,
    output := OriginalRow227TriangleData0915.coefficient64_174, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_176, Icur := OriginalRow227TriangleData0903.coefficient63_175,
    output := OriginalRow227TriangleData0915.coefficient64_175, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_177, Icur := OriginalRow227TriangleData0903.coefficient63_176,
    output := OriginalRow227TriangleData0915.coefficient64_176, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_178, Icur := OriginalRow227TriangleData0903.coefficient63_177,
    output := OriginalRow227TriangleData0915.coefficient64_177, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_179, Icur := OriginalRow227TriangleData0903.coefficient63_178,
    output := OriginalRow227TriangleData0915.coefficient64_178, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_180, Icur := OriginalRow227TriangleData0903.coefficient63_179,
    output := OriginalRow227TriangleData0915.coefficient64_179, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_181, Icur := OriginalRow227TriangleData0903.coefficient63_180,
    output := OriginalRow227TriangleData0915.coefficient64_180, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_182, Icur := OriginalRow227TriangleData0903.coefficient63_181,
    output := OriginalRow227TriangleData0915.coefficient64_181, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_183, Icur := OriginalRow227TriangleData0903.coefficient63_182,
    output := OriginalRow227TriangleData0915.coefficient64_182, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_184, Icur := OriginalRow227TriangleData0903.coefficient63_183,
    output := OriginalRow227TriangleData0915.coefficient64_183, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_185, Icur := OriginalRow227TriangleData0903.coefficient63_184,
    output := OriginalRow227TriangleData0915.coefficient64_184, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_186, Icur := OriginalRow227TriangleData0903.coefficient63_185,
    output := OriginalRow227TriangleData0915.coefficient64_185, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_187, Icur := OriginalRow227TriangleData0903.coefficient63_186,
    output := OriginalRow227TriangleData0915.coefficient64_186, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_188, Icur := OriginalRow227TriangleData0903.coefficient63_187,
    output := OriginalRow227TriangleData0915.coefficient64_187, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0903.coefficient63_189, Icur := OriginalRow227TriangleData0903.coefficient63_188,
    output := OriginalRow227TriangleData0915.coefficient64_188, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_190, Icur := OriginalRow227TriangleData0903.coefficient63_189,
    output := OriginalRow227TriangleData0915.coefficient64_189, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0904.coefficient63_191, Icur := OriginalRow227TriangleData0904.coefficient63_190,
    output := OriginalRow227TriangleData0915.coefficient64_190, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0899

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0899.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
