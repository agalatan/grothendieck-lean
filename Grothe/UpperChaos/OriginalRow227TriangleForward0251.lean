import Grothe.UpperChaos.OriginalRow227TriangleData0252
import Grothe.UpperChaos.OriginalRow227TriangleData0253
import Grothe.UpperChaos.OriginalRow227TriangleData0267
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0251
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root17, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_17, Icur := OriginalRow227TriangleData0252.coefficient16_16,
    output := OriginalRow227TriangleData0267.coefficient17_16, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root18, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_18, Icur := OriginalRow227TriangleData0252.coefficient16_17,
    output := OriginalRow227TriangleData0267.coefficient17_17, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_19, Icur := OriginalRow227TriangleData0252.coefficient16_18,
    output := OriginalRow227TriangleData0267.coefficient17_18, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_20, Icur := OriginalRow227TriangleData0252.coefficient16_19,
    output := OriginalRow227TriangleData0267.coefficient17_19, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_21, Icur := OriginalRow227TriangleData0252.coefficient16_20,
    output := OriginalRow227TriangleData0267.coefficient17_20, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_22, Icur := OriginalRow227TriangleData0252.coefficient16_21,
    output := OriginalRow227TriangleData0267.coefficient17_21, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_23, Icur := OriginalRow227TriangleData0252.coefficient16_22,
    output := OriginalRow227TriangleData0267.coefficient17_22, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_24, Icur := OriginalRow227TriangleData0252.coefficient16_23,
    output := OriginalRow227TriangleData0267.coefficient17_23, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_25, Icur := OriginalRow227TriangleData0252.coefficient16_24,
    output := OriginalRow227TriangleData0267.coefficient17_24, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_26, Icur := OriginalRow227TriangleData0252.coefficient16_25,
    output := OriginalRow227TriangleData0267.coefficient17_25, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_27, Icur := OriginalRow227TriangleData0252.coefficient16_26,
    output := OriginalRow227TriangleData0267.coefficient17_26, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_28, Icur := OriginalRow227TriangleData0252.coefficient16_27,
    output := OriginalRow227TriangleData0267.coefficient17_27, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_29, Icur := OriginalRow227TriangleData0252.coefficient16_28,
    output := OriginalRow227TriangleData0267.coefficient17_28, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_30, Icur := OriginalRow227TriangleData0252.coefficient16_29,
    output := OriginalRow227TriangleData0267.coefficient17_29, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_31, Icur := OriginalRow227TriangleData0252.coefficient16_30,
    output := OriginalRow227TriangleData0267.coefficient17_30, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_32, Icur := OriginalRow227TriangleData0252.coefficient16_31,
    output := OriginalRow227TriangleData0267.coefficient17_31, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_33, Icur := OriginalRow227TriangleData0252.coefficient16_32,
    output := OriginalRow227TriangleData0267.coefficient17_32, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_34, Icur := OriginalRow227TriangleData0252.coefficient16_33,
    output := OriginalRow227TriangleData0267.coefficient17_33, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_35, Icur := OriginalRow227TriangleData0252.coefficient16_34,
    output := OriginalRow227TriangleData0267.coefficient17_34, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_36, Icur := OriginalRow227TriangleData0252.coefficient16_35,
    output := OriginalRow227TriangleData0267.coefficient17_35, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_37, Icur := OriginalRow227TriangleData0252.coefficient16_36,
    output := OriginalRow227TriangleData0267.coefficient17_36, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_38, Icur := OriginalRow227TriangleData0252.coefficient16_37,
    output := OriginalRow227TriangleData0267.coefficient17_37, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_39, Icur := OriginalRow227TriangleData0252.coefficient16_38,
    output := OriginalRow227TriangleData0267.coefficient17_38, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_40, Icur := OriginalRow227TriangleData0252.coefficient16_39,
    output := OriginalRow227TriangleData0267.coefficient17_39, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_41, Icur := OriginalRow227TriangleData0252.coefficient16_40,
    output := OriginalRow227TriangleData0267.coefficient17_40, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_42, Icur := OriginalRow227TriangleData0252.coefficient16_41,
    output := OriginalRow227TriangleData0267.coefficient17_41, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_43, Icur := OriginalRow227TriangleData0252.coefficient16_42,
    output := OriginalRow227TriangleData0267.coefficient17_42, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_44, Icur := OriginalRow227TriangleData0252.coefficient16_43,
    output := OriginalRow227TriangleData0267.coefficient17_43, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_45, Icur := OriginalRow227TriangleData0252.coefficient16_44,
    output := OriginalRow227TriangleData0267.coefficient17_44, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0252.coefficient16_46, Icur := OriginalRow227TriangleData0252.coefficient16_45,
    output := OriginalRow227TriangleData0267.coefficient17_45, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_47, Icur := OriginalRow227TriangleData0252.coefficient16_46,
    output := OriginalRow227TriangleData0267.coefficient17_46, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_48, Icur := OriginalRow227TriangleData0253.coefficient16_47,
    output := OriginalRow227TriangleData0267.coefficient17_47, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0251

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0251.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
