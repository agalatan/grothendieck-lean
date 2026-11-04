import Grothe.UpperChaos.OriginalRow227TriangleData0764
import Grothe.UpperChaos.OriginalRow227TriangleData0765
import Grothe.UpperChaos.OriginalRow227TriangleData0777
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0761
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_181, Icur := OriginalRow227TriangleData0764.coefficient52_180,
    output := OriginalRow227TriangleData0777.coefficient53_180, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_182, Icur := OriginalRow227TriangleData0764.coefficient52_181,
    output := OriginalRow227TriangleData0777.coefficient53_181, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_183, Icur := OriginalRow227TriangleData0764.coefficient52_182,
    output := OriginalRow227TriangleData0777.coefficient53_182, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_184, Icur := OriginalRow227TriangleData0764.coefficient52_183,
    output := OriginalRow227TriangleData0777.coefficient53_183, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_185, Icur := OriginalRow227TriangleData0764.coefficient52_184,
    output := OriginalRow227TriangleData0777.coefficient53_184, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_186, Icur := OriginalRow227TriangleData0764.coefficient52_185,
    output := OriginalRow227TriangleData0777.coefficient53_185, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_187, Icur := OriginalRow227TriangleData0764.coefficient52_186,
    output := OriginalRow227TriangleData0777.coefficient53_186, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_188, Icur := OriginalRow227TriangleData0764.coefficient52_187,
    output := OriginalRow227TriangleData0777.coefficient53_187, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_189, Icur := OriginalRow227TriangleData0764.coefficient52_188,
    output := OriginalRow227TriangleData0777.coefficient53_188, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_190, Icur := OriginalRow227TriangleData0764.coefficient52_189,
    output := OriginalRow227TriangleData0777.coefficient53_189, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_191, Icur := OriginalRow227TriangleData0764.coefficient52_190,
    output := OriginalRow227TriangleData0777.coefficient53_190, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_192, Icur := OriginalRow227TriangleData0764.coefficient52_191,
    output := OriginalRow227TriangleData0777.coefficient53_191, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_193, Icur := OriginalRow227TriangleData0764.coefficient52_192,
    output := OriginalRow227TriangleData0777.coefficient53_192, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_194, Icur := OriginalRow227TriangleData0764.coefficient52_193,
    output := OriginalRow227TriangleData0777.coefficient53_193, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_195, Icur := OriginalRow227TriangleData0764.coefficient52_194,
    output := OriginalRow227TriangleData0777.coefficient53_194, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_196, Icur := OriginalRow227TriangleData0764.coefficient52_195,
    output := OriginalRow227TriangleData0777.coefficient53_195, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_197, Icur := OriginalRow227TriangleData0764.coefficient52_196,
    output := OriginalRow227TriangleData0777.coefficient53_196, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_198, Icur := OriginalRow227TriangleData0764.coefficient52_197,
    output := OriginalRow227TriangleData0777.coefficient53_197, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_199, Icur := OriginalRow227TriangleData0764.coefficient52_198,
    output := OriginalRow227TriangleData0777.coefficient53_198, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_200, Icur := OriginalRow227TriangleData0764.coefficient52_199,
    output := OriginalRow227TriangleData0777.coefficient53_199, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_201, Icur := OriginalRow227TriangleData0764.coefficient52_200,
    output := OriginalRow227TriangleData0777.coefficient53_200, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_202, Icur := OriginalRow227TriangleData0764.coefficient52_201,
    output := OriginalRow227TriangleData0777.coefficient53_201, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_203, Icur := OriginalRow227TriangleData0764.coefficient52_202,
    output := OriginalRow227TriangleData0777.coefficient53_202, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_204, Icur := OriginalRow227TriangleData0764.coefficient52_203,
    output := OriginalRow227TriangleData0777.coefficient53_203, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_205, Icur := OriginalRow227TriangleData0764.coefficient52_204,
    output := OriginalRow227TriangleData0777.coefficient53_204, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_206, Icur := OriginalRow227TriangleData0764.coefficient52_205,
    output := OriginalRow227TriangleData0777.coefficient53_205, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_207, Icur := OriginalRow227TriangleData0764.coefficient52_206,
    output := OriginalRow227TriangleData0777.coefficient53_206, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_208, Icur := OriginalRow227TriangleData0764.coefficient52_207,
    output := OriginalRow227TriangleData0777.coefficient53_207, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_209, Icur := OriginalRow227TriangleData0764.coefficient52_208,
    output := OriginalRow227TriangleData0777.coefficient53_208, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0764.coefficient52_210, Icur := OriginalRow227TriangleData0764.coefficient52_209,
    output := OriginalRow227TriangleData0777.coefficient53_209, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_211, Icur := OriginalRow227TriangleData0764.coefficient52_210,
    output := OriginalRow227TriangleData0777.coefficient53_210, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_212, Icur := OriginalRow227TriangleData0765.coefficient52_211,
    output := OriginalRow227TriangleData0777.coefficient53_211, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0761

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0761.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
