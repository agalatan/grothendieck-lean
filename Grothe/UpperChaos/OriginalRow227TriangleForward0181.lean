import Grothe.UpperChaos.OriginalRow227TriangleData0181
import Grothe.UpperChaos.OriginalRow227TriangleData0182
import Grothe.UpperChaos.OriginalRow227TriangleData0197
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0181
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_172, Icur := OriginalRow227TriangleData0181.coefficient11_171,
    output := OriginalRow227TriangleData0197.coefficient12_171, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_173, Icur := OriginalRow227TriangleData0181.coefficient11_172,
    output := OriginalRow227TriangleData0197.coefficient12_172, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_174, Icur := OriginalRow227TriangleData0181.coefficient11_173,
    output := OriginalRow227TriangleData0197.coefficient12_173, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_175, Icur := OriginalRow227TriangleData0181.coefficient11_174,
    output := OriginalRow227TriangleData0197.coefficient12_174, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_176, Icur := OriginalRow227TriangleData0181.coefficient11_175,
    output := OriginalRow227TriangleData0197.coefficient12_175, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_177, Icur := OriginalRow227TriangleData0181.coefficient11_176,
    output := OriginalRow227TriangleData0197.coefficient12_176, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_178, Icur := OriginalRow227TriangleData0181.coefficient11_177,
    output := OriginalRow227TriangleData0197.coefficient12_177, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_179, Icur := OriginalRow227TriangleData0181.coefficient11_178,
    output := OriginalRow227TriangleData0197.coefficient12_178, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_180, Icur := OriginalRow227TriangleData0181.coefficient11_179,
    output := OriginalRow227TriangleData0197.coefficient12_179, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_181, Icur := OriginalRow227TriangleData0181.coefficient11_180,
    output := OriginalRow227TriangleData0197.coefficient12_180, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_182, Icur := OriginalRow227TriangleData0181.coefficient11_181,
    output := OriginalRow227TriangleData0197.coefficient12_181, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_183, Icur := OriginalRow227TriangleData0181.coefficient11_182,
    output := OriginalRow227TriangleData0197.coefficient12_182, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_184, Icur := OriginalRow227TriangleData0181.coefficient11_183,
    output := OriginalRow227TriangleData0197.coefficient12_183, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_185, Icur := OriginalRow227TriangleData0181.coefficient11_184,
    output := OriginalRow227TriangleData0197.coefficient12_184, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_186, Icur := OriginalRow227TriangleData0181.coefficient11_185,
    output := OriginalRow227TriangleData0197.coefficient12_185, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_187, Icur := OriginalRow227TriangleData0181.coefficient11_186,
    output := OriginalRow227TriangleData0197.coefficient12_186, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_188, Icur := OriginalRow227TriangleData0181.coefficient11_187,
    output := OriginalRow227TriangleData0197.coefficient12_187, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_189, Icur := OriginalRow227TriangleData0181.coefficient11_188,
    output := OriginalRow227TriangleData0197.coefficient12_188, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_190, Icur := OriginalRow227TriangleData0181.coefficient11_189,
    output := OriginalRow227TriangleData0197.coefficient12_189, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_191, Icur := OriginalRow227TriangleData0181.coefficient11_190,
    output := OriginalRow227TriangleData0197.coefficient12_190, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_192, Icur := OriginalRow227TriangleData0181.coefficient11_191,
    output := OriginalRow227TriangleData0197.coefficient12_191, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_193, Icur := OriginalRow227TriangleData0181.coefficient11_192,
    output := OriginalRow227TriangleData0197.coefficient12_192, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_194, Icur := OriginalRow227TriangleData0181.coefficient11_193,
    output := OriginalRow227TriangleData0197.coefficient12_193, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_195, Icur := OriginalRow227TriangleData0181.coefficient11_194,
    output := OriginalRow227TriangleData0197.coefficient12_194, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_196, Icur := OriginalRow227TriangleData0181.coefficient11_195,
    output := OriginalRow227TriangleData0197.coefficient12_195, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_197, Icur := OriginalRow227TriangleData0181.coefficient11_196,
    output := OriginalRow227TriangleData0197.coefficient12_196, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_198, Icur := OriginalRow227TriangleData0181.coefficient11_197,
    output := OriginalRow227TriangleData0197.coefficient12_197, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_199, Icur := OriginalRow227TriangleData0181.coefficient11_198,
    output := OriginalRow227TriangleData0197.coefficient12_198, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_200, Icur := OriginalRow227TriangleData0181.coefficient11_199,
    output := OriginalRow227TriangleData0197.coefficient12_199, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0181.coefficient11_201, Icur := OriginalRow227TriangleData0181.coefficient11_200,
    output := OriginalRow227TriangleData0197.coefficient12_200, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0182.coefficient11_202, Icur := OriginalRow227TriangleData0181.coefficient11_201,
    output := OriginalRow227TriangleData0197.coefficient12_201, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0182.coefficient11_203, Icur := OriginalRow227TriangleData0182.coefficient11_202,
    output := OriginalRow227TriangleData0197.coefficient12_202, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0181

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0181.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
