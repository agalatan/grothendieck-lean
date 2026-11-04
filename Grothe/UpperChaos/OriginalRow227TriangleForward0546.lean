import Grothe.UpperChaos.OriginalRow227TriangleData0548
import Grothe.UpperChaos.OriginalRow227TriangleData0549
import Grothe.UpperChaos.OriginalRow227TriangleData0562
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0546
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_165, Icur := OriginalRow227TriangleData0548.coefficient36_164,
    output := OriginalRow227TriangleData0562.coefficient37_164, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_166, Icur := OriginalRow227TriangleData0548.coefficient36_165,
    output := OriginalRow227TriangleData0562.coefficient37_165, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_167, Icur := OriginalRow227TriangleData0548.coefficient36_166,
    output := OriginalRow227TriangleData0562.coefficient37_166, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_168, Icur := OriginalRow227TriangleData0548.coefficient36_167,
    output := OriginalRow227TriangleData0562.coefficient37_167, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_169, Icur := OriginalRow227TriangleData0548.coefficient36_168,
    output := OriginalRow227TriangleData0562.coefficient37_168, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_170, Icur := OriginalRow227TriangleData0548.coefficient36_169,
    output := OriginalRow227TriangleData0562.coefficient37_169, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_171, Icur := OriginalRow227TriangleData0548.coefficient36_170,
    output := OriginalRow227TriangleData0562.coefficient37_170, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_172, Icur := OriginalRow227TriangleData0548.coefficient36_171,
    output := OriginalRow227TriangleData0562.coefficient37_171, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_173, Icur := OriginalRow227TriangleData0548.coefficient36_172,
    output := OriginalRow227TriangleData0562.coefficient37_172, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_174, Icur := OriginalRow227TriangleData0548.coefficient36_173,
    output := OriginalRow227TriangleData0562.coefficient37_173, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_175, Icur := OriginalRow227TriangleData0548.coefficient36_174,
    output := OriginalRow227TriangleData0562.coefficient37_174, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_176, Icur := OriginalRow227TriangleData0548.coefficient36_175,
    output := OriginalRow227TriangleData0562.coefficient37_175, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_177, Icur := OriginalRow227TriangleData0548.coefficient36_176,
    output := OriginalRow227TriangleData0562.coefficient37_176, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_178, Icur := OriginalRow227TriangleData0548.coefficient36_177,
    output := OriginalRow227TriangleData0562.coefficient37_177, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_179, Icur := OriginalRow227TriangleData0548.coefficient36_178,
    output := OriginalRow227TriangleData0562.coefficient37_178, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_180, Icur := OriginalRow227TriangleData0548.coefficient36_179,
    output := OriginalRow227TriangleData0562.coefficient37_179, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_181, Icur := OriginalRow227TriangleData0548.coefficient36_180,
    output := OriginalRow227TriangleData0562.coefficient37_180, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_182, Icur := OriginalRow227TriangleData0548.coefficient36_181,
    output := OriginalRow227TriangleData0562.coefficient37_181, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_183, Icur := OriginalRow227TriangleData0548.coefficient36_182,
    output := OriginalRow227TriangleData0562.coefficient37_182, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_184, Icur := OriginalRow227TriangleData0548.coefficient36_183,
    output := OriginalRow227TriangleData0562.coefficient37_183, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_185, Icur := OriginalRow227TriangleData0548.coefficient36_184,
    output := OriginalRow227TriangleData0562.coefficient37_184, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_186, Icur := OriginalRow227TriangleData0548.coefficient36_185,
    output := OriginalRow227TriangleData0562.coefficient37_185, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_187, Icur := OriginalRow227TriangleData0548.coefficient36_186,
    output := OriginalRow227TriangleData0562.coefficient37_186, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_188, Icur := OriginalRow227TriangleData0548.coefficient36_187,
    output := OriginalRow227TriangleData0562.coefficient37_187, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_189, Icur := OriginalRow227TriangleData0548.coefficient36_188,
    output := OriginalRow227TriangleData0562.coefficient37_188, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_190, Icur := OriginalRow227TriangleData0548.coefficient36_189,
    output := OriginalRow227TriangleData0562.coefficient37_189, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_191, Icur := OriginalRow227TriangleData0548.coefficient36_190,
    output := OriginalRow227TriangleData0562.coefficient37_190, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_192, Icur := OriginalRow227TriangleData0548.coefficient36_191,
    output := OriginalRow227TriangleData0562.coefficient37_191, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_193, Icur := OriginalRow227TriangleData0548.coefficient36_192,
    output := OriginalRow227TriangleData0562.coefficient37_192, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0548.coefficient36_194, Icur := OriginalRow227TriangleData0548.coefficient36_193,
    output := OriginalRow227TriangleData0562.coefficient37_193, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_195, Icur := OriginalRow227TriangleData0548.coefficient36_194,
    output := OriginalRow227TriangleData0562.coefficient37_194, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0549.coefficient36_196, Icur := OriginalRow227TriangleData0549.coefficient36_195,
    output := OriginalRow227TriangleData0562.coefficient37_195, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0546

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0546.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
