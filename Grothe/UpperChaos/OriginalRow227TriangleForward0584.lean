import Grothe.UpperChaos.OriginalRow227TriangleData0586
import Grothe.UpperChaos.OriginalRow227TriangleData0587
import Grothe.UpperChaos.OriginalRow227TriangleData0600
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0584
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_40, Icur := OriginalRow227TriangleData0586.coefficient39_39,
    output := OriginalRow227TriangleData0600.coefficient40_39, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_41, Icur := OriginalRow227TriangleData0586.coefficient39_40,
    output := OriginalRow227TriangleData0600.coefficient40_40, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_42, Icur := OriginalRow227TriangleData0586.coefficient39_41,
    output := OriginalRow227TriangleData0600.coefficient40_41, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_43, Icur := OriginalRow227TriangleData0586.coefficient39_42,
    output := OriginalRow227TriangleData0600.coefficient40_42, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_44, Icur := OriginalRow227TriangleData0586.coefficient39_43,
    output := OriginalRow227TriangleData0600.coefficient40_43, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_45, Icur := OriginalRow227TriangleData0586.coefficient39_44,
    output := OriginalRow227TriangleData0600.coefficient40_44, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_46, Icur := OriginalRow227TriangleData0586.coefficient39_45,
    output := OriginalRow227TriangleData0600.coefficient40_45, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_47, Icur := OriginalRow227TriangleData0586.coefficient39_46,
    output := OriginalRow227TriangleData0600.coefficient40_46, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_48, Icur := OriginalRow227TriangleData0586.coefficient39_47,
    output := OriginalRow227TriangleData0600.coefficient40_47, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_49, Icur := OriginalRow227TriangleData0586.coefficient39_48,
    output := OriginalRow227TriangleData0600.coefficient40_48, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_50, Icur := OriginalRow227TriangleData0586.coefficient39_49,
    output := OriginalRow227TriangleData0600.coefficient40_49, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_51, Icur := OriginalRow227TriangleData0586.coefficient39_50,
    output := OriginalRow227TriangleData0600.coefficient40_50, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_52, Icur := OriginalRow227TriangleData0586.coefficient39_51,
    output := OriginalRow227TriangleData0600.coefficient40_51, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_53, Icur := OriginalRow227TriangleData0586.coefficient39_52,
    output := OriginalRow227TriangleData0600.coefficient40_52, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_54, Icur := OriginalRow227TriangleData0586.coefficient39_53,
    output := OriginalRow227TriangleData0600.coefficient40_53, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_55, Icur := OriginalRow227TriangleData0586.coefficient39_54,
    output := OriginalRow227TriangleData0600.coefficient40_54, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_56, Icur := OriginalRow227TriangleData0586.coefficient39_55,
    output := OriginalRow227TriangleData0600.coefficient40_55, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_57, Icur := OriginalRow227TriangleData0586.coefficient39_56,
    output := OriginalRow227TriangleData0600.coefficient40_56, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_58, Icur := OriginalRow227TriangleData0586.coefficient39_57,
    output := OriginalRow227TriangleData0600.coefficient40_57, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_59, Icur := OriginalRow227TriangleData0586.coefficient39_58,
    output := OriginalRow227TriangleData0600.coefficient40_58, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_60, Icur := OriginalRow227TriangleData0586.coefficient39_59,
    output := OriginalRow227TriangleData0600.coefficient40_59, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_61, Icur := OriginalRow227TriangleData0586.coefficient39_60,
    output := OriginalRow227TriangleData0600.coefficient40_60, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_62, Icur := OriginalRow227TriangleData0586.coefficient39_61,
    output := OriginalRow227TriangleData0600.coefficient40_61, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_63, Icur := OriginalRow227TriangleData0586.coefficient39_62,
    output := OriginalRow227TriangleData0600.coefficient40_62, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_64, Icur := OriginalRow227TriangleData0586.coefficient39_63,
    output := OriginalRow227TriangleData0600.coefficient40_63, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_65, Icur := OriginalRow227TriangleData0586.coefficient39_64,
    output := OriginalRow227TriangleData0600.coefficient40_64, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_66, Icur := OriginalRow227TriangleData0586.coefficient39_65,
    output := OriginalRow227TriangleData0600.coefficient40_65, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_67, Icur := OriginalRow227TriangleData0586.coefficient39_66,
    output := OriginalRow227TriangleData0600.coefficient40_66, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_68, Icur := OriginalRow227TriangleData0586.coefficient39_67,
    output := OriginalRow227TriangleData0600.coefficient40_67, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0586.coefficient39_69, Icur := OriginalRow227TriangleData0586.coefficient39_68,
    output := OriginalRow227TriangleData0600.coefficient40_68, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0587.coefficient39_70, Icur := OriginalRow227TriangleData0586.coefficient39_69,
    output := OriginalRow227TriangleData0600.coefficient40_69, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0587.coefficient39_71, Icur := OriginalRow227TriangleData0587.coefficient39_70,
    output := OriginalRow227TriangleData0600.coefficient40_70, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0584

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0584.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
