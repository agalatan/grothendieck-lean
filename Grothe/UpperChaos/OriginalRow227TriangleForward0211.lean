import Grothe.UpperChaos.OriginalRow227TriangleData0212
import Grothe.UpperChaos.OriginalRow227TriangleData0213
import Grothe.UpperChaos.OriginalRow227TriangleData0227
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0211
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_174, Icur := OriginalRow227TriangleData0212.coefficient13_173,
    output := OriginalRow227TriangleData0227.coefficient14_173, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_175, Icur := OriginalRow227TriangleData0212.coefficient13_174,
    output := OriginalRow227TriangleData0227.coefficient14_174, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_176, Icur := OriginalRow227TriangleData0212.coefficient13_175,
    output := OriginalRow227TriangleData0227.coefficient14_175, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_177, Icur := OriginalRow227TriangleData0212.coefficient13_176,
    output := OriginalRow227TriangleData0227.coefficient14_176, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_178, Icur := OriginalRow227TriangleData0212.coefficient13_177,
    output := OriginalRow227TriangleData0227.coefficient14_177, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_179, Icur := OriginalRow227TriangleData0212.coefficient13_178,
    output := OriginalRow227TriangleData0227.coefficient14_178, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_180, Icur := OriginalRow227TriangleData0212.coefficient13_179,
    output := OriginalRow227TriangleData0227.coefficient14_179, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_181, Icur := OriginalRow227TriangleData0212.coefficient13_180,
    output := OriginalRow227TriangleData0227.coefficient14_180, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_182, Icur := OriginalRow227TriangleData0212.coefficient13_181,
    output := OriginalRow227TriangleData0227.coefficient14_181, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_183, Icur := OriginalRow227TriangleData0212.coefficient13_182,
    output := OriginalRow227TriangleData0227.coefficient14_182, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_184, Icur := OriginalRow227TriangleData0212.coefficient13_183,
    output := OriginalRow227TriangleData0227.coefficient14_183, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_185, Icur := OriginalRow227TriangleData0212.coefficient13_184,
    output := OriginalRow227TriangleData0227.coefficient14_184, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_186, Icur := OriginalRow227TriangleData0212.coefficient13_185,
    output := OriginalRow227TriangleData0227.coefficient14_185, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_187, Icur := OriginalRow227TriangleData0212.coefficient13_186,
    output := OriginalRow227TriangleData0227.coefficient14_186, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_188, Icur := OriginalRow227TriangleData0212.coefficient13_187,
    output := OriginalRow227TriangleData0227.coefficient14_187, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_189, Icur := OriginalRow227TriangleData0212.coefficient13_188,
    output := OriginalRow227TriangleData0227.coefficient14_188, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_190, Icur := OriginalRow227TriangleData0212.coefficient13_189,
    output := OriginalRow227TriangleData0227.coefficient14_189, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_191, Icur := OriginalRow227TriangleData0212.coefficient13_190,
    output := OriginalRow227TriangleData0227.coefficient14_190, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_192, Icur := OriginalRow227TriangleData0212.coefficient13_191,
    output := OriginalRow227TriangleData0227.coefficient14_191, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_193, Icur := OriginalRow227TriangleData0212.coefficient13_192,
    output := OriginalRow227TriangleData0227.coefficient14_192, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_194, Icur := OriginalRow227TriangleData0212.coefficient13_193,
    output := OriginalRow227TriangleData0227.coefficient14_193, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_195, Icur := OriginalRow227TriangleData0212.coefficient13_194,
    output := OriginalRow227TriangleData0227.coefficient14_194, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_196, Icur := OriginalRow227TriangleData0212.coefficient13_195,
    output := OriginalRow227TriangleData0227.coefficient14_195, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_197, Icur := OriginalRow227TriangleData0212.coefficient13_196,
    output := OriginalRow227TriangleData0227.coefficient14_196, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_198, Icur := OriginalRow227TriangleData0212.coefficient13_197,
    output := OriginalRow227TriangleData0227.coefficient14_197, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_199, Icur := OriginalRow227TriangleData0212.coefficient13_198,
    output := OriginalRow227TriangleData0227.coefficient14_198, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_200, Icur := OriginalRow227TriangleData0212.coefficient13_199,
    output := OriginalRow227TriangleData0227.coefficient14_199, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_201, Icur := OriginalRow227TriangleData0212.coefficient13_200,
    output := OriginalRow227TriangleData0227.coefficient14_200, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_202, Icur := OriginalRow227TriangleData0212.coefficient13_201,
    output := OriginalRow227TriangleData0227.coefficient14_201, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0212.coefficient13_203, Icur := OriginalRow227TriangleData0212.coefficient13_202,
    output := OriginalRow227TriangleData0227.coefficient14_202, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0213.coefficient13_204, Icur := OriginalRow227TriangleData0212.coefficient13_203,
    output := OriginalRow227TriangleData0227.coefficient14_203, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0213.coefficient13_205, Icur := OriginalRow227TriangleData0213.coefficient13_204,
    output := OriginalRow227TriangleData0227.coefficient14_204, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0211

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0211.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
