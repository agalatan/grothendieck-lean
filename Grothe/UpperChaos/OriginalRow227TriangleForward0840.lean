import Grothe.UpperChaos.OriginalRow227TriangleData0843
import Grothe.UpperChaos.OriginalRow227TriangleData0844
import Grothe.UpperChaos.OriginalRow227TriangleData0856
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0840
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_219, Icur := OriginalRow227TriangleData0843.coefficient58_218,
    output := OriginalRow227TriangleData0856.coefficient59_218, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_220, Icur := OriginalRow227TriangleData0843.coefficient58_219,
    output := OriginalRow227TriangleData0856.coefficient59_219, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_221, Icur := OriginalRow227TriangleData0843.coefficient58_220,
    output := OriginalRow227TriangleData0856.coefficient59_220, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_222, Icur := OriginalRow227TriangleData0843.coefficient58_221,
    output := OriginalRow227TriangleData0856.coefficient59_221, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_223, Icur := OriginalRow227TriangleData0843.coefficient58_222,
    output := OriginalRow227TriangleData0856.coefficient59_222, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_224, Icur := OriginalRow227TriangleData0843.coefficient58_223,
    output := OriginalRow227TriangleData0856.coefficient59_223, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_225, Icur := OriginalRow227TriangleData0843.coefficient58_224,
    output := OriginalRow227TriangleData0856.coefficient59_224, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_226, Icur := OriginalRow227TriangleData0843.coefficient58_225,
    output := OriginalRow227TriangleData0856.coefficient59_225, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_227, Icur := OriginalRow227TriangleData0843.coefficient58_226,
    output := OriginalRow227TriangleData0856.coefficient59_226, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_228, Icur := OriginalRow227TriangleData0843.coefficient58_227,
    output := OriginalRow227TriangleData0856.coefficient59_227, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_229, Icur := OriginalRow227TriangleData0843.coefficient58_228,
    output := OriginalRow227TriangleData0856.coefficient59_228, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_230, Icur := OriginalRow227TriangleData0843.coefficient58_229,
    output := OriginalRow227TriangleData0856.coefficient59_229, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_231, Icur := OriginalRow227TriangleData0843.coefficient58_230,
    output := OriginalRow227TriangleData0856.coefficient59_230, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_232, Icur := OriginalRow227TriangleData0843.coefficient58_231,
    output := OriginalRow227TriangleData0856.coefficient59_231, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_233, Icur := OriginalRow227TriangleData0843.coefficient58_232,
    output := OriginalRow227TriangleData0856.coefficient59_232, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_234, Icur := OriginalRow227TriangleData0843.coefficient58_233,
    output := OriginalRow227TriangleData0856.coefficient59_233, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_235, Icur := OriginalRow227TriangleData0843.coefficient58_234,
    output := OriginalRow227TriangleData0856.coefficient59_234, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_236, Icur := OriginalRow227TriangleData0843.coefficient58_235,
    output := OriginalRow227TriangleData0856.coefficient59_235, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_237, Icur := OriginalRow227TriangleData0843.coefficient58_236,
    output := OriginalRow227TriangleData0856.coefficient59_236, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_238, Icur := OriginalRow227TriangleData0843.coefficient58_237,
    output := OriginalRow227TriangleData0856.coefficient59_237, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_239, Icur := OriginalRow227TriangleData0843.coefficient58_238,
    output := OriginalRow227TriangleData0856.coefficient59_238, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_240, Icur := OriginalRow227TriangleData0843.coefficient58_239,
    output := OriginalRow227TriangleData0856.coefficient59_239, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_241, Icur := OriginalRow227TriangleData0843.coefficient58_240,
    output := OriginalRow227TriangleData0856.coefficient59_240, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_242, Icur := OriginalRow227TriangleData0843.coefficient58_241,
    output := OriginalRow227TriangleData0856.coefficient59_241, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_243, Icur := OriginalRow227TriangleData0843.coefficient58_242,
    output := OriginalRow227TriangleData0856.coefficient59_242, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_244, Icur := OriginalRow227TriangleData0843.coefficient58_243,
    output := OriginalRow227TriangleData0856.coefficient59_243, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_245, Icur := OriginalRow227TriangleData0843.coefficient58_244,
    output := OriginalRow227TriangleData0856.coefficient59_244, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_246, Icur := OriginalRow227TriangleData0843.coefficient58_245,
    output := OriginalRow227TriangleData0856.coefficient59_245, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_247, Icur := OriginalRow227TriangleData0843.coefficient58_246,
    output := OriginalRow227TriangleData0856.coefficient59_246, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0843.coefficient58_248, Icur := OriginalRow227TriangleData0843.coefficient58_247,
    output := OriginalRow227TriangleData0856.coefficient59_247, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0844.coefficient58_249, Icur := OriginalRow227TriangleData0843.coefficient58_248,
    output := OriginalRow227TriangleData0856.coefficient59_248, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root59,
    Inext := OriginalRow227TriangleData0844.coefficient58_250, Icur := OriginalRow227TriangleData0844.coefficient58_249,
    output := OriginalRow227TriangleData0856.coefficient59_249, hC := OriginalRow227TriangleRoots01.root59_pos, hAC := OriginalRow227TriangleRoots01.product59_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0840

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0840.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
