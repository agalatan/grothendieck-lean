import Grothe.UpperChaos.OriginalRow227TriangleData0562
import Grothe.UpperChaos.OriginalRow227TriangleData0563
import Grothe.UpperChaos.OriginalRow227TriangleData0576
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0560
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_166, Icur := OriginalRow227TriangleData0562.coefficient37_165,
    output := OriginalRow227TriangleData0576.coefficient38_165, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_167, Icur := OriginalRow227TriangleData0562.coefficient37_166,
    output := OriginalRow227TriangleData0576.coefficient38_166, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_168, Icur := OriginalRow227TriangleData0562.coefficient37_167,
    output := OriginalRow227TriangleData0576.coefficient38_167, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_169, Icur := OriginalRow227TriangleData0562.coefficient37_168,
    output := OriginalRow227TriangleData0576.coefficient38_168, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_170, Icur := OriginalRow227TriangleData0562.coefficient37_169,
    output := OriginalRow227TriangleData0576.coefficient38_169, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_171, Icur := OriginalRow227TriangleData0562.coefficient37_170,
    output := OriginalRow227TriangleData0576.coefficient38_170, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_172, Icur := OriginalRow227TriangleData0562.coefficient37_171,
    output := OriginalRow227TriangleData0576.coefficient38_171, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_173, Icur := OriginalRow227TriangleData0562.coefficient37_172,
    output := OriginalRow227TriangleData0576.coefficient38_172, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_174, Icur := OriginalRow227TriangleData0562.coefficient37_173,
    output := OriginalRow227TriangleData0576.coefficient38_173, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_175, Icur := OriginalRow227TriangleData0562.coefficient37_174,
    output := OriginalRow227TriangleData0576.coefficient38_174, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_176, Icur := OriginalRow227TriangleData0562.coefficient37_175,
    output := OriginalRow227TriangleData0576.coefficient38_175, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_177, Icur := OriginalRow227TriangleData0562.coefficient37_176,
    output := OriginalRow227TriangleData0576.coefficient38_176, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_178, Icur := OriginalRow227TriangleData0562.coefficient37_177,
    output := OriginalRow227TriangleData0576.coefficient38_177, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_179, Icur := OriginalRow227TriangleData0562.coefficient37_178,
    output := OriginalRow227TriangleData0576.coefficient38_178, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_180, Icur := OriginalRow227TriangleData0562.coefficient37_179,
    output := OriginalRow227TriangleData0576.coefficient38_179, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_181, Icur := OriginalRow227TriangleData0562.coefficient37_180,
    output := OriginalRow227TriangleData0576.coefficient38_180, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_182, Icur := OriginalRow227TriangleData0562.coefficient37_181,
    output := OriginalRow227TriangleData0576.coefficient38_181, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_183, Icur := OriginalRow227TriangleData0562.coefficient37_182,
    output := OriginalRow227TriangleData0576.coefficient38_182, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_184, Icur := OriginalRow227TriangleData0562.coefficient37_183,
    output := OriginalRow227TriangleData0576.coefficient38_183, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_185, Icur := OriginalRow227TriangleData0562.coefficient37_184,
    output := OriginalRow227TriangleData0576.coefficient38_184, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_186, Icur := OriginalRow227TriangleData0562.coefficient37_185,
    output := OriginalRow227TriangleData0576.coefficient38_185, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_187, Icur := OriginalRow227TriangleData0562.coefficient37_186,
    output := OriginalRow227TriangleData0576.coefficient38_186, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_188, Icur := OriginalRow227TriangleData0562.coefficient37_187,
    output := OriginalRow227TriangleData0576.coefficient38_187, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_189, Icur := OriginalRow227TriangleData0562.coefficient37_188,
    output := OriginalRow227TriangleData0576.coefficient38_188, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_190, Icur := OriginalRow227TriangleData0562.coefficient37_189,
    output := OriginalRow227TriangleData0576.coefficient38_189, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_191, Icur := OriginalRow227TriangleData0562.coefficient37_190,
    output := OriginalRow227TriangleData0576.coefficient38_190, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_192, Icur := OriginalRow227TriangleData0562.coefficient37_191,
    output := OriginalRow227TriangleData0576.coefficient38_191, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_193, Icur := OriginalRow227TriangleData0562.coefficient37_192,
    output := OriginalRow227TriangleData0576.coefficient38_192, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_194, Icur := OriginalRow227TriangleData0562.coefficient37_193,
    output := OriginalRow227TriangleData0576.coefficient38_193, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0562.coefficient37_195, Icur := OriginalRow227TriangleData0562.coefficient37_194,
    output := OriginalRow227TriangleData0576.coefficient38_194, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0563.coefficient37_196, Icur := OriginalRow227TriangleData0562.coefficient37_195,
    output := OriginalRow227TriangleData0576.coefficient38_195, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0563.coefficient37_197, Icur := OriginalRow227TriangleData0563.coefficient37_196,
    output := OriginalRow227TriangleData0576.coefficient38_196, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0560

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0560.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
