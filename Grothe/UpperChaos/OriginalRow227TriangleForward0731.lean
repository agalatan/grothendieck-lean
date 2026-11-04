import Grothe.UpperChaos.OriginalRow227TriangleData0734
import Grothe.UpperChaos.OriginalRow227TriangleData0735
import Grothe.UpperChaos.OriginalRow227TriangleData0747
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0731
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_51, Icur := OriginalRow227TriangleData0734.coefficient50_50,
    output := OriginalRow227TriangleData0747.coefficient51_50, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_52, Icur := OriginalRow227TriangleData0734.coefficient50_51,
    output := OriginalRow227TriangleData0747.coefficient51_51, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_53, Icur := OriginalRow227TriangleData0734.coefficient50_52,
    output := OriginalRow227TriangleData0747.coefficient51_52, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_54, Icur := OriginalRow227TriangleData0734.coefficient50_53,
    output := OriginalRow227TriangleData0747.coefficient51_53, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_55, Icur := OriginalRow227TriangleData0734.coefficient50_54,
    output := OriginalRow227TriangleData0747.coefficient51_54, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_56, Icur := OriginalRow227TriangleData0734.coefficient50_55,
    output := OriginalRow227TriangleData0747.coefficient51_55, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_57, Icur := OriginalRow227TriangleData0734.coefficient50_56,
    output := OriginalRow227TriangleData0747.coefficient51_56, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_58, Icur := OriginalRow227TriangleData0734.coefficient50_57,
    output := OriginalRow227TriangleData0747.coefficient51_57, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_59, Icur := OriginalRow227TriangleData0734.coefficient50_58,
    output := OriginalRow227TriangleData0747.coefficient51_58, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_60, Icur := OriginalRow227TriangleData0734.coefficient50_59,
    output := OriginalRow227TriangleData0747.coefficient51_59, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_61, Icur := OriginalRow227TriangleData0734.coefficient50_60,
    output := OriginalRow227TriangleData0747.coefficient51_60, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_62, Icur := OriginalRow227TriangleData0734.coefficient50_61,
    output := OriginalRow227TriangleData0747.coefficient51_61, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_63, Icur := OriginalRow227TriangleData0734.coefficient50_62,
    output := OriginalRow227TriangleData0747.coefficient51_62, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_64, Icur := OriginalRow227TriangleData0734.coefficient50_63,
    output := OriginalRow227TriangleData0747.coefficient51_63, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_65, Icur := OriginalRow227TriangleData0734.coefficient50_64,
    output := OriginalRow227TriangleData0747.coefficient51_64, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_66, Icur := OriginalRow227TriangleData0734.coefficient50_65,
    output := OriginalRow227TriangleData0747.coefficient51_65, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_67, Icur := OriginalRow227TriangleData0734.coefficient50_66,
    output := OriginalRow227TriangleData0747.coefficient51_66, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_68, Icur := OriginalRow227TriangleData0734.coefficient50_67,
    output := OriginalRow227TriangleData0747.coefficient51_67, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_69, Icur := OriginalRow227TriangleData0734.coefficient50_68,
    output := OriginalRow227TriangleData0747.coefficient51_68, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_70, Icur := OriginalRow227TriangleData0734.coefficient50_69,
    output := OriginalRow227TriangleData0747.coefficient51_69, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_71, Icur := OriginalRow227TriangleData0734.coefficient50_70,
    output := OriginalRow227TriangleData0747.coefficient51_70, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_72, Icur := OriginalRow227TriangleData0734.coefficient50_71,
    output := OriginalRow227TriangleData0747.coefficient51_71, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_73, Icur := OriginalRow227TriangleData0734.coefficient50_72,
    output := OriginalRow227TriangleData0747.coefficient51_72, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_74, Icur := OriginalRow227TriangleData0734.coefficient50_73,
    output := OriginalRow227TriangleData0747.coefficient51_73, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_75, Icur := OriginalRow227TriangleData0734.coefficient50_74,
    output := OriginalRow227TriangleData0747.coefficient51_74, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_76, Icur := OriginalRow227TriangleData0734.coefficient50_75,
    output := OriginalRow227TriangleData0747.coefficient51_75, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_77, Icur := OriginalRow227TriangleData0734.coefficient50_76,
    output := OriginalRow227TriangleData0747.coefficient51_76, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_78, Icur := OriginalRow227TriangleData0734.coefficient50_77,
    output := OriginalRow227TriangleData0747.coefficient51_77, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_79, Icur := OriginalRow227TriangleData0734.coefficient50_78,
    output := OriginalRow227TriangleData0747.coefficient51_78, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0734.coefficient50_80, Icur := OriginalRow227TriangleData0734.coefficient50_79,
    output := OriginalRow227TriangleData0747.coefficient51_79, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_81, Icur := OriginalRow227TriangleData0734.coefficient50_80,
    output := OriginalRow227TriangleData0747.coefficient51_80, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_82, Icur := OriginalRow227TriangleData0735.coefficient50_81,
    output := OriginalRow227TriangleData0747.coefficient51_81, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0731

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0731.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
