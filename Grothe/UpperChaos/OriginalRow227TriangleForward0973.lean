import Grothe.UpperChaos.OriginalRow227TriangleData0977
import Grothe.UpperChaos.OriginalRow227TriangleData0978
import Grothe.UpperChaos.OriginalRow227TriangleData0989
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0973
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_230, Icur := OriginalRow227TriangleData0977.coefficient69_229,
    output := OriginalRow227TriangleData0989.coefficient70_229, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_231, Icur := OriginalRow227TriangleData0977.coefficient69_230,
    output := OriginalRow227TriangleData0989.coefficient70_230, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_232, Icur := OriginalRow227TriangleData0977.coefficient69_231,
    output := OriginalRow227TriangleData0989.coefficient70_231, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_233, Icur := OriginalRow227TriangleData0977.coefficient69_232,
    output := OriginalRow227TriangleData0989.coefficient70_232, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_234, Icur := OriginalRow227TriangleData0977.coefficient69_233,
    output := OriginalRow227TriangleData0989.coefficient70_233, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_235, Icur := OriginalRow227TriangleData0977.coefficient69_234,
    output := OriginalRow227TriangleData0989.coefficient70_234, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_236, Icur := OriginalRow227TriangleData0977.coefficient69_235,
    output := OriginalRow227TriangleData0989.coefficient70_235, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_237, Icur := OriginalRow227TriangleData0977.coefficient69_236,
    output := OriginalRow227TriangleData0989.coefficient70_236, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_238, Icur := OriginalRow227TriangleData0977.coefficient69_237,
    output := OriginalRow227TriangleData0989.coefficient70_237, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_239, Icur := OriginalRow227TriangleData0977.coefficient69_238,
    output := OriginalRow227TriangleData0989.coefficient70_238, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_240, Icur := OriginalRow227TriangleData0977.coefficient69_239,
    output := OriginalRow227TriangleData0989.coefficient70_239, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_241, Icur := OriginalRow227TriangleData0977.coefficient69_240,
    output := OriginalRow227TriangleData0989.coefficient70_240, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_242, Icur := OriginalRow227TriangleData0977.coefficient69_241,
    output := OriginalRow227TriangleData0989.coefficient70_241, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_243, Icur := OriginalRow227TriangleData0977.coefficient69_242,
    output := OriginalRow227TriangleData0989.coefficient70_242, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_244, Icur := OriginalRow227TriangleData0977.coefficient69_243,
    output := OriginalRow227TriangleData0989.coefficient70_243, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_245, Icur := OriginalRow227TriangleData0977.coefficient69_244,
    output := OriginalRow227TriangleData0989.coefficient70_244, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_246, Icur := OriginalRow227TriangleData0977.coefficient69_245,
    output := OriginalRow227TriangleData0989.coefficient70_245, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_247, Icur := OriginalRow227TriangleData0977.coefficient69_246,
    output := OriginalRow227TriangleData0989.coefficient70_246, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_248, Icur := OriginalRow227TriangleData0977.coefficient69_247,
    output := OriginalRow227TriangleData0989.coefficient70_247, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_249, Icur := OriginalRow227TriangleData0977.coefficient69_248,
    output := OriginalRow227TriangleData0989.coefficient70_248, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_250, Icur := OriginalRow227TriangleData0977.coefficient69_249,
    output := OriginalRow227TriangleData0989.coefficient70_249, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_251, Icur := OriginalRow227TriangleData0977.coefficient69_250,
    output := OriginalRow227TriangleData0989.coefficient70_250, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_252, Icur := OriginalRow227TriangleData0977.coefficient69_251,
    output := OriginalRow227TriangleData0989.coefficient70_251, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_253, Icur := OriginalRow227TriangleData0977.coefficient69_252,
    output := OriginalRow227TriangleData0989.coefficient70_252, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_254, Icur := OriginalRow227TriangleData0977.coefficient69_253,
    output := OriginalRow227TriangleData0989.coefficient70_253, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_255, Icur := OriginalRow227TriangleData0977.coefficient69_254,
    output := OriginalRow227TriangleData0989.coefficient70_254, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_256, Icur := OriginalRow227TriangleData0977.coefficient69_255,
    output := OriginalRow227TriangleData0989.coefficient70_255, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_257, Icur := OriginalRow227TriangleData0977.coefficient69_256,
    output := OriginalRow227TriangleData0989.coefficient70_256, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_258, Icur := OriginalRow227TriangleData0977.coefficient69_257,
    output := OriginalRow227TriangleData0989.coefficient70_257, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0977.coefficient69_259, Icur := OriginalRow227TriangleData0977.coefficient69_258,
    output := OriginalRow227TriangleData0989.coefficient70_258, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_260, Icur := OriginalRow227TriangleData0977.coefficient69_259,
    output := OriginalRow227TriangleData0989.coefficient70_259, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_261, Icur := OriginalRow227TriangleData0978.coefficient69_260,
    output := OriginalRow227TriangleData0989.coefficient70_260, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0973

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0973.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
