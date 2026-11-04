import Grothe.UpperChaos.OriginalRow227TriangleData1445
import Grothe.UpperChaos.OriginalRow227TriangleData1454
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1438
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_370, Icur := OriginalRow227TriangleData1445.coefficient113_369,
    output := OriginalRow227TriangleData1454.coefficient114_369, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_371, Icur := OriginalRow227TriangleData1445.coefficient113_370,
    output := OriginalRow227TriangleData1454.coefficient114_370, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_372, Icur := OriginalRow227TriangleData1445.coefficient113_371,
    output := OriginalRow227TriangleData1454.coefficient114_371, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_373, Icur := OriginalRow227TriangleData1445.coefficient113_372,
    output := OriginalRow227TriangleData1454.coefficient114_372, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_374, Icur := OriginalRow227TriangleData1445.coefficient113_373,
    output := OriginalRow227TriangleData1454.coefficient114_373, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_375, Icur := OriginalRow227TriangleData1445.coefficient113_374,
    output := OriginalRow227TriangleData1454.coefficient114_374, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_376, Icur := OriginalRow227TriangleData1445.coefficient113_375,
    output := OriginalRow227TriangleData1454.coefficient114_375, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_377, Icur := OriginalRow227TriangleData1445.coefficient113_376,
    output := OriginalRow227TriangleData1454.coefficient114_376, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_378, Icur := OriginalRow227TriangleData1445.coefficient113_377,
    output := OriginalRow227TriangleData1454.coefficient114_377, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_379, Icur := OriginalRow227TriangleData1445.coefficient113_378,
    output := OriginalRow227TriangleData1454.coefficient114_378, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_380, Icur := OriginalRow227TriangleData1445.coefficient113_379,
    output := OriginalRow227TriangleData1454.coefficient114_379, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_381, Icur := OriginalRow227TriangleData1445.coefficient113_380,
    output := OriginalRow227TriangleData1454.coefficient114_380, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_382, Icur := OriginalRow227TriangleData1445.coefficient113_381,
    output := OriginalRow227TriangleData1454.coefficient114_381, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_383, Icur := OriginalRow227TriangleData1445.coefficient113_382,
    output := OriginalRow227TriangleData1454.coefficient114_382, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_384, Icur := OriginalRow227TriangleData1445.coefficient113_383,
    output := OriginalRow227TriangleData1454.coefficient114_383, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_385, Icur := OriginalRow227TriangleData1445.coefficient113_384,
    output := OriginalRow227TriangleData1454.coefficient114_384, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_386, Icur := OriginalRow227TriangleData1445.coefficient113_385,
    output := OriginalRow227TriangleData1454.coefficient114_385, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_387, Icur := OriginalRow227TriangleData1445.coefficient113_386,
    output := OriginalRow227TriangleData1454.coefficient114_386, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots03.root114,
    Inext := OriginalRow227TriangleData1445.coefficient113_388, Icur := OriginalRow227TriangleData1445.coefficient113_387,
    output := OriginalRow227TriangleData1454.coefficient114_387, hC := OriginalRow227TriangleRoots03.root114_pos, hAC := OriginalRow227TriangleRoots03.product114_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1438

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1438.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
