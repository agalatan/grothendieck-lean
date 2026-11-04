import Grothe.UpperChaos.OriginalRow227TriangleData1789
import Grothe.UpperChaos.OriginalRow227TriangleData1790
import Grothe.UpperChaos.OriginalRow227TriangleData1795
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1779
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_191, Icur := OriginalRow227TriangleData1789.coefficient158_190,
    output := OriginalRow227TriangleData1795.coefficient159_190, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_192, Icur := OriginalRow227TriangleData1789.coefficient158_191,
    output := OriginalRow227TriangleData1795.coefficient159_191, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_193, Icur := OriginalRow227TriangleData1789.coefficient158_192,
    output := OriginalRow227TriangleData1795.coefficient159_192, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_194, Icur := OriginalRow227TriangleData1789.coefficient158_193,
    output := OriginalRow227TriangleData1795.coefficient159_193, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_195, Icur := OriginalRow227TriangleData1789.coefficient158_194,
    output := OriginalRow227TriangleData1795.coefficient159_194, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_196, Icur := OriginalRow227TriangleData1789.coefficient158_195,
    output := OriginalRow227TriangleData1795.coefficient159_195, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_197, Icur := OriginalRow227TriangleData1789.coefficient158_196,
    output := OriginalRow227TriangleData1795.coefficient159_196, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_198, Icur := OriginalRow227TriangleData1789.coefficient158_197,
    output := OriginalRow227TriangleData1795.coefficient159_197, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_199, Icur := OriginalRow227TriangleData1789.coefficient158_198,
    output := OriginalRow227TriangleData1795.coefficient159_198, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_200, Icur := OriginalRow227TriangleData1789.coefficient158_199,
    output := OriginalRow227TriangleData1795.coefficient159_199, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_201, Icur := OriginalRow227TriangleData1789.coefficient158_200,
    output := OriginalRow227TriangleData1795.coefficient159_200, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_202, Icur := OriginalRow227TriangleData1789.coefficient158_201,
    output := OriginalRow227TriangleData1795.coefficient159_201, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_203, Icur := OriginalRow227TriangleData1789.coefficient158_202,
    output := OriginalRow227TriangleData1795.coefficient159_202, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_204, Icur := OriginalRow227TriangleData1789.coefficient158_203,
    output := OriginalRow227TriangleData1795.coefficient159_203, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_205, Icur := OriginalRow227TriangleData1789.coefficient158_204,
    output := OriginalRow227TriangleData1795.coefficient159_204, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_206, Icur := OriginalRow227TriangleData1789.coefficient158_205,
    output := OriginalRow227TriangleData1795.coefficient159_205, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_207, Icur := OriginalRow227TriangleData1789.coefficient158_206,
    output := OriginalRow227TriangleData1795.coefficient159_206, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_208, Icur := OriginalRow227TriangleData1789.coefficient158_207,
    output := OriginalRow227TriangleData1795.coefficient159_207, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_209, Icur := OriginalRow227TriangleData1789.coefficient158_208,
    output := OriginalRow227TriangleData1795.coefficient159_208, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_210, Icur := OriginalRow227TriangleData1789.coefficient158_209,
    output := OriginalRow227TriangleData1795.coefficient159_209, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_211, Icur := OriginalRow227TriangleData1789.coefficient158_210,
    output := OriginalRow227TriangleData1795.coefficient159_210, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_212, Icur := OriginalRow227TriangleData1789.coefficient158_211,
    output := OriginalRow227TriangleData1795.coefficient159_211, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_213, Icur := OriginalRow227TriangleData1789.coefficient158_212,
    output := OriginalRow227TriangleData1795.coefficient159_212, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_214, Icur := OriginalRow227TriangleData1789.coefficient158_213,
    output := OriginalRow227TriangleData1795.coefficient159_213, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_215, Icur := OriginalRow227TriangleData1789.coefficient158_214,
    output := OriginalRow227TriangleData1795.coefficient159_214, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_216, Icur := OriginalRow227TriangleData1789.coefficient158_215,
    output := OriginalRow227TriangleData1795.coefficient159_215, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_217, Icur := OriginalRow227TriangleData1789.coefficient158_216,
    output := OriginalRow227TriangleData1795.coefficient159_216, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_218, Icur := OriginalRow227TriangleData1789.coefficient158_217,
    output := OriginalRow227TriangleData1795.coefficient159_217, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_219, Icur := OriginalRow227TriangleData1789.coefficient158_218,
    output := OriginalRow227TriangleData1795.coefficient159_218, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_220, Icur := OriginalRow227TriangleData1789.coefficient158_219,
    output := OriginalRow227TriangleData1795.coefficient159_219, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_221, Icur := OriginalRow227TriangleData1789.coefficient158_220,
    output := OriginalRow227TriangleData1795.coefficient159_220, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_222, Icur := OriginalRow227TriangleData1790.coefficient158_221,
    output := OriginalRow227TriangleData1795.coefficient159_221, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1779

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1779.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
