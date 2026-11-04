import Grothe.UpperChaos.OriginalRow227TriangleData0572
import Grothe.UpperChaos.OriginalRow227TriangleData0573
import Grothe.UpperChaos.OriginalRow227TriangleData0586
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0570
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_39, Icur := OriginalRow227TriangleData0572.coefficient38_38,
    output := OriginalRow227TriangleData0586.coefficient39_38, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_40, Icur := OriginalRow227TriangleData0572.coefficient38_39,
    output := OriginalRow227TriangleData0586.coefficient39_39, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_41, Icur := OriginalRow227TriangleData0572.coefficient38_40,
    output := OriginalRow227TriangleData0586.coefficient39_40, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_42, Icur := OriginalRow227TriangleData0572.coefficient38_41,
    output := OriginalRow227TriangleData0586.coefficient39_41, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_43, Icur := OriginalRow227TriangleData0572.coefficient38_42,
    output := OriginalRow227TriangleData0586.coefficient39_42, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_44, Icur := OriginalRow227TriangleData0572.coefficient38_43,
    output := OriginalRow227TriangleData0586.coefficient39_43, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_45, Icur := OriginalRow227TriangleData0572.coefficient38_44,
    output := OriginalRow227TriangleData0586.coefficient39_44, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_46, Icur := OriginalRow227TriangleData0572.coefficient38_45,
    output := OriginalRow227TriangleData0586.coefficient39_45, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_47, Icur := OriginalRow227TriangleData0572.coefficient38_46,
    output := OriginalRow227TriangleData0586.coefficient39_46, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_48, Icur := OriginalRow227TriangleData0572.coefficient38_47,
    output := OriginalRow227TriangleData0586.coefficient39_47, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_49, Icur := OriginalRow227TriangleData0572.coefficient38_48,
    output := OriginalRow227TriangleData0586.coefficient39_48, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_50, Icur := OriginalRow227TriangleData0572.coefficient38_49,
    output := OriginalRow227TriangleData0586.coefficient39_49, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_51, Icur := OriginalRow227TriangleData0572.coefficient38_50,
    output := OriginalRow227TriangleData0586.coefficient39_50, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_52, Icur := OriginalRow227TriangleData0572.coefficient38_51,
    output := OriginalRow227TriangleData0586.coefficient39_51, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_53, Icur := OriginalRow227TriangleData0572.coefficient38_52,
    output := OriginalRow227TriangleData0586.coefficient39_52, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_54, Icur := OriginalRow227TriangleData0572.coefficient38_53,
    output := OriginalRow227TriangleData0586.coefficient39_53, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_55, Icur := OriginalRow227TriangleData0572.coefficient38_54,
    output := OriginalRow227TriangleData0586.coefficient39_54, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_56, Icur := OriginalRow227TriangleData0572.coefficient38_55,
    output := OriginalRow227TriangleData0586.coefficient39_55, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_57, Icur := OriginalRow227TriangleData0572.coefficient38_56,
    output := OriginalRow227TriangleData0586.coefficient39_56, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_58, Icur := OriginalRow227TriangleData0572.coefficient38_57,
    output := OriginalRow227TriangleData0586.coefficient39_57, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_59, Icur := OriginalRow227TriangleData0572.coefficient38_58,
    output := OriginalRow227TriangleData0586.coefficient39_58, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_60, Icur := OriginalRow227TriangleData0572.coefficient38_59,
    output := OriginalRow227TriangleData0586.coefficient39_59, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_61, Icur := OriginalRow227TriangleData0572.coefficient38_60,
    output := OriginalRow227TriangleData0586.coefficient39_60, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_62, Icur := OriginalRow227TriangleData0572.coefficient38_61,
    output := OriginalRow227TriangleData0586.coefficient39_61, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_63, Icur := OriginalRow227TriangleData0572.coefficient38_62,
    output := OriginalRow227TriangleData0586.coefficient39_62, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_64, Icur := OriginalRow227TriangleData0572.coefficient38_63,
    output := OriginalRow227TriangleData0586.coefficient39_63, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_65, Icur := OriginalRow227TriangleData0572.coefficient38_64,
    output := OriginalRow227TriangleData0586.coefficient39_64, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_66, Icur := OriginalRow227TriangleData0572.coefficient38_65,
    output := OriginalRow227TriangleData0586.coefficient39_65, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_67, Icur := OriginalRow227TriangleData0572.coefficient38_66,
    output := OriginalRow227TriangleData0586.coefficient39_66, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0572.coefficient38_68, Icur := OriginalRow227TriangleData0572.coefficient38_67,
    output := OriginalRow227TriangleData0586.coefficient39_67, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0573.coefficient38_69, Icur := OriginalRow227TriangleData0572.coefficient38_68,
    output := OriginalRow227TriangleData0586.coefficient39_68, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0573.coefficient38_70, Icur := OriginalRow227TriangleData0573.coefficient38_69,
    output := OriginalRow227TriangleData0586.coefficient39_69, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0570

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0570.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
