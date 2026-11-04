import Grothe.UpperChaos.OriginalRow227TriangleData0096
import Grothe.UpperChaos.OriginalRow227TriangleData0097
import Grothe.UpperChaos.OriginalRow227TriangleData0112
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0096
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root7, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_7, Icur := OriginalRow227TriangleData0096.coefficient6_6,
    output := OriginalRow227TriangleData0112.coefficient7_6, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root8, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_8, Icur := OriginalRow227TriangleData0096.coefficient6_7,
    output := OriginalRow227TriangleData0112.coefficient7_7, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root9, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_9, Icur := OriginalRow227TriangleData0096.coefficient6_8,
    output := OriginalRow227TriangleData0112.coefficient7_8, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root10, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_10, Icur := OriginalRow227TriangleData0096.coefficient6_9,
    output := OriginalRow227TriangleData0112.coefficient7_9, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root11, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_11, Icur := OriginalRow227TriangleData0096.coefficient6_10,
    output := OriginalRow227TriangleData0112.coefficient7_10, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root12, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_12, Icur := OriginalRow227TriangleData0096.coefficient6_11,
    output := OriginalRow227TriangleData0112.coefficient7_11, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root13, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_13, Icur := OriginalRow227TriangleData0096.coefficient6_12,
    output := OriginalRow227TriangleData0112.coefficient7_12, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root14, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_14, Icur := OriginalRow227TriangleData0096.coefficient6_13,
    output := OriginalRow227TriangleData0112.coefficient7_13, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root15, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_15, Icur := OriginalRow227TriangleData0096.coefficient6_14,
    output := OriginalRow227TriangleData0112.coefficient7_14, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root16, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_16, Icur := OriginalRow227TriangleData0096.coefficient6_15,
    output := OriginalRow227TriangleData0112.coefficient7_15, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root17, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_17, Icur := OriginalRow227TriangleData0096.coefficient6_16,
    output := OriginalRow227TriangleData0112.coefficient7_16, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root18, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_18, Icur := OriginalRow227TriangleData0096.coefficient6_17,
    output := OriginalRow227TriangleData0112.coefficient7_17, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_19, Icur := OriginalRow227TriangleData0096.coefficient6_18,
    output := OriginalRow227TriangleData0112.coefficient7_18, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_20, Icur := OriginalRow227TriangleData0096.coefficient6_19,
    output := OriginalRow227TriangleData0112.coefficient7_19, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_21, Icur := OriginalRow227TriangleData0096.coefficient6_20,
    output := OriginalRow227TriangleData0112.coefficient7_20, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_22, Icur := OriginalRow227TriangleData0096.coefficient6_21,
    output := OriginalRow227TriangleData0112.coefficient7_21, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_23, Icur := OriginalRow227TriangleData0096.coefficient6_22,
    output := OriginalRow227TriangleData0112.coefficient7_22, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_24, Icur := OriginalRow227TriangleData0096.coefficient6_23,
    output := OriginalRow227TriangleData0112.coefficient7_23, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_25, Icur := OriginalRow227TriangleData0096.coefficient6_24,
    output := OriginalRow227TriangleData0112.coefficient7_24, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_26, Icur := OriginalRow227TriangleData0096.coefficient6_25,
    output := OriginalRow227TriangleData0112.coefficient7_25, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_27, Icur := OriginalRow227TriangleData0096.coefficient6_26,
    output := OriginalRow227TriangleData0112.coefficient7_26, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_28, Icur := OriginalRow227TriangleData0096.coefficient6_27,
    output := OriginalRow227TriangleData0112.coefficient7_27, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_29, Icur := OriginalRow227TriangleData0096.coefficient6_28,
    output := OriginalRow227TriangleData0112.coefficient7_28, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_30, Icur := OriginalRow227TriangleData0096.coefficient6_29,
    output := OriginalRow227TriangleData0112.coefficient7_29, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_31, Icur := OriginalRow227TriangleData0096.coefficient6_30,
    output := OriginalRow227TriangleData0112.coefficient7_30, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_32, Icur := OriginalRow227TriangleData0096.coefficient6_31,
    output := OriginalRow227TriangleData0112.coefficient7_31, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_33, Icur := OriginalRow227TriangleData0096.coefficient6_32,
    output := OriginalRow227TriangleData0112.coefficient7_32, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_34, Icur := OriginalRow227TriangleData0096.coefficient6_33,
    output := OriginalRow227TriangleData0112.coefficient7_33, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_35, Icur := OriginalRow227TriangleData0096.coefficient6_34,
    output := OriginalRow227TriangleData0112.coefficient7_34, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0096.coefficient6_36, Icur := OriginalRow227TriangleData0096.coefficient6_35,
    output := OriginalRow227TriangleData0112.coefficient7_35, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0097.coefficient6_37, Icur := OriginalRow227TriangleData0096.coefficient6_36,
    output := OriginalRow227TriangleData0112.coefficient7_36, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0097.coefficient6_38, Icur := OriginalRow227TriangleData0097.coefficient6_37,
    output := OriginalRow227TriangleData0112.coefficient7_37, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0096

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0096.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
