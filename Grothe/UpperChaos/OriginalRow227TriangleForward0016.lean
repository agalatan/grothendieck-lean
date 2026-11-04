import Grothe.UpperChaos.OriginalRow227TriangleData0016
import Grothe.UpperChaos.OriginalRow227TriangleData0017
import Grothe.UpperChaos.OriginalRow227TriangleData0032
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0016
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root2, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_2, Icur := OriginalRow227TriangleData0016.coefficient1_1,
    output := OriginalRow227TriangleData0032.coefficient2_1, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root3, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_3, Icur := OriginalRow227TriangleData0016.coefficient1_2,
    output := OriginalRow227TriangleData0032.coefficient2_2, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root4, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_4, Icur := OriginalRow227TriangleData0016.coefficient1_3,
    output := OriginalRow227TriangleData0032.coefficient2_3, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root5, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_5, Icur := OriginalRow227TriangleData0016.coefficient1_4,
    output := OriginalRow227TriangleData0032.coefficient2_4, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root6, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_6, Icur := OriginalRow227TriangleData0016.coefficient1_5,
    output := OriginalRow227TriangleData0032.coefficient2_5, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root7, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_7, Icur := OriginalRow227TriangleData0016.coefficient1_6,
    output := OriginalRow227TriangleData0032.coefficient2_6, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root8, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_8, Icur := OriginalRow227TriangleData0016.coefficient1_7,
    output := OriginalRow227TriangleData0032.coefficient2_7, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root9, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_9, Icur := OriginalRow227TriangleData0016.coefficient1_8,
    output := OriginalRow227TriangleData0032.coefficient2_8, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root10, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_10, Icur := OriginalRow227TriangleData0016.coefficient1_9,
    output := OriginalRow227TriangleData0032.coefficient2_9, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root11, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_11, Icur := OriginalRow227TriangleData0016.coefficient1_10,
    output := OriginalRow227TriangleData0032.coefficient2_10, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root12, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_12, Icur := OriginalRow227TriangleData0016.coefficient1_11,
    output := OriginalRow227TriangleData0032.coefficient2_11, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root13, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_13, Icur := OriginalRow227TriangleData0016.coefficient1_12,
    output := OriginalRow227TriangleData0032.coefficient2_12, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root14, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_14, Icur := OriginalRow227TriangleData0016.coefficient1_13,
    output := OriginalRow227TriangleData0032.coefficient2_13, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root15, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_15, Icur := OriginalRow227TriangleData0016.coefficient1_14,
    output := OriginalRow227TriangleData0032.coefficient2_14, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots00.root16, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_16, Icur := OriginalRow227TriangleData0016.coefficient1_15,
    output := OriginalRow227TriangleData0032.coefficient2_15, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots00.root17, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_17, Icur := OriginalRow227TriangleData0016.coefficient1_16,
    output := OriginalRow227TriangleData0032.coefficient2_16, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots00.root18, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_18, Icur := OriginalRow227TriangleData0016.coefficient1_17,
    output := OriginalRow227TriangleData0032.coefficient2_17, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_19, Icur := OriginalRow227TriangleData0016.coefficient1_18,
    output := OriginalRow227TriangleData0032.coefficient2_18, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_20, Icur := OriginalRow227TriangleData0016.coefficient1_19,
    output := OriginalRow227TriangleData0032.coefficient2_19, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_21, Icur := OriginalRow227TriangleData0016.coefficient1_20,
    output := OriginalRow227TriangleData0032.coefficient2_20, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_22, Icur := OriginalRow227TriangleData0016.coefficient1_21,
    output := OriginalRow227TriangleData0032.coefficient2_21, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_23, Icur := OriginalRow227TriangleData0016.coefficient1_22,
    output := OriginalRow227TriangleData0032.coefficient2_22, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_24, Icur := OriginalRow227TriangleData0016.coefficient1_23,
    output := OriginalRow227TriangleData0032.coefficient2_23, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_25, Icur := OriginalRow227TriangleData0016.coefficient1_24,
    output := OriginalRow227TriangleData0032.coefficient2_24, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_26, Icur := OriginalRow227TriangleData0016.coefficient1_25,
    output := OriginalRow227TriangleData0032.coefficient2_25, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_27, Icur := OriginalRow227TriangleData0016.coefficient1_26,
    output := OriginalRow227TriangleData0032.coefficient2_26, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_28, Icur := OriginalRow227TriangleData0016.coefficient1_27,
    output := OriginalRow227TriangleData0032.coefficient2_27, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_29, Icur := OriginalRow227TriangleData0016.coefficient1_28,
    output := OriginalRow227TriangleData0032.coefficient2_28, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_30, Icur := OriginalRow227TriangleData0016.coefficient1_29,
    output := OriginalRow227TriangleData0032.coefficient2_29, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0016.coefficient1_31, Icur := OriginalRow227TriangleData0016.coefficient1_30,
    output := OriginalRow227TriangleData0032.coefficient2_30, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0017.coefficient1_32, Icur := OriginalRow227TriangleData0016.coefficient1_31,
    output := OriginalRow227TriangleData0032.coefficient2_31, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0017.coefficient1_33, Icur := OriginalRow227TriangleData0017.coefficient1_32,
    output := OriginalRow227TriangleData0032.coefficient2_32, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0016

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0016.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
