import Grothe.UpperChaos.OriginalRow227TriangleData0632
import Grothe.UpperChaos.OriginalRow227TriangleData0633
import Grothe.UpperChaos.OriginalRow227TriangleData0646
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0630
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_171, Icur := OriginalRow227TriangleData0632.coefficient42_170,
    output := OriginalRow227TriangleData0646.coefficient43_170, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_172, Icur := OriginalRow227TriangleData0632.coefficient42_171,
    output := OriginalRow227TriangleData0646.coefficient43_171, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_173, Icur := OriginalRow227TriangleData0632.coefficient42_172,
    output := OriginalRow227TriangleData0646.coefficient43_172, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_174, Icur := OriginalRow227TriangleData0632.coefficient42_173,
    output := OriginalRow227TriangleData0646.coefficient43_173, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_175, Icur := OriginalRow227TriangleData0632.coefficient42_174,
    output := OriginalRow227TriangleData0646.coefficient43_174, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_176, Icur := OriginalRow227TriangleData0632.coefficient42_175,
    output := OriginalRow227TriangleData0646.coefficient43_175, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_177, Icur := OriginalRow227TriangleData0632.coefficient42_176,
    output := OriginalRow227TriangleData0646.coefficient43_176, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_178, Icur := OriginalRow227TriangleData0632.coefficient42_177,
    output := OriginalRow227TriangleData0646.coefficient43_177, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_179, Icur := OriginalRow227TriangleData0632.coefficient42_178,
    output := OriginalRow227TriangleData0646.coefficient43_178, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_180, Icur := OriginalRow227TriangleData0632.coefficient42_179,
    output := OriginalRow227TriangleData0646.coefficient43_179, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_181, Icur := OriginalRow227TriangleData0632.coefficient42_180,
    output := OriginalRow227TriangleData0646.coefficient43_180, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_182, Icur := OriginalRow227TriangleData0632.coefficient42_181,
    output := OriginalRow227TriangleData0646.coefficient43_181, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_183, Icur := OriginalRow227TriangleData0632.coefficient42_182,
    output := OriginalRow227TriangleData0646.coefficient43_182, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_184, Icur := OriginalRow227TriangleData0632.coefficient42_183,
    output := OriginalRow227TriangleData0646.coefficient43_183, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_185, Icur := OriginalRow227TriangleData0632.coefficient42_184,
    output := OriginalRow227TriangleData0646.coefficient43_184, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_186, Icur := OriginalRow227TriangleData0632.coefficient42_185,
    output := OriginalRow227TriangleData0646.coefficient43_185, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_187, Icur := OriginalRow227TriangleData0632.coefficient42_186,
    output := OriginalRow227TriangleData0646.coefficient43_186, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_188, Icur := OriginalRow227TriangleData0632.coefficient42_187,
    output := OriginalRow227TriangleData0646.coefficient43_187, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_189, Icur := OriginalRow227TriangleData0632.coefficient42_188,
    output := OriginalRow227TriangleData0646.coefficient43_188, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_190, Icur := OriginalRow227TriangleData0632.coefficient42_189,
    output := OriginalRow227TriangleData0646.coefficient43_189, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_191, Icur := OriginalRow227TriangleData0632.coefficient42_190,
    output := OriginalRow227TriangleData0646.coefficient43_190, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_192, Icur := OriginalRow227TriangleData0632.coefficient42_191,
    output := OriginalRow227TriangleData0646.coefficient43_191, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_193, Icur := OriginalRow227TriangleData0632.coefficient42_192,
    output := OriginalRow227TriangleData0646.coefficient43_192, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_194, Icur := OriginalRow227TriangleData0632.coefficient42_193,
    output := OriginalRow227TriangleData0646.coefficient43_193, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_195, Icur := OriginalRow227TriangleData0632.coefficient42_194,
    output := OriginalRow227TriangleData0646.coefficient43_194, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_196, Icur := OriginalRow227TriangleData0632.coefficient42_195,
    output := OriginalRow227TriangleData0646.coefficient43_195, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_197, Icur := OriginalRow227TriangleData0632.coefficient42_196,
    output := OriginalRow227TriangleData0646.coefficient43_196, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_198, Icur := OriginalRow227TriangleData0632.coefficient42_197,
    output := OriginalRow227TriangleData0646.coefficient43_197, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_199, Icur := OriginalRow227TriangleData0632.coefficient42_198,
    output := OriginalRow227TriangleData0646.coefficient43_198, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0632.coefficient42_200, Icur := OriginalRow227TriangleData0632.coefficient42_199,
    output := OriginalRow227TriangleData0646.coefficient43_199, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_201, Icur := OriginalRow227TriangleData0632.coefficient42_200,
    output := OriginalRow227TriangleData0646.coefficient43_200, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_202, Icur := OriginalRow227TriangleData0633.coefficient42_201,
    output := OriginalRow227TriangleData0646.coefficient43_201, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0630

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0630.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
