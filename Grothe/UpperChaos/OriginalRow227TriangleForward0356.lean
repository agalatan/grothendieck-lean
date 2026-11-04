import Grothe.UpperChaos.OriginalRow227TriangleData0357
import Grothe.UpperChaos.OriginalRow227TriangleData0358
import Grothe.UpperChaos.OriginalRow227TriangleData0372
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0356
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_24, Icur := OriginalRow227TriangleData0357.coefficient23_23,
    output := OriginalRow227TriangleData0372.coefficient24_23, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_25, Icur := OriginalRow227TriangleData0357.coefficient23_24,
    output := OriginalRow227TriangleData0372.coefficient24_24, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_26, Icur := OriginalRow227TriangleData0357.coefficient23_25,
    output := OriginalRow227TriangleData0372.coefficient24_25, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_27, Icur := OriginalRow227TriangleData0357.coefficient23_26,
    output := OriginalRow227TriangleData0372.coefficient24_26, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_28, Icur := OriginalRow227TriangleData0357.coefficient23_27,
    output := OriginalRow227TriangleData0372.coefficient24_27, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_29, Icur := OriginalRow227TriangleData0357.coefficient23_28,
    output := OriginalRow227TriangleData0372.coefficient24_28, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_30, Icur := OriginalRow227TriangleData0357.coefficient23_29,
    output := OriginalRow227TriangleData0372.coefficient24_29, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_31, Icur := OriginalRow227TriangleData0357.coefficient23_30,
    output := OriginalRow227TriangleData0372.coefficient24_30, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_32, Icur := OriginalRow227TriangleData0357.coefficient23_31,
    output := OriginalRow227TriangleData0372.coefficient24_31, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_33, Icur := OriginalRow227TriangleData0357.coefficient23_32,
    output := OriginalRow227TriangleData0372.coefficient24_32, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_34, Icur := OriginalRow227TriangleData0357.coefficient23_33,
    output := OriginalRow227TriangleData0372.coefficient24_33, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_35, Icur := OriginalRow227TriangleData0357.coefficient23_34,
    output := OriginalRow227TriangleData0372.coefficient24_34, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_36, Icur := OriginalRow227TriangleData0357.coefficient23_35,
    output := OriginalRow227TriangleData0372.coefficient24_35, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_37, Icur := OriginalRow227TriangleData0357.coefficient23_36,
    output := OriginalRow227TriangleData0372.coefficient24_36, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_38, Icur := OriginalRow227TriangleData0357.coefficient23_37,
    output := OriginalRow227TriangleData0372.coefficient24_37, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_39, Icur := OriginalRow227TriangleData0357.coefficient23_38,
    output := OriginalRow227TriangleData0372.coefficient24_38, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_40, Icur := OriginalRow227TriangleData0357.coefficient23_39,
    output := OriginalRow227TriangleData0372.coefficient24_39, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_41, Icur := OriginalRow227TriangleData0357.coefficient23_40,
    output := OriginalRow227TriangleData0372.coefficient24_40, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_42, Icur := OriginalRow227TriangleData0357.coefficient23_41,
    output := OriginalRow227TriangleData0372.coefficient24_41, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_43, Icur := OriginalRow227TriangleData0357.coefficient23_42,
    output := OriginalRow227TriangleData0372.coefficient24_42, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_44, Icur := OriginalRow227TriangleData0357.coefficient23_43,
    output := OriginalRow227TriangleData0372.coefficient24_43, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_45, Icur := OriginalRow227TriangleData0357.coefficient23_44,
    output := OriginalRow227TriangleData0372.coefficient24_44, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_46, Icur := OriginalRow227TriangleData0357.coefficient23_45,
    output := OriginalRow227TriangleData0372.coefficient24_45, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_47, Icur := OriginalRow227TriangleData0357.coefficient23_46,
    output := OriginalRow227TriangleData0372.coefficient24_46, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_48, Icur := OriginalRow227TriangleData0357.coefficient23_47,
    output := OriginalRow227TriangleData0372.coefficient24_47, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_49, Icur := OriginalRow227TriangleData0357.coefficient23_48,
    output := OriginalRow227TriangleData0372.coefficient24_48, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_50, Icur := OriginalRow227TriangleData0357.coefficient23_49,
    output := OriginalRow227TriangleData0372.coefficient24_49, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_51, Icur := OriginalRow227TriangleData0357.coefficient23_50,
    output := OriginalRow227TriangleData0372.coefficient24_50, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_52, Icur := OriginalRow227TriangleData0357.coefficient23_51,
    output := OriginalRow227TriangleData0372.coefficient24_51, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0357.coefficient23_53, Icur := OriginalRow227TriangleData0357.coefficient23_52,
    output := OriginalRow227TriangleData0372.coefficient24_52, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0358.coefficient23_54, Icur := OriginalRow227TriangleData0357.coefficient23_53,
    output := OriginalRow227TriangleData0372.coefficient24_53, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0358.coefficient23_55, Icur := OriginalRow227TriangleData0358.coefficient23_54,
    output := OriginalRow227TriangleData0372.coefficient24_54, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0356

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0356.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
