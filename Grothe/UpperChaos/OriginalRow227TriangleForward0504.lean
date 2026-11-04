import Grothe.UpperChaos.OriginalRow227TriangleData0506
import Grothe.UpperChaos.OriginalRow227TriangleData0507
import Grothe.UpperChaos.OriginalRow227TriangleData0520
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0504
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_162, Icur := OriginalRow227TriangleData0506.coefficient33_161,
    output := OriginalRow227TriangleData0520.coefficient34_161, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_163, Icur := OriginalRow227TriangleData0506.coefficient33_162,
    output := OriginalRow227TriangleData0520.coefficient34_162, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_164, Icur := OriginalRow227TriangleData0506.coefficient33_163,
    output := OriginalRow227TriangleData0520.coefficient34_163, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_165, Icur := OriginalRow227TriangleData0506.coefficient33_164,
    output := OriginalRow227TriangleData0520.coefficient34_164, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_166, Icur := OriginalRow227TriangleData0506.coefficient33_165,
    output := OriginalRow227TriangleData0520.coefficient34_165, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_167, Icur := OriginalRow227TriangleData0506.coefficient33_166,
    output := OriginalRow227TriangleData0520.coefficient34_166, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_168, Icur := OriginalRow227TriangleData0506.coefficient33_167,
    output := OriginalRow227TriangleData0520.coefficient34_167, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_169, Icur := OriginalRow227TriangleData0506.coefficient33_168,
    output := OriginalRow227TriangleData0520.coefficient34_168, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_170, Icur := OriginalRow227TriangleData0506.coefficient33_169,
    output := OriginalRow227TriangleData0520.coefficient34_169, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_171, Icur := OriginalRow227TriangleData0506.coefficient33_170,
    output := OriginalRow227TriangleData0520.coefficient34_170, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_172, Icur := OriginalRow227TriangleData0506.coefficient33_171,
    output := OriginalRow227TriangleData0520.coefficient34_171, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_173, Icur := OriginalRow227TriangleData0506.coefficient33_172,
    output := OriginalRow227TriangleData0520.coefficient34_172, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_174, Icur := OriginalRow227TriangleData0506.coefficient33_173,
    output := OriginalRow227TriangleData0520.coefficient34_173, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_175, Icur := OriginalRow227TriangleData0506.coefficient33_174,
    output := OriginalRow227TriangleData0520.coefficient34_174, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_176, Icur := OriginalRow227TriangleData0506.coefficient33_175,
    output := OriginalRow227TriangleData0520.coefficient34_175, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_177, Icur := OriginalRow227TriangleData0506.coefficient33_176,
    output := OriginalRow227TriangleData0520.coefficient34_176, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_178, Icur := OriginalRow227TriangleData0506.coefficient33_177,
    output := OriginalRow227TriangleData0520.coefficient34_177, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_179, Icur := OriginalRow227TriangleData0506.coefficient33_178,
    output := OriginalRow227TriangleData0520.coefficient34_178, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_180, Icur := OriginalRow227TriangleData0506.coefficient33_179,
    output := OriginalRow227TriangleData0520.coefficient34_179, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_181, Icur := OriginalRow227TriangleData0506.coefficient33_180,
    output := OriginalRow227TriangleData0520.coefficient34_180, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_182, Icur := OriginalRow227TriangleData0506.coefficient33_181,
    output := OriginalRow227TriangleData0520.coefficient34_181, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_183, Icur := OriginalRow227TriangleData0506.coefficient33_182,
    output := OriginalRow227TriangleData0520.coefficient34_182, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_184, Icur := OriginalRow227TriangleData0506.coefficient33_183,
    output := OriginalRow227TriangleData0520.coefficient34_183, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_185, Icur := OriginalRow227TriangleData0506.coefficient33_184,
    output := OriginalRow227TriangleData0520.coefficient34_184, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_186, Icur := OriginalRow227TriangleData0506.coefficient33_185,
    output := OriginalRow227TriangleData0520.coefficient34_185, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_187, Icur := OriginalRow227TriangleData0506.coefficient33_186,
    output := OriginalRow227TriangleData0520.coefficient34_186, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_188, Icur := OriginalRow227TriangleData0506.coefficient33_187,
    output := OriginalRow227TriangleData0520.coefficient34_187, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_189, Icur := OriginalRow227TriangleData0506.coefficient33_188,
    output := OriginalRow227TriangleData0520.coefficient34_188, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_190, Icur := OriginalRow227TriangleData0506.coefficient33_189,
    output := OriginalRow227TriangleData0520.coefficient34_189, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0506.coefficient33_191, Icur := OriginalRow227TriangleData0506.coefficient33_190,
    output := OriginalRow227TriangleData0520.coefficient34_190, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0507.coefficient33_192, Icur := OriginalRow227TriangleData0506.coefficient33_191,
    output := OriginalRow227TriangleData0520.coefficient34_191, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0507.coefficient33_193, Icur := OriginalRow227TriangleData0507.coefficient33_192,
    output := OriginalRow227TriangleData0520.coefficient34_192, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0504

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0504.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
