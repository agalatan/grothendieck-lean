import Grothe.UpperChaos.OriginalRow227TriangleData0817
import Grothe.UpperChaos.OriginalRow227TriangleData0818
import Grothe.UpperChaos.OriginalRow227TriangleData0830
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0814
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_217, Icur := OriginalRow227TriangleData0817.coefficient56_216,
    output := OriginalRow227TriangleData0830.coefficient57_216, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_218, Icur := OriginalRow227TriangleData0817.coefficient56_217,
    output := OriginalRow227TriangleData0830.coefficient57_217, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_219, Icur := OriginalRow227TriangleData0817.coefficient56_218,
    output := OriginalRow227TriangleData0830.coefficient57_218, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_220, Icur := OriginalRow227TriangleData0817.coefficient56_219,
    output := OriginalRow227TriangleData0830.coefficient57_219, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_221, Icur := OriginalRow227TriangleData0817.coefficient56_220,
    output := OriginalRow227TriangleData0830.coefficient57_220, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_222, Icur := OriginalRow227TriangleData0817.coefficient56_221,
    output := OriginalRow227TriangleData0830.coefficient57_221, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_223, Icur := OriginalRow227TriangleData0817.coefficient56_222,
    output := OriginalRow227TriangleData0830.coefficient57_222, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_224, Icur := OriginalRow227TriangleData0817.coefficient56_223,
    output := OriginalRow227TriangleData0830.coefficient57_223, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_225, Icur := OriginalRow227TriangleData0817.coefficient56_224,
    output := OriginalRow227TriangleData0830.coefficient57_224, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_226, Icur := OriginalRow227TriangleData0817.coefficient56_225,
    output := OriginalRow227TriangleData0830.coefficient57_225, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_227, Icur := OriginalRow227TriangleData0817.coefficient56_226,
    output := OriginalRow227TriangleData0830.coefficient57_226, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_228, Icur := OriginalRow227TriangleData0817.coefficient56_227,
    output := OriginalRow227TriangleData0830.coefficient57_227, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_229, Icur := OriginalRow227TriangleData0817.coefficient56_228,
    output := OriginalRow227TriangleData0830.coefficient57_228, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_230, Icur := OriginalRow227TriangleData0817.coefficient56_229,
    output := OriginalRow227TriangleData0830.coefficient57_229, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_231, Icur := OriginalRow227TriangleData0817.coefficient56_230,
    output := OriginalRow227TriangleData0830.coefficient57_230, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_232, Icur := OriginalRow227TriangleData0817.coefficient56_231,
    output := OriginalRow227TriangleData0830.coefficient57_231, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_233, Icur := OriginalRow227TriangleData0817.coefficient56_232,
    output := OriginalRow227TriangleData0830.coefficient57_232, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_234, Icur := OriginalRow227TriangleData0817.coefficient56_233,
    output := OriginalRow227TriangleData0830.coefficient57_233, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_235, Icur := OriginalRow227TriangleData0817.coefficient56_234,
    output := OriginalRow227TriangleData0830.coefficient57_234, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_236, Icur := OriginalRow227TriangleData0817.coefficient56_235,
    output := OriginalRow227TriangleData0830.coefficient57_235, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_237, Icur := OriginalRow227TriangleData0817.coefficient56_236,
    output := OriginalRow227TriangleData0830.coefficient57_236, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_238, Icur := OriginalRow227TriangleData0817.coefficient56_237,
    output := OriginalRow227TriangleData0830.coefficient57_237, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_239, Icur := OriginalRow227TriangleData0817.coefficient56_238,
    output := OriginalRow227TriangleData0830.coefficient57_238, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_240, Icur := OriginalRow227TriangleData0817.coefficient56_239,
    output := OriginalRow227TriangleData0830.coefficient57_239, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_241, Icur := OriginalRow227TriangleData0817.coefficient56_240,
    output := OriginalRow227TriangleData0830.coefficient57_240, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_242, Icur := OriginalRow227TriangleData0817.coefficient56_241,
    output := OriginalRow227TriangleData0830.coefficient57_241, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_243, Icur := OriginalRow227TriangleData0817.coefficient56_242,
    output := OriginalRow227TriangleData0830.coefficient57_242, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_244, Icur := OriginalRow227TriangleData0817.coefficient56_243,
    output := OriginalRow227TriangleData0830.coefficient57_243, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_245, Icur := OriginalRow227TriangleData0817.coefficient56_244,
    output := OriginalRow227TriangleData0830.coefficient57_244, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0817.coefficient56_246, Icur := OriginalRow227TriangleData0817.coefficient56_245,
    output := OriginalRow227TriangleData0830.coefficient57_245, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0818.coefficient56_247, Icur := OriginalRow227TriangleData0817.coefficient56_246,
    output := OriginalRow227TriangleData0830.coefficient57_246, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0818.coefficient56_248, Icur := OriginalRow227TriangleData0818.coefficient56_247,
    output := OriginalRow227TriangleData0830.coefficient57_247, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0814

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0814.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
