import Grothe.UpperChaos.OriginalRow227TriangleData0854
import Grothe.UpperChaos.OriginalRow227TriangleData0855
import Grothe.UpperChaos.OriginalRow227TriangleData0867
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0851
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_156, Icur := OriginalRow227TriangleData0854.coefficient59_155,
    output := OriginalRow227TriangleData0867.coefficient60_155, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_157, Icur := OriginalRow227TriangleData0854.coefficient59_156,
    output := OriginalRow227TriangleData0867.coefficient60_156, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_158, Icur := OriginalRow227TriangleData0854.coefficient59_157,
    output := OriginalRow227TriangleData0867.coefficient60_157, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_159, Icur := OriginalRow227TriangleData0854.coefficient59_158,
    output := OriginalRow227TriangleData0867.coefficient60_158, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_160, Icur := OriginalRow227TriangleData0854.coefficient59_159,
    output := OriginalRow227TriangleData0867.coefficient60_159, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_161, Icur := OriginalRow227TriangleData0854.coefficient59_160,
    output := OriginalRow227TriangleData0867.coefficient60_160, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_162, Icur := OriginalRow227TriangleData0854.coefficient59_161,
    output := OriginalRow227TriangleData0867.coefficient60_161, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_163, Icur := OriginalRow227TriangleData0854.coefficient59_162,
    output := OriginalRow227TriangleData0867.coefficient60_162, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_164, Icur := OriginalRow227TriangleData0854.coefficient59_163,
    output := OriginalRow227TriangleData0867.coefficient60_163, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_165, Icur := OriginalRow227TriangleData0854.coefficient59_164,
    output := OriginalRow227TriangleData0867.coefficient60_164, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_166, Icur := OriginalRow227TriangleData0854.coefficient59_165,
    output := OriginalRow227TriangleData0867.coefficient60_165, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_167, Icur := OriginalRow227TriangleData0854.coefficient59_166,
    output := OriginalRow227TriangleData0867.coefficient60_166, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_168, Icur := OriginalRow227TriangleData0854.coefficient59_167,
    output := OriginalRow227TriangleData0867.coefficient60_167, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_169, Icur := OriginalRow227TriangleData0854.coefficient59_168,
    output := OriginalRow227TriangleData0867.coefficient60_168, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_170, Icur := OriginalRow227TriangleData0854.coefficient59_169,
    output := OriginalRow227TriangleData0867.coefficient60_169, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_171, Icur := OriginalRow227TriangleData0854.coefficient59_170,
    output := OriginalRow227TriangleData0867.coefficient60_170, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_172, Icur := OriginalRow227TriangleData0854.coefficient59_171,
    output := OriginalRow227TriangleData0867.coefficient60_171, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_173, Icur := OriginalRow227TriangleData0854.coefficient59_172,
    output := OriginalRow227TriangleData0867.coefficient60_172, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_174, Icur := OriginalRow227TriangleData0854.coefficient59_173,
    output := OriginalRow227TriangleData0867.coefficient60_173, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_175, Icur := OriginalRow227TriangleData0854.coefficient59_174,
    output := OriginalRow227TriangleData0867.coefficient60_174, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_176, Icur := OriginalRow227TriangleData0854.coefficient59_175,
    output := OriginalRow227TriangleData0867.coefficient60_175, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_177, Icur := OriginalRow227TriangleData0854.coefficient59_176,
    output := OriginalRow227TriangleData0867.coefficient60_176, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_178, Icur := OriginalRow227TriangleData0854.coefficient59_177,
    output := OriginalRow227TriangleData0867.coefficient60_177, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_179, Icur := OriginalRow227TriangleData0854.coefficient59_178,
    output := OriginalRow227TriangleData0867.coefficient60_178, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_180, Icur := OriginalRow227TriangleData0854.coefficient59_179,
    output := OriginalRow227TriangleData0867.coefficient60_179, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_181, Icur := OriginalRow227TriangleData0854.coefficient59_180,
    output := OriginalRow227TriangleData0867.coefficient60_180, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_182, Icur := OriginalRow227TriangleData0854.coefficient59_181,
    output := OriginalRow227TriangleData0867.coefficient60_181, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_183, Icur := OriginalRow227TriangleData0854.coefficient59_182,
    output := OriginalRow227TriangleData0867.coefficient60_182, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_184, Icur := OriginalRow227TriangleData0854.coefficient59_183,
    output := OriginalRow227TriangleData0867.coefficient60_183, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0854.coefficient59_185, Icur := OriginalRow227TriangleData0854.coefficient59_184,
    output := OriginalRow227TriangleData0867.coefficient60_184, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_186, Icur := OriginalRow227TriangleData0854.coefficient59_185,
    output := OriginalRow227TriangleData0867.coefficient60_185, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0855.coefficient59_187, Icur := OriginalRow227TriangleData0855.coefficient59_186,
    output := OriginalRow227TriangleData0867.coefficient60_186, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0851

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0851.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
