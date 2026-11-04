import Grothe.UpperChaos.OriginalRow227TriangleData0048
import Grothe.UpperChaos.OriginalRow227TriangleData0049
import Grothe.UpperChaos.OriginalRow227TriangleData0064
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0048
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root4, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_4, Icur := OriginalRow227TriangleData0048.coefficient3_3,
    output := OriginalRow227TriangleData0064.coefficient4_3, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root5, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_5, Icur := OriginalRow227TriangleData0048.coefficient3_4,
    output := OriginalRow227TriangleData0064.coefficient4_4, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root6, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_6, Icur := OriginalRow227TriangleData0048.coefficient3_5,
    output := OriginalRow227TriangleData0064.coefficient4_5, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root7, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_7, Icur := OriginalRow227TriangleData0048.coefficient3_6,
    output := OriginalRow227TriangleData0064.coefficient4_6, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root8, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_8, Icur := OriginalRow227TriangleData0048.coefficient3_7,
    output := OriginalRow227TriangleData0064.coefficient4_7, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root9, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_9, Icur := OriginalRow227TriangleData0048.coefficient3_8,
    output := OriginalRow227TriangleData0064.coefficient4_8, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root10, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_10, Icur := OriginalRow227TriangleData0048.coefficient3_9,
    output := OriginalRow227TriangleData0064.coefficient4_9, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root11, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_11, Icur := OriginalRow227TriangleData0048.coefficient3_10,
    output := OriginalRow227TriangleData0064.coefficient4_10, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root12, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_12, Icur := OriginalRow227TriangleData0048.coefficient3_11,
    output := OriginalRow227TriangleData0064.coefficient4_11, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root13, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_13, Icur := OriginalRow227TriangleData0048.coefficient3_12,
    output := OriginalRow227TriangleData0064.coefficient4_12, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root14, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_14, Icur := OriginalRow227TriangleData0048.coefficient3_13,
    output := OriginalRow227TriangleData0064.coefficient4_13, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root15, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_15, Icur := OriginalRow227TriangleData0048.coefficient3_14,
    output := OriginalRow227TriangleData0064.coefficient4_14, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root16, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_16, Icur := OriginalRow227TriangleData0048.coefficient3_15,
    output := OriginalRow227TriangleData0064.coefficient4_15, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root17, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_17, Icur := OriginalRow227TriangleData0048.coefficient3_16,
    output := OriginalRow227TriangleData0064.coefficient4_16, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots00.root18, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_18, Icur := OriginalRow227TriangleData0048.coefficient3_17,
    output := OriginalRow227TriangleData0064.coefficient4_17, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_19, Icur := OriginalRow227TriangleData0048.coefficient3_18,
    output := OriginalRow227TriangleData0064.coefficient4_18, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_20, Icur := OriginalRow227TriangleData0048.coefficient3_19,
    output := OriginalRow227TriangleData0064.coefficient4_19, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_21, Icur := OriginalRow227TriangleData0048.coefficient3_20,
    output := OriginalRow227TriangleData0064.coefficient4_20, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_22, Icur := OriginalRow227TriangleData0048.coefficient3_21,
    output := OriginalRow227TriangleData0064.coefficient4_21, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_23, Icur := OriginalRow227TriangleData0048.coefficient3_22,
    output := OriginalRow227TriangleData0064.coefficient4_22, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_24, Icur := OriginalRow227TriangleData0048.coefficient3_23,
    output := OriginalRow227TriangleData0064.coefficient4_23, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_25, Icur := OriginalRow227TriangleData0048.coefficient3_24,
    output := OriginalRow227TriangleData0064.coefficient4_24, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_26, Icur := OriginalRow227TriangleData0048.coefficient3_25,
    output := OriginalRow227TriangleData0064.coefficient4_25, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_27, Icur := OriginalRow227TriangleData0048.coefficient3_26,
    output := OriginalRow227TriangleData0064.coefficient4_26, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_28, Icur := OriginalRow227TriangleData0048.coefficient3_27,
    output := OriginalRow227TriangleData0064.coefficient4_27, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_29, Icur := OriginalRow227TriangleData0048.coefficient3_28,
    output := OriginalRow227TriangleData0064.coefficient4_28, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_30, Icur := OriginalRow227TriangleData0048.coefficient3_29,
    output := OriginalRow227TriangleData0064.coefficient4_29, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_31, Icur := OriginalRow227TriangleData0048.coefficient3_30,
    output := OriginalRow227TriangleData0064.coefficient4_30, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_32, Icur := OriginalRow227TriangleData0048.coefficient3_31,
    output := OriginalRow227TriangleData0064.coefficient4_31, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0048.coefficient3_33, Icur := OriginalRow227TriangleData0048.coefficient3_32,
    output := OriginalRow227TriangleData0064.coefficient4_32, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_34, Icur := OriginalRow227TriangleData0048.coefficient3_33,
    output := OriginalRow227TriangleData0064.coefficient4_33, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_35, Icur := OriginalRow227TriangleData0049.coefficient3_34,
    output := OriginalRow227TriangleData0064.coefficient4_34, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0048

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0048.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
