import Grothe.UpperChaos.OriginalRow227TriangleData1454
import Grothe.UpperChaos.OriginalRow227TriangleData1463
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1447
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_371, Icur := OriginalRow227TriangleData1454.coefficient114_370,
    output := OriginalRow227TriangleData1463.coefficient115_370, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_372, Icur := OriginalRow227TriangleData1454.coefficient114_371,
    output := OriginalRow227TriangleData1463.coefficient115_371, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_373, Icur := OriginalRow227TriangleData1454.coefficient114_372,
    output := OriginalRow227TriangleData1463.coefficient115_372, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_374, Icur := OriginalRow227TriangleData1454.coefficient114_373,
    output := OriginalRow227TriangleData1463.coefficient115_373, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_375, Icur := OriginalRow227TriangleData1454.coefficient114_374,
    output := OriginalRow227TriangleData1463.coefficient115_374, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_376, Icur := OriginalRow227TriangleData1454.coefficient114_375,
    output := OriginalRow227TriangleData1463.coefficient115_375, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_377, Icur := OriginalRow227TriangleData1454.coefficient114_376,
    output := OriginalRow227TriangleData1463.coefficient115_376, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_378, Icur := OriginalRow227TriangleData1454.coefficient114_377,
    output := OriginalRow227TriangleData1463.coefficient115_377, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_379, Icur := OriginalRow227TriangleData1454.coefficient114_378,
    output := OriginalRow227TriangleData1463.coefficient115_378, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_380, Icur := OriginalRow227TriangleData1454.coefficient114_379,
    output := OriginalRow227TriangleData1463.coefficient115_379, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_381, Icur := OriginalRow227TriangleData1454.coefficient114_380,
    output := OriginalRow227TriangleData1463.coefficient115_380, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_382, Icur := OriginalRow227TriangleData1454.coefficient114_381,
    output := OriginalRow227TriangleData1463.coefficient115_381, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_383, Icur := OriginalRow227TriangleData1454.coefficient114_382,
    output := OriginalRow227TriangleData1463.coefficient115_382, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_384, Icur := OriginalRow227TriangleData1454.coefficient114_383,
    output := OriginalRow227TriangleData1463.coefficient115_383, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_385, Icur := OriginalRow227TriangleData1454.coefficient114_384,
    output := OriginalRow227TriangleData1463.coefficient115_384, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_386, Icur := OriginalRow227TriangleData1454.coefficient114_385,
    output := OriginalRow227TriangleData1463.coefficient115_385, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_387, Icur := OriginalRow227TriangleData1454.coefficient114_386,
    output := OriginalRow227TriangleData1463.coefficient115_386, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1447

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1447.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
