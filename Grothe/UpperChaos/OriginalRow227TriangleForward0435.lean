import Grothe.UpperChaos.OriginalRow227TriangleData0437
import Grothe.UpperChaos.OriginalRow227TriangleData0438
import Grothe.UpperChaos.OriginalRow227TriangleData0451
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0435
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_189, Icur := OriginalRow227TriangleData0437.coefficient28_188,
    output := OriginalRow227TriangleData0451.coefficient29_188, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_190, Icur := OriginalRow227TriangleData0437.coefficient28_189,
    output := OriginalRow227TriangleData0451.coefficient29_189, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_191, Icur := OriginalRow227TriangleData0437.coefficient28_190,
    output := OriginalRow227TriangleData0451.coefficient29_190, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_192, Icur := OriginalRow227TriangleData0437.coefficient28_191,
    output := OriginalRow227TriangleData0451.coefficient29_191, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_193, Icur := OriginalRow227TriangleData0437.coefficient28_192,
    output := OriginalRow227TriangleData0451.coefficient29_192, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_194, Icur := OriginalRow227TriangleData0437.coefficient28_193,
    output := OriginalRow227TriangleData0451.coefficient29_193, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_195, Icur := OriginalRow227TriangleData0437.coefficient28_194,
    output := OriginalRow227TriangleData0451.coefficient29_194, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_196, Icur := OriginalRow227TriangleData0437.coefficient28_195,
    output := OriginalRow227TriangleData0451.coefficient29_195, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_197, Icur := OriginalRow227TriangleData0437.coefficient28_196,
    output := OriginalRow227TriangleData0451.coefficient29_196, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_198, Icur := OriginalRow227TriangleData0437.coefficient28_197,
    output := OriginalRow227TriangleData0451.coefficient29_197, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_199, Icur := OriginalRow227TriangleData0437.coefficient28_198,
    output := OriginalRow227TriangleData0451.coefficient29_198, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_200, Icur := OriginalRow227TriangleData0437.coefficient28_199,
    output := OriginalRow227TriangleData0451.coefficient29_199, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_201, Icur := OriginalRow227TriangleData0437.coefficient28_200,
    output := OriginalRow227TriangleData0451.coefficient29_200, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_202, Icur := OriginalRow227TriangleData0437.coefficient28_201,
    output := OriginalRow227TriangleData0451.coefficient29_201, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_203, Icur := OriginalRow227TriangleData0437.coefficient28_202,
    output := OriginalRow227TriangleData0451.coefficient29_202, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_204, Icur := OriginalRow227TriangleData0437.coefficient28_203,
    output := OriginalRow227TriangleData0451.coefficient29_203, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_205, Icur := OriginalRow227TriangleData0437.coefficient28_204,
    output := OriginalRow227TriangleData0451.coefficient29_204, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_206, Icur := OriginalRow227TriangleData0437.coefficient28_205,
    output := OriginalRow227TriangleData0451.coefficient29_205, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_207, Icur := OriginalRow227TriangleData0437.coefficient28_206,
    output := OriginalRow227TriangleData0451.coefficient29_206, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_208, Icur := OriginalRow227TriangleData0437.coefficient28_207,
    output := OriginalRow227TriangleData0451.coefficient29_207, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_209, Icur := OriginalRow227TriangleData0437.coefficient28_208,
    output := OriginalRow227TriangleData0451.coefficient29_208, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_210, Icur := OriginalRow227TriangleData0437.coefficient28_209,
    output := OriginalRow227TriangleData0451.coefficient29_209, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_211, Icur := OriginalRow227TriangleData0437.coefficient28_210,
    output := OriginalRow227TriangleData0451.coefficient29_210, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_212, Icur := OriginalRow227TriangleData0437.coefficient28_211,
    output := OriginalRow227TriangleData0451.coefficient29_211, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_213, Icur := OriginalRow227TriangleData0437.coefficient28_212,
    output := OriginalRow227TriangleData0451.coefficient29_212, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_214, Icur := OriginalRow227TriangleData0437.coefficient28_213,
    output := OriginalRow227TriangleData0451.coefficient29_213, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_215, Icur := OriginalRow227TriangleData0437.coefficient28_214,
    output := OriginalRow227TriangleData0451.coefficient29_214, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_216, Icur := OriginalRow227TriangleData0437.coefficient28_215,
    output := OriginalRow227TriangleData0451.coefficient29_215, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_217, Icur := OriginalRow227TriangleData0437.coefficient28_216,
    output := OriginalRow227TriangleData0451.coefficient29_216, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_218, Icur := OriginalRow227TriangleData0437.coefficient28_217,
    output := OriginalRow227TriangleData0451.coefficient29_217, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_219, Icur := OriginalRow227TriangleData0437.coefficient28_218,
    output := OriginalRow227TriangleData0451.coefficient29_218, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_220, Icur := OriginalRow227TriangleData0438.coefficient28_219,
    output := OriginalRow227TriangleData0451.coefficient29_219, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0435

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0435.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
