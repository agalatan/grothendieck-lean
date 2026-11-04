import Grothe.UpperChaos.OriginalRow227TriangleData0530
import Grothe.UpperChaos.OriginalRow227TriangleData0531
import Grothe.UpperChaos.OriginalRow227TriangleData0544
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0528
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_36, Icur := OriginalRow227TriangleData0530.coefficient35_35,
    output := OriginalRow227TriangleData0544.coefficient36_35, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_37, Icur := OriginalRow227TriangleData0530.coefficient35_36,
    output := OriginalRow227TriangleData0544.coefficient36_36, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_38, Icur := OriginalRow227TriangleData0530.coefficient35_37,
    output := OriginalRow227TriangleData0544.coefficient36_37, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_39, Icur := OriginalRow227TriangleData0530.coefficient35_38,
    output := OriginalRow227TriangleData0544.coefficient36_38, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_40, Icur := OriginalRow227TriangleData0530.coefficient35_39,
    output := OriginalRow227TriangleData0544.coefficient36_39, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_41, Icur := OriginalRow227TriangleData0530.coefficient35_40,
    output := OriginalRow227TriangleData0544.coefficient36_40, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_42, Icur := OriginalRow227TriangleData0530.coefficient35_41,
    output := OriginalRow227TriangleData0544.coefficient36_41, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_43, Icur := OriginalRow227TriangleData0530.coefficient35_42,
    output := OriginalRow227TriangleData0544.coefficient36_42, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_44, Icur := OriginalRow227TriangleData0530.coefficient35_43,
    output := OriginalRow227TriangleData0544.coefficient36_43, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_45, Icur := OriginalRow227TriangleData0530.coefficient35_44,
    output := OriginalRow227TriangleData0544.coefficient36_44, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_46, Icur := OriginalRow227TriangleData0530.coefficient35_45,
    output := OriginalRow227TriangleData0544.coefficient36_45, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_47, Icur := OriginalRow227TriangleData0530.coefficient35_46,
    output := OriginalRow227TriangleData0544.coefficient36_46, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_48, Icur := OriginalRow227TriangleData0530.coefficient35_47,
    output := OriginalRow227TriangleData0544.coefficient36_47, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_49, Icur := OriginalRow227TriangleData0530.coefficient35_48,
    output := OriginalRow227TriangleData0544.coefficient36_48, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_50, Icur := OriginalRow227TriangleData0530.coefficient35_49,
    output := OriginalRow227TriangleData0544.coefficient36_49, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_51, Icur := OriginalRow227TriangleData0530.coefficient35_50,
    output := OriginalRow227TriangleData0544.coefficient36_50, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_52, Icur := OriginalRow227TriangleData0530.coefficient35_51,
    output := OriginalRow227TriangleData0544.coefficient36_51, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_53, Icur := OriginalRow227TriangleData0530.coefficient35_52,
    output := OriginalRow227TriangleData0544.coefficient36_52, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_54, Icur := OriginalRow227TriangleData0530.coefficient35_53,
    output := OriginalRow227TriangleData0544.coefficient36_53, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_55, Icur := OriginalRow227TriangleData0530.coefficient35_54,
    output := OriginalRow227TriangleData0544.coefficient36_54, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_56, Icur := OriginalRow227TriangleData0530.coefficient35_55,
    output := OriginalRow227TriangleData0544.coefficient36_55, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_57, Icur := OriginalRow227TriangleData0530.coefficient35_56,
    output := OriginalRow227TriangleData0544.coefficient36_56, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_58, Icur := OriginalRow227TriangleData0530.coefficient35_57,
    output := OriginalRow227TriangleData0544.coefficient36_57, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_59, Icur := OriginalRow227TriangleData0530.coefficient35_58,
    output := OriginalRow227TriangleData0544.coefficient36_58, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_60, Icur := OriginalRow227TriangleData0530.coefficient35_59,
    output := OriginalRow227TriangleData0544.coefficient36_59, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_61, Icur := OriginalRow227TriangleData0530.coefficient35_60,
    output := OriginalRow227TriangleData0544.coefficient36_60, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_62, Icur := OriginalRow227TriangleData0530.coefficient35_61,
    output := OriginalRow227TriangleData0544.coefficient36_61, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_63, Icur := OriginalRow227TriangleData0530.coefficient35_62,
    output := OriginalRow227TriangleData0544.coefficient36_62, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_64, Icur := OriginalRow227TriangleData0530.coefficient35_63,
    output := OriginalRow227TriangleData0544.coefficient36_63, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0530.coefficient35_65, Icur := OriginalRow227TriangleData0530.coefficient35_64,
    output := OriginalRow227TriangleData0544.coefficient36_64, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_66, Icur := OriginalRow227TriangleData0530.coefficient35_65,
    output := OriginalRow227TriangleData0544.coefficient36_65, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0531.coefficient35_67, Icur := OriginalRow227TriangleData0531.coefficient35_66,
    output := OriginalRow227TriangleData0544.coefficient36_66, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0528

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0528.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
