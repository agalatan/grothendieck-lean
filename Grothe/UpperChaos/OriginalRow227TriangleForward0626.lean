import Grothe.UpperChaos.OriginalRow227TriangleData0628
import Grothe.UpperChaos.OriginalRow227TriangleData0629
import Grothe.UpperChaos.OriginalRow227TriangleData0642
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0626
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_43, Icur := OriginalRow227TriangleData0628.coefficient42_42,
    output := OriginalRow227TriangleData0642.coefficient43_42, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_44, Icur := OriginalRow227TriangleData0628.coefficient42_43,
    output := OriginalRow227TriangleData0642.coefficient43_43, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_45, Icur := OriginalRow227TriangleData0628.coefficient42_44,
    output := OriginalRow227TriangleData0642.coefficient43_44, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_46, Icur := OriginalRow227TriangleData0628.coefficient42_45,
    output := OriginalRow227TriangleData0642.coefficient43_45, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_47, Icur := OriginalRow227TriangleData0628.coefficient42_46,
    output := OriginalRow227TriangleData0642.coefficient43_46, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_48, Icur := OriginalRow227TriangleData0628.coefficient42_47,
    output := OriginalRow227TriangleData0642.coefficient43_47, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_49, Icur := OriginalRow227TriangleData0628.coefficient42_48,
    output := OriginalRow227TriangleData0642.coefficient43_48, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_50, Icur := OriginalRow227TriangleData0628.coefficient42_49,
    output := OriginalRow227TriangleData0642.coefficient43_49, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_51, Icur := OriginalRow227TriangleData0628.coefficient42_50,
    output := OriginalRow227TriangleData0642.coefficient43_50, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_52, Icur := OriginalRow227TriangleData0628.coefficient42_51,
    output := OriginalRow227TriangleData0642.coefficient43_51, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_53, Icur := OriginalRow227TriangleData0628.coefficient42_52,
    output := OriginalRow227TriangleData0642.coefficient43_52, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_54, Icur := OriginalRow227TriangleData0628.coefficient42_53,
    output := OriginalRow227TriangleData0642.coefficient43_53, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_55, Icur := OriginalRow227TriangleData0628.coefficient42_54,
    output := OriginalRow227TriangleData0642.coefficient43_54, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_56, Icur := OriginalRow227TriangleData0628.coefficient42_55,
    output := OriginalRow227TriangleData0642.coefficient43_55, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_57, Icur := OriginalRow227TriangleData0628.coefficient42_56,
    output := OriginalRow227TriangleData0642.coefficient43_56, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_58, Icur := OriginalRow227TriangleData0628.coefficient42_57,
    output := OriginalRow227TriangleData0642.coefficient43_57, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_59, Icur := OriginalRow227TriangleData0628.coefficient42_58,
    output := OriginalRow227TriangleData0642.coefficient43_58, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_60, Icur := OriginalRow227TriangleData0628.coefficient42_59,
    output := OriginalRow227TriangleData0642.coefficient43_59, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_61, Icur := OriginalRow227TriangleData0628.coefficient42_60,
    output := OriginalRow227TriangleData0642.coefficient43_60, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_62, Icur := OriginalRow227TriangleData0628.coefficient42_61,
    output := OriginalRow227TriangleData0642.coefficient43_61, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_63, Icur := OriginalRow227TriangleData0628.coefficient42_62,
    output := OriginalRow227TriangleData0642.coefficient43_62, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_64, Icur := OriginalRow227TriangleData0628.coefficient42_63,
    output := OriginalRow227TriangleData0642.coefficient43_63, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_65, Icur := OriginalRow227TriangleData0628.coefficient42_64,
    output := OriginalRow227TriangleData0642.coefficient43_64, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_66, Icur := OriginalRow227TriangleData0628.coefficient42_65,
    output := OriginalRow227TriangleData0642.coefficient43_65, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_67, Icur := OriginalRow227TriangleData0628.coefficient42_66,
    output := OriginalRow227TriangleData0642.coefficient43_66, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_68, Icur := OriginalRow227TriangleData0628.coefficient42_67,
    output := OriginalRow227TriangleData0642.coefficient43_67, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_69, Icur := OriginalRow227TriangleData0628.coefficient42_68,
    output := OriginalRow227TriangleData0642.coefficient43_68, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_70, Icur := OriginalRow227TriangleData0628.coefficient42_69,
    output := OriginalRow227TriangleData0642.coefficient43_69, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_71, Icur := OriginalRow227TriangleData0628.coefficient42_70,
    output := OriginalRow227TriangleData0642.coefficient43_70, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0628.coefficient42_72, Icur := OriginalRow227TriangleData0628.coefficient42_71,
    output := OriginalRow227TriangleData0642.coefficient43_71, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0629.coefficient42_73, Icur := OriginalRow227TriangleData0628.coefficient42_72,
    output := OriginalRow227TriangleData0642.coefficient43_72, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0629.coefficient42_74, Icur := OriginalRow227TriangleData0629.coefficient42_73,
    output := OriginalRow227TriangleData0642.coefficient43_73, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0626

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0626.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
