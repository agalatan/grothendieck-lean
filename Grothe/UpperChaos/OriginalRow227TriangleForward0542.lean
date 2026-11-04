import Grothe.UpperChaos.OriginalRow227TriangleData0544
import Grothe.UpperChaos.OriginalRow227TriangleData0545
import Grothe.UpperChaos.OriginalRow227TriangleData0558
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0542
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_37, Icur := OriginalRow227TriangleData0544.coefficient36_36,
    output := OriginalRow227TriangleData0558.coefficient37_36, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_38, Icur := OriginalRow227TriangleData0544.coefficient36_37,
    output := OriginalRow227TriangleData0558.coefficient37_37, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_39, Icur := OriginalRow227TriangleData0544.coefficient36_38,
    output := OriginalRow227TriangleData0558.coefficient37_38, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_40, Icur := OriginalRow227TriangleData0544.coefficient36_39,
    output := OriginalRow227TriangleData0558.coefficient37_39, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_41, Icur := OriginalRow227TriangleData0544.coefficient36_40,
    output := OriginalRow227TriangleData0558.coefficient37_40, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_42, Icur := OriginalRow227TriangleData0544.coefficient36_41,
    output := OriginalRow227TriangleData0558.coefficient37_41, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_43, Icur := OriginalRow227TriangleData0544.coefficient36_42,
    output := OriginalRow227TriangleData0558.coefficient37_42, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_44, Icur := OriginalRow227TriangleData0544.coefficient36_43,
    output := OriginalRow227TriangleData0558.coefficient37_43, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_45, Icur := OriginalRow227TriangleData0544.coefficient36_44,
    output := OriginalRow227TriangleData0558.coefficient37_44, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_46, Icur := OriginalRow227TriangleData0544.coefficient36_45,
    output := OriginalRow227TriangleData0558.coefficient37_45, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_47, Icur := OriginalRow227TriangleData0544.coefficient36_46,
    output := OriginalRow227TriangleData0558.coefficient37_46, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_48, Icur := OriginalRow227TriangleData0544.coefficient36_47,
    output := OriginalRow227TriangleData0558.coefficient37_47, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_49, Icur := OriginalRow227TriangleData0544.coefficient36_48,
    output := OriginalRow227TriangleData0558.coefficient37_48, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_50, Icur := OriginalRow227TriangleData0544.coefficient36_49,
    output := OriginalRow227TriangleData0558.coefficient37_49, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_51, Icur := OriginalRow227TriangleData0544.coefficient36_50,
    output := OriginalRow227TriangleData0558.coefficient37_50, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_52, Icur := OriginalRow227TriangleData0544.coefficient36_51,
    output := OriginalRow227TriangleData0558.coefficient37_51, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_53, Icur := OriginalRow227TriangleData0544.coefficient36_52,
    output := OriginalRow227TriangleData0558.coefficient37_52, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_54, Icur := OriginalRow227TriangleData0544.coefficient36_53,
    output := OriginalRow227TriangleData0558.coefficient37_53, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_55, Icur := OriginalRow227TriangleData0544.coefficient36_54,
    output := OriginalRow227TriangleData0558.coefficient37_54, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_56, Icur := OriginalRow227TriangleData0544.coefficient36_55,
    output := OriginalRow227TriangleData0558.coefficient37_55, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_57, Icur := OriginalRow227TriangleData0544.coefficient36_56,
    output := OriginalRow227TriangleData0558.coefficient37_56, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_58, Icur := OriginalRow227TriangleData0544.coefficient36_57,
    output := OriginalRow227TriangleData0558.coefficient37_57, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_59, Icur := OriginalRow227TriangleData0544.coefficient36_58,
    output := OriginalRow227TriangleData0558.coefficient37_58, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_60, Icur := OriginalRow227TriangleData0544.coefficient36_59,
    output := OriginalRow227TriangleData0558.coefficient37_59, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_61, Icur := OriginalRow227TriangleData0544.coefficient36_60,
    output := OriginalRow227TriangleData0558.coefficient37_60, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_62, Icur := OriginalRow227TriangleData0544.coefficient36_61,
    output := OriginalRow227TriangleData0558.coefficient37_61, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_63, Icur := OriginalRow227TriangleData0544.coefficient36_62,
    output := OriginalRow227TriangleData0558.coefficient37_62, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_64, Icur := OriginalRow227TriangleData0544.coefficient36_63,
    output := OriginalRow227TriangleData0558.coefficient37_63, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_65, Icur := OriginalRow227TriangleData0544.coefficient36_64,
    output := OriginalRow227TriangleData0558.coefficient37_64, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0544.coefficient36_66, Icur := OriginalRow227TriangleData0544.coefficient36_65,
    output := OriginalRow227TriangleData0558.coefficient37_65, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0545.coefficient36_67, Icur := OriginalRow227TriangleData0544.coefficient36_66,
    output := OriginalRow227TriangleData0558.coefficient37_66, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0545.coefficient36_68, Icur := OriginalRow227TriangleData0545.coefficient36_67,
    output := OriginalRow227TriangleData0558.coefficient37_67, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0542

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0542.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
