import Grothe.UpperChaos.OriginalRow227TriangleData0432
import Grothe.UpperChaos.OriginalRow227TriangleData0433
import Grothe.UpperChaos.OriginalRow227TriangleData0446
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0430
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_29, Icur := OriginalRow227TriangleData0432.coefficient28_28,
    output := OriginalRow227TriangleData0446.coefficient29_28, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_30, Icur := OriginalRow227TriangleData0432.coefficient28_29,
    output := OriginalRow227TriangleData0446.coefficient29_29, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_31, Icur := OriginalRow227TriangleData0432.coefficient28_30,
    output := OriginalRow227TriangleData0446.coefficient29_30, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_32, Icur := OriginalRow227TriangleData0432.coefficient28_31,
    output := OriginalRow227TriangleData0446.coefficient29_31, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_33, Icur := OriginalRow227TriangleData0432.coefficient28_32,
    output := OriginalRow227TriangleData0446.coefficient29_32, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_34, Icur := OriginalRow227TriangleData0432.coefficient28_33,
    output := OriginalRow227TriangleData0446.coefficient29_33, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_35, Icur := OriginalRow227TriangleData0432.coefficient28_34,
    output := OriginalRow227TriangleData0446.coefficient29_34, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_36, Icur := OriginalRow227TriangleData0432.coefficient28_35,
    output := OriginalRow227TriangleData0446.coefficient29_35, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_37, Icur := OriginalRow227TriangleData0432.coefficient28_36,
    output := OriginalRow227TriangleData0446.coefficient29_36, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_38, Icur := OriginalRow227TriangleData0432.coefficient28_37,
    output := OriginalRow227TriangleData0446.coefficient29_37, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_39, Icur := OriginalRow227TriangleData0432.coefficient28_38,
    output := OriginalRow227TriangleData0446.coefficient29_38, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_40, Icur := OriginalRow227TriangleData0432.coefficient28_39,
    output := OriginalRow227TriangleData0446.coefficient29_39, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_41, Icur := OriginalRow227TriangleData0432.coefficient28_40,
    output := OriginalRow227TriangleData0446.coefficient29_40, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_42, Icur := OriginalRow227TriangleData0432.coefficient28_41,
    output := OriginalRow227TriangleData0446.coefficient29_41, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_43, Icur := OriginalRow227TriangleData0432.coefficient28_42,
    output := OriginalRow227TriangleData0446.coefficient29_42, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_44, Icur := OriginalRow227TriangleData0432.coefficient28_43,
    output := OriginalRow227TriangleData0446.coefficient29_43, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_45, Icur := OriginalRow227TriangleData0432.coefficient28_44,
    output := OriginalRow227TriangleData0446.coefficient29_44, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_46, Icur := OriginalRow227TriangleData0432.coefficient28_45,
    output := OriginalRow227TriangleData0446.coefficient29_45, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_47, Icur := OriginalRow227TriangleData0432.coefficient28_46,
    output := OriginalRow227TriangleData0446.coefficient29_46, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_48, Icur := OriginalRow227TriangleData0432.coefficient28_47,
    output := OriginalRow227TriangleData0446.coefficient29_47, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_49, Icur := OriginalRow227TriangleData0432.coefficient28_48,
    output := OriginalRow227TriangleData0446.coefficient29_48, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_50, Icur := OriginalRow227TriangleData0432.coefficient28_49,
    output := OriginalRow227TriangleData0446.coefficient29_49, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_51, Icur := OriginalRow227TriangleData0432.coefficient28_50,
    output := OriginalRow227TriangleData0446.coefficient29_50, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_52, Icur := OriginalRow227TriangleData0432.coefficient28_51,
    output := OriginalRow227TriangleData0446.coefficient29_51, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_53, Icur := OriginalRow227TriangleData0432.coefficient28_52,
    output := OriginalRow227TriangleData0446.coefficient29_52, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_54, Icur := OriginalRow227TriangleData0432.coefficient28_53,
    output := OriginalRow227TriangleData0446.coefficient29_53, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_55, Icur := OriginalRow227TriangleData0432.coefficient28_54,
    output := OriginalRow227TriangleData0446.coefficient29_54, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_56, Icur := OriginalRow227TriangleData0432.coefficient28_55,
    output := OriginalRow227TriangleData0446.coefficient29_55, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_57, Icur := OriginalRow227TriangleData0432.coefficient28_56,
    output := OriginalRow227TriangleData0446.coefficient29_56, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0432.coefficient28_58, Icur := OriginalRow227TriangleData0432.coefficient28_57,
    output := OriginalRow227TriangleData0446.coefficient29_57, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0433.coefficient28_59, Icur := OriginalRow227TriangleData0432.coefficient28_58,
    output := OriginalRow227TriangleData0446.coefficient29_58, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0433.coefficient28_60, Icur := OriginalRow227TriangleData0433.coefficient28_59,
    output := OriginalRow227TriangleData0446.coefficient29_59, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0430

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0430.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
