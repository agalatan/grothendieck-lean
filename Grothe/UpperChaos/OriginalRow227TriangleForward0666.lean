import Grothe.UpperChaos.OriginalRow227TriangleData0669
import Grothe.UpperChaos.OriginalRow227TriangleData0670
import Grothe.UpperChaos.OriginalRow227TriangleData0682
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0666
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_46, Icur := OriginalRow227TriangleData0669.coefficient45_45,
    output := OriginalRow227TriangleData0682.coefficient46_45, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_47, Icur := OriginalRow227TriangleData0669.coefficient45_46,
    output := OriginalRow227TriangleData0682.coefficient46_46, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_48, Icur := OriginalRow227TriangleData0669.coefficient45_47,
    output := OriginalRow227TriangleData0682.coefficient46_47, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_49, Icur := OriginalRow227TriangleData0669.coefficient45_48,
    output := OriginalRow227TriangleData0682.coefficient46_48, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_50, Icur := OriginalRow227TriangleData0669.coefficient45_49,
    output := OriginalRow227TriangleData0682.coefficient46_49, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_51, Icur := OriginalRow227TriangleData0669.coefficient45_50,
    output := OriginalRow227TriangleData0682.coefficient46_50, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_52, Icur := OriginalRow227TriangleData0669.coefficient45_51,
    output := OriginalRow227TriangleData0682.coefficient46_51, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_53, Icur := OriginalRow227TriangleData0669.coefficient45_52,
    output := OriginalRow227TriangleData0682.coefficient46_52, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_54, Icur := OriginalRow227TriangleData0669.coefficient45_53,
    output := OriginalRow227TriangleData0682.coefficient46_53, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_55, Icur := OriginalRow227TriangleData0669.coefficient45_54,
    output := OriginalRow227TriangleData0682.coefficient46_54, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_56, Icur := OriginalRow227TriangleData0669.coefficient45_55,
    output := OriginalRow227TriangleData0682.coefficient46_55, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_57, Icur := OriginalRow227TriangleData0669.coefficient45_56,
    output := OriginalRow227TriangleData0682.coefficient46_56, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_58, Icur := OriginalRow227TriangleData0669.coefficient45_57,
    output := OriginalRow227TriangleData0682.coefficient46_57, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_59, Icur := OriginalRow227TriangleData0669.coefficient45_58,
    output := OriginalRow227TriangleData0682.coefficient46_58, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_60, Icur := OriginalRow227TriangleData0669.coefficient45_59,
    output := OriginalRow227TriangleData0682.coefficient46_59, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_61, Icur := OriginalRow227TriangleData0669.coefficient45_60,
    output := OriginalRow227TriangleData0682.coefficient46_60, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_62, Icur := OriginalRow227TriangleData0669.coefficient45_61,
    output := OriginalRow227TriangleData0682.coefficient46_61, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_63, Icur := OriginalRow227TriangleData0669.coefficient45_62,
    output := OriginalRow227TriangleData0682.coefficient46_62, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_64, Icur := OriginalRow227TriangleData0669.coefficient45_63,
    output := OriginalRow227TriangleData0682.coefficient46_63, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_65, Icur := OriginalRow227TriangleData0669.coefficient45_64,
    output := OriginalRow227TriangleData0682.coefficient46_64, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_66, Icur := OriginalRow227TriangleData0669.coefficient45_65,
    output := OriginalRow227TriangleData0682.coefficient46_65, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_67, Icur := OriginalRow227TriangleData0669.coefficient45_66,
    output := OriginalRow227TriangleData0682.coefficient46_66, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_68, Icur := OriginalRow227TriangleData0669.coefficient45_67,
    output := OriginalRow227TriangleData0682.coefficient46_67, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_69, Icur := OriginalRow227TriangleData0669.coefficient45_68,
    output := OriginalRow227TriangleData0682.coefficient46_68, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_70, Icur := OriginalRow227TriangleData0669.coefficient45_69,
    output := OriginalRow227TriangleData0682.coefficient46_69, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_71, Icur := OriginalRow227TriangleData0669.coefficient45_70,
    output := OriginalRow227TriangleData0682.coefficient46_70, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_72, Icur := OriginalRow227TriangleData0669.coefficient45_71,
    output := OriginalRow227TriangleData0682.coefficient46_71, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_73, Icur := OriginalRow227TriangleData0669.coefficient45_72,
    output := OriginalRow227TriangleData0682.coefficient46_72, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_74, Icur := OriginalRow227TriangleData0669.coefficient45_73,
    output := OriginalRow227TriangleData0682.coefficient46_73, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0669.coefficient45_75, Icur := OriginalRow227TriangleData0669.coefficient45_74,
    output := OriginalRow227TriangleData0682.coefficient46_74, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_76, Icur := OriginalRow227TriangleData0669.coefficient45_75,
    output := OriginalRow227TriangleData0682.coefficient46_75, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0670.coefficient45_77, Icur := OriginalRow227TriangleData0670.coefficient45_76,
    output := OriginalRow227TriangleData0682.coefficient46_76, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0666

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0666.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
