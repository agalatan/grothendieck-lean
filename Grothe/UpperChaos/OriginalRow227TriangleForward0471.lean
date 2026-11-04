import Grothe.UpperChaos.OriginalRow227TriangleData0473
import Grothe.UpperChaos.OriginalRow227TriangleData0487
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0471
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_447, Icur := OriginalRow227TriangleData0473.coefficient30_446,
    output := OriginalRow227TriangleData0487.coefficient31_446, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_448, Icur := OriginalRow227TriangleData0473.coefficient30_447,
    output := OriginalRow227TriangleData0487.coefficient31_447, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_449, Icur := OriginalRow227TriangleData0473.coefficient30_448,
    output := OriginalRow227TriangleData0487.coefficient31_448, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_450, Icur := OriginalRow227TriangleData0473.coefficient30_449,
    output := OriginalRow227TriangleData0487.coefficient31_449, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_451, Icur := OriginalRow227TriangleData0473.coefficient30_450,
    output := OriginalRow227TriangleData0487.coefficient31_450, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_452, Icur := OriginalRow227TriangleData0473.coefficient30_451,
    output := OriginalRow227TriangleData0487.coefficient31_451, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_453, Icur := OriginalRow227TriangleData0473.coefficient30_452,
    output := OriginalRow227TriangleData0487.coefficient31_452, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_454, Icur := OriginalRow227TriangleData0473.coefficient30_453,
    output := OriginalRow227TriangleData0487.coefficient31_453, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_455, Icur := OriginalRow227TriangleData0473.coefficient30_454,
    output := OriginalRow227TriangleData0487.coefficient31_454, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_456, Icur := OriginalRow227TriangleData0473.coefficient30_455,
    output := OriginalRow227TriangleData0487.coefficient31_455, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_457, Icur := OriginalRow227TriangleData0473.coefficient30_456,
    output := OriginalRow227TriangleData0487.coefficient31_456, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_458, Icur := OriginalRow227TriangleData0473.coefficient30_457,
    output := OriginalRow227TriangleData0487.coefficient31_457, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_459, Icur := OriginalRow227TriangleData0473.coefficient30_458,
    output := OriginalRow227TriangleData0487.coefficient31_458, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_460, Icur := OriginalRow227TriangleData0473.coefficient30_459,
    output := OriginalRow227TriangleData0487.coefficient31_459, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_461, Icur := OriginalRow227TriangleData0473.coefficient30_460,
    output := OriginalRow227TriangleData0487.coefficient31_460, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_462, Icur := OriginalRow227TriangleData0473.coefficient30_461,
    output := OriginalRow227TriangleData0487.coefficient31_461, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_463, Icur := OriginalRow227TriangleData0473.coefficient30_462,
    output := OriginalRow227TriangleData0487.coefficient31_462, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_464, Icur := OriginalRow227TriangleData0473.coefficient30_463,
    output := OriginalRow227TriangleData0487.coefficient31_463, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_465, Icur := OriginalRow227TriangleData0473.coefficient30_464,
    output := OriginalRow227TriangleData0487.coefficient31_464, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_466, Icur := OriginalRow227TriangleData0473.coefficient30_465,
    output := OriginalRow227TriangleData0487.coefficient31_465, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_467, Icur := OriginalRow227TriangleData0473.coefficient30_466,
    output := OriginalRow227TriangleData0487.coefficient31_466, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_468, Icur := OriginalRow227TriangleData0473.coefficient30_467,
    output := OriginalRow227TriangleData0487.coefficient31_467, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_469, Icur := OriginalRow227TriangleData0473.coefficient30_468,
    output := OriginalRow227TriangleData0487.coefficient31_468, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_470, Icur := OriginalRow227TriangleData0473.coefficient30_469,
    output := OriginalRow227TriangleData0487.coefficient31_469, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0473.coefficient30_471, Icur := OriginalRow227TriangleData0473.coefficient30_470,
    output := OriginalRow227TriangleData0487.coefficient31_470, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0471

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0471.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
