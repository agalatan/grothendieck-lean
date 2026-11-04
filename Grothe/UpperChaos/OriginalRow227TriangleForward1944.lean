import Grothe.UpperChaos.OriginalRow227TriangleData1956
import Grothe.UpperChaos.OriginalRow227TriangleData1957
import Grothe.UpperChaos.OriginalRow227TriangleData1960
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1944
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_190, Icur := OriginalRow227TriangleData1956.coefficient189_189,
    output := OriginalRow227TriangleData1960.coefficient190_189, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_191, Icur := OriginalRow227TriangleData1956.coefficient189_190,
    output := OriginalRow227TriangleData1960.coefficient190_190, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_192, Icur := OriginalRow227TriangleData1956.coefficient189_191,
    output := OriginalRow227TriangleData1960.coefficient190_191, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_193, Icur := OriginalRow227TriangleData1956.coefficient189_192,
    output := OriginalRow227TriangleData1960.coefficient190_192, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_194, Icur := OriginalRow227TriangleData1956.coefficient189_193,
    output := OriginalRow227TriangleData1960.coefficient190_193, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_195, Icur := OriginalRow227TriangleData1956.coefficient189_194,
    output := OriginalRow227TriangleData1960.coefficient190_194, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_196, Icur := OriginalRow227TriangleData1956.coefficient189_195,
    output := OriginalRow227TriangleData1960.coefficient190_195, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_197, Icur := OriginalRow227TriangleData1956.coefficient189_196,
    output := OriginalRow227TriangleData1960.coefficient190_196, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_198, Icur := OriginalRow227TriangleData1956.coefficient189_197,
    output := OriginalRow227TriangleData1960.coefficient190_197, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_199, Icur := OriginalRow227TriangleData1956.coefficient189_198,
    output := OriginalRow227TriangleData1960.coefficient190_198, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_200, Icur := OriginalRow227TriangleData1956.coefficient189_199,
    output := OriginalRow227TriangleData1960.coefficient190_199, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_201, Icur := OriginalRow227TriangleData1956.coefficient189_200,
    output := OriginalRow227TriangleData1960.coefficient190_200, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_202, Icur := OriginalRow227TriangleData1956.coefficient189_201,
    output := OriginalRow227TriangleData1960.coefficient190_201, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_203, Icur := OriginalRow227TriangleData1956.coefficient189_202,
    output := OriginalRow227TriangleData1960.coefficient190_202, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_204, Icur := OriginalRow227TriangleData1956.coefficient189_203,
    output := OriginalRow227TriangleData1960.coefficient190_203, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_205, Icur := OriginalRow227TriangleData1956.coefficient189_204,
    output := OriginalRow227TriangleData1960.coefficient190_204, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_206, Icur := OriginalRow227TriangleData1956.coefficient189_205,
    output := OriginalRow227TriangleData1960.coefficient190_205, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_207, Icur := OriginalRow227TriangleData1956.coefficient189_206,
    output := OriginalRow227TriangleData1960.coefficient190_206, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_208, Icur := OriginalRow227TriangleData1956.coefficient189_207,
    output := OriginalRow227TriangleData1960.coefficient190_207, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_209, Icur := OriginalRow227TriangleData1956.coefficient189_208,
    output := OriginalRow227TriangleData1960.coefficient190_208, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_210, Icur := OriginalRow227TriangleData1956.coefficient189_209,
    output := OriginalRow227TriangleData1960.coefficient190_209, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_211, Icur := OriginalRow227TriangleData1956.coefficient189_210,
    output := OriginalRow227TriangleData1960.coefficient190_210, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_212, Icur := OriginalRow227TriangleData1956.coefficient189_211,
    output := OriginalRow227TriangleData1960.coefficient190_211, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_213, Icur := OriginalRow227TriangleData1956.coefficient189_212,
    output := OriginalRow227TriangleData1960.coefficient190_212, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_214, Icur := OriginalRow227TriangleData1956.coefficient189_213,
    output := OriginalRow227TriangleData1960.coefficient190_213, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_215, Icur := OriginalRow227TriangleData1956.coefficient189_214,
    output := OriginalRow227TriangleData1960.coefficient190_214, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_216, Icur := OriginalRow227TriangleData1956.coefficient189_215,
    output := OriginalRow227TriangleData1960.coefficient190_215, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_217, Icur := OriginalRow227TriangleData1956.coefficient189_216,
    output := OriginalRow227TriangleData1960.coefficient190_216, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_218, Icur := OriginalRow227TriangleData1956.coefficient189_217,
    output := OriginalRow227TriangleData1960.coefficient190_217, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1956.coefficient189_219, Icur := OriginalRow227TriangleData1956.coefficient189_218,
    output := OriginalRow227TriangleData1960.coefficient190_218, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1957.coefficient189_220, Icur := OriginalRow227TriangleData1956.coefficient189_219,
    output := OriginalRow227TriangleData1960.coefficient190_219, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1957.coefficient189_221, Icur := OriginalRow227TriangleData1957.coefficient189_220,
    output := OriginalRow227TriangleData1960.coefficient190_220, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1944

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1944.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
