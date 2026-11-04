import Grothe.UpperChaos.OriginalRow227TriangleData1191
import Grothe.UpperChaos.OriginalRow227TriangleData1192
import Grothe.UpperChaos.OriginalRow227TriangleData1202
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1186
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_185, Icur := OriginalRow227TriangleData1191.coefficient88_184,
    output := OriginalRow227TriangleData1202.coefficient89_184, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_186, Icur := OriginalRow227TriangleData1191.coefficient88_185,
    output := OriginalRow227TriangleData1202.coefficient89_185, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_187, Icur := OriginalRow227TriangleData1191.coefficient88_186,
    output := OriginalRow227TriangleData1202.coefficient89_186, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_188, Icur := OriginalRow227TriangleData1191.coefficient88_187,
    output := OriginalRow227TriangleData1202.coefficient89_187, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_189, Icur := OriginalRow227TriangleData1191.coefficient88_188,
    output := OriginalRow227TriangleData1202.coefficient89_188, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_190, Icur := OriginalRow227TriangleData1191.coefficient88_189,
    output := OriginalRow227TriangleData1202.coefficient89_189, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_191, Icur := OriginalRow227TriangleData1191.coefficient88_190,
    output := OriginalRow227TriangleData1202.coefficient89_190, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_192, Icur := OriginalRow227TriangleData1191.coefficient88_191,
    output := OriginalRow227TriangleData1202.coefficient89_191, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_193, Icur := OriginalRow227TriangleData1191.coefficient88_192,
    output := OriginalRow227TriangleData1202.coefficient89_192, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_194, Icur := OriginalRow227TriangleData1191.coefficient88_193,
    output := OriginalRow227TriangleData1202.coefficient89_193, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_195, Icur := OriginalRow227TriangleData1191.coefficient88_194,
    output := OriginalRow227TriangleData1202.coefficient89_194, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_196, Icur := OriginalRow227TriangleData1191.coefficient88_195,
    output := OriginalRow227TriangleData1202.coefficient89_195, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_197, Icur := OriginalRow227TriangleData1191.coefficient88_196,
    output := OriginalRow227TriangleData1202.coefficient89_196, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_198, Icur := OriginalRow227TriangleData1191.coefficient88_197,
    output := OriginalRow227TriangleData1202.coefficient89_197, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_199, Icur := OriginalRow227TriangleData1191.coefficient88_198,
    output := OriginalRow227TriangleData1202.coefficient89_198, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_200, Icur := OriginalRow227TriangleData1191.coefficient88_199,
    output := OriginalRow227TriangleData1202.coefficient89_199, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_201, Icur := OriginalRow227TriangleData1191.coefficient88_200,
    output := OriginalRow227TriangleData1202.coefficient89_200, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_202, Icur := OriginalRow227TriangleData1191.coefficient88_201,
    output := OriginalRow227TriangleData1202.coefficient89_201, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_203, Icur := OriginalRow227TriangleData1191.coefficient88_202,
    output := OriginalRow227TriangleData1202.coefficient89_202, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_204, Icur := OriginalRow227TriangleData1191.coefficient88_203,
    output := OriginalRow227TriangleData1202.coefficient89_203, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_205, Icur := OriginalRow227TriangleData1191.coefficient88_204,
    output := OriginalRow227TriangleData1202.coefficient89_204, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_206, Icur := OriginalRow227TriangleData1191.coefficient88_205,
    output := OriginalRow227TriangleData1202.coefficient89_205, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_207, Icur := OriginalRow227TriangleData1191.coefficient88_206,
    output := OriginalRow227TriangleData1202.coefficient89_206, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_208, Icur := OriginalRow227TriangleData1191.coefficient88_207,
    output := OriginalRow227TriangleData1202.coefficient89_207, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_209, Icur := OriginalRow227TriangleData1191.coefficient88_208,
    output := OriginalRow227TriangleData1202.coefficient89_208, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_210, Icur := OriginalRow227TriangleData1191.coefficient88_209,
    output := OriginalRow227TriangleData1202.coefficient89_209, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_211, Icur := OriginalRow227TriangleData1191.coefficient88_210,
    output := OriginalRow227TriangleData1202.coefficient89_210, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_212, Icur := OriginalRow227TriangleData1191.coefficient88_211,
    output := OriginalRow227TriangleData1202.coefficient89_211, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_213, Icur := OriginalRow227TriangleData1191.coefficient88_212,
    output := OriginalRow227TriangleData1202.coefficient89_212, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1191.coefficient88_214, Icur := OriginalRow227TriangleData1191.coefficient88_213,
    output := OriginalRow227TriangleData1202.coefficient89_213, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1192.coefficient88_215, Icur := OriginalRow227TriangleData1191.coefficient88_214,
    output := OriginalRow227TriangleData1202.coefficient89_214, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1192.coefficient88_216, Icur := OriginalRow227TriangleData1192.coefficient88_215,
    output := OriginalRow227TriangleData1202.coefficient89_215, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1186

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1186.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
