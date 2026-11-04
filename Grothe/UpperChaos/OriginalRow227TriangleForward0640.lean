import Grothe.UpperChaos.OriginalRow227TriangleData0642
import Grothe.UpperChaos.OriginalRow227TriangleData0643
import Grothe.UpperChaos.OriginalRow227TriangleData0656
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0640
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_44, Icur := OriginalRow227TriangleData0642.coefficient43_43,
    output := OriginalRow227TriangleData0656.coefficient44_43, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_45, Icur := OriginalRow227TriangleData0642.coefficient43_44,
    output := OriginalRow227TriangleData0656.coefficient44_44, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_46, Icur := OriginalRow227TriangleData0642.coefficient43_45,
    output := OriginalRow227TriangleData0656.coefficient44_45, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_47, Icur := OriginalRow227TriangleData0642.coefficient43_46,
    output := OriginalRow227TriangleData0656.coefficient44_46, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_48, Icur := OriginalRow227TriangleData0642.coefficient43_47,
    output := OriginalRow227TriangleData0656.coefficient44_47, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_49, Icur := OriginalRow227TriangleData0642.coefficient43_48,
    output := OriginalRow227TriangleData0656.coefficient44_48, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_50, Icur := OriginalRow227TriangleData0642.coefficient43_49,
    output := OriginalRow227TriangleData0656.coefficient44_49, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_51, Icur := OriginalRow227TriangleData0642.coefficient43_50,
    output := OriginalRow227TriangleData0656.coefficient44_50, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_52, Icur := OriginalRow227TriangleData0642.coefficient43_51,
    output := OriginalRow227TriangleData0656.coefficient44_51, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_53, Icur := OriginalRow227TriangleData0642.coefficient43_52,
    output := OriginalRow227TriangleData0656.coefficient44_52, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_54, Icur := OriginalRow227TriangleData0642.coefficient43_53,
    output := OriginalRow227TriangleData0656.coefficient44_53, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_55, Icur := OriginalRow227TriangleData0642.coefficient43_54,
    output := OriginalRow227TriangleData0656.coefficient44_54, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_56, Icur := OriginalRow227TriangleData0642.coefficient43_55,
    output := OriginalRow227TriangleData0656.coefficient44_55, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_57, Icur := OriginalRow227TriangleData0642.coefficient43_56,
    output := OriginalRow227TriangleData0656.coefficient44_56, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_58, Icur := OriginalRow227TriangleData0642.coefficient43_57,
    output := OriginalRow227TriangleData0656.coefficient44_57, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_59, Icur := OriginalRow227TriangleData0642.coefficient43_58,
    output := OriginalRow227TriangleData0656.coefficient44_58, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_60, Icur := OriginalRow227TriangleData0642.coefficient43_59,
    output := OriginalRow227TriangleData0656.coefficient44_59, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_61, Icur := OriginalRow227TriangleData0642.coefficient43_60,
    output := OriginalRow227TriangleData0656.coefficient44_60, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_62, Icur := OriginalRow227TriangleData0642.coefficient43_61,
    output := OriginalRow227TriangleData0656.coefficient44_61, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_63, Icur := OriginalRow227TriangleData0642.coefficient43_62,
    output := OriginalRow227TriangleData0656.coefficient44_62, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_64, Icur := OriginalRow227TriangleData0642.coefficient43_63,
    output := OriginalRow227TriangleData0656.coefficient44_63, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_65, Icur := OriginalRow227TriangleData0642.coefficient43_64,
    output := OriginalRow227TriangleData0656.coefficient44_64, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_66, Icur := OriginalRow227TriangleData0642.coefficient43_65,
    output := OriginalRow227TriangleData0656.coefficient44_65, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_67, Icur := OriginalRow227TriangleData0642.coefficient43_66,
    output := OriginalRow227TriangleData0656.coefficient44_66, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_68, Icur := OriginalRow227TriangleData0642.coefficient43_67,
    output := OriginalRow227TriangleData0656.coefficient44_67, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_69, Icur := OriginalRow227TriangleData0642.coefficient43_68,
    output := OriginalRow227TriangleData0656.coefficient44_68, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_70, Icur := OriginalRow227TriangleData0642.coefficient43_69,
    output := OriginalRow227TriangleData0656.coefficient44_69, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_71, Icur := OriginalRow227TriangleData0642.coefficient43_70,
    output := OriginalRow227TriangleData0656.coefficient44_70, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_72, Icur := OriginalRow227TriangleData0642.coefficient43_71,
    output := OriginalRow227TriangleData0656.coefficient44_71, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0642.coefficient43_73, Icur := OriginalRow227TriangleData0642.coefficient43_72,
    output := OriginalRow227TriangleData0656.coefficient44_72, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0643.coefficient43_74, Icur := OriginalRow227TriangleData0642.coefficient43_73,
    output := OriginalRow227TriangleData0656.coefficient44_73, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0643.coefficient43_75, Icur := OriginalRow227TriangleData0643.coefficient43_74,
    output := OriginalRow227TriangleData0656.coefficient44_74, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0640

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0640.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
