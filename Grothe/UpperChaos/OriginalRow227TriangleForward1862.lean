import Grothe.UpperChaos.OriginalRow227TriangleData1873
import Grothe.UpperChaos.OriginalRow227TriangleData1874
import Grothe.UpperChaos.OriginalRow227TriangleData1878
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1862
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_205, Icur := OriginalRow227TriangleData1873.coefficient172_204,
    output := OriginalRow227TriangleData1878.coefficient173_204, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_206, Icur := OriginalRow227TriangleData1873.coefficient172_205,
    output := OriginalRow227TriangleData1878.coefficient173_205, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_207, Icur := OriginalRow227TriangleData1873.coefficient172_206,
    output := OriginalRow227TriangleData1878.coefficient173_206, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_208, Icur := OriginalRow227TriangleData1873.coefficient172_207,
    output := OriginalRow227TriangleData1878.coefficient173_207, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_209, Icur := OriginalRow227TriangleData1873.coefficient172_208,
    output := OriginalRow227TriangleData1878.coefficient173_208, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_210, Icur := OriginalRow227TriangleData1873.coefficient172_209,
    output := OriginalRow227TriangleData1878.coefficient173_209, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_211, Icur := OriginalRow227TriangleData1873.coefficient172_210,
    output := OriginalRow227TriangleData1878.coefficient173_210, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_212, Icur := OriginalRow227TriangleData1873.coefficient172_211,
    output := OriginalRow227TriangleData1878.coefficient173_211, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_213, Icur := OriginalRow227TriangleData1873.coefficient172_212,
    output := OriginalRow227TriangleData1878.coefficient173_212, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_214, Icur := OriginalRow227TriangleData1873.coefficient172_213,
    output := OriginalRow227TriangleData1878.coefficient173_213, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_215, Icur := OriginalRow227TriangleData1873.coefficient172_214,
    output := OriginalRow227TriangleData1878.coefficient173_214, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_216, Icur := OriginalRow227TriangleData1873.coefficient172_215,
    output := OriginalRow227TriangleData1878.coefficient173_215, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_217, Icur := OriginalRow227TriangleData1873.coefficient172_216,
    output := OriginalRow227TriangleData1878.coefficient173_216, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_218, Icur := OriginalRow227TriangleData1873.coefficient172_217,
    output := OriginalRow227TriangleData1878.coefficient173_217, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_219, Icur := OriginalRow227TriangleData1873.coefficient172_218,
    output := OriginalRow227TriangleData1878.coefficient173_218, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_220, Icur := OriginalRow227TriangleData1873.coefficient172_219,
    output := OriginalRow227TriangleData1878.coefficient173_219, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_221, Icur := OriginalRow227TriangleData1873.coefficient172_220,
    output := OriginalRow227TriangleData1878.coefficient173_220, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_222, Icur := OriginalRow227TriangleData1873.coefficient172_221,
    output := OriginalRow227TriangleData1878.coefficient173_221, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_223, Icur := OriginalRow227TriangleData1873.coefficient172_222,
    output := OriginalRow227TriangleData1878.coefficient173_222, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_224, Icur := OriginalRow227TriangleData1873.coefficient172_223,
    output := OriginalRow227TriangleData1878.coefficient173_223, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_225, Icur := OriginalRow227TriangleData1873.coefficient172_224,
    output := OriginalRow227TriangleData1878.coefficient173_224, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_226, Icur := OriginalRow227TriangleData1873.coefficient172_225,
    output := OriginalRow227TriangleData1878.coefficient173_225, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_227, Icur := OriginalRow227TriangleData1873.coefficient172_226,
    output := OriginalRow227TriangleData1878.coefficient173_226, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_228, Icur := OriginalRow227TriangleData1873.coefficient172_227,
    output := OriginalRow227TriangleData1878.coefficient173_227, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_229, Icur := OriginalRow227TriangleData1873.coefficient172_228,
    output := OriginalRow227TriangleData1878.coefficient173_228, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_230, Icur := OriginalRow227TriangleData1873.coefficient172_229,
    output := OriginalRow227TriangleData1878.coefficient173_229, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_231, Icur := OriginalRow227TriangleData1873.coefficient172_230,
    output := OriginalRow227TriangleData1878.coefficient173_230, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_232, Icur := OriginalRow227TriangleData1873.coefficient172_231,
    output := OriginalRow227TriangleData1878.coefficient173_231, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_233, Icur := OriginalRow227TriangleData1873.coefficient172_232,
    output := OriginalRow227TriangleData1878.coefficient173_232, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1873.coefficient172_234, Icur := OriginalRow227TriangleData1873.coefficient172_233,
    output := OriginalRow227TriangleData1878.coefficient173_233, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1874.coefficient172_235, Icur := OriginalRow227TriangleData1873.coefficient172_234,
    output := OriginalRow227TriangleData1878.coefficient173_234, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1874.coefficient172_236, Icur := OriginalRow227TriangleData1874.coefficient172_235,
    output := OriginalRow227TriangleData1878.coefficient173_235, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1862

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1862.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
