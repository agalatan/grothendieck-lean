import Grothe.UpperChaos.OriginalRow227TriangleData1783
import Grothe.UpperChaos.OriginalRow227TriangleData1784
import Grothe.UpperChaos.OriginalRow227TriangleData1789
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1773
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_190, Icur := OriginalRow227TriangleData1783.coefficient157_189,
    output := OriginalRow227TriangleData1789.coefficient158_189, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_191, Icur := OriginalRow227TriangleData1783.coefficient157_190,
    output := OriginalRow227TriangleData1789.coefficient158_190, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_192, Icur := OriginalRow227TriangleData1783.coefficient157_191,
    output := OriginalRow227TriangleData1789.coefficient158_191, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_193, Icur := OriginalRow227TriangleData1783.coefficient157_192,
    output := OriginalRow227TriangleData1789.coefficient158_192, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_194, Icur := OriginalRow227TriangleData1783.coefficient157_193,
    output := OriginalRow227TriangleData1789.coefficient158_193, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_195, Icur := OriginalRow227TriangleData1783.coefficient157_194,
    output := OriginalRow227TriangleData1789.coefficient158_194, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_196, Icur := OriginalRow227TriangleData1783.coefficient157_195,
    output := OriginalRow227TriangleData1789.coefficient158_195, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_197, Icur := OriginalRow227TriangleData1783.coefficient157_196,
    output := OriginalRow227TriangleData1789.coefficient158_196, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_198, Icur := OriginalRow227TriangleData1783.coefficient157_197,
    output := OriginalRow227TriangleData1789.coefficient158_197, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_199, Icur := OriginalRow227TriangleData1783.coefficient157_198,
    output := OriginalRow227TriangleData1789.coefficient158_198, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_200, Icur := OriginalRow227TriangleData1783.coefficient157_199,
    output := OriginalRow227TriangleData1789.coefficient158_199, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_201, Icur := OriginalRow227TriangleData1783.coefficient157_200,
    output := OriginalRow227TriangleData1789.coefficient158_200, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_202, Icur := OriginalRow227TriangleData1783.coefficient157_201,
    output := OriginalRow227TriangleData1789.coefficient158_201, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_203, Icur := OriginalRow227TriangleData1783.coefficient157_202,
    output := OriginalRow227TriangleData1789.coefficient158_202, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_204, Icur := OriginalRow227TriangleData1783.coefficient157_203,
    output := OriginalRow227TriangleData1789.coefficient158_203, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_205, Icur := OriginalRow227TriangleData1783.coefficient157_204,
    output := OriginalRow227TriangleData1789.coefficient158_204, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_206, Icur := OriginalRow227TriangleData1783.coefficient157_205,
    output := OriginalRow227TriangleData1789.coefficient158_205, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_207, Icur := OriginalRow227TriangleData1783.coefficient157_206,
    output := OriginalRow227TriangleData1789.coefficient158_206, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_208, Icur := OriginalRow227TriangleData1783.coefficient157_207,
    output := OriginalRow227TriangleData1789.coefficient158_207, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_209, Icur := OriginalRow227TriangleData1783.coefficient157_208,
    output := OriginalRow227TriangleData1789.coefficient158_208, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_210, Icur := OriginalRow227TriangleData1783.coefficient157_209,
    output := OriginalRow227TriangleData1789.coefficient158_209, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_211, Icur := OriginalRow227TriangleData1783.coefficient157_210,
    output := OriginalRow227TriangleData1789.coefficient158_210, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_212, Icur := OriginalRow227TriangleData1783.coefficient157_211,
    output := OriginalRow227TriangleData1789.coefficient158_211, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_213, Icur := OriginalRow227TriangleData1783.coefficient157_212,
    output := OriginalRow227TriangleData1789.coefficient158_212, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_214, Icur := OriginalRow227TriangleData1783.coefficient157_213,
    output := OriginalRow227TriangleData1789.coefficient158_213, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_215, Icur := OriginalRow227TriangleData1783.coefficient157_214,
    output := OriginalRow227TriangleData1789.coefficient158_214, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_216, Icur := OriginalRow227TriangleData1783.coefficient157_215,
    output := OriginalRow227TriangleData1789.coefficient158_215, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_217, Icur := OriginalRow227TriangleData1783.coefficient157_216,
    output := OriginalRow227TriangleData1789.coefficient158_216, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_218, Icur := OriginalRow227TriangleData1783.coefficient157_217,
    output := OriginalRow227TriangleData1789.coefficient158_217, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1783.coefficient157_219, Icur := OriginalRow227TriangleData1783.coefficient157_218,
    output := OriginalRow227TriangleData1789.coefficient158_218, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1784.coefficient157_220, Icur := OriginalRow227TriangleData1783.coefficient157_219,
    output := OriginalRow227TriangleData1789.coefficient158_219, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1784.coefficient157_221, Icur := OriginalRow227TriangleData1784.coefficient157_220,
    output := OriginalRow227TriangleData1789.coefficient158_220, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1773

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1773.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
