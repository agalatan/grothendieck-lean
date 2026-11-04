import Grothe.UpperChaos.OriginalRow227TriangleData0647
import Grothe.UpperChaos.OriginalRow227TriangleData0648
import Grothe.UpperChaos.OriginalRow227TriangleData0661
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0645
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_204, Icur := OriginalRow227TriangleData0647.coefficient43_203,
    output := OriginalRow227TriangleData0661.coefficient44_203, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_205, Icur := OriginalRow227TriangleData0647.coefficient43_204,
    output := OriginalRow227TriangleData0661.coefficient44_204, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_206, Icur := OriginalRow227TriangleData0647.coefficient43_205,
    output := OriginalRow227TriangleData0661.coefficient44_205, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_207, Icur := OriginalRow227TriangleData0647.coefficient43_206,
    output := OriginalRow227TriangleData0661.coefficient44_206, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_208, Icur := OriginalRow227TriangleData0647.coefficient43_207,
    output := OriginalRow227TriangleData0661.coefficient44_207, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_209, Icur := OriginalRow227TriangleData0647.coefficient43_208,
    output := OriginalRow227TriangleData0661.coefficient44_208, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_210, Icur := OriginalRow227TriangleData0647.coefficient43_209,
    output := OriginalRow227TriangleData0661.coefficient44_209, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_211, Icur := OriginalRow227TriangleData0647.coefficient43_210,
    output := OriginalRow227TriangleData0661.coefficient44_210, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_212, Icur := OriginalRow227TriangleData0647.coefficient43_211,
    output := OriginalRow227TriangleData0661.coefficient44_211, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_213, Icur := OriginalRow227TriangleData0647.coefficient43_212,
    output := OriginalRow227TriangleData0661.coefficient44_212, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_214, Icur := OriginalRow227TriangleData0647.coefficient43_213,
    output := OriginalRow227TriangleData0661.coefficient44_213, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_215, Icur := OriginalRow227TriangleData0647.coefficient43_214,
    output := OriginalRow227TriangleData0661.coefficient44_214, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_216, Icur := OriginalRow227TriangleData0647.coefficient43_215,
    output := OriginalRow227TriangleData0661.coefficient44_215, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_217, Icur := OriginalRow227TriangleData0647.coefficient43_216,
    output := OriginalRow227TriangleData0661.coefficient44_216, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_218, Icur := OriginalRow227TriangleData0647.coefficient43_217,
    output := OriginalRow227TriangleData0661.coefficient44_217, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_219, Icur := OriginalRow227TriangleData0647.coefficient43_218,
    output := OriginalRow227TriangleData0661.coefficient44_218, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_220, Icur := OriginalRow227TriangleData0647.coefficient43_219,
    output := OriginalRow227TriangleData0661.coefficient44_219, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_221, Icur := OriginalRow227TriangleData0647.coefficient43_220,
    output := OriginalRow227TriangleData0661.coefficient44_220, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_222, Icur := OriginalRow227TriangleData0647.coefficient43_221,
    output := OriginalRow227TriangleData0661.coefficient44_221, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_223, Icur := OriginalRow227TriangleData0647.coefficient43_222,
    output := OriginalRow227TriangleData0661.coefficient44_222, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_224, Icur := OriginalRow227TriangleData0647.coefficient43_223,
    output := OriginalRow227TriangleData0661.coefficient44_223, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_225, Icur := OriginalRow227TriangleData0647.coefficient43_224,
    output := OriginalRow227TriangleData0661.coefficient44_224, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_226, Icur := OriginalRow227TriangleData0647.coefficient43_225,
    output := OriginalRow227TriangleData0661.coefficient44_225, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_227, Icur := OriginalRow227TriangleData0647.coefficient43_226,
    output := OriginalRow227TriangleData0661.coefficient44_226, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_228, Icur := OriginalRow227TriangleData0647.coefficient43_227,
    output := OriginalRow227TriangleData0661.coefficient44_227, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_229, Icur := OriginalRow227TriangleData0647.coefficient43_228,
    output := OriginalRow227TriangleData0661.coefficient44_228, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_230, Icur := OriginalRow227TriangleData0647.coefficient43_229,
    output := OriginalRow227TriangleData0661.coefficient44_229, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_231, Icur := OriginalRow227TriangleData0647.coefficient43_230,
    output := OriginalRow227TriangleData0661.coefficient44_230, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_232, Icur := OriginalRow227TriangleData0647.coefficient43_231,
    output := OriginalRow227TriangleData0661.coefficient44_231, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0647.coefficient43_233, Icur := OriginalRow227TriangleData0647.coefficient43_232,
    output := OriginalRow227TriangleData0661.coefficient44_232, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_234, Icur := OriginalRow227TriangleData0647.coefficient43_233,
    output := OriginalRow227TriangleData0661.coefficient44_233, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_235, Icur := OriginalRow227TriangleData0648.coefficient43_234,
    output := OriginalRow227TriangleData0661.coefficient44_234, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0645

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0645.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
