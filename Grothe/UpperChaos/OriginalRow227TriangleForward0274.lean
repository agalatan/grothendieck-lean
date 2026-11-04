import Grothe.UpperChaos.OriginalRow227TriangleData0275
import Grothe.UpperChaos.OriginalRow227TriangleData0276
import Grothe.UpperChaos.OriginalRow227TriangleData0290
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0274
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_274, Icur := OriginalRow227TriangleData0275.coefficient17_273,
    output := OriginalRow227TriangleData0290.coefficient18_273, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_275, Icur := OriginalRow227TriangleData0275.coefficient17_274,
    output := OriginalRow227TriangleData0290.coefficient18_274, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_276, Icur := OriginalRow227TriangleData0275.coefficient17_275,
    output := OriginalRow227TriangleData0290.coefficient18_275, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_277, Icur := OriginalRow227TriangleData0275.coefficient17_276,
    output := OriginalRow227TriangleData0290.coefficient18_276, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_278, Icur := OriginalRow227TriangleData0275.coefficient17_277,
    output := OriginalRow227TriangleData0290.coefficient18_277, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_279, Icur := OriginalRow227TriangleData0275.coefficient17_278,
    output := OriginalRow227TriangleData0290.coefficient18_278, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_280, Icur := OriginalRow227TriangleData0275.coefficient17_279,
    output := OriginalRow227TriangleData0290.coefficient18_279, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_281, Icur := OriginalRow227TriangleData0275.coefficient17_280,
    output := OriginalRow227TriangleData0290.coefficient18_280, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_282, Icur := OriginalRow227TriangleData0275.coefficient17_281,
    output := OriginalRow227TriangleData0290.coefficient18_281, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_283, Icur := OriginalRow227TriangleData0275.coefficient17_282,
    output := OriginalRow227TriangleData0290.coefficient18_282, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_284, Icur := OriginalRow227TriangleData0275.coefficient17_283,
    output := OriginalRow227TriangleData0290.coefficient18_283, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_285, Icur := OriginalRow227TriangleData0275.coefficient17_284,
    output := OriginalRow227TriangleData0290.coefficient18_284, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_286, Icur := OriginalRow227TriangleData0275.coefficient17_285,
    output := OriginalRow227TriangleData0290.coefficient18_285, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_287, Icur := OriginalRow227TriangleData0275.coefficient17_286,
    output := OriginalRow227TriangleData0290.coefficient18_286, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_288, Icur := OriginalRow227TriangleData0275.coefficient17_287,
    output := OriginalRow227TriangleData0290.coefficient18_287, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_289, Icur := OriginalRow227TriangleData0275.coefficient17_288,
    output := OriginalRow227TriangleData0290.coefficient18_288, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_290, Icur := OriginalRow227TriangleData0275.coefficient17_289,
    output := OriginalRow227TriangleData0290.coefficient18_289, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_291, Icur := OriginalRow227TriangleData0275.coefficient17_290,
    output := OriginalRow227TriangleData0290.coefficient18_290, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_292, Icur := OriginalRow227TriangleData0275.coefficient17_291,
    output := OriginalRow227TriangleData0290.coefficient18_291, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_293, Icur := OriginalRow227TriangleData0275.coefficient17_292,
    output := OriginalRow227TriangleData0290.coefficient18_292, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_294, Icur := OriginalRow227TriangleData0275.coefficient17_293,
    output := OriginalRow227TriangleData0290.coefficient18_293, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_295, Icur := OriginalRow227TriangleData0275.coefficient17_294,
    output := OriginalRow227TriangleData0290.coefficient18_294, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_296, Icur := OriginalRow227TriangleData0275.coefficient17_295,
    output := OriginalRow227TriangleData0290.coefficient18_295, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_297, Icur := OriginalRow227TriangleData0275.coefficient17_296,
    output := OriginalRow227TriangleData0290.coefficient18_296, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_298, Icur := OriginalRow227TriangleData0275.coefficient17_297,
    output := OriginalRow227TriangleData0290.coefficient18_297, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_299, Icur := OriginalRow227TriangleData0275.coefficient17_298,
    output := OriginalRow227TriangleData0290.coefficient18_298, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_300, Icur := OriginalRow227TriangleData0275.coefficient17_299,
    output := OriginalRow227TriangleData0290.coefficient18_299, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_301, Icur := OriginalRow227TriangleData0275.coefficient17_300,
    output := OriginalRow227TriangleData0290.coefficient18_300, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_302, Icur := OriginalRow227TriangleData0275.coefficient17_301,
    output := OriginalRow227TriangleData0290.coefficient18_301, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0275.coefficient17_303, Icur := OriginalRow227TriangleData0275.coefficient17_302,
    output := OriginalRow227TriangleData0290.coefficient18_302, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_304, Icur := OriginalRow227TriangleData0275.coefficient17_303,
    output := OriginalRow227TriangleData0290.coefficient18_303, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_305, Icur := OriginalRow227TriangleData0276.coefficient17_304,
    output := OriginalRow227TriangleData0290.coefficient18_304, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0274

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0274.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
