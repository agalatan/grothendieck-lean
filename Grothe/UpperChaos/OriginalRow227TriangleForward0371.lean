import Grothe.UpperChaos.OriginalRow227TriangleData0372
import Grothe.UpperChaos.OriginalRow227TriangleData0373
import Grothe.UpperChaos.OriginalRow227TriangleData0387
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0371
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_25, Icur := OriginalRow227TriangleData0372.coefficient24_24,
    output := OriginalRow227TriangleData0387.coefficient25_24, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_26, Icur := OriginalRow227TriangleData0372.coefficient24_25,
    output := OriginalRow227TriangleData0387.coefficient25_25, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_27, Icur := OriginalRow227TriangleData0372.coefficient24_26,
    output := OriginalRow227TriangleData0387.coefficient25_26, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_28, Icur := OriginalRow227TriangleData0372.coefficient24_27,
    output := OriginalRow227TriangleData0387.coefficient25_27, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_29, Icur := OriginalRow227TriangleData0372.coefficient24_28,
    output := OriginalRow227TriangleData0387.coefficient25_28, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_30, Icur := OriginalRow227TriangleData0372.coefficient24_29,
    output := OriginalRow227TriangleData0387.coefficient25_29, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_31, Icur := OriginalRow227TriangleData0372.coefficient24_30,
    output := OriginalRow227TriangleData0387.coefficient25_30, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_32, Icur := OriginalRow227TriangleData0372.coefficient24_31,
    output := OriginalRow227TriangleData0387.coefficient25_31, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_33, Icur := OriginalRow227TriangleData0372.coefficient24_32,
    output := OriginalRow227TriangleData0387.coefficient25_32, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_34, Icur := OriginalRow227TriangleData0372.coefficient24_33,
    output := OriginalRow227TriangleData0387.coefficient25_33, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_35, Icur := OriginalRow227TriangleData0372.coefficient24_34,
    output := OriginalRow227TriangleData0387.coefficient25_34, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_36, Icur := OriginalRow227TriangleData0372.coefficient24_35,
    output := OriginalRow227TriangleData0387.coefficient25_35, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_37, Icur := OriginalRow227TriangleData0372.coefficient24_36,
    output := OriginalRow227TriangleData0387.coefficient25_36, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_38, Icur := OriginalRow227TriangleData0372.coefficient24_37,
    output := OriginalRow227TriangleData0387.coefficient25_37, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_39, Icur := OriginalRow227TriangleData0372.coefficient24_38,
    output := OriginalRow227TriangleData0387.coefficient25_38, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_40, Icur := OriginalRow227TriangleData0372.coefficient24_39,
    output := OriginalRow227TriangleData0387.coefficient25_39, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_41, Icur := OriginalRow227TriangleData0372.coefficient24_40,
    output := OriginalRow227TriangleData0387.coefficient25_40, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_42, Icur := OriginalRow227TriangleData0372.coefficient24_41,
    output := OriginalRow227TriangleData0387.coefficient25_41, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_43, Icur := OriginalRow227TriangleData0372.coefficient24_42,
    output := OriginalRow227TriangleData0387.coefficient25_42, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_44, Icur := OriginalRow227TriangleData0372.coefficient24_43,
    output := OriginalRow227TriangleData0387.coefficient25_43, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_45, Icur := OriginalRow227TriangleData0372.coefficient24_44,
    output := OriginalRow227TriangleData0387.coefficient25_44, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_46, Icur := OriginalRow227TriangleData0372.coefficient24_45,
    output := OriginalRow227TriangleData0387.coefficient25_45, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_47, Icur := OriginalRow227TriangleData0372.coefficient24_46,
    output := OriginalRow227TriangleData0387.coefficient25_46, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_48, Icur := OriginalRow227TriangleData0372.coefficient24_47,
    output := OriginalRow227TriangleData0387.coefficient25_47, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_49, Icur := OriginalRow227TriangleData0372.coefficient24_48,
    output := OriginalRow227TriangleData0387.coefficient25_48, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_50, Icur := OriginalRow227TriangleData0372.coefficient24_49,
    output := OriginalRow227TriangleData0387.coefficient25_49, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_51, Icur := OriginalRow227TriangleData0372.coefficient24_50,
    output := OriginalRow227TriangleData0387.coefficient25_50, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_52, Icur := OriginalRow227TriangleData0372.coefficient24_51,
    output := OriginalRow227TriangleData0387.coefficient25_51, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_53, Icur := OriginalRow227TriangleData0372.coefficient24_52,
    output := OriginalRow227TriangleData0387.coefficient25_52, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0372.coefficient24_54, Icur := OriginalRow227TriangleData0372.coefficient24_53,
    output := OriginalRow227TriangleData0387.coefficient25_53, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0373.coefficient24_55, Icur := OriginalRow227TriangleData0372.coefficient24_54,
    output := OriginalRow227TriangleData0387.coefficient25_54, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0373.coefficient24_56, Icur := OriginalRow227TriangleData0373.coefficient24_55,
    output := OriginalRow227TriangleData0387.coefficient25_55, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0371

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0371.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
