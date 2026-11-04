import Grothe.UpperChaos.OriginalRow227TriangleData0487
import Grothe.UpperChaos.OriginalRow227TriangleData0501
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0485
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_448, Icur := OriginalRow227TriangleData0487.coefficient31_447,
    output := OriginalRow227TriangleData0501.coefficient32_447, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_449, Icur := OriginalRow227TriangleData0487.coefficient31_448,
    output := OriginalRow227TriangleData0501.coefficient32_448, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_450, Icur := OriginalRow227TriangleData0487.coefficient31_449,
    output := OriginalRow227TriangleData0501.coefficient32_449, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_451, Icur := OriginalRow227TriangleData0487.coefficient31_450,
    output := OriginalRow227TriangleData0501.coefficient32_450, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_452, Icur := OriginalRow227TriangleData0487.coefficient31_451,
    output := OriginalRow227TriangleData0501.coefficient32_451, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_453, Icur := OriginalRow227TriangleData0487.coefficient31_452,
    output := OriginalRow227TriangleData0501.coefficient32_452, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_454, Icur := OriginalRow227TriangleData0487.coefficient31_453,
    output := OriginalRow227TriangleData0501.coefficient32_453, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_455, Icur := OriginalRow227TriangleData0487.coefficient31_454,
    output := OriginalRow227TriangleData0501.coefficient32_454, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_456, Icur := OriginalRow227TriangleData0487.coefficient31_455,
    output := OriginalRow227TriangleData0501.coefficient32_455, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_457, Icur := OriginalRow227TriangleData0487.coefficient31_456,
    output := OriginalRow227TriangleData0501.coefficient32_456, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_458, Icur := OriginalRow227TriangleData0487.coefficient31_457,
    output := OriginalRow227TriangleData0501.coefficient32_457, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_459, Icur := OriginalRow227TriangleData0487.coefficient31_458,
    output := OriginalRow227TriangleData0501.coefficient32_458, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_460, Icur := OriginalRow227TriangleData0487.coefficient31_459,
    output := OriginalRow227TriangleData0501.coefficient32_459, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_461, Icur := OriginalRow227TriangleData0487.coefficient31_460,
    output := OriginalRow227TriangleData0501.coefficient32_460, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_462, Icur := OriginalRow227TriangleData0487.coefficient31_461,
    output := OriginalRow227TriangleData0501.coefficient32_461, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_463, Icur := OriginalRow227TriangleData0487.coefficient31_462,
    output := OriginalRow227TriangleData0501.coefficient32_462, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_464, Icur := OriginalRow227TriangleData0487.coefficient31_463,
    output := OriginalRow227TriangleData0501.coefficient32_463, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_465, Icur := OriginalRow227TriangleData0487.coefficient31_464,
    output := OriginalRow227TriangleData0501.coefficient32_464, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_466, Icur := OriginalRow227TriangleData0487.coefficient31_465,
    output := OriginalRow227TriangleData0501.coefficient32_465, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_467, Icur := OriginalRow227TriangleData0487.coefficient31_466,
    output := OriginalRow227TriangleData0501.coefficient32_466, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_468, Icur := OriginalRow227TriangleData0487.coefficient31_467,
    output := OriginalRow227TriangleData0501.coefficient32_467, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_469, Icur := OriginalRow227TriangleData0487.coefficient31_468,
    output := OriginalRow227TriangleData0501.coefficient32_468, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_470, Icur := OriginalRow227TriangleData0487.coefficient31_469,
    output := OriginalRow227TriangleData0501.coefficient32_469, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0485

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0485.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
